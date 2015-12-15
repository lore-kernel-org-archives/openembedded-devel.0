Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD79070057
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 07:44:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBF7i0VX027138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 23:44:01 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 14 Dec 2015 23:44:00 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Dec 2015 02:43:59 -0500
Message-ID: <1450165439-79081-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] samba: add PACKAGECONFIG for valgrind
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
X-List-Received-Date: Tue, 15 Dec 2015 07:44:02 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Add configure options '--without-valgrind'
* Disable valgrind by default since it doesn't build for all targets

This fixes build errors:

  ../source3/include/includes.h:156:31: fatal error: \
    valgrind/memcheck.h: No such file or directory
  compilation terminated.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../21-add-config-option-without-valgrind.patch    | 63 ++++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.1.12.bb     |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch
new file mode 100644
index 0000000..025ac27
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch
@@ -0,0 +1,63 @@
+From 9a2d6315ff206b2a47100dfd85afe3af56576995 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 10 Dec 2015 04:20:51 -0500
+Subject: [PATCH] Add config option without-valgrind
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ lib/replace/wscript | 4 +++-
+ source3/wscript     | 5 ++++-
+ wscript             | 4 ++++
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index f0040b1..aca73af 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -101,7 +101,9 @@ struct foo bar = { .y = 'X', .x = 1 };
+ 
+     conf.CHECK_CODE('', headers='rpc/rpc.h rpcsvc/yp_prot.h', define='HAVE_RPCSVC_YP_PROT_H')
+ 
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++    if not Options.options.disable_valgrind:
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++
+     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
+     conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
+     conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h malloc.h')
+diff --git a/source3/wscript b/source3/wscript
+index bac3dd5..a5c51ea 100644
+--- a/source3/wscript
++++ b/source3/wscript
+@@ -1016,7 +1016,10 @@ syscall(SYS_setgroups32, 0, NULL);
+             Logs.warn("--with-dnsupdate=yes but gssapi support not sufficient")
+         else:
+             conf.DEFINE('WITH_DNS_UPDATES', 1)
+-    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++
++    if not Options.options.disable_valgrind:
++        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h valgrind/memcheck.h')
++
+     if Options.options.developer:
+         if conf.CONFIG_SET('HAVE_VALGRIND_H') or conf.CONFIG_SET('HAVE_VALGRIND_VALGRIND_H'):
+             conf.DEFINE('VALGRIND', '1')
+diff --git a/wscript b/wscript
+index 7679c0f..681ac17 100644
+--- a/wscript
++++ b/wscript
+@@ -72,6 +72,10 @@ def set_options(opt):
+                    help=("Disable systemd integration"),
+                    action='store_false', dest='enable_systemd')
+ 
++    opt.add_option('--without-valgrind',
++                   help=("Disable use of the valgrind headers"),
++                   action="store_true", dest='disable_valgrind', default=False)
++
+     gr = opt.option_group('developer options')
+ 
+     opt.tool_options('python') # options for disabling pyc or pyo compilation
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index cb29ab9..5925a92 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -33,6 +33,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://18-avoid-get-config-by-native-ncurses.patch \
            file://19-systemd-daemon-is-contained-by-libsystemd.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
+           file://21-add-config-option-without-valgrind.patch \
           "
 
 SRC_URI[md5sum] = "232016d7581a1ba11e991ec2674553c4"
@@ -65,6 +66,7 @@ PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
+PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
 SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
-- 
1.9.1


