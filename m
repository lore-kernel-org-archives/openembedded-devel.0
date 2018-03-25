Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 587287866F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:36 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id 80so15143308wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=x8ebtKiqfmtIEPDu4dk4zrTF8hqdTSM8wuLJbGACA/8=;
	b=GZZPy9/Xr0t64I0sp7PaERvnyiGyx9AvBRIwBcSwKwPxdKCm7bBimvkpFZz1L/hKwz
	h9pT0fpgHz85yualEhLMIdeKlJ+jPLLS1nEBInd55A1hxQr5pglUfLf17VtdUyziZbIj
	9QKkM0riOHGqHsJzRw+eSfqnY+FBFe8gbfH5nkdQl/n9ly5DcCTJVPds1LFqBFTn1dqg
	J8o97vBpmDJMYHR0KJyjlP/6yYPP0fMYmf8atNvU6zq209+Q6Vm7WTEghTg7V8lBOZUh
	bKZo+3XlfOLlD4snubFFHC59zJp92qFLLLRyfr+3f9zi62mbcYuBUaau0pxOyEAa93Fr
	1MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x8ebtKiqfmtIEPDu4dk4zrTF8hqdTSM8wuLJbGACA/8=;
	b=rbTLqCN+Yiwdn3yUFiUaEBwwj5mYPWIIqheG2CUO4puo/OcBIH/i4Rhnk3x39QawGw
	UzU8aEFGSUIo9dh88HEudGB/pv1Mtjy4FqukXDyOMF6zGWAxdXvh5R6l+CWOUdi4t6TG
	q/D0x4MPnieQEkjPeAuztDVw6rC7/WEy71o4Eo8DulZF3R/2SKhd6AUTGRbvM4xf6PfH
	RVAmf+3gIp8Q403+smZhG91CyIIlyPCbfRYCiF5CsIz6qxbZlWd2ZrIllxtXCbsVhJGB
	P8VRwl3/tF0hQfF1GY8DWaJtXNrVGfa5wu9LwiTkszweGC9HLBiXjw2pDVOECBAhuG7n
	vZWQ==
X-Gm-Message-State: AElRT7Hg1gq2/PiTcCIkICoFEAhfkflonGu6zM80vjAvhRk0BxXT6/rs
	TPwU/XXYRTe5aW64v9KNP6Slsw==
X-Google-Smtp-Source: AG47ELsqOoc8ezmpdHD71Ze81rFEXZ3hOsWasaNXK+svgcaum62sjkmQUf5U0whMmiuJ+kGaTLDDaQ==
X-Received: by 10.223.182.143 with SMTP id j15mr22468197wre.43.1521981337041; 
	Sun, 25 Mar 2018 05:35:37 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:05 +0200
Message-Id: <20180325123520.16452-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/20] metacity: remove
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* as far as I can see nothing uses it - please stand up if I am wrong
* this version was released in 2012

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../metacity/0001-ui-Define-_GNU_SOURCE.patch      | 27 -----------------
 .../metacity/remove-yelp-help-rules-var.patch      | 28 -----------------
 .../recipes-gnome/metacity/metacity_2.34.13.bb     | 35 ----------------------
 3 files changed, 90 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
deleted file mode 100644
index 539d756b3..000000000
--- a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e7fd072f0df968f342878b77098e97ff07ed28d7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 10:26:31 -0700
-Subject: [PATCH] ui: Define _GNU_SOURCE
-
-it becomes portable across musl and glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ui/theme.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ui/theme.c b/src/ui/theme.c
-index 84b57a0..c7eafc8 100644
---- a/src/ui/theme.c
-+++ b/src/ui/theme.c
-@@ -60,6 +60,7 @@
- #include <gtk/gtk.h>
- #include <string.h>
- #include <stdlib.h>
-+#define _GNU_SOURCE
- #define __USE_XOPEN
- #include <math.h>
- 
--- 
-2.13.3
-
diff --git a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
deleted file mode 100644
index 1970e9afb..000000000
--- a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Remove unused variable (YELP_HELP_RULES)
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: metacity-2.34.13/doc/creating_themes/Makefile.am
-===================================================================
---- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
-+++ metacity-2.34.13/doc/creating_themes/Makefile.am
-@@ -1,6 +1,5 @@
- ### This part of Makefile.am can be customized by you.
- 
--@YELP_HELP_RULES@
- 
- # The name of the directory in /usr/share/gnome/help/, 
- # and the name of the main .xml file:
-Index: metacity-2.34.13/doc/creating_themes/Makefile.in
-===================================================================
---- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
-+++ metacity-2.34.13/doc/creating_themes/Makefile.in
-@@ -455,7 +455,6 @@ uninstall-am:
- 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
- 
- 
--@YELP_HELP_RULES@
- 
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
deleted file mode 100644
index 370de7000..000000000
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SECTION = "x11/wm"
-SUMMARY = "Metacity is the boring window manager for the adult in you"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
-
-DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop intltool-native"
-PR = "r1"
-
-inherit gnomebase update-alternatives distro_features_check
-# depends on startup-notification which depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-           file://remove-yelp-help-rules-var.patch \
-           file://0001-ui-Define-_GNU_SOURCE.patch \
-           "
-SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
-SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
-
-ALTERNATIVE_${PN} = "x-window-manager"
-ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
-ALTERNATIVE_PRIORITY = "10"
-
-EXTRA_OECONF += "--disable-xinerama"
-
-do_configure_prepend() {
-    sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
-}
-
-FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
-RDEPENDS_${PN} += "gsettings-desktop-schemas"
-
-- 
2.14.3


