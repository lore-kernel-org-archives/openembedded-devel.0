Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F6CC3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 05:05:39 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.935.1720760737457935121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jul 2024 22:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eXf7mbdN;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-703631c4930so758650a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 22:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720760736; x=1721365536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0I59kNYE0D6LIeTeMl6Ua/WYwjPIgjjPo7wrHSu46c=;
        b=eXf7mbdNx0dA/9xmNmFfwZkosLe++RvUcl/Lu0T08FA0ta8QoP7ebIIoJQVr8XqY+A
         GrLzvbKD4so0QiUJujBQTIxAW+gwI9uouEOt0eJNTluPWZsN4ngA9ZEbtAnckk+tzdIB
         gz5lFsf/saANyxn5onfOuXJ2G9Z1vUEKF2KZx1z5YwACFGR/4mgC5aOPpTTukk+UO5W0
         sh49EPFd96ffbpDwvqD3PspmZGe9e+XU7KMUny92UOuP/EEAmui5d9cfuorm1sJ89Lnw
         UIDHW1A+D96Vbv1XLwaEgsUoHvZi8EWaOomdRdD7iKJ8Bnym5XDlEn2aOqqk+Z+umnFy
         4UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720760736; x=1721365536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0I59kNYE0D6LIeTeMl6Ua/WYwjPIgjjPo7wrHSu46c=;
        b=xQHTiCPgiMy50BCgBY0Nl5RBZ8aaGLAp6TWDL6cDNaQKVjz1Oa7dPWhNYrKW1Ll5BT
         EfVsRqmc6fJZw0liooi8l55MxaL7fssXJEpPCdJKeyXkfJQlhtWB0hynVRrgvgTU26N5
         0m4Trd21teWhHmNlt2clY5fHNZrp5pmCx1pxpyQvXe9w27XJTUD7jLhrFikmURtQhdYx
         USaa+a0DNDuIwIivUZ1oRoF3nftL/vGV9EOjHtIEPWG/kmTFZRmRBgHJo9snaceyL6ds
         30IMXK04rgxzs4rkBS8FElibTOhoqcs0PJtEAFycGgcj7WOyz9RVlFFC2Hq/HPRPVBlD
         QISw==
X-Gm-Message-State: AOJu0YxXnvXD+mZQJErr6gwS0M6/JnXDbKlvbcy7tp9mVN81aI9Q69Rf
	L5F8jXFrEFa8VulsQpZuLbpGAACq2qsQpMNIcyuF+CJmvO8AqjUwjYg+FczE
X-Google-Smtp-Source: AGHT+IHRiyXcVU/5HgBiOiSYDQzEcIOcWVEbIuhpGYjq8ttKJo/eItgITEWgKq7fomRYi2kjiHD4aQ==
X-Received: by 2002:a9d:7553:0:b0:703:616c:11b6 with SMTP id 46e09a7af769-70375b4d28emr12498311a34.26.1720760736265;
        Thu, 11 Jul 2024 22:05:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4fdd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d682b3fefsm4311346a12.76.2024.07.11.22.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:05:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] webmin: Upgrade to 2.111 release
Date: Thu, 11 Jul 2024 22:05:32 -0700
Message-ID: <20240712050533.1373047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 05:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111314

Drop remove-python2.3.patch since corresponding script is gone

License-Update: Formatting changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webmin/files/disable-version-check.patch  | 76 ++++++++-----------
 .../webmin/files/mount-excludefs.patch        |  7 +-
 .../webmin/files/mysql-config-fix.patch       |  7 +-
 .../webmin/files/net-generic.patch            | 22 +++---
 .../webmin/files/net-lib.pl.patch             | 12 ++-
 .../webmin/files/remove-python2.3.patch       | 25 ------
 .../{webmin_1.850.bb => webmin_2.111.bb}      |  8 +-
 7 files changed, 51 insertions(+), 106 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch
 rename meta-webserver/recipes-webadmin/webmin/{webmin_1.850.bb => webmin_2.111.bb} (96%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index 1ca26ca0dd..46b1f7c7b8 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -7,58 +7,44 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-Index: webmin-1.850/webmin/webmin-lib.pl
-===================================================================
---- webmin-1.850.orig/webmin/webmin-lib.pl
-+++ webmin-1.850/webmin/webmin-lib.pl
-@@ -1112,28 +1112,28 @@ my %miniserv;
+--- a/webmin/webmin-lib.pl
++++ b/webmin/webmin-lib.pl
+@@ -1170,38 +1170,6 @@ my %miniserv;
+ &get_miniserv_config(\%miniserv);
  &load_theme_library();	# So that UI functions work
  
- # Need OS upgrade
--my %realos = &detect_operating_system(undef, 1);
--if (($realos{'os_version'} ne $gconfig{'os_version'} ||
--     $realos{'os_type'} ne $gconfig{'os_type'}) &&
--    $realos{'os_version'} && $realos{'os_type'} &&
--    &foreign_available("webmin")) {
--	my ($realminor) = split(/\./, $realos{'os_version'});
--	my ($minor) = split(/\./, $gconfig{'os_version'});
--	if ($realos{'os_type'} eq $gconfig{'os_type'} &&
--	    $realminor == $minor) {
--		# Only the minor version number changed - no need to apply
--		&apply_new_os_version(\%realos);
+-# Need OS upgrade, but only once per day or if the system was rebooted
+-my $now = time();
+-my $uptime = &get_system_uptime();
+-if (&foreign_available("webmin")) {
+-	my %realos;
+-	my @st = stat($realos_cache_file);
+-	if (!@st || $now - $st[9] > 24*60*60 ||
+-	    $uptime && $now - $st[9] > $uptime) {
+-		%realos = &detect_operating_system(undef, 1);
+-		&write_file($realos_cache_file, \%realos);
 -		}
 -	else {
--		# Large enough change to tell the user
--		push(@notifs, 
--		    &ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
--		    &text('os_incorrect', $realos{'real_os_type'},
--		    		          $realos{'real_os_version'})."<p>\n".
+-		&read_file($realos_cache_file, \%realos);
+-		}
+-	if (($realos{'os_version'} ne $gconfig{'os_version'} ||
+-	     $realos{'real_os_version'} ne $gconfig{'real_os_version'} ||
+-	     $realos{'os_type'} ne $gconfig{'os_type'}) &&
+-	    $realos{'os_version'} && $realos{'os_type'} &&
+-	    &foreign_available("webmin")) {
+-		# Tell the user that OS version was updated
+-		push(@notifs,
+-		    &ui_form_start("@{[&get_webprefix()]}/webmin/fix_os.cgi").
+-		    &text('os_incorrect',
+-			  $realos{'real_os_type'},
+-			  $realos{'real_os_version'}).
+-		    &show_os_release_notes($realos{'real_os_version'}).
+-		    "<p>\n".
 -		    &ui_form_end([ [ undef, $text{'os_fix'} ] ])
 -		    );
 -		}
 -	}
-+#my %realos = &detect_operating_system(undef, 1);
-+#if (($realos{'os_version'} ne $gconfig{'os_version'} ||
-+#     $realos{'os_type'} ne $gconfig{'os_type'}) &&
-+#    $realos{'os_version'} && $realos{'os_type'} &&
-+#    &foreign_available("webmin")) {
-+#	my ($realminor) = split(/\./, $realos{'os_version'});
-+#	my ($minor) = split(/\./, $gconfig{'os_version'});
-+#	if ($realos{'os_type'} eq $gconfig{'os_type'} &&
-+#	    $realminor == $minor) {
-+#		# Only the minor version number changed - no need to apply
-+#		&apply_new_os_version(\%realos);
-+#		}
-+#	else {
-+#		# Large enough change to tell the user
-+#		push(@notifs, 
-+#		    &ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
-+#		    &text('os_incorrect', $realos{'real_os_type'},
-+#		    		          $realos{'real_os_version'})."<p>\n".
-+#		    &ui_form_end([ [ undef, $text{'os_fix'} ] ])
-+#		    );
-+#		}
-+#	}
- 
+-
  # Password close to expiry
  my $warn_days = $config{'warn_days'};
+ if (&foreign_check("acl")) {
diff --git a/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch b/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
index 787bd8c69b..7d6a2275f9 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
@@ -8,9 +8,9 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 Upstream-Status: Pending
 
---- webmin-1.570.orig/mount/index.cgi
-+++ webmin-1.570/mount/index.cgi
-@@ -33,10 +33,12 @@ elsif ($config{'sort_mode'} == 1) {
+--- a/mount/index.cgi
++++ b/mount/index.cgi
+@@ -34,9 +34,11 @@ elsif ($config{'sort_mode'} == 1) {
  	}
  
  # Build visible filesystems list
@@ -18,7 +18,6 @@ Upstream-Status: Pending
  foreach $m (@all) {
  	@minfo = @$m;
  	$p = &simplify_mount_path($minfo[0], $minfo[2]);
- 	next if ($ignore{$minfo[2]});
 +	next if (grep {$_ eq $minfo[2]} @excludefs);
  	@mmodes = &mount_modes($minfo[2], $minfo[0], $minfo[1]);
  	$canedit = $can_edit{$minfo[2]} && !$mmodes[4] &&
diff --git a/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
index c6c1f0df79..d62353592e 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
@@ -10,8 +10,6 @@ Signed-off-by: Diego Rondini <diego.ml@zoho.com>
  mysql/config | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
 
-diff --git a/mysql/config b/mysql/config
-index e5b6fb3..77bfe69 100644
 --- a/mysql/config
 +++ b/mysql/config
 @@ -1,13 +1,13 @@
@@ -33,7 +31,7 @@ index e5b6fb3..77bfe69 100644
 -mysqladmin=/usr/local/mysql/bin/mysqladmin
 +mysql_libs=/usr/lib
 +mysqladmin=/usr/bin/mysqladmin
- style=0
+ style=1
  add_mode=1
  nodbi=0
 @@ -15,7 +15,7 @@ access=*: *
@@ -45,6 +43,3 @@ index e5b6fb3..77bfe69 100644
  max_dbs=50
  my_cnf=/etc/my.cnf
  max_text=1000
--- 
-2.5.0
-
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index 6ae3dced72..5fd83a4293 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -3,23 +3,19 @@ Add support for configuring network interfaces on a generic linux system
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Index: webmin-1.850/net/module.info
-===================================================================
---- webmin-1.850.orig/net/module.info
-+++ webmin-1.850/net/module.info
-@@ -14,7 +14,7 @@ desc_ko_KR.UTF-8=네트워크 구성
+--- a/net/module.info
++++ b/net/module.info
+@@ -1,7 +1,7 @@
+ version=2.111
+ longdesc=Configure boot time and active interfaces, DNS, routing and /etc/hosts.
  name=Networking
- desc_tr=A� Yap�land�rmas�
- desc_de=Netzwerkkonfiguration
 -os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
 +os_support=generic-linux solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
- desc_sk=Konfigur�cia siete
- desc_zh_CN=��������
- risk=low medium high
-Index: webmin-1.850/net/generic-linux-lib.pl
-===================================================================
+ readonly=1
+ desc=Network Configuration
+ category=net
 --- /dev/null
-+++ webmin-1.850/net/generic-linux-lib.pl
++++ b/net/generic-linux-lib.pl
 @@ -0,0 +1,2 @@
 +do 'linux-lib.pl';
 +
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
index bdba5e73f8..949525dfd7 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
@@ -4,16 +4,14 @@ XXX: need to work out a better fix.
 
 Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
 
-diff -Nru webmin-1.570.orig//net/net-lib.pl webmin-1.570/net/net-lib.pl
---- webmin-1.570.orig//net/net-lib.pl	2011-10-03 09:01:48.000000000 +0800
-+++ webmin-1.570/net/net-lib.pl	2011-10-28 13:52:56.138873664 +0800
-@@ -21,7 +21,8 @@
- 	do "$gconfig{'os_type'}-9.1-ALL-lib.pl";
+--- a/net/net-lib.pl
++++ b/net/net-lib.pl
+@@ -38,7 +38,7 @@ elsif ($gconfig{'os_type'} eq 'debian-li
+ 	$net_mode = "netplan";
  	}
  else {
 -	do "$gconfig{'os_type'}-lib.pl";
-+	#do "$gconfig{'os_type'}-lib.pl";
 +	do "debian-linux-lib.pl";
+ 	$net_mode = $gconfig{'os_type'};
  	}
  
- # list_hosts()
diff --git a/meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch b/meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch
deleted file mode 100644
index 75e5bd1eaf..0000000000
--- a/meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 6f04699d5d417122b67e8118fd1955c769f17e76 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 2 Sep 2014 00:11:05 -0700
-Subject: [PATCH] ajaxterm/ajaxterm/qweb.py: fix hardcode of python2.3
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- ajaxterm/ajaxterm/qweb.py |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ajaxterm/ajaxterm/qweb.py b/ajaxterm/ajaxterm/qweb.py
-index 20c5092..c658a6b 100644
---- a/ajaxterm/ajaxterm/qweb.py
-+++ b/ajaxterm/ajaxterm/qweb.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python2.3
-+#!/usr/bin/env python
- #
- # vim:set et ts=4 fdc=0 fdn=2 fdl=0:
- #
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.111.bb
similarity index 96%
rename from meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.111.bb
index bbc59443c7..6058afb8c2 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.111.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Web-based administration interface"
 HOMEPAGE = "http://www.webmin.com"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=0373ac9f611e542ddebe1ec6394afc3c"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=0a6446108c96d0819d21e40b48109507"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://setup.sh \
@@ -16,14 +16,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://proftpd-config-fix.patch \
            file://net-lib.pl.patch \
            file://media-tomb.patch \
-           file://remove-python2.3.patch \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-
-SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"
-SRC_URI[sha256sum] = "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f404b13e171c7ce1690e1"
-
+SRC_URI[sha256sum] = "9000ce55275494802ec433e2de634289989f5d99ea2970716d7d9c97e38f2f5e"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 

