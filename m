Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD823C4708E
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.88])
 by mx.groups.io with SMTP id smtpd.web11.5144.1699341174412014648
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Tx7iDYEU;
 spf=pass (domain: axis.com, ip: 40.107.247.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9tkUCqXHQgCk8ulLpSUe44aF29HhvCpItYuPwI8HgQh0QDNmwsn+9093/vggxfdbBEX/HhV7R8L+nx7QAtw1TAGgQ/B0PW/5rQOE2m2RWCpdIxKrrJisV6bQVcoIZGiLhIMyEEyRsvuS0U6lUVTuJs7jiUouoNJnjhkeweolChwd0D4BRlV6iq3gGszkIpqtlqkhGHj+wvbvZYLPPOJHbDTvZ4h/Gx0A3xu8H1DSDDZZjngjqbbA88m4yLNc7us5mloWrjC3kAusdBGT19C8nUy2ADnpu83DrPScyNS8b///GbZo8k8xcmDinXH9ze8JZX7OwWZY53ku3UWb7NT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT/NMq88kD8A6pzPP5V7M+qBaUzLJYO1YCSeSnK9GjA=;
 b=LndTorjjb05MbV+db0bptZh0oYot46yeoMR14BrEtH0ggLMjR1ALTraO7CpeIFiesi6HRYX5+vQ8jDPp+KL4ghx3JVUA8dYKj6cyWvy87pC3NV2DwWKwhOfEk53a4uc4xxi9gIFGXhiBiEZ6S70pm6D/MI8Ox+9qPzKu/vmX2R5yM7HmGuwgUPvxynsenW66FEEYyj8QlwzBLU73hJOO/Ml8yjoHvhP8WtdF5bMLQ9USZTFF3P2vB6Ps+zzmFYXrva2ohPuaxStSNNmGwX+N3JW76BK9fhBwjvAOhhohvbQZETK/EOz0gdHPCX8DzgUXTcTbj9IItnooqVhVsNlYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT/NMq88kD8A6pzPP5V7M+qBaUzLJYO1YCSeSnK9GjA=;
 b=Tx7iDYEUM/bJ3Vd9pK37NCDOow7yNkg3aW9Fj0wsGn5QSbKSmM+lNRnsudwVaMrkmJ0DGonKorPt+2Ketv99cG0uvMTrMiU/CIFu6tMo79KhqIrFcYa2eyWUk8nGgbiYrSADq3wNujrirXRpeZQ7hkAKwVwwRPS4DjEZnYisylw=
Received: from AS9PR06CA0500.eurprd06.prod.outlook.com (2603:10a6:20b:49b::25)
 by AS8PR02MB8688.eurprd02.prod.outlook.com (2603:10a6:20b:561::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 07:12:51 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::2c) by AS9PR06CA0500.outlook.office365.com
 (2603:10a6:20b:49b::25) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:50 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id ACC57FBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77Cnth1519718
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77Cn7m1519717
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 06/16] libtorrent: Add UPSTREAM_CHECK_GITTAGREGEX
Date: Tue, 7 Nov 2023 08:12:30 +0100
Message-ID: <20231107071240.1519631-6-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR02MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe1a79a-c4de-4ca1-70aa-08dbdf60f43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a4D905OVVd8kh6EfCVW1FzAzkH6BjPoRu6HAHS6GDYpeqSsi0jM+qiA7wx0dtUKJwJzRp6GZF/p2wiF8lhif4wOeXItHxBcT7jiDhidDu1t6WnZ7Jum6kFaSqlaqd3/A44mZfwnKTOa44YQfK8Omder+7BUGgRPpeXhR3EtGV97Qgx+LqZTdk7+xvncYUDcJSsyj9nX5BVZpV35LXDiMy5XuaoPMGO7kIdz2Q9CZ1h2tsRK8YwVyttUuPgsyMQTBSY2lTIM1Y76E81/LCddFbn+GUmngVN2Pvu7htguXcnFRuc3BIJtH83oQXsiNRFsLbg/bTVu63P4UoMiOG5vr4GvHIRULtlwQGZ29+ogsDvhNrmJGV7O8aHyumev4SjaZcGuUyOByXlcZ0bpFUaXMalVllJY03Gu8DLGSq/zjRIMqQK2P05iUuL34AhimIQNnhU0FxK9P7Mrki9MBCK83BPBb5h7yC+tCFZKqKWrnMyb0CbCmVZdniBDrZUd0d4vzLczGyNBzXteBGrKuildmSB3lBljLJ9IgFnjxf9aqOEzOxEqI01JzNSxsR838CQVkJbmKhcRNe7hM/RgyYLt+97x4JXpC7lZYFHKgDgLbMrmlucoJ5NPi8nK6f79rpuzqp4YsaqRzEuPHnW/Kg5mkojATKewEqzq+1ZRXQy/6SE1y+NXioxYikCtySwu7mEEjNtj802qwW5wrNlc3mvz1Z4fugL3j4KvFlJu+7Hh1cC5os0iCM39Qs854VHREcB81xQ+/UZkLUbjzT5khWXQVhA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(6666004)(2616005)(478600001)(36860700001)(36756003)(81166007)(82740400003)(70586007)(356005)(70206006)(41300700001)(83380400001)(42186006)(5660300002)(47076005)(1076003)(26005)(8936002)(426003)(336012)(2906002)(8676002)(316002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:50.9979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe1a79a-c4de-4ca1-70aa-08dbdf60f43b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8688
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106426

This makes sure only tags like "vX.Y.Z" are identified as releases.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/me=
ta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index fec05571d..c235547fe 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -6,16 +6,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f696=
5873eca0259a17f833"
=20
 DEPENDS =3D "zlib libsigc++-2.0 openssl cppunit"
=20
+PV =3D "0.13.8+git"
+
 SRC_URI =3D "git://github.com/rakshasa/libtorrent;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "e60f222241319aaae482789517ad00ae9344bd13"
=20
-CVE_STATUS[CVE-2009-1760] =3D "backported-patch: patched in our product"
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-PV =3D "0.13.8+git${SRCPV}"
+CVE_STATUS[CVE-2009-1760] =3D "backported-patch: patched in our product"
=20
 S =3D "${WORKDIR}/git"
=20
-
 PACKAGECONFIG ??=3D "instrumentation aligned"
=20
 PACKAGECONFIG:remove:mipsarch =3D "instrumentation"

