Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 64CE2771B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:45 +0000 (UTC)
Received: by wmww144 with SMTP id w144so173226822wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wXoMhi/6kG0kyW3btG7fH3X3RfqzZ7i/phD9Sp859/Q=;
	b=Q+kaZ8+9/CaWFGQOtLTcNTSqDo2bxOwu6FedsGn3nBOgtwJRg4rA3rwPOmhfVx4YXO
	fN2jpEO3+hN8b+/IJoleAILvbsIntv2RGTfv7KZd/FycQkchPn3ZKgCL0Ozs2yxAe8o/
	+XrJ6Mb3HSuoJPlgBRsdD1JN/VA9+Y9FZSywBsWYvGMJJ1svOIFFPnwm37jGZ4dUrf76
	Re/hn8IH+k2jRPliFRwZTtMyE5Z/dYI2s98Ilyowhf9ucQ8+FYu4o1hd13RgQUlvFpkU
	UjnCfzVxp1ZfinmSWMLmw16N974BTbgr+KbBVO2s2YHE4Z/lz8atbnDkZVW+Uee4whtD
	qNEg==
X-Received: by 10.194.176.70 with SMTP id cg6mr13777742wjc.155.1447271326056; 
	Wed, 11 Nov 2015 11:48:46 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:45 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:20 +0100
Message-Id: <1447271300-4153-18-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 17/17] networkmanager: add openvpn plugin
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:46 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.0.6.bb | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
new file mode 100644
index 0000000..d805db9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
@@ -0,0 +1,32 @@
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
-- 
2.4.3


