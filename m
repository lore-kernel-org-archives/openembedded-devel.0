Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDZAX-0000iU-4r
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:07:13 +0200
Received: by bkcik5 with SMTP id ik5so2250964bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4BJTHwic61n2HAC5bC2TABXfaBBRP1U1Gndc5Tq3nH8=;
	b=blAxzEEoWCAz6r2aEhF6E8sR4HXyerHFLkZn5RWKIeOjG60J8Il1wFFEcF7T7INlI4
	YyNDqJj007R5TUP/yw84puj+kxeM0sVJrh0DCJzzzm2gFhomGAVBwt1pFuQ+wTlDe7IS
	o8qiw+OzQtzV23WpW5NrWZwexi6T57f/8wPVTsLvtpZpO92ojklSvCPPFExU+TxtO4+9
	MG37OXXIKEOxAp3y1aXoArQcd2pQvrP8NhmorM6dO5AiaMfDWL9xTgn1mnKtgOEM2uRw
	DqQDZibyKxQI32Jp1ic9soHKZaAGBzO/PSBi9q9q4NPTfPQiZyKAmhkw+p4mN84sbrih
	pzMg==
Received: by 10.204.7.91 with SMTP id c27mr4107600bkc.17.1347879274776;
	Mon, 17 Sep 2012 03:54:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm5061677bkm.10.2012.09.17.03.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:54:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:54:39 +0200
Message-Id: <1347879279-17253-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1347821293-13320-1-git-send-email-Martin.Jansa@gmail.com>
References: <1347821293-13320-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] recipes: few more PR bumps to rebuild after libffi5 -> libffi6
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
X-List-Received-Date: Mon, 17 Sep 2012 11:07:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb | 2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb              | 2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb              | 2 +-
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb                        | 2 +-
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb       | 2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb                     | 2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb               | 2 +-
 meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 4aad4a8..44e0171 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r4"
+PR = "r5"
 
 inherit gnome pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
index 20331bd..a4f1ec2 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
-PR = "r3"
+PR = "r4"
 
 SECTION = "libs"
 
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
index 8f3e4e1..169dac5 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
@@ -10,7 +10,7 @@ SRC_URI = "${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
 SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
 
-PR = "r3"
+PR = "r4"
 BBCLASSEXTEND = "native"
 
 IDL_COMPILER_DEPENDS = "orbit2-native"
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index 58fdbfa..3ac40aa 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
 
 DEPENDS = "libgsf glib-2.0"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
            file://pkgconfig.patch"
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 67cb325..a80447f 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "t1lib gtk+ popt libxslt libxml2"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
            file://mathview-gcc43x.diff \
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
index 69fa95f..05d7108 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.20.0.bb
@@ -1,6 +1,6 @@
 require gtkmm.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI[archive.md5sum] = "c0cb0ea5bc1ab511d9b2461083f0445f"
 SRC_URI[archive.sha256sum] = "c1199bbee423d6f0ef9b5e88973c5620a1e1c52f9f1298dffcfa36284a7fd91a"
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
index 44dcbd3..2007e9c 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "mm-common cairomm glibmm"
 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
index b0af84b..625a57e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r2"
+PR = "r3"
 
 PATCHSET = "6"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
-- 
1.7.12



