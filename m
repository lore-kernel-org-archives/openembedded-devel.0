Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78489C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 13:05:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13307.1714136705761455128
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Apr 2024 06:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rdjarbYS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4846410038=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q8sgC5029481
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 06:05:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=+GAfd
	WdCHq7amkOp+u03EKYmi+H6Dtb4wEcNtNq+x/Y=; b=rdjarbYS4QunC9qjmNMMm
	uwGvwUTLrrYo2PhUiAgaKdhsZCaEutIx01r6RD2+AVX5w3XF3PN8XobS7wACpYyd
	vZs+8CsEbfAbgCnOVHg1Tz/O6k5tCoNmEWhMEjmcIYNO5Vi3va1TPWIce2CeY0p9
	MmfGl3jjgSfNvu5QQUI8qSGG7lXZN3G5YIi779856pInHBgt5DIpPdZb6z9+8Imd
	laEPSYcklq9wpowSUWGFepJn2xCGcAcyCUvC+SDmeweq1UgIh4e2bBo1mxshUGAc
	/jmyBceOqJvQh1SYVtSQ8qln8gDhzrOnbK0fuu5am8ag3/8meTueJQmRgtrrlfIi
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm900xtb6-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 06:05:05 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 26 Apr 2024 06:05:02 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] mbedtls: upgrade 3.5.2->3.6.0
Date: Fri, 26 Apr 2024 13:04:42 +0000
Message-ID: <20240426130443.2098001-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Gf3rpSZmxPcuMR_MjGtzjvQiDuF94kxt
X-Proofpoint-ORIG-GUID: Gf3rpSZmxPcuMR_MjGtzjvQiDuF94kxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404260087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 13:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110155

From: Yogita Urade <yogita.urade@windriver.com>

Includes security fixes:
CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs

Release notes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...t-attributes-for-x86-32-bit-intrinsi.patch | 87 -------------------
 .../{mbedtls_3.5.2.bb => mbedtls_3.6.0.bb}    | 10 ++-
 2 files changed, 7 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.2.bb => mbedtls_3.6.0.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
deleted file mode 100644
index 5030fb99f9..0000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 80d3e73ad0648f558a067a9dbfe3bc80e6b614f8 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Mon, 30 Oct 2023 19:15:56 +0000
-Subject: [PATCH] AES-NI: use target attributes for x86 32-bit intrinsics
-
-This way we build with 32-bit gcc/clang out of the box.
-We also fallback to assembly for 64-bit clang-cl if needed cpu
-flags are not provided, instead of throwing an error.
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/800f2b7c020678a84abfa9688962b91c36e6693d]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesni.c | 20 ++++++++++++++++++++
- library/aesni.h |  8 +++++---
- 2 files changed, 25 insertions(+), 3 deletions(-)
-
-diff --git a/library/aesni.c b/library/aesni.c
-index 5f25a8249..481fa3822 100644
---- a/library/aesni.c
-+++ b/library/aesni.c
-@@ -41,6 +41,17 @@
- #include <immintrin.h>
- #endif
-
-+#if defined(MBEDTLS_ARCH_IS_X86)
-+#if defined(MBEDTLS_COMPILER_IS_GCC)
-+#pragma GCC push_options
-+#pragma GCC target ("pclmul,sse2,aes")
-+#define MBEDTLS_POP_TARGET_PRAGMA
-+#elif defined(__clang__)
-+#pragma clang attribute push (__attribute__((target("pclmul,sse2,aes"))), apply_to=function)
-+#define MBEDTLS_POP_TARGET_PRAGMA
-+#endif
-+#endif
-+
- #if !defined(MBEDTLS_AES_USE_HARDWARE_ONLY)
- /*
-  * AES-NI support detection routine
-@@ -396,6 +407,15 @@ static void aesni_setkey_enc_256(unsigned char *rk_bytes,
- }
- #endif /* !MBEDTLS_AES_ONLY_128_BIT_KEY_LENGTH */
-
-+#if defined(MBEDTLS_POP_TARGET_PRAGMA)
-+#if defined(__clang__)
-+#pragma clang attribute pop
-+#elif defined(__GNUC__)
-+#pragma GCC pop_options
-+#endif
-+#undef MBEDTLS_POP_TARGET_PRAGMA
-+#endif
-+
- #else /* MBEDTLS_AESNI_HAVE_CODE == 1 */
-
- #if defined(__has_feature)
-diff --git a/library/aesni.h b/library/aesni.h
-index ba1429029..37ae02c82 100644
---- a/library/aesni.h
-+++ b/library/aesni.h
-@@ -50,6 +50,10 @@
- #if defined(__GNUC__) && defined(__AES__) && defined(__PCLMUL__)
- #define MBEDTLS_AESNI_HAVE_INTRINSICS
- #endif
-+/* For 32-bit, we only support intrinsics */
-+#if defined(MBEDTLS_ARCH_IS_X86) && (defined(__GNUC__) || defined(__clang__))
-+#define MBEDTLS_AESNI_HAVE_INTRINSICS
-+#endif
-
- /* Choose the implementation of AESNI, if one is available.
-  *
-@@ -60,13 +64,11 @@
- #if defined(MBEDTLS_AESNI_HAVE_INTRINSICS)
- #define MBEDTLS_AESNI_HAVE_CODE 2 // via intrinsics
- #elif defined(MBEDTLS_HAVE_ASM) && \
--    defined(__GNUC__) && defined(MBEDTLS_ARCH_IS_X64)
-+    (defined(__GNUC__) || defined(__clang__)) && defined(MBEDTLS_ARCH_IS_X64)
- /* Can we do AESNI with inline assembly?
-  * (Only implemented with gas syntax, only for 64-bit.)
-  */
- #define MBEDTLS_AESNI_HAVE_CODE 1 // via assembly
--#elif defined(__GNUC__)
--#   error "Must use `-mpclmul -msse2 -maes` for MBEDTLS_AESNI_C"
- #else
- #error "MBEDTLS_AESNI_C defined, but neither intrinsics nor assembly available"
- #endif
---
-2.34.1
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
index 2fedac48cf..6375c7dc2c 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
@@ -23,10 +23,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "daca7a3979c22da155ec9dce49ab1abf3b65d3a9"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
-	file://run-ptest"
+           git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
+           file://run-ptest"
+
+SRCREV = "2ca6c285a0dd3f33982dd57299012dacab1ff206"
+SRCREV_framework = "750634d3a51eb9d61b59fd5d801546927c946588"
+SRCREV_FORMAT .= "_framework"
+
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake update-alternatives ptest
-- 
2.40.0


