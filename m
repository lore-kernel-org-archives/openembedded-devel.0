Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109BEC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:58:52 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.11779.1654772324044790186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 259AwgMf019629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 9 Jun 2022 03:58:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Jun 2022 03:58:41 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Jun 2022 03:58:41 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] s-nail: Fix build with gcc-12
Date: Thu, 9 Jun 2022 18:58:40 +0800
Message-ID: <20220609105840.2259201-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 10:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97466

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches to fix the below build failure when
debug build is enabled.
Add DEBUG_BUILD = "1" in conf/local.conf.
 $ bitbake s-nail
  | /build/tmp-glibc/work/corei7-64-wrs-linux/s-nail/14.9.24-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.1.0/ld: mx-047.o: in function `a_nm_alias_expand':
  | /usr/src/debug/s-nail/14.9.24-r0/s-nail-14.9.24/src/mx/names.c:308: undefined reference to `su_cs_dict_lookup'
  | /build/tmp-glibc/work/corei7-64-wrs-linux/s-nail/14.9.24-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.1.0/ld: mx-028.o: in function `mx_fs_linepool_book':
  | /usr/src/debug/s-nail/14.9.24-r0/s-nail-14.9.24/src/mx/file-streams.c:1036: undefined reference to `su_mem_get_can_book'
  collect2: error: ld returned 1 exit status

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...INLINE-eh-no-give-up-share-detection.patch | 68 +++++++++++++++++++
 ...LINE-gcc-only-GNU-specifics-after-Og.patch | 45 ++++++++++++
 .../recipes-extended/s-nail/s-nail_14.9.24.bb |  5 +-
 3 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
 create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch

diff --git a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
new file mode 100644
index 000000000..2afaaac01
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
@@ -0,0 +1,68 @@
+From 9db4c0f6bc0dd11c77b54296fce6b8afe18f4325 Mon Sep 17 00:00:00 2001
+From: Steffen Nurpmeso <steffen@sdaoden.eu> 
+Date: Thu, 9 Jun 2022 18:26:38 +0800
+Subject: [PATCH] su_INLINE: eh no; give up, share detection with clang but for
+ a thing
+
+Upstream-Status: Backport[https://git.sdaoden.eu/browse/s-nail.git/commit/?id=de2a44c393a39d80ddf12154aec94cace84b19c1]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ include/su/code.h | 34 +++++++++-------------------------
+ 1 file changed, 9 insertions(+), 25 deletions(-)
+
+diff --git a/include/su/code.h b/include/su/code.h
+index 9683f4a..c7a2af3 100644
+--- a/include/su/code.h
++++ b/include/su/code.h
+@@ -308,29 +308,8 @@ do{\
+ # ifdef DOXYGEN
+ #  define su_INLINE inline
+ #  define su_SINLINE inline
+-# elif su_CC_GCC
+-#  if !su_CC_VCHECK_GCC(3, 1)
+-#   define su_INLINE extern __inline__
+-#   define su_SINLINE static __inline__
+-#  elif !defined __GNUC_GNU_INLINE__  /*4.1.3; !su_CC_VCHECK_GCC(4, 2)*/
+-#   define su_INLINE extern __inline __attribute__((always_inline))
+-#   define su_SINLINE static __inline __attribute__((always_inline))
+-   /* gcc 8.3.0 bug: does not gracefully inline with -Os
+-    * gcc 12.1.0 bug: ditto, -Og
+-    * Thus: always gcc-specific! */
+-#  elif 1 /*!defined __OPTIMIZE__ || \
+-      !defined __STDC_VERSION__ || __STDC_VERSION__ +0 < 199901L*/
+-#   define su_INLINE extern __inline __attribute__((gnu_inline))
+-#   define su_SINLINE static __inline __attribute__((gnu_inline))
+-#  elif !defined NDEBUG || !defined __OPTIMIZE__
+-#   define su_INLINE static inline
+-#   define su_SINLINE static inline
+-#  else
+-#   define su_INLINE inline
+-#   define su_SINLINE static inline
+-#  endif
+-# elif su_CC_CLANG || su_CC_PCC
+-#  if defined __STDC_VERSION__ && __STDC_VERSION__ +0 >= 199901L
++# elif su_CC_CLANG || su_CC_GCC || su_CC_PCC
++#  if defined __STDC_VERSION__ && __STDC_VERSION__ +0 >= 199901l
+ #   if !defined NDEBUG || !defined __OPTIMIZE__
+ #    define su_INLINE static inline
+ #    define su_SINLINE static inline
+@@ -340,8 +319,13 @@ do{\
+ #    define su_SINLINE static inline __attribute__((always_inline))
+ #   endif
+ #  else
+-#   define su_INLINE static __inline
+-#   define su_SINLINE static __inline
++#   if su_CC_VCHECK_GCC(3, 1)
++#    define su_INLINE static __inline __attribute__((always_inline))
++#    define su_SINLINE static __inline __attribute__((always_inline))
++#   else
++#    define su_INLINE static __inline
++#    define su_SINLINE static __inline
++#   endif
+ #  endif
+ # else
+ #  define su_INLINE static /* TODO __attribute__((unused)) alike? */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
new file mode 100644
index 000000000..e011f5c71
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
@@ -0,0 +1,45 @@
+From 5429b9e343c808951b1418d8626e544c9dcb28de Mon Sep 17 00:00:00 2001
+From: Steffen Nurpmeso <steffen@sdaoden.eu>
+Date: Thu, 9 Jun 2022 18:06:04 +0800
+Subject: [PATCH] su_INLINE: gcc: only GNU specifics after -Og
+
+Upstream-Status: Backport[https://git.sdaoden.eu/browse/s-nail.git/commit/?id=c5544b66c3b4b2e161166562349908a07e324b38]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ include/su/code.h | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/include/su/code.h b/include/su/code.h
+index 4d552c1..9683f4a 100644
+--- a/include/su/code.h
++++ b/include/su/code.h
+@@ -309,16 +309,17 @@ do{\
+ #  define su_INLINE inline
+ #  define su_SINLINE inline
+ # elif su_CC_GCC
+-   /* After lots of trouble with OpenBSD/gcc 4.2.1 and SunOS/gcc 3.4.3 */
+-#  if !su_CC_VCHECK_GCC(3, 2) /* Unsure: only used C++ at that time */
+-#   define su_INLINE extern __inline
+-#   define su_SINLINE static __inline
+-#  elif !su_CC_VCHECK_GCC(4, 3)
++#  if !su_CC_VCHECK_GCC(3, 1)
++#   define su_INLINE extern __inline__
++#   define su_SINLINE static __inline__
++#  elif !defined __GNUC_GNU_INLINE__  /*4.1.3; !su_CC_VCHECK_GCC(4, 2)*/
+ #   define su_INLINE extern __inline __attribute__((always_inline))
+ #   define su_SINLINE static __inline __attribute__((always_inline))
+-   /* xxx gcc 8.3.0 bug: does not truly inline with -Os */
+-#  elif !su_CC_VCHECK_GCC(8, 3) || !defined __OPTIMIZE__ ||\
+-      !defined __STDC_VERSION__ || __STDC_VERSION__ +0 < 199901L
++   /* gcc 8.3.0 bug: does not gracefully inline with -Os
++    * gcc 12.1.0 bug: ditto, -Og
++    * Thus: always gcc-specific! */
++#  elif 1 /*!defined __OPTIMIZE__ || \
++      !defined __STDC_VERSION__ || __STDC_VERSION__ +0 < 199901L*/
+ #   define su_INLINE extern __inline __attribute__((gnu_inline))
+ #   define su_SINLINE static __inline __attribute__((gnu_inline))
+ #  elif !defined NDEBUG || !defined __OPTIMIZE__
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
index 539f9c3c8..6e004fc90 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"
 
 SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
            file://make-errors.patch \
-           file://0001-make.rc-set-VAL_MTA.patch"
+           file://0001-make.rc-set-VAL_MTA.patch \
+           file://0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch \
+           file://0001-su_INLINE-eh-no-give-up-share-detection.patch \
+"
 SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


