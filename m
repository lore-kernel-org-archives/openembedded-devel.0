Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491C3C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:56:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.100])
 by mx.groups.io with SMTP id smtpd.web10.46507.1746438999410256605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=Kiq2l8mJ;
 spf=pass (domain: phytec.de, ip: 40.107.21.100, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb8bdw+ni40F6C+CqQlkFs4RdREc7jKrX0ctaGVudME3K4cPOx7s+LTCOUOzNzYhyguYKA79iu5vqH7o2FMkZMl7+kEQLDSPF89vsl+71y3C8T9+odVj8VwEd6dU4JZzgo+kBbayi1ombKlueQRg0cHqzDmR/NZCUIBsNELOjdtWUvLr0hdnCFDi8r+FswOGtxrM2XofcnHGIQY7q/J74re/1J7tf96GsU9OaonrmxlD+LWYy/o+pSO4bX9EwasW7jAgUb1gx6tvuUd/dqlM4Z9SOv/9T+Vz4IKHHKP2OlbBG7wlfoWxrJfOmwVWQNZ0sdcuqHYRcXEjv/sR+OOH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B9jwYOnzPizlGJjjTVBgYiFzo/E1Yq+Ck9bv/K5XLk=;
 b=UJkz8Gy1wOw56uEWCxbNridKBS8Nk7UfdD33AprLH5h1Wfe4Jb+YFK4Z5Bn3eefHRv8KuS3VH3TXDVt14a1u4KIcGw/ECPnsMsnuS2dKQ7UUJVHgPs+fYjgbCUVZgeUGhfLfTGK3iBjj8vu/aw276v5+0xXwRGeuuKakfiDjr1yopBB67MXLezUN/glE5Oyl04FhZ+qBvpNOJjT1IwaFAEQEXkvfQUkbdAMr6djjG91n6ieUG0gjsjqltv292GrPShtn5PrOypWUcPnljBtV8MKSE0w8ujGZorMulTYzT8u5QzCmi09/5s6Yb5yeosidG5dlew/ApD2hbVHYe//Hvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B9jwYOnzPizlGJjjTVBgYiFzo/E1Yq+Ck9bv/K5XLk=;
 b=Kiq2l8mJ1I2WW7f6ai/VTopZgNRoDbHjZexwlmZ/8iTkzSEu5RbnTArSeLeHDzvD2g9vM/ssT2HqiSbb2BpUvmycsXm4bRlrwOh/N/c0rtPSW/wrAHfq5ju4b9obPRncvZxKDjGOzWqYlhGxgL0ARAaZ1xGayepXm5mk9FYmnYHe9SEJPmluVsEUTtz4A4N8RXO467L9tdUziEVv8Fr6nF/YXhojQWLe676HflzcueX2sCiY4SKdiZAdcVfwKDgBGnx1L4UingIjThuru1sUC5AtLcdlQjV1CRUHh4OEpEuLc3wRWzDtVIownmYfxAMRwjGroJuf5pXKlzSw3NTlZA==
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by DU0P195MB1521.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:34d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 09:56:34 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::29) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.28 via Frontend Transport; Mon,
 5 May 2025 09:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 09:56:33 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 5 May
 2025 11:56:32 +0200
Received: from llp-anderweit.fritz.box (172.25.39.133) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 5 May
 2025 11:56:32 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][scarthgap][PATCH] lmsensors: Fix build without sensord
Date: Mon, 5 May 2025 11:56:20 +0200
Message-ID: <20250505095620.14907-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.39.133]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922F:EE_|DU0P195MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: f01ee759-13fb-470e-f15a-08dd8bbb1dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9wvYawZ/TbkELSnN53wM75IEM3OZ/UhZYAmR9nMX6SOBxL/oK1xSPKtVei3d?=
 =?us-ascii?Q?DH3vCay18b1Bw0IKINTK+dqld7qH0zpoWOm8CyOGRCA64YwH407VZIb2WUI5?=
 =?us-ascii?Q?Bk/P7SANITAlcShpqsaMR0wts8/PwnyjUhXrxzgMLdO1aGbHbp2qt4y/ae9F?=
 =?us-ascii?Q?br5UioDP2QbEitcNfNujU6MxAO/joS0drpS7MytxLCi/vn+XCSzgcEesoa0O?=
 =?us-ascii?Q?gQOLmgKnlNEmgJqp+/2d6Vsg9opxDGRpH+hvSXGajjawUwJCzLIhXOmLYfs2?=
 =?us-ascii?Q?n4CuuB/SuD6GdfWbfRwmO6NxN9ZvfYSlTDPhgAsJVXKPgQ0buJwBSdBTGKsO?=
 =?us-ascii?Q?E2q6VlzGtCHzpYRbMabxpgHEax/HkKUYcvRbCrz7840WdNcZAD6MOBnQdypb?=
 =?us-ascii?Q?4r89mMSo3uKI/K0NHNpOQ5FFLfCz6l4itxVLUmaW+HI6i8i6zRAKnw6xLQ/d?=
 =?us-ascii?Q?+ndyJ275FDljHBeiIM2pxYo/8tZ3YZIDOVGtV5HhRRHlwh4BAlxgd5V4N380?=
 =?us-ascii?Q?VxezR7ovEUs7GXSQSlVC9Ot+xWfYEKf3GL97ph2pldFXnLE0z8E5rlonM8hM?=
 =?us-ascii?Q?cTnBMXxpEdfUuzq6sIqCGjfBPQ63zmSSRqMPzx4x2sdBYN/tSc6McmSl0GDH?=
 =?us-ascii?Q?0pdVXuJMM0C/DOP3JetHR2zQrguLOMe94yCiWUffDWocjkW/hSgq/xL5RDmO?=
 =?us-ascii?Q?t9cDdRHfeE384yh8VYqUcrBe1iEboO20FyC7+rGWfTRBsSuqD3aw1Gfy4EU2?=
 =?us-ascii?Q?rAKM14y/sy6D9jeTPC7NNH5XJGCH4Hn8YBq6cXArF2tjSvH3xt+Vr+7G+U4y?=
 =?us-ascii?Q?3W7vyrnnAfp13eiYov6RmLXWb1sb5Iij5jhRIf3Ztdt0xrRZl4QD85oubPOJ?=
 =?us-ascii?Q?KRsakE5Ntag+Qpx+lPlRYsqHysuSTly6rZu8FUmmCjanoA5piG7Y4eDSSdhG?=
 =?us-ascii?Q?gqW028XiPSMnImrDnh8mOhTSTCntyYvLYbY9jkBnIUJVNm/jF2CWvNaFmOZX?=
 =?us-ascii?Q?0Z44F/zJ7itW7IAaZOK7mCymTZc5wSUSYg0qYgVCmD+2rYYKw8oqTfGO5jCl?=
 =?us-ascii?Q?+bxfVUOhU4NsCvuUqmY4fb6CD0yMc3Guzz8elDx0YT3B8N10mgDEq0AMUJ4V?=
 =?us-ascii?Q?EKe6+9km76769OH2/cFGXD7u9VKenzFiaLkjsJxl/KpuddhpMJxz5eyRQj27?=
 =?us-ascii?Q?kpkE2EJCT4ZdirVl89M3lva2EjXKfp4aCIAMSLkP7QRvIFHrH6KJGibB8bn/?=
 =?us-ascii?Q?sj5T4ftNPmZBJt9CtkvfH3t3WdwxFDcWOG+vcJQiW0wZw4cr2oa9550dWLQX?=
 =?us-ascii?Q?Q4IuIaCMva87kP3z/0T7SD5/hC0zzihKywCuKt2CW53lWvP8btGxYWgOuSTm?=
 =?us-ascii?Q?Yl5w9z2RX2UY6vhz9ENdsWkwuoBriELmRVUCmG5OXXZwEVMbVjwNXiexEC4T?=
 =?us-ascii?Q?kLLWE6hHACaJvNOFIpDeK3pObIMsG5mVTIyqAUqHycXSK//zJVoy6th5cFtq?=
 =?us-ascii?Q?yCHmsu+qVc09Pskua8jGDtWwhOERNVapiSNK?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:56:33.4116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01ee759-13fb-470e-f15a-08dd8bbb1dfd
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1521
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 09:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117301

When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
would fail because it tried to build sensord which was skiped in
do_compile.
Error log:
make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'. =
Stop.

Avoid building sensord in do_install by explicitly setting PROG_EXTRA.

(master rev: fc88c96c4e40d9dbc6097c4679ac79ed55356730)

Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
incorrect GCC header dependencies)

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/re=
cipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index e3186132c76c..6e4cf29f479f 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -48,7 +48,8 @@ S =3D "${WORKDIR}/git"
 EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
         LIBDIR=3D${libdir} \
-        CC=3D"${CC}" AR=3D"${AR}"'
+        CC=3D"${CC}" AR=3D"${AR}" \
+        PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"'
=20
 do_configure:prepend() {
     sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
@@ -59,7 +60,7 @@ do_compile() {
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
     sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
                 ${S}/lib/Module.mk
-    oe_runmake user PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"
+    oe_runmake user
 }
=20
 do_install() {
--=20
2.43.0


