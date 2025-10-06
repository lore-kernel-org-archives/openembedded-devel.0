Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE18CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 19:29:27 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1175.1759778966990676405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 12:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPY4NEQ/;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b4f323cf89bso55765866b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759778965; x=1760383765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKOYjxzNY9lUJRxVYUjQdWucmPvRNAV1JKyQ1Psxh6w=;
        b=FPY4NEQ/tzpkQyVWcxzKNmS4HwJrlrwLNDn195r2z0/iecJIRdG29KuyPBCkmsm2mt
         vLsdp53TGw8oWjQ8BMpHpjrXrMwzrZuLBu0rObHvsxsMRMTyUDSv1I6kZVpAOzTLmuez
         IVc0eBdanD3kT5VQhkrWDmG0rkMTDridBr5++ojvdzcm1JkmckHO3vRxGHf4SNk4/QBL
         9zx7lASdACpyKZkcodPBsnuLRWWLo7vjgoIEYRn2fv55q1NM5kFPGtK2p/SbToaW+jQO
         BWtTpQu2viAeqmnqQCfevXNfFqQNryGm1j8ToptitX496Qpcj9vsjah6l1MrOd0SkNZQ
         D1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759778965; x=1760383765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKOYjxzNY9lUJRxVYUjQdWucmPvRNAV1JKyQ1Psxh6w=;
        b=sQUX0g68Orrz3Bd88OAKlGRXRDmaubQuqznuDC+unwS2GfRMMB+/omuC3KLKb7GuYG
         0eCep0fxNzDN+Uw1T3YD4BH43bORzba5XAeaKsrPcJHieDDP10A/JPq0/2wFuifxKDYG
         thtpVT8V96Re0x3RK4mJdVL8ads4JIcy+vfTN1Yl1Q/hEWZjHA2VOKjY7rJkN0PnZtvV
         F9rPpxNwePcBY2tg85DCTl/4Qmh/t+UYvB43aEMee8YEANBQkf8Vk/FeI9eRhpQdMf44
         D+j/MML9gFMHiM++s2ib2djqSfiBKraNYqo1CrPpjrzQ2DW79yS6IacplmbYI4Z+GlrO
         LRNw==
X-Gm-Message-State: AOJu0YxBWBkshZ1KE3EyzXJ/WakKXlk9PEhI2aQWh0pgHO9rNI5C+VBG
	3pf2cUyf80y1Tzh6m+V6Jsq2rwlpiKeb636sbSG5oCfDYDtHuQbD/u8nF1nwug==
X-Gm-Gg: ASbGncspt0TorOV2OxorN5cOJCBHMgc8QjZVmxJIV4hlykl82TZSkhEbm8RD25VLRHp
	TjAtSN07OH89Y4uha+EXyogqPOxnm1DwfYsQ2xiUvj5JYAVAWWFIsMu6cmu0QXucGXCB1GbyMom
	+WXozF5Hk5SpRFzLHdx84pD/BU5vDVDIz+gl8Tl947N3p8aky42BTGy6Y/fnp5KeUTHVuO34aMS
	iw+BXsCauVbWOOkSB+tEBtrvPWcauSCeUThRPqzEvkXX4ftTJQ6PpI5LKwyVV3VWe7JZ3zrG1oR
	/l5fBu93JYj+GDx6NqoEpx+5pIOOooX76UdZLOzAy3jBgigmk3UjykivrDygUvTlYQ3KEXCPjq3
	ZCfn6pgwxI1lujZ3VCiiwmmjlKgRVAM/6DP3D9IfkziD6
X-Google-Smtp-Source: AGHT+IEcETwOc8QOygR8r0xyRs1b8felopEBTF7moUfbyKgsFCUjEaPwJpXFBeRpKxrX9cOTYL/fYg==
X-Received: by 2002:a17:907:3e11:b0:b3b:b839:577b with SMTP id a640c23a62f3a-b49c1275c57mr1798436966b.12.1759778965083;
        Mon, 06 Oct 2025 12:29:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9f11sm1206340566b.4.2025.10.06.12.29.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 12:29:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] gnuplot: upgrade 5.4.3 -> 6.0.3
Date: Mon,  6 Oct 2025 21:29:22 +0200
Message-ID: <20251006192924.3760565-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 19:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120312

This upgrade includes fixes for the following vulnerabilities:
CVE-2025-31176
CVE-2025-31178
CVE-2025-31179
CVE-2025-31180
CVE-2025-31181

This release supports qt4, qt5 and qt6 (the last one is new in this release).
There are 2 qt PACKAGECONFIGs now: qt5 and qt6 - they are mutually exclusive.

Since it is being touched, also fix lua PACKAGECONFIG, which requires lua-native
at build time.

Changelog:
http://gnuplot.info/ReleaseNotes_6_0_3.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Extend 0003-Use-native-tools-to-build-docs.patch to patch also
docs/Makefile.am, which was missed in v1.

 .../0003-Use-native-tools-to-build-docs.patch | 131 +++++++++++++-----
 ...ion-to-find-qt5-and-qt6-native-tools.patch |  64 +++++++++
 ...gure-option-to-find-qt5-native-tools.patch |  42 ------
 .../{gnuplot_5.4.3.bb => gnuplot_6.0.3.bb}    |  11 +-
 4 files changed, 170 insertions(+), 78 deletions(-)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.4.3.bb => gnuplot_6.0.3.bb} (77%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
index 7a7e550349..1f5b689730 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
@@ -23,29 +23,26 @@ diff --git a/docs/Makefile.am b/docs/Makefile.am
 index b20918a..47406eb 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -156,7 +156,7 @@ gnuplot-groff.ps: gnuplot.ms $(srcdir)/titlepag.ms
+@@ -175,7 +175,7 @@
+ 	$(AM_V_GEN) touch $@
  
- ### doc2xxx dependencies
- gnuplot.ms: doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN) ./doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(srcdir)/titlepag.ms"
-+	$(AM_V_GEN) doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(srcdir)/titlepag.ms"
- 
- doc2ms_SOURCES = doc2ms.c termdoc.c
- doc2ms_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
-@@ -177,10 +177,10 @@ pdf_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
- 	$(AM_V_GEN)touch $@
- 
- figures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
+ gnuplot.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
 -	$(AM_V_GEN)./doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
 +	$(AM_V_GEN) doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
  
- nofigures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN)./doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
-+	$(AM_V_GEN) doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
- 
- pdf: gnuplot.pdf
- pdf_nofig: nofigures.pdf
-@@ -260,7 +260,7 @@ gnuplot.ps: gnuplot.dvi
+ pdf: pdf_figures
+ 	$(MAKE) gnuplot.pdf
+@@ -255,7 +255,7 @@
+
+ gnuplot-ja.pdf: gnuplot-ja.doc title-ja.tex pdf_figures allterm-ja.h doc2tex$(EXEEXT)
+ 	iconv -f EUC-JP -t UTF-8 gnuplot-ja.doc > ja.doc
+-	./doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.tex/title-ja.tex/' > gnuplot-ja.tex
++	doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.tex/title-ja.tex/' > gnuplot-ja.tex
+ 	lualatex gnuplot-ja
+ 	lualatex gnuplot-ja
+ 	makeindex gnuplot-ja
+
+@@ -268,7 +268,7 @@ gnuplot.ps: gnuplot.dvi
  hlp: gnuplot.hlp
  
  gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -54,7 +51,7 @@ index b20918a..47406eb 100644
  
  doc2hlp_SOURCES = doc2hlp.c termdoc.c
  
-@@ -268,14 +268,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
+@@ -276,14 +276,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
  gih: gnuplot.gih
  
  gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -71,7 +68,7 @@ index b20918a..47406eb 100644
  
  alldoc2gih_SOURCES = doc2gih.c termdoc.c
  alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
-@@ -290,7 +290,7 @@ $(srcdir)/windows/wgnuplot.hhk
+@@ -298,7 +298,7 @@ $(srcdir)/windows/wgnuplot.hhk
  wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
  
  wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc 
@@ -80,7 +77,16 @@ index b20918a..47406eb 100644
  
  doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
  doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
-@@ -340,7 +340,7 @@ install-info: gnuplot.info
+@@ -318,7 +318,7 @@
+ 	$(AM_V_at) [ -d html ] || mkdir -p html
+ 	$(AM_V_at) rm -f html/Overview.html html/Plotting_Styles.html html/Commands.html html/Terminals.html
+ 	$(AM_V_at) rm -f html/NewFeatures.html
+-	$(AM_V_GEN)./doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
++	$(AM_V_GEN) doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
+ 	$(AM_V_GEN) sort -k 3 html/index.hhk > html/index.html
+ 
+ svg_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
+@@ -372,7 +372,7 @@ install-info: gnuplot.info
  ipf: gnuplot.ipf
  
  gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -89,7 +95,7 @@ index b20918a..47406eb 100644
  
  doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
  
-@@ -348,7 +348,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
+@@ -380,7 +380,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
  rtf: gnuplot.rtf
  
  gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -98,14 +104,78 @@ index b20918a..47406eb 100644
  
  doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
  
-@@ -356,13 +356,13 @@ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
- rnh: gnuplot.rnh
+@@ -386,7 +386,7 @@
+ 
+ # this is how to check the gnuplot.doc file
+ check-local: checkdoc$(EXEEXT)
+-	$(AM_V_at)./checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
++	$(AM_V_at)checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
+ 	if test $$? -eq 0; then \
+          echo "PASS: gnuplot.doc"; \
+ 	else \
+--- ./docs/Makefile.am.orig	2025-10-06 20:44:25.315270887 +0200
++++ ./docs/Makefile.am	2025-10-06 21:22:31.287527296 +0200
+@@ -268,7 +268,7 @@
+ hlp: gnuplot.hlp
+ 
+ gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN)./doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.hlp
++	$(AM_V_GEN)doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.hlp
+ 
+ doc2hlp_SOURCES = doc2hlp.c termdoc.c
+ 
+@@ -276,14 +276,14 @@
+ gih: gnuplot.gih
+ 
+ gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN)./doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
++	$(AM_V_GEN)doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
+ 
+ doc2gih_SOURCES = doc2gih.c termdoc.c
+ 
+ # To include all terminals in the .gih file
+ allgih: alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
+ 	@echo "generate gnuplot.gih with all terminals"
+-	$(AM_V_at)./alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
++	$(AM_V_at)alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
+ 
+ alldoc2gih_SOURCES = doc2gih.c termdoc.c
+ alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
+@@ -298,7 +298,7 @@
+ wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
  
- gnuplot.rnh: doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN) ./doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
-+	$(AM_V_GEN) doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
+ wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc 
+-	$(AM_V_GEN) ./doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
++	$(AM_V_GEN) doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
  
- doc2rnh_SOURCES = doc2rnh.c termdoc.c
+ doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
+ doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
+@@ -318,7 +318,7 @@
+ 	$(AM_V_at) [ -d html ] || mkdir -p html
+ 	$(AM_V_at) rm -f html/Overview.html html/Plotting_Styles.html html/Commands.html html/Terminals.html
+ 	$(AM_V_at) rm -f html/NewFeatures.html
+-	$(AM_V_GEN)./doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
++	$(AM_V_GEN)doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
+ 	$(AM_V_GEN) sort -k 3 html/index.hhk > html/index.html
+ 
+ svg_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
+@@ -372,7 +372,7 @@
+ ipf: gnuplot.ipf
+ 
+ gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN) ./doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ipf
++	$(AM_V_GEN) doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ipf
+ 
+ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
+ 
+@@ -380,13 +380,13 @@
+ rtf: gnuplot.rtf
+ 
+ gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN) ./doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rtf
++	$(AM_V_GEN) doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rtf
+ 
+ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
  
  # this is how to check the gnuplot.doc file
  check-local: checkdoc$(EXEEXT)
@@ -114,6 +184,3 @@ index b20918a..47406eb 100644
  	if test $$? -eq 0; then \
  	  echo "PASS: gnuplot.doc"; \
  	else \
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
new file mode 100644
index 0000000000..50c0785df0
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
@@ -0,0 +1,64 @@
+From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 6 Mar 2018 22:26:48 +0100
+Subject: [PATCH] Add configure option to find qt5 native tools
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Pkg-config checks for target locations. With these qt5 tools as uic/moc..
+cannot be used.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cdd831a..fdd192b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1061,11 +1061,15 @@
+   if test "x${with_qt}" != "xqt4"; then
+     pkg_failed="not_tried"
+     if test "x${with_qt}" != "xqt5"; then
++     AC_ARG_WITH(qt6nativesysroot,
++       AC_HELP_STRING([--with-qt6nativesysroot=PATH], [prepend path - for native qt6 tools]),
++      [QT6NATIVESYSROOT="$withval"], [QT6NATIVESYSROOT=""])
++
+       AC_MSG_CHECKING([Checking for Qt6 support libraries])
+       PKG_CHECK_MODULES_NOFAIL(QT, [Qt6Core Qt6Gui Qt6Network Qt6Svg Qt6PrintSupport Qt6Widgets Qt6Core5Compat])
+     fi
+     if test $pkg_failed = no; then
+-      QT6LOC=`$PKG_CONFIG --variable=libexecdir Qt6Core`
++      QT6LOC=${QT6NATIVESYSROOT}`$PKG_CONFIG --variable=libexecdir Qt6Core`
+       if test "x${QT6LOC}" != "x"; then
+           UIC=${QT6LOC}/uic
+           MOC=${QT6LOC}/moc
+@@ -1075,7 +1079,7 @@
+           MOC=moc-qt6
+           RCC=rcc-qt6
+       fi
+-      QT6BIN=`$PKG_CONFIG --variable=bindir Qt6Core`
++      QT6BIN=${QT6NATIVESYSROOT}`$PKG_CONFIG --variable=bindir Qt6Core`
+       if test "x${QT6BIN}" != "x"; then
+           LRELEASE=${QT6BIN}/lrelease
+       elif test "x${LRELEASE}" = "x"; then
+@@ -1086,10 +1090,14 @@
+       AC_MSG_RESULT([The Qt terminal will use Qt6.])
+       QTVER="6"
+     else
++     AC_ARG_WITH(qt5nativesysroot,
++       AC_HELP_STRING([--with-qt5nativesysroot=PATH], [prepend path - for native qt5 tools]),
++       [QT5NATIVESYSROOT="$withval"], [QT5NATIVESYSROOT=""])
++
+       AC_MSG_CHECKING([Checking for Qt5 support libraries])
+       PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport])
+       if test $pkg_failed = no; then
+-        QT5LOC=`$PKG_CONFIG --variable=host_bins Qt5Core`
++        QT5LOC=${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=host_bins Qt5Core`
+         if test "x${QT5LOC}" != "x"; then
+           UIC=${QT5LOC}/uic
+           MOC=${QT5LOC}/moc
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
deleted file mode 100644
index 7ed9e761f2..0000000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Tue, 6 Mar 2018 22:26:48 +0100
-Subject: [PATCH] Add configure option to find qt5 native tools
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Pkg-config checks for target locations. With these qt5 tools as uic/moc..
-cannot be used.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index cdd831a..fdd192b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1133,11 +1133,15 @@ if test "${enable_qt}" = yes ; then
-   else
-     try_qt4=yes
-   fi
-+  AC_ARG_WITH(qt5nativesysroot,
-+    AC_HELP_STRING([--with-qt5nativesysroot=PATH], [prepend path - for native qt5 tools]),
-+    [QT5NATIVESYSROOT="$withval"], [QT5NATIVESYSROOT=""])
-+
-   if test "x${with_qt}" != "xqt4"; then
-     PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport])
-     if test $pkg_failed = no; then
-       try_qt4=no
--      QT5LOC=`$PKG_CONFIG --variable=host_bins Qt5Core`
-+      QT5LOC=${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=host_bins Qt5Core`
-       if test "x${QT5LOC}" != "x"; then
-         UIC=${QT5LOC}/uic
-         MOC=${QT5LOC}/moc
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
similarity index 77%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
index 679b1a7e98..35c83fd23e 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
@@ -18,10 +18,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
     file://0003-Use-native-tools-to-build-docs.patch \
-    file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
+    file://0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch \
 "
 
-SRC_URI[archive.sha256sum] = "51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84"
+SRC_URI[archive.sha256sum] = "ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
 # for building docs (they deserve it) we need *doc2* tools native
@@ -39,14 +39,17 @@ do_install:class-native() {
 
 PACKAGECONFIG ??= "cairo ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
-PACKAGECONFIG[qt5] = "--with-qt --with-qt5nativesysroot=${STAGING_DIR_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua lua-native"
+# qt5 requires meta-qt5 layer, qt6 requires meta-qt6 layer
+PACKAGECONFIG[qt5] = "--with-qt=qt5 --with-qt5nativesysroot=${STAGING_DIR_NATIVE},,qtbase-native qtbase qtsvg qttools-native,,,qt6"
+PACKAGECONFIG[qt6] = "--with-qt --with-qt6nativesysroot=${STAGING_DIR_NATIVE},,qtbase-native qtbase qtsvg qttools-native qt5compat,,,qt5"
 PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11"
 
 EXTRA_OECONF = " \
     --with-readline=${STAGING_LIBDIR}/.. \
     --disable-wxwidgets \
     --without-libcerf \
+    ${@bb.utils.contains_any('PACKAGECONFIG', 'qt5 qt6', '', '--without-qt', d)} \
 "
 
 do_compile:prepend() {

