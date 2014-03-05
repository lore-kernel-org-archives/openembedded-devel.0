Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1DF6EF83
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 00:04:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2014 15:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,589,1389772800"; d="scan'208";a="494146798"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.79])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2014 16:03:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 00:03:40 +0000
Message-Id: <1393977821-27278-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-handheld][PATCH 1/2] zaurusd: sync recipe with OE-Core
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
X-List-Received-Date: Wed, 05 Mar 2014 00:04:08 -0000

* Update to latest master for out-of-tree build fix
* Drop new-make.patch (merged upstream)
* Set SUMMARY instead of DESCRIPTION for one-line description
* Properly indent SRC_URI

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 recipes-bsp/zaurusd/zaurusd/new-make.patch | 11 ---------
 recipes-bsp/zaurusd/zaurusd_git.bb         | 36 ++++++++++++++----------------
 2 files changed, 17 insertions(+), 30 deletions(-)
 delete mode 100644 recipes-bsp/zaurusd/zaurusd/new-make.patch

diff --git a/recipes-bsp/zaurusd/zaurusd/new-make.patch b/recipes-bsp/zaurusd/zaurusd/new-make.patch
deleted file mode 100644
index dcc83fe..0000000
--- a/recipes-bsp/zaurusd/zaurusd/new-make.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: zaurusd/Makefile.am
-===================================================================
---- zaurusd.orig/Makefile.am
-+++ zaurusd/Makefile.am
-@@ -4,5 +4,4 @@ SUBDIRS = apps config scripts
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
--
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
index 821dbec..468b8f2 100644
--- a/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -1,30 +1,28 @@
-DESCRIPTION = "Daemon to handle device specific features."
+SUMMARY = "Daemon to handle device-specific features"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "tslib"
 
 PE = "1"
-PV = "0.0+gitr${SRCPV}"
-PR = "r26"
+PV = "0.1+git${SRCPV}"
 
-SRCREV = "82b30c7865f007fff81372c3cdc71b2ff6843ccc"
-SRC_URI = "git://git.yoctoproject.org/zaurusd;protocol=git \
+SRCREV = "85d941d87f0c41b196766a173feaafffa6de2dc2"
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://zaurus-hinge.in \
-	   file://add-poodle.patch \
-	   file://alsa-cxx00-default.state.patch \
-	   file://alsa-6000x-default.state.patch \
-	   file://disable-alsa-handling.patch \
-	   file://avoid-rotated-server.patch \
-	   file://new-make.patch \
-	   file://scripts_pidof.patch \
-	   file://zaurus-hinge.matchbox-portrait \
-	   file://zaurus-hinge.matchbox-landscape \
-	   file://zaurus-hinge.bl-on \
-	   file://zaurus-hinge.bl-off \
-	   file://01-check-toggle-landscape \
-	   file://01-check-toggle-portait \
-       file://use-ts-symlink-instead-of-hardcoding.diff "
+           file://add-poodle.patch \
+           file://alsa-cxx00-default.state.patch \
+           file://alsa-6000x-default.state.patch \
+           file://disable-alsa-handling.patch \
+           file://avoid-rotated-server.patch \
+           file://scripts_pidof.patch \
+           file://zaurus-hinge.matchbox-portrait \
+           file://zaurus-hinge.matchbox-landscape \
+           file://zaurus-hinge.bl-on \
+           file://zaurus-hinge.bl-off \
+           file://01-check-toggle-landscape \
+           file://01-check-toggle-portait \
+           file://use-ts-symlink-instead-of-hardcoding.diff "
 
 
 S = "${WORKDIR}/git"
-- 
1.8.5.3


