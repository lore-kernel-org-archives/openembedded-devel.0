Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6C1CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:21:31 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.542.1759767689899971658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 09:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWCgNz6R;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3c2db014easo653143366b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 09:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759767688; x=1760372488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oj0BgzNQUldfLcTbw/jZyqJlvOxTHoZ0EmcSFr6Nh0=;
        b=QWCgNz6RQkLuqH1yip7StMyGwxvasxXXL5+QkwuQlZHNKe0jlhoxb37RBC8N1BJPeT
         qgmxPvdYa5lKmkH6kjVpUfpBbFW+1vN0fKQscpvaWhYojz5LT1KP53EBzFV2y8wqzUNT
         EH4jQbZPJwHcioek4KXDd1YQclTvgk2yWHiHZyDvSouuZtEeuMnn34miQy0sEhBViPyU
         gZhwNpXRwm/Px+mMW+aUvNRnQZF9V+SllvVbawnh997pkpZVtZkpG7zLGn8axB1an+Fr
         Y9prYwOBeVhutGz7FVJ5hKZhxxZYR3JLww1/CuUHZWfqUjdSX5lUG0SYuLVh/DvDPCIz
         H6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759767688; x=1760372488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oj0BgzNQUldfLcTbw/jZyqJlvOxTHoZ0EmcSFr6Nh0=;
        b=dCG+bvxfGzn9Fv+V14qWSIQ6hpgB7u/1e2WlruP2lT7NPzyr8B74kgSufOXVtbEfV/
         BLYwrxBJsE2qULzt4UTN44tkQYXCw/g81h7S5KJNkwffAfhabia5nEhS13nLjNfwPXYD
         kiY2R48lE34hCacAGMo3jBH23CYmYf8urJMU+SSEtbZI4pgY7rEpTK/rpmGtDHNZgJly
         GeSUHsVFJnHaZOMaHM7tCOB5Ll0nJUgm02ulGXyEBBaRnUZrsUFayLT2k8X75Lu7EMP6
         98oh/nH6w6OJ1EhlKlmCK7IQYMX1lnLRV2JiFJZgO3RpI2d4ugtfSeD7bRWBqOjUjH5e
         oagA==
X-Gm-Message-State: AOJu0YyQC7l9lcFr4oBsuFjQyka79wcRkcVJZrU+CJpVnehMmCXEIhYd
	eWZkZrPgVKYU4of3KQn5oVaIqkiU+Q4pPcFVuW1x7X1u8SNtWEC7+eHYV3HlBw==
X-Gm-Gg: ASbGncseFIobzRokAWODtGnVYAMAJy9TDhCjqMUV3WMNqF7iFEab7hNhRhyvzg/1u+h
	7D5vHnypf2UkM+ZrZDzmUgt+W13dgVkbC1eCT/NpIfNCBsy5s29v0t8vBdQX8EGF7TR5XX1BMnB
	C7kfbU1yYbpwWATmTQFwnB9WEFDPtZJJjKpPeQgul/LaBekr2uw1blcnbV1Uz89EwdPwoz5HiMN
	uhTDjOGLAeGwZLeLzh0T47cJXQV2m/taK+u/r6DsIGHJEvYyyeCC1umy7qTckETHPjbMAtcU0Ga
	betQXW8agJbONDvvx51aso9IdRCy9s671vNEgqG2t56tfkIagO56g6Wo9dGT8Wo0OVr2vxmQa44
	cIeqdS5NUoDtjQHMO187v+RqJO+Rv7u98m7xOPlQkWXTnEu72C2dDX2k=
X-Google-Smtp-Source: AGHT+IEt+DZqcDf83dLq2JJbVNm+fBVCmB5sePsliYFNV/YzslBP52yRqNuYI0+yrb+5eksZ7ibm4A==
X-Received: by 2002:a17:907:7244:b0:b3a:7af8:c4a2 with SMTP id a640c23a62f3a-b49c038f719mr1801302566b.10.1759767687966;
        Mon, 06 Oct 2025 09:21:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f7420asm1167974266b.43.2025.10.06.09.21.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:21:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gnuplot: upgrade 5.4.3 -> 6.0.3
Date: Mon,  6 Oct 2025 18:21:25 +0200
Message-ID: <20251006162126.4190341-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 16:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120303

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
 .../0003-Use-native-tools-to-build-docs.patch | 66 +++++++++----------
 ...ion-to-find-qt5-and-qt6-native-tools.patch | 64 ++++++++++++++++++
 ...gure-option-to-find-qt5-native-tools.patch | 42 ------------
 .../{gnuplot_5.4.3.bb => gnuplot_6.0.3.bb}    | 11 ++--
 4 files changed, 102 insertions(+), 81 deletions(-)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.4.3.bb => gnuplot_6.0.3.bb} (77%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
index 7a7e550349..736dff13e1 100644
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
@@ -98,22 +104,12 @@ index b20918a..47406eb 100644
  
  doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
  
-@@ -356,13 +356,13 @@ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
- rnh: gnuplot.rnh
- 
- gnuplot.rnh: doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN) ./doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
-+	$(AM_V_GEN) doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
- 
- doc2rnh_SOURCES = doc2rnh.c termdoc.c
+@@ -386,7 +386,7 @@
  
  # this is how to check the gnuplot.doc file
  check-local: checkdoc$(EXEEXT)
 -	$(AM_V_at)./checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
 +	$(AM_V_at)checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
  	if test $$? -eq 0; then \
- 	  echo "PASS: gnuplot.doc"; \
+          echo "PASS: gnuplot.doc"; \
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

