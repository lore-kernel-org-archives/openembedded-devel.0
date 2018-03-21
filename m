Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A60A878966
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026069"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D7D514D0EFD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:17 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:08 +0800
Message-ID: <1521603377-34881-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: D7D514D0EFD1.A89C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] python-pygobject: 3.22.0 -> 3.28.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 03:36:21 -0000
Content-Type: text/plain

1.Upgrad python-pygobject from 3.22.0 to 3.28.0.
2.Modify 0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...e.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 19 +++----------------
 ...pygobject_3.22.0.bb => python-pygobject_3.28.0.bb} |  4 ++--
 2 files changed, 5 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.22.0.bb => python-pygobject_3.28.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
index a391f7e..9a11442 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
+++ b/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
@@ -14,28 +14,15 @@ diff --git a/configure.ac b/configure.ac
 index 2c0cfbd..cfcb3bf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -194,7 +194,7 @@ PKG_CHECK_MODULES(GI,
-     gobject-introspection-1.0 >= introspection_required_version
- )
+@@ -155,7 +155,7 @@ PKG_CHECK_MODULES(GI,
+ 
+ GOBJECT_INTROSPECTION_CHECK(introspection_required_version)
  
 -GI_DATADIR=$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
 +GI_DATADIR=$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
  AC_SUBST(GI_DATADIR)
  
  if test "$enable_cairo" != no; then
-@@ -219,12 +219,6 @@ AC_ARG_WITH(common,
-     with_common=yes)
- AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
- 
--INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--
--AC_SUBST(INTROSPECTION_SCANNER)
--AC_SUBST(INTROSPECTION_COMPILER)
--
- # compiler warnings, errors, required cflags, and code coverage support
- GNOME_COMPILE_WARNINGS([maximum])
- AC_MSG_CHECKING(for Gnome code coverage support)
 -- 
 2.1.4
 
diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.28.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
rename to meta-oe/recipes-devtools/python/python-pygobject_3.28.0.bb
index 7ddf4e5..ab65ba1 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.28.0.bb
@@ -17,8 +17,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "ed4117ed5d554d25fd7718807fbf819f"
-SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8a5cbe7"
+SRC_URI[md5sum] = "b29d69edb63ae1f555afeb19f90b9996"
+SRC_URI[sha256sum] = "42b47b261b45aedfc77e02e3c90a01cd74d6f86c3273c1860a054d531d606e5a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




