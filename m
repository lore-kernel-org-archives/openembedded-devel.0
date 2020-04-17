Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1950.1587133347074417042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 07:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03HEM69S023117
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2020 07:22:16 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 07:21:55 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 7D26D900097;
 Fri, 17 Apr 2020 07:21:55 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH v3 2/2] apache2: add patch ensuring destdir is empty string
Date: Fri, 17 Apr 2020 07:21:55 -0700
Message-ID: <20200417142155.62749-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417142155.62749-1-trevor.gamblin@windriver.com>
References: <20200417142155.62749-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

apache2 added cross-compilation support after 2.4.41, but
this conflicts with our own cross-compilation setup and causes
related recipes like apache-websocket to fail to find config
files (due to incorrect file paths) during build:

| cannot open
/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot//usr/share/apache2/build/config_vars.mk:
No such file or directory at
/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/usr/bin/crossscripts/apxs
line 213.

Add this patch to ensure that the $destdir
variable used in apache2's cross-compilation scheme is always
the empty string so that apache-websocket can find the right
files.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ....in-force-destdir-to-be-empty-string.patch | 49 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.43.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch
new file mode 100644
index 000000000..bdedd146c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch
@@ -0,0 +1,49 @@
+From 705c0a7e9d9c1e64ee09fc0b54f6b5a4e27de1ca Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Fri, 17 Apr 2020 06:31:35 -0700
+Subject: [PATCH] support/apxs.in: force destdir to be empty string
+
+If destdir is assigned to anything other than the empty string, the 
+search path for apache2 config files is appended to itself, and 
+related packages like apache-websocket will be unable to locate them:
+
+| cannot open
+/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot//usr/share/apache2/build/config_vars.mk:
+No such file or directory at
+/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/usr/bin/crossscripts/apxs
+line 213.
+
+Ensure that it is always the empty string so that apache-websocket
+is able to find the required config files.
+
+Upstream-Status: Inappropriate (embedded-specific)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ support/apxs.in | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/support/apxs.in b/support/apxs.in
+index 65e1288527..9d96e33728 100644
+--- a/support/apxs.in
++++ b/support/apxs.in
+@@ -28,10 +28,12 @@ package apxs;
+ #   is the empty string.
+ 
+ my $destdir = "";
+-my $ddi = rindex($0, "@exp_bindir@");
+-if ($ddi >= 0) {
+-  $destdir = substr($0, 0, $ddi);
+-}
++# Comment out assignment of destdir so that it doesn't affect bitbake
++# cross-compilation setup
++#my $ddi = rindex($0, "@exp_bindir@");
++#if ($ddi >= 0) {
++#  $destdir = substr($0, 0, $ddi);
++#}
+ 
+ my %config_vars = ();
+ 
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index 2fff153fc..520011152 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -14,6 +14,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://apache-configure_perlbin.patch \
+           file://0001-support-apxs.in-force-destdir-to-be-empty-string.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.17.1

