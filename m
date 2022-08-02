Return-Path: <julian.haller@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB237C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 06:26:30 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.130])
 by mx.groups.io with SMTP id smtpd.web09.3228.1659421581968073948
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 23:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=QiiOLJmw;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.0.130,
 mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPwohn7yZ8ER4kF9embqIpHRMefkKtfrzb9nt/JnJAI8A7ko/CyYf0pTn1AjIGZ+jl7eyuyCIAH8iZYJSLJr1HzxsKj7yjHzb4tkqA45aE3/Fanq8rWYB+w+zEx52jupwbSXfE912vFWYexuo/qHtbeP5XL69E9aDE7Xh9OGNI1zjj9Vyi8ke+bk88orsOXQwztiUCp0cKJLtRB2N9iVL5FxdxlX2V/dw5COuiOeoUv1ER9tLIHwAmjBlVOHZiOk/KjuGKF9vqSf33SCGZsAqC7Q6isN9PgXPQB7P4gJgV6bst6JaeZZ1g4S6ZJK88cNTOIUjJ+fHL4iL0UnDdSehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMetUiG+nt+Mo8fLLXGlInEsZ6isnKVWuco0ePRK47E=;
 b=Z5EvJ6P18r3YBdLEdhl3xTiGfN+Mg9qlR3bafpSRb7HnMZwxZCiVS4/YosGweyMKILrhUr4QBGTy+9AGUFVtbXAEz56v0TtWD0xm6XxXgaiEc7vjpaiyr2EMwIyfjRUIlROjkXXswOMLhVmQm2E3xZc/kuoics8Kv2olO61J1dRdNYxPaMQxQ5A7KBYH7/M44PurTbyVB48zN+aO9xmyplsSqaeJqNRuXmsaza33I/ajqWIkAAllqWZ/ds0lVv5/Sz9e7Ss1sjn9Y4XMHOviR3iy18xCBk/Ah7Un/SkEwvU52NsXpI7zKgqkl2AC8MAn5pl6yD9Zwzx5lVSqwpYk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=bbl.ms.philips.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMetUiG+nt+Mo8fLLXGlInEsZ6isnKVWuco0ePRK47E=;
 b=QiiOLJmwbahLVbTzTq0/iDJeBjp1AAlbXxsnOa7D/TqOfbLRKVLQINYUqOvcDqZqgSGG0h2BK55CI4dMScNdORmAVsohAckQi9VO+e8EP6bUYg9aDZhcuXr4Sq2XEDe070AcQtGmPsORJxE11psMFHHL0lkCVMt8odu9QTkxH74=
Received: from OS6P279CA0059.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:31::16)
 by VI1P122MB0111.EURP122.PROD.OUTLOOK.COM (2603:10a6:802:6e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 06:26:18 +0000
Received: from HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:31:cafe::1c) by OS6P279CA0059.outlook.office365.com
 (2603:10a6:e10:31::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Tue, 2 Aug 2022 06:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bbl.ms.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 HE1EUR01FT034.mail.protection.outlook.com (10.152.0.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 06:26:17 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id Ij65o5fEUl9ZiIlM9odH7Z; Tue, 02 Aug 2022 08:26:17 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id IlM9oPXLKbpSaIlM9onDIf; Tue, 02 Aug 2022 08:26:17 +0200
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com
 [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 624F9183496;
	Tue,  2 Aug 2022 08:26:17 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 5E1F22A15AE; Tue,  2 Aug 2022 08:26:17 +0200 (CEST)
From: Julian Haller <julian.haller@bbl.ms.philips.com>
To: openembedded-devel@lists.openembedded.org
CC: julian.haller@philips.com
Subject: [meta-oe][PATCH 1/2] pcsc-lite: upgrade 1.9.0 -> 1.9.8
Date: Tue,  2 Aug 2022 08:25:48 +0200
Message-ID: <20220802062549.2984568-1-julian.haller@bbl.ms.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42780a7c-43b9-4f4c-8275-08da744fe879
X-MS-TrafficTypeDiagnostic: VI1P122MB0111:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WQH/kGPttgDmu20EW7r++QfypF64MPC6a5Nw7zqOJkJxuZ97mgyby117BRafLehHzUtJEbIyFU7G/JowPSJZw6iUPDC8LBZks3ekshqJuGq0ieajegsdCcOaHTGexlACX0ED4iomMlAEXNA9B1Hcl3Poe38sYbYDhX8kw4I6ihzLnS5g5UrheHDjHUva7bj3PlEqdge1/6I8xdkoFIoNtFbpGRkCiDwzeXSwD//3hWhD98VpE17vMvOLfQHGr+wg2POHl5ySJ0nQyI4N3ish4a1y3bRQIopUco2jnU17oRdn9W0H/RhfQRoBjhVfSbQnd5HSolpA4hSIHaRs6ouSxgUaE4a6rQDGMZ+15VP6AvmNXwB9f16v3fO7zzHjiuhSIScbiMYVKwbQ36mU/DPjh+UFthIhGfr5p7L/H7MgZL+wNBCGaS2xp6aprfW6GOCNYQa0L9/F8HAy30BmkWvFl1cO2SwuPPJj9ZPsnb8PZbI0SwB6wQQ8KaeXbEV3jo+y1bjfn/MFpS05+broI2efSm2c95qn2C7/zP6GICt+3l0KRoVPsAraRDIKeH0K/E5D1RRgsLv0U3pqoHgbHuga/inwASVNZmJpkkAgw7EAm4j0XiqNpQCzctyHQmDZ01X72FsNgb2cWSEDTZfaRzwh4HTaTivFxXnV4+VRMxnFQM1pw8FqdaCAPUXLBIpG/KZKa12DxOYy7Lu7dWeeeLKPNAmByZBtna3N2XT+WPP+3M/h904FyiB2IPX0o1odDpxyRniE+0KP9KxN7/ZtE2nLbKBuP7BlCFIVfQ1o02cePFitFNCb0l7xWBsZflYhmAMAbxbaBT+dCvG6cC/PewypUw==
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(40470700004)(6916009)(47076005)(2906002)(8676002)(40480700001)(82960400001)(356005)(7596003)(7636003)(44832011)(5660300002)(70586007)(4326008)(70206006)(36860700001)(82310400005)(107886003)(82740400003)(120186005)(26005)(316002)(478600001)(6266002)(42186006)(6666004)(8936002)(40460700003)(41300700001)(966005)(186003)(1076003)(336012)(2616005)(83380400001)(426003);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 06:26:17.6924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42780a7c-43b9-4f4c-8275-08da744fe879
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P122MB0111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 06:26:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98077

From: Julian Haller <julian.haller@philips.com>

The python3 related patch is no longer due to similar changes in the
project. This also requires changing the RDEPENDS to python3-core to
avoid package QA warnings.

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 .../0001-pcsc-spy-use-python3-only.patch      | 43 -------------------
 ...{pcsc-lite_1.9.0.bb =3D> pcsc-lite_1.9.8.bb} | 12 +++---
 2 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-s=
py-use-python3-only.patch
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.9.0.bb =3D> pcsc-lit=
e_1.9.8.bb} (85%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-=
python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-=
spy-use-python3-only.patch
deleted file mode 100644
index 3e7b0adda6..0000000000
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3=
-only.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
-From: Andrey Zhizhikin <andrey.z@gmail.com>
-Date: Mon, 27 Jan 2020 13:27:12 +0000
-Subject: [PATCH] pcsc-spy: use python3 only
-
-Python2 has been EOL and most distributions would not provide any
-support for it anymore. Since Python3 is available in all distributions
-now, switch pcsc-spy to use it exclusively.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
----
- src/spy/pcsc-spy | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
-index 85222c6..965138e 100755
---- a/src/spy/pcsc-spy
-+++ b/src/spy/pcsc-spy
-@@ -1,4 +1,4 @@
--#! /usr/bin/python
-+#!/usr/bin/env python3
-=20
- """
- #    Display PC/SC functions arguments
-@@ -22,12 +22,7 @@ from __future__ import print_function
- import os
- import signal
- import time
--try:
--    # for Python3
--    from queue import Queue
--except ImportError:
--    # for Python2
--    from Queue import Queue
-+from queue import Queue
- from threading import Thread
- from operator import attrgetter
-=20
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb b/meta-oe=
/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
similarity index 85%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
index 9ae091a09a..64c9c2a9da 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
@@ -9,13 +9,11 @@ LICENSE:${PN}-dbg =3D "BSD-3-Clause & GPL-3.0-or-later"
 LICENSE:${PN}-spy =3D "GPL-3.0-or-later"
 LICENSE:${PN}-spy-dev =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D628c01ba985ecfa21677f5ee2d5202f=
6"
+DEPENDS =3D "autoconf-archive-native"
=20
-SRC_URI =3D "\
-	https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
-	file://0001-pcsc-spy-use-python3-only.patch \
-"
-SRC_URI[md5sum] =3D "eb595f2d398ff229207a6ec09fbc4e98"
-SRC_URI[sha256sum] =3D "0148d403137124552c5d0f10f8cdab2cbb8dfc7c6ce75e018f=
af667be34f2ef9"
+SRC_URI =3D "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
+SRC_URI[md5sum] =3D "d063c6ca17c17fab39a85132811e155d"
+SRC_URI[sha256sum] =3D "502d80c557ecbee285eb99fe8703eeb667bcfe067577467b50=
efe3420d1b2289"
=20
 inherit autotools systemd pkgconfig perlnative
=20
@@ -54,6 +52,6 @@ RPROVIDES:${PN} +=3D "${PN}-systemd"
 RREPLACES:${PN} +=3D "${PN}-systemd"
 RCONFLICTS:${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE:${PN} =3D "pcscd.socket"
-RDEPENDS:${PN}-spy +=3D"python3"
+RDEPENDS:${PN}-spy +=3D "python3-core"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.25.1


