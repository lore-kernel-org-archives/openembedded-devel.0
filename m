Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B31D608CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 15:12:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2013 08:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,659,1367996400"; d="scan'208";a="369731975"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2013 08:12:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jul 2013 16:12:05 +0100
Message-Id: <1373728325-18354-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: add from meta-baryon
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
X-List-Received-Date: Sat, 13 Jul 2013 15:12:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No changes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../webmin/files/disable-version-check.patch       |  45 +++
 .../webmin/files/exports-lib.pl.patch              |  32 ++
 .../webmin/files/init-exclude.patch                |  67 ++++
 .../recipes-webadmin/webmin/files/media-tomb.patch |  65 ++++
 .../webmin/files/mount-excludefs.patch             |  25 ++
 .../webmin/files/net-generic.patch                 |  21 ++
 .../recipes-webadmin/webmin/files/net-lib.pl.patch |  19 ++
 .../recipes-webadmin/webmin/files/nfs-export.patch |  39 +++
 .../webmin/files/proftpd-config-fix.patch          |  18 ++
 .../webmin/files/remove-startup-option.patch       |  29 ++
 .../webmin/files/samba-config-fix.patch            |  32 ++
 .../recipes-webadmin/webmin/files/setup.sh         | 340 +++++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.620.bb        | 139 +++++++++
 13 files changed, 871 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch
 create mode 100755 meta-webserver/recipes-webadmin/webmin/files/setup.sh
 create mode 100644 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb

diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
new file mode 100644
index 0000000..a9ee405
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -0,0 +1,45 @@
+Disable OS version check in status screen
+
+The code is not able to accurately detect the correct distro/version at
+the moment.
+
+Upstream-status: Inappropriate
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/webmin/webmin-lib.pl b/webmin/webmin-lib.pl
+index 57a37f7..838b944 100755
+--- a/webmin/webmin-lib.pl
++++ b/webmin/webmin-lib.pl
+@@ -1059,18 +1059,19 @@ my %miniserv;
+ &load_theme_library();	# So that UI functions work
+ 
+ # Need OS upgrade
+-my %realos = &detect_operating_system(undef, 1);
+-if (($realos{'os_version'} ne $gconfig{'os_version'} ||
+-     $realos{'os_type'} ne $gconfig{'os_type'}) &&
+-    $realos{'os_version'} && $realos{'os_type'} &&
+-    &foreign_available("webmin")) {
+-	push(@notifs, 
+-		&ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
+-		&text('os_incorrect', $realos{'real_os_type'},
+-				    $realos{'real_os_version'})."<p>\n".
+-		&ui_form_end([ [ undef, $text{'os_fix'} ] ])
+-		);
+-	}
++# Disabled for now as os-chooser.pl does not work on our system
++#my %realos = &detect_operating_system(undef, 1);
++#if (($realos{'os_version'} ne $gconfig{'os_version'} ||
++#     $realos{'os_type'} ne $gconfig{'os_type'}) &&
++#    $realos{'os_version'} && $realos{'os_type'} &&
++#    &foreign_available("webmin")) {
++#	push(@notifs, 
++#		&ui_form_start("$gconfig{'webprefix'}/webmin/fix_os.cgi").
++#		&text('os_incorrect', $realos{'real_os_type'},
++#				    $realos{'real_os_version'})."<p>\n".
++#		&ui_form_end([ [ undef, $text{'os_fix'} ] ])
++#		);
++#	}
+ 
+ # Password close to expiry
+ my $warn_days = $config{'warn_days'};
diff --git a/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
new file mode 100644
index 0000000..140ae7e
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
@@ -0,0 +1,32 @@
+From 7eba4c98c6953fa6ea76c1620d19524bcfa3a576 Mon Sep 17 00:00:00 2001
+From: Kevin Strasser <kevin.strasser@linux.intel.com>
+Date: Wed, 1 Aug 2012 11:51:26 -0700
+Subject: [PATCH] nfs export: remove nfsd check
+
+nfsd runs as a kernel process and does not have a pid. This means
+that the command assigned to apply_cmd will never be executed when
+the user tries to apply changes to nfs exports.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
+---
+ exports/exports-lib.pl |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/exports/exports-lib.pl b/exports/exports-lib.pl
+index 22891c0..1c67494 100755
+--- a/exports/exports-lib.pl
++++ b/exports/exports-lib.pl
+@@ -273,7 +273,7 @@ return !&has_command("rpc.nfsd") && !&has_command("nfsd") &&
+ sub restart_mountd
+ {
+ # Try exportfs -r first
+-if ($config{'apply_cmd'} && &find_byname("nfsd") && &find_byname("mountd")) {
++if ($config{'apply_cmd'} && &find_byname("mountd")) {
+ 	local $out = &backquote_logged("$config{'apply_cmd'} 2>&1 </dev/null");
+ 	if (!$? && $out !~ /invalid|error|failed/i) {
+ 		# Looks like it worked!
+-- 
+1.7.9.5
+
diff --git a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
new file mode 100644
index 0000000..135492d
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
@@ -0,0 +1,67 @@
+# Hack in support for an "exclude" config option for the init module, so
+# we can hide certain system services that shouldn't really be configurable
+# via the web interface
+#
+# Upstream-status: Pending
+#
+# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+--- webmin-1.570.orig/init/index.cgi
++++ webmin-1.570/init/index.cgi
+@@ -48,19 +48,20 @@ elsif ($init_mode eq "init" && $access{'
+ 					     : "$config{'init_dir'}/$ac[0]");
+ 		}
+ 	@runlevels = &list_runlevels();
+-	foreach $r (@runlevels) {
+-		foreach $w ("S", "K") {
+-			foreach $a (&runlevel_actions($r, $w)) {
+-				@ac = split(/\s+/, $a);
+-				if (!$nodemap{$ac[2]}) {
+-					push(@acts, $ac[1]);
+-					push(@actsl,
+-					     "1+$r+$ac[0]+$ac[1]+$ac[2]+$w");
+-					push(@actsf, "$config{'init_base'}/rc$r.d/$w$ac[0]$ac[1]");
+-					}
+-				}
+-			}
+-		}
++	# Assume there won't be any of these broken actions
++	#foreach $r (@runlevels) {
++	#	foreach $w ("S", "K") {
++	#		foreach $a (&runlevel_actions($r, $w)) {
++	#			@ac = split(/\s+/, $a);
++	#			if (!$nodemap{$ac[2]}) {
++	#				push(@acts, $ac[1]);
++	#				push(@actsl,
++	#				     "1+$r+$ac[0]+$ac[1]+$ac[2]+$w");
++	#				push(@actsf, "$config{'init_base'}/rc$r.d/$w$ac[0]$ac[1]");
++	#				}
++	#			}
++	#		}
++	#	}
+ 
+ 	# For each action, look at /etc/rc*.d/* files to see if it is 
+ 	# started at boot
+Index: webmin-1.570/init/init-lib.pl
+===================================================================
+--- webmin-1.570.orig/init/init-lib.pl
++++ webmin-1.570/init/init-lib.pl
+@@ -108,15 +108,17 @@ List boot time action names from init.d,
+ =cut
+ sub list_actions
+ {
+-local($dir, $f, @stbuf, @rv);
++local($dir, $f, @stbuf, @rv, @exclude);
+ $dir = $config{init_dir};
++@exclude = split(/,/, $config{exclude});
+ opendir(DIR, $dir);
+ foreach $f (sort { lc($a) cmp lc($b) } readdir(DIR)) {
+ 	if ($f eq "." || $f eq ".." || $f =~ /\.bak$/ || $f eq "functions" ||
+ 	    $f eq "core" || $f eq "README" || $f eq "rc" || $f eq "rcS" ||
+ 	    -d "$dir/$f" || $f =~ /\.swp$/ || $f eq "skeleton" ||
+ 	    $f =~ /\.lock$/ || $f =~ /\.dpkg-(old|dist)$/ ||
+-	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering') { next; }
++	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering' ||
++	    grep {$_ eq $f} @exclude ) { next; }
+ 	if (@stbuf = stat("$dir/$f")) {
+ 		push(@rv, "$f $stbuf[1]");
+ 		}
diff --git a/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch b/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch
new file mode 100644
index 0000000..46f3109
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch
@@ -0,0 +1,65 @@
+diff -Nru webmin-1.570.bak/mediatomb/index.cgi webmin-1.570/mediatomb/index.cgi
+--- webmin-1.570.bak/mediatomb/index.cgi	1969-12-31 16:00:00.000000000 -0800
++++ webmin-1.570/mediatomb/index.cgi	2011-10-26 10:00:05.992522036 -0700
+@@ -0,0 +1,13 @@
++#!/usr/bin/perl
++# index.cgi
++# Display MediaTomb option categories
++
++require './mediatomb-lib.pl';
++
++ui_print_header(undef, $text{'index_title'}, "", undef, 1, 1);
++
++
++$ipaddress = &get_my_address();
++print &text('index_desc', $ipaddress),"<p>\n";
++
++ui_print_footer("/", $text{'index'});
+diff -Nru webmin-1.570.bak/mediatomb/lang/en webmin-1.570/mediatomb/lang/en
+--- webmin-1.570.bak/mediatomb/lang/en	1969-12-31 16:00:00.000000000 -0800
++++ webmin-1.570/mediatomb/lang/en	2011-10-26 10:01:13.340522186 -0700
+@@ -0,0 +1,2 @@
++index_title=MediaTomb
++index_desc=MediaTomb is an open source (GPL) UPnP MediaServer with a nice web user interface. You can access it via <a href='http://$1:49153'>here</a>.
+diff -Nru webmin-1.570.bak/mediatomb/mediatomb-lib.pl webmin-1.570/mediatomb/mediatomb-lib.pl
+--- webmin-1.570.bak/mediatomb/mediatomb-lib.pl	1969-12-31 16:00:00.000000000 -0800
++++ webmin-1.570/mediatomb/mediatomb-lib.pl	2011-10-26 10:01:34.692522079 -0700
+@@ -0,0 +1,31 @@
++#!/usr/bin/perl
++# mediatomb-lib.pl
++# Common functions for the MediaTomb module
++
++BEGIN { push(@INC, ".."); };
++use WebminCore;
++&init_config();
++
++sub get_my_address
++{
++my $myip;
++if (&foreign_check("net")) {
++        # Try to get ethernet interface
++        &foreign_require("net", "net-lib.pl");
++        my @act = &net::active_interfaces();
++        my @ifaces = grep { &net::iface_type($_->{'fullname'}) =~ /ether/i }
++                          @act;
++        @ifaces = ( $act[0] ) if (!@ifaces && @act);
++        if (@ifaces) {
++                return wantarray ? ( map { $_->{'address'} } @ifaces )
++                                 : $ifaces[0]->{'address'};
++                }
++        }
++$myip = &to_ipaddress(&get_system_hostname());
++if ($myip) {
++        # Can resolve hostname .. use that
++        return wantarray ? ( $myip ) : $myip;
++        }
++return wantarray ? ( ) : undef;
++}
++
+diff -Nru webmin-1.570.bak/mediatomb/module.info webmin-1.570/mediatomb/module.info
+--- webmin-1.570.bak/mediatomb/module.info	1969-12-31 16:00:00.000000000 -0800
++++ webmin-1.570/mediatomb/module.info	2011-10-26 09:59:50.428528369 -0700
+@@ -0,0 +1,3 @@
++desc=MediaTomb
++category=others
++longdesc=MediaTomb access module
diff --git a/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch b/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
new file mode 100644
index 0000000..8cb74c4
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
@@ -0,0 +1,25 @@
+Add excludefs config option to mount module
+
+Adds a configuration option (currently hidden) to allow the distro to
+hide certain filesystems from the mount module within Webmin (e.g. /dev)
+since these shouldn't be modified from the web interface.
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-status: Pending
+
+--- webmin-1.570.orig/mount/index.cgi
++++ webmin-1.570/mount/index.cgi
+@@ -33,10 +33,12 @@ elsif ($config{'sort_mode'} == 1) {
+ 	}
+ 
+ # Build visible filesystems list
++@excludefs = split(/,/, $config{excludefs});
+ foreach $m (@all) {
+ 	@minfo = @$m;
+ 	$p = &simplify_mount_path($minfo[0], $minfo[2]);
+ 	next if ($ignore{$minfo[2]});
++	next if (grep {$_ eq $minfo[2]} @excludefs);
+ 	@mmodes = &mount_modes($minfo[2], $minfo[0], $minfo[1]);
+ 	$canedit = $can_edit{$minfo[2]} && !$mmodes[4] &&
+             	   &can_edit_fs(@minfo);
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
new file mode 100644
index 0000000..7d20aff
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -0,0 +1,21 @@
+# Add support for configuring network interfaces on a generic linux system
+#
+# Upstream-status: Not appropriate [config]
+#
+# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+--- webmin-1.570.orig/net/module.info
++++ webmin-1.570/net/module.info
+@@ -11,7 +11,7 @@ desc_ko_KR.UTF-8=ÎÑ§Ìä∏ÏõåÌÅ¨ Íµ¨ÏÑ±
+ name=Networking
+ desc_tr=A Yap˝land˝rmas˝
+ desc_de=Netzwerkkonfiguration
+-os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
++os_support=generic-linux solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
+ desc_sk=Konfigur·cia siete
+ desc_zh_CN=Õ¯¬Á≈‰÷√
+ risk=low medium high
+--- /dev/null
++++ webmin-1.570/net/generic-linux-lib.pl
+@@ -0,0 +1,2 @@
++do 'linux-lib.pl';
++
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
new file mode 100644
index 0000000..bdba5e7
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [config]
+
+XXX: need to work out a better fix.
+
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+
+diff -Nru webmin-1.570.orig//net/net-lib.pl webmin-1.570/net/net-lib.pl
+--- webmin-1.570.orig//net/net-lib.pl	2011-10-03 09:01:48.000000000 +0800
++++ webmin-1.570/net/net-lib.pl	2011-10-28 13:52:56.138873664 +0800
+@@ -21,7 +21,8 @@
+ 	do "$gconfig{'os_type'}-9.1-ALL-lib.pl";
+ 	}
+ else {
+-	do "$gconfig{'os_type'}-lib.pl";
++	#do "$gconfig{'os_type'}-lib.pl";
++	do "debian-linux-lib.pl";
+ 	}
+ 
+ # list_hosts()
diff --git a/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch b/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch
new file mode 100644
index 0000000..c17e3b2
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch
@@ -0,0 +1,39 @@
+commit e48f61d2f6df32a518bcb84db8c6eacfe5435c32
+Author: Yu Ke <ke.yu@intel.com>
+Date:   Fri Oct 28 14:40:51 2011 +0800
+
+NFS export: fix syntax issue
+
+fix two syntax issue in /etc/exports:
+1. if it is exported to everyone, should use "*", e.g. "/export  *(xxx)"
+2. explicitly specify subtree_check or no_subtree_check, required by latest nfs-utils
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/exports/save_export.cgi b/exports/save_export.cgi
+index 3bc2f97..3e60298 100755
+--- a/exports/save_export.cgi
++++ b/exports/save_export.cgi
+@@ -40,7 +40,7 @@ else {
+ 			&error(&text('save_enetmask', $in{'netmask'}));
+ 		$exp{'host'} = $in{'network'}."/".$in{'netmask'};
+ 		}
+-	elsif ($in{'mode'} == 3) { $exp{'host'} = ""; }
++	elsif ($in{'mode'} == 3) { $exp{'host'} = "*"; }
+ 	else {
+ 		$in{'host'} =~ /\*/ || &to_ipaddress($in{'host'}) ||
+ 			&error(&text('save_ehost', $in{'host'}));
+@@ -70,6 +70,11 @@ else {
+ 
+ 	delete($opts{'no_subtree_check'}); delete($opts{'subtree_check'});
+ 	$opts{'no_subtree_check'} = "" if ($in{'no_subtree_check'});
++	if ($in{'no_subtree_check'}) {
++		$opts{'no_subtree_check'} = "";
++	} else {
++		$opts{'subtree_check'} = "";
++	}
+ 
+ 	delete($opts{'nohide'}); delete($opts{'hide'});
+ 	$opts{'nohide'} = "" if ($in{'nohide'});
diff --git a/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch
new file mode 100644
index 0000000..492a652
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch
@@ -0,0 +1,18 @@
+Upstream-status: Inappropriate [configuration]
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Index: webmin-1.570/proftpd/config
+===================================================================
+--- webmin-1.570.orig/proftpd/config	2011-10-25 20:18:37.000000000 +0800
++++ webmin-1.570/proftpd/config	2011-10-25 20:21:13.000000000 +0800
+@@ -1,6 +1,6 @@
+-proftpd_path=/usr/local/sbin/proftpd
+-proftpd_conf=/usr/local/etc/proftpd.conf
+-pid_file=/usr/local/var/proftpd.pid
++proftpd_path=/usr/sbin/proftpd
++proftpd_conf=/etc/proftpd.conf
++pid_file=/var/proftpd.pid
+ ftpusers=/etc/ftpusers
+ test_config=1
+ test_always=0
diff --git a/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch b/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
new file mode 100644
index 0000000..8493af8
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
@@ -0,0 +1,29 @@
+# Remove "start on boot" option from webmin configuration, as
+# end-users should not need to configure this from the web interface
+#
+# Upstream-status: Inappropriate
+#
+# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+--- webmin-1.570.orig/webmin/index.cgi
++++ webmin-1.570/webmin/index.cgi
+@@ -79,20 +79,6 @@ print &ui_buttons_start();
+ my %miniserv;
+ &get_miniserv_config(\%miniserv);
+ 
+-if (&foreign_check("init")) {
+-	&foreign_require("init", "init-lib.pl");
+-	my $starting = &init::action_status("webmin");
+-	print &ui_buttons_row("bootup.cgi",
+-	      $text{'index_boot'},
+-	      $text{'index_bootmsg'}.
+-	      ($miniserv{'inetd'} ? "<b>$text{'index_inetd'}</b>" :
+-	       !$ENV{'MINISERV_CONFIG'} ? "<b>$text{'index_apache'}</b>" : ""),
+-	      &ui_hidden("starting", $starting),
+-	      &ui_radio("boot", $starting == 2 ? 1 : 0,
+-			[ [ 1, $text{'yes'} ],
+-			  [ 0, $text{'no'} ] ]));
+-	}
+-
+ # Restart Webmin
+ if (!$miniserv{'inetd'} && $ENV{'MINISERV_CONFIG'}) {
+ 	print &ui_buttons_row("restart.cgi",
diff --git a/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch
new file mode 100644
index 0000000..46645ac
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch
@@ -0,0 +1,32 @@
+Upstream-status: Inappropriate [configuration]
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Index: webmin-1.570/samba/config-generic-linux
+===================================================================
+--- webmin-1.570.orig/samba/config-generic-linux	2011-10-25 20:11:35.000000000 +0800
++++ webmin-1.570/samba/config-generic-linux	2011-10-25 20:15:41.000000000 +0800
+@@ -1,15 +1,15 @@
+ list_printers_command=lpc status | grep "[A-z0-9]:" | sed -e 's/://g'
+-smb_passwd=/usr/local/samba/private/smbpasswd
++smb_passwd=/usr/bin/smbpasswd
+ text_lists=0
+ dont_convert=-499
+-name_server=/usr/local/samba/bin/nmbd
+-smb_conf=/usr/local/samba/lib/smb.conf
+-samba_server=/usr/local/samba/bin/smbd
++name_server=/usr/sbin/nmbd
++smb_conf=/etc/samba/smb.conf
++samba_server=/usr/sbin/smbd
+ run_from_inetd=0
+-samba_password_program=/usr/local/samba/bin/smbpasswd
+-samba_status_program=/usr/local/samba/bin/smbstatus
++samba_password_program=/usr/bin/smbpasswd
++samba_status_program=/usr/bin/smbstatus
+ swat_path=/usr/local/samba/bin/swat
+ sort_mode=0
+ smbgroupedit=/usr/local/samba/bin/smbgroupedit
+-pdbedit=/usr/local/samba/bin/pdbedit
+-net=/usr/local/samba/bin/net
++pdbedit=/usr/bin/pdbedit
++net=/usr/bin/net
diff --git a/meta-webserver/recipes-webadmin/webmin/files/setup.sh b/meta-webserver/recipes-webadmin/webmin/files/setup.sh
new file mode 100755
index 0000000..8d24f92
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/setup.sh
@@ -0,0 +1,340 @@
+#!/bin/sh
+# Modified version of setup.sh distributed with webmin
+
+if [ "$wadir" = "" ]; then
+	echo "ERROR: wadir not specified"
+	echo ""
+	exit 1
+fi
+
+config_dir_runtime=$config_dir
+config_dir=$prefix$config_dir
+
+wadir_runtime=$wadir
+wadir=$prefix$wadir
+
+ver=`cat "$wadir/version"`
+
+cd "$wadir"
+
+# Work out perl library path
+PERLLIB=$wadir
+
+# Validate source directory
+allmods=`cd "$wadir"; echo */module.info | sed -e 's/\/module.info//g'`
+if [ "$allmods" = "" ]; then
+	echo "ERROR: Failed to get module list"
+	echo ""
+	exit 1
+fi
+echo ""
+
+if [ "$login" = "webmin" ]; then
+	echo "ERROR: Username 'webmin' is reserved for internal use"
+	echo ""
+	exit 14
+fi
+
+# Create webserver config file
+echo $perl > $config_dir/perl-path
+echo $var_dir > $config_dir/var-path
+echo "Creating web server config files.."
+cfile=$config_dir/miniserv.conf
+echo "port=$port" >> $cfile
+echo "root=$wadir_runtime" >> $cfile
+echo "mimetypes=$wadir_runtime/mime.types" >> $cfile
+echo "addtype_cgi=internal/cgi" >> $cfile
+echo "realm=Webmin Server" >> $cfile
+echo "logfile=$var_dir/miniserv.log" >> $cfile
+echo "errorlog=$var_dir/miniserv.error" >> $cfile
+echo "pidfile=$var_dir/miniserv.pid" >> $cfile
+echo "logtime=168" >> $cfile
+echo "ppath=$ppath" >> $cfile
+echo "ssl=$ssl" >> $cfile
+echo "env_WEBMIN_CONFIG=$config_dir_runtime" >> $cfile
+echo "env_WEBMIN_VAR=$var_dir" >> $cfile
+echo "atboot=$atboot" >> $cfile
+echo "logout=$config_dir_runtime/logout-flag" >> $cfile
+if [ "$listen" != "" ]; then
+	echo "listen=$listen" >> $cfile
+else
+	echo "listen=10000" >> $cfile
+fi
+echo "denyfile=\\.pl\$" >> $cfile
+echo "log=1" >> $cfile
+echo "blockhost_failures=5" >> $cfile
+echo "blockhost_time=60" >> $cfile
+echo "syslog=1" >> $cfile
+if [ "$allow" != "" ]; then
+	echo "allow=$allow" >> $cfile
+fi
+if [ "$session" != "" ]; then
+	echo "session=$session" >> $cfile
+else
+	echo "session=1" >> $cfile
+fi
+if [ "$pam" != "" ]; then
+	echo "pam=$pam" >> $cfile
+fi
+if [ "$no_pam" != "" ]; then
+    echo "no_pam=$no_pam" >> $cfile
+fi
+echo premodules=WebminCore >> $cfile
+echo "server=MiniServ/$ver" >> $cfile
+
+md5pass=`$perl -e 'print crypt("test", "\\$1\\$A9wB3O18\\$zaZgqrEmb9VNltWTL454R/") eq "\\$1\\$A9wB3O18\\$zaZgqrEmb9VNltWTL454R/" ? "1\n" : "0\n"'`
+
+ufile=$config_dir/miniserv.users
+if [ "$crypt" != "" ]; then
+	echo "$login:$crypt:0" > $ufile
+else
+	if [ "$md5pass" = "1" ]; then
+		$perl -e 'print "$ARGV[0]:",crypt($ARGV[1], "\$1\$XXXXXXXX"),":0\n"' "$login" "$password" > $ufile
+	else
+		$perl -e 'print "$ARGV[0]:",crypt($ARGV[1], "XX"),":0\n"' "$login" "$password" > $ufile
+	fi
+fi
+chmod 600 $ufile
+echo "userfile=$config_dir_runtime/miniserv.users" >> $cfile
+
+kfile=$config_dir/miniserv.pem
+openssl version >/dev/null 2>&1
+if [ "$?" = "0" ]; then
+	# We can generate a new SSL key for this host
+	host=`hostname`
+	openssl req -newkey rsa:512 -x509 -nodes -out $tempdir/cert -keyout $tempdir/key -days 1825 >/dev/null 2>&1 <<EOF
+.
+.
+.
+Webmin Webserver on $host
+.
+*
+root@$host
+EOF
+	if [ "$?" = "0" ]; then
+		cat $tempdir/cert $tempdir/key >$kfile
+	fi
+	rm -f $tempdir/cert $tempdir/key
+fi
+if [ ! -r $kfile ]; then
+	# Fall back to the built-in key
+	cp "$wadir/miniserv.pem" $kfile
+fi
+chmod 600 $kfile
+echo "keyfile=$config_dir_runtime/miniserv.pem" >> $cfile
+
+chmod 600 $cfile
+echo "..done"
+echo ""
+
+echo "Creating access control file.."
+afile=$config_dir/webmin.acl
+rm -f $afile
+if [ "$defaultmods" = "" ]; then
+	echo "$login: $allmods" >> $afile
+else
+	echo "$login: $defaultmods" >> $afile
+fi
+chmod 600 $afile
+echo "..done"
+echo ""
+
+if [ "$login" != "root" -a "$login" != "admin" ]; then
+	# Allow use of RPC by this user
+	echo rpc=1 >>$config_dir/$login.acl
+fi
+
+if [ "$noperlpath" = "" ]; then
+	echo "Inserting path to perl into scripts.."
+	(find "$wadir" -name '*.cgi' -print ; find "$wadir" -name '*.pl' -print) | $perl "$wadir/perlpath.pl" $perl_runtime -
+	echo "..done"
+	echo ""
+fi
+
+echo "Creating start and stop scripts.."
+rm -f $config_dir/stop $config_dir/start $config_dir/restart $config_dir/reload
+echo "#!/bin/sh" >>$config_dir/start
+echo "echo Starting Webmin server in $wadir_runtime" >>$config_dir/start
+echo "trap '' 1" >>$config_dir/start
+echo "LANG=" >>$config_dir/start
+echo "export LANG" >>$config_dir/start
+echo "#PERLIO=:raw" >>$config_dir/start
+echo "unset PERLIO" >>$config_dir/start
+echo "export PERLIO" >>$config_dir/start
+echo "PERLLIB=$PERLLIB" >>$config_dir/start
+echo "export PERLLIB" >>$config_dir/start
+uname -a | grep -i 'HP/*UX' >/dev/null
+if [ $? = "0" ]; then
+	echo "exec '$wadir_runtime/miniserv.pl' $config_dir_runtime/miniserv.conf &" >>$config_dir/start
+else
+	echo "exec '$wadir_runtime/miniserv.pl' $config_dir_runtime/miniserv.conf" >>$config_dir/start
+fi
+
+echo "#!/bin/sh" >>$config_dir/stop
+echo "echo Stopping Webmin server in $wadir_runtime" >>$config_dir/stop
+echo "pidfile=\`grep \"^pidfile=\" $config_dir_runtime/miniserv.conf | sed -e 's/pidfile=//g'\`" >>$config_dir/stop
+echo "kill \`cat \$pidfile\`" >>$config_dir/stop
+
+echo "#!/bin/sh" >>$config_dir/restart
+echo "$config_dir_runtime/stop && $config_dir_runtime/start" >>$config_dir/restart
+
+echo "#!/bin/sh" >>$config_dir/reload
+echo "echo Reloading Webmin server in $wadir_runtime" >>$config_dir/reload
+echo "pidfile=\`grep \"^pidfile=\" $config_dir_runtime/miniserv.conf | sed -e 's/pidfile=//g'\`" >>$config_dir/reload
+echo "kill -USR1 \`cat \$pidfile\`" >>$config_dir/reload
+
+chmod 755 $config_dir/start $config_dir/stop $config_dir/restart $config_dir/reload
+echo "..done"
+echo ""
+
+if [ "$upgrading" = 1 ]; then
+	echo "Updating config files.."
+else
+	echo "Copying config files.."
+fi
+newmods=`$perl "$wadir/copyconfig.pl" "$os_type/$real_os_type" "$os_version/$real_os_version" "$wadir" $config_dir "" $allmods`
+# Store the OS and version
+echo "os_type=$os_type" >> $config_dir/config
+echo "os_version=$os_version" >> $config_dir/config
+echo "real_os_type=$real_os_type" >> $config_dir/config
+echo "real_os_version=$real_os_version" >> $config_dir/config
+if [ -r /etc/system.cnf ]; then
+	# Found a caldera system config file .. get the language
+	source /etc/system.cnf
+	if [ "$CONF_LST_LANG" = "us" ]; then
+		CONF_LST_LANG=en
+	elif [ "$CONF_LST_LANG" = "uk" ]; then
+		CONF_LST_LANG=en
+	fi
+	grep "lang=$CONF_LST_LANG," "$wadir/lang_list.txt" >/dev/null 2>&1
+	if [ "$?" = 0 ]; then
+		echo "lang=$CONF_LST_LANG" >> $config_dir/config
+	fi
+fi
+
+# Turn on logging by default
+echo "log=1" >> $config_dir/config
+
+# Use licence module specified by environment variable
+if [ "$licence_module" != "" ]; then
+	echo licence_module=$licence_module >>$config_dir/config
+fi
+
+# Disallow unknown referers by default
+echo "referers_none=1" >>$config_dir/config
+echo $ver > $config_dir/version
+echo "..done"
+echo ""
+
+# Set passwd_ fields in miniserv.conf from global config
+for field in passwd_file passwd_uindex passwd_pindex passwd_cindex passwd_mindex; do
+	grep $field= $config_dir/miniserv.conf >/dev/null
+	if [ "$?" != "0" ]; then
+		grep $field= $config_dir/config >> $config_dir/miniserv.conf
+	fi
+done
+grep passwd_mode= $config_dir/miniserv.conf >/dev/null
+if [ "$?" != "0" ]; then
+	echo passwd_mode=0 >> $config_dir/miniserv.conf
+fi
+
+# If Perl crypt supports MD5, then make it the default
+if [ "$md5pass" = "1" ]; then
+	echo md5pass=1 >> $config_dir/config
+fi
+
+# Set a special theme if none was set before
+if [ "$theme" = "" ]; then
+	theme=`cat "$wadir/defaulttheme" 2>/dev/null`
+fi
+oldthemeline=`grep "^theme=" $config_dir/config`
+oldtheme=`echo $oldthemeline | sed -e 's/theme=//g'`
+if [ "$theme" != "" ] && [ "$oldthemeline" = "" ] && [ -d "$wadir/$theme" ]; then
+	themelist=$theme
+fi
+
+# Set a special overlay if none was set before
+if [ "$overlay" = "" ]; then
+	overlay=`cat "$wadir/defaultoverlay" 2>/dev/null`
+fi
+if [ "$overlay" != "" ] && [ "$theme" != "" ] && [ -d "$wadir/$overlay" ]; then
+	themelist="$themelist $overlay"
+fi
+
+# Apply the theme and maybe overlay
+if [ "$themelist" != "" ]; then
+	echo "theme=$themelist" >> $config_dir/config
+	echo "preroot=$themelist" >> $config_dir/miniserv.conf
+fi
+
+# Set the product field in the global config
+grep product= $config_dir/config >/dev/null
+if [ "$?" != "0" ]; then
+	echo product=webmin >> $config_dir/config
+fi
+
+if [ "$makeboot" = "1" ]; then
+	echo "Configuring Webmin to start at boot time.."
+	(cd "$wadir/init" ; WEBMIN_CONFIG=$config_dir WEBMIN_VAR=$var_dir "$wadir/init/atboot.pl" $bootscript)
+	echo "..done"
+	echo ""
+fi
+
+# If password delays are not specifically disabled, enable them
+grep passdelay= $config_dir/miniserv.conf >/dev/null
+if [ "$?" != "0" ]; then
+	echo passdelay=1 >> $config_dir/miniserv.conf
+fi
+
+echo "Changing ownership and permissions .."
+# Make all config dirs non-world-readable
+for m in $newmods; do
+	chown -R root $config_dir/$m
+	chgrp -R bin $config_dir/$m
+	chmod -R og-rw $config_dir/$m
+done
+# Make miniserv config files non-world-readable
+for f in miniserv.conf miniserv.pem miniserv.users; do
+	chown -R root $config_dir/$f
+	chgrp -R bin $config_dir/$f
+	chmod -R og-rw $config_dir/$f
+done
+chmod +r $config_dir/version
+if [ "$nochown" = "" ]; then
+	# Make program directory non-world-writable, but executable
+	chown -R root "$wadir"
+	chgrp -R bin "$wadir"
+	chmod -R og-w "$wadir"
+	chmod -R a+rx "$wadir"
+fi
+if [ $var_dir != "/var" ]; then
+	# Make log directory non-world-readable or writable
+	chown -R root $prefix$var_dir
+	chgrp -R bin $prefix$var_dir
+	chmod -R og-rwx $prefix$var_dir
+fi
+# Fix up bad permissions from some older installs
+for m in ldap-client ldap-server ldap-useradmin mailboxes mysql postgresql servers virtual-server; do
+	if [ -d "$config_dir/$m" ]; then
+		chown root $config_dir/$m
+		chgrp bin $config_dir/$m
+		chmod og-rw $config_dir/$m
+		chmod og-rw $config_dir/$m/config 2>/dev/null
+	fi
+done
+
+if [ "$nopostinstall" = "" ]; then
+	echo "Running postinstall scripts .."
+	(cd "$wadir" ; WEBMIN_CONFIG=$config_dir WEBMIN_VAR=$var_dir "$wadir/run-postinstalls.pl")
+	echo "..done"
+	echo ""
+fi
+
+# Enable background collection
+if [ "$upgrading" != 1 -a -r $config_dir/system-status/enable-collection.pl ]; then
+	echo "Enabling background status collection .."
+	$config_dir/system-status/enable-collection.pl 5
+	echo "..done"
+	echo ""
+fi
+
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
new file mode 100644
index 0000000..8822b92
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -0,0 +1,139 @@
+SUMMARY = "Web-based administration interface"
+HOMEPAGE = "http://www.webmin.com"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=0373ac9f611e542ddebe1ec6394afc3c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
+           file://setup.sh \
+           file://init-exclude.patch \
+           file://net-generic.patch \
+           file://remove-startup-option.patch \
+           file://disable-version-check.patch \
+           file://nfs-export.patch \
+           file://exports-lib.pl.patch \
+           file://mount-excludefs.patch \
+           file://samba-config-fix.patch \
+           file://proftpd-config-fix.patch \
+           file://net-lib.pl.patch \
+           file://media-tomb.patch"
+
+SRC_URI[md5sum] = "e93bc5057a5b7d7e31ecb2bb228d7044"
+SRC_URI[sha256sum] = "3d36153406d8e5d3dcaeadba34dfb5cdbc4060b75c38339174ac97b2277f284b"
+
+inherit allarch perlnative update-rc.d
+
+do_configure() {
+    # Remove binaries and plugins for other platforms
+    rm -rf acl/Authen-SolarisRBAC-0.1*
+    rm -rf format bsdexports hpuxexports sgiexports
+    rm -rf zones rbac smf ipfw ipfilter dfsadmin
+    rm -f mount/freebsd-mounts* mount/netbsd-mounts*
+    rm -f mount/openbsd-mounts* mount/macos-mounts*
+
+    # Remove some plugins for the moment
+    rm -rf lilo frox wuftpd telnet pserver cpan shorewall webalizer cfengine fsdump pap
+    rm -rf majordomo fetchmail sendmail mailboxes procmail filter mailcap dovecot exim spam qmailadmin postfix
+    rm -rf stunnel squid sarg pptp-client pptp-server jabber openslp sentry cluster-* vgetty burner heartbeat
+
+    # Adjust configs
+    mv init/config-debian-linux init/config-generic-linux
+    sed -i "s/shutdown_command=.*/shutdown_command=poweroff/" init/config-generic-linux
+    echo "exclude=bootmisc.sh,single,halt,reboot,hostname.sh,modutils.sh,mountall.sh,mountnfs.sh,networking,populate-volatile.sh,rmnologin.sh,save-rtc.sh,umountfs,umountnfs.sh,hwclock.sh,checkroot.sh,banner.sh,udev,udev-cache,devpts.sh,psplash.sh,sendsigs,fbsetup,bootlogd,stop-bootlogd,sysfs.sh,syslog,syslog.busybox,urandom,webmin,functions.initscripts,read-only-rootfs-hook.sh" >> init/config-generic-linux
+    echo "excludefs=devpts,devtmpfs,usbdevfs,proc,tmpfs,sysfs,debugfs" >> mount/config-generic-linux
+
+    mv exports/config-debian-linux exports/config-generic-linux
+    sed -i "s/killall -HUP rpc.nfsd && //" exports/config-generic-linux
+    sed -i "s/netstd_nfs/nfsserver/g" exports/config-generic-linux
+
+    # Fix insane naming that causes problems at packaging time (must be done before deleting below)
+    find . -name "*\**" | while read from
+    do
+        to=`echo "$from" | sed "s/*/ALL/"`
+        mv "$from" "$to"
+    done
+
+    # Remove some other files we don't need
+    find . -name "config-*" -a \! -name "config-generic-linux" -a \! -name "config-ALL-linux" -a \! -name "*.pl" -delete
+    find . -regextype posix-extended -regex ".*/(openserver|aix|osf1|osf|openbsd|netbsd|freebsd|unixware|solaris|macos|irix|hpux|cygwin|windows)-lib\.pl" -delete
+    rm -f webmin-gentoo-init webmin-caldera-init webmin-debian-pam webmin-pam
+
+    # Don't need these at runtime (and we have our own setup script)
+    rm -f setup.sh
+    rm -f setup.pl
+
+    # Use pidof for finding PIDs
+    sed -i "s/find_pid_command=.*/find_pid_command=pidof NAME/" config-generic-linux
+}
+
+do_install() {
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/webmin
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 webmin-init ${D}${sysconfdir}/init.d/webmin
+
+    install -d ${D}${localstatedir}
+    install -d ${D}${localstatedir}/webmin
+
+    install -d ${D}${libexecdir}/webmin
+    cp -pPR ${S}/* ${D}${libexecdir}/webmin
+    rm -f ${D}${libexecdir}/webmin/webmin-init
+    rm -rf ${D}${libexecdir}/webmin/patches
+
+    # Run setup script
+    export perl=perl
+    export perl_runtime=${bindir}/perl
+    export prefix=${D}
+    export tempdir=${S}/install_tmp
+    export wadir=${libexecdir}/webmin
+    export config_dir=${sysconfdir}/webmin
+    export var_dir=${localstatedir}/webmin
+    export os_type=generic-linux
+    export os_version=0
+    export real_os_type="${DISTRO_NAME}"
+    export real_os_version="${DISTRO_VERSION}"
+    export port=10000
+    export login=admin
+    export password=password
+    export ssl=0
+    export atboot=1
+    export no_pam=1
+    mkdir -p $tempdir
+    ${S}/../setup.sh
+}
+
+INITSCRIPT_NAME = "webmin"
+INITSCRIPT_PARAMS = "start 99 5 3 2 . stop 10 0 1 6 ."
+
+# FIXME: some of this should be figured out automatically
+RDEPENDS_${PN} += "perl perl-module-socket perl-module-exporter perl-module-exporter-heavy perl-module-carp perl-module-strict"
+RDEPENDS_${PN} += "perl-module-warnings perl-module-xsloader perl-module-posix perl-module-autoloader"
+RDEPENDS_${PN} += "perl-module-fcntl perl-module-tie-hash perl-module-vars perl-module-time-local perl-module-config perl-module-constant"
+RDEPENDS_${PN} += "perl-module-file-glob perl-module-file-copy perl-module-sdbm perl-module-sdbm-file perl-module-timelocal perl-module-feature"
+
+PACKAGES_DYNAMIC += "webmin-module-*"
+RRECOMMENDS_${PN} += "webmin-module-system-status"
+
+RDEPENDS_webmin-module-proc = "procps"
+RDEPENDS_webmin-module-raid = "mdadm"
+RDEPENDS_webmin-module-exports = "perl-module-file-basename perl-module-file-path perl-module-cwd perl-module-file-spec perl-module-file-spec-unix"
+RRECOMMENDS_webmin-module-fdisk = "parted"
+RRECOMMENDS_webmin-module-lvm = "lvm2"
+
+python populate_packages_prepend() {
+    import os, os.path
+
+    wadir = bb.data.expand('${libexecdir}/webmin', d)
+    wadir_image = bb.data.expand('${D}', d) + wadir
+    modules = []
+    for mod in os.listdir(wadir_image):
+        modinfo = os.path.join(wadir_image, mod, "module.info")
+        if os.path.exists(modinfo):
+            modules.append(mod)
+
+    do_split_packages(d, wadir, '^(%s)$' % "|".join(modules), 'webmin-module-%s', 'Webmin module for %s', allow_dirs=True, prepend=True)
+}
+
+# Time-savers
+package_do_pkgconfig() {
+    :
+}
-- 
1.8.1.2


