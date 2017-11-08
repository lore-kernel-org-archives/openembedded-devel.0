Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC657841B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:58:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8JwAKZ026677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:58:10 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:58:09 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Nov 2017 11:58:02 -0800
Message-ID: <20171108195805.136677-3-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20171108195805.136677-1-jslater@windriver.com>
References: <20171108195805.136677-1-jslater@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/5] libtevent: update to version 0.99.33
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
 ...ons-for-packages.patch => options-0.9.33.patch} | 28 +++++++++++-----------
 .../{libtevent_0.9.31.bb => libtevent_0.9.33.bb}   |  6 ++---
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta-networking/recipes-support/libtevent/libtevent/{tevent-Add-configure-options-for-packages.patch => options-0.9.33.patch} (90%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.31.bb => libtevent_0.9.33.bb} (87%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/tevent-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtevent/libtevent/options-0.9.33.patch
similarity index 90%
rename from meta-networking/recipes-support/libtevent/libtevent/tevent-Add-configure-options-for-packages.patch
rename to meta-networking/recipes-support/libtevent/libtevent/options-0.9.33.patch
index ddb8e4e..84b1a36 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/tevent-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/options-0.9.33.patch
@@ -14,6 +14,10 @@ Add configure options for the following packages:
 Upstream-Status: Inappropriate [oe deterministic build specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Modified to apply to version 0.9.33.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
  lib/replace/system/wscript_configure |  6 ++-
  lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
@@ -155,23 +159,19 @@ index fc43e1a..12d2a70 100644
  
      conf.CHECK_CODE('''
                  struct ucred cred;
-diff --git a/wscript b/wscript
-old mode 100755
-new mode 100644
-index 71b9475..50793db
 --- a/wscript
 +++ b/wscript
-@@ -26,7 +26,12 @@ def set_options(opt):
-         opt.add_option('--disable-python',
-                        help=("disable the pytevent module"),
-                        action="store_true", dest='disable_python', default=False)
+@@ -22,7 +22,12 @@ def set_options(opt):
+     opt.PRIVATE_EXTENSION_DEFAULT('tevent', noextension='tevent')
+     opt.RECURSE('lib/replace')
+     opt.RECURSE('lib/talloc')
 -
-+        opt.add_option('--with-valgrind',
-+                       help=("enable use of valgrind"),
-+                       action="store_true", dest='enable_valgrind')
-+        opt.add_option('--without-valgrind',
-+                       help=("disable use of valgrind"),
-+                       action="store_false", dest='enable_valgrind', default=False)
++    opt.add_option('--with-valgrind',
++                   help=("enable use of valgrind"),
++                   action="store_true", dest='enable_valgrind')
++    opt.add_option('--without-valgrind',
++                   help=("disable use of valgrind"),
++                   action="store_false", dest='enable_valgrind', default=False)
  
  def configure(conf):
      conf.RECURSE('lib/replace')
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.33.bb
similarity index 87%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.9.33.bb
index ad711e7..f508300 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.33.bb
@@ -7,12 +7,12 @@ DEPENDS += "libtalloc"
 RDEPENDS_python-tevent = "python"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
-           file://tevent-Add-configure-options-for-packages.patch \
+           file://options-0.9.33.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
-SRC_URI[md5sum] = "5453847664ae6bc4ec0153e59ac635b9"
-SRC_URI[sha256sum] = "4a13f2256ad804c860e84068258bd0f8be31cf0c79aa8f3019fa32f6928c2bfc"
+SRC_URI[md5sum] = "527a43f35b4251e46f28921342895223"
+SRC_URI[sha256sum] = "22712ee981fd4298fcd5f3afb27d87a72257cebad37812cfbd3da5d968ed1bdc"
 
 inherit waf-samba
 
-- 
2.7.4


