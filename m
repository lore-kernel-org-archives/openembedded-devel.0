Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F77EC4725D
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:58:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.10002.1704887925382194030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0U9OXdd;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50ed808db11so675504e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 03:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704887923; x=1705492723; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYa+Rz5q2w2xDQmXztamSO/+wZ/6ktI/TpsWMqsltUA=;
        b=S0U9OXddGP1XTP503coYA/X+wrALfn8EMTeGK2aXaPYXqhhepxSHsWdiQcTkVielqi
         Zr6usGNAhhTADIxO92OG8vWBCka6nJNNY5JMU9dzdStY2MEK0jVL5w6AAatYcvYybAWN
         DYD+ogBdqFm1UrkDNFf4WIBT1P1Sf6F8GPjRiV5XwwHwzf2tERPKvs0yXM+eGVBFtUjo
         YSvKF7bqtNkANuHVrubQwkaphblZ8sjX9XVS84w7KllNQuyfDDXTnvjMWd1427sKsF4p
         mxLwYaHbjWYJdIrMz50jpfqz2UQnNqkvfLVESQoDn1E40eQ7m2TOOCph7871x4J41giP
         8umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887923; x=1705492723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYa+Rz5q2w2xDQmXztamSO/+wZ/6ktI/TpsWMqsltUA=;
        b=izq5vlMfKm/SaM9HGjUzMCMTZyUD5cvY/RWklRjIJmsk9hVupi48NLqYzh/vFAG0z0
         Ibj6vE4oYCCd+qzWwI1O7uSnxAGxQlqa8g3BauGiFn+zv9hGHyhhxCNdecCw8BPuYU16
         awhvVkNsPmNpoeLNKxLD62TiKcWG8X8qFUrQu7nXpx9gldhhx/gZA3b/iwa5PQ/v9bFO
         3j2FntSh+myJjJVl/d9jLLaibNCYDe4czubNb7xpAfOZz7rcQrquIt6XYQX80Yf18yv7
         i/vLOgf/dwsiGHr6I9gJR7OldFs+Awh3r7vOuPcCaRmAxa8LVh6f2PLxd4mNnU62orb2
         7Xaw==
X-Gm-Message-State: AOJu0YzLGwphucY/cjrEAHn0rHlsKOjHfT1DwDu8hAaUO59GOMh8t0bj
	l/VaCrMpxu+Bz7p9JRFbOvfuU8DKWFTPwUCh5Dw=
X-Google-Smtp-Source: AGHT+IGHsJQSMZddu+RvYK4Yh/RhV5QY6b32Sjif4AyDuQYjE/8R5EydjxM/X965xgoKudir+gkk8r7UgpfM9D7R0kw=
X-Received: by 2002:ac2:510f:0:b0:50e:2a39:9cfc with SMTP id
 q15-20020ac2510f000000b0050e2a399cfcmr337830lfb.48.1704887923125; Wed, 10 Jan
 2024 03:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20231231122329.405225-1-alex@linutronix.de> <20231231122329.405225-5-alex@linutronix.de>
 <CA+chaQck+iG8TbiY0Rx90JTFY3K371JTQ2RmUpwtPvQq9xb0oA@mail.gmail.com>
In-Reply-To: <CA+chaQck+iG8TbiY0Rx90JTFY3K371JTQ2RmUpwtPvQq9xb0oA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jan 2024 12:58:31 +0100
Message-ID: <CANNYZj9m=oQTj-sciagvdTy6xNW9y4i=-tEL1qrur_feN0Fkww@mail.gmail.com>
Subject: Re: [oe] [PATCH 05/23] libpwquality: backport a python 3.12
 compatibility patch
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 11:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108216

I guess this change needs to be rebased and restored on top of the
backported patch:

--      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@
setup.py build --build-base py$(PYTHONREV) install
--prefix=3D${DESTDIR}${prefix}
-+      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@
setup.py build --build-base py$(PYTHONREV) install
--prefix=3D${DESTDIR}${prefix} --install-lib=3D${DESTDIR}/${PYTHONSITEDIR}

Can you try that please?

Alex

On Wed, 10 Jan 2024 at 12:43, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> It doesn't respect libdir now, causing installed-vs-shipped e.g. in multi=
lib builds with libdir set to /usr/lib32:
>
> ERROR: QA Issue: lib32-libpwquality: Files/directories were installed but=
 not shipped in any package:
>   /usr/lib/python3.11/site-packages/pwquality.cpython-311-arm-linux-gnuea=
bi.so
>   /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info
>   /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/SOURC=
ES.txt
>   /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/PKG-I=
NFO
>   /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/depen=
dency_links.txt
>   /usr/lib/python3.11/site-packages/pwquality-1.4.5-py3.11.egg-info/top_l=
evel.txt
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> lib32-libpwquality: 6 installed and not shipped files. [installed-vs-ship=
ped]
>
> On Sun, Dec 31, 2023 at 1:23=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> This also allows dropping a previous patch.
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>  ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
>>  ...missing-python-include-dir-for-cross.patch | 43 ----------
>>  .../libpwquality/libpwquality_1.4.5.bb        |  6 +-
>>  3 files changed, 81 insertions(+), 46 deletions(-)
>>  create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use=
-setuptools-instead-of-distutils.patch
>>  delete mode 100644 meta-oe/recipes-extended/libpwquality/files/add-miss=
ing-python-include-dir-for-cross.patch
>>
>> diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setupt=
ools-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/fil=
es/0001-Use-setuptools-instead-of-distutils.patch
>> new file mode 100644
>> index 000000000..7eaca66b5
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-in=
stead-of-distutils.patch
>> @@ -0,0 +1,78 @@
>> +From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
>> +Date: Fri, 31 Mar 2023 14:52:19 +0200
>> +Subject: [PATCH] Use setuptools instead of distutils
>> +
>> +distutils is removed from Python 3.12+:
>> +https://peps.python.org/pep-0632/
>> +
>> +Upstream-Status: Backport [https://github.com/libpwquality/libpwquality=
/commit/7b5e0f0097faebdcc6a8b783237bbba7a983147a]
>> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> +---
>> + libpwquality.spec.in | 11 ++---------
>> + python/Makefile.am   |  2 +-
>> + python/setup.py.in   |  6 +++---
>> + 3 files changed, 6 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/libpwquality.spec.in b/libpwquality.spec.in
>> +index 70a6f53..0809126 100644
>> +--- a/libpwquality.spec.in
>> ++++ b/libpwquality.spec.in
>> +@@ -33,9 +33,11 @@ BuildRequires: gettext
>> + BuildRequires: pam-devel
>> + %if %{with python2}
>> + BuildRequires: python2-devel
>> ++BuildRequires: python2-setuptools
>> + %endif
>> + %if %{with python3}
>> + BuildRequires: python3-devel
>> ++BuildRequires: python3-setuptools
>> + %endif
>> +
>> + URL: https://github.com/libpwquality/libpwquality/
>> +@@ -103,15 +105,6 @@ cp -a . %{py3dir}
>> + pushd %{py3dir}
>> + %endif
>> + %if %{with python3}
>> +-# setuptools >=3D 60 changes the environment to use its bundled copy o=
f distutils
>> +-# by default, not the Python-bundled one. To run the Python's standard=
 library
>> +-# distutils, the environment variable must be set.
>> +-# Although technically setuptools is not needed for this package, if i=
t's
>> +-# pulled by another package, it changes the environment and consequent=
ly,
>> +-# the build fails. This was reported in:
>> +-# https://github.com/pypa/setuptools/issues/3143
>> +-export SETUPTOOLS_USE_DISTUTILS=3Dstdlib
>> +-
>> + %configure \
>> +       --with-securedir=3D%{_moduledir} \
>> +       --with-pythonsitedir=3D%{python3_sitearch} \
>> +diff --git a/python/Makefile.am b/python/Makefile.am
>> +index 1d00c0c..6e51744 100644
>> +--- a/python/Makefile.am
>> ++++ b/python/Makefile.am
>> +@@ -14,7 +14,7 @@ all-local:
>> +       CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.p=
y build --build-base py$(PYTHONREV)
>> +
>> + install-exec-local:
>> +-      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.p=
y build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
>> ++      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.p=
y build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${=
prefix}
>> +
>> + clean-local:
>> +       rm -rf py$(PYTHONREV)
>> +diff --git a/python/setup.py.in b/python/setup.py.in
>> +index a741b91..f934c50 100755
>> +--- a/python/setup.py.in
>> ++++ b/python/setup.py.in
>> +@@ -6,9 +6,9 @@
>> +
>> + import os
>> +
>> +-from distutils.core import setup, Extension
>> +-from distutils.command.build_ext import build_ext as _build_ext
>> +-from distutils.command.sdist import sdist as _sdist
>> ++from setuptools import setup, Extension
>> ++from setuptools.command.build_ext import build_ext as _build_ext
>> ++from setuptools.command.sdist import sdist as _sdist
>> +
>> + def genconstants(headerfile, outputfile):
>> +     hf =3D open(headerfile, 'r')
>> diff --git a/meta-oe/recipes-extended/libpwquality/files/add-missing-pyt=
hon-include-dir-for-cross.patch b/meta-oe/recipes-extended/libpwquality/fil=
es/add-missing-python-include-dir-for-cross.patch
>> deleted file mode 100644
>> index 636b29407..000000000
>> --- a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-inc=
lude-dir-for-cross.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From 1ea09e09ab2387c326bb7170835361ece6e25477 Mon Sep 17 00:00:00 2001
>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>> -Date: Mon, 3 Aug 2015 13:43:14 +0800
>> -Subject: [PATCH] setup.py.in: add missing python include dir for cross
>> - compiling
>> -
>> -Upstream-Status: Inappropriate [oe-core specific]
>> -
>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ----
>> - python/Makefile.am | 2 +-
>> - python/setup.py.in | 3 ++-
>> - 2 files changed, 3 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/python/Makefile.am b/python/Makefile.am
>> -index 1d00c0c..52816b2 100644
>> ---- a/python/Makefile.am
>> -+++ b/python/Makefile.am
>> -@@ -14,7 +14,7 @@ all-local:
>> -       CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.p=
y build --build-base py$(PYTHONREV)
>> -
>> - install-exec-local:
>> --      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.p=
y build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
>> -+      CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.p=
y build --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix} =
--install-lib=3D${DESTDIR}/${PYTHONSITEDIR}
>> -
>> - clean-local:
>> -       rm -rf py$(PYTHONREV)
>> -diff --git a/python/setup.py.in b/python/setup.py.in
>> -index a741b91..6759a95 100755
>> ---- a/python/setup.py.in
>> -+++ b/python/setup.py.in
>> -@@ -33,7 +33,7 @@ class sdist(_sdist):
>> -
>> - pwqmodule =3D Extension('pwquality',
>> -             sources =3D ['pwquality.c'],
>> --            include_dirs =3D ['../src'],
>> -+            include_dirs =3D ['../src', os.path.join(os.environ['STAGI=
NG_INCDIR'], os.environ['PYTHON_DIR'])],
>> -             library_dirs =3D ['../src/.libs'],
>> -             libraries =3D ['pwquality'])
>> -
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb=
 b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
>> index 5287430c4..91afedcb6 100644
>> --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
>> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
>> @@ -5,11 +5,11 @@ SECTION =3D "devel/lib"
>>  LICENSE =3D "GPL-2.0-or-later"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde67=
6fc2"
>>
>> -DEPENDS =3D "cracklib"
>> +DEPENDS =3D "cracklib python3-setuptools-native"
>>
>>  SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster=
;protocol=3Dhttps \
>> -           file://add-missing-python-include-dir-for-cross.patch \
>> -"
>> +           file://0001-Use-setuptools-instead-of-distutils.patch \
>> +           "
>>  SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
>>
>>  S =3D "${WORKDIR}/git"
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107956): https://lists.openembedded.org/g/openembedd=
ed-devel/message/107956
>> Mute This Topic: https://lists.openembedded.org/mt/103445561/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

