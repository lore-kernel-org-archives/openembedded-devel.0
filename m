Return-Path: <Jian.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEF576FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:35:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K9ZoA0016823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:35:50 -0800
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.169) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jan 2016 01:35:49 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:36:46 +0800
Message-ID: <1453282606-22375-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] phpmyadmin: CVE-2015-8669
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
X-List-Received-Date: Wed, 20 Jan 2016 09:35:55 -0000
Content-Type: text/plain

libraries/config/messages.inc.php in phpMyAdmin 4.0.x before 4.0.10.12,
4.4.x before 4.4.15.2, and 4.5.x before 4.5.3.1 allows remote attackers
to obtain sensitive information via a crafted request, which reveals
the full path in an error message.

This patch is from https://github.com/phpmyadmin/phpmyadmin/commit/c4d649325b25139d7c097e56e2e46cc7187fae45

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 .../phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch | 16 ++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb         |  4 +++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch
new file mode 100644
index 0000000..c19996f
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch
@@ -0,0 +1,18 @@
+[Security] Path disclosure, see PMASA-2015-6
+
+Upstream-Status: Bacport
+
+Signed-off-by: Marc Delisle <marc@infomarc.info>
+
+diff -Nur phpMyAdmin-4.5.0.2-all-languages.orig/libraries/config/messages.inc.php phpMyAdmin-4.5.0.2-all-languages/libraries/config/messages.inc.php
+--- phpMyAdmin-4.5.0.2-all-languages.orig/libraries/config/messages.inc.php	2016-01-20 15:11:15.410106888 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/libraries/config/messages.inc.php	2016-01-20 15:14:05.758108076 +0800
+@@ -11,7 +11,7 @@
+  */
+ 
+ if (!function_exists('__')) {
+-    PMA_fatalError('Bad invocation!');
++    exit();
+ }
+ 
+ $strConfigAllowArbitraryServer_desc = __(
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
index 9297d0c..b8faf12 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/4.5.0.2/phpMyAdmin-4.5.0.2-all-languages.tar.xz \
            file://Port-content-spoofing-fix-CVE-2015-7873.patch \
-           file://apache.conf"
+           file://apache.conf \
+           file://phpmyadmin-CVE-2015-8669.patch \
+"
 
 SRC_URI[md5sum] = "2d08d2fcc8f70f88a11a14723e3ca275"
 SRC_URI[sha256sum] = "d2e90ea486d90b4ebe5eb02d7ad349ad2916c12a8981f98553395ef78d22a8ec"
-- 
1.9.1


