Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 51D3F712A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:35:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43623231"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Nov 2014 15:32:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAJ7Z3oT018787
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:35:03 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 19 Nov 2014 15:35:21 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Nov 2014 15:34:51 +0800
Message-ID: <1416382491-11239-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-selinux][PATCH] ustr: Change the SRC_URI to upstream and add a new patch
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
X-List-Received-Date: Wed, 19 Nov 2014 07:35:25 -0000
Content-Type: text/plain

Official upstream is still Ok, using it first.
Add a new patch which is applied in Fedora20

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 recipes-extended/ustr/ustr/ustr-c99-inline.patch | 44 ++++++++++++++++++++++++
 recipes-extended/ustr/ustr_1.0.4.bb              |  8 ++---
 2 files changed, 47 insertions(+), 5 deletions(-)
 create mode 100644 recipes-extended/ustr/ustr/ustr-c99-inline.patch

diff --git a/recipes-extended/ustr/ustr/ustr-c99-inline.patch b/recipes-extended/ustr/ustr/ustr-c99-inline.patch
new file mode 100644
index 0000000..5f2d5da
--- /dev/null
+++ b/recipes-extended/ustr/ustr/ustr-c99-inline.patch
@@ -0,0 +1,44 @@
+From 1b1c36ec67b7976d0bca0b6c7b766540cb541c1e Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Wed, 19 Nov 2014 14:48:18 +0800
+Subject: [PATCH] c99-inline
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ ustr-compiler.h | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/ustr-compiler.h b/ustr-compiler.h
+index 642e6e8..63735e0 100644
+--- a/ustr-compiler.h
++++ b/ustr-compiler.h
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
+-- 
+1.8.3.1
+
diff --git a/recipes-extended/ustr/ustr_1.0.4.bb b/recipes-extended/ustr/ustr_1.0.4.bb
index 6651a73..485e80d 100644
--- a/recipes-extended/ustr/ustr_1.0.4.bb
+++ b/recipes-extended/ustr/ustr_1.0.4.bb
@@ -11,13 +11,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c79c6e2ae13418d16d7dc82df960a1e7 \
 		    file://LICENSE_LGPL;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 		    file://LICENSE_MIT;md5=c61e779b782608472bd87593c3c3916f"
 
-# Official upstream seems to be offline.. replace w/ a Fedora Project mirror.
-# http://www.and.org/ustr/1.0.4/ustr-1.0.4.tar.bz2 
-
 SRC_URI = "\
-    http://pkgs.fedoraproject.org/repo/pkgs/ustr/ustr-1.0.4.tar.bz2/93147d9f0c9765d4cd0f04f7e44bdfce/ustr-1.0.4.tar.bz2 \
+    http://www.and.org/ustr/${PV}/${PN}-${PV}.tar.bz2 \
     file://ustr-makefile-fix.patch;patch=1 \
-    file://ustr-fix__va_copy-not-defined.patch;patch=2"
+    file://ustr-fix__va_copy-not-defined.patch;patch=2 \
+    file://ustr-c99-inline.patch;patch=3"
 SRC_URI[md5sum] = "93147d9f0c9765d4cd0f04f7e44bdfce"
 SRC_URI[sha256sum] = "3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e48f331fd99e1fc2c4"
 
-- 
1.8.3.1


