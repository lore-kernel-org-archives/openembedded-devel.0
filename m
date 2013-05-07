Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqs1-0003d6-UG
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:36 +0200
Received: by mail-ee0-f43.google.com with SMTP id b15so596938eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=+/LhTWkR1uOtAHq26/i+nJZGrGVBVRhfpLv04O6RnAA=;
	b=oY3XO3T1wDc/IRpDW/uxhK1f+hbAKlVUZlO8wZs9vtkNRPWoB0suulVgf92eYzEqix
	sMox5y/Ex+Pflc0qel8fjOAKYEsdGClY3RzpV9gtVgJS6Xl6uD2QekRxwoAlItFRsvl/
	wJebdsw9vCMkjAyQU/rcMdYsjVtfiX1JWqN/OGSH4Ly53/BFvN/DshHDLzt+qkl5wtYT
	f88Q07dfiE/NFIMBkXKbif3uzrZfrVkooemM4evC2h1Muzj6LAAH8n9VSI36Y/t9o9ig
	9sxfwJJjn6gFE08CDkS/wnwEKM/U1o+TnQaFnca0GT2RuEMuq44S0u8Q2s7bZfm5+D7U
	5gKw==
X-Received: by 10.15.95.74 with SMTP id bc50mr9974900eeb.36.1367966548768;
	Tue, 07 May 2013 15:42:28 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:52 +0200
Message-Id: <1367966513-12566-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 14/15] gnome-panel: let gconf.bblass take care for postinst
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 23:00:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-panel/gnome-panel_2.32.1.bb              |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index c4465a5..6abf73e 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SECTION = "x11/gnome"
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ pango libwnck gnome-menus cairo libgweather dbus-glib librsvg libcanberra" 
 
-inherit gtk-doc gnome gettext pkgconfig
+inherit gtk-doc gnome gettext pkgconfig gconf
 
 SRCREV = "6a364b6a4a9beed3da9ca6f5b0dac81eb99dea2a"
 SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32"
@@ -26,14 +26,6 @@ do_configure_prepend() {
     sed -i -e s:^#!@PYTHON@:#!/usr/bin/python: ${S}/gnome-panel/gnome-panel-add.in
 }
 
-pkg_postinst_${PN}_append () {
-if [ -n "$D" ]; then
-    exit 1
-fi
-    gconftool-2 --config-source=xml:readwrite:${sysconfdir}/gconf/gconf.xml.defaults \
-        --direct --load ${sysconfdir}/gconf/schemas/panel-default-setup.entries
-}
-
 PACKAGES =+ "libpanel-applet"
 FILES_libpanel-applet = "${libdir}/libpanel-applet-*.so.*"
 
@@ -43,5 +35,3 @@ FILES_${PN} =+ "${datadir}/gnome* \
                 ${datadir}/PolicyKit \
                 ${libdir}/bonobo \
 "
-
-
-- 
1.7.4.4



