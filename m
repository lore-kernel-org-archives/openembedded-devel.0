Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF39BD462AD
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:25:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.12905.1731507928068698260
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=XrVwEd4u;
 spf=pass (domain: axis.com, ip: 40.107.21.88, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plRyHhXcANxtejJsUkOnkNzKxDo9jMuN69hB01gEN1t0Hani6z5rAbODic4vJNogbqBodkNmv8rcIYX7Qw20sisTWYGMdgfYpmgvJlKtPqRCfljx1f83B0JtKDAKlrq7Xn/OZ90MAl7s9mON3CBhguMJH3W5hThKX1AwI9K2mDpJKOSRY4O69xnX6RhhVtwA6xUKkLSEYfzzGBl/XeJcWgwcryssRjsYGXk9US08KJtvoxQRo9yRZ9XPGcWhmh2MYAL0SATTnCiOodn7Em0C//eGOLM8ltK8wqXqDaQUIu6i31qXjKFIoQEGcIDrI1pG3+i4xP7cSwWpSeyPG31POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+Mh/lBHwHe8hDp/D3IOP0M2wO0L0Z7i5J0cMhfjQEo=;
 b=nKob09dGniuJ5CgjeSbOMdC68qYGe8pwNETCfzDwxdrNXmAQR+GAm4UGDuX1ppirClOTFKaGPul3TgR8V3ZaoFAqvSWXPFAC3nQ5m5j5SyF2b1MwnSRqI4PwBiEAHuBNd7c5oFbuUaQMGC6htO1dkGptbwqmanMxdVgigQ6BOTVbh/imdUCLHsqY3aJyMHrALdoPBH4UUeK1PZzPPljDwx54JuOx5U+DNb0pGe0ovhnChS7kSQEbvjV2ZYDk3nM1YVjs3nOPfqKysUM8uCHGP1GfT36bWZKjM7x+BB9hX+C20M6483GBHxa5pPHRzqka0JTuNCVziJVSBA8YDEXSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+Mh/lBHwHe8hDp/D3IOP0M2wO0L0Z7i5J0cMhfjQEo=;
 b=XrVwEd4uANE48YdeX1GQCwfLYWwD8s+vB/ZG4MOUd+KlxD36MTjrdEPo2y/TvCBWIJgSyR12zyJ3SR6mPMfz6P7cbdhWg1j75r2O2DWZ5hLnTQlaOHlo0rVWaJlGbu99KF3xNmfXv/e+/IvSjR42NVLmZfVf2dwYLRADQ1+1hC4=
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by DBBPR02MB10751.eurprd02.prod.outlook.com (2603:10a6:10:53a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Wed, 13 Nov
 2024 14:25:23 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::5d) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Wed, 13 Nov 2024 14:25:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:25:22 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:25:22 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:25:22 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 81DEB790
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 15:25:22 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] librelp: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:25:21 +0100
Message-ID: <20241113142522.3113838-2-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113142522.3113838-1-olani@axis.com>
References: <20241113142522.3113838-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70F:EE_|DBBPR02MB10751:EE_
X-MS-Office365-Filtering-Correlation-Id: 47647039-928f-45a3-5312-08dd03ef0270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Cs6W4BuENU+7zVBOpWuXKD8mQ1Au5DbEPw1tVK+AOg++Z7t/jec2IakZvght?=
 =?us-ascii?Q?8eCdOJtCQFfvicgrNooYaSiB5xG10flYQ4ue3gRTHOn3l0yUQLZTqB5odFKi?=
 =?us-ascii?Q?MbeYdI+EMIwIcXPXEW9QSVezTvTJScB72byHZhiWXzsZG7Bb+UvyNHYcH6Ns?=
 =?us-ascii?Q?H5V+m6Z2owaGRgbla72xS1GlR5zYITirh8oL/03h1UKMIOePA4UNUYZPL+ld?=
 =?us-ascii?Q?WGnJ7FTP47gRQo3rXrxh9SCiRowd3JPigt35axGrZQtzs/vihViFS20ti35q?=
 =?us-ascii?Q?m043d+4h91OFbyREXZvOml3yk5J/B/Bng6daTungaootw/itOxcIzUKer/1E?=
 =?us-ascii?Q?DJ/n+psycDjZ/CQy76LctJqbjb9CSXvdwL2fAL9GdM79tHdayDG2M8qQy23C?=
 =?us-ascii?Q?cCq+glgRlkwLDOOSlEthBzzL89RWChl6nN7Q1XohN44XUAYr7AlneoClusnD?=
 =?us-ascii?Q?ri3wKEdrf5op+lwV2Cw29QNTMa1WGMeXWp1B7ZomCQODn0a+0pS1tCu06DRh?=
 =?us-ascii?Q?YEnOogqJZTcsGRHKL1HTF+tv3zsi4xuu355bnneD2V6kICoJtsBMlPcYIT7p?=
 =?us-ascii?Q?NSNFmCVYvklXeeJT/SYOFPlT53uz6o5wHxSGm+Si6ne9nnh3l2ABLKcNlWjh?=
 =?us-ascii?Q?oLrdfcezBRwcUeUJShXlJS7MfOdX47qqNB4/l5B33HSks1ElCnWifd6Yc67N?=
 =?us-ascii?Q?1UCKQ8IgmizikHkFKqV6XIo8l0lIbNRWG0npG951ZU4R4uHVwyjs4lokir5F?=
 =?us-ascii?Q?3URr7MtsVVbmwkkr5qXrScTItNBnGGZzu8Gm1TEIg2ffmtryHCV2OHsKPrpH?=
 =?us-ascii?Q?wlHGIg+JJV2aZSp28hzDjM+CFDkYG9B1kB+AZiY6jeSEwcowOaIscj0MfFIG?=
 =?us-ascii?Q?VyRdHbr2jxKBz9+3Vw+S1guyWgLRtvrHVRDhc0SP5Jpm531s8IuEpbb9luIc?=
 =?us-ascii?Q?zKwMKp3ov2ma+l+WttQ30ViykuMjHJ2IWhS5V91txoE79ikdAEwGYICLQ4v1?=
 =?us-ascii?Q?sAtc9oibGu5Q75RqNGuzxDb8zotAG4ZcohWwdr/p9dbTUEkdRXh+6VbVVZ8R?=
 =?us-ascii?Q?up7PAKIGCUvgft/hYWs+NdaHBm5m4wfv+WmbKgdpieONp9l4ppd6lFTBLmqn?=
 =?us-ascii?Q?Hq3+6efhv0u0d/Lt2YJSiZn/JVsaCg8VGpi1OdJKHjwZYv9ccSpc2MxyH0pC?=
 =?us-ascii?Q?PQ3DgJeyjnt3sZ+xldIGLarwz+qlYiHkY+oUHvCqowptRb8+eFCTiEeB7OkS?=
 =?us-ascii?Q?cJd6h4VC7B25xDNAZh+t4Cjzp6aYfVwUzUcpxSM38RT36xI/zJN4KivceUOU?=
 =?us-ascii?Q?vAVWrFggL1+18I2leyFEwTOWfC98AjCsrnGGxpbq3+H8xwxh+Bw1ZSnJrWQO?=
 =?us-ascii?Q?xC3FdOl1F2Fw7SuAdFpyFldVBPoNt1hBkZkSQFEdPD+my5sSJw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:25:22.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47647039-928f-45a3-5312-08dd03ef0270
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10751
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113810

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/${TESTDIR}/Makefile that
transforms
 SH_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/test-driver
to
 SH_LOG_DRIVER =3D $(SHELL) $(top_builddir)/test-driver
which is where the test-driver script can be found when installed.

The addition of this substition makes ptests work with or without an
automake patch in OE-Core that does the same thing.

Relates to [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 .../recipes-extended/rsyslog/librelp_1.11.0.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/r=
ecipes-extended/rsyslog/librelp_1.11.0.bb
index 49847047a..65b5c8476 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -59,14 +59,16 @@ do_install_ptest() {
     # some tests need to write to this directory
     chmod 777 -R ${D}${PTEST_PATH}/${TESTDIR}
=20
-    # do NOT need to rebuild Makefile or $(check_PROGRAMS)
-    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makef=
ile
-    sed -i 's/^check-TESTS:.*$/check-TESTS:/' ${D}${PTEST_PATH}/${TESTDIR}=
/Makefile
-
-    # fix the srcdir, top_srcdir, abs_top_builddir
-    sed -i 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${PTEST_=
PATH}/${TESTDIR}/Makefile
-    sed -i 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${PT=
EST_PATH}/${TESTDIR}/Makefile
-    sed -i 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' ${D}${PTEST_=
PATH}/${TESTDIR}/Makefile
+	sed -e '# do NOT need to rebuild Makefile or $(check_PROGRAMS)' \
+		-e 's/^Makefile:.*$/Makefile:/' \
+		-e 's/^check-TESTS:.*$/check-TESTS:/' \
+		-e '# fix the srcdir, top_srcdir, abs_top_builddir' \
+		-e 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' \
+		-e 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' \
+		-e 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' \
+		-e '# fix the path to test-driver' \
+		-e '/^SH_LOG_DRIVER =3D/s/(top_srcdir)/(top_builddir)/' \
+		-i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
=20
     # install test-driver
     install -m 644 ${S}/test-driver ${D}${PTEST_PATH}

