Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.5349.1585791951183625144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363715"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:45:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A4D750A999A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:35:31 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:45:49 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:45:58 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-webserver][PATCH] webmin: upgrade 1.850 -> 1.941
Date: Thu, 2 Apr 2020 02:15:33 -0700
Message-ID: <1585818933-28648-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7A4D750A999A.A9D68
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

refresh the folloing patches:
disable-version-check.patch
net-generic.patch
net-lib.pl.patch

-License-Update: add "BSD 3-Clause License" to license file

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../webmin/files/disable-version-check.patch  | 24 +++++++-----
 .../webmin/files/net-generic.patch            | 37 ++++++++++---------
 .../webmin/files/net-lib.pl.patch             | 17 ++++++---
 .../{webmin_1.850.bb => webmin_1.941.bb}      |  6 +--
 4 files changed, 49 insertions(+), 35 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_1.850.bb => webmin_1.941.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index 9aad894e0..61b56bf5a 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -6,12 +6,15 @@ the moment.
 Upstream-status: Inappropriate
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ webmin/webmin-lib.pl | 44 ++++++++++++++++++++++----------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
 
-Index: webmin-1.850/webmin/webmin-lib.pl
-===================================================================
---- webmin-1.850.orig/webmin/webmin-lib.pl
-+++ webmin-1.850/webmin/webmin-lib.pl
-@@ -1112,28 +1112,28 @@ my %miniserv;
+diff --git a/webmin/webmin-lib.pl b/webmin/webmin-lib.pl
+index dad6cfc..73821f0 100755
+--- a/webmin/webmin-lib.pl
++++ b/webmin/webmin-lib.pl
+@@ -1130,28 +1130,28 @@ my %miniserv;
  &load_theme_library();	# So that UI functions work
  
  # Need OS upgrade
@@ -24,12 +27,12 @@ Index: webmin-1.850/webmin/webmin-lib.pl
 -	my ($minor) = split(/\./, $gconfig{'os_version'});
 -	if ($realos{'os_type'} eq $gconfig{'os_type'} &&
 -	    $realminor == $minor) {
--		# Only the minor version number changed - no need to apply
+-		# Only the minor version number changed - just apply silently
 -		&apply_new_os_version(\%realos);
 -		}
 -	else {
 -		# Large enough change to tell the user
--		push(@notifs, 
+-		push(@notifs,
 -		    &ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
 -		    &text('os_incorrect', $realos{'real_os_type'},
 -		    		          $realos{'real_os_version'})."<p>\n".
@@ -46,12 +49,12 @@ Index: webmin-1.850/webmin/webmin-lib.pl
 +#	my ($minor) = split(/\./, $gconfig{'os_version'});
 +#	if ($realos{'os_type'} eq $gconfig{'os_type'} &&
 +#	    $realminor == $minor) {
-+#		# Only the minor version number changed - no need to apply
++#		# Only the minor version number changed - just apply silently
 +#		&apply_new_os_version(\%realos);
 +#		}
 +#	else {
 +#		# Large enough change to tell the user
-+#		push(@notifs, 
++#		push(@notifs,
 +#		    &ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
 +#		    &text('os_incorrect', $realos{'real_os_type'},
 +#		    		          $realos{'real_os_version'})."<p>\n".
@@ -62,3 +65,6 @@ Index: webmin-1.850/webmin/webmin-lib.pl
  
  # Password close to expiry
  my $warn_days = $config{'warn_days'};
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index 554939285..a995d4b93 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -1,25 +1,26 @@
-# Add support for configuring network interfaces on a generic linux system
+# Add support for configuring network interfaces on a generic linux
+# system
 #
 # Upstream-status: Not appropriate [config]
 #
 # Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Index: webmin-1.850/net/module.info
-===================================================================
---- webmin-1.850.orig/net/module.info
-+++ webmin-1.850/net/module.info
-@@ -14,7 +14,7 @@ desc_ko_KR.UTF-8=ÎÑ§Ìä∏ÏõåÌÅ¨ Íµ¨ÏÑ±
+---
+ net/module.info | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/module.info b/net/module.info
+index b23bf2d..8e3628e 100644
+--- a/net/module.info
++++ b/net/module.info
+@@ -1,7 +1,7 @@
+ version=1.941
+ longdesc=Configure boot time and active interfaces, DNS, routing and /etc/hosts.
  name=Networking
- desc_tr=A Yap˝land˝rmas˝
- desc_de=Netzwerkkonfiguration
 -os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
 +os_support=generic-linux solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
- desc_sk=Konfigur·cia siete
- desc_zh_CN=Õ¯¬Á≈‰÷√
- risk=low medium high
-Index: webmin-1.850/net/generic-linux-lib.pl
-===================================================================
---- /dev/null
-+++ webmin-1.850/net/generic-linux-lib.pl
-@@ -0,0 +1,2 @@
-+do 'linux-lib.pl';
-+
+ readonly=1
+ desc=Network Configuration
+ category=net
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
index bdba5e73f..c9c0d3549 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
@@ -3,12 +3,16 @@ Upstream-Status: Inappropriate [config]
 XXX: need to work out a better fix.
 
 Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+---
+ net/net-lib.pl | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff -Nru webmin-1.570.orig//net/net-lib.pl webmin-1.570/net/net-lib.pl
---- webmin-1.570.orig//net/net-lib.pl	2011-10-03 09:01:48.000000000 +0800
-+++ webmin-1.570/net/net-lib.pl	2011-10-28 13:52:56.138873664 +0800
-@@ -21,7 +21,8 @@
- 	do "$gconfig{'os_type'}-9.1-ALL-lib.pl";
+diff --git a/net/net-lib.pl b/net/net-lib.pl
+index affa1d1..6671536 100755
+--- a/net/net-lib.pl
++++ b/net/net-lib.pl
+@@ -26,7 +26,8 @@ elsif ($gconfig{'os_type'} eq 'debian-linux' && -d "/etc/netplan") {
+ 	do "netplan-lib.pl";
  	}
  else {
 -	do "$gconfig{'os_type'}-lib.pl";
@@ -17,3 +21,6 @@ diff -Nru webmin-1.570.orig//net/net-lib.pl webmin-1.570/net/net-lib.pl
  	}
  
  # list_hosts()
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.941.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_1.941.bb
index 112365d4b..067c7bf6d 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.941.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Web-based administration interface"
 HOMEPAGE = "http://www.webmin.com"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=0373ac9f611e542ddebe1ec6394afc3c"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=0a6446108c96d0819d21e40b48109507"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://setup.sh \
@@ -21,8 +21,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://webmin.service \
             "
 
-SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"
-SRC_URI[sha256sum] = "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f404b13e171c7ce1690e1"
+SRC_URI[md5sum] = "bb8f63068a86a14269726f4d934b8d38"
+SRC_URI[sha256sum] = "3a19228d92556c7722c6fe56c9d4b73d477a19845b0dae3f018fc7fc0306b29a"
 
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
-- 
2.17.1



