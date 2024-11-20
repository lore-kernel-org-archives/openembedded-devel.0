Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CBDD711D0
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 17:33:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.19896.1732123984259275760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 09:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kfHl8z7+;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c803787abso9958025ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732123983; x=1732728783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKxnetvivtlFj+9JDqT9Gjiopdb9dD96vQousxjgUxY=;
        b=kfHl8z7+9gsBFv2jXm1pSLajobxb7vJ/AoYBE2BaPbJVCBd8ultMAPcgjr4apHV1ij
         aVy5J3ppfgbkRnAgdEApIo4PPzi8Tui0rha09st/zTkdMPfTcxVhmcXdids0Mxx5jeJA
         f1lundx9zYizluQd4ldDTML/q0MQL4TaxWx77il9ExnfzP5dTZqBfX8+vWO8RoOM89Sd
         bjzMn+J+Dkf6g2WZW1nL2JGYYvop0in/IshxNUcfF2D5srOTPw3tav6mEhVPG4GyARtp
         yZyvgHtg0bJOSEP3wanPI8yCoXb83rM3W6pBrK/DbdH/Bv2AKN+9zg1Kj5kp8VlA2xsz
         TCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123983; x=1732728783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKxnetvivtlFj+9JDqT9Gjiopdb9dD96vQousxjgUxY=;
        b=nXqP7VPzINfbl6KyWX068HERM5KPznaeOx+ylz9yUz6Nwuxbnm2Lq9v6x8yCNmtdTA
         CMdkqPZABFFqTPXB2J+W8ZVl5wkxoW4jgzsveo6QAWLPSi5zxP0MltPb4k9pOxBnmE9C
         KApIbJ1/kpCfNhX0yaT+LF41euHXho3747W9eLwpcSrDVcAhdcK6Urr8nzyv/zobWtmz
         lRpXAWTpVXO04oBLkqgI+Nsv3V5HIGhdk4cOcj62JtAtPpmrp225TzkTJO7aoVOy9eyX
         0b1p2b0fNtzPZBG4NRhj7/ieyMKC4En/Bfze5bTY3DwAiAOlaGG6np3bFmLWIcnwOm4l
         fgnw==
X-Gm-Message-State: AOJu0YxYQlYi3ItVkF1f7js3q3Z5jYV/PE9GOjaH/P33YrevOzgvLsei
	ZkYDGBafFMTI6uAlYuEkfgJOlBQlbjWimhVyoEn879UBjTi13ObtEGL+xA==
X-Google-Smtp-Source: AGHT+IHSgaMmmPLxjKfXERby53z5r5zYIeMCQnbMKGHIuoL1Zdi2ch9w6EOiYzozKXmJIlE2Bgp2kQ==
X-Received: by 2002:a17:902:e88c:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-21283c74f86mr178965ad.13.1732123983344;
        Wed, 20 Nov 2024 09:33:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2121859c307sm61533885ad.238.2024.11.20.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:33:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] tk: Add recipe for TK 9.0.0 release
Date: Wed, 20 Nov 2024 09:32:57 -0800
Message-ID: <20241120173258.3321858-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 17:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113930

Core is upgrading TCL to 9.0.0 as well, this has to
be done in tandem

Rename tk 8.x as tk8 recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tcltk/{tk => tk8}/confsearch.diff          |  0
 .../tcltk/{tk => tk8}/fix-xft.diff             |  0
 .../tcltk/{tk => tk8}/tkprivate.diff           |  0
 .../tcltk/{tk_8.6.15.bb => tk8_8.6.15.bb}      | 10 +++++-----
 .../tcltk/{tk_8.6.15.bb => tk_9.0.0.bb}        | 18 ++++++++----------
 5 files changed, 13 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-devtools/tcltk/{tk => tk8}/confsearch.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk => tk8}/fix-xft.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk => tk8}/tkprivate.diff (100%)
 copy meta-oe/recipes-devtools/tcltk/{tk_8.6.15.bb => tk8_8.6.15.bb} (94%)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.15.bb => tk_9.0.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk8/confsearch.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
rename to meta-oe/recipes-devtools/tcltk/tk8/confsearch.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk8/fix-xft.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
rename to meta-oe/recipes-devtools/tcltk/tk8/fix-xft.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk8/tkprivate.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
rename to meta-oe/recipes-devtools/tcltk/tk8/tkprivate.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
similarity index 94%
copy from meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
copy to meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
index 1438a05625..f277b86d91 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe \
     file://xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
 "
 
-DEPENDS = "tcl virtual/libx11 libxt"
+DEPENDS = "tcl8 virtual/libx11 libxt"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
+    ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
     file://confsearch.diff \
     file://tkprivate.diff \
     file://fix-xft.diff \
@@ -29,13 +29,13 @@ SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
 
-S = "${WORKDIR}/${BPN}${PV}"
+S = "${WORKDIR}/tk${PV}"
 
 # Short version format: "8.6"
 VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
 
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
-
+CFLAGS += "-I${STAGING_INCDIR}/tcl${VER}"
 inherit autotools features_check pkgconfig
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
@@ -73,7 +73,7 @@ FILES:${PN}-lib = "${libdir}/libtk${VER}.so*"
 FILES:${PN} += "${libdir}/tk*"
 
 # isn't getting picked up by shlibs code
-RDEPENDS:${PN} += "tk-lib"
+RDEPENDS:${PN} += "tk8-lib"
 RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
rename to meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
index 1438a05625..7deba151f7 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
@@ -15,16 +15,12 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe \
     file://xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
 "
 
-DEPENDS = "tcl virtual/libx11 libxt"
+DEPENDS = "tcl virtual/libx11 libxt zip-native"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
-    file://confsearch.diff \
-    file://tkprivate.diff \
-    file://fix-xft.diff \
 "
-
-SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec"
+SRC_URI[sha256sum] = "f166e3c20773c82243f753cef4b091d05267cb7f87da64be88cb2ca5a2ba027e"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
@@ -44,7 +40,6 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "\
-    --enable-threads \
     --with-x \
     --with-tcl=${STAGING_BINDIR}/crossscripts \
     --libdir=${libdir} \
@@ -53,8 +48,6 @@ EXTRA_OECONF = "\
 export TK_LIBRARY='${libdir}/tk${VER}'
 
 do_install:append() {
-    ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
-    oe_libinstall -so libtk${VER} ${D}${libdir}
     ln -sf wish${VER} ${D}${bindir}/wish
 
     sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
@@ -69,7 +62,10 @@ PACKAGECONFIG[xss] = "--enable-xss,--disable-xss,libxscrnsaver libxext"
 
 PACKAGES =+ "${PN}-lib"
 
-FILES:${PN}-lib = "${libdir}/libtk${VER}.so*"
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+FILES:${PN}-lib = "${libdir}/libtcl9tk${VER}.so*"
 FILES:${PN} += "${libdir}/tk*"
 
 # isn't getting picked up by shlibs code
@@ -96,6 +92,8 @@ tcl_package_preprocess() {
                -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
                -e "s;${STAGING_INCDIR};${includedir};g" \
                -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+               -e "s;${B};${libdir};g" \
+               -e "s;${WORKDIR};${TARGET_DBGSRC_DIR};g" \
                ${PKGD}${libdir}/tkConfig.sh
 
         rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh

