Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6691377325
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 09:47:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAE9lw9c007580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 01:47:58 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 14 Nov 2015 01:47:57 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Nov 2015 04:47:56 -0500
Message-ID: <1447494476-86454-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] phpmyadmin: fix CVE-2015-7873
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
X-List-Received-Date: Sat, 14 Nov 2015 09:48:01 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The redirection feature in url.php in phpMyAdmin 4.4.x before 4.4.15.1
and 4.5.x before 4.5.1 allows remote attackers to spoof content via the
url parameter.

Backport upstream commit to fix it:
https://github.com/phpmyadmin/phpmyadmin/commit/cd097656758f981f80fb9029c7d6b4294582b706

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../Port-content-spoofing-fix-CVE-2015-7873.patch  | 48 ++++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch
new file mode 100644
index 0000000..1e6bcbd
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch
@@ -0,0 +1,48 @@
+From ae7eae1cc88cbdf2d27a6f10f097ef731823689e Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Sat, 14 Nov 2015 02:01:54 -0500
+Subject: [PATCH] Port content spoofing fix
+
+Backport upstream commit for fixing CVE-2015-7873:
+  https://github.com/phpmyadmin/phpmyadmin/commit/cd097656758f981f80fb9029c7d6b4294582b706
+
+Upstream-Status: Backport
+
+Signed-off-by: Marc Delisle <marc@infomarc.info>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ ChangeLog | 4 ++++
+ url.php   | 3 ++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 4cb6708..96936c8 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -107,6 +107,10 @@ phpMyAdmin - ChangeLog
+ - issue #11448 Clarify doc about the MemoryLimit directive
+ - issue #11489 Cannot copy a database under certain conditions
+ 
++4.4.15.1 (2015-10-23)
++- issue #11464 phpMyAdmin suggests upgrading to newer version not usable on that system
++- issue [security] Content spoofing on url.php
++
+ 4.4.15.0 (not yet released)
+ - issue #11411 Undefined "replace" function on numeric scalar
+ - issue #11421 Stored-proc / routine - broken parameter parsing
+diff --git a/url.php b/url.php
+index eec78a5..9c4c884 100644
+--- a/url.php
++++ b/url.php
+@@ -32,6 +32,7 @@ if (! PMA_isValid($_REQUEST['url'])
+             }
+         </script>";
+     // Display redirecting msg on screen.
+-    printf(__('Taking you to %s.'), htmlspecialchars($_REQUEST['url']));
++    // Do not display the value of $_REQUEST['url'] to avoid showing injected content
++    echo __('Taking you to the target site.');
+ }
+ die();
+-- 
+1.9.1
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
index e28b66a..9297d0c 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/4.5.0.2/phpMyAdmin-4.5.0.2-all-languages.tar.xz \
+           file://Port-content-spoofing-fix-CVE-2015-7873.patch \
            file://apache.conf"
 
 SRC_URI[md5sum] = "2d08d2fcc8f70f88a11a14723e3ca275"
-- 
1.9.1


