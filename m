Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239DCCCD183
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 00:04:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.3])
 by mx.groups.io with SMTP id smtpd.web11.3885.1760400272136151454
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 17:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Ywf6YXkE;
 spf=pass (domain: axis.com, ip: 40.107.162.3, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM0V18/gAKqN2F1p1tBPh5KU8hBHJQ0BjqaHCz16Rfp6cxLj40NjHzFUQQvKeo78X3MQjNqRGneeDHodstEQ/qHaply7RAkQ0str399Da4n4K8US3BRDbw59z6VBbIjLxJmrHGDiRyAat7eXd4ifnHPQnb/AD+kzJZt0oEejgj0OLMAYIZOQz5nSibAZLwlB4QX5df/7kBPtvyY4gUxT8abVHP2yBswUMjlGjStNIm3mNA6N81KZ6phi27ynCRzFueS1vwm/q4Od+SqWYuCgSg9sDKO6jT/QxJwLsXQKZv4L9fD1GMzxtBf4268WfB0GNCPq3FJ4UjW8f/DGyIZCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKnDRHzdtrNyqM26HdfPdEFKa7DeXd2P27Ek8Vc/8hM=;
 b=TaWNxH74g2dyUFJQ/1IzcUbyNHTeAG+aukBljb5LXiZnYQ2mYdwlYpmgGGE2tE1twLJvALqkG+w/wzOq+HSs854Pl6AD0NO2aPX2q7DuLiwpVd/aXkdWHAesPCcR5WS6TNNcP9pciC1HA+JoVAoHD0mIuzWNmDCoZI+WSLl4vYAlDDdH3zddveJcxaQVXnv+AR7DorXurZa8+c3NYAPNbd4ddYmErloIpXy6aNZ+mSnkFR6l3QpdVk9WQ+4axWJwubhgR5qtWWitsEYDRrnrMPE14eq2eFVwLPmdDQha4EiGErEvqxih+OLKRyPlcIRXI+Z+iN0x5swuLsJZUzpiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKnDRHzdtrNyqM26HdfPdEFKa7DeXd2P27Ek8Vc/8hM=;
 b=Ywf6YXkEjZzx8u/yo3rqyN37woJOitjGC5IoZTUSPaRBe9vvMBvZ0P9gAG1egkPYnXwjIxGphFtwcHESzbxjRLytwv4zMFw7xbRbY401qKnuN8NKXncm9tz+BwjcfPqup7TXXEXqB8XPOOxm/4NqIqH06l/Lqbcxdu+FrVK0bDU=
Received: from DUZPR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::19) by VI1PR02MB6430.eurprd02.prod.outlook.com
 (2603:10a6:800:192::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 00:04:26 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::cf) by DUZPR01CA0096.outlook.office365.com
 (2603:10a6:10:4bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 00:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 00:04:26 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 14 Oct
 2025 02:04:25 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 14 Oct
 2025 02:04:25 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 14 Oct 2025 02:04:25 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 90F441F5B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 02:04:25 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 717B612062E; Tue, 14 Oct 2025 02:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libeigen: Backport a patch to make eigen_packet_wrapper trivial for c++11
Date: Tue, 14 Oct 2025 02:04:12 +0200
Message-ID: <20251014000413.1137269-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|VI1PR02MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 6100dc98-6910-4971-8ccb-08de0ab53d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D9ctP7E52Na6mQyVj5A6BMvzzXC0bKPxc7E4MeNET5DCNfJ0tntsqHWCGC89?=
 =?us-ascii?Q?mz3KivU2oaq2yOnuSG4dFGHBqm3gyU7Fw5anxlArKCR6PIZAvtUIEu9BpC5w?=
 =?us-ascii?Q?iBli1UByPS46fQMF6K6pFNDQtyZpWWEFXe0uCfV6A1clwAsl40efgHxOp3Rq?=
 =?us-ascii?Q?jfZb0MxsFoVA5sMbj38Q3W8cvJ7krA/NU3MTRiRKElN1f8kzkJaN7MpM9Fu7?=
 =?us-ascii?Q?hlhMYsROtCvooVBWBhOD7cn+/FA8m29Hlboxd60WbXiEm7Mv73BWUIHdsWzU?=
 =?us-ascii?Q?fvdHk1MzSZxujIHuHsuP+NKevkfIK69IRjBh4YAowkce7YC9THch+WzocRCB?=
 =?us-ascii?Q?i22u2oWguuQqvnbP5VmUDkFfEZx9B9wsYdYJdt+2Tz8qJ8uiIvrbbTyjHwiM?=
 =?us-ascii?Q?6Aa0eL+goq2edA4J+LzXsp6LMM+pmy4NdDjT1NtUMLqzLNp+wdottt7Csk/K?=
 =?us-ascii?Q?rkUzyVaCOsK/8LdxKjuHPn5sQLxie5DgDVnUkvnAj4hs3azgbYuex34wyDmg?=
 =?us-ascii?Q?llBfZy17l8JGPY2nXlxS/ay97j8b3qEZBE6A8QlaLfclrNGRHUhYnn5MWLcc?=
 =?us-ascii?Q?dgoStg0RWuXowGP9UqjbQBQTiJfh51Y+TrMD4iAAANzMZpFl+iV6wLebGg3s?=
 =?us-ascii?Q?I3+yhU/OP6PYyf5iHTVmwqWjpol5J6CPpGgwWaOZe/dEqfzBxwxGv0mVBqNB?=
 =?us-ascii?Q?CphwTv3RPi/uh4PUDmMFNapWIbhdmbYP+Wvf78V7hXWHj2yHcnC2qobNL2YH?=
 =?us-ascii?Q?jLBJ12V4jgcahbRXVliUepu5cWcK+MMw8bjfAgKYzvitRSHVUeQ3JJs+m2KE?=
 =?us-ascii?Q?v4WFHePct36+s8BBh841AK91IKH1uVs+mg3SbLLVovuzB0AsNoqvg+2C9n8v?=
 =?us-ascii?Q?NFVTGJzYlxqxrU+AN3vntXN7ocF0Cm5VZ9NrxxAtEsF6Rb6fvPXNbH4IhNt0?=
 =?us-ascii?Q?rJf4FeYzMu+3o+VbDGNw5OtqhdK9gDyG6RkjwqdyVUX2zLOWrwRkIc2O+kPK?=
 =?us-ascii?Q?UaixfaYlRX63w/6lGtmuNqXp/umb+4UCA0CExLpfdG2YldrhWGP7RCedeE+F?=
 =?us-ascii?Q?PynXQ5X5jLUZ/7cJwxzV29AH3mwHrKeZdBFc+vUsCGEj5jWmJLeBqYozQmsX?=
 =?us-ascii?Q?tzZakSshEls/Wo2lIboPIkkhHH/kwZz3RhbbKKoTMF+5ZEooy1Y96lPGmuas?=
 =?us-ascii?Q?eciUPybm1NNhVOva5cQWABo1xyfd01dB+fDq+pmh3+FQgZhO1ub1LFfUK0lb?=
 =?us-ascii?Q?EmoMOFbRdOH9DAopXw06PBZedQJG/PcGT4Jkj2kz+u9kcs0TGjpQXSQ+o6Uv?=
 =?us-ascii?Q?F9HRHRuhWMqiMsqn8Wpc9XTRskcFL63FJ99wMaYNM+SSe+hAEocxKbTIxmuW?=
 =?us-ascii?Q?S1f5pU1tih9ksaOyxhh3ZowNgM1+wAqS7mT9ovX+jT40yojEnwiWidakjKvb?=
 =?us-ascii?Q?cGXsLxmQA9dsUzzCUGOEvY51A42P+e3ZqzVh1DaDuB/o0FRUHDEMn6XezGr7?=
 =?us-ascii?Q?1/ymEydMFQUkK+ibRQkNCEiuBaGWno4eljgIbPmpPe47SloHlxCn8RRtrsdi?=
 =?us-ascii?Q?TkfDP6i6LNGfkXzRb2w=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 00:04:26.2175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6100dc98-6910-4971-8ccb-08de0ab53d0b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6430
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 00:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120551

A corresponding patch was removed with the upgrade to 3.4.1 since it had
been integrated upstream. However, it had also been reverted again,
which was not noticed.

This backports a subsequent fix for the problem.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...igen_packet_wrapper-trivial-for-c-11.patch | 26 +++++++++++++++++++
 .../libeigen/libeigen_3.4.1.bb                |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-Make-eig=
en_packet_wrapper-trivial-for-c-11.patch

diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-Make-eigen_pack=
et_wrapper-trivial-for-c-11.patch b/meta-oe/recipes-support/libeigen/libeig=
en/0001-Make-eigen_packet_wrapper-trivial-for-c-11.patch
new file mode 100644
index 0000000000..855bf01ae9
--- /dev/null
+++ b/meta-oe/recipes-support/libeigen/libeigen/0001-Make-eigen_packet_wrap=
per-trivial-for-c-11.patch
@@ -0,0 +1,26 @@
+From 0295f81a835ef69e2bacd9e75ab5782eca398720 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Antonio=3D20S=3DC3=3DA1nchez?=3D <cantonios@google.com>
+Date: Thu, 2 Oct 2025 17:53:19 +0000
+Subject: [PATCH] Make `eigen_packet_wrapper` trivial for c++11.
+
+Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/commit/0295=
f81a835ef69e2bacd9e75ab5782eca398720]
+---
+ Eigen/src/Core/GenericPacketMath.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Eigen/src/Core/GenericPacketMath.h b/Eigen/src/Core/GenericPa=
cketMath.h
+index af45f3936..4aeb77de8 100644
+--- a/Eigen/src/Core/GenericPacketMath.h
++++ b/Eigen/src/Core/GenericPacketMath.h
+@@ -160,7 +160,11 @@ struct eigen_packet_wrapper
+ {
+   EIGEN_ALWAYS_INLINE operator T&() { return m_val; }
+   EIGEN_ALWAYS_INLINE operator const T&() const { return m_val; }
++#if EIGEN_HAS_CXX11
++  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() =3D default;
++#else
+   EIGEN_ALWAYS_INLINE eigen_packet_wrapper() {};
++#endif
+   EIGEN_ALWAYS_INLINE eigen_packet_wrapper(const T &v) : m_val(v) {}
+   EIGEN_ALWAYS_INLINE eigen_packet_wrapper& operator=3D(const T &v) {
+     m_val =3D v;
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb b/meta-oe/r=
ecipes-support/libeigen/libeigen_3.4.1.bb
index c5421e4621..5cb7407608 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
@@ -14,11 +14,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca59=
9c9df247a0c7f619bab123dad \
=20
 SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protocol=3Dhttp;branch=3D=
3.4 \
     file://0001-Remove-LGPL-Code-and-references.patch \
+    file://0001-Make-eigen_packet_wrapper-trivial-for-c-11.patch \
 "
=20
 SRCREV =3D "d71c30c47858effcbd39967097a2d99ee48db464"
=20
-
 inherit cmake
=20
 PACKAGECONFIG ??=3D ""

