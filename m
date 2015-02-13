Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5EF733C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:13 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so9679955wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=j2sw5XZLke0dfsuNqpakvNMpCPc4IHjTA0mmDCzmK6U=;
	b=riwOC7P4V2L6F0OIDYZinaN2COXvHJ4tf3nutD5lBHvi5FO1PgOJCW3WLjBA5sqiPj
	+DV0ClQlFBqOFfKwsC8rk9B/GxBxQIafZBmUw02t+d2nCrEAuwio2oA/Ijrz9T+dHhci
	baxVaBr8k8f6WwWbTdA5HGR23uvgVFx/xjpsPUfajElFL95Kx6xduTLxDs7yxVMFKUft
	gMAlTssVzbZS4Dwk3gfHlP1YMK6biDoikGyWH+bp3ZUtdzatJYVpvN4RGPMafDsUmCNY
	mD2LuHwnDf+7a9ZGrFCoYPEwe/cy8Ypwv5eDim1VKrNOFqN1T/YuiDDf5xztEAJHmoVY
	viiA==
X-Received: by 10.194.71.175 with SMTP id w15mr10683078wju.16.1423810934939;
	Thu, 12 Feb 2015 23:02:14 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:43 +0100
Message-Id: <1423810919-9857-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 03/19] modemmanager: update to 1.4.2
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

modemmanager has moved to freedesktop.org

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../modemmanager/modemmanager_1.4.2.bb             | 40 ++++++++++++++++++++++
 .../networkmanager/modemmanager_0.6.0.0.bb         | 29 ----------------
 2 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
new file mode 100644
index 0000000..6dfd0e2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
@@ -0,0 +1,40 @@
+SUMMARY = "ModemManager is a daemon controlling broadband devices/connections"
+DESCRIPTION = "ModemManager is a DBus-activated daemon which controls mobile broadband (2G/3G/4G) devices and connections"
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


