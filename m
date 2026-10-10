Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83006CA601E
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 00:44:27 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1404.1791593060500817792
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 17:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HHyf7n1y;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6dd7070699eso293188eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 17:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791593059; cv=none;
        d=google.com; s=arc-20260327;
        b=g37KkJzX4d4UR+XmKWqL3WGVvxir18kSyQz5WNgJs+HFgiXOWwyLG4z4yunyZQVN/J
         1KdSGjzTB+KBpKtJ/KUju/CC7appTc03t8bhzF4NYRwmoSIqIpQEPFTwLN191EaBHWKe
         DcRaY6FQwKFE98s7ZlgYyhvP52dklHe8Slx8n34NVJVkFphXpSSIp/ZFIm8kS5C3/oGC
         6lpMnX4kk4+e7rAG8bBMKkQuMaoNuPOnYynAznAWP63pGcUJHJWmQw+TVrv0MN4ZxhsT
         MN2NWkPbyKhuFgxq1fuz1quBP5wqQUy0CU/kn247qUjbatefvNISDY4C8jdsk1gyxStD
         tOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5h85rmqZGsHYp5VWP6rFE0fTvgzrEVGXwFa5QvfBnI=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=IfJnysePimck72S0pDOb5CmbchjDgLjYzJd5AD5uGoMVJSg+ecd2/4meTWi1zwbsAv
         g9MsLCWQUwfGk/zdDRkte6ajiP+TcHXSlgaFHzaMhRYf4mU4FHnVKlnCsuSiJw9ntBWt
         PZS1J0pQNxymT1PZXhCI+2e26iIaSeFFdnqmUVm8tch/KnbV+gcGVFrE0O8az7Bmh33T
         1SGBUavxucDNyIFXljsI7NBD/vixJ1dBYy8zZDVfZ405IEXF3SCojOPaSuS1M0And1ho
         fHotqZJn1fUWNOKeL5hvd5L9Vz9lGy5Uiwe/qCkmqE1IYEAm13SM9elLS2FcuwhSDqo5
         m3lw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791593059; x=1792197859; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5h85rmqZGsHYp5VWP6rFE0fTvgzrEVGXwFa5QvfBnI=;
        b=HHyf7n1yDy0AVn/rCisNfPYhb2HopQuL8Xrq7cHJPvJbfeOrXqElRHDx2Hzy/Ec/cF
         DRiS6aDF/KczGR6wjjOhj8D2X3ddIDPMNvEj1cBmTRPJ69iGOnSv6Zqh04n1wedqU02z
         bAo+l6c3j3tEdkiKfrRThHl3bCuEalRUixeYElXwrz14j5v+/BQBX5URAwvy81O8YUm7
         MdQpEm27xxe35VCpmY5L6YwOo1GGgQO9xsT1aRhWInxFI3QWZ2Ux0cjCh+lPkTQGXHgE
         rGupLu/iSM45Qq692ZS2wl5Rj5jzrwVgWxzDDdCvJZMZ5J2WxbqFr23MwEnQ8w6EnoVQ
         XnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791593059; x=1792197859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5h85rmqZGsHYp5VWP6rFE0fTvgzrEVGXwFa5QvfBnI=;
        b=jrkB1EUypwvmGRv2FNbOVAFjWJBmcfmy5dW4bPq6xQ1oBKHLsujIzKmSQV96ewnJK8
         ynGbU/DMUZ1OYzxE1biJHNuPB1JlcONIlSDRAn0n/YfLERkckgLYl5qMZV7SQfIyKYy0
         hFbjXB0SvzgLQrjNJp9kVs0XR6JPYleo2954qbKeMuttnG9mPsfmblXa90w5nmYBibt1
         SfMOgXGWhgG/W8mFpKBib+gHJh5hPz0dWX2sJY+MSB++CFzzubQdoilLC5F68HQ1fIaf
         uE1kWjVql2VGKOn4L8HGiD7McAZW/V0s2d+H8ncrr3eqwwkvI1WISE0XQW1az4j8h+83
         pjwg==
X-Gm-Message-State: AFq9FYLzXPhgeBWeFELqLZIaTOWDJ99pAIcphUZBZY1NhtJaJTvLogv9
	RNPgjPIP/4KcC+5IJ5xy7OwVw1Pcq3hKo4/oQh8A1r0Gn56psLJaYJ2c3zEUYzXHK1gUa9nF0E3
	KsIwqhwuzwgvEGpr/h2TP7YIl+viDoBo=
X-Gm-Gg: AYBFou06hAs1LHR5ZwjFQQ5q7ekkRvXv48/K3dDcjSWd/sV0aC3JouiTLPy7viIR6AP
	DUlHOZpA1CUlO6Y8WMAAGKLYB9sI0zr7EtWYbci8zdFNOq/cFY/dSEv0O8QU+QTYhFx4HjQ/nfn
	aN3zG1UId6EpHdRt2WDgq9X6LuUH1cekpaTz7YmCmWFfHm/HJDN86clgAaxT/yTdc2VkYF+LA8/
	73L5VVZhMSDX/9QYGpYsnl1ZCP1CiiJygYQFiK6uWPinY2psvGMtK6lfgl9LlmUUEThgVeSzpMT
	8sfotrQjbwFLOKo+cbQ2Xb3Uct/ihzKAVxYtoRtqLS2DBhNG9Q1iJBS6YL+S4Vjw0HbNAw==
X-Received: by 2002:a05:6820:61e:b0:6d9:2238:b559 with SMTP id
 006d021491bc7-6ef131c58fbmr2602832eaf.89.1791593059536; Fri, 09 Oct 2026
 17:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20261009181419.1209594-1-f_l_k@t-online.de>
In-Reply-To: <20261009181419.1209594-1-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 10 Oct 2026 13:44:08 +1300
X-Gm-Features: AclHuK-Dp5SxowdxASw5Op0KHzhx-bKO9Q4ETycrizgAy4westJGNy6OJ2LjUds
Message-ID: <CADySD0GT0PJo6XVutxRNgz_evw2OH_otgvxnNyxfw6-usFZ0Dw@mail.gmail.com>
Subject: Re: [oe] [blackksail][meta-oe][PATCH] Revert "libpwquality: remove
 recipe (moved to oe-core)"
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 00:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130712

Hello Markus,

Typo in the branch name but I have accepted the patch, thanks for sending i=
t.

cheers
Ankur

On Sat, Oct 10, 2026 at 7:15=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This reverts commit 50d5f23e07431865470d16aeaeb8e442f690186b.
>
> The import into oe-core (3d295bef38 "libpwquality: import recipe from
> meta-oe") is only in oe-core master, not in blacksail, so on blacksail
> the recipe is missing and gnome-disk-utility, gnome-control-center,
> cryptsetup and others fail with "Nothing PROVIDES 'libpwquality'".
>
> AI-Generated: Uses Claude Code (Claude Opus 4.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
>  ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++
>  .../libpwquality/libpwquality_1.4.5.bb        | 39 ++++++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-=
setuptools-instead-of-distutils.patch
>  create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Make=
file.am-respect-PYTHONSITEDIR.patch
>  create mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.=
4.5.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index cc3f7cf064..225cd95604 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -368,6 +368,7 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
>      liblognorm \
>      libmodbus \
>      libplist \
> +    libpwquality \
>      libqb \
>      librelp \
>      ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", =
d)} \
> diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setupto=
ols-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/file=
s/0001-Use-setuptools-instead-of-distutils.patch
> new file mode 100644
> index 0000000000..7eaca66b5c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-ins=
tead-of-distutils.patch
> @@ -0,0 +1,78 @@
> +From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
> +Date: Fri, 31 Mar 2023 14:52:19 +0200
> +Subject: [PATCH] Use setuptools instead of distutils
> +
> +distutils is removed from Python 3.12+:
> +https://peps.python.org/pep-0632/
> +
> +Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/=
commit/7b5e0f0097faebdcc6a8b783237bbba7a983147a]
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
> +-# setuptools >=3D 60 changes the environment to use its bundled copy of=
 distutils
> +-# by default, not the Python-bundled one. To run the Python's standard =
library
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
> +       CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py=
 build --build-base py$(PYTHONREV)
> +
> + install-exec-local:
> +-      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py=
 build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
> ++      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py=
 build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${p=
refix}
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
> diff --git a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am=
-respect-PYTHONSITEDIR.patch b/meta-oe/recipes-extended/libpwquality/files/=
0002-Makefile.am-respect-PYTHONSITEDIR.patch
> new file mode 100644
> index 0000000000..cd59a6d887
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respec=
t-PYTHONSITEDIR.patch
> @@ -0,0 +1,26 @@
> +From edc51ba1b446913232cdf2945f485392bca72dc7 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 3 Aug 2015 13:43:14 +0800
> +Subject: [PATCH] Makefile.am: respect ${PYTHONSITEDIR}
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> +Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/=
commit/5192eab011ada47b0157f8d0524bf5b18bba3bd0]
> +
> + python/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/python/Makefile.am b/python/Makefile.am
> +index 6e51744..0a3bad5 100644
> +--- a/python/Makefile.am
> ++++ b/python/Makefile.am
> +@@ -14,7 +14,7 @@ all-local:
> +       CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py=
 build --build-base py$(PYTHONREV)
> +
> + install-exec-local:
> +-      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py=
 build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${p=
refix}
> ++      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py=
 build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${p=
refix} --install-lib=3D$(pythonsitedir)
> +
> + clean-local:
> +       rm -rf py$(PYTHONREV)
> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb =
b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> new file mode 100644
> index 0000000000..b7c673be52
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "Library for password quality checking and generating ra=
ndom passwords"
> +HOMEPAGE =3D "https://github.com/libpwquality/libpwquality"
> +SECTION =3D "devel/lib"
> +
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676=
fc2"
> +
> +DEPENDS =3D "cracklib"
> +
> +SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;=
protocol=3Dhttps \
> +    file://0001-Use-setuptools-instead-of-distutils.patch \
> +    file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
> +"
> +SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
> +
> +
> +inherit autotools-brokensep gettext
> +inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptoo=
ls3-base', '', d)}
> +
> +do_configure:prepend() {
> +    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
> +}
> +
> +export PYTHON_DIR
> +export BUILD_SYS
> +export HOST_SYS
> +
> +EXTRA_OECONF +=3D "--libdir=3D${libdir} \
> +                 --with-securedir=3D${base_libdir}/security \
> +"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)} python3"
> +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
> +PACKAGECONFIG[python3] =3D "--enable-python-bindings --with-python-rev=
=3D${PYTHON_BASEVERSION} --with-python-binary=3D${STAGING_BINDIR_NATIVE}/py=
thon3-native/python3 --with-pythonsitedir=3D${PYTHON_SITEPACKAGES_DIR},--di=
sable-python-bindings,python3-setuptools-native"
> +
> +FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
> +FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
> +FILES:${PN}-staticdev +=3D "${base_libdir}/security/pam_pwquality.a"
> +FILES:${PN}-dev +=3D "${base_libdir}/security/pam_pwquality.la"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130705): https://lists.openembedded.org/g/openembedde=
d-devel/message/130705
> Mute This Topic: https://lists.openembedded.org/mt/121676293/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

