Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17h-00005w-9L
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:54 +0200
Received: by mail-ee0-f41.google.com with SMTP id d4so3303317eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=og7gcz7DYLp41ZWGdk0qYkvy2rzYzNbt5+u9pUCAp2k=;
	b=leFwoZCQ2yQNlCvNBxwn1pfCJjk1iMsbX7nyhue8SV19kpJhJszy0OrhDAhVS29u3l
	nK6YSz+tdNl8Iik2q/Ldfaikq7bnxatb2VbEknLDkb3BJRuMemixy4hTGRSmqNfoHEqZ
	PtRVo9n1ViXTcp5hJKzm3w9EVa3WkO1rSuOriPprFHrzVAdaLH8RWZTwwBxSLgAbftSn
	8IgcRuil9ehJhRPkevQXOTvbVVGRvvTWvheNsyuUfbq0noGvdxrRnqK6Svzes0JNhGO4
	Tdk2QDvZQKeIdgYonbAOkHhTOrn33rwyE0mCqGHZRwDtHvMrx7ACIcW69J9tx+Pq5Hih
	TKJA==
X-Received: by 10.14.3.137 with SMTP id 9mr153495404eeh.0.1368959255036;
	Sun, 19 May 2013 03:27:35 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:10 +0200
Message-Id: <1368959233-28288-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 08/11] gtkmm: update to 2.24.3
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
X-List-Received-Date: Sun, 19 May 2013 10:45:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

build test of pavucontrol and gnome-system-monitor which depend on gtkmm

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb |   31 ----------------------------
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb |   20 ++++++++++++++++++
 2 files changed, 20 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
deleted file mode 100644
index 340657e..0000000
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "C++ bindings for the GTK+ toolkit."
-HOMEPAGE = "http://www.gtkmm.org/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
-
-PR = "r1"
-
-DEPENDS = "atk pangomm glibmm gtk+ cairomm"
-
-inherit gnome autotools pkgconfig
-
-SRC_URI[archive.md5sum] = "c0cb0ea5bc1ab511d9b2461083f0445f"
-SRC_URI[archive.sha256sum] = "c1199bbee423d6f0ef9b5e88973c5620a1e1c52f9f1298dffcfa36284a7fd91a"
-
-EXTRA_OECONF = " --disable-documentation "
-
-do_install_append () {
-    install -d ${D}${includedir}/gtkmm-2.4
-    install -m 0644 gdk/gdkmmconfig.h ${D}${includedir}/gtkmm-2.4
-    install -m 0644 gtk/gtkmmconfig.h ${D}${includedir}/gtkmm-2.4
-}
-
-PACKAGES =+ "${PN}-demo"
-
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-FILES_${PN}-demo += "${datadir}/*/demo/"
-
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
new file mode 100644
index 0000000..2e09071
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "C++ bindings for the GTK+ toolkit."
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
+
+inherit gnome autotools pkgconfig
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "42fc5a3feeb33ea59b7660200e2a5465"
+SRC_URI[archive.sha256sum] = "c564a438677174b97d69dd70467cb03c933481006398dc9377417aa6abe02a39"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
1.7.4.4



