Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0058677344
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676997"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:59 +0200
Message-Id: <db2af35a3af2a5e9a18611b66d05c8b91c0e73e5.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/34] networkmanager: fix introspection and vala support
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:35 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.0.10.bb  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index 34e13cc..34548a0 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
 "
 
-DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
+DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt polkit"
 
-inherit gnomebase gettext systemd bluetooth bash-completion
+inherit gnomebase gettext systemd bluetooth bash-completion vala
 
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


