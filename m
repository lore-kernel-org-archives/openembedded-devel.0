Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7N-0000Dh-GJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3179728eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NYMxOtJ5COJbHCyOL0WDcXLX4uwhuRqDNJQqSYZlWMY=;
	b=UG0jyiL2UtChjPkJw7Wv+QRXWr+6AIpckV1X7NNYPXeSGpAwTi6G+oQ4Ueq9J5zMQp
	clC/easovq5mFeiO2KbFWmPp0+3jqHr6fGljQLA5pPeLMl08iDOFlfNLS32M7wP5ZAye
	TCvFTP+Ql4a6KPBm0l7Y50ht7nDhuARmXinmZGZnnoqCVhms6AlKwJlNto6ZOsHx+ZyZ
	1V97B0AOH7GrH6IzrAODVIx6s8miFrSM004wc6eI1Hv+q7WL78zEtEbNgi1hAGE/+lNx
	inphBD/Cw/CuOLkNLlKvyMnDoOR2GUzwIZaIg1XUcbUh4A5Ixc59WA/a3Ygcql2uVYPc
	vsXA==
Received: by 10.14.207.6 with SMTP id m6mr65041337eeo.10.1354744359411;
	Wed, 05 Dec 2012 13:52:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm11791756eep.1.2012.12.05.13.52.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:02 +0100
Message-Id: <0eb7e0579b6ae28a48667ead050372f9d790209d.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 79/85] gnome-mplayer: fix unpackaged files warning
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:02 -0000

* fixes:
gnome-mplayer-1.0.5: gnome-mplayer: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/nautilus
  /usr/lib/nautilus/extensions-2.0
  /usr/lib/nautilus/extensions-2.0/libgnome-mplayer-properties-page.so
  /usr/lib/nautilus/extensions-2.0/.debug
  /usr/lib/nautilus/extensions-2.0/.debug/libgnome-mplayer-properties-page.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index b755dfa..2eded51 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -5,6 +5,8 @@ SECTION = "multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+PR = "r1"
+
 DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
 
 SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
@@ -14,6 +16,11 @@ SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a34
 EXTRA_OECONF = "--with-gio --with-alsa --with-dbus --with-libnotify"
 
 FILES_${PN} += "${datadir}/gnome-control-center/default-apps/${PN}.xml"
+PACKAGES =+ "${PN}-nautilus-extension"
+FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
+FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
+FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
 
 inherit gettext pkgconfig mime gtk-icon-cache autotools
 
-- 
1.8.0



