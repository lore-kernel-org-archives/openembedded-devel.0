Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.1837.1621647332897747603
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sn63s0+P;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id f18so2844406ejq.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mJDJbf3O70A1cnHwoRFHfiljZ83yW4THBHpXKFCu800=;
        b=sn63s0+PvcEBfAUpseAVwu+c1q/v+duMvGUOJDp6uAUTWe6s14H9NUyNiUPsjJIV1Z
         iXdILzbTuQuVGxP82arMnLx2PyEDU1ksg504IS3hSwKjUFB42Y/D4fW1P8juM7vDgdg2
         5SIAonraPAbOImGEbdz9fEzW11bt/O2YpQrVcwTVHE9+UP4wrgNTiUiihTCb2Drzo0c0
         pgbUedY+817b0ncJnTcDOBtcUdDMyzMYrW/Xagm36Uc751CelMCdMZIo4bYdcFhztK/s
         wBd8DPr718AoHIVFKws1i2rWZKexC7Gxck+dtou6tTMgwO1b5sZKye7l3mB0ryt8WdAs
         9uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJDJbf3O70A1cnHwoRFHfiljZ83yW4THBHpXKFCu800=;
        b=dLWr1IYkvS/vVKWnv0WoHFsalNtHnkQ8QhYmsQWE0ltAL8lxeUPSAzOH3Whkkl1Oz3
         5N/TrrWUtGPVVtaLKIyYwkvklzrespg+I3ZvslRLx6av8U/GWOlvnnLglIG5kk8/U/tG
         h60WChZwtqWgkbRQLgTIcxkYin2HhqtonhVYOfJZOTc/3JqVZ6sh+Hoilxt5rqsp9+Gx
         b2uYDH9BbV1bp/C1TexMRSQ4dD+A7W8K0PDsPXdZq1Xj3OfMEMpN7Pafi6Te2lg+QJFK
         h+q1U/YdiCMSWjiHr+62rjSZd1G3rSrgEbKjnDmJWkJTmN4NyCavtmm3M/5wWfjg5knA
         y/Pw==
X-Gm-Message-State: AOAM533+8nXcSLjhB2y5UalGqNDqb/PHXx7T+mSaTDEEute99aPpZEO9
	aOl8frh//gea2hCTnfoFt6ksEgV5hTM=
X-Google-Smtp-Source: ABdhPJzKQWVsdHNudpB76D9c3GCDP0qpITU1wdeCab2DkYvumxVBuoxuWGmLWP07ldvr29/ICXxK3Q==
X-Received: by 2002:a17:906:724b:: with SMTP id n11mr12949636ejk.338.1621647331448;
        Fri, 21 May 2021 18:35:31 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:30 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/17] gnuplot: upgrade 5.2.8 -> 5.4.1
Date: Sat, 22 May 2021 03:35:06 +0200
Message-Id: <20210522013521.588774-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...to-conversion-tools-for-native-build.patch |  9 ++----
 .../gnuplot/0002-do-not-build-demos.patch     | 12 ++++----
 .../0003-Use-native-tools-to-build-docs.patch | 28 +++++++++++--------
 .../{gnuplot_5.2.8.bb => gnuplot_5.4.1.bb}    | 14 +++++-----
 4 files changed, 33 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.2.8.bb => gnuplot_5.4.1.bb} (84%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
index f8f1fd00f..7a2ecdc10 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
@@ -21,11 +21,8 @@ index 9241ce5..b24e291 100644
  ## Process this file with automake to produce Makefile.in -*-Makefile-*-
  AUTOMAKE_OPTIONS = foreign
  
--SUBDIRS = config m4 term src docs man demo tutorial share
+-SUBDIRS = config m4 term src docs man demo share
 +SUBDIRS = docs
  
- EXTRA_DIST = BUGS Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS README RELEASE_NOTES \
--- 
-2.14.3
-
+ EXTRA_DIST = BUGS Copyright FAQ.pdf INSTALL INSTALL.gnu \
+ PATCHLEVEL PGPKEYS README RELEASE_NOTES \
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
index 8e0b4a271..5f96cdf69 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
@@ -14,18 +14,18 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9241ce5..b24e291 100644
+index 7e2c400..a8dbf96 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,7 +1,7 @@
  ## Process this file with automake to produce Makefile.in -*-Makefile-*-
  AUTOMAKE_OPTIONS = foreign
  
--SUBDIRS = config m4 term src docs man demo tutorial share
-+SUBDIRS = config m4 term src docs man tutorial share
+-SUBDIRS = config m4 term src docs man demo share
++SUBDIRS = config m4 term src docs man share
  
- EXTRA_DIST = BUGS Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS README RELEASE_NOTES \
+ EXTRA_DIST = BUGS Copyright FAQ.pdf INSTALL INSTALL.gnu \
+ PATCHLEVEL PGPKEYS README RELEASE_NOTES \
 -- 
-2.14.3
+2.31.1
 
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
index a4039c317..c2d2f7f3f 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
@@ -6,16 +6,22 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
  docs/Makefile.am | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 3baf0c4..e82f87d 100644
+index b20918a..47406eb 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -152,7 +152,7 @@ gnuplot-groff.ps: gnuplot.ms $(srcdir)/titlepag.ms
+@@ -156,7 +156,7 @@ gnuplot-groff.ps: gnuplot.ms $(srcdir)/titlepag.ms
  
  ### doc2xxx dependencies
  gnuplot.ms: doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -24,7 +30,7 @@ index 3baf0c4..e82f87d 100644
  
  doc2ms_SOURCES = doc2ms.c termdoc.c
  doc2ms_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
-@@ -173,10 +173,10 @@ pdf_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
+@@ -177,10 +177,10 @@ pdf_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
  	$(AM_V_GEN)touch $@
  
  figures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -37,7 +43,7 @@ index 3baf0c4..e82f87d 100644
  
  pdf: gnuplot.pdf
  pdf_nofig: nofigures.pdf
-@@ -256,7 +256,7 @@ gnuplot.ps: gnuplot.dvi
+@@ -260,7 +260,7 @@ gnuplot.ps: gnuplot.dvi
  hlp: gnuplot.hlp
  
  gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -46,7 +52,7 @@ index 3baf0c4..e82f87d 100644
  
  doc2hlp_SOURCES = doc2hlp.c termdoc.c
  
-@@ -264,14 +264,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
+@@ -268,14 +268,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
  gih: gnuplot.gih
  
  gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -63,16 +69,16 @@ index 3baf0c4..e82f87d 100644
  
  alldoc2gih_SOURCES = doc2gih.c termdoc.c
  alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
-@@ -286,7 +286,7 @@ $(srcdir)/windows/wgnuplot.hhk
+@@ -290,7 +290,7 @@ $(srcdir)/windows/wgnuplot.hhk
  wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
  
  wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc 
 -	$(AM_V_GEN) ./doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
 +	$(AM_V_GEN) doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
  
- #doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
- #doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
-@@ -336,7 +336,7 @@ install-info: gnuplot.info
+ doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
+ doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
+@@ -340,7 +340,7 @@ install-info: gnuplot.info
  ipf: gnuplot.ipf
  
  gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -81,7 +87,7 @@ index 3baf0c4..e82f87d 100644
  
  doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
  
-@@ -344,7 +344,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
+@@ -348,7 +348,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
  rtf: gnuplot.rtf
  
  gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -90,7 +96,7 @@ index 3baf0c4..e82f87d 100644
  
  doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
  
-@@ -352,13 +352,13 @@ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
+@@ -356,13 +356,13 @@ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
  rnh: gnuplot.rnh
  
  gnuplot.rnh: doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.1.bb
similarity index 84%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_5.4.1.bb
index b2c41756e..3d75f0604 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.1.bb
@@ -11,7 +11,8 @@ inherit autotools features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=archive \
     http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
     file://gnuplot.desktop \
     file://gnuplot.png \
@@ -22,9 +23,7 @@ SRC_URI_append_class-target = " \
     file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
 "
 
-SRC_URI[archive.md5sum] = "2df8767c7399bee57a96296d46b4d5fb"
-SRC_URI[archive.sha256sum] = "60a6764ccf404a1668c140f11cc1f699290ab70daa1151bb58fed6139a28ac37"
-SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
+SRC_URI[archive.sha256sum] = "6b690485567eaeb938c26936e5e0681cf70c856d273cc2c45fabf64d8bc6590e"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
 # for building docs (they deserve it) we need *doc2* tools native
@@ -45,9 +44,10 @@ PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
 PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
 PACKAGECONFIG[qt5] = "--with-qt --with-qt5nativesysroot=${STAGING_DIR_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
 
-EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
-                --without-tutorial \
-                --disable-wxwidgets"
+EXTRA_OECONF = " \
+    --with-readline=${STAGING_LIBDIR}/.. \
+    -disable-wxwidgets \
+"
 
 do_compile_prepend() {
     install -m 0644 ${WORKDIR}/qtplot-0.2/qtopia.trm ${S}/term/
-- 
2.31.1

