Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id EA7BD65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=Q4cBjKR5i3GJY0MU+QQnnqNIEtglTLz7Sg56N2zAjPo=; 
	b=k10E3GBRtpbz1ESnUV+rPbhTCojttfOnZGBB86DX6i2j6DT0PKxVB2oF40Xam7oJrb0GMi7ye92H41NR4Bjf2DLDd2BKo5epAdYvoVPIUeXyE404CJpWQnXvRrS5NgfG/Gg3JHD/XG3lwnRDzAugqKV5X2xoKeLu1x2GvEkiaZddQYKB5xKWAj0XxYZk1neFAj+S+oAveroHBvlVgQxj/3ez0LyD8mveWW0YKRrUqG2YEOMmGGlBlPrWA+QlsZQQ7xNPEbJM7yLeyFq4f28jF4D3xFo3If8bRrqZO5z4f1cQdabujr8Vp/4SS0dUrFn/5BWv6qTD7Bl6f7FX1XuNkQ==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1htTHA-0001lC-OF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 10:51:00 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 10:50:30 +0200
Message-Id: <20190802085032.32687-8-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190802085032.32687-1-psaavedra@igalia.com>
References: <20190802085032.32687-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v6 08/10] ibus: Set native depends
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
X-List-Received-Date: Fri, 02 Aug 2019 08:51:00 -0000

---
 meta-oe/recipes-support/ibus/ibus_1.5.20.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.20.bb b/meta-oe/recipes-support/ibus/ibus_1.5.20.bb
index 42b9b6c61..f4e5e0cff 100644
--- a/meta-oe/recipes-support/ibus/ibus_1.5.20.bb
+++ b/meta-oe/recipes-support/ibus/ibus_1.5.20.bb
@@ -12,16 +12,19 @@ inherit autotools pkgconfig gettext gtk-immodules-cache gobject-introspection gt
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify python3-pygobject adwaita-icon-theme librsvg"
-DEPENDS_append_class-target = " intltool-native python-pygobject-native"
-RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"
+DEPENDS = " intltool dbus-glib python3-dbus iso-codes libnotify python3-pygobject adwaita-icon-theme"
+DEPENDS_append_class-target = " librsvg-native dconf "
+RDEPENDS_${PN} += " iso-codes adwaita-icon-theme"
+RDEPENDS_${PN}_class-target += " librsvg-gtk"
 
+PACKAGECONFIG[dconf] = ",--disable-dconf,dconf,dconf"
 PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
 PACKAGECONFIG[gtk+3] = ",--disable-gtk3,gtk+3,gtk+3"
 PACKAGECONFIG[wayland] = "--enable-wayland,,wayland,wayland"
 
-PACKAGECONFIG ?= "gtk+ gtk+3"
+PACKAGECONFIG ?= "dconf gtk+ gtk+3"
 PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+PACKAGECONFIG_class-native = "gtk+3"
 
 GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'ibus-gtk2.0', '', d)}"
 GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'gtk+3', 'ibus-gtk3', '', d)}"
-- 
2.11.0


