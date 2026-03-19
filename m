Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545841088E6A
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 03:03:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3001.1773889374957689046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 20:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LE4xu32L;
 spf=pass (domain: axis.com, ip: 40.107.159.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDa7kEglZUTLbxMBaMnlSTW4HJjLmysxZJa/pqU/cqwR3KeUdFOPSuZTjrQeKhisxChCJiHZSpuX42dhDGA78aRH20A+LDmr7+Czc8YXkCQo0SPBm2eKxK4J1YcwVRSI41mMebvuotdQSl0kpMfcf8QS5zGIUJQRgSv5ZQCaBQ049rX6XQsyDQbG1VtWv6lBTZlGjDDaainhZZU2he0kO/PudmUvZH0K3BbTRvBF8uSBf4nDzU+nRfZ+JM8LMO3vKnA7iJpWvg+jAPFEsNS2Xbkbsd6rHbDvVlepw56HKoRyvrEojjvc1tPT2iB0lJn5aqxuQ+E12H4DbmRV9tAevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4YjIU8FRQ4rzyDfqpwP5GL1kn//vuyBDZsc1UNbP9g=;
 b=ZodctqBd1HvIMzfNc1GxB0PWbX5ypZiA5zIR0wntEmKBuYHqHMJqXxLSEQQ3/z9dC01oJYKVZlqZFm/mUc9OyjTauWTYycdfhyPYZ6gxNkIk8elWWJoyyURofxpMEwUwkIaFzmEjyLloQK+SDS52I7vnZERGeMlMpfV4QXWFybKnQCOlWUbyajZOaZJisaAM23Hv43IMMAJH9K8UPNx45q45DM3GhSiIkHpPn089ZvY+Agxs1TN2MPYUZiKhnB6O1+L8fwSsSK83Rpn+QeL7G/f8Gci0bMRociHTTJ01I0FUzUqg+cfiV6XktZknrlj/MymbFPDqsZs8vNOzca74fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4YjIU8FRQ4rzyDfqpwP5GL1kn//vuyBDZsc1UNbP9g=;
 b=LE4xu32LwsO8H1H7LHFyVKCUgt+2spdivRyb1weLNs2vph4OsOBonIBmbL5BRyNErw3xuV/7sPLliR0R4WHXObQu9gbEoalZcGyokTrC+ck6cLy8mvNNLxrsghNb4GR3lwop0aug2H7hx9nxjyi8tvaykMiffbOM5aJHsYh2PXw=
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by DBAPR02MB6485.eurprd02.prod.outlook.com
 (2603:10a6:10:19d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 03:02:50 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::54) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 03:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 03:02:49 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 19 Mar
 2026 04:02:49 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 19 Mar
 2026 04:02:49 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Mar 2026 04:02:49 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 37B142604
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 04:02:49 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 356521208D1; Thu, 19 Mar 2026 04:02:49 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] liboauth2: Backport a patch to build with glibc 2.43
Date: Thu, 19 Mar 2026 04:02:47 +0100
Message-ID: <20260319030247.1631071-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|DBAPR02MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fe18ec-e12a-488a-9dbe-08de85640148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QhSph0UX175DsDh2FrPA5woK/69/8nFQQAr4KNHCkJ583QB41E8rcmLf+tGMh8PE0uO3cQmiJetX3fCyMeffyRH9Yj2gFzrHUCrXJcOpXhPFYcPx29muqCc4CFYvF8kdBce08RD+dUeCGMEP2a5DeKPeQ37EDZcK7nsTMDT3Vl+TR0KYFvmpPSKr4wgC4N8tKyhDMEv7rTz1YAIM9YfMm02E4wba4rD8l72qw6BKwHevMIGwKGVwuPIpKqyn5QBJ/7b/9i1d5pPpD6EbOGxaE/qPH7LabRxQM8om87le75HtnD35R3NyaEG6oU8jYaod88P9S9KToIuVFslBEpzJyIa3B6c+mPWGr2wJHrZY1/n5834azEv/ENGOhGs8Wg3GumK0Ujn/S2nbkDLAU/IDJ+7PBSxLaS0eek/zXGroe9nTxkh7QGTObMedGolsS6iq834SgzOXt0q1Q0F1Q/IMCKRwjMGxBBJRhRE4ngKyjwmRPgZzYGvCeq7O4Vho8SqqcAib9QaMtfvvevc/X+FW+FPuKe4VJzDkqASZ18jxUhiRa6z05KCWsIACyzzNqJDfgh9byxnAI+jHaQ0xdZiPQGku3RlYoLZLwSm6NytKZQ3yTvW/5YvBMrryl1vt/3bZOT1YvkAcj/n1LH0bdW9y/tg7yQ6Ls8WhzG8GRbIjCs8Qcyo3YZ+AzYk7d3BuwQQiCgukzBBICAvWJn536HPaQmGGxsAQ9QC8unS+9lDdG2g=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TPg3q3uayqa6+RQNrSYRxhNknCZfGWL7x7DorXfRKPlm/6WFALl7zgBj/6ip/DY5laZbtnmy2mH+qbt6Wu7n+9HRGd07T0AKZmdnsfdPPG/HY3+vTfhtlwJPqR0UDbwK8CTkzQf/p9yAH4i+GxIqL2Vb8WIk8GMs8VrEGSZ58hqFW6/1DKB9x5D/oG7t0nnMIW6iZIhUjw8Sp7ZQUwDBHOznYeohcAzsQSkjON/Nkzq8WUY9kRAp4a/nHCYze87n72m5CSuo9J4mGxKvAG3LGKfaYrFAO7OilVFTh//gLR7OgJp4dXsb7WGGVTKfd5azhaq3iiNv249jwgpdJ5ih1DxiaHvqQl1faf8it94r0FDV7zrxdnMtzpYeEbjpmjGNQjJcTgvMNKeW5PLXtm1K2Lg4UyhMUmunPODYu2Q1T7ZwtNSlBQFadCTLi0XPHV52
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 03:02:49.7456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fe18ec-e12a-488a-9dbe-08de85640148
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6485
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 03:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125371

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0002-Fix-use-of-strchr-with-new-GCC.patch | 33 +++++++++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-us=
e-of-strchr-with-new-GCC.patch

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-st=
rchr-with-new-GCC.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0002-=
Fix-use-of-strchr-with-new-GCC.patch
new file mode 100644
index 0000000000..65340e806a
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-wi=
th-new-GCC.patch
@@ -0,0 +1,33 @@
+From 0dcba079907d559550ee8d9a201d26203bb8aebd Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <abokovoy@redhat.com>
+Date: Wed, 7 Jan 2026 11:41:37 +0200
+Subject: [PATCH] Fix use of strchr with new GCC
+
+According to C specification, 7.28.5.1, strchr() is a generic function
+and its string argument's type is promoted to the result. So if it is
+const char*, the result will be const char* as well.
+
+gcc in Fedora Rawhide (15.2.1 20251111 or later) implements this
+conformance, resulting in a compilation fail with
+-Werror=3Ddiscarded-qualifiers.
+
+Signed-off-by: Alexander Bokovoy <abokovoy@redhat.com>
+Upstream-Status: Backport [https://github.com/OpenIDC/liboauth2/commit/0dc=
ba079907d559550ee8d9a201d26203bb8aebd]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ src/jose.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jose.c b/src/jose.c
+index fbaf661..a3441c8 100644
+--- a/src/jose.c
++++ b/src/jose.c
+@@ -993,7 +993,7 @@ char *oauth2_jose_jwt_header_peek(oauth2_log_t *log,
+ {
+ 	char *input =3D NULL, *result =3D NULL;
+ 	json_t *json =3D NULL;
+-	char *p =3D NULL;
++	const char *p =3D NULL;
+ 	size_t result_len;
+ 	char *rv =3D NULL;
+=20
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe=
/recipes-support/liboauth2/liboauth2_2.2.0.bb
index 31d7aec69d..244cd51a2c 100644
--- a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe701=
4dce33e26468ba93"
 SRC_URI =3D " \
     git://github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;ta=
g=3Dv${PV} \
     file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch \
+    file://0002-Fix-use-of-strchr-with-new-GCC.patch \
     "
=20
 PV =3D "2.2.0"

