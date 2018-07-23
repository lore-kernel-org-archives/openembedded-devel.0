Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE6874D59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 09:33:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42543811"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2018 17:33:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9CBA84B66A22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:33:49 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 23 Jul 2018 17:33:48 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jul 2018 17:33:23 +0800
Message-ID: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 9CBA84B66A22.AF472
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-networking][PATCH] libtalloc: 2.1.11 -> 2.1.14
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
X-List-Received-Date: Mon, 23 Jul 2018 09:33:59 -0000
Content-Type: text/plain

1.Upgrade  libtalloc form 2.1.11 to 2.1.14.

2.Modify options-2.1.10.patch to suit new version

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../libtalloc/libtalloc/options-2.1.10.patch              | 15 ++++++++-------
 .../{libtalloc_2.1.11.bb => libtalloc_2.1.14.bb}          |  4 ++--
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.11.bb => libtalloc_2.1.14.bb} (93%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
index 63f21e7..9444c24 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
@@ -20,27 +20,28 @@ Modified to apply to version 2.1.10.
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 ---
- lib/replace/system/wscript_configure |  6 ++-
+ lib/replace/system/wscript_configure |  7 +++
  lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
  wscript                              |  7 ++-
- 3 files changed, 79 insertions(+), 19 deletions(-)
+ 3 files changed, 81 insertions(+), 18 deletions(-)
 
 Index: talloc-2.1.11/lib/replace/system/wscript_configure
 ===================================================================
 --- talloc-2.1.11.orig/lib/replace/system/wscript_configure
 +++ talloc-2.1.11/lib/replace/system/wscript_configure
-@@ -1,6 +1,10 @@
+@@ -1,5 +1,12 @@
  #!/usr/bin/env python
- 
--conf.CHECK_HEADERS('sys/capability.h')
+
 +import Options
 +
 +if Options.options.enable_libcap:
 +    conf.CHECK_HEADERS('sys/capability.h')
 +
- conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
- 
++conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
++
  # solaris varients of getXXent_r
+ conf.CHECK_C_PROTOTYPE('getpwent_r',
+                        'struct passwd *getpwent_r(struct passwd *src, char *buf, int buflen)',
 Index: talloc-2.1.11/lib/replace/wscript
 ===================================================================
 --- talloc-2.1.11.orig/lib/replace/wscript
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
similarity index 93%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
index 848cf4d..531d0ba 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.14.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.1.10.patch \
 "
-SRC_URI[md5sum] = "452596f904ca2b10322bdaabf147a721"
-SRC_URI[sha256sum] = "639eb35556a0af999123c4d883e79be05ff9f00ab4f9e4ac2e5775f9c5eeeed3"
+SRC_URI[md5sum] = "7478da02e309316231a497a9f17a980d"
+SRC_URI[sha256sum] = "b185602756a628bac507fa8af8b9df92ace69d27c0add5dab93190ad7c3367ce"
 
 inherit waf-samba
 
-- 
2.7.4




