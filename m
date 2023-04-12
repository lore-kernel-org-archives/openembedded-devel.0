Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE245C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 06:58:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36806.1681282676295152048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 23:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3466d2cce5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33C5BITZ002992
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 06:57:55 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pty8b421k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 06:57:55 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 23:57:53 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 23:57:53 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: Fix GCC 12 -Og
Date: Wed, 12 Apr 2023 14:57:52 +0800
Message-ID: <20230412065752.2905789-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AA5R8_FnSJCD_rbo5N5H26TJTCiVBLKO
X-Proofpoint-GUID: AA5R8_FnSJCD_rbo5N5H26TJTCiVBLKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_02,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 06:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102063

From: Mingli Yu <mingli.yu@windriver.com>

Change whether to inline XXH3_hashLong_withSecret to a config option
to fix GCC 12 -Og.

Ref: https://github.com/Cyan4973/xxHash/commit/ace22bddc7a366a5dd8a71e8b8247694530684ec

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...o-inline-XXH3_hashLong_withSecret-to.patch | 93 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_8.2.4.bb     |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch

diff --git a/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch b/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
new file mode 100644
index 000000000..5b8c76209
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
@@ -0,0 +1,93 @@
+From 1eeb59366d6140a799f6051fb9f57d988b81fd5b Mon Sep 17 00:00:00 2001
+From: easyaspi314 <easyaspi314@users.noreply.github.com>
+Date: Wed, 12 Apr 2023 13:33:07 +0800
+Subject: [PATCH] Change whether to inline XXH3_hashLong_withSecret to a config
+ option
+
+Change whether to inline XXH3_hashLong_withSecret to a config option to fix
+GCC 12 -Og.
+
+Upstream-Status: Submitted [https://github.com/php/php-src/pull/11062]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
+index b5bd2864..8e816c05 100644
+--- a/ext/hash/xxhash/xxhash.h
++++ b/ext/hash/xxhash/xxhash.h
+@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
+  */
+ #  define XXH_NO_INLINE_HINTS 0
+ 
++/*!
++ * @def XXH3_INLINE_SECRET
++ * @brief Determines whether to inline the XXH3 withSecret code.
++ *
++ * When the secret size is known, the compiler can improve the performance
++ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
++ *
++ * However, if the secret size is not known, it doesn't have any benefit. This
++ * happens when xxHash is compiled into a global symbol. Therefore, if
++ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
++ *
++ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
++ * that are *sometimes* force inline on -Og, and it is impossible to automatically
++ * detect this optimization level.
++ */
++#  define XXH3_INLINE_SECRET 0
++
+ /*!
+  * @def XXH32_ENDJMP
+  * @brief Whether to use a jump for `XXH32_finalize`.
+@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
+ #  endif
+ #endif
+ 
++#ifndef XXH3_INLINE_SECRET
++#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
++     || !defined(XXH_INLINE_ALL)
++#    define XXH3_INLINE_SECRET 0
++#  else
++#    define XXH3_INLINE_SECRET 1
++#  endif
++#endif
++
+ #ifndef XXH32_ENDJMP
+ /* generally preferable for performance */
+ #  define XXH32_ENDJMP 0
+@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ #  define XXH_NO_INLINE static
+ #endif
+ 
++#if XXH3_INLINE_SECRET
++#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
++#else
++#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
++#endif
+ 
+ 
+ /* *************************************
+@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
+  * so that the compiler can properly optimize the vectorized loop.
+  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
+  */
+-XXH_FORCE_INLINE XXH64_hash_t
++XXH3_WITH_SECRET_INLINE XXH64_hash_t
+ XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
+                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
+ {
+@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
+  * It's important for performance to pass @secretLen (when it's static)
+  * to the compiler, so that it can properly optimize the vectorized loop.
+  */
+-XXH_FORCE_INLINE XXH128_hash_t
++XXH3_WITH_SECRET_INLINE XXH128_hash_t
+ XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
+                               XXH64_hash_t seed64,
+                               const void* XXH_RESTRICT secret, size_t secretLen)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php_8.2.4.bb b/meta-oe/recipes-devtools/php/php_8.2.4.bb
index aec222b58..d5954d976 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
            file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
+           file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1


