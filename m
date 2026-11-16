Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22455.1794808934927859114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yaz5XiXu;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3791619605cso5964621eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808934; x=1795413734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wL5EqMM0dOK5YPUHiOhook/X09yLFdtMaRdZATwjLJc=;
        b=yaz5XiXuwwl+eKDcqHxxWiIPxa+oD5fiSkGN3p77cwfw6GaElUcshI3Dl6/1DyL+Bw
         8Hbagb0H6N1FCcWsUoZIeE2rOKNErH58+WS4fHP+ofg9iohBXV0kdQqkwSEQhKQCQX+/
         e+F/KwvfB/dRlPCjGJO5u9bn6Yh52Ovtp6tCcnmbGc0QvNrJd+nsSAx9vqmZUkRT9Fey
         +OTH4uMpbnC6bRXUARxtE9qP0sGxkgEeNcEp3dg89SL+exO3LPR0W6T1Di/4iqIiG9+S
         AhkEuTyh7Zq3QdSSo3h7nLYbLAthjP6DvEzPkrCFlf7489VIKe6HSFwjsfUHMRrTpyYl
         p/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808934; x=1795413734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wL5EqMM0dOK5YPUHiOhook/X09yLFdtMaRdZATwjLJc=;
        b=Htf17k4DuT96SZiEc9mrp4z4bjpvtlBDw7cf9h74hUkx8cghvV/kIfpicnnGR/gShH
         u2kKeCjHtqnxsUgKRKomzhBDxyTuRuLnZGBTt5YI9BIqdPOStHO7mnPAOvFcIRdX96XS
         y1uHaU+GI2OuF0Hitx5JkKgM5y0lV24GQSlSJ5QyIhaPifXiXIKby+HSFqU5VMIm/w1u
         4b50Sl40SWmQchV56aJtwNcMt93IRNItzGtt4b7VixBGHE7J2zcNDliR6Z5RyeXM7nfI
         aGq7ObqtLhkz6Eo8isgbUVyU35yAIhd5eV/gMJcTTqhCwzTfsmzphHguCxydl4HrxoJJ
         zKwQ==
X-Gm-Message-State: APuU4Z/JrSS6wCEWqo/7XsCj3VWtodJRnVbVO9iROa5qf9MG4AyPiehp
	oWBHljT5jfDqTcSTYVEF2AZl2BzaS4n0eWDO4uKoEnQzjQlWFS1uMGttTtke5idQ
X-Gm-Gg: AYBFou3U+xP5PvtN1g5boD61PPONcbOYr497zTsNvlf9RjGJe6KRoMTtoeE9v6rEiPa
	M5hG3mGvGFXSWrbWJw26uf/k4eluKd1Ua/2vw3dFxQ8rSH8Kj5iZILgOjH8FIqHjtioedAO8KAU
	GD8wZi1gL/Pr/U01FkrlS6NAR6k5f716NicN/Wmmpyr+N4nT3zo0/XlXoh/kVLpnV6m2O9hLa09
	dAHpsyJyhVq+2nXlUNO8BY63i26C/Q/nqvsELoZbKWXhpaT2gZMF0Aotazp1hKuAl3kVplh226/
	i8+uxwK8KixmnxtaiBAagPsHwTHZWLizHhvR3SW05VI7RkuA92PIVTP2hKuBu3y4yOS/jiSFL+p
	gboyRyhR+RlfgzIbHTt52EJApm7Nnko/eoBy89gUMyjyIm6xFGH/FbUxz9gMSHfBAcF8aLUKqrT
	MpEA1Xabyw8e0aSfhAo5JknBQMtM4pa80hZNXPAZZLfEtE7fMuPe6fxZjZBatv7M9RTeyGxJlUg
	Lb4llmK2Z5yUCIWXWxTi5UfV3lgPOCH1tmigZmpM5J6jQnsHsc3l6miEu2VhOAVY9qkF3ywxjc9
	rPxzOSvS7Z5peqfG35lhnuNg4EovYUfCPC8iaGi5Wx9id5kR1LPoNawJO9u1FGBA+Lgf4QfD5bw
	FlMKZmcjBfQ6PazN357MU8wbI/tRGziQvBnICsl7mB7zYzPC9td2KZ2nQf3PMDq7R1GPuP35Xq7
	U7oUjeGgJvB3U+BkDbB8t0hMk2OTeFgisKARUmRw1bAIkREnFB1wAc8djIZ3FUR5KhczSUUnOwx
	ZxfdfMkfQZwTAT686LuN8RNu2gkc6xWee65pC1JHaZEEeFnkiwJq0KDWv9C+RaJNUh73gzkbNa5
	r04eNP7fRKVrzg7VDaavIcye/A==
X-Received: by 2002:a05:7300:6da8:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-37965abb5bbmr12240432eec.9.1794808933903;
        Sun, 15 Nov 2026 22:02:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 02/30] adduser: upgrade 3.118 -> 3.159
Date: Sun, 15 Nov 2026 22:01:40 -0800
Message-ID: <20261116060209.2916444-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132400
Content-Type: text/plain; charset="utf-8"

The code is now split into several Debian::Adduser* modules, install all
of them, and substitute DVERSION instead of VERSION, which now also
appears in the module version checks. The tarball unpacks to work/.

Refresh both patches, the nologin one also covers the new default shell
uses in adduser and deluser. Update RDEPENDS for the modules the new
code loads, overloading is no longer used.

License-Update: debian/copyright is now machine readable. All files are
GPL-2+, as the old text already said, so correct LICENSE to
GPL-2.0-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{adduser_3.118.bb => adduser_3.159.bb}    | 24 +++++---
 ...-set-default-shell-with-sbin-nologin.patch | 59 ++++++++++++++-----
 .../adduser-add-M-option-for-useradd.patch    | 45 +++++++-------
 3 files changed, 80 insertions(+), 48 deletions(-)
 rename meta-perl/recipes-perl/adduser/{adduser_3.118.bb => adduser_3.159.bb} (72%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.159.bb
similarity index 72%
rename from meta-perl/recipes-perl/adduser/adduser_3.118.bb
rename to meta-perl/recipes-perl/adduser/adduser_3.159.bb
index 2fc03ecb94..ab2a143bef 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.159.bb
@@ -3,20 +3,20 @@ DESCRIPTION = "adduser, addgroup - add a user or group to the system"
 HOMEPAGE = "https://salsa.debian.org/debian/adduser"
 SECTION = "base/utils"
 
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=9e982a4577268e2f3982abceafde3067"
 
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${PV}/${BPN}_${PV}.tar.xz \
            file://adduser-add-M-option-for-useradd.patch \
            file://0001-adduser-set-default-shell-with-sbin-nologin.patch \
 "
 
-SRC_URI[sha256sum] = "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38ed417737ed3166ffc"
+SRC_URI[sha256sum] = "f732ec215661c4f1d36593493852d29fb5b17ebc4e7614730fea47dab2a888cd"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/adduser"
 UPSTREAM_CHECK_REGEX = "adduser_(?P<pver>\d+(\.\d+)+)"
 
-S = "${UNPACKDIR}/${BPN}"
+S = "${UNPACKDIR}/work"
 
 inherit cpan-base update-alternatives
 
@@ -25,8 +25,9 @@ do_install() {
     install -m 0755 ${S}/adduser ${D}${sbindir}
     install -m 0755 ${S}/deluser ${D}${sbindir}
 
-    install -D -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl5/${@get_perl_version(d)}/Debian/AdduserCommon.pm
-    sed -i -e "s/VERSION/${PV}/" ${D}${sbindir}/*
+    install -d ${D}${libdir}/perl5/${@get_perl_version(d)}/Debian
+    install -m 0644 ${S}/Adduser*.pm ${D}${libdir}/perl5/${@get_perl_version(d)}/Debian
+    sed -i -e "s/DVERSION/${PV}/" ${D}${sbindir}/*
 
     install -d ${D}/${sysconfdir}
     install -m 0644 ${S}/*.conf ${D}/${sysconfdir}
@@ -41,10 +42,17 @@ do_install() {
 
 RDEPENDS:${PN} += "\
     shadow \
-    perl-module-getopt-long \
-    perl-module-overloading \
+    perl-module-constant \
+    perl-module-encode \
+    perl-module-fcntl \
     perl-module-file-find \
     perl-module-file-temp \
+    perl-module-getopt-long \
+    perl-module-i18n-langinfo \
+    perl-module-parent \
+    perl-module-posix \
+    perl-module-utf8 \
+    perl-module-version \
 "
 
 ALTERNATIVE:${PN} = "adduser deluser addgroup delgroup"
diff --git a/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch b/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
index 91cc6bcba8..332613033a 100644
--- a/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
+++ b/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
@@ -1,4 +1,4 @@
-From 75e949bf80bf5e3e5bd8f81b258095e662b705c4 Mon Sep 17 00:00:00 2001
+From cf91c9420d2305ed585675811ac5528fe03c6464 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 9 Jan 2020 13:51:28 +0800
 Subject: [PATCH] adduser: set default shell with /sbin/nologin
@@ -13,22 +13,51 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- adduser | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ adduser | 6 +++---
+ deluser | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/adduser b/adduser
-index 0f24cc9..ab554d0 100755
+index e7cad37..62cbe72 100755
 --- a/adduser
 +++ b/adduser
-@@ -431,7 +431,7 @@ if ($action eq "addsysuser") {
-     printf gtx("Adding new user `%s' (UID %d) with group `%s' ...\n"),$new_name,$new_uid,$ingroup_name
- 	if $verbose;
-     $home_dir = $special_home || &homedir($new_name, $ingroup_name);
--    $shell = $special_shell || '/usr/sbin/nologin';
-+    $shell = $special_shell || '/sbin/nologin';
+@@ -729,7 +729,7 @@ if ($action eq "addsysuser") {
+     $home_dir = $special_home || $uid_pool{$new_name}{'home'} || '/nonexistent';
+     $no_create_home = $home_dir =~ /^\/+nonexistent(\/|$)/ ? 1 : $no_create_home;
+ 
+-    $shell = $special_shell || $uid_pool{$new_name}{'shell'} || '/usr/sbin/nologin';
++    $shell = $special_shell || $uid_pool{$new_name}{'shell'} || '/sbin/nologin';
      $undouser = $new_name;
-     my $useradd = &which('useradd');
-     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
--- 
-2.17.1
-
+ 
+     my $useradd = which('useradd');
+@@ -1002,7 +1002,7 @@ if ($action eq "adduser") {
+     if( !$disabled_login ) {
+         $shell = $special_shell || $uid_pool{$new_name}{'shell'} || $config{"dshell"};
+     } else {
+-        $shell = $special_shell || $uid_pool{$new_name}{'shell'} || "/usr/sbin/nologin";
++        $shell = $special_shell || $uid_pool{$new_name}{'shell'} || "/sbin/nologin";
+     }
+     log_debug( "creating new user %s with home_dir %s and shell %s", $new_name, $home_dir, $shell );
+     $undouser = $new_name;
+@@ -1298,7 +1298,7 @@ sub unlock_user {
+     my $ret = existing_user_status(\%config, $user_name, undef);
+     if ($ret & EXISTING_FOUND) {
+         if ($ret & EXISTING_LOCKED) {
+-            my $default_shell = $system ? "/usr/sbin/nologin" : "/bin/bash";
++            my $default_shell = $system ? "/sbin/nologin" : "/bin/bash";
+ 
+             # Get current shell state if available
+             my $shell = get_state_value($user_name, "shell") // $default_shell;
+diff --git a/deluser b/deluser
+index 4b2d430..5a85580 100755
+--- a/deluser
++++ b/deluser
+@@ -339,7 +339,7 @@ if($action eq "deluser") {
+         acquire_lock();
+         set_state_value($user, "shell", $egpwn_shell);
+         set_state_value($user, "locked", 1);
+-        my $lock_ret = &systemcall('usermod', "-e", 1, "-f", 0, "-L", "-s", "/usr/sbin/nologin", $user);
++        my $lock_ret = &systemcall('usermod', "-e", 1, "-f", 0, "-L", "-s", "/sbin/nologin", $user);
+         if( $lock_ret == 0 ) {
+             log_info( mtx("user `%s' successfully locked.\n", $user) );
+         } else {
diff --git a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch
index 2ecec512fb..9d0bcb0fa4 100644
--- a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch
+++ b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch
@@ -1,4 +1,4 @@
-From 55a0adfc416ad85dbc440eaa667d98c200a8ce62 Mon Sep 17 00:00:00 2001
+From 03c388835a10c67ca5ad5ec288a1a8b3e0c6fa40 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 18 Dec 2014 17:23:37 +0800
 Subject: [PATCH] adduser: add -M option for useradd
@@ -15,31 +15,26 @@ Upstream-Status: Submitted [1]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
- adduser | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ adduser | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/adduser b/adduser
-index a5f83f3..f6cb52c 100755
+index 9f195bc..e7cad37 100755
 --- a/adduser
 +++ b/adduser
-@@ -435,7 +435,7 @@ if ($action eq "addsysuser") {
-     $undouser = $new_name;
-     my $useradd = &which('useradd');
-     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
--		$shell, '-u', $new_uid, $new_name);
-+	        $shell, '-u', $new_uid, '-M', $new_name);
-     if(!$disabled_login) {
-         my $usermod = &which('usermod');
-         &systemcall($usermod, '-p', '*', $new_name);
-@@ -525,7 +525,7 @@ if ($action eq "adduser") {
-     $undouser = $new_name;
-     my $useradd = &which('useradd');
-     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
--		$shell, '-u', $new_uid, $new_name);
-+               $shell, '-u', $new_uid, '-M', $new_name);
-     &invalidate_nscd();
- 
-     create_homedir (1); # copy skeleton data
--- 
-1.8.5.2
-
+@@ -742,6 +742,7 @@ if ($action eq "addsysuser") {
+         '-g', $ingroup_name,
+         '-s', $shell,
+         '-u', $new_uid,
++        '-M',
+         $new_name);
+     if( $ua_ret == RET_INVALID_NAME_FROM_USERADD ) {
+         $returnvalue = RET_INVALID_NAME_FROM_USERADD;
+@@ -1012,6 +1013,7 @@ if ($action eq "adduser") {
+         '-g', $primary_gid,
+         '-s', $shell,
+         '-u', $new_uid,
++        '-M',
+         $new_name);
+     if( $ret == RET_INVALID_NAME_FROM_USERADD ) {
+         $returnvalue = RET_INVALID_NAME_FROM_USERADD;
