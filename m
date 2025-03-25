Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E631C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 17:23:40 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.133])
 by mx.groups.io with SMTP id smtpd.web11.1634.1742923416825909799
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 10:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=R/yD2LjG;
 spf=pass (domain: gomspace.com, ip: 52.101.67.133, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7+z5l5KQPxjo0LGXbCn/4+IPKFlzrUAWXnNsWtbneX1qayaCfcqhey1ik5Oe2ba9S4XgrZPlZdRmwkm3qDaOOPhjgQh64CP19zZjKMdF0jb8JbMWnN2sy5dllD5VksovjOKFPvilRncc3nEa/VffPId+Cd14KjvapjmCf0kg+D8zNAaD8IISn17QslY8mafSMYxi6K654IIBe37IaTGW/Tj2CVqknyJz7mdmftHlWPTvF6LSpaBXlWESFgH7/eVYvDU3CEwPsGKjcmckywDuTm3XIp8vTEBIfoawx99lXKeTO3IKrOI4EekgGSsh2yEK8mpa2K8hma6EcDVMuMBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ1Cf1vqoyiyvUFKcswhp/opSm3g2qFCjy6sI+AgpOM=;
 b=gWfDiAnhvGlkddihQGHvTUgpxFKGtYNrC2ehIcOh7dj8Dzi0HuV1ibueq4nK0ZWnFwvcQ5bBPJRAMW4ckZdIqZUIGfTVgM/ZYVexKn8ErVgkBqfamrOvuk0yrmbLoK4rJB8JV9wlPYGsqMkSRhhCPRo8F4MY7Ialw5GRSsk2XHzcfBuSQ9X0QD96YItcq+UxLaePPji5aNiZ7447iMZsVaVby/5FYHygLbApLSD71RwEVl6noGC6BQvi0JOIlBcHV45JNS/67oR+81qsDaXXbPVOPnrFPrLbktqvzIhgNsUJ5sJg9Pl9J2rAZ6oEmtUungUhbY5t24z2+Rv1YIuj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ1Cf1vqoyiyvUFKcswhp/opSm3g2qFCjy6sI+AgpOM=;
 b=R/yD2LjG7XjZWlf8qNL3MVWWNMa8oCMRNVGILu6o553WpEJvQ6gt7x1H78kjvlmSsrJv7PifQiGpLOe73eEpbBLYHKSvGqgoajBh/gAmRr0jUMMTZwfAZLbBpstxPz6IiJZJ5OgOyyu+PXeCZcsYjYS8LBmfZxvqlqWOhQIPK4o=
Received: from PR3P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::22)
 by AS2PR08MB8669.eurprd08.prod.outlook.com (2603:10a6:20b:55c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:23:33 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:102:56:cafe::35) by PR3P192CA0017.outlook.office365.com
 (2603:10a6:102:56::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.40 via Frontend Transport; Tue,
 25 Mar 2025 17:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 17:23:32 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 25 Mar 2025 18:23:32 +0100
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 25 Mar 2025 18:23:32 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] iperf3: upgrade 3.17.1 -> 3.18
Date: Tue, 25 Mar 2025 18:23:06 +0100
Message-ID: <20250325172306.178648-1-mns@gomspace.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|AS2PR08MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 833c92d4-bedc-4567-3426-08dd6bc1c4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CYSTH5WcTx+yDfDr/KQTq8oHaS/cu4F2HyyAHyYg4VTtyw6uYV/VoDd+TXyN?=
 =?us-ascii?Q?4gfUFI16rHy0GOxZrf7C6XnYl5XwZSH8JO73Ry3YhZbChcl2iijN7w9eENh+?=
 =?us-ascii?Q?M1sNDEGasK09gYD/Ipy43KjvBOmmDrMu5PX+82NAokFeMUNXrVR1x4WD7aMh?=
 =?us-ascii?Q?hHOPuBHDNa3nxwock6O3yKwkpP8f1IDbJfCwsdwIpJipB/LXLmnsoPQkb4ld?=
 =?us-ascii?Q?wKKw1GA7fX84qIcuL1leJZZGMHlUAvB2+dS9eWalnSfsWUQCz0zGBywztjeG?=
 =?us-ascii?Q?upjMTPV1SjmSBvbCAG75ABifkGVJw/XhBVOyy27qu5k11SSse1ZXmQPB5JOF?=
 =?us-ascii?Q?XoctbIB+N40/LjTNktg+frnm7+ILGBMfpnlS7KZb77UE7sN0pRl6bZOE1hwy?=
 =?us-ascii?Q?ao2twpUFPUCGaEuRjGia5aHKvWZVHJ/DJ9p8AwyjGNgxFB8LPkC07RSzCiVZ?=
 =?us-ascii?Q?H/hfL+2KZVazQDWnQSdN2C9N16fkzx5PTFrvsoHXqdjTFczOKW9PYeQesJ36?=
 =?us-ascii?Q?dJ2Ud8DQSj6EPSfkohps8jgFxmvNAejWKkgb2GvpCY1szFVJWeXv4CBC9RCO?=
 =?us-ascii?Q?oKS7qHE8Yg3Dlw2FanMJ9NT2P+W6GSgYFF1jJczfieeyKmJi5leAZcexwA2i?=
 =?us-ascii?Q?bx/E+5WFV3FxqgYQjKJKU1UlJ7mNVzQRQUmyXc2S+ZFr/j0Qza2HyvRG2xD7?=
 =?us-ascii?Q?3cLif+xUqs1frRBeSf9sjwYK3PISTOF1R3e+Ur++F7QUvzMMLq7SZ5nSmSad?=
 =?us-ascii?Q?isSU94sPCYvO0vvP/I0QvZkD2Rd8VEBJbI6B5WkwuP90JQLaxYPuFFyYWnao?=
 =?us-ascii?Q?8CgOKqU4A0z5Ct1XegU0x3uqSZ0ktBrRipTUvZyL+DXPr9W9YU86OGa1J2oH?=
 =?us-ascii?Q?Ez7RNvWwqZuYqJfc80XaFF/UIu2LcaY+uzxuOZhp5QQIq2Y/R/CcZIN+MilG?=
 =?us-ascii?Q?K7tY6dvRNeHWnlWZoTC5rw1IZ+Q71OGnnmiqBsGQVLPtrUq0IHKXp3pnYsh6?=
 =?us-ascii?Q?aVNO452wAGyZBz9bxOUIFnAIZpNjwt1uOT/QCmymWtva9N2mE2Ir9u1ykFcV?=
 =?us-ascii?Q?z86dCZOoGqZ//4FjoS7A4tdkWQ0A9eftzBbHq5CMhUUmGKHXoNXSPWTjCG6b?=
 =?us-ascii?Q?psjtwZhJ3UCM5yXoE61nkykqekweB+B5zVbI60XFABQr3Yd7k4eg5v1cm7bj?=
 =?us-ascii?Q?d65TOO7thZjaYfeeyT5zmGINQ+z0VK5miTkj9zq1rny2aZZw1ClipEYHBJH0?=
 =?us-ascii?Q?paXAurmDE2ySACa7t5Qtv/zYMwNSmw4DxR4kXm1StJRwhPVT5R4Mc/PiCpmJ?=
 =?us-ascii?Q?iH74Rjud6sBkMQfco6e8S6BR3ppnf6Jmy6cirG1H1OZ+oH6vRXG+FCn/G06e?=
 =?us-ascii?Q?70swSRQi1C6s+ubdS3Z9lMQpQgOls6wNPytMwP9QP+NLaFqv8z010FRxd1zB?=
 =?us-ascii?Q?/S2gWU5dALYvG3eVVD9IkXiy5C/rnS8dY8ms6zDk67mYOlbru05scC7eOPZS?=
 =?us-ascii?Q?H9tr0q0tcqus1wY=3D?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:23:32.9866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 833c92d4-bedc-4567-3426-08dd6bc1c4c1
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8669
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 17:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116281

drop backported patch

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 ...-not-listen-to-old-udp-prot-listener.patch | 30 -------------------
 .../{iperf3_3.17.1.bb =3D> iperf3_3.18.bb}      |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-t=
o-old-udp-prot-listener.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.17.1.bb =3D> iperf3_3.18=
.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-u=
dp-prot-listener.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-lis=
ten-to-old-udp-prot-listener.patch
deleted file mode 100644
index da1664ddcf..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot=
-listener.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ac6b9f7fd335ddebc5212eed40083ef4cd3cb86d Mon Sep 17 00:00:00 2001
-From: David Bar-On <david.cdb004@gmail.com>
-Date: Sun, 2 Jun 2024 11:52:03 +0300
-Subject: [PATCH] Do not listen to old pro_listener
-
-Clear old UDP prot_listener from read_set, as currently the server's selec=
t()
-always return when data (that is relevant only to the worker thread) is
-received. This makes the main thread consume a lot of unnecessary CPU, whi=
ch
-reduces the total throughput - especially when only one stream is used.
-
-In my single machine environment, with the this fix the throughput is
-increased by about 40% for one stream test.
----
-Upstream-Status: Backport [3.18]
-
- src/iperf_udp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/iperf_udp.c b/src/iperf_udp.c
-index a603236df..40f2b1ca7 100644
---- a/src/iperf_udp.c
-+++ b/src/iperf_udp.c
-@@ -446,6 +446,7 @@ iperf_udp_accept(struct iperf_test *test)
-     /*
-      * Create a new "listening" socket to replace the one we were using b=
efore.
-      */
-+    FD_CLR(test->prot_listener, &test->read_set); // No control messages =
from old listener
-     test->prot_listener =3D netannounce(test->settings->domain, Pudp, tes=
t->bind_address, test->bind_dev, test->server_port);
-     if (test->prot_listener < 0) {
-         i_errno =3D IESTREAMLISTEN;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.18.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index c84ce5e630..77b441e506 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9873a72f714=
e240530e759e103ac7b2"
 SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3Dmaster;protocol=3Dh=
ttps \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
-           file://do-not-listen-to-old-udp-prot-listener.patch \
            file://0001-fix-build-with-gcc-15.patch \
            "
=20
-SRCREV =3D "2acfcfe94e928e74542c9f107e02aa6dd4748a79"
+SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.2


