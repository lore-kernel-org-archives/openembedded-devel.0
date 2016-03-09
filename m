Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4707002B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869154"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:35 +0200
Message-Id: <daf281c7a39c4afb1b28f231ad7d8b35ec80e0d5.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/38] networkmanager: fix introspection and vala support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.10.bb  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index 34e13cc..831ddf0 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
 "
 
-DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
+DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt polkit"
 
-inherit gnomebase gettext systemd bluetooth bash-completion
+inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -35,6 +35,10 @@ EXTRA_OECONF = " \
     --with-nmtui=yes \
 "
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/libnm-util/.libs"
+}
+
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
-- 
2.7.0


