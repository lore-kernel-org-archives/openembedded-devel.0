Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3549A73172
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:35:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2016 01:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,515,1459839600"; d="scan'208";a="993491465"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2016 01:35:06 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org,
	mark.asselstine@windriver.com
Date: Thu, 23 Jun 2016 11:34:01 +0300
Message-Id: <1466670841-22706-2-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466670841-22706-1-git-send-email-jussi.kukkonen@intel.com>
References: <1466670841-22706-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [meta-oe][PATCH 2/2] Update vte users to use vte9
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
X-List-Received-Date: Thu, 23 Jun 2016 08:35:06 -0000

geany-plugins seems to compile fine with new vte: that recipe was
not modified. gnome-terminal and valaterminal are currently
blacklisted for other reasons.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb       | 2 +-
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb            | 2 +-
 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb    | 2 +-
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index ae28ffd..18e74da 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GNOME Terminal"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
-DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils intltool-native"
+DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte9 gnome-doc-utils intltool-native"
 PR = "r1"
 
 inherit gnome
diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index 24f813b..6b31fd6 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A very small and simple terminal emulator"
 SECTION = "x11/applications"
-DEPENDS = "vte"
+DEPENDS = "vte9"
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://main.c;start_line=5;end_line=16;md5=9ae4bf20caf291afa94530026bd15229"
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 07ff318..ef0cfaf 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A lightweight Terminal Emulator based on libvte, written in Vala"
 SECTION = "x11/applications"
-DEPENDS = "vte intltool-native"
+DEPENDS = "vte9 intltool-native"
 SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
index 1049b27..22b81af 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Terminal emulator for the Xfce desktop environment"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "glib-2.0 gtk+ vte libxfce4ui"
+DEPENDS = "glib-2.0 gtk+ vte9 libxfce4ui"
 
 inherit xfce-app
 
-- 
2.1.4


