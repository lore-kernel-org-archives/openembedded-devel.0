Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17e-00005m-Dy
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:50 +0200
Received: by mail-ee0-f43.google.com with SMTP id d41so3131441eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=E27jaR0pY+SVu5SQkgulr4hz1N5T8qfaeWZreMzA2Bc=;
	b=UcZ5CCIHpeBXu127KcRdZ3AcODxrXcaULPAq55wvUQ67DxAmVQ68JMlJbUTm1WPjfb
	XBcGnT966zd4qGTDlEz0F0plkrjyc35pUQ9mhB1tW3efcHC1BSqa4bgANqG8q6DKzEq9
	5YSaT3SQdsO+mHbrMu5vmTfSgy+tgzYcEEgZURXZihVUSPBEQCxreskco+WGVFYq6Bq9
	ypiQyUtbnDZW7gqXCai570RpIPVyxxbaQBk9q8SM7+TKC1210fG5Kzm0TZCIcTtFA6LH
	mRG2PB2ZcWO5P6UruoAOY2ybCWztvRQs8+u7RQPL57QTBB4eps18u3jVdOg9s7o+2zZR
	vaiA==
X-Received: by 10.14.1.7 with SMTP id 7mr109763148eec.41.1368959251997;
	Sun, 19 May 2013 03:27:31 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:08 +0200
Message-Id: <1368959233-28288-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 06/11] gtkmm: merge gtkmm.inc into recipe - and cleanup a bit
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
X-List-Received-Date: Sun, 19 May 2013 10:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm.inc       |   29 ----------------------------
 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb |   28 +++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm.inc

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm.inc b/meta-oe/recipes-gnome/gtk+/gtkmm.inc
deleted file mode 100644
index fe72a73..0000000
--- a/meta-oe/recipes-gnome/gtk+/gtkmm.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "C++ bindings for the GTK+ toolkit."
-HOMEPAGE = "http://www.gtkmm.org/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "atk pangomm glibmm gtk+ cairomm"
-
-inherit gnome autotools pkgconfig
-
-INC_PR = "r0"
-
-EXTRA_OECONF = " --disable-documentation "
-
-LIBV = "2.4.0"
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
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
index 05d7108..340657e 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
@@ -1,7 +1,31 @@
-require gtkmm.inc
+DESCRIPTION = "C++ bindings for the GTK+ toolkit."
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
 
-PR = "${INC_PR}.2"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+PR = "r1"
+
+DEPENDS = "atk pangomm glibmm gtk+ cairomm"
+
+inherit gnome autotools pkgconfig
 
 SRC_URI[archive.md5sum] = "c0cb0ea5bc1ab511d9b2461083f0445f"
 SRC_URI[archive.sha256sum] = "c1199bbee423d6f0ef9b5e88973c5620a1e1c52f9f1298dffcfa36284a7fd91a"
 
+EXTRA_OECONF = " --disable-documentation "
+
+do_install_append () {
+    install -d ${D}${includedir}/gtkmm-2.4
+    install -m 0644 gdk/gdkmmconfig.h ${D}${includedir}/gtkmm-2.4
+    install -m 0644 gtk/gtkmmconfig.h ${D}${includedir}/gtkmm-2.4
+}
+
+PACKAGES =+ "${PN}-demo"
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
+FILES_${PN}-demo += "${datadir}/*/demo/"
+
-- 
1.7.4.4



