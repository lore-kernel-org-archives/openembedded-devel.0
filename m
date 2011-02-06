Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PmApF-0007mF-7m
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 21:03:13 +0100
Received: by wwi17 with SMTP id 17so3887179wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 12:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=DvXohyRMA+uXMbnCTiHnpen/0JhXbt0IgIsI5Uo/Jwg=;
	b=Go+YVZDRMo0e5D5Daf0LeRRPkIMcXsNwH3dwCoktL0bAxvWaYg6Qhks0l9BwkHCYh8
	8i46Kz9nlfXvBZQVwJOA4/ynWj8glqsogIeT8hFjEPqmfMF0c+7ojSGUBUDvRPWcflZp
	bVAkK/pT24ckyrw7OOFuT3xvarzCxXVFLg8+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=AVY7BKBnSuSEwL+KE7FbgA8k+TfMXYgCaKcwApyf1Ho9DcBFHrsTtH00R40a8v/Mzd
	XUZsH1A+Yau+IY7+73kIIj4qIitkC6ib+2s+6zm9lQo525TJwdTLjqjAZ4apAa6PCKsz
	sxBrLm/I+ZvEairlrE8wLlMlT4YBValK8Yxhk=
Received: by 10.216.2.68 with SMTP id 46mr12836167wee.71.1297022532596;
	Sun, 06 Feb 2011 12:02:12 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id n78sm1753631weq.3.2011.02.06.12.02.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 12:02:11 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 21:01:59 +0100
Message-Id: <1297022519-19696-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] update-alternatives-dpkg: make it work.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Feb 2011 20:03:13 -0000

Previous version of the recipe provided a non-functional version
of update-alternatives.

  * move from 1.13.25 to 1.14.29
    1.13.25 needed dpkg-gettext.pl which is not contained by
    dpkg-1.14.29.

  * patching the native one with update-alternatives-native.patch
    - remove absolute perl path from the shebang
    - handle a mix of build host and target host paths
    - patch contains a piece from the previous paths.patch

  * moved paths.patch application from the main inc file to 1.13.25
    recipes

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 .../update-alternatives-native.patch               |  233 ++++++++++++++++++++
 .../update-alternatives-dpkg-native_1.13.25.bb     |    2 +
 .../update-alternatives-dpkg-native_1.14.29.bb     |   19 ++
 .../update-alternatives-dpkg.inc                   |    1 -
 .../update-alternatives-dpkg_1.13.25.bb            |    2 +
 .../update-alternatives-dpkg_1.14.29.bb            |   15 ++
 6 files changed, 271 insertions(+), 1 deletions(-)
 create mode 100644 recipes/update-alternatives/update-alternatives-dpkg-1.14.29/update-alternatives-native.patch
 create mode 100644 recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb
 create mode 100644 recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb

diff --git a/recipes/update-alternatives/update-alternatives-dpkg-1.14.29/update-alternatives-native.patch b/recipes/update-alternatives/update-alternatives-dpkg-1.14.29/update-alternatives-native.patch
new file mode 100644
index 0000000..8b85d5f
--- /dev/null
+++ b/recipes/update-alternatives/update-alternatives-dpkg-1.14.29/update-alternatives-native.patch
@@ -0,0 +1,233 @@
+--- dpkg-1.14.29.orig/scripts/update-alternatives.pl	2010-03-08 21:27:35.000000000 +0100
++++ dpkg-1.14.29/scripts/update-alternatives.pl	2011-02-06 20:20:19.000000000 +0100
+@@ -1,4 +1,4 @@
+-#!/usr/bin/perl --
++#!/usr/bin/env perl
+ 
+ BEGIN { # Work-around for bug #479711 in perl
+     $ENV{PERL_DL_NONLAZY} = 1;
+@@ -16,6 +16,7 @@
+ # Global variables:
+ 
+ my $altdir = '/etc/alternatives';
++my $naltdir = $ENV{D} . $altdir;
+ # FIXME: this should not override the previous assignment.
+ $admindir = $admindir . '/alternatives';
+ 
+@@ -43,6 +44,7 @@
+ my $alink;            # Alternative we are managing (ie the symlink we're making/removing) (install only)
+ my $name;             # Name of the alternative (the symlink) we are processing
+ my $apath;            # Path of alternative we are offering
++my $napath;           # Native path of alternative we are offering
+ my $apriority;        # Priority of link (only when we are installing an alternative)
+ my %aslavelink;
+ my %aslavepath;
+@@ -190,7 +192,7 @@
+ sub display_link_group
+ {
+     pr(sprintf(_g("%s - status is %s."), $name, $mode));
+-    $linkname = readlink("$altdir/$name");
++    $linkname = readlink("$naltdir/$name");
+ 
+     if (defined($linkname)) {
+ 	pr(sprintf(_g(" link currently points to %s"), $linkname));
+@@ -226,25 +228,26 @@
+ sub checked_alternative($$$)
+ {
+     my ($name, $link, $path) = @_;
++    my $nlink = $ENV{D} . $link;
+ 
+-    $linkname = readlink($link);
++    $linkname = readlink($nlink);
+     if (!defined($linkname) && $! != ENOENT) {
+ 	pr(sprintf(_g("warning: %s is supposed to be a symlink to %s, \n".
+ 	              "or nonexistent; however, readlink failed: %s"),
+-	           $link, "$altdir/$name", $!))
++	           $nlink, "$altdir/$name", $!))
+ 	    if $verbosemode > 0;
+     } elsif (!defined($linkname) ||
+             (defined($linkname) && $linkname ne "$altdir/$name")) {
+-	checked_rm("$link.dpkg-tmp");
+-	checked_symlink("$altdir/$name", "$link.dpkg-tmp");
+-	checked_mv("$link.dpkg-tmp", $link);
++	checked_rm("$nlink.dpkg-tmp");
++	checked_symlink("$altdir/$name", "$nlink.dpkg-tmp");
++	checked_mv("$nlink.dpkg-tmp", $nlink);
+     }
+-    $linkname = readlink("$altdir/$name");
++    $linkname = readlink("$naltdir/$name");
+     if (defined($linkname) && $linkname eq $path) {
+-	pr(sprintf(_g("Leaving %s (%s) pointing to %s."), $name, $link, $path))
++	pr(sprintf(_g("Leaving %s (%s) pointing to %s."), $name, $nlink, $path))
+ 	    if $verbosemode > 0;
+     } else {
+-	pr(sprintf(_g("Updating %s (%s) to point to %s."), $name, $link, $path))
++	pr(sprintf(_g("Updating %s (%s) to point to %s."), $name, $nlink, $path))
+ 	    if $verbosemode > 0;
+     }
+ }
+@@ -254,8 +257,8 @@
+     my ($spath, $preferred) = (@_);
+ 
+     printf STDOUT _g("Using '%s' to provide '%s'.") . "\n", $spath, $name;
+-    checked_symlink("$spath","$altdir/$name.dpkg-tmp");
+-    checked_mv("$altdir/$name.dpkg-tmp", "$altdir/$name");
++    checked_symlink("$spath","$naltdir/$name.dpkg-tmp");
++    checked_mv("$naltdir/$name.dpkg-tmp", "$naltdir/$name");
+ 
+     # Link slaves...
+     for (my $slnum = 0; $slnum < @slavenames; $slnum++) {
+@@ -264,13 +267,13 @@
+ 	    checked_alternative($slave, $slavelinks[$slnum],
+ 	                  $slavepath{$preferred, $slnum});
+ 	    checked_symlink($slavepath{$preferred, $slnum},
+-	                    "$altdir/$slave.dpkg-tmp");
+-	    checked_mv("$altdir/$slave.dpkg-tmp", "$altdir/$slave");
++	                    "$naltdir/$slave.dpkg-tmp");
++	    checked_mv("$naltdir/$slave.dpkg-tmp", "$naltdir/$slave");
+ 	} else {
+ 	    pr(sprintf(_g("Removing %s (%s), not appropriate with %s."), $slave,
+ 	               $slavelinks[$slnum], $versions[$preferred]))
+ 	        if $verbosemode > 0;
+-	    checked_rm("$altdir/$slave");
++	    checked_rm("$naltdir/$slave");
+ 	}
+     }
+ }
+@@ -311,6 +314,14 @@
+ 	check_many_actions();
+         @ARGV >= 4 || &badusage(_g("--install needs <link> <name> <path> <priority>"));
+         ($alink,$name,$apath,$apriority,@ARGV) = @ARGV;
++	$napath = $ENV{'D'} . $apath;
++	if (! -e $napath) {
++		$apath = substr($alink, 0, rindex($alink, "/") + 1) . $apath;
++		$napath = $ENV{'D'} . $apath;
++	}
++	if (! -e $napath) {
++		&quit(sprintf(_g("Error: file not found: %s"), $napath));
++	}
+         $apriority =~ m/^[-+]?\d+/ || &badusage(_g("priority must be an integer"));
+ 	$action = 'install';
+     } elsif (m/^--(remove|set)$/) {
+@@ -390,10 +401,10 @@
+     set_alternatives($name);
+ }
+ 
+-if (defined($linkname= readlink("$altdir/$name"))) {
++if (defined($linkname= readlink("$naltdir/$name"))) {
+     if ($linkname eq $best) {
+         $state= 'expected';
+-    } elsif (defined(readlink("$altdir/$name.dpkg-tmp"))) {
++    } elsif (defined(readlink("$naltdir/$name.dpkg-tmp"))) {
+         $state= 'expected-inprogress';
+     } else {
+         $state= 'unexpected';
+@@ -413,8 +424,8 @@
+ if ($action eq 'auto') {
+     &pr(sprintf(_g("Setting up automatic selection of %s."), $name))
+       if $verbosemode > 0;
+-    checked_rm("$altdir/$name.dpkg-tmp");
+-    checked_rm("$altdir/$name");
++    checked_rm("$naltdir/$name.dpkg-tmp");
++    checked_rm("$naltdir/$name");
+     $state= 'nonexistent';
+     $mode = 'auto';
+ }
+@@ -426,7 +437,7 @@
+ 
+ if ($state eq 'unexpected' && $mode eq 'auto') {
+     &pr(sprintf(_g("%s has been changed (manually or by a script).\n".
+-                   "Switching to manual updates only."), "$altdir/$name"))
++                   "Switching to manual updates only."), "$naltdir/$name"))
+       if $verbosemode > 0;
+     $mode = 'manual';
+ }
+@@ -438,7 +449,7 @@
+ # state=unexpected => mode=manual
+ 
+ &pr(sprintf(_g("Checking available versions of %s, updating links in %s ...\n".
+-    "(You may modify the symlinks there yourself if desired - see \`man ln'.)"), $name, $altdir))
++    "(You may modify the symlinks there yourself if desired - see \`man ln'.)"), $name, $naltdir))
+   if $verbosemode > 0;
+ 
+ if ($action eq 'install') {
+@@ -527,7 +538,7 @@
+     if ($i > $#versions) {
+         &pr(sprintf(_g("Discarding obsolete slave link %s (%s)."), $slavenames[$j], $slavelinks[$j]))
+           if $verbosemode > 0;
+-        checked_rm("$altdir/$slavenames[$j]");
++        checked_rm("$naltdir/$slavenames[$j]");
+         checked_rm($slavelinks[$j]);
+         my $k = $#slavenames;
+         $slavenum{$slavenames[$k]}= $j;
+@@ -544,14 +555,14 @@
+ }
+         
+ if ($mode eq 'manual') {
+-    &pr(sprintf(_g("Automatic updates of %s are disabled, leaving it alone."), "$altdir/$name"))
++    &pr(sprintf(_g("Automatic updates of %s are disabled, leaving it alone."), "$naltdir/$name"))
+       if $verbosemode > 0;
+     &pr(sprintf(_g("To return to automatic updates use \`update-alternatives --auto %s'."), $name))
+       if $verbosemode > 0;
+ } else {
+     if ($state eq 'expected-inprogress') {
+         &pr(sprintf(_g("Recovering from previous failed update of %s ..."), $name));
+-	checked_mv("$altdir/$name.dpkg-tmp", "$altdir/$name");
++	checked_mv("$naltdir/$name.dpkg-tmp", "$naltdir/$name");
+         $state= 'expected';
+     }
+ }
+@@ -589,36 +600,36 @@
+     if ($best eq '') {
+         &pr(sprintf(_g("Last package providing %s (%s) removed, deleting it."), $name, $link))
+           if $verbosemode > 0;
+-        checked_rm("$altdir/$name");
++        checked_rm("$naltdir/$name");
+         checked_rm("$link");
+         checked_rm("$admindir/$name.dpkg-new");
+         checked_rm("$admindir/$name");
+         exit(0);
+     } else {
+ 	checked_alternative($name, $link, $best);
+-        checked_rm("$altdir/$name.dpkg-tmp");
+-        symlink($best,"$altdir/$name.dpkg-tmp");
++        checked_rm("$naltdir/$name.dpkg-tmp");
++        symlink($best,"$naltdir/$name.dpkg-tmp");
+     }
+ }
+ 
+ checked_mv("$admindir/$name.dpkg-new", "$admindir/$name");
+ 
+ if ($mode eq 'auto') {
+-    checked_mv("$altdir/$name.dpkg-tmp", "$altdir/$name");
++    checked_mv("$naltdir/$name.dpkg-tmp", "$naltdir/$name");
+     for (my $j = 0; $j <= $#slavenames; $j++) {
+         $sname= $slavenames[$j];
+         $slink= $slavelinks[$j];
+         $spath= $slavepath{$bestnum,$j};
+-        checked_rm("$altdir/$sname.dpkg-tmp");
++        checked_rm("$naltdir/$sname.dpkg-tmp");
+         if ($spath eq '') {
+             &pr(sprintf(_g("Removing %s (%s), not appropriate with %s."), $sname, $slink, $best))
+               if $verbosemode > 0;
+-            checked_rm("$altdir/$sname");
++            checked_rm("$naltdir/$sname");
+             checked_rm("$slink");
+         } else {
+ 	    checked_alternative($sname, $slink, $spath);
+-	    checked_symlink("$spath", "$altdir/$sname.dpkg-tmp");
+-	    checked_mv("$altdir/$sname.dpkg-tmp", "$altdir/$sname");
++	    checked_symlink("$spath", "$naltdir/$sname.dpkg-tmp");
++	    checked_mv("$naltdir/$sname.dpkg-tmp", "$naltdir/$sname");
+         }
+     }
+ }
+@@ -643,7 +654,7 @@
+                   $#versions+1, $name);
+     for (my $i = 0; $i <= $#versions; $i++) {
+ 	printf(STDOUT "%s%s %8s    %s\n",
+-	    (readlink("$altdir/$name") eq $versions[$i]) ? '*' : ' ',
++	    (readlink("$naltdir/$name") eq $versions[$i]) ? '*' : ' ',
+ 	    ($best eq $versions[$i]) ? '+' : ' ',
+ 	    $i+1, $versions[$i]);
+     }
diff --git a/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb b/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb
index b28d49a..0edb7ae 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb
+++ b/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb
@@ -5,6 +5,8 @@ PROVIDES += "virtual/update-alternatives-native"
 DEPENDS = "perl-native"
 DEFAULT_PREFERENCE = "-1"
 
+SRC_URI += "file://paths.patch"
+
 do_stage () {
     install -d ${sbindir} \
                ${localstatedir}/dpkg/alternatives \
diff --git a/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb b/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb
new file mode 100644
index 0000000..388988d
--- /dev/null
+++ b/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb
@@ -0,0 +1,19 @@
+require update-alternatives-dpkg.inc
+inherit native
+
+PROVIDES += "virtual/update-alternatives-native"
+DEPENDS = "perl-native"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI += "file://update-alternatives-native.patch"
+
+do_stage () {
+    install -d ${sbindir} \
+               ${localstatedir}/dpkg/alternatives \
+               ${sysconfdir}/alternatives
+
+    install -m 0755 scripts/update-alternatives ${sbindir}/update-alternatives
+}
+
+SRC_URI[md5sum] = "4326172a959b5b6484b4bc126e9f628d"
+SRC_URI[sha256sum] = "ea7ec1c861af43ba534a0d7997774a5f1fd4e25a7eea4ff229c9c7bf89aed633"
diff --git a/recipes/update-alternatives/update-alternatives-dpkg.inc b/recipes/update-alternatives/update-alternatives-dpkg.inc
index e7bd90d..00b8724 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg.inc
+++ b/recipes/update-alternatives/update-alternatives-dpkg.inc
@@ -4,7 +4,6 @@ SRC_URI += "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz"
 S = "${WORKDIR}/dpkg-${PV}"
 PACKAGE_ARCH = "all"
 
-SRC_URI += "file://paths.patch"
 
 do_patch_append () {
 	import shutil
diff --git a/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb b/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb
index 2b48eca..fc8701a 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb
+++ b/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb
@@ -3,6 +3,8 @@ require update-alternatives-dpkg.inc
 RPROVIDES_${PN} = "update-alternatives"
 RDEPENDS_${PN} = "perl dpkg"
 
+SRC_URI += "file://paths.patch"
+
 do_install () {
     install -d ${D}${sbindir} \
                ${D}${localstatedir}/dpkg/alternatives \
diff --git a/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb b/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb
new file mode 100644
index 0000000..4ad681e
--- /dev/null
+++ b/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb
@@ -0,0 +1,15 @@
+require update-alternatives-dpkg.inc
+
+RPROVIDES_${PN} = "update-alternatives"
+RDEPENDS_${PN} = "perl dpkg"
+
+do_install () {
+    install -d ${D}${sbindir} \
+               ${D}${localstatedir}/dpkg/alternatives \
+               ${D}${sysconfdir}/alternatives
+
+    install -m 0755 scripts/update-alternatives ${D}${sbindir}/update-alternatives
+}
+
+SRC_URI[md5sum] = "4326172a959b5b6484b4bc126e9f628d"
+SRC_URI[sha256sum] = "ea7ec1c861af43ba534a0d7997774a5f1fd4e25a7eea4ff229c9c7bf89aed633"
-- 
1.7.1



