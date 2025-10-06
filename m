Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D7CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 18:33:50 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web10.3107.1759775622312483651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 11:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCygH1vk;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-636d5cefab2so7024436d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 11:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759775621; x=1760380421; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59BfiS9E8F536BNPQHKt/bK1AIDf8yZ0b7Drc0g0hW8=;
        b=RCygH1vkQa4zqmn7irIm9WtxiX0DwoTgGlLuPkgde+i7hi3hE4AKTf3uxE+gdGjv6h
         2uEr0jm3J8kn3Hq6h4eeBDG7SXZuHu77Odr/9TydoSKTYpn/8OlmNz5Uge/nx1d1fcN6
         x0N8vgMeJT/EcA17+tVM0KzDwGXsqE5RpZxwC1Lm0agz8jSAHom+QF8h/YZXnuEwGUpY
         4bKASsCSLoLqpL8x50ki58IsVyei9WQCbbZdr+r5ZmZG4TeS+NxDvZ3Fxq9DpgmqN0fp
         tZHh9M7iAPyehCoaSRf3r0eW8sVJe8HpEHqdY6vjnLdhJJJGN5EdN4m2muM8k5vsz15O
         RgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775621; x=1760380421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59BfiS9E8F536BNPQHKt/bK1AIDf8yZ0b7Drc0g0hW8=;
        b=gbGZ/DGFB6Zgz2X3fU7u7qFZtUq+XDbzK0/JQDSro2pNQIwlZdXhei+uXlZ574w6Tp
         PMjZGXIbBNyz/S9JxBGK3PxiqPuUqJxhMcAGlpyBOkpPOKItoJDXxUfyrEK/OPpjQk6P
         RRiK9LyyDBolBRgtzUwN29hQ4ahNiubBx1jM0coLAjfv1WYnUbSvU1Z0b1F92fy1e85h
         J8jg84Q/Wy95UT3WL0fx4rSMNadE8GcDqUjLfrPQ3xsKmjNeHVXXbypXxIdm8XiLWGOG
         63lsYElc8/YQ9DZbFy49Rz7/9YG25Dp5YcLvKD6S4hNSzBGVKGokP+O/KS4LEFbzyixG
         ERCQ==
X-Gm-Message-State: AOJu0Yx0fRhlvapXjinnkZxEa3WLbpRqY0kjhtXZf5K3TC1t3FrhrSJ/
	iwnvakffayv3V82KsaxW8NS6Tdg4xS+tEqcu2Tiq9ZBkpI1YwIo6TgVHaUnFYc2HdSWnuhxwbYe
	yDZ5wqkpgJV3/TRdmV1QUQVpd47eAeIA=
X-Gm-Gg: ASbGncsymjiaDbxeZiCAvoS/lLoxToGDx3z8JeoapEGVuB1N3l48Qet+VG0tcd+gNqs
	K20zKTAc/jxDQvKwwO5IN7rEqpKFQkOujSRxjaAGW9qCCUYJTd4pWjb47TaHGs2qDnZkLQYmkor
	0qs2PmspMaQLSK5Bl8bNx0nm1JbpjDi/D0GNwhvCu9xR0194D2xrRpEPzad1D/kF+swC5UKUj6I
	lj9CPLXqTCTNycXMe8yImsVd+JKI4IhvKYxuA86nbwHrJPMgWyynHB2tUAHtWABQ+vaHMYbwk7K
	yGxbqpCapSlhr+upiNQG4lyVslHvyWd8HLbNT/PYwhR29bGaRUeetACjN+9VpG8gbZ9MLSkPRlt
	f8Pgdz0nAEprt14lQ
X-Google-Smtp-Source: AGHT+IHKO1yCWTvojc2DwD6b9OEO68R2Lc90rHrO0GdvUr1nlbRAS18pAMi54X5CopqJIQonZuN3rloK+hEkUiqkXZs=
X-Received: by 2002:a53:b542:0:b0:628:9b45:5e29 with SMTP id
 956f58d0204a3-63b9a086ac2mr10181358d50.15.1759775621093; Mon, 06 Oct 2025
 11:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251006162126.4190341-1-skandigraun@gmail.com>
In-Reply-To: <20251006162126.4190341-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Oct 2025 11:33:14 -0700
X-Gm-Features: AS18NWDUGntSa2CDMWYyLdNL6aVQv7lDkJXm8zb2iKHjM-8_9EYfEHCFRlRm4WM
Message-ID: <CAMKF1spQsaHm-cqx2o1kzPet7WECU=88=-5cQBBb1hZAs=vq9A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gnuplot: upgrade 5.4.3 -> 6.0.3
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 18:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120309

seeing this

https://errors.yoctoproject.org/Errors/Details/884667/
https://errors.yoctoproject.org/Errors/Details/884665/
https://errors.yoctoproject.org/Errors/Details/884663/


On Mon, Oct 6, 2025 at 9:21=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This upgrade includes fixes for the following vulnerabilities:
> CVE-2025-31176
> CVE-2025-31178
> CVE-2025-31179
> CVE-2025-31180
> CVE-2025-31181
>
> This release supports qt4, qt5 and qt6 (the last one is new in this relea=
se).
> There are 2 qt PACKAGECONFIGs now: qt5 and qt6 - they are mutually exclus=
ive.
>
> Since it is being touched, also fix lua PACKAGECONFIG, which requires lua=
-native
> at build time.
>
> Changelog:
> http://gnuplot.info/ReleaseNotes_6_0_3.html
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../0003-Use-native-tools-to-build-docs.patch | 66 +++++++++----------
>  ...ion-to-find-qt5-and-qt6-native-tools.patch | 64 ++++++++++++++++++
>  ...gure-option-to-find-qt5-native-tools.patch | 42 ------------
>  .../{gnuplot_5.4.3.bb =3D> gnuplot_6.0.3.bb}    | 11 ++--
>  4 files changed, 102 insertions(+), 81 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-con=
figure-option-to-find-qt5-and-qt6-native-tools.patch
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-con=
figure-option-to-find-qt5-native-tools.patch
>  rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.4.3.bb =3D> gnuplot_6=
.0.3.bb} (77%)
>
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-too=
ls-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-=
native-tools-to-build-docs.patch
> index 7a7e550349..736dff13e1 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-b=
uild-docs.patch
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-b=
uild-docs.patch
> @@ -23,29 +23,26 @@ diff --git a/docs/Makefile.am b/docs/Makefile.am
>  index b20918a..47406eb 100644
>  --- a/docs/Makefile.am
>  +++ b/docs/Makefile.am
> -@@ -156,7 +156,7 @@ gnuplot-groff.ps: gnuplot.ms $(srcdir)/titlepag.ms
> +@@ -175,7 +175,7 @@
> +       $(AM_V_GEN) touch $@
>
> - ### doc2xxx dependencies
> - gnuplot.ms: doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc
> --      $(AM_V_GEN) ./doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$=
(srcdir)/titlepag.ms"
> -+      $(AM_V_GEN) doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(s=
rcdir)/titlepag.ms"
> -
> - doc2ms_SOURCES =3D doc2ms.c termdoc.c
> - doc2ms_CPPFLAGS =3D -DALL_TERM_DOC $(AM_CPPFLAGS)
> -@@ -177,10 +177,10 @@ pdf_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.g=
nu
> -       $(AM_V_GEN)touch $@
> -
> - figures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
> + gnuplot.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
>  -      $(AM_V_GEN)./doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
>  +      $(AM_V_GEN) doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
>
> - nofigures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
> --      $(AM_V_GEN)./doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
> -+      $(AM_V_GEN) doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
> -
> - pdf: gnuplot.pdf
> - pdf_nofig: nofigures.pdf
> -@@ -260,7 +260,7 @@ gnuplot.ps: gnuplot.dvi
> + pdf: pdf_figures
> +       $(MAKE) gnuplot.pdf
> +@@ -255,7 +255,7 @@
> +
> + gnuplot-ja.pdf: gnuplot-ja.doc title-ja.tex pdf_figures allterm-ja.h do=
c2tex$(EXEEXT)
> +       iconv -f EUC-JP -t UTF-8 gnuplot-ja.doc > ja.doc
> +-      ./doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.te=
x/title-ja.tex/' > gnuplot-ja.tex
> ++      doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.tex/=
title-ja.tex/' > gnuplot-ja.tex
> +       lualatex gnuplot-ja
> +       lualatex gnuplot-ja
> +       makeindex gnuplot-ja
> +
> +@@ -268,7 +268,7 @@ gnuplot.ps: gnuplot.dvi
>   hlp: gnuplot.hlp
>
>   gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
> @@ -54,7 +51,7 @@ index b20918a..47406eb 100644
>
>   doc2hlp_SOURCES =3D doc2hlp.c termdoc.c
>
> -@@ -268,14 +268,14 @@ doc2hlp_SOURCES =3D doc2hlp.c termdoc.c
> +@@ -276,14 +276,14 @@ doc2hlp_SOURCES =3D doc2hlp.c termdoc.c
>   gih: gnuplot.gih
>
>   gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
> @@ -71,7 +68,7 @@ index b20918a..47406eb 100644
>
>   alldoc2gih_SOURCES =3D doc2gih.c termdoc.c
>   alldoc2gih_CPPFLAGS =3D -DALL_TERM_DOC $(AM_CPPFLAGS)
> -@@ -290,7 +290,7 @@ $(srcdir)/windows/wgnuplot.hhk
> +@@ -298,7 +298,7 @@ $(srcdir)/windows/wgnuplot.hhk
>   wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
>
>   wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc
> @@ -80,7 +77,16 @@ index b20918a..47406eb 100644
>
>   doc2wxhtml_SOURCES =3D windows/doc2html.c termdoc.c xref.c allterm.h
>   doc2wxhtml_CPPFLAGS =3D -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
> -@@ -340,7 +340,7 @@ install-info: gnuplot.info
> +@@ -318,7 +318,7 @@
> +       $(AM_V_at) [ -d html ] || mkdir -p html
> +       $(AM_V_at) rm -f html/Overview.html html/Plotting_Styles.html htm=
l/Commands.html html/Terminals.html
> +       $(AM_V_at) rm -f html/NewFeatures.html
> +-      $(AM_V_GEN)./doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
> ++      $(AM_V_GEN) doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
> +       $(AM_V_GEN) sort -k 3 html/index.hhk > html/index.html
> +
> + svg_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
> +@@ -372,7 +372,7 @@ install-info: gnuplot.info
>   ipf: gnuplot.ipf
>
>   gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
> @@ -89,7 +95,7 @@ index b20918a..47406eb 100644
>
>   doc2ipf_SOURCES =3D doc2ipf.c termdoc.c xref.c
>
> -@@ -348,7 +348,7 @@ doc2ipf_SOURCES =3D doc2ipf.c termdoc.c xref.c
> +@@ -380,7 +380,7 @@ doc2ipf_SOURCES =3D doc2ipf.c termdoc.c xref.c
>   rtf: gnuplot.rtf
>
>   gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
> @@ -98,22 +104,12 @@ index b20918a..47406eb 100644
>
>   doc2rtf_SOURCES =3D doc2rtf.c termdoc.c xref.c
>
> -@@ -356,13 +356,13 @@ doc2rtf_SOURCES =3D doc2rtf.c termdoc.c xref.c
> - rnh: gnuplot.rnh
> -
> - gnuplot.rnh: doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc
> --      $(AM_V_GEN) ./doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
> -+      $(AM_V_GEN) doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
> -
> - doc2rnh_SOURCES =3D doc2rnh.c termdoc.c
> +@@ -386,7 +386,7 @@
>
>   # this is how to check the gnuplot.doc file
>   check-local: checkdoc$(EXEEXT)
>  -      $(AM_V_at)./checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
>  +      $(AM_V_at)checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
>         if test $$? -eq 0; then \
> -         echo "PASS: gnuplot.doc"; \
> +          echo "PASS: gnuplot.doc"; \
>         else \
> ---
> -2.14.3
> -
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-=
option-to-find-qt5-and-qt6-native-tools.patch b/meta-oe/recipes-extended/gn=
uplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.pa=
tch
> new file mode 100644
> index 0000000000..50c0785df0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-=
to-find-qt5-and-qt6-native-tools.patch
> @@ -0,0 +1,64 @@
> +From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Tue, 6 Mar 2018 22:26:48 +0100
> +Subject: [PATCH] Add configure option to find qt5 native tools
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Pkg-config checks for target locations. With these qt5 tools as uic/moc.=
.
> +cannot be used.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + configure.ac | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index cdd831a..fdd192b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1061,11 +1061,15 @@
> +   if test "x${with_qt}" !=3D "xqt4"; then
> +     pkg_failed=3D"not_tried"
> +     if test "x${with_qt}" !=3D "xqt5"; then
> ++     AC_ARG_WITH(qt6nativesysroot,
> ++       AC_HELP_STRING([--with-qt6nativesysroot=3DPATH], [prepend path -=
 for native qt6 tools]),
> ++      [QT6NATIVESYSROOT=3D"$withval"], [QT6NATIVESYSROOT=3D""])
> ++
> +       AC_MSG_CHECKING([Checking for Qt6 support libraries])
> +       PKG_CHECK_MODULES_NOFAIL(QT, [Qt6Core Qt6Gui Qt6Network Qt6Svg Qt=
6PrintSupport Qt6Widgets Qt6Core5Compat])
> +     fi
> +     if test $pkg_failed =3D no; then
> +-      QT6LOC=3D`$PKG_CONFIG --variable=3Dlibexecdir Qt6Core`
> ++      QT6LOC=3D${QT6NATIVESYSROOT}`$PKG_CONFIG --variable=3Dlibexecdir =
Qt6Core`
> +       if test "x${QT6LOC}" !=3D "x"; then
> +           UIC=3D${QT6LOC}/uic
> +           MOC=3D${QT6LOC}/moc
> +@@ -1075,7 +1079,7 @@
> +           MOC=3Dmoc-qt6
> +           RCC=3Drcc-qt6
> +       fi
> +-      QT6BIN=3D`$PKG_CONFIG --variable=3Dbindir Qt6Core`
> ++      QT6BIN=3D${QT6NATIVESYSROOT}`$PKG_CONFIG --variable=3Dbindir Qt6C=
ore`
> +       if test "x${QT6BIN}" !=3D "x"; then
> +           LRELEASE=3D${QT6BIN}/lrelease
> +       elif test "x${LRELEASE}" =3D "x"; then
> +@@ -1086,10 +1090,14 @@
> +       AC_MSG_RESULT([The Qt terminal will use Qt6.])
> +       QTVER=3D"6"
> +     else
> ++     AC_ARG_WITH(qt5nativesysroot,
> ++       AC_HELP_STRING([--with-qt5nativesysroot=3DPATH], [prepend path -=
 for native qt5 tools]),
> ++       [QT5NATIVESYSROOT=3D"$withval"], [QT5NATIVESYSROOT=3D""])
> ++
> +       AC_MSG_CHECKING([Checking for Qt5 support libraries])
> +       PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt=
5PrintSupport])
> +       if test $pkg_failed =3D no; then
> +-        QT5LOC=3D`$PKG_CONFIG --variable=3Dhost_bins Qt5Core`
> ++        QT5LOC=3D${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=3Dhost_bins=
 Qt5Core`
> +         if test "x${QT5LOC}" !=3D "x"; then
> +           UIC=3D${QT5LOC}/uic
> +           MOC=3D${QT5LOC}/moc
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-=
option-to-find-qt5-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gn=
uplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
> deleted file mode 100644
> index 7ed9e761f2..0000000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-=
to-find-qt5-native-tools.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Tue, 6 Mar 2018 22:26:48 +0100
> -Subject: [PATCH] Add configure option to find qt5 native tools
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Pkg-config checks for target locations. With these qt5 tools as uic/moc.=
.
> -cannot be used.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ----
> - configure.ac | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index cdd831a..fdd192b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1133,11 +1133,15 @@ if test "${enable_qt}" =3D yes ; then
> -   else
> -     try_qt4=3Dyes
> -   fi
> -+  AC_ARG_WITH(qt5nativesysroot,
> -+    AC_HELP_STRING([--with-qt5nativesysroot=3DPATH], [prepend path - fo=
r native qt5 tools]),
> -+    [QT5NATIVESYSROOT=3D"$withval"], [QT5NATIVESYSROOT=3D""])
> -+
> -   if test "x${with_qt}" !=3D "xqt4"; then
> -     PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5P=
rintSupport])
> -     if test $pkg_failed =3D no; then
> -       try_qt4=3Dno
> --      QT5LOC=3D`$PKG_CONFIG --variable=3Dhost_bins Qt5Core`
> -+      QT5LOC=3D${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=3Dhost_bins Q=
t5Core`
> -       if test "x${QT5LOC}" !=3D "x"; then
> -         UIC=3D${QT5LOC}/uic
> -         MOC=3D${QT5LOC}/moc
> ---
> -2.14.3
> -
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/=
recipes-extended/gnuplot/gnuplot_6.0.3.bb
> similarity index 77%
> rename from meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
> rename to meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
> index 679b1a7e98..35c83fd23e 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
> @@ -18,10 +18,10 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${B=
PN}/${PV}/${BP}.tar.gz;name=3Da
>  SRC_URI:append:class-target =3D " \
>      file://0002-do-not-build-demos.patch \
>      file://0003-Use-native-tools-to-build-docs.patch \
> -    file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
> +    file://0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.pa=
tch \
>  "
>
> -SRC_URI[archive.sha256sum] =3D "51f89bbab90f96d3543f95235368d188eb1e26ed=
a296912256abcd3535bd4d84"
> +SRC_URI[archive.sha256sum] =3D "ec52e3af8c4083d4538152b3f13db47f6d29929a=
3f6ecec5365c834e77f251ab"
>  SRC_URI[qtplot.sha256sum] =3D "6df317183ff62cc82f3dcf88207a267cd6478cb51=
47f55d7530c94f1ad5f4132"
>
>  # for building docs (they deserve it) we need *doc2* tools native
> @@ -39,14 +39,17 @@ do_install:class-native() {
>
>  PACKAGECONFIG ??=3D "cairo ${@bb.utils.filter('DISTRO_FEATURES', 'x11', =
d)}"
>  PACKAGECONFIG[cairo] =3D "--with-cairo,--without-cairo,cairo pango"
> -PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua"
> -PACKAGECONFIG[qt5] =3D "--with-qt --with-qt5nativesysroot=3D${STAGING_DI=
R_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
> +PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua lua-native"
> +# qt5 requires meta-qt5 layer, qt6 requires meta-qt6 layer
> +PACKAGECONFIG[qt5] =3D "--with-qt=3Dqt5 --with-qt5nativesysroot=3D${STAG=
ING_DIR_NATIVE},,qtbase-native qtbase qtsvg qttools-native,,,qt6"
> +PACKAGECONFIG[qt6] =3D "--with-qt --with-qt6nativesysroot=3D${STAGING_DI=
R_NATIVE},,qtbase-native qtbase qtsvg qttools-native qt5compat,,,qt5"
>  PACKAGECONFIG[x11] =3D "--with-x,--without-x,virtual/libx11"
>
>  EXTRA_OECONF =3D " \
>      --with-readline=3D${STAGING_LIBDIR}/.. \
>      --disable-wxwidgets \
>      --without-libcerf \
> +    ${@bb.utils.contains_any('PACKAGECONFIG', 'qt5 qt6', '', '--without-=
qt', d)} \
>  "
>
>  do_compile:prepend() {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120303): https://lists.openembedded.org/g/openembedde=
d-devel/message/120303
> Mute This Topic: https://lists.openembedded.org/mt/115620128/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

