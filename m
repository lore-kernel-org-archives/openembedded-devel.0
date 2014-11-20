Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AB2FE65D4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 08:44:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43715545"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 16:40:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK8hsBu025177;
	Thu, 20 Nov 2014 16:43:54 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 20 Nov 2014 16:44:14 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <yocto@yoctoproject.org>
Date: Thu, 20 Nov 2014 16:43:57 +0800
Message-ID: <1416473037-23326-2-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416473037-23326-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1416473037-23326-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-selinux][PATCH 2/2] ustr: Add a new patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Nov 2014 08:44:17 -0000
Content-Type: text/plain

This patch has been applied in fedora to fix c99 inline problems.
Upstream hasn't been updated since 2008 and those c99 problems
still exist in the last version 1.0.4.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 recipes-extended/ustr/ustr/ustr-c99-inline.patch | 30 ++++++++++++++++++++++++
 recipes-extended/ustr/ustr_1.0.4.bb              |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/ustr/ustr/ustr-c99-inline.patch

diff --git a/recipes-extended/ustr/ustr/ustr-c99-inline.patch b/recipes-extended/ustr/ustr/ustr-c99-inline.patch
new file mode 100644
index 0000000..dfa021f
--- /dev/null
+++ b/recipes-extended/ustr/ustr/ustr-c99-inline.patch
@@ -0,0 +1,30 @@
+diff -rup ustr-1.0.4-orig/ustr-compiler.h ustr-1.0.4/ustr-compiler.h
+--- ustr-1.0.4-orig/ustr-compiler.h	2008-02-15 15:12:28.000000000 -0500
++++ ustr-1.0.4/ustr-compiler.h	2008-06-13 15:25:18.000000000 -0400
+@@ -113,17 +113,23 @@
+ #endif
+ 
+ #ifndef USTR_CONF_EI_PROTO /* external inline */
+-# if USTR_CONF_INCLUDE_CODEONLY_HEADERS
++# if USTR_CONF_INCLUDE_CODEONLY_HEADERS || ! defined(__GNUC__) || \
++     ! USTR_CONF_COMPILE_USE_INLINE
+ #  define USTR_CONF_EI_PROTO static USTR__INLINE
+ # else
+ #  define USTR_CONF_EI_PROTO extern
+ # endif
+ #endif
+ #ifndef USTR_CONF_II_PROTO /* implementation of inline */
+-# if USTR_CONF_INCLUDE_CODEONLY_HEADERS
++# if USTR_CONF_INCLUDE_CODEONLY_HEADERS || ! defined(__GNUC__) || \
++     ! USTR_CONF_COMPILE_USE_INLINE
+ #  define USTR_CONF_II_PROTO static USTR__INLINE
+ # else
+-#  define USTR_CONF_II_PROTO extern inline
++#  if defined(__GNUC_STDC_INLINE__) || defined(__GNUC_GNU_INLINE__)
++#   define USTR_CONF_II_PROTO extern inline __attribute__ ((__gnu_inline__))
++#  else
++#   define USTR_CONF_II_PROTO extern inline
++#  endif
+ # endif
+ #endif
+ 
diff --git a/recipes-extended/ustr/ustr_1.0.4.bb b/recipes-extended/ustr/ustr_1.0.4.bb
index d1f3d93..485e80d 100644
--- a/recipes-extended/ustr/ustr_1.0.4.bb
+++ b/recipes-extended/ustr/ustr_1.0.4.bb
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c79c6e2ae13418d16d7dc82df960a1e7 \
 SRC_URI = "\
     http://www.and.org/ustr/${PV}/${PN}-${PV}.tar.bz2 \
     file://ustr-makefile-fix.patch;patch=1 \
-    file://ustr-fix__va_copy-not-defined.patch;patch=2"
+    file://ustr-fix__va_copy-not-defined.patch;patch=2 \
+    file://ustr-c99-inline.patch;patch=3"
 SRC_URI[md5sum] = "93147d9f0c9765d4cd0f04f7e44bdfce"
 SRC_URI[sha256sum] = "3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e48f331fd99e1fc2c4"
 
-- 
1.8.3.1


