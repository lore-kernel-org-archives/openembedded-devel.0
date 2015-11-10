Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CE7DA77181
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:14 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so29566470wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IMTHHj1AMLTKNMuZAiLc5mQ3bjf7HNc6R1dAy+hDmKA=;
	b=z6lYKN8ibN6dYWwmjbWWy/05iVVwmAcQOnuBkHapEK83wbF4FHepDsq609hZ+aaRCd
	sacXalVSyGW0Xt6Iik4y5Cg5EBEaPD2xVQUBZslGaPTEpPDrTUThVU8LHCU6AnAqCllt
	NJfOT8ENazDaikWXG0FzoUvNBaHn1oun/DI1WAKZSFTmFg5J3J+GFMi5PNriVIm4F3BA
	gBYZq+VWMsuLNiUdNUI1WYQS6SMhIWHZE8tL0TZ2Jpu/zmrgUiSoXwUOz7pe2JkwZB6T
	TIr1vA8tSs2fpTPVvwU743CmSAWOzM9goJ/gihpib4TEIdK85vwhziFpnfFSSQoxWkR4
	DOww==
X-Received: by 10.28.1.146 with SMTP id 140mr1233039wmb.73.1447192214939;
	Tue, 10 Nov 2015 13:50:14 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:14 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:24 +0100
Message-Id: <1447192164-9399-18-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 17/17] networkmanager: add openvpn plugin
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:15 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.0.6.bb | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
new file mode 100644
index 0000000..cebfe41
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
@@ -0,0 +1,43 @@
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
+SRC_URI[md5sum] = "02931c0302310d06e43d413b5a7a3261"
+SRC_URI[sha256sum] = "c982b644fa43d3019cb654a17e692bb3a7175a86d28065ea51f55ae7dfe45d8c"
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
+
+FILES_${PN}-dbg += " \
+    ${libdir}/NetworkManager/.debug/ \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/NetworkManager/gdb-cmd \
+"
+
+FILES_${PN}-staticdev += " \
+    ${libdir}/NetworkManager/*.la \
+"
-- 
2.4.3


