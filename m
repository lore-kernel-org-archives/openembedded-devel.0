Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2B1746E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:25 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id f14so8052904wre.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=x8ebtKiqfmtIEPDu4dk4zrTF8hqdTSM8wuLJbGACA/8=;
	b=FUevaakEo6uMlIMRwDCE7z/kTeOWkCoBPsUcEKZS1z49tw7bsV8ffCHsPzkb9XXsPb
	7B5rt3XXTKTjzE6z21Q94Zssot68wXFWQkecMMHanw2ot9z2EUMkZaPA0lWLxPG8q1Ta
	86DBAu6V+GxI+pQ6+h832ZK2mYH4zylvPn3p7C1MRP2hgEHbzPLmK3HN/aiNFUSsyr5K
	u7mUJkH/kF8hfHhgWZ2P8ybCPPJfuyPUCpHTEvzHuQ9lizLS+479r7mcTvFEnYCBtgmV
	V5PaSFIXbtSe/Ng3xw/LWaZNxuh6cMhQWQDO1sPHaesyBlk4Ncxm6boNsa1OER1WFKJ0
	lxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x8ebtKiqfmtIEPDu4dk4zrTF8hqdTSM8wuLJbGACA/8=;
	b=AVkEGDSAadRieCiV0zETciKlzPZ7/BZFYiGdTxe0nbSIBYC9eGjwrkaXBOnaYilXge
	GXu3XPQDA+rrp8f0jVkSEJQKt35smmIk8wmjX1qsF1VRT9HGpCJDZywq2Pw9/9Xki9u2
	8QxgfWQqxXiLssuSeRI/IaqEx2nhyUnqQ8u3fvIvWQU3ZMSmUMHBQJjiDrkockMk83rc
	XRz+3xr5chEymGmMB773DF8rN9+C3veQANBFmcJb7Kl2TeI3kQTdmVeU360GGKtWnzsG
	J4yKfq7bo42ETQrvIJ0sLxErn8veP92hNf+49U7V10nY2HiJ+CCOwl7u8OX0cwEWQOEH
	n/LQ==
X-Gm-Message-State: AElRT7HDUWX61PfwBfGwrVs0b5oP7RTCWJavqR7dyXsmiHDfKhF0ItrI
	bM3EYs+4hPZvU8PJQQcKBlq9aQ==
X-Google-Smtp-Source: AIpwx49FN0NYs8bi/ZlXmst5Yd/8l0hGzt6pLAyc6SC22iKkuVTnsj6VqkgDl5ix8GlnaT41w3Lhmg==
X-Received: by 10.223.178.163 with SMTP id g32mr10052801wrd.204.1522416745984; 
	Fri, 30 Mar 2018 06:32:25 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:33 +0200
Message-Id: <20180330133151.25882-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/39] metacity: remove
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:26 -0000
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


