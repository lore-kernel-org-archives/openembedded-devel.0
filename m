Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7086E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:07:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2015 02:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,534,1437462000"; d="scan'208";a="769284478"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2015 02:07:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 12:09:19 +0300
Message-Id: <1442308160-4744-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] epiphany: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Tue, 15 Sep 2015 09:07:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/epiphany_2.30.6.bb       | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb

diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
deleted file mode 100644
index 9e1a0dc..0000000
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "GNOME default webbrowser"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates libgnome-keyring avahi libnotify"
-
-inherit gnome
-SRC_URI[archive.md5sum] = "0c566b3ffd428d2135e3c8cb65352d64"
-SRC_URI[archive.sha256sum] = "278a5c00ce07e6a3ea440d289de22dbec3ebec4ded4ff3b4c48b580f469c2dcc"
-
-EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO} --without-ca-file"
-
-do_configure_prepend() {
-    touch ${S}/gnome-doc-utils.make
-    sed -i -e s:help::g ${S}/Makefile.am
-}
-
-FILES_${PN} += "${datadir}/icons ${datadir}/dbus-1"
-RDEPENDS_${PN} = "iso-codes"
-RRECOMMENDS_${PN} = "ca-certificates"
-
-- 
2.1.4


