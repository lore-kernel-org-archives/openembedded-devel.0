Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E78D1733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:17 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id h11so7695327wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=g1t9FPinDcnVpJXe0qKYUd0eLH7R7K78BW45Rn875dc=;
	b=tOde/DMO0uuhGBvl+y3YGMzeHv2lLhliqpy+VsMeQzRny9xv+ex5SDfimk7dwN8iEB
	ZasXm/5G09b1FaMvF4Hwtf4SFQ55rp8HKZWTA9WSOEi0iDx0HC4JXebFqqVdux5QnY2r
	oqJn9kqQbNdDRP3K5uKSRUgTv6VAl3B4rJSBKvQebsiMhxkC7qDO8xYJudVztAdHWqnY
	iJUIrLSDgG+OmMz1F7hg/dJ4Y9a0Yni0F0rC1oZwRKFK0CjCWBgG+nSK3jAnJ66Nr2Qm
	e84VH18+NVIo1/WR4sUHHAX0cVyxM1yFvZanOJakBLrkyL5XxfH/mEYWbdXaxhqQFJ8l
	aavA==
X-Received: by 10.180.21.161 with SMTP id w1mr9945436wie.44.1423776136643;
	Thu, 12 Feb 2015 13:22:16 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:43 +0100
Message-Id: <1423776119-14981-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/19] modemmanager: update to 1.4.2
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

modemmanager has moved to freedesktop.org

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../modemmanager/modemmanager_1.4.2.bb             | 39 ++++++++++++++++++++++
 .../networkmanager/modemmanager_0.6.0.0.bb         | 29 ----------------
 2 files changed, 39 insertions(+), 29 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
new file mode 100644
index 0000000..48af426
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
@@ -0,0 +1,39 @@
+SUMMARY = "ModemManager is a DBus-activated daemon which controls mobile broadband (2G/3G/4G) devices and connections"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ModemManager/"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+inherit autotools gettext gtk-doc systemd
+
+DEPENDS = "glib-2.0 libmbim libqmi polkit udev dbus-glib"
+
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+SRC_URI[md5sum] = "fe74eaa9a77e51e552b4356b4c7195cb"
+SRC_URI[sha256sum] = "07d332fbe6f45f788f740810951e04042aaf023bd5ecf8ef0b3a06e37703585d"
+
+S = "${WORKDIR}/ModemManager-${PV}"
+
+FILES_${PN} += " \
+    ${datadir}/icons \
+    ${datadir}/polkit-1 \
+    ${libdir}/ModemManager \
+    ${systemd_unitdir}/system \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/dbus-1 \
+    ${libdir}/ModemManager/*.la \
+"
+
+FILES_${PN}-staticdev += " \
+    ${libdir}/ModemManager/*.a \
+"
+
+FILES_${PN}-dbg += "${libdir}/ModemManager/.debug"
+
+SYSTEMD_SERVICE_${PN} = "ModemManager.service"
+# no need to start on boot - dbus will start on demand
+SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
deleted file mode 100644
index 5ff18da..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DEPENDS = "ppp udev glib-2.0 dbus-glib"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-
-inherit gnomebase gettext
-
-SRC_URI = "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/ModemManager-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "f32640f6672d997ec0887307186e9639"
-SRC_URI[sha256sum] = "d4468300cf4aa7baf21c8564fa515e578056f34de5a64f452b053331f89e8ae2"
-
-S = "${WORKDIR}/ModemManager-${PV}"
-
-FILES_${PN}-dbg += "${libdir}/ModemManager/.debug \
-                    ${libdir}/pppd/*/.debug"
-FILES_${PN}-dev += "${datadir}/dbus-1/interfaces \
-                    ${libdir}/pppd/*/*.la \
-                    ${libdir}/ModemManager/*.la"
-FILES_${PN}-staticdev += "\
-                          ${libdir}/ModemManager/*.a \
-                          ${libdir}/pppd/*/*.a"
-FILES_${PN} += "${datadir}/dbus-1/*services/ \
-                ${libdir}/ModemManager/*.so \
-                ${libdir}/pppd/*/*.so \
-                ${base_libdir}/udev"
-
-RRECOMMENDS_${PN} += "ppp"
-- 
1.9.3


