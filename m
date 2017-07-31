Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id D688678523
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:04:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,367,1444665600"; 
   d="scan'208";a="1500334"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by song.cn.fujitsu.com with ESMTP; 31 Jul 2017 18:04:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 048C6402BB71
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jul 2017 18:04:04 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 31 Jul 2017 18:04:05 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Jul 2017 18:03:47 +0800
Message-ID: <1501495427-1525-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 048C6402BB71.A4041
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] libtdb: update 1.3.12 -> 1.3.14
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
X-List-Received-Date: Mon, 31 Jul 2017 10:04:11 -0000
Content-Type: text/plain

1) Upgrade libtdb from 1.3.12 to 1.3.14.
2) Update tdb-Add-configure-options-for-packages.patch for libtdb_1.3.14.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../tdb-Add-configure-options-for-packages.patch   | 43 +++++++++++++---------
 .../libtdb/{libtdb_1.3.12.bb => libtdb_1.3.14.bb}  |  4 +-
 2 files changed, 27 insertions(+), 20 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.12.bb => libtdb_1.3.14.bb} (91%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
index 4000557..272921e 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
@@ -1,7 +1,10 @@
-From 10ac5e5fdda44adcc2a159b6f9a2d51a51361057 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 21 Sep 2016 10:46:19 +0800
-Subject: [PATCH] tdb: Add configure options for packages
+From 24911f36bcb00412e5dc4cd11fda139e09d58798 Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Tue, 1 Aug 2017 03:12:09 +0900
+Subject: [PATCH] From 10ac5e5fdda44adcc2a159b6f9a2d51a51361057 Mon Sep 17
+ 00:00:00 2001 From: Jackie Huang <jackie.huang@windriver.com> Date: Wed, 21
+ Sep 2016 10:46:19 +0800 Subject: [PATCH] tdb: Add configure options for
+ packages
 
 Add configure options for the following packages:
  - acl
@@ -14,6 +17,10 @@ Add configure options for the following packages:
 Upstream-Status: Inappropriate [oe deterministic build specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Update for libtdb_1.3.14.
+
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 ---
  lib/replace/system/wscript_configure |  6 ++-
  lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++--------
@@ -37,7 +44,7 @@ index 2035474..10f9ae7 100644
  
  # solaris varients of getXXent_r
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 145300d..310048c 100644
+index 7c50e1d..15df5c3 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -23,6 +23,41 @@ def set_options(opt):
@@ -124,7 +131,7 @@ index 145300d..310048c 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -248,17 +298,18 @@ def configure(conf):
+@@ -251,17 +301,18 @@ def configure(conf):
  
      conf.CHECK_FUNCS('prctl dirname basename')
  
@@ -155,23 +162,23 @@ index 145300d..310048c 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 50b2286..748eef1 100644
+index 1c9655a..8c20d3b 100644
 --- a/wscript
 +++ b/wscript
-@@ -64,7 +64,12 @@ def set_options(opt):
-         opt.add_option('--disable-python',
-                        help=("disable the pytdb module"),
-                        action="store_true", dest='disable_python', default=False)
+@@ -62,7 +62,12 @@ def set_options(opt):
+                    help=("Disable the use of pthread robust mutexes"),
+                    action="store_true", dest='disable_tdb_mutex_locking',
+                    default=False)
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
      conf.env.disable_tdb_mutex_locking = getattr(Options.options,
 -- 
-2.8.3
+2.7.4
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
similarity index 91%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
index e256ac9..ccc4ee4 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://tdb-Add-configure-options-for-packages.patch \
 "
 
-SRC_URI[md5sum] = "d9627e7aacd535a8251401f914bb6924"
-SRC_URI[sha256sum] = "60134e32253cac8e2efe5e0185d20123c208bcf6ad15edf2f50d80daadf8c348"
+SRC_URI[md5sum] = "dd23f2ba8ca2bfdcb833bc79d5b5ac6f"
+SRC_URI[sha256sum] = "3a7d4bb79229460df530c7e1c7067ba9fb9d370aa61fff537fdc2bdf918acbe9"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.7.4




