Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qm9Fy-0007dZ-Lz
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 20:54:59 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qm9Bs-0005Rv-Pz from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 11:50:44 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 11:50:44 -0700
Received: from localhost.localdomain ([172.30.80.83]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 27 Jul 2011 12:50:42 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2011 11:50:35 -0700
Message-Id: <1311792635-17715-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 27 Jul 2011 18:50:42.0875 (UTC)
	FILETIME=[163830B0:01CC4C8E]
Subject: [meta-oe][PATCH] rp-pppoe: Resync the 3.8 recipe with oe.dev and cleanup patches
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
X-List-Received-Date: Wed, 27 Jul 2011 18:54:59 -0000

- Update HOMEPAGE (from oe.dev)
- Bump PR to match oe.dev (will sync the next bits back over)
- Add Upstream-Status to all patches and a description to the ones
  missing descriptions.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch |    6 ++++++
 .../rp-pppoe-3.8/dont-swallow-errors.patch         |    4 ++++
 .../rp-pppoe-3.8/pppoe-src-restrictions.patch      |    2 ++
 .../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch       |    2 ++
 .../rp-pppoe/rp-pppoe-3.8/update-config.patch      |    2 ++
 .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch        |    4 ++++
 .../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb  |    6 +++---
 7 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
index 381a44d..1896759 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
@@ -1,3 +1,9 @@
+Update the configure script to cross-compiling with OE.  This hard-codes
+a few target paths, reworks a few tests to be more friendly for cross
+and drops other tests.
+
+Upstream-Status: Inappropriate [build system specific changes]
+
 Index: src/configure.in
 ===================================================================
 --- rp-pppoe-3.8.orig/src/configure.in	2006-04-03 00:29:42.000000000 +1000
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
index 81ce2db..f2f681a 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
@@ -1,3 +1,7 @@
+Further fixup to the configure scripts to not swallow errors
+
+Upstream-Status: Unsubmitted
+
 --- a/src/configure.in.org	2008-01-14 21:08:38.000000000 +0200
 +++ a/src/configure.in	2008-01-14 21:20:09.000000000 +0200
 @@ -208,7 +208,7 @@
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
index e7e1c2e..b3ad3d4 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
@@ -3,6 +3,8 @@ Relax restrictions on the PPPoE src address, as per debian bug
 
   http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=293811
 
+Upstream-Status: Backport [from Debian]
+
 --- rp-pppoe-3.8.orig/src/discovery.c
 +++ rp-pppoe-3.8/src/discovery.c
 @@ -376,8 +376,8 @@
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
index e3b0482..4fe73d0 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
@@ -4,6 +4,8 @@ S. This adds enough autoconf at the top level to allow it to be
 called there - all it does is run a sub autoconf stuff in the src
 directory.
 
+Upstream-Status: Inappropriate [build system specific change]
+
 Index: rp-pppoe-3.8/Makefile.am
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
index 5642e3c..3499f37 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
@@ -6,6 +6,8 @@ The path for the plugin is wrong, it's now part of ppp and is in a
 ppp's plugin lib directory. If no path is specified then that's where
 ppp looks, so that's what we do here.
 
+Upstream-Status: Inappropriate
+
 Index: rp-pppoe-3.8/configs/pppoe.conf
 ===================================================================
 --- rp-pppoe-3.8.orig/configs/pppoe.conf	2006-04-03 00:29:41.000000000 +1000
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
index 1209631..da445b3 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
@@ -1,3 +1,7 @@
+Make the Makefile obey LDFLAGS.
+
+Upstream-Status: Unsubmitted
+
 --- a/src/Makefile.in	2006-04-02 18:29:42.000000000 +0400
 +++ b/src/Makefile.in	2010-04-16 17:51:31.000000000 +0400
 @@ -67,16 +67,16 @@ all: $(TARGETS)
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
index 371d82e..673633a 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "A user-mode PPPoE client and server suite for Linux"
-HOMEPAGE = "http://www.roaringpenguin.com/en/penguin/openSourceProducts/rpPppoe"
+HOMEPAGE = "http://www.roaringpenguin.com/products/pppoe"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 RDEPENDS_${PN} = "ppp"
 RDEPENDS_${PN}-server = "${PN}"
 RRECOMMENDS_${PN} = "ppp-oe"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
            file://top-autoconf.patch \
@@ -14,7 +14,7 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
            file://pppoe-src-restrictions.patch \
            file://update-config.patch \
            file://dont-swallow-errors.patch \
-	   file://use-ldflags.patch \
+           file://use-ldflags.patch \
            file://pppoe-server.default \
            file://pppoe-server.init"
 
-- 
1.7.0.4



