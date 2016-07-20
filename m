Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99215606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 08:45:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6K8jnlH021826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 01:45:52 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jul 2016 01:45:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Jul 2016 04:45:46 -0400
Message-ID: <1469004346-253034-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade to 4.6.3
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
X-List-Received-Date: Wed, 20 Jul 2016 08:45:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Compatible with PHP 5.5 to 7.0 and MySQL 5.5 and newer.

* Release notes: http://www.phpmyadmin.net/files/4.6.3/

* Drop two CVE patches which have been fixed:
  CVE-2015-7873 and CVE-2015-8669

* Use PV in SRC_URI instead of hardcoded version number.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../Port-content-spoofing-fix-CVE-2015-7873.patch  | 48 ----------------------
 .../phpmyadmin/phpmyadmin-CVE-2015-8669.patch      | 18 --------
 .../{phpmyadmin_4.5.0.2.bb => phpmyadmin_4.6.3.bb} |  8 ++--
 3 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.5.0.2.bb => phpmyadmin_4.6.3.bb} (75%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch
deleted file mode 100644
index 1e6bcbd..0000000
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ae7eae1cc88cbdf2d27a6f10f097ef731823689e Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Sat, 14 Nov 2015 02:01:54 -0500
-Subject: [PATCH] Port content spoofing fix
-
-Backport upstream commit for fixing CVE-2015-7873:
-  https://github.com/phpmyadmin/phpmyadmin/commit/cd097656758f981f80fb9029c7d6b4294582b706
-
-Upstream-Status: Backport
-
-Signed-off-by: Marc Delisle <marc@infomarc.info>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- ChangeLog | 4 ++++
- url.php   | 3 ++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 4cb6708..96936c8 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -107,6 +107,10 @@ phpMyAdmin - ChangeLog
- - issue #11448 Clarify doc about the MemoryLimit directive
- - issue #11489 Cannot copy a database under certain conditions
- 
-+4.4.15.1 (2015-10-23)
-+- issue #11464 phpMyAdmin suggests upgrading to newer version not usable on that system
-+- issue [security] Content spoofing on url.php
-+
- 4.4.15.0 (not yet released)
- - issue #11411 Undefined "replace" function on numeric scalar
- - issue #11421 Stored-proc / routine - broken parameter parsing
-diff --git a/url.php b/url.php
-index eec78a5..9c4c884 100644
---- a/url.php
-+++ b/url.php
-@@ -32,6 +32,7 @@ if (! PMA_isValid($_REQUEST['url'])
-             }
-         </script>";
-     // Display redirecting msg on screen.
--    printf(__('Taking you to %s.'), htmlspecialchars($_REQUEST['url']));
-+    // Do not display the value of $_REQUEST['url'] to avoid showing injected content
-+    echo __('Taking you to the target site.');
- }
- die();
--- 
-1.9.1
-
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch
deleted file mode 100644
index 65fff64..0000000
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-[Security] Path disclosure, see PMASA-2015-6
-
-Upstream-Status: Bacport
-
-Signed-off-by: Marc Delisle <marc@infomarc.info>
-
-diff -Nur phpMyAdmin-4.5.0.2-all-languages.orig/libraries/config/messages.inc.php phpMyAdmin-4.5.0.2-all-languages/libraries/config/messages.inc.php
---- phpMyAdmin-4.5.0.2-all-languages.orig/libraries/config/messages.inc.php	2016-01-20 15:11:15.410106888 +0800
-+++ phpMyAdmin-4.5.0.2-all-languages/libraries/config/messages.inc.php	2016-01-20 15:14:05.758108076 +0800
-@@ -11,7 +11,7 @@
-  */
- 
- if (!function_exists('__')) {
--    PMA_fatalError('Bad invocation!');
-+    exit();
- }
- 
- $strConfigAllowArbitraryServer_desc = __(
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.6.3.bb
similarity index 75%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.6.3.bb
index ac32185..61872ae 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.6.3.bb
@@ -5,14 +5,12 @@ LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
-SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/4.5.0.2/phpMyAdmin-4.5.0.2-all-languages.tar.xz \
-           file://Port-content-spoofing-fix-CVE-2015-7873.patch \
+SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf \
-           file://phpmyadmin-CVE-2015-8669.patch \
 "
 
-SRC_URI[md5sum] = "2d08d2fcc8f70f88a11a14723e3ca275"
-SRC_URI[sha256sum] = "d2e90ea486d90b4ebe5eb02d7ad349ad2916c12a8981f98553395ef78d22a8ec"
+SRC_URI[md5sum] = "53c7a6a577d10de04a5dd21a05018542"
+SRC_URI[sha256sum] = "943bad38a95f21bb015bdb78c9c067e0ea7510c1b35d4b8e757cb89c413e3bac"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.8.1


