Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 472 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 24 Mar 2018 09:28:28 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE9971B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 09:28:28 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 2BAEEBFF52
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 10:20:36 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 10:20:07 +0100
Message-Id: <20180324092007.17319-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] libnice: Upgrade to 0.1.14
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
X-List-Received-Date: Sat, 24 Mar 2018 09:28:28 -0000

This is the minimum version needed by the new GStreamer 1.14.0 WebRTC
support (not to be confused with the WebRTC DSP support).

New packageconfigs were added to make the GStreamer 0.10 and 1.0
support configurable.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../farsight/{libnice_0.1.13.bb => libnice_0.1.14.bb}  | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/farsight/{libnice_0.1.13.bb => libnice_0.1.14.bb} (55%)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.13.bb b/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
similarity index 55%
rename from meta-oe/recipes-support/farsight/libnice_0.1.13.bb
rename to meta-oe/recipes-support/farsight/libnice_0.1.14.bb
index 48c8221a3..775257f93 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
@@ -2,8 +2,8 @@ SUMMARY = "Interactive Connectivity Establishment library"
 DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Connectivity Establishment standard (ICE)."
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
 SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
-SRC_URI[md5sum] = "3226faeaf48a9150ada00da2e2865959"
-SRC_URI[sha256sum] = "61112d9f3be933a827c8365f20551563953af6718057928f51f487bfe88419e1"
+SRC_URI[md5sum] = "c9b9b74b8ae1b3890e4bd93f1b70e8ff"
+SRC_URI[sha256sum] = "be120ba95d4490436f0da077ffa8f767bf727b82decf2bf499e39becc027809c"
 
 LICENSE = "LGPLv2.1 & MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
@@ -11,17 +11,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+DEPENDS = "glib-2.0 gnutls"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "gstreamer1.0"
 PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
+PACKAGECONFIG[gstreamer0.10] = "--with-gstreamer-0.10,--without-gstreamer-0.10,gstreamer gst-plugins-base"
+PACKAGECONFIG[gstreamer1.0] = "--with-gstreamer,--without-gstreamer,gstreamer1.0 gstreamer1.0-plugins-base"
 
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
-FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN} += "${libdir}/gstreamer-0.10/*.so ${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-1.0/*.a"
+FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug ${libdir}/gstreamer-1.0/.debug"
 
 do_configure_prepend() {
     mkdir ${S}/m4 || true
-- 
2.14.1


