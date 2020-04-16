Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5818.1587043007822079995
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 06:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03GDGPu6016806
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 06:16:36 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Apr 2020
 06:16:15 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 2D06D900DAC;
 Thu, 16 Apr 2020 06:16:15 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH v2 2/2] apache2: add patch reverting apxs.in destdir additions
Date: Thu, 16 Apr 2020 06:16:15 -0700
Message-ID: <20200416131615.164341-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200416131615.164341-1-trevor.gamblin@windriver.com>
References: <20200416131615.164341-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

apache2 added support for cross-compilation after 2.4.41, but this
conflicts with bitbake's cross-compilation, causing recipes like
apache-websocket to look for modules in the wrong place (note the
repeat of the recipe-sysroot path):

| cannot open
/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0
.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot//usr/share/apache2/build/config_vars.mk:
No such file or directory at /ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/usr/bin/crossscripts/apxs line 213.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...-apxs.in-remove-destdir-changes-in-2.4.43.patch | 92 ++++++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.43.bb        |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-apxs.in-remove-destdir-changes-in-2.4.43.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-apxs.in-remove-destdir-changes-in-2.4.43.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-apxs.in-remove-destdir-changes-in-2.4.43.patch
new file mode 100644
index 000000000..b396cf84e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-apxs.in-remove-destdir-changes-in-2.4.43.patch
@@ -0,0 +1,92 @@
+From fb0975d7b9150aa224a21093d62da320a0a3b368 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Wed, 15 Apr 2020 12:35:54 -0700
+Subject: [PATCH] apxs.in: remove destdir changes in 2.4.43
+
+apache2 added support for cross-compilation, but this conflicts with
+bitbake's cross-compilation, causing recipes like apache-websocket to
+look for modules in the wrong place:
+
+| cannot open /ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot/ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0
+.1.1+gitAUTOINC+6968083264-r0/recipe-sysroot//usr/share/apache2/build/config_vars.mk: No such file or directory at /ala-lpggp31/tgamblin/yocto/poky.git/build/tmp/work/core2-64-poky-linux/apache-websocket/0.1.1+gitAUTOINC+6968083264-r0/rec
+ipe-sysroot/usr/bin/crossscripts/apxs line 213.
+
+This patch removes those changes from support/apxs.in so that the
+build system behaves as it did before the upgrade.
+
+Upstream-Status: Inappopriate (embedded-specific)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ support/apxs.in | 22 ++++++----------------
+ 1 file changed, 6 insertions(+), 16 deletions(-)
+
+diff --git a/support/apxs.in b/support/apxs.in
+index 65e1288527..6ba0bf0e75 100644
+--- a/support/apxs.in
++++ b/support/apxs.in
+@@ -23,20 +23,10 @@ package apxs;
+ ##  Configuration
+ ##
+ 
+-#   are we building in a cross compile environment? If so, destdir contains
+-#   the base directory of the cross compiled environment, otherwise destdir
+-#   is the empty string.
+-
+-my $destdir = "";
+-my $ddi = rindex($0, "@exp_bindir@");
+-if ($ddi >= 0) {
+-  $destdir = substr($0, 0, $ddi);
+-}
+-
+ my %config_vars = ();
+ 
+ my $installbuilddir = "@exp_installbuilddir@";
+-get_config_vars($destdir . "$installbuilddir/config_vars.mk",\%config_vars);
++get_config_vars("$installbuilddir/config_vars.mk",\%config_vars);
+ 
+ # read the configuration variables once
+ 
+@@ -51,10 +41,10 @@ my $CFG_CFLAGS     = join ' ', map { get_vars($_) }
+   qw(SHLTCFLAGS CFLAGS NOTEST_CPPFLAGS EXTRA_CPPFLAGS EXTRA_CFLAGS);
+ my $CFG_LDFLAGS    = join ' ', map { get_vars($_) }
+   qw(LDFLAGS NOTEST_LDFLAGS SH_LDFLAGS);
+-my $includedir     = $destdir . get_vars("includedir");
++my $includedir     = get_vars("includedir");
+ my $CFG_INCLUDEDIR = eval qq("$includedir");
+ my $CFG_CC         = get_vars("CC");
+-my $libexecdir     = $destdir . get_vars("libexecdir");
++my $libexecdir     = get_vars("libexecdir");
+ my $CFG_LIBEXECDIR = eval qq("$libexecdir");
+ my $sbindir        = get_vars("sbindir");
+ my $CFG_SBINDIR    = eval qq("$sbindir");
+@@ -350,7 +340,7 @@ if ($opt_q) {
+     }
+ }
+ 
+-my $apr_config = $destdir . get_vars("APR_CONFIG");
++my $apr_config = get_vars("APR_CONFIG");
+ 
+ if (! -x "$apr_config") {
+     error("$apr_config not found!");
+@@ -361,7 +351,7 @@ my $apr_major_version = (split /\./, `$apr_config --version`)[0];
+ 
+ my $apu_config = "";
+ if ($apr_major_version < 2) {
+-    $apu_config = $destdir . get_vars("APU_CONFIG");
++    $apu_config = get_vars("APU_CONFIG");
+ 
+     if (! -x "$apu_config") {
+         error("$apu_config not found!");
+@@ -516,7 +506,7 @@ if ($opt_i or $opt_e) {
+         #  use .so unambigiously for installed shared library modules
+         $t =~ s|\.[^./\\]+$|\.so|;
+         if ($opt_i) {
+-	    push(@cmds, $destdir . "$installbuilddir/instdso.sh SH_LIBTOOL='" .
++	    push(@cmds, "$installbuilddir/instdso.sh SH_LIBTOOL='" .
+                  "$libtool' $f $CFG_LIBEXECDIR");
+ 	    push(@cmds, "chmod 755 $CFG_LIBEXECDIR/$t");
+         }
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index 2fff153fc..161e2a273 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -14,6 +14,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://apache-configure_perlbin.patch \
+           file://0001-apxs.in-remove-destdir-changes-in-2.4.43.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.13.3

