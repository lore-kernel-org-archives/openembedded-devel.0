Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F400C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web10.5508.1699341172494663525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=fR9NuJFF;
 spf=pass (domain: axis.com, ip: 40.107.6.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwkzRkdJvIEwCz+bp1fsLc0xfMkQcJ/vcTIpxC+bUEApkAOm+pzJCPItJGvOWcbMhQ2cxKO8/l2J/58lmMpsEh0Q9tHRuxVAfaElmxADQSey84+Xj52vfHX6B4vNWvYhW6cjuo+oEGnJwWyjnmrGQ86xD55xWilReRrofxTNFfCqaSE/GosiibZ4d0ggQrgd00tX92hRjnMFkOmAYiNCeJMPRIaewiP0KqcHwcY0Q1XrKAlVQm84xAvuf2SRPkce9B1bLjeNutIB8cBgReU9y2gULe4dej61/8licbhjV7pTcCD44FGNTUayTjRb/S49B2DPMwvSnKAe3bpRqRb74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKJDGav4BE2SeijvoeE2yv84o/p9FrE/zNmcXEL0t40=;
 b=mXqiIsIfvRoSkfu9hHQQloRJDBr5r1x8H+VUYjcLBgXc4causc8lr92lCV+fF6VqtYpBaTvFghJz7o1LkAoSBTdB5vKgPX/ef6ntQSVDnOElx5ZRS5cTv/rMgRwHDndJeL4UwwjqVbx8udbuvwSAWlUXpTb51Gg1tkGO/YvQ8BuFdx0lgz9ovlaK0IuukcrItBiVupOb0EnCh8FdZND36p4jbp5299TV0/at0SFrOfI38f/G/1xxKvL/PROi6TsrhFWAFkoyctRWioUImn8f9RqGPP3Nw/RJ7IfsSZHpg5x3SPMkJAkZPEdpA04sQU8AQahbbU2FSsWSoXf+x3rGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKJDGav4BE2SeijvoeE2yv84o/p9FrE/zNmcXEL0t40=;
 b=fR9NuJFFRfF5lBJ9njQGaiGEOuUvjpvw1gHdETEImnwP1QF8IaIAcFtESVmmOVDWpsIPos38n3EcW3inw9OoCNR429rjD/dkqByd4q2DsJI9HBw1qaT0P4DHjRz4wx/KYJw8r01rTil6KL87B5Zi4Gze6SSEzKOjqBVe0ofcpP8=
Received: from AS9PR06CA0505.eurprd06.prod.outlook.com (2603:10a6:20b:49b::31)
 by AS8PR02MB6759.eurprd02.prod.outlook.com (2603:10a6:20b:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 07:12:49 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::c0) by AS9PR06CA0505.outlook.office365.com
 (2603:10a6:20b:49b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:49 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1472A1C96
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CmqB1519699
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:48 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CmUP1519698
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:48 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 02/16] pahole: Correct the version in the recipe file name
Date: Tue, 7 Nov 2023 08:12:26 +0100
Message-ID: <20231107071240.1519631-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR02MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: bcab61cf-1848-4324-a3ab-08dbdf60f34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xmc2gPiHIUhhWxgfnijDp4I9NpVMMHBnzBGNaNuXeqovReKCquRwnK2017lxbKFkWk8t/HbzcxUbwmwhMZ/UBnNqqqcIJTXAI9mmugPnI1VYzHFPUMPowAWJMcN02jGJERcvsyHyuLmK3uuF/n2Ymp1eWsIj5IXXfDQQolwa8LCCDq5+qOfKfeDM3H9J2WsH/ciViidBuYHLmM9JfcLLP+EfIWozHtQ3A0PZDPei7nPrS+LzHgS+iPM8Nmtr0Os3KlUoiwII7pdv8IVOlOhMrWN5hDAhlLaY0qH2n+K5ZZAqOZu3OkUIrbN+qNQrBJil7kZtyX4CBIIGBbXg3v0Q6Exv+KOlGfUOXXiKjh1rNITlFjkhXbBITawIgnq40L5HwVrP88L9NLreQZOZxJ4epZKMiHOvBZhMg9dBao9arNN2dzEAYqUc9uN5snrubN/+LSGXJOR4dPVXYC9drdE6ui9jQ211nbsHkUP49LmHErthCCKkrGlYjwUDXJMQ+NrejYI65p1BaYMj42R6ZH8UZq/sm/HNzNNBVkeWIX3MNsmMXDsHtQ98Iih4M/0wo20kCesLHtID+JWhJyQ1PdDEu2CkCrOX4wrom+k5JH3irUORbdcpZfD1KbtlyLXGT7uXe9zTey9HXsGrXOZsc1cl83b1Xmw70I+jHTm/MdPSNroLT/MEuPUPkq+iUruTXXIHjXAz9iAqiYsSxhHY2QfbIhFBsQmZv0xL334CLQVz1Wsr5jaka5QwHzpSYO01/F9pk1we9EXJwTI+jJxtdAATuw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(8936002)(8676002)(478600001)(6666004)(1076003)(5660300002)(36756003)(42186006)(6916009)(316002)(70586007)(70206006)(2616005)(40480700001)(2906002)(26005)(40460700003)(336012)(426003)(83380400001)(47076005)(36860700001)(41300700001)(82740400003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:49.4354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcab61cf-1848-4324-a3ab-08dbdf60f34a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6759
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106423

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/pahole/{pahole_1.24.bb =3D> pahole_1.25.bb} | 3 ---
 1 file changed, 3 deletions(-)
 rename meta-oe/recipes-devtools/pahole/{pahole_1.24.bb =3D> pahole_1.25.bb=
} (96%)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/recip=
es-devtools/pahole/pahole_1.25.bb
similarity index 96%
rename from meta-oe/recipes-devtools/pahole/pahole_1.24.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.25.bb
index a57053c7c..1334c850e 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.25.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "elfutils zlib libbpf"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_HOST =3D "(x86_64|i.86|aarch64).*-linux"
=20
-PV .=3D "+1.25+git${SRCPV}"
 SRCREV =3D "81558a5a996005df0d607dd33f74ec5b7bdb619d"
 SRC_URI =3D "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=
=3Dmaster \
            file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyt=
h.patch"
@@ -31,5 +30,3 @@ FILES:${PN}-extra =3D "${datadir} ${bindir} ${libdir}/lib=
dwarves_emit.so*"
 RDEPENDS:${PN}-extra +=3D "bash python3-core"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-PV =3D "1.25"

