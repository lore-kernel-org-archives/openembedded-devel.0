Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1F8731CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 20:43:22 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so268563550wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 12:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g10Jn4n8xJMn9J2K/HlzuGLpYXa/7BFLljEMYMPIbiU=;
	b=0eatvjb4VwLOVukHhWt7hZ9Z9MU8HbHykgUGMksXymQ9/5as7FqnALon5sdO2ZvIYf
	AxzdVKn10f3qMhrsGlH2JuLcLeQ+hT4hdqdXF18b0z1Tgc8THSyYoiZofIHcZYV8vGF4
	9stpKQn6MhXQDSVfzyMbcxetER+EqqCG+271jcns25lVSCkldQulShZ5VzSA20RHUJvV
	jt90CYwAUiKWy9b2O2uht0jZrTm44lqByHJGqCjLNr3O4HRZHZDx4P/dGd8fWXm6ESLp
	HrQtYNmifwkzVPFc4y5TwNeYhD4WckafTQjH1INBqUBYLdnqGsd69iNaRaLu3W3GHGO3
	1RYg==
X-Received: by 10.28.188.70 with SMTP id m67mr22803791wmf.24.1452631402739;
	Tue, 12 Jan 2016 12:43:22 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	i196sm19062860wmf.23.2016.01.12.12.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 12:43:22 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 21:42:45 +0100
Message-Id: <1452631365-11516-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452631365-11516-1-git-send-email-adrian.freihofer@gmail.com>
References: <1452631365-11516-1-git-send-email-adrian.freihofer@gmail.com>
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCHv3 3/3] networkmanager-openvpn: Update to 1.0.8
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
X-List-Received-Date: Tue, 12 Jan 2016 20:43:23 -0000

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


