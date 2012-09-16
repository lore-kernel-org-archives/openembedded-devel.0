Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDKDA-0004x5-Qu
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Sep 2012 21:08:56 +0200
Received: by bkcik5 with SMTP id ik5so1983458bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Sep 2012 11:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2mqoYAFsXMeksLys3YU4rOWguZOZOVSq+fGaozb1mQY=;
	b=hQ4XnGnLmvOGKV/3DlILK20uMzXfIZEczIm6AF70/V27F3LQyQhF9FTj1vrWlgtn8r
	k0L8QsIgP4Z3QosUkg7ttSdArSqaADE2d4iOKB/i2Ykvzbgumc1WQKIm1qcXWOcEfTOA
	CsrdhsocyoegmkSCF7Kyk88tPgMyXhQo9hBkrfRWF+f7RkRKMxgJieLQiR4Dmxg16L5s
	HuHxwP7WyjejFiU4hFpkAJTiHV/sEHI9CYOJCIIHuebpnMVXWD524IVgXAnne4vkpKis
	+tbRdpPXshFaiINY6t6BGB1AOZDOobJGqNIz4WMNCC1hZgf0MM3H+p7F3ghOHB53qRRN
	PkFQ==
Received: by 10.204.10.92 with SMTP id o28mr3758244bko.39.1347821289037;
	Sun, 16 Sep 2012 11:48:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm3988251bkv.11.2012.09.16.11.48.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Sep 2012 11:48:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Sep 2012 20:48:13 +0200
Message-Id: <1347821293-13320-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <20120916143010.GB3628@jama.jama.net>
References: <20120916143010.GB3628@jama.jama.net>
Subject: [meta-oe][PATCH] recipes: bump PR to rebuild after libffi5 -> libffi6
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
X-List-Received-Date: Sun, 16 Sep 2012 19:08:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion.inc                                 | 2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb                           | 2 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb                    | 2 +-
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb            | 2 +-
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb                         | 2 +-
 meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb                | 2 ++
 meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb         | 2 +-
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb                       | 2 +-
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb                      | 2 +-
 meta-oe/recipes-devtools/vala/vala_0.16.0.bb                         | 2 +-
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb                   | 2 +-
 meta-oe/recipes-navigation/navit/navit_svn.bb                        | 2 +-
 meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb | 2 ++
 meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb        | 2 ++
 meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb           | 2 ++
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb                    | 2 +-
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb                 | 2 +-
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb                   | 2 +-
 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb                       | 2 +-
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb                    | 2 +-
 meta-systemd/recipes-core/systemd/systemd_git.bb                     | 2 +-
 21 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/emotion.inc b/meta-efl/recipes-efl/efl/emotion.inc
index 08a24b2..134ef40 100644
--- a/meta-efl/recipes-efl/efl/emotion.inc
+++ b/meta-efl/recipes-efl/efl/emotion.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base eio"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 8b1064a..1eb9c13 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary tiff"
 PV = "2011.01.13.1+svnr${SRCPV}"
 PE = "1"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 75c10ae..8c3aab4 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "d99089a63a6cfc1a6a4a026be9278028d47d224088d24b1853acb67e95
 #want 2.x from 2.x.y for the installation directory
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
-PR = "r6"
+PR = "r7"
 
 inherit autotools pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index c114c0e..9064251 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
 
 PV = "2.30+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index b6df81b..c1f535b 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/3.2/gtk+-${PV}.tar.xz \
 SRC_URI[md5sum] = "b4edcc69e39159dd7be17828249afb46"
 SRC_URI[sha256sum] = "e2cf20f2510ebbc7be122a1a33dd1f472a7d06aaf16b4f2a63eb048cd9141d3d"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
index 45adbd7..3e91e97 100644
--- a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -3,6 +3,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
+PR = "r1"
+
 DEPENDS = "dbus gtk+"
 
 inherit gnome
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index ef0329e..e30b1ab 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender" 
-PR = "r3"
+PR = "r4"
 
 inherit gpe pkgconfig autotools gtk-doc
 
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
index 6604091..c864153 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
@@ -1,6 +1,6 @@
 require glibmm.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3"
 SRC_URI[archive.sha256sum] = "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
index 228f96c..a6044cd 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
@@ -1,6 +1,6 @@
 require libgee.inc
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 DEPENDS += "gobject-introspection-stub"
 DEPENDS_virtclass-native += "gobject-introspection-stub-native"
 
diff --git a/meta-oe/recipes-devtools/vala/vala_0.16.0.bb b/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
index 1dd190f..92120b4 100644
--- a/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
+++ b/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
 
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
index 6ae391f..86b4958 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
+++ b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
@@ -1,6 +1,6 @@
 require libsexy.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
 SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e"
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index 1350751..a8df317 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -2,7 +2,7 @@ require navit.inc
 
 SRCREV = "5159"
 PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 S = "${WORKDIR}/${PN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
index 118543b..338ff8c 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
@@ -4,6 +4,8 @@ DEPENDS = "claws-mail gtkhtml2 curl"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
 
+PR = "r1"
+
 SRC_URI = "http://www.claws-mail.org/downloads/plugins/gtkhtml2_viewer-${PV}.tar.gz"
 SRC_URI[md5sum] = "a6c9dfa6f969ccd844796a5724b52167"
 SRC_URI[sha256sum] = "4d41f6d961efaac0f51705e5052bac732bc0bdafee2ef2082a9cf9d89f183ae5"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb
index 8cb7fd0..119892f 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb
@@ -4,6 +4,8 @@ DEPENDS = "claws-mail"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+PR = "r1"
+
 SRC_URI = "http://www.claws-mail.org/downloads/plugins/mailmbox-${PV}.tar.gz\
            file://claws-plugin-mailmbox-fixup.patch"
 SRC_URI[md5sum] = "0a5907628c1112cf8e5fe251ed1db551"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb
index 767c672..b25f345 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb
@@ -4,6 +4,8 @@ DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
 
+PR = "r1"
+
 SRC_URI = "http://www.claws-mail.org/downloads/plugins/rssyl-${PV}.tar.gz"
 SRC_URI[md5sum] = "7dfd8ae53cf1ed88d5e4150f77b9df63"
 SRC_URI[sha256sum] = "b02eff373fd66daec2ffd75afd3ad97c32c45679883ee65b21aa50fec92fc752"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index d0da532..f42d0da 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2 \
   file://glib-2.32.patch \
diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 91fe692..fe94fc4 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -5,7 +5,7 @@ SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 2e93690..1e42cad 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "glib-2.0 gstreamer"
 
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
index 4e26c98..d229c15 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
@@ -1,5 +1,5 @@
 require pidgin.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEPENDS += "farsight2 libidn"
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
index 6f1a022..1217d6c 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
@@ -1,6 +1,6 @@
 require poppler.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "lcms"
 
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 09bc635..337424e 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r6"
+PR = "r7"
 
 inherit useradd pkgconfig autotools perlnative
 
-- 
1.7.12



