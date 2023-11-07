Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA4BC41535
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web10.5510.1699341174768185348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ZtbyxWgh;
 spf=pass (domain: axis.com, ip: 40.107.7.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6bHDqBWFSeXYf+LgEgqHIl06yiRTjNw5K5V6lE9wkrdm3kqRkfIpPCTeMnH03gavscG7zRcFXpjpdfh8sDhDsiofarUV93G5S9QV6tNb+JzI5gtth2rti7F7v4Oq7yZOim+OYK1Sn2q78SGZ9K5BevZLeQuVIIe0KNrBWgROsPtZbVzOlrOpWOS9v7sUBRZmxZxHDQUbg8prVlLrOIZ8/a9M7dgyC7iOxHyggHU1VzzeRYyijG2mvrVmiS7IKflSEL1a/KztHb/Zd49B7kN2C3ywkaq9RIIm0vyzMAio2ZeEJAMcxTdy/d3DUN/G/Z2rF7flI3RNNHqWgKi2lQlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d+Y6rotKvsKstAjPZk57K6ZVUGZG6/Huhkvm7Ing0E=;
 b=HDOsJW13vgzR7cwuQzR8cllzNMdPLTkVl7zMt+rx4Ifb/4Q0YOd3kZGWhW6yKMmJml8WxP71hMXJ+l12tKZNUNxBPfMk+nbosTyMsWsj6PskdjSjsBP9Pto4eUtGh7z1AR3GgHz79WNdXnW8ahGd1ibI0p6WgYTouiwq6pv0n8SgHyPVXDWzT/s2OgUWE63FnqJmeBHSXL4ob7Z9ErIlyNS/a3pzzFTM0QgSn1h9NYLmi6dxhbLXBCcFW7CyTI3TrYH6oKZILwWD2JedJ+lak63bM/W5CDyl0MKXbcb1FpANe/bZcBrtr1+H4YF64eEfg+yKs8vYWbv06wBhYfJMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d+Y6rotKvsKstAjPZk57K6ZVUGZG6/Huhkvm7Ing0E=;
 b=ZtbyxWghqleSJw1IeplNSh3i6Eqw/RiI7lSL4siiW7nv/p33SblBLQ0OeKY4+J6SWV8V2AXsEB329bo1zytAJXPis+MsXP46ZNEsDURwGuFj/l6Gjwj8XcpG2+W4LUw4pth7fSI4QmI8ZwjLKzHqQF0qMTLd0iUIaiTrxbcnEfY=
Received: from AS9PR06CA0494.eurprd06.prod.outlook.com (2603:10a6:20b:49b::18)
 by AS8PR02MB6533.eurprd02.prod.outlook.com (2603:10a6:20b:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 07:12:51 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::7e) by AS9PR06CA0494.outlook.office365.com
 (2603:10a6:20b:49b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:51 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 03829FBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77Cn1t1519726
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77Cnj21519725
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH 08/16] fluidsynth: Specify the version in the recipe file name
Date: Tue, 7 Nov 2023 08:12:32 +0100
Message-ID: <20231107071240.1519631-8-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR02MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: b46372ca-d35c-46c8-a8e5-08dbdf60f474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CDYd70BFBSC8laKkcYJW6Y8dNza3fRzMoZRXiDNHbDwLUpjS0Tu3f8d+bphtoPzpmosFc/gSuTxi6cjynoVqtyM5Tz0neA/T3sMkfhzfiXrWDwWS7/wLMLL5PlSpH6K4Ga7Ke0BL8fLisiNTsjOl0U/IIw1g5mwhsk42o74pxcGrGWuTjrEtmb7aGVKlQiSvTaesRvDr3mWawihgjEy5ONWmFvt0rM82YrGHvibQp8cgw03fG3cIhmjv2LPJK5rfQSfjP0FXbsXsntYy5zjHj3GZ3n0Hyq4AB84+4utLEGHSAyr+LQxzYxIbvkhhGWG1Yj4R0Qg8Jx3LEZ1NCBPFWpTVbp2Gyzz0stP5miQIuU3S50PiyNNFD3ezPYIhk8SbZV5ixr5/7qp6XZ0o5asLO1k9Wsah+zmcman4fTGIz4YotaAJ3O6EVtG7Sxn9kT+RztTV3NRuFhxr8oCHLIY9a6ktPoD/uuFkl4y3EAlxZcO0iItjie7vxggP6G/8W4rv4b22KpHKKiWwOY/zJCKN6CPrT5iXBVle5WZhyoH3RxNvEKVredXs5YpwEzWljNBR/BsU28x0uAV6EgjvDxGn+iHJ3sab20zJVlJPq1BNejWp3VeJcbLd/F/XBSek5NQr48cpCREE8varEmV3mHFPFlgb98rS5n0OQ6Mmt/9YmGTxcMiCq+39VWRwbMK8OCdmX3BkqvZxL42fu7EkJqifJNVkC1L6R6KxC4MnZNsU0lzP5VTp/EVQldTb3JpJ+9B/KU2czLu2KqjjrmDMjQlcaw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(478600001)(47076005)(36756003)(82740400003)(356005)(81166007)(83380400001)(36860700001)(2616005)(41300700001)(1076003)(6916009)(70586007)(70206006)(6666004)(336012)(426003)(26005)(42186006)(5660300002)(8936002)(316002)(8676002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:51.3885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46372ca-d35c-46c8-a8e5-08dbdf60f474
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6533
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106428

Also unify the SRC_URI.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../{fluidsynth_git.bb =3D> fluidsynth_2.3.4.bb}    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_git.bb =
=3D> fluidsynth_2.3.4.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.b=
b b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
index 26b199943..dc05832e8 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
@@ -4,19 +4,18 @@ SECTION =3D "libs/multimedia"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a959=
4"
=20
-SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3Dmaster;pr=
otocol=3Dhttps"
-SRCREV =3D "5ecdc4568e45123216c6888892caad07918ef127"
-S =3D "${WORKDIR}/git"
-PV =3D "2.3.4"
-
-inherit cmake pkgconfig lib_package
-
 DEPENDS =3D "glib-2.0"
=20
-SRC_URI +=3D " \
+SRC_URI =3D " \
+    git://github.com/FluidSynth/fluidsynth.git;branch=3Dmaster;protocol=3D=
https \
     file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch=
 \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch=
 \
 "
+SRCREV =3D "5ecdc4568e45123216c6888892caad07918ef127"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig lib_package
=20
 EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('baseli=
b').replace('lib', '')}"
=20

