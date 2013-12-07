Return-Path: <ulf@emagii.com>
Received: from smtprelay-b31.telenor.se (smtprelay-b31.telenor.se
	[213.150.131.20])
	by mail.openembedded.org (Postfix) with ESMTP id 62A3B615B0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2013 22:30:06 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b31.telenor.se (Postfix) with ESMTP id C1700E9510
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2013 23:30:04 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AphzAPqgo1JT4zlmPGdsb2JhbABZgwYBATeIDKoxhymBGBcDAQEBATg1gncBCiNPMxgKLYdwAxMBtg0BgzYNhmcXjH2BL2QdhB0DlimBa4xaiGM7gSw
X-IronPort-AV: E=Sophos;i="4.93,848,1378850400"; d="scan'208";a="698490828"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	Hydra.bredbandsbolaget.se) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 07 Dec 2013 23:30:04 +0100
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2013 23:29:41 +0100
Message-Id: <1386455381-40913-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] xfconfig: use sysroot and target perl
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
X-List-Received-Date: Sat, 07 Dec 2013 22:30:08 -0000

xfconf-4.10.0 does not use OE sysroot as is.
--with-sysroot=yes 
will make configure run CC --print-sysroot
and use that.

When searching the PATH for perl, no target perl is found,
since PATH does not contain any reference.
Instead native perl is found, and if certain perl packages
are installed on the host machine, the xfconf perl support
is enabled which may cause the build to fail on 64 bit hosts.
If the perl packages are not installed on the host, then
perl support in xfconf is disabled, and the xfconf build
will succeed, even on 64 bit hosts.

If native perl is found, and the perl packages are available
on the host, the perl support is enabled.

Since native perl is used, the native linker is used to link the 
resulting *target* code.  

The perl support requires some libraries, which are built for the target.
If the host is 64 bit (x86_64) and the target is 32 bit (ARM?), 
there is a mismatch which is detected by the linker, 
and the libraries found are rejected.

If the host does not have the correct libraries,
then the xfconf build fails.
If the host has the correct libraries, then the linker will try
to link host libraries with the target application.

The patch will define PERL as the target perl.
This means that configure will look for the required perl
packages in the target sysroot, instead of in the native filesystem.

The patch has been tested in Angstrom master, which does not
build the required perl packages, and thus perl support
in xfconf is disabled, and the build succeeds.

A simpler way to do this, proposed by Charles Ash <ashcharles@gmail.com>
is to simply disable the perl-support in xfconf.
This patch will be better, if ever the support for the needed
perl packages is added to the OpenEmbedded/Angstrom build.


Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index 4ea2b88..6d5bf57 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -2,10 +2,14 @@ DESCRIPTION = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "dbus-glib libxfce4util perl-native"
+DEPENDS = "dbus-glib libxfce4util perl"
+PR="r1"
 
 inherit xfce
 
+EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
+EXTRA_OECONF += "--with-sysroot=yes"
+
 SRC_URI += "file://0001-Simplify-checks.patch"
 SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
 SRC_URI[sha256sum] = "175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576"
-- 
1.7.9.5


