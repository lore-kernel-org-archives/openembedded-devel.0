Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75D9277B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTcDU022123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:06 -0500
Message-ID: <1504725809-12825-9-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/31] networkmanager-openvpn: requires openvpn from meta-networking
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:37 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../networkmanager/networkmanager-openvpn_1.2.8.bb | 39 ++++++++++++++++++++++
 .../networkmanager/networkmanager-openvpn_1.2.8.bb | 39 ----------------------
 2 files changed, 39 insertions(+), 39 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
new file mode 100644
index 0000000..cce3f91
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
@@ -0,0 +1,39 @@
+SUMMARY = "NetworkManager-openvpn-plugin"
+SECTION = "net/misc"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
+
+DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native"
+
+inherit gnomebase useradd gettext systemd
+
+SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
+SRC_URI[md5sum] = "9f325be386aa906ff9b0b7c0bdf2a59a"
+SRC_URI[sha256sum] = "3e0b4007f248d96df4b8eb5d0f937536044af7053debbbf525e67c9bc5d30654"
+
+S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
+
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
+
+do_install_append () {
+    rm -rf ${D}${libdir}/NetworkManager/*.la
+}
+
+# Create user and group nm-openvpn that are needed since version 1.0.6
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system nm-openvpn"
+
+FILES_${PN} += " \
+    ${libdir}/NetworkManager/*.so \
+    ${libdir}/NetworkManager/VPN/nm-openvpn-service.name \
+"
+
+FILES_${PN}-staticdev += " \
+    ${libdir}/NetworkManager/*.a \
+"
+
+RDEPENDS_${PN} = " \
+    networkmanager \
+    openvpn \
+"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
deleted file mode 100644
index cce3f91..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "NetworkManager-openvpn-plugin"
-SECTION = "net/misc"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
-
-DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native"
-
-inherit gnomebase useradd gettext systemd
-
-SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
-SRC_URI[md5sum] = "9f325be386aa906ff9b0b7c0bdf2a59a"
-SRC_URI[sha256sum] = "3e0b4007f248d96df4b8eb5d0f937536044af7053debbbf525e67c9bc5d30654"
-
-S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
-
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
-
-do_install_append () {
-    rm -rf ${D}${libdir}/NetworkManager/*.la
-}
-
-# Create user and group nm-openvpn that are needed since version 1.0.6
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system nm-openvpn"
-
-FILES_${PN} += " \
-    ${libdir}/NetworkManager/*.so \
-    ${libdir}/NetworkManager/VPN/nm-openvpn-service.name \
-"
-
-FILES_${PN}-staticdev += " \
-    ${libdir}/NetworkManager/*.a \
-"
-
-RDEPENDS_${PN} = " \
-    networkmanager \
-    openvpn \
-"
-- 
1.8.3.1


