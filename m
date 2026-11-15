Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3847.1794728978712265026
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YOcfS2T4;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3704d30b84fso2948467eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728978; x=1795333778; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eiKjc9V/4e9aeamnGV2sQF5XsP98gcks+EFhrT6h+7M=;
        b=YOcfS2T4U0SzA6RTr30nvjXQHMUmhgrZLWhIdx47yWdfHgZVrph+JnNbeRZ20fjYxS
         1PXyanxw6AnWdjddScPB0vzM6FbZp7J51LkISoKj19a4B+3s8G7M4tZqlVN0rUbjTPUX
         /sIUjJKwRwxL0FKQtPecm4YU5ykVY/017qDVHAfzFabkNvaiZ/6hcLWjNHSChlgHoGPk
         nES16dHwzuMub7giEIMaDvlwCK63c0/jJUWNhihaAO6Bz1NayZUMTZ0IWvUB9ROmJw94
         8+O/H8yy+jGuBDNhNLPY3nuY2jHLcyLzDVhiaGYaqLzeDztJzDCI8wiX/SNdqPh2jGjZ
         12dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728978; x=1795333778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiKjc9V/4e9aeamnGV2sQF5XsP98gcks+EFhrT6h+7M=;
        b=bygf13065QrotoI7J01+cl3etNCsveruYpeWvJQ+iEOoU7pOy9KWBb9hzuV45BPMBO
         hx31m0Z9nPm0+pAcd8pXIBEsI84EfutYmqGfpYAYbWu60UJsS+y9gKdCNIuUxGaynpvb
         OqZt0UgSCUKyzwzyxBqH12BYgwRVIFjX9mdetRblVAyXp9RKBUDtonJmN4SPGJhTT6mN
         4RjQApBD95TVIKUvYjTHPOgCSy4X0P09H/DeYkEmzNsCZSXg6LBGm/XKAM42UbvBYpDE
         FxGY8VsiZpvQa8lfl4ho7e6yDLHOUmd9+oMeqCzqN0pIE4xfMm805t83+I5KpulBjidj
         p92Q==
X-Gm-Message-State: APuU4Z8nFYKM6m4mdUhSVtHUEB0l8DXBe+EVb3E2toVu98ZmP2NkmGoB
	aEtMb4DbNVfOXtg8VbKiwy1BwuiPd0zhvTiNuN6RLUZ+L5tUjnd7WiZWXvjILi/v
X-Gm-Gg: AYBFou1VoMNuyg0Z41wsR1erHTMoQNxUsi0SftFWsiuP3xAhWcElXzQIG7+dFbjb9mR
	7htiKWm9BZyLNCKWagDJBCf73KXl671GYYVRY9oryno9uuMqGAeKllIdHgELJmOHNqlc2x2V0Jr
	SQMXZFZAzxyxP9HJq70kDhbLONA6gIC7XtmO2p+dhq53+WO1Y8x8Gd7SalPU9Kqe+jivuxvMr6o
	GUtajh/DvMYdsBauvnYLzbHRCC8ZSCtCbxJJrpfYN7L9muBF0uybyaZWO/f8Pi2sv0do8V4G1Ky
	b4GdtYaoouU+RbB8fJiWviqpByXf2mwp3wZNob/tiN328LgseJMMIduiQcCjsluh8C8/nvYLavh
	1reCypqFJvotgnpaeRPrXsCPVvXW/7t3zp1K48G6TbYw4fko10AwR1iMPbctmWYR27I7HpvH7wo
	C1l+kZasskJjv7eLLsq8649AGhDO6SOO/nd1HIlEePWhDbRyog2YAfi6CS7ih3MF+fyWY6s/lf1
	DK5dPWLRY1fUQ01YNrBl/8CZTcFsKodayTZfeuHYq/91iBCtWVzf0ewIdXHaF5mwwpaLxMndf7a
	6mhX/zYICmxEexCUVYNVws7Aa0yjOCPG4Cn5YFrWeE2swT3bipWE37KUJeXIWLqw5mS05hRSu/8
	LqJUwPmp5FZvJTif7nZMvawxsD0VT4Fwo9oNE5xO3mXPFPRw9FfusfnqbsBEg2NzCPOoJAoG5FE
	Rxp8NWngXhHdRBdB5YpEwW7Dvyr15Xr0GqOTn7AOaCt2kZ9kN3Hi3PHiLHvtLk8vGkMKWA4AGQm
	OqLr2aYWpq38xXe1PL7eLRVqKRQBAoLgIh40HQGodsCPcoLz+u97vJXvTiRO4BFSgvYhl6QJY4s
	RQ3I
X-Received: by 2002:a05:7301:619a:10b0:36e:d060:8bad with SMTP id 5a478bee46e88-379633739e4mr6856664eec.5.1794728977868;
        Sat, 14 Nov 2026 23:49:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/96] gnuplot: upgrade 6.0.5 -> 6.0.6
Date: Sat, 14 Nov 2026 23:47:48 -0800
Message-ID: <20261115074918.2932593-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132280
Content-Type: text/plain; charset="utf-8"

Refresh the patches. The native build applies only
0001-reduce-build-to-conversion-tools-for-native-build.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...to-conversion-tools-for-native-build.patch |   6 +-
 .../gnuplot/0002-do-not-build-demos.patch     |   9 +-
 .../0003-Use-native-tools-to-build-docs.patch | 101 +++---------------
 ...ion-to-find-qt5-and-qt6-native-tools.patch |  12 +--
 .../{gnuplot_6.0.5.bb => gnuplot_6.0.6.bb}    |   2 +-
 5 files changed, 26 insertions(+), 104 deletions(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_6.0.5.bb => gnuplot_6.0.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
index 7a2ecdc101..6cf35df61f 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
@@ -14,12 +14,12 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9241ce5..b24e291 100644
+index bed885a..c852de2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+@@ -2,7 +2,7 @@
  AUTOMAKE_OPTIONS = foreign
+ AM_DISTCHECK_DVI_TARGET =
  
 -SUBDIRS = config m4 term src docs man demo share
 +SUBDIRS = docs
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
index 5f96cdf699..62ebde19ee 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
@@ -14,18 +14,15 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 7e2c400..a8dbf96 100644
+index adfd135..bed885a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+@@ -2,7 +2,7 @@
  AUTOMAKE_OPTIONS = foreign
+ AM_DISTCHECK_DVI_TARGET =
  
 -SUBDIRS = config m4 term src docs man demo share
 +SUBDIRS = config m4 term src docs man share
  
  EXTRA_DIST = BUGS Copyright FAQ.pdf INSTALL INSTALL.gnu \
  PATCHLEVEL PGPKEYS README RELEASE_NOTES \
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
index 1f5b689730..66eb33433f 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
@@ -13,17 +13,16 @@ Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
----
 Upstream-Status: Pending
-
- docs/Makefile.am | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
+---
+ docs/Makefile.am | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index b20918a..47406eb 100644
+index 4b1bc4f..643ee66 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -175,7 +175,7 @@
+@@ -184,7 +184,7 @@ gpinsetfigure.tex: no_figures
  	$(AM_V_GEN) touch $@
  
  gnuplot.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -32,8 +31,8 @@ index b20918a..47406eb 100644
  
  pdf: pdf_figures
  	$(MAKE) gnuplot.pdf
-@@ -255,7 +255,7 @@
-
+@@ -264,7 +264,7 @@ allterm-ja.h: $(CORETERM) $(LUA_HELP)
+ 
  gnuplot-ja.pdf: gnuplot-ja.doc title-ja.tex pdf_figures allterm-ja.h doc2tex$(EXEEXT)
  	iconv -f EUC-JP -t UTF-8 gnuplot-ja.doc > ja.doc
 -	./doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.tex/title-ja.tex/' > gnuplot-ja.tex
@@ -41,81 +40,7 @@ index b20918a..47406eb 100644
  	lualatex gnuplot-ja
  	lualatex gnuplot-ja
  	makeindex gnuplot-ja
-
-@@ -268,7 +268,7 @@ gnuplot.ps: gnuplot.dvi
- hlp: gnuplot.hlp
- 
- gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN)./doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.hlp
-+	$(AM_V_GEN)doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.hlp
- 
- doc2hlp_SOURCES = doc2hlp.c termdoc.c
- 
-@@ -276,14 +276,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
- gih: gnuplot.gih
- 
- gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN)./doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
-+	$(AM_V_GEN)doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
- 
- doc2gih_SOURCES = doc2gih.c termdoc.c
- 
- # To include all terminals in the .gih file
- allgih: alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
- 	@echo "generate gnuplot.gih with all terminals"
--	$(AM_V_at)./alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
-+	$(AM_V_at)alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
- 
- alldoc2gih_SOURCES = doc2gih.c termdoc.c
- alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
-@@ -298,7 +298,7 @@ $(srcdir)/windows/wgnuplot.hhk
- wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
- 
- wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc 
--	$(AM_V_GEN) ./doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
-+	$(AM_V_GEN) doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
- 
- doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
- doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
-@@ -318,7 +318,7 @@
- 	$(AM_V_at) [ -d html ] || mkdir -p html
- 	$(AM_V_at) rm -f html/Overview.html html/Plotting_Styles.html html/Commands.html html/Terminals.html
- 	$(AM_V_at) rm -f html/NewFeatures.html
--	$(AM_V_GEN)./doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
-+	$(AM_V_GEN) doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
- 	$(AM_V_GEN) sort -k 3 html/index.hhk > html/index.html
- 
- svg_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
-@@ -372,7 +372,7 @@ install-info: gnuplot.info
- ipf: gnuplot.ipf
- 
- gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN) ./doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ipf
-+	$(AM_V_GEN) doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ipf
- 
- doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
- 
-@@ -380,7 +380,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
- rtf: gnuplot.rtf
- 
- gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
--	$(AM_V_GEN) ./doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rtf
-+	$(AM_V_GEN) doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rtf
- 
- doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
- 
-@@ -386,7 +386,7 @@
- 
- # this is how to check the gnuplot.doc file
- check-local: checkdoc$(EXEEXT)
--	$(AM_V_at)./checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
-+	$(AM_V_at)checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
- 	if test $$? -eq 0; then \
-          echo "PASS: gnuplot.doc"; \
- 	else \
---- ./docs/Makefile.am.orig	2025-10-06 20:44:25.315270887 +0200
-+++ ./docs/Makefile.am	2025-10-06 21:22:31.287527296 +0200
-@@ -268,7 +268,7 @@
+@@ -277,7 +277,7 @@ gnuplot-ja.pdf: gnuplot-ja.doc title-ja.tex pdf_figures allterm-ja.h doc2tex$(EX
  hlp: gnuplot.hlp
  
  gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -124,7 +49,7 @@ index b20918a..47406eb 100644
  
  doc2hlp_SOURCES = doc2hlp.c termdoc.c
  
-@@ -276,14 +276,14 @@
+@@ -285,14 +285,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
  gih: gnuplot.gih
  
  gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -141,7 +66,7 @@ index b20918a..47406eb 100644
  
  alldoc2gih_SOURCES = doc2gih.c termdoc.c
  alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
-@@ -298,7 +298,7 @@
+@@ -307,7 +307,7 @@ $(srcdir)/windows/wgnuplot.hhk
  wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
  
  wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc 
@@ -150,7 +75,7 @@ index b20918a..47406eb 100644
  
  doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
  doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
-@@ -318,7 +318,7 @@
+@@ -327,7 +327,7 @@ html: allterm.h doc2web$(EXEEXT) $(srcdir)/gnuplot.doc svg_figures webp_figures
  	$(AM_V_at) [ -d html ] || mkdir -p html
  	$(AM_V_at) rm -f html/Overview.html html/Plotting_Styles.html html/Commands.html html/Terminals.html
  	$(AM_V_at) rm -f html/NewFeatures.html
@@ -159,7 +84,7 @@ index b20918a..47406eb 100644
  	$(AM_V_GEN) sort -k 3 html/index.hhk > html/index.html
  
  svg_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
-@@ -372,7 +372,7 @@
+@@ -381,7 +381,7 @@ install-info: gnuplot.info
  ipf: gnuplot.ipf
  
  gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
@@ -168,7 +93,7 @@ index b20918a..47406eb 100644
  
  doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
  
-@@ -380,13 +380,13 @@
+@@ -389,13 +389,13 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
  rtf: gnuplot.rtf
  
  gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
index 50c0785df0..05a7174464 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
@@ -13,14 +13,14 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
+ configure.ac | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cdd831a..fdd192b 100644
+index a474af0..b88e525 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1061,11 +1061,15 @@
+@@ -1070,11 +1070,15 @@ if test "${enable_qt}" = yes ; then
    if test "x${with_qt}" != "xqt4"; then
      pkg_failed="not_tried"
      if test "x${with_qt}" != "xqt5"; then
@@ -37,7 +37,7 @@ index cdd831a..fdd192b 100644
        if test "x${QT6LOC}" != "x"; then
            UIC=${QT6LOC}/uic
            MOC=${QT6LOC}/moc
-@@ -1075,7 +1079,7 @@
+@@ -1084,7 +1088,7 @@ if test "${enable_qt}" = yes ; then
            MOC=moc-qt6
            RCC=rcc-qt6
        fi
@@ -46,7 +46,7 @@ index cdd831a..fdd192b 100644
        if test "x${QT6BIN}" != "x"; then
            LRELEASE=${QT6BIN}/lrelease
        elif test "x${LRELEASE}" = "x"; then
-@@ -1086,10 +1090,14 @@
+@@ -1095,10 +1099,14 @@ if test "${enable_qt}" = yes ; then
        AC_MSG_RESULT([The Qt terminal will use Qt6.])
        QTVER="6"
      else
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.5.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_6.0.5.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_6.0.6.bb
index d3ae44e04c..37645c062a 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.5.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.6.bb
@@ -21,7 +21,7 @@ SRC_URI:append:class-target = " \
     file://0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch \
 "
 
-SRC_URI[archive.sha256sum] = "73237f37f03306d68bfae133a9a50d5e9341384e198d5ab37eeca9ab534deed8"
+SRC_URI[archive.sha256sum] = "9d39d8499c9533550144092375aac45ba8bf0c18c9cee50897fe411b6d93004e"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
 # Tarballs live in per-version subdirectories, the listing above them has no filenames
