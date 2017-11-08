Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02C0F7841A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:58:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8Jw7rr026294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:58:09 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:58:06 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Nov 2017 11:58:01 -0800
Message-ID: <20171108195805.136677-2-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20171108195805.136677-1-jslater@windriver.com>
References: <20171108195805.136677-1-jslater@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/5] libtalloc: update to version 2.1.10
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
X-List-Received-Date: Wed, 08 Nov 2017 19:58:09 -0000
Content-Type: text/plain

Version needed to build samba 4.7.0.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 ...-options-for-packages.patch => options-2.1.10.patch} | 17 ++++++++++-------
 .../{libtalloc_2.1.9.bb => libtalloc_2.1.10.bb}         |  7 ++++---
 2 files changed, 14 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/libtalloc/libtalloc/{talloc-Add-configure-options-for-packages.patch => options-2.1.10.patch} (95%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.9.bb => libtalloc_2.1.10.bb} (90%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/talloc-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
similarity index 95%
rename from meta-networking/recipes-support/libtalloc/libtalloc/talloc-Add-configure-options-for-packages.patch
rename to meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
index 46b2405..35f8eaf 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/talloc-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
@@ -14,6 +14,11 @@ Add configure options for the following packages:
 Upstream-Status: Inappropriate [oe deterministic build specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Modified to apply to version 2.1.10.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
 ---
  lib/replace/system/wscript_configure |  6 ++-
  lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
@@ -154,14 +159,12 @@ index fc43e1a..12d2a70 100644
  
      conf.CHECK_CODE('''
                  struct ucred cred;
-diff --git a/wscript b/wscript
-index 41f3be7..556c1c8 100644
 --- a/wscript
 +++ b/wscript
-@@ -35,7 +35,12 @@ def set_options(opt):
-         opt.add_option('--disable-python',
-                        help=("disable the pytalloc module"),
-                        action="store_true", dest='disable_python', default=False)
+@@ -32,7 +32,12 @@ def set_options(opt):
+         opt.add_option('--enable-talloc-compat1',
+                        help=("Build talloc 1.x.x compat library [False]"),
+                        action="store_true", dest='TALLOC_COMPAT1', default=False)
 -
 +        opt.add_option('--with-valgrind',
 +                       help=("enable use of valgrind"),
@@ -169,7 +172,7 @@ index 41f3be7..556c1c8 100644
 +        opt.add_option('--without-valgrind',
 +                       help=("disable use of valgrind"),
 +                       action="store_false", dest='enable_valgrind', default=False)
- 
+
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.9.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb
similarity index 90%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.9.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb
index d80af50..23dca15 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.9.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 
 
 SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
-           file://talloc-Add-configure-options-for-packages.patch \
+           file://options-2.1.10.patch \
 "
-SRC_URI[md5sum] = "19ba14eba97d79a169fa92ea824d2b9e"
-SRC_URI[sha256sum] = "f0aad4cb88a3322207c82136ddc07bed48a37c2c21f82962d6c5ccb422711062"
+
+SRC_URI[md5sum] = "48b8822a76797bb143e3e38ed738c320"
+SRC_URI[sha256sum] = "c985e94bebd6ec2f6af3d95dcc3fcb192a2ddb7781a021d70ee899e26221f619"
 
 inherit waf-samba
 
-- 
2.7.4


