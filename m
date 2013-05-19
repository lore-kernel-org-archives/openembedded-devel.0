Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17a-00005J-8i
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:46 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so3261887eak.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PG5GIO9NhkJZS0WgjU0C6T415rmDPvqJrtP+Ss0xhLk=;
	b=ySes1ubZ5mCN89dl2xTnFKaqzGrKBluGdlr9OkGzgKtYKMndtjFEOC5VlalTiKjaQ/
	BnkLwL6X/zM4YlYHehTyXG6VT6MjSdWEpgptzcvzk16vgDhVwdvLczQBxx7AExMTADPO
	L1TXJh9xam6zYkYh14uxISsPw+3yGTm9sYRAFWm/ClO4chpbKsXvN8e3NtX56xSOqzxK
	I41bFRKYFZ6Rztg2NWN1AJYjrmzaBj998iULqgnFmybguiP0OCRgNaissQYd+wrDI0gB
	H8L5E/KF+2yu6S/y6ayuSRrRRQbsrR13gKasWYF2kDJW7tehle6eH0JXwtziS5fJcMaJ
	jt+Q==
X-Received: by 10.15.82.201 with SMTP id a49mr152733162eez.44.1368959248007;
	Sun, 19 May 2013 03:27:28 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:05 +0200
Message-Id: <1368959233-28288-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 03/11] glibmm: merge glibmm.inc into recipe - and stylize a bit
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
X-List-Received-Date: Sun, 19 May 2013 10:45:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm.inc       |   28 -----------------------
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb |   29 +++++++++++++++++++++--
 2 files changed, 26 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm.inc

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm.inc b/meta-oe/recipes-core/glib-2.0/glibmm.inc
deleted file mode 100644
index bdb6ff8..0000000
--- a/meta-oe/recipes-core/glib-2.0/glibmm.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "C++ bindings for the glib library."
-HOMEPAGE = "http://www.gtkmm.org/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.bz2;name=archive"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    install -d ${D}${datadir}/glibmm-2.4
-    install -d ${D}${datadir}/aclocal
-
-    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
-    install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/ || true
-}
-
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
-
-LIBV = "2.4.0"
-
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
index c864153..0bdaa80 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
@@ -1,9 +1,32 @@
-require glibmm.inc
+DESCRIPTION = "C++ bindings for the glib library."
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
+inherit autotools pkgconfig
 
 PR = "r3"
 
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+
+SRC_URI = " \
+    ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.bz2 \
+    file://remove-examples.patch \
+    file://glib-2.32.patch \
+"
 SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3"
 SRC_URI[archive.sha256sum] = "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
 
-SRC_URI += " file://remove-examples.patch \
-             file://glib-2.32.patch"
+do_install_append() {
+    install -d ${D}${datadir}/glibmm-2.4
+    install -d ${D}${datadir}/aclocal
+
+    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
+    install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/ || true
+}
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
-- 
1.7.4.4



