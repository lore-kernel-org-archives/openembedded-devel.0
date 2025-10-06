Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F1CCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 19:27:57 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.1136.1759778873228984096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 12:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCyJIN3M;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso11072042a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759778871; x=1760383671; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3/ZU3S5XM55igQ2onnagd6Ddpk33W/Q1UNsNzLLpfg=;
        b=FCyJIN3Mb6GiJyqkPv1Ub2TJ0UzTsHSeyhKRIHJGxfhzLL0ThU+PjTDPx4Wg/Ca+7I
         NBGhh55MHqCuzJoepEBSZMaRFd4KXwgIwuEsxq6kbop9JkgL48AWKnfGOdi+Kycr6OBK
         +hYqt225CrKJawj2LxqbqaUSUze9GcW/D5AeyNj2iABQGnlySGQxd5oRY3y3pV3FX0Q5
         v74Pwz+qf7fucuBrRdoZUAAK6KCGShb8dVHbCFeUTtyYAnwDpxRuHikllMdUS0kMI+cs
         KU38aWcecpdb7WhpFj0kotu43dF4i/hmeFGM+pvIG7hjz2z0SCh3g44H1hI8hextTVaQ
         WBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759778871; x=1760383671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3/ZU3S5XM55igQ2onnagd6Ddpk33W/Q1UNsNzLLpfg=;
        b=cxqRMiyKUg7PeaMue4zwL/vwmHXhLhzaaYTGHpFkQxL8KIOG2/bmiVDIeVACmu5Pzc
         a+u4U3HC3OaqkVyzEstDF1w790/0YM/Lk5O+OHrHikrzAKQluXQ/hB/kAdccipzQJEjY
         BZ67mBv8NOMwgEerOYfptE1UIC2UNSbfjJtEX6nfPejSlce65u4h8IB+vmcsC3NpsIaJ
         AeFmtPaM9PuXDkEQKwfJKBXj0sFT2xCAd82g4/vGqb3ubfGPNfgoD3FYrtupwLVbgnCL
         K36RM1q0DkC6ODDuz119OGnl+azlD02oDljlqInTLCQlD9eWJOWP8Hg/P4fNbcna0BOq
         v8+g==
X-Gm-Message-State: AOJu0YzKHqnG9QIdfayV+u5Ebf/vJJhM4PHHgxHDBVlMTqGoltk4jme2
	3F8LNjDsn8ZVMFw5y2m/x5guwqaHh9dl2DzTT6rMyUkXuINpc6gHJfiG
X-Gm-Gg: ASbGncuz7LTvORsV5oK+W2Y688T0XHoqnmZ2MJLyUcLPWauVJGgBgWbUk8oxmSv2Yv3
	ZTaIsFxklg4qQhvSFExKImy6YqoZn2Mr6ZDcd9KuqDUANNXXpAu3DDbEgp7wgR2vQocMm9TtspD
	Z0htweqKZQL45WBSjZ1MLmxj7ILkeUVDV5xxymaFCYc5Iqhr3fDH3UzF9hxMAe3YCcfy3Sr0kfY
	r0E+R3M6z2fIr4s/X981JpYCE6eVrNnoCYeH4WYLXzc2ytyKTQ0zKNTjvaOSKdKXP3i7OZ+jcFG
	St3J67OA/emJ649ZM6HYWTgvYvV2TrB3KqgYgP0Lc37MXEU08RaPuWr6pc+A2tFpfbjreKLTDuZ
	KJyUd8DKmpgizg0PFyhHW1rfQ2tGsah4vyDsXC5A+3dIZl55T1CUQZD4=
X-Google-Smtp-Source: AGHT+IG92MXuikGWzc6CkmtfOP3knNVtfT+iXsRUOBPdvLaRPj3tarYJkF+sFyhQHE/w1llr2SRXCA==
X-Received: by 2002:a17:907:d7ca:b0:b3d:a295:5445 with SMTP id a640c23a62f3a-b4f4116a343mr108639566b.13.1759778870826;
        Mon, 06 Oct 2025 12:27:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f3c7e057dsm43704466b.88.2025.10.06.12.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 12:27:50 -0700 (PDT)
Message-ID: <4db17819-299d-4c9a-89b7-bbe6cea34703@gmail.com>
Date: Mon, 6 Oct 2025 21:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gnuplot: upgrade 5.4.3 -> 6.0.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251006162126.4190341-1-skandigraun@gmail.com>
 <CAMKF1spQsaHm-cqx2o1kzPet7WECU=88=-5cQBBb1hZAs=vq9A@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spQsaHm-cqx2o1kzPet7WECU=88=-5cQBBb1hZAs=vq9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 19:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120311

On 10/6/25 20:33, Khem Raj wrote:
> seeing this
>
> https://errors.yoctoproject.org/Errors/Details/884667/
> https://errors.yoctoproject.org/Errors/Details/884665/
> https://errors.yoctoproject.org/Errors/Details/884663/

Hmmm... I'm not sure why I didn't see this in my initial testing...
But v2 should arrive in a few moments.

>
> On Mon, Oct 6, 2025 at 9:21 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> This upgrade includes fixes for the following vulnerabilities:
>> CVE-2025-31176
>> CVE-2025-31178
>> CVE-2025-31179
>> CVE-2025-31180
>> CVE-2025-31181
>>
>> This release supports qt4, qt5 and qt6 (the last one is new in this release).
>> There are 2 qt PACKAGECONFIGs now: qt5 and qt6 - they are mutually exclusive.
>>
>> Since it is being touched, also fix lua PACKAGECONFIG, which requires lua-native
>> at build time.
>>
>> Changelog:
>> http://gnuplot.info/ReleaseNotes_6_0_3.html
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../0003-Use-native-tools-to-build-docs.patch | 66 +++++++++----------
>>  ...ion-to-find-qt5-and-qt6-native-tools.patch | 64 ++++++++++++++++++
>>  ...gure-option-to-find-qt5-native-tools.patch | 42 ------------
>>  .../{gnuplot_5.4.3.bb => gnuplot_6.0.3.bb}    | 11 ++--
>>  4 files changed, 102 insertions(+), 81 deletions(-)
>>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
>>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
>>  rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.4.3.bb => gnuplot_6.0.3.bb} (77%)
>>
>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
>> index 7a7e550349..736dff13e1 100644
>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
>> @@ -23,29 +23,26 @@ diff --git a/docs/Makefile.am b/docs/Makefile.am
>>  index b20918a..47406eb 100644
>>  --- a/docs/Makefile.am
>>  +++ b/docs/Makefile.am
>> -@@ -156,7 +156,7 @@ gnuplot-groff.ps: gnuplot.ms $(srcdir)/titlepag.ms
>> +@@ -175,7 +175,7 @@
>> +       $(AM_V_GEN) touch $@
>>
>> - ### doc2xxx dependencies
>> - gnuplot.ms: doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc
>> --      $(AM_V_GEN) ./doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(srcdir)/titlepag.ms"
>> -+      $(AM_V_GEN) doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(srcdir)/titlepag.ms"
>> -
>> - doc2ms_SOURCES = doc2ms.c termdoc.c
>> - doc2ms_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
>> -@@ -177,10 +177,10 @@ pdf_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
>> -       $(AM_V_GEN)touch $@
>> -
>> - figures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
>> + gnuplot.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
>>  -      $(AM_V_GEN)./doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
>>  +      $(AM_V_GEN) doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
>>
>> - nofigures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
>> --      $(AM_V_GEN)./doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
>> -+      $(AM_V_GEN) doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
>> -
>> - pdf: gnuplot.pdf
>> - pdf_nofig: nofigures.pdf
>> -@@ -260,7 +260,7 @@ gnuplot.ps: gnuplot.dvi
>> + pdf: pdf_figures
>> +       $(MAKE) gnuplot.pdf
>> +@@ -255,7 +255,7 @@
>> +
>> + gnuplot-ja.pdf: gnuplot-ja.doc title-ja.tex pdf_figures allterm-ja.h doc2tex$(EXEEXT)
>> +       iconv -f EUC-JP -t UTF-8 gnuplot-ja.doc > ja.doc
>> +-      ./doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.tex/title-ja.tex/' > gnuplot-ja.tex
>> ++      doc2tex$(EXEEXT) -figures -japanese ja.doc | sed 's/titlepag.tex/title-ja.tex/' > gnuplot-ja.tex
>> +       lualatex gnuplot-ja
>> +       lualatex gnuplot-ja
>> +       makeindex gnuplot-ja
>> +
>> +@@ -268,7 +268,7 @@ gnuplot.ps: gnuplot.dvi
>>   hlp: gnuplot.hlp
>>
>>   gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
>> @@ -54,7 +51,7 @@ index b20918a..47406eb 100644
>>
>>   doc2hlp_SOURCES = doc2hlp.c termdoc.c
>>
>> -@@ -268,14 +268,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
>> +@@ -276,14 +276,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
>>   gih: gnuplot.gih
>>
>>   gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
>> @@ -71,7 +68,7 @@ index b20918a..47406eb 100644
>>
>>   alldoc2gih_SOURCES = doc2gih.c termdoc.c
>>   alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
>> -@@ -290,7 +290,7 @@ $(srcdir)/windows/wgnuplot.hhk
>> +@@ -298,7 +298,7 @@ $(srcdir)/windows/wgnuplot.hhk
>>   wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
>>
>>   wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc
>> @@ -80,7 +77,16 @@ index b20918a..47406eb 100644
>>
>>   doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
>>   doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
>> -@@ -340,7 +340,7 @@ install-info: gnuplot.info
>> +@@ -318,7 +318,7 @@
>> +       $(AM_V_at) [ -d html ] || mkdir -p html
>> +       $(AM_V_at) rm -f html/Overview.html html/Plotting_Styles.html html/Commands.html html/Terminals.html
>> +       $(AM_V_at) rm -f html/NewFeatures.html
>> +-      $(AM_V_GEN)./doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
>> ++      $(AM_V_GEN) doc2web$(EXEEXT) $(srcdir)/gnuplot.doc html
>> +       $(AM_V_GEN) sort -k 3 html/index.hhk > html/index.html
>> +
>> + svg_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
>> +@@ -372,7 +372,7 @@ install-info: gnuplot.info
>>   ipf: gnuplot.ipf
>>
>>   gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
>> @@ -89,7 +95,7 @@ index b20918a..47406eb 100644
>>
>>   doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
>>
>> -@@ -348,7 +348,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
>> +@@ -380,7 +380,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
>>   rtf: gnuplot.rtf
>>
>>   gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
>> @@ -98,22 +104,12 @@ index b20918a..47406eb 100644
>>
>>   doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
>>
>> -@@ -356,13 +356,13 @@ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
>> - rnh: gnuplot.rnh
>> -
>> - gnuplot.rnh: doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc
>> --      $(AM_V_GEN) ./doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
>> -+      $(AM_V_GEN) doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
>> -
>> - doc2rnh_SOURCES = doc2rnh.c termdoc.c
>> +@@ -386,7 +386,7 @@
>>
>>   # this is how to check the gnuplot.doc file
>>   check-local: checkdoc$(EXEEXT)
>>  -      $(AM_V_at)./checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
>>  +      $(AM_V_at)checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
>>         if test $$? -eq 0; then \
>> -         echo "PASS: gnuplot.doc"; \
>> +          echo "PASS: gnuplot.doc"; \
>>         else \
>> ---
>> -2.14.3
>> -
>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
>> new file mode 100644
>> index 0000000000..50c0785df0
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch
>> @@ -0,0 +1,64 @@
>> +From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>> +Date: Tue, 6 Mar 2018 22:26:48 +0100
>> +Subject: [PATCH] Add configure option to find qt5 native tools
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Pkg-config checks for target locations. With these qt5 tools as uic/moc..
>> +cannot be used.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>> +---
>> + configure.ac | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index cdd831a..fdd192b 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -1061,11 +1061,15 @@
>> +   if test "x${with_qt}" != "xqt4"; then
>> +     pkg_failed="not_tried"
>> +     if test "x${with_qt}" != "xqt5"; then
>> ++     AC_ARG_WITH(qt6nativesysroot,
>> ++       AC_HELP_STRING([--with-qt6nativesysroot=PATH], [prepend path - for native qt6 tools]),
>> ++      [QT6NATIVESYSROOT="$withval"], [QT6NATIVESYSROOT=""])
>> ++
>> +       AC_MSG_CHECKING([Checking for Qt6 support libraries])
>> +       PKG_CHECK_MODULES_NOFAIL(QT, [Qt6Core Qt6Gui Qt6Network Qt6Svg Qt6PrintSupport Qt6Widgets Qt6Core5Compat])
>> +     fi
>> +     if test $pkg_failed = no; then
>> +-      QT6LOC=`$PKG_CONFIG --variable=libexecdir Qt6Core`
>> ++      QT6LOC=${QT6NATIVESYSROOT}`$PKG_CONFIG --variable=libexecdir Qt6Core`
>> +       if test "x${QT6LOC}" != "x"; then
>> +           UIC=${QT6LOC}/uic
>> +           MOC=${QT6LOC}/moc
>> +@@ -1075,7 +1079,7 @@
>> +           MOC=moc-qt6
>> +           RCC=rcc-qt6
>> +       fi
>> +-      QT6BIN=`$PKG_CONFIG --variable=bindir Qt6Core`
>> ++      QT6BIN=${QT6NATIVESYSROOT}`$PKG_CONFIG --variable=bindir Qt6Core`
>> +       if test "x${QT6BIN}" != "x"; then
>> +           LRELEASE=${QT6BIN}/lrelease
>> +       elif test "x${LRELEASE}" = "x"; then
>> +@@ -1086,10 +1090,14 @@
>> +       AC_MSG_RESULT([The Qt terminal will use Qt6.])
>> +       QTVER="6"
>> +     else
>> ++     AC_ARG_WITH(qt5nativesysroot,
>> ++       AC_HELP_STRING([--with-qt5nativesysroot=PATH], [prepend path - for native qt5 tools]),
>> ++       [QT5NATIVESYSROOT="$withval"], [QT5NATIVESYSROOT=""])
>> ++
>> +       AC_MSG_CHECKING([Checking for Qt5 support libraries])
>> +       PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport])
>> +       if test $pkg_failed = no; then
>> +-        QT5LOC=`$PKG_CONFIG --variable=host_bins Qt5Core`
>> ++        QT5LOC=${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=host_bins Qt5Core`
>> +         if test "x${QT5LOC}" != "x"; then
>> +           UIC=${QT5LOC}/uic
>> +           MOC=${QT5LOC}/moc
>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
>> deleted file mode 100644
>> index 7ed9e761f2..0000000000
>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
>> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>> -Date: Tue, 6 Mar 2018 22:26:48 +0100
>> -Subject: [PATCH] Add configure option to find qt5 native tools
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Pkg-config checks for target locations. With these qt5 tools as uic/moc..
>> -cannot be used.
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>> ----
>> - configure.ac | 6 +++++-
>> - 1 file changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index cdd831a..fdd192b 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -1133,11 +1133,15 @@ if test "${enable_qt}" = yes ; then
>> -   else
>> -     try_qt4=yes
>> -   fi
>> -+  AC_ARG_WITH(qt5nativesysroot,
>> -+    AC_HELP_STRING([--with-qt5nativesysroot=PATH], [prepend path - for native qt5 tools]),
>> -+    [QT5NATIVESYSROOT="$withval"], [QT5NATIVESYSROOT=""])
>> -+
>> -   if test "x${with_qt}" != "xqt4"; then
>> -     PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport])
>> -     if test $pkg_failed = no; then
>> -       try_qt4=no
>> --      QT5LOC=`$PKG_CONFIG --variable=host_bins Qt5Core`
>> -+      QT5LOC=${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=host_bins Qt5Core`
>> -       if test "x${QT5LOC}" != "x"; then
>> -         UIC=${QT5LOC}/uic
>> -         MOC=${QT5LOC}/moc
>> ---
>> -2.14.3
>> -
>> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
>> similarity index 77%
>> rename from meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
>> rename to meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
>> index 679b1a7e98..35c83fd23e 100644
>> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
>> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
>> @@ -18,10 +18,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
>>  SRC_URI:append:class-target = " \
>>      file://0002-do-not-build-demos.patch \
>>      file://0003-Use-native-tools-to-build-docs.patch \
>> -    file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
>> +    file://0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch \
>>  "
>>
>> -SRC_URI[archive.sha256sum] = "51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84"
>> +SRC_URI[archive.sha256sum] = "ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab"
>>  SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
>>
>>  # for building docs (they deserve it) we need *doc2* tools native
>> @@ -39,14 +39,17 @@ do_install:class-native() {
>>
>>  PACKAGECONFIG ??= "cairo ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>>  PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
>> -PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
>> -PACKAGECONFIG[qt5] = "--with-qt --with-qt5nativesysroot=${STAGING_DIR_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
>> +PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua lua-native"
>> +# qt5 requires meta-qt5 layer, qt6 requires meta-qt6 layer
>> +PACKAGECONFIG[qt5] = "--with-qt=qt5 --with-qt5nativesysroot=${STAGING_DIR_NATIVE},,qtbase-native qtbase qtsvg qttools-native,,,qt6"
>> +PACKAGECONFIG[qt6] = "--with-qt --with-qt6nativesysroot=${STAGING_DIR_NATIVE},,qtbase-native qtbase qtsvg qttools-native qt5compat,,,qt5"
>>  PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11"
>>
>>  EXTRA_OECONF = " \
>>      --with-readline=${STAGING_LIBDIR}/.. \
>>      --disable-wxwidgets \
>>      --without-libcerf \
>> +    ${@bb.utils.contains_any('PACKAGECONFIG', 'qt5 qt6', '', '--without-qt', d)} \
>>  "
>>
>>  do_compile:prepend() {
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120303): https://lists.openembedded.org/g/openembedded-devel/message/120303
>> Mute This Topic: https://lists.openembedded.org/mt/115620128/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


