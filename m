Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E11C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:43:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.9788.1704887027014333702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PFVFE2t7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e43fb2659so35346305e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 03:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704887025; x=1705491825; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niLmsK9k91X9/Cqsvk3KmghY8IJ9EWYsKb6tuh4rvdY=;
        b=PFVFE2t7OJYuYk3xCzeBjY7qPheR1udPOms8qfAgzQNR/d8sPcWWxk8l47JyPVOUAZ
         ejfhK5Zo2Ej90t7bwcIqPL0mvJkzj02uSkZQ+e+iJ4QIkO8Myl6OpoGvPu75+55TCQ2U
         fHuRU0rk9hTTrh+YYCGMsrleMyqfZp2rmcxPBzXs9pQ40u+zdQrwW7zP/pnmwKZtJcD2
         7AHuzCiFAPR3xYm7eQ/Fi61xjP67HVpeW1jVNQPpekL1H1azJns79b/Qt1s5n4M83UNv
         tz2VmPKW4GTZm64BURzxqnZT4PMRE7AVEnwgMwGGSIlsz/rf0UzEjckn35v3NkOA16fU
         IWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887025; x=1705491825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niLmsK9k91X9/Cqsvk3KmghY8IJ9EWYsKb6tuh4rvdY=;
        b=BqGTyNV2pnq2GqdRT/nMB/b6v1w0a9h1Ndt5gxmTgsbtQWM3emcafDJ2dxIVDT2HIX
         jzkBsSHoMzzwJc/5tLee62p618XVLyi6+j+YjX5JWuiJLDRX9VB/Kt3XKuuw3GcOnoBS
         1YKj9FkoumKrjOaxVZo4Vt8pn2z2/h0hmGurfgxRws0ip3Fxsd0IwkM3yqzu0Cynx5Ni
         ywfYQzoHhjZsnkHM7Hm8+Bpydw40+US5bFgQUndzRPflOQXFL0UW/fbkY7NLXO+ReLMO
         s6LHYSzhlanZcvG41LWKz7PvfwRptEj8N3S+EXaxfNX0QBcdhe4ZXgkalGOQiTSqrDQT
         +fTw==
X-Gm-Message-State: AOJu0YyspaOIy0NoH936n7ZTnm+fEtuzzcoW3ozEXba9bC0CEshgjvU9
	Yf0Mx2KpEuN1LQWWWlBr6PxdZ+gdEm7FYstxZ84=
X-Google-Smtp-Source: AGHT+IGC0Rm/u+Znaclt5g1HwIYrQ9S/MTcH3ijopBTNWpocv8c9izZ27qfcNtC//7kt6fvF8nU6/l9AQl1DN49Yid8=
X-Received: by 2002:a05:600c:1f88:b0:40d:8ef2:7ae0 with SMTP id
 je8-20020a05600c1f8800b0040d8ef27ae0mr483350wmb.98.1704887025045; Wed, 10 Jan
 2024 03:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20231231122329.405225-1-alex@linutronix.de> <20231231122329.405225-5-alex@linutronix.de>
In-Reply-To: <20231231122329.405225-5-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 Jan 2024 12:43:34 +0100
Message-ID: <CA+chaQck+iG8TbiY0Rx90JTFY3K371JTQ2RmUpwtPvQq9xb0oA@mail.gmail.com>
Subject: Re: [oe] [PATCH 05/23] libpwquality: backport a python 3.12
 compatibility patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000008294b1060e95f19b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 11:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108215

--0000000000008294b1060e95f19b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It doesn't respect libdir now, causing installed-vs-shipped e.g. in
multilib builds with libdir set to /usr/lib32:

ERROR: QA Issue: lib32-libpwquality: Files/directories were installed but
not shipped in any package:
  /usr/lib/python3.11/site-packages/
pwquality.cpython-311-arm-linux-gnueabi.so
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info

/usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/SOURCES.t=
xt
  /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/PKG-INF=
O

/usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/dependenc=
y_links.txt

/usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/top_level=
.txt
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
lib32-libpwquality: 6 installed and not shipped files.
[installed-vs-shipped]

On Sun, Dec 31, 2023 at 1:23=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> This also allows dropping a previous patch.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
>  ...missing-python-include-dir-for-cross.patch | 43 ----------
>  .../libpwquality/libpwquality_1.4.5.bb        |  6 +-
>  3 files changed, 81 insertions(+), 46 deletions(-)
>  create mode 100644
> meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-o=
f-distutils.patch
>  delete mode 100644
> meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-di=
r-for-cross.patch
>
> diff --git
> a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead=
-of-distutils.patch
> b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead=
-of-distutils.patch
> new file mode 100644
> index 000000000..7eaca66b5
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead=
-of-distutils.patch
> @@ -0,0 +1,78 @@
> +From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
> +Date: Fri, 31 Mar 2023 14:52:19 +0200
> +Subject: [PATCH] Use setuptools instead of distutils
> +
> +distutils is removed from Python 3.12+:
> +https://peps.python.org/pep-0632/
> +
> +Upstream-Status: Backport [
> https://github.com/libpwquality/libpwquality/commit/7b5e0f0097faebdcc6a8b=
783237bbba7a983147a
> ]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + libpwquality.spec.in | 11 ++---------
> + python/Makefile.am   |  2 +-
> + python/setup.py.in   |  6 +++---
> + 3 files changed, 6 insertions(+), 13 deletions(-)
> +
> +diff --git a/libpwquality.spec.in b/libpwquality.spec.in
> +index 70a6f53..0809126 100644
> +--- a/libpwquality.spec.in
> ++++ b/libpwquality.spec.in
> +@@ -33,9 +33,11 @@ BuildRequires: gettext
> + BuildRequires: pam-devel
> + %if %{with python2}
> + BuildRequires: python2-devel
> ++BuildRequires: python2-setuptools
> + %endif
> + %if %{with python3}
> + BuildRequires: python3-devel
> ++BuildRequires: python3-setuptools
> + %endif
> +
> + URL: https://github.com/libpwquality/libpwquality/
> +@@ -103,15 +105,6 @@ cp -a . %{py3dir}
> + pushd %{py3dir}
> + %endif
> + %if %{with python3}
> +-# setuptools >=3D 60 changes the environment to use its bundled copy of
> distutils
> +-# by default, not the Python-bundled one. To run the Python's standard
> library
> +-# distutils, the environment variable must be set.
> +-# Although technically setuptools is not needed for this package, if it=
's
> +-# pulled by another package, it changes the environment and consequentl=
y,
> +-# the build fails. This was reported in:
> +-# https://github.com/pypa/setuptools/issues/3143
> +-export SETUPTOOLS_USE_DISTUTILS=3Dstdlib
> +-
> + %configure \
> +       --with-securedir=3D%{_moduledir} \
> +       --with-pythonsitedir=3D%{python3_sitearch} \
> +diff --git a/python/Makefile.am b/python/Makefile.am
> +index 1d00c0c..6e51744 100644
> +--- a/python/Makefile.am
> ++++ b/python/Makefile.am
> +@@ -14,7 +14,7 @@ all-local:
> +       CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py
> build --build-base py$(PYTHONREV)
> +
> + install-exec-local:
> +-      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py
> build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
> ++      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py
> build --build-base py$(PYTHONREV) install --root ${DESTDIR}
> --prefix=3D${prefix}
> +
> + clean-local:
> +       rm -rf py$(PYTHONREV)
> +diff --git a/python/setup.py.in b/python/setup.py.in
> +index a741b91..f934c50 100755
> +--- a/python/setup.py.in
> ++++ b/python/setup.py.in
> +@@ -6,9 +6,9 @@
> +
> + import os
> +
> +-from distutils.core import setup, Extension
> +-from distutils.command.build_ext import build_ext as _build_ext
> +-from distutils.command.sdist import sdist as _sdist
> ++from setuptools import setup, Extension
> ++from setuptools.command.build_ext import build_ext as _build_ext
> ++from setuptools.command.sdist import sdist as _sdist
> +
> + def genconstants(headerfile, outputfile):
> +     hf =3D open(headerfile, 'r')
> diff --git
> a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-=
dir-for-cross.patch
> b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-=
dir-for-cross.patch
> deleted file mode 100644
> index 636b29407..000000000
> ---
> a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-=
dir-for-cross.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 1ea09e09ab2387c326bb7170835361ece6e25477 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 3 Aug 2015 13:43:14 +0800
> -Subject: [PATCH] setup.py.in: add missing python include dir for cross
> - compiling
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - python/Makefile.am | 2 +-
> - python/setup.py.in | 3 ++-
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/python/Makefile.am b/python/Makefile.am
> -index 1d00c0c..52816b2 100644
> ---- a/python/Makefile.am
> -+++ b/python/Makefile.am
> -@@ -14,7 +14,7 @@ all-local:
> -       CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py
> build --build-base py$(PYTHONREV)
> -
> - install-exec-local:
> --      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py
> build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
> -+      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py
> build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
> --install-lib=3D${DESTDIR}/${PYTHONSITEDIR}
> -
> - clean-local:
> -       rm -rf py$(PYTHONREV)
> -diff --git a/python/setup.py.in b/python/setup.py.in
> -index a741b91..6759a95 100755
> ---- a/python/setup.py.in
> -+++ b/python/setup.py.in
> -@@ -33,7 +33,7 @@ class sdist(_sdist):
> -
> - pwqmodule =3D Extension('pwquality',
> -             sources =3D ['pwquality.c'],
> --            include_dirs =3D ['../src'],
> -+            include_dirs =3D ['../src',
> os.path.join(os.environ['STAGING_INCDIR'], os.environ['PYTHON_DIR'])],
> -             library_dirs =3D ['../src/.libs'],
> -             libraries =3D ['pwquality'])
> -
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> index 5287430c4..91afedcb6 100644
> --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> @@ -5,11 +5,11 @@ SECTION =3D "devel/lib"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676=
fc2"
>
> -DEPENDS =3D "cracklib"
> +DEPENDS =3D "cracklib python3-setuptools-native"
>
>  SRC_URI =3D "git://
> github.com/libpwquality/libpwquality;branch=3Dmaster;protocol=3Dhttps \
> -           file://add-missing-python-include-dir-for-cross.patch \
> -"
> +           file://0001-Use-setuptools-instead-of-distutils.patch \
> +           "
>  SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107956):
> https://lists.openembedded.org/g/openembedded-devel/message/107956
> Mute This Topic: https://lists.openembedded.org/mt/103445561/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008294b1060e95f19b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It doesn&#39;t respect libdir now, causing installed-=
vs-shipped e.g. in multilib builds with libdir set to /usr/lib32:</div><div=
><br></div>ERROR: QA Issue: lib32-libpwquality: Files/directories were inst=
alled but not shipped in any package:<br>=C2=A0 /usr/lib/python3.11/site-pa=
ckages/<a href=3D"http://pwquality.cpython-311-arm-linux-gnueabi.so">pwqual=
ity.cpython-311-arm-linux-gnueabi.so</a><br>=C2=A0 /usr/lib/python3.11/site=
-packages/pwquality-1.4.5-py3.11.egg-info<br>=C2=A0 /usr/lib/python3.11/sit=
e-packages/pwquality-1.4.5-py3.11.egg-info/SOURCES.txt<br>=C2=A0 /usr/lib/p=
ython3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/PKG-INFO<br>=C2=A0 =
/usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/dependenc=
y_links.txt<br>=C2=A0 /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3=
.11.egg-info/top_level.txt<br>Please set FILES such that these items are pa=
ckaged. Alternatively if they are unneeded, avoid installing them or delete=
 them within do_install.<br>lib32-libpwquality: 6 installed and not shipped=
 files. [installed-vs-shipped]<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 31, 2023 at 1:23=E2=80=AFPM A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This also allows dropping a previous patch.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...-Use-setuptools-instead-of-distutils.patch | 78 ++++++++++++++++++=
+<br>
=C2=A0...missing-python-include-dir-for-cross.patch | 43 ----------<br>
=C2=A0.../libpwquality/<a href=3D"http://libpwquality_1.4.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">libpwquality_1.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 6 +-<br>
=C2=A03 files changed, 81 insertions(+), 46 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-U=
se-setuptools-instead-of-distutils.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/libpwquality/files/add-mi=
ssing-python-include-dir-for-cross.patch<br>
<br>
diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptool=
s-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/files/=
0001-Use-setuptools-instead-of-distutils.patch<br>
new file mode 100644<br>
index 000000000..7eaca66b5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-inste=
ad-of-distutils.patch<br>
@@ -0,0 +1,78 @@<br>
+From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D &lt;<a href=3D"mailto:miro=
@hroncok.cz" target=3D"_blank">miro@hroncok.cz</a>&gt;<br>
+Date: Fri, 31 Mar 2023 14:52:19 +0200<br>
+Subject: [PATCH] Use setuptools instead of distutils<br>
+<br>
+distutils is removed from Python 3.12+:<br>
+<a href=3D"https://peps.python.org/pep-0632/" rel=3D"noreferrer" target=3D=
"_blank">https://peps.python.org/pep-0632/</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libpwquality/libp=
wquality/commit/7b5e0f0097faebdcc6a8b783237bbba7a983147a" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/libpwquality/libpwquality/commit/7b5=
e0f0097faebdcc6a8b783237bbba7a983147a</a>]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ <a href=3D"http://libpwquality.spec.in" rel=3D"noreferrer" target=3D"_bla=
nk">libpwquality.spec.in</a> | 11 ++---------<br>
+ python/Makefile.am=C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_blank=
">setup.py.in</a>=C2=A0 =C2=A0|=C2=A0 6 +++---<br>
+ 3 files changed, 6 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://libpwquality.spec.in" rel=3D"noreferrer" ta=
rget=3D"_blank">libpwquality.spec.in</a> b/<a href=3D"http://libpwquality.s=
pec.in" rel=3D"noreferrer" target=3D"_blank">libpwquality.spec.in</a><br>
+index 70a6f53..0809126 100644<br>
+--- a/<a href=3D"http://libpwquality.spec.in" rel=3D"noreferrer" target=3D=
"_blank">libpwquality.spec.in</a><br>
++++ b/<a href=3D"http://libpwquality.spec.in" rel=3D"noreferrer" target=3D=
"_blank">libpwquality.spec.in</a><br>
+@@ -33,9 +33,11 @@ BuildRequires: gettext<br>
+ BuildRequires: pam-devel<br>
+ %if %{with python2}<br>
+ BuildRequires: python2-devel<br>
++BuildRequires: python2-setuptools<br>
+ %endif<br>
+ %if %{with python3}<br>
+ BuildRequires: python3-devel<br>
++BuildRequires: python3-setuptools<br>
+ %endif<br>
+ <br>
+ URL: <a href=3D"https://github.com/libpwquality/libpwquality/" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/libpwquality/libpwquality/</a=
><br>
+@@ -103,15 +105,6 @@ cp -a . %{py3dir}<br>
+ pushd %{py3dir}<br>
+ %endif<br>
+ %if %{with python3}<br>
+-# setuptools &gt;=3D 60 changes the environment to use its bundled copy o=
f distutils<br>
+-# by default, not the Python-bundled one. To run the Python&#39;s standar=
d library<br>
+-# distutils, the environment variable must be set.<br>
+-# Although technically setuptools is not needed for this package, if it&#=
39;s<br>
+-# pulled by another package, it changes the environment and consequently,=
<br>
+-# the build fails. This was reported in:<br>
+-# <a href=3D"https://github.com/pypa/setuptools/issues/3143" rel=3D"noref=
errer" target=3D"_blank">https://github.com/pypa/setuptools/issues/3143</a>=
<br>
+-export SETUPTOOLS_USE_DISTUTILS=3Dstdlib<br>
+-<br>
+ %configure \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-securedir=3D%{_moduledir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-pythonsitedir=3D%{python3_sitearch} \<br=
>
+diff --git a/python/Makefile.am b/python/Makefile.am<br>
+index 1d00c0c..6e51744 100644<br>
+--- a/python/Makefile.am<br>
++++ b/python/Makefile.am<br>
+@@ -14,7 +14,7 @@ all-local:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} -fno-strict-aliasing&q=
uot; @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)<br>
+ <br>
+ install-exec-local:<br>
+-=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;${CFLAGS} -fno-strict-aliasing&quot; =
@PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=
=3D${DESTDIR}${prefix}<br>
++=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;${CFLAGS} -fno-strict-aliasing&quot; =
@PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${=
DESTDIR} --prefix=3D${prefix}<br>
+ <br>
+ clean-local:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf py$(PYTHONREV)<br>
+diff --git a/python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" targ=
et=3D"_blank">setup.py.in</a> b/python/<a href=3D"http://setup.py.in" rel=
=3D"noreferrer" target=3D"_blank">setup.py.in</a><br>
+index a741b91..f934c50 100755<br>
+--- a/python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_=
blank">setup.py.in</a><br>
++++ b/python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_=
blank">setup.py.in</a><br>
+@@ -6,9 +6,9 @@<br>
+ <br>
+ import os<br>
+ <br>
+-from distutils.core import setup, Extension<br>
+-from distutils.command.build_ext import build_ext as _build_ext<br>
+-from distutils.command.sdist import sdist as _sdist<br>
++from setuptools import setup, Extension<br>
++from setuptools.command.build_ext import build_ext as _build_ext<br>
++from setuptools.command.sdist import sdist as _sdist<br>
+ <br>
+ def genconstants(headerfile, outputfile):<br>
+=C2=A0 =C2=A0 =C2=A0hf =3D open(headerfile, &#39;r&#39;)<br>
diff --git a/meta-oe/recipes-extended/libpwquality/files/add-missing-python=
-include-dir-for-cross.patch b/meta-oe/recipes-extended/libpwquality/files/=
add-missing-python-include-dir-for-cross.patch<br>
deleted file mode 100644<br>
index 636b29407..000000000<br>
--- a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-includ=
e-dir-for-cross.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 1ea09e09ab2387c326bb7170835361ece6e25477 Mon Sep 17 00:00:00 2001<br>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-Date: Mon, 3 Aug 2015 13:43:14 +0800<br>
-Subject: [PATCH] <a href=3D"http://setup.py.in" rel=3D"noreferrer" target=
=3D"_blank">setup.py.in</a>: add missing python include dir for cross<br>
- compiling<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- python/Makefile.am | 2 +-<br>
- python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_blank=
">setup.py.in</a> | 3 ++-<br>
- 2 files changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/python/Makefile.am b/python/Makefile.am<br>
-index 1d00c0c..52816b2 100644<br>
---- a/python/Makefile.am<br>
-+++ b/python/Makefile.am<br>
-@@ -14,7 +14,7 @@ all-local:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} -fno-strict-aliasing&q=
uot; @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)<br>
- <br>
- install-exec-local:<br>
--=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;${CFLAGS} -fno-strict-aliasing&quot; =
@PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=
=3D${DESTDIR}${prefix}<br>
-+=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;${CFLAGS} -fno-strict-aliasing&quot; =
@PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=
=3D${DESTDIR}${prefix} --install-lib=3D${DESTDIR}/${PYTHONSITEDIR}<br>
- <br>
- clean-local:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf py$(PYTHONREV)<br>
-diff --git a/python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" targ=
et=3D"_blank">setup.py.in</a> b/python/<a href=3D"http://setup.py.in" rel=
=3D"noreferrer" target=3D"_blank">setup.py.in</a><br>
-index a741b91..6759a95 100755<br>
---- a/python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_=
blank">setup.py.in</a><br>
-+++ b/python/<a href=3D"http://setup.py.in" rel=3D"noreferrer" target=3D"_=
blank">setup.py.in</a><br>
-@@ -33,7 +33,7 @@ class sdist(_sdist):<br>
- <br>
- pwqmodule =3D Extension(&#39;pwquality&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources =3D [&#39;pwqualit=
y.c&#39;],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_dirs =3D [&#39;../src&#=
39;],<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_dirs =3D [&#39;../src&#=
39;, os.path.join(os.environ[&#39;STAGING_INCDIR&#39;], os.environ[&#39;PYT=
HON_DIR&#39;])],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library_dirs =3D [&#39;../=
src/.libs&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries =3D [&#39;pwqual=
ity&#39;])<br>
- <br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwq=
uality_1.4.5.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.5.bb=
</a> b/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality=
_1.4.5.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.5.bb</a><b=
r>
index 5287430c4..91afedcb6 100644<br>
--- a/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality_=
1.4.5.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.5.bb</a><br=
>
+++ b/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality_=
1.4.5.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.5.bb</a><br=
>
@@ -5,11 +5,11 @@ SECTION =3D &quot;devel/lib&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bd2f1386df813a459a0c=
34fde676fc2&quot;<br>
<br>
-DEPENDS =3D &quot;cracklib&quot;<br>
+DEPENDS =3D &quot;cracklib python3-setuptools-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/libpwquality/lib=
pwquality;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/libpwquality/libpwquality;branch=3Dmaster;protocol=3Dhttps=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-missing-python-include=
-dir-for-cross.patch \<br>
-&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-setuptools-instea=
d-of-distutils.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107956): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107956" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107956</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103445561/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103445561/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008294b1060e95f19b--

