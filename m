Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9212A60132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:10:05 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l65so245055954wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g10Jn4n8xJMn9J2K/HlzuGLpYXa/7BFLljEMYMPIbiU=;
	b=owpNlaghwDPCbkuWSVhVvH45p7gSDrrJcqMH1V3cs/9ExwCjjbHql/EPNoni5xV2rj
	wGB08FBl93gGtJiYr9R/1sgIMkr9p6GzjWTOVXZzr6U9od9ysPD1n9o0UL+FvitVhFPo
	eoUsLesVzC1kIxRe/ZTlMXteiR0LHH9h+wDTCGKYDDcDxVqVeJTOyuiGrTNePQvIU+3P
	lCf8ujv+8zaUCZZJ7aQvphCjM/3OGO6bNjI46MW1Da3Rnimzk0RZRHPv9N5vYNt2L2Ov
	b1iyunXiLUTG+0oxoqm28rD1La0aE3y8aUGZY1HyETwnOg3siO2l9k7XSi1a7+AePuLq
	swGA==
X-Received: by 10.194.82.199 with SMTP id k7mr141367441wjy.65.1452593405593;
	Tue, 12 Jan 2016 02:10:05 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	k130sm3090286wmg.6.2016.01.12.02.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 02:10:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 11:09:54 +0100
Message-Id: <1452593395-19468-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
References: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCHv2 3/4] networkmanager-openvpn: Update to 1.0.8
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
X-List-Received-Date: Tue, 12 Jan 2016 10:10:06 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.0.6.bb | 31 ----------------------
 .../networkmanager/networkmanager-openvpn_1.0.8.bb | 31 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
deleted file mode 100644
index 8334123..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "NetworkManager-openvpn-plugin"
-SECTION = "net/misc"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
-
-DEPENDS = "dbus dbus-glib networkmanager openvpn"
-
-inherit gnomebase useradd gettext systemd
-
-SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "02931c0302310d06e43d413b5a7a3261"
-SRC_URI[sha256sum] = "c982b644fa43d3019cb654a17e692bb3a7175a86d28065ea51f55ae7dfe45d8c"
-
-S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
-
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
-
-# Create user and group nm-openvpn that are needed since version 1.0.6
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system nm-openvpn"
-
-FILES_${PN} += " \
-    ${libdir}/NetworkManager/*.so \
-"
-
-RDEPENDS_${PN} = " \
-    networkmanager \
-    openvpn \
-"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
new file mode 100644
index 0000000..258ee68
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
@@ -0,0 +1,31 @@
+SUMMARY = "NetworkManager-openvpn-plugin"
+SECTION = "net/misc"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
+
+DEPENDS = "dbus dbus-glib networkmanager openvpn"
+
+inherit gnomebase useradd gettext systemd
+
+SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "758a9951ad5e20a37c72cc7326c9c750"
+SRC_URI[sha256sum] = "1b979519d72ba4d78e729d4856c5b53fad914ca7ee3ca91209ce489ba78912ac"
+
+S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
+
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
+
+# Create user and group nm-openvpn that are needed since version 1.0.6
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system nm-openvpn"
+
+FILES_${PN} += " \
+    ${libdir}/NetworkManager/*.so \
+"
+
+RDEPENDS_${PN} = " \
+    networkmanager \
+    openvpn \
+"
-- 
2.5.0


