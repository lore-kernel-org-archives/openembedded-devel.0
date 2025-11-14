Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67577CDE006
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 07:01:47 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12491.1763103702553804557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 23:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FC45lgO0;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d6014810fso13637537b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 23:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763103702; x=1763708502; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AIH6l4qmjh6s8taaOlpswZfUtBpxux0WtBqq7YYH/MI=;
        b=FC45lgO0SWRnozahdswyBehBIRAzVMfrnrxuMRDZSrwTQSipIbnIjD3/QcKsJ/GgyT
         DHsoL3Pnaa88zgwFxFEPsZAnuh9QhUr8FGa/RfX+cqf34wwpyzAbev/mKOP2ddkA3BHW
         Xfzfd44m3/vi6f0ugapo16SWwBzcDj1RII9LumIueevks/9qFX6f5WUBQliVNNVXyWWO
         ZE2u7OyAq7+S3YgbrqsptyV3OppdJyoPz2H1eIJ2Bi4myAWGiaifglP1P6hWuglxax1l
         0DDjKMXm3qPDgQljz3MHuPESO8PHNfJJs8DL3ncDtaXp4WAwiKBMAvWFNVJTwFyJ9xnm
         a8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763103702; x=1763708502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIH6l4qmjh6s8taaOlpswZfUtBpxux0WtBqq7YYH/MI=;
        b=Lmm8Ok2BMIQ1G1M+fwhpErKEES2cdb7axhQxUq67dduf/FlizWomk3o+tQHs2gDtCZ
         UQw+TBE2arGXQLRXVjslS2UFV3bVs0Pz1dDSgK0sVRcRc0tvITru+O08JjLy4LQgRJHt
         lOV4B+xtnFpZig+gqjvEN0nxZzrTv3XI6Eip1k4rXGuAWWRpHckxrjkrZuZL1FHsqdCn
         2hZt/9XDfoLIsoh7/1bzmTVOG+Ub6k6g4MRGk82MIKysgThPf0CY3j3OrMjL9cJXq1XJ
         ahTiREG1Bv+4eZZLXxSuUr1FEul3gggyZPs3dcTGg1yIUQ+/KUgoR+h4kaHgyYMMBaC8
         D+bA==
X-Gm-Message-State: AOJu0Yw/w0HTQYDHmWRhwEImq6HSGLPWk0pkzuCTeTZU/kb0UoePSTi2
	lpKTjQlift/ZtG5IezQa1NYIaPpdEWHNkpOhF2lmyU7nL0hWth42hRakOhyaYtPEjmKmKafPlgs
	iq1ax7sEWC5sPhmqGY7EHm8J7z7veXs4=
X-Gm-Gg: ASbGncssSs13liwj98KYfXiSVoOtmWS+mspOgFoudztstYFB5WPSFH72OiCYw/yk4m6
	/9YO0FZh06lMJg6pkLu1GsI5HU4tLF354gBN5Mp6Vk9zaBClodeoLsZcr7TOK0emQItZQU5PJAM
	sD5O7O+wjLJg33eBql/bg/STYoK+/7d9/mxXpgpvjvq9ROFwtxlXdw0zAZlHNffR3eIpl5BKmgZ
	qtxqkJb2VAfAHIRAp9/YhrcqD908gqkfp9ulf93A2/9zfk1JCIfCKWM35UE8R+DBgDJYOm3iM1+
	HkDc8wYXwQ7jv7vdKxGFXjyn3IkA4qvdrL9ebLiE589yVwdIy18jMm8H7jtsf1igDj06OV9JdUI
	dWhrWA74+2p6jIrPJ3kMDUfbXs6jusXpZUdQ=
X-Google-Smtp-Source: AGHT+IFcGDzY83MlSNj61mPlAnKxEaun/z3ZsM2MD8/q+a6f8RtJfa8L/EesSpx4xpGRA7vNN50Ews0S6F036EqfgUg=
X-Received: by 2002:a05:690c:7083:b0:787:ca87:595a with SMTP id
 00721157ae682-78929c03c75mr24286157b3.0.1763103701527; Thu, 13 Nov 2025
 23:01:41 -0800 (PST)
MIME-Version: 1.0
References: <20251113205431.3489223-1-martin.jansa@gmail.com>
In-Reply-To: <20251113205431.3489223-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 23:01:15 -0800
X-Gm-Features: AWmQ_bmwiqRjBD-bE5nJQIGnR8_2003pUGQp5sBvToFmZGe9nvaNum5ATWNDb_M
Message-ID: <CAMKF1sqxLw++WLmRX3gDK9T2Rh2W1xE_0myto_0OYOiEq-Y9yg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-checksec-py,
 python3-pylddwrap, python3-icontract: add recipes
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d4f1a70643889149"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121684

--000000000000d4f1a70643889149
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

python3-lief does not build for x86(32bit) so its using
COMPATIBLE_HOST:x86 =3D "null"

We will need same for this recipe as well as it depends on python3-lief

On Thu, Nov 13, 2025 at 12:54=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> they were sent for meta-security long time ago in 2021:
> https://lists.yoctoproject.org/g/yocto/message/54470
> but never merged there, now there are lief, docopt, rich, asttokens
> already in meta-python and checksec-py depends on lief version, e.g.
>
> https://github.com/Wenzel/checksec.py/commit/976d530867756d1393189708aa98=
308b07b1f3b2
> is needed to fixcompatibility with newer lief currently in meta-python
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...1-main-Add-option-to-ignore-symlinks.patch | 81 +++++++++++++++++++
>  .../python/python3-checksec-py_0.7.5.bb       | 23 ++++++
>  .../python/python3-icontract_2.6.6.bb         | 14 ++++
>  .../python/python3-pylddwrap_1.2.2.bb         | 26 ++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-opt=
ion-to-ignore-symlinks.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-checksec-py_0.7.5.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-icontract_2.6.6.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pylddwrap_1.2.2.bb
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-o=
ption-to-ignore-symlinks.patch
> b/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-o=
ption-to-ignore-symlinks.patch
> new file mode 100644
> index 0000000000..3a99ba33e3
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-o=
ption-to-ignore-symlinks.patch
> @@ -0,0 +1,81 @@
> +From b540967b87394d855c26375ac5a9a7265f265053 Mon Sep 17 00:00:00 2001
> +From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +Date: Fri, 2 Jul 2021 14:42:25 +0200
> +Subject: [PATCH] main: Add option to ignore symlinks
> +
> +When analyzing a complete rootfs (which might not be the rootfs of the
> +analyzing system) symlinks within that rootfs might be broken. In
> +particular absolute symlinks. However, if by chance such a symlink
> +currently points to a valid binary in your system, this binary pointed
> +to is analyzed. This commit adds the possibility to ignore symlinks to
> +files (symlinks to dirs are already ignored by default). This allows to
> +solve the issue described above, and if the whole rootfs is analyzed
> +there shouldn't be a loss of information (because all the binaries will
> +be analyzed anyway). Additionally, this also saves some time when
> +performing the analysis.
> +
> +Upstream-Status: Submitted [
> https://github.com/Wenzel/checksec.py/pull/106]
> +---
> + checksec/__main__.py | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/checksec/__main__.py b/checksec/__main__.py
> +index a14862f..931d850 100644
> +--- a/checksec/__main__.py
> ++++ b/checksec/__main__.py
> +@@ -8,6 +8,7 @@ Options:
> +     -w WORKERS --workers=3DWORKERS    Specify the number of process poo=
l
> workers [default: 4]
> +     -j --json                       Display results as JSON
> +     -s LIBC --set-libc=3DLIBC         Specify LIBC library to use to ch=
eck
> for fortify scores (ELF)
> ++    -i --ignore-symlinks            Ignore symlinks to files
> +     -d --debug                      Enable debug output
> +     -h --help                       Display this message
> + """
> +@@ -27,18 +28,18 @@ from .pe import PEChecksecData, PESecurity, is_pe
> + from .utils import lief_set_logging
> +
> +
> +-def walk_filepath_list(filepath_list: List[Path], recursive: bool =3D
> False) -> Iterator[Path]:
> ++def walk_filepath_list(filepath_list: List[Path], recursive: bool =3D
> False, ignore_symlinks: bool =3D False) -> Iterator[Path]:
> +     for path in filepath_list:
> +         if path.is_dir() and not path.is_symlink():
> +             try:
> +                 if recursive:
> +                     for f in os.scandir(path):
> +-                        yield from walk_filepath_list([Path(f)],
> recursive)
> ++                        yield from walk_filepath_list([Path(f)],
> recursive, ignore_symlinks)
> +                 else:
> +                     yield from (Path(f) for f in os.scandir(path))
> +             except OSError:
> +                 continue
> +-        elif path.is_file():
> ++        elif path.is_file() and (not ignore_symlinks or not
> path.is_symlink()):
> +             yield path
> +
> +
> +@@ -75,6 +76,7 @@ def main(args):
> +     json =3D args["--json"]
> +     recursive =3D args["--recursive"]
> +     libc_path =3D args["--set-libc"]
> ++    ignore_symlinks =3D args["--ignore-symlinks"]
> +
> +     # logging
> +     formatter =3D "%(asctime)s %(levelname)s:%(name)s:%(message)s"
> +@@ -110,7 +112,7 @@ def main(args):
> +             # we need to consume the iterator once to get the total
> +             # for the progress bar
> +             check_output.enumerating_tasks_start()
> +-            count =3D sum(1 for i in walk_filepath_list(filepath_list,
> recursive))
> ++            count =3D sum(1 for i in walk_filepath_list(filepath_list,
> recursive, ignore_symlinks))
> +             check_output.enumerating_tasks_stop(count)
> +             with ProcessPoolExecutor(
> +                 max_workers=3Dworkers, initializer=3Dworker_initializer=
,
> initargs=3D(libc_path,)
> +@@ -119,7 +121,7 @@ def main(args):
> +                     check_output.processing_tasks_start()
> +                     future_to_checksec =3D {
> +                         pool.submit(checksec_file, filepath): filepath
> +-                        for filepath in
> walk_filepath_list(filepath_list, recursive)
> ++                        for filepath in
> walk_filepath_list(filepath_list, recursive, ignore_symlinks)
> +                     }
> +                     for future in as_completed(future_to_checksec):
> +                         filepath =3D future_to_checksec[future]
> diff --git a/meta-python/recipes-devtools/python/
> python3-checksec-py_0.7.5.bb b/meta-python/recipes-devtools/python/
> python3-checksec-py_0.7.5.bb
> new file mode 100644
> index 0000000000..82ef304849
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Recipe to embedded the Python PiP Package checksec_py"
> +HOMEPAGE =3D "https://pypi.org/project/checksec_py"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
> +
> +PR =3D "r0"
> +
> +inherit pypi python_poetry_core
> +PYPI_PACKAGE =3D "checksec_py"
> +SRC_URI[sha256sum] =3D
> "892854f95d17a76d8f45a5c0cc597b9f1bebced3fffb9c7205d0baaf5eace886"
> +
> +SRC_URI +=3D " \
> +    file://0001-main-Add-option-to-ignore-symlinks.patch \
> +"
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-docopt \
> +    python3-lief \
> +    python3-pylddwrap \
> +    python3-rich \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/
> python3-icontract_2.6.6.bb b/meta-python/recipes-devtools/python/
> python3-icontract_2.6.6.bb
> new file mode 100644
> index 0000000000..5075a1a6a1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Recipe to embedded the Python PiP Package icontract"
> +HOMEPAGE =3D "https://pypi.org/project/icontract"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D1d4a9b1f6b84bedf7a38843931e0dd57"
> +
> +PR =3D "r0"
> +
> +inherit pypi setuptools3
> +PYPI_PACKAGE =3D "icontract"
> +SRC_URI[sha256sum] =3D
> "c1fd55c7709ef18a2ee64313fe863be2668b53060828fcca3525051160c92691"
> +
> +RDEPENDS:${PN} +=3D "python3-asttokens"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pylddwrap_1.2.2.bb b/meta-python/recipes-devtools/python/
> python3-pylddwrap_1.2.2.bb
> new file mode 100644
> index 0000000000..045ccb9f1e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Recipe to embedded the Python PiP Package pylddwrap"
> +HOMEPAGE =3D "https://pypi.org/project/pylddwrap"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48fd6c978d39a38b3a04f45a1456d=
0fa"
> +
> +inherit pypi setuptools3
> +PYPI_PACKAGE =3D "pylddwrap"
> +SRC_URI[sha256sum] =3D
> "a70437fea7bca647c0e98161e1006ef49970267999c571b499760f1c43c6ba10"
> +
> +PR =3D "r0"
> +
> +RDEPENDS:${PN} +=3D "python3-icontract"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +do_install:append() {
> +    # similarly to
> https://gitlab.com/akuster/meta-security/-/commit/0fd8e0f8cae612010bafecb=
ff77ed9bb6f647a2d#4e154e295e639fd6c298ca644c75291eb99e0a57_0_16
> +    # but delete it from prefix and delete requirements.txt as well.
> +    # ERROR: QA Issue: python3-pylddwrap: Files/directories were
> installed but not shipped in any package:
> +    # /usr/README.rst
> +    # /usr/requirements.txt
> +    # /usr/LICENSE
> +    # Please set FILES such that these items are packaged. Alternatively
> if they are unneeded, avoid installing them or delete them within
> do_install.
> +    # python3-pylddwrap: 3 installed and not shipped files.
> [installed-vs-shipped]
> +    rm -f ${D}${prefix}/README.rst ${D}${prefix}/requirements.txt
> ${D}${prefix}/LICENSE
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121658):
> https://lists.openembedded.org/g/openembedded-devel/message/121658
> Mute This Topic: https://lists.openembedded.org/mt/116281662/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d4f1a70643889149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">python3-lief does not build for x86(32bit) so its using<di=
v>COMPATIBLE_HOST:x86 =3D &quot;null&quot;<br></div><div><br></div><div>We =
will need same for this recipe as well as it depends on python3-lief</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 13, 2025 at 12:54=E2=80=AFPM Martin Jansa =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Martin Jansa &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<br>
they were sent for meta-security long time ago in 2021:<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto/message/54470" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/message/5=
4470</a><br>
but never merged there, now there are lief, docopt, rich, asttokens<br>
already in meta-python and checksec-py depends on lief version, e.g.<br>
<a href=3D"https://github.com/Wenzel/checksec.py/commit/976d530867756d13931=
89708aa98308b07b1f3b2" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/Wenzel/checksec.py/commit/976d530867756d1393189708aa98308b07b1f3b2</a><=
br>
is needed to fixcompatibility with newer lief currently in meta-python<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0...1-main-Add-option-to-ignore-symlinks.patch | 81 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-checksec-py_0.7.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-checksec-py_0.7.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 23 ++++++<br>
=C2=A0.../python/<a href=3D"http://python3-icontract_2.6.6.bb" rel=3D"noref=
errer" target=3D"_blank">python3-icontract_2.6.6.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 14 ++++<br>
=C2=A0.../python/<a href=3D"http://python3-pylddwrap_1.2.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pylddwrap_1.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 26 ++++++<br>
=C2=A04 files changed, 144 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-checks=
ec-py/0001-main-Add-option-to-ignore-symlinks.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-checksec-py_0.7.5.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-checksec-py_0.7.5.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-icontract_2.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-icontract_2.6.6.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pylddwrap_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-pylddwrap_1.2.2.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-checksec-py/0001-m=
ain-Add-option-to-ignore-symlinks.patch b/meta-python/recipes-devtools/pyth=
on/python3-checksec-py/0001-main-Add-option-to-ignore-symlinks.patch<br>
new file mode 100644<br>
index 0000000000..3a99ba33e3<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add=
-option-to-ignore-symlinks.patch<br>
@@ -0,0 +1,81 @@<br>
+From b540967b87394d855c26375ac5a9a7265f265053 Mon Sep 17 00:00:00 2001<br>
+From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank">Maximilian.Blenk@bmw.de</a>&gt;<br>
+Date: Fri, 2 Jul 2021 14:42:25 +0200<br>
+Subject: [PATCH] main: Add option to ignore symlinks<br>
+<br>
+When analyzing a complete rootfs (which might not be the rootfs of the<br>
+analyzing system) symlinks within that rootfs might be broken. In<br>
+particular absolute symlinks. However, if by chance such a symlink<br>
+currently points to a valid binary in your system, this binary pointed<br>
+to is analyzed. This commit adds the possibility to ignore symlinks to<br>
+files (symlinks to dirs are already ignored by default). This allows to<br=
>
+solve the issue described above, and if the whole rootfs is analyzed<br>
+there shouldn&#39;t be a loss of information (because all the binaries wil=
l<br>
+be analyzed anyway). Additionally, this also saves some time when<br>
+performing the analysis.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/Wenzel/checksec.=
py/pull/106" rel=3D"noreferrer" target=3D"_blank">https://github.com/Wenzel=
/checksec.py/pull/106</a>]<br>
+---<br>
+ checksec/__main__.py | 12 +++++++-----<br>
+ 1 file changed, 7 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/checksec/__main__.py b/checksec/__main__.py<br>
+index a14862f..931d850 100644<br>
+--- a/checksec/__main__.py<br>
++++ b/checksec/__main__.py<br>
+@@ -8,6 +8,7 @@ Options:<br>
+=C2=A0 =C2=A0 =C2=A0-w WORKERS --workers=3DWORKERS=C2=A0 =C2=A0 Specify th=
e number of process pool workers [default: 4]<br>
+=C2=A0 =C2=A0 =C2=A0-j --json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Display results as JSON<br>
+=C2=A0 =C2=A0 =C2=A0-s LIBC --set-libc=3DLIBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Specify LIBC library to use to check for fortify scores (ELF)<br>
++=C2=A0 =C2=A0 -i --ignore-symlinks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Ignore symlinks to files<br>
+=C2=A0 =C2=A0 =C2=A0-d --debug=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable debug output<br>
+=C2=A0 =C2=A0 =C2=A0-h --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Display this message<br>
+ &quot;&quot;&quot;<br>
+@@ -27,18 +28,18 @@ from .pe import PEChecksecData, PESecurity, is_pe<br>
+ from .utils import lief_set_logging<br>
+ <br>
+ <br>
+-def walk_filepath_list(filepath_list: List[Path], recursive: bool =3D Fal=
se) -&gt; Iterator[Path]:<br>
++def walk_filepath_list(filepath_list: List[Path], recursive: bool =3D Fal=
se, ignore_symlinks: bool =3D False) -&gt; Iterator[Path]:<br>
+=C2=A0 =C2=A0 =C2=A0for path in filepath_list:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path.is_dir() and not path.is_symlink=
():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if recursive=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for f in os.scandir(path):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 yield from walk_filepath_list([Path(f)], recursive)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 yield from walk_filepath_list([Path(f)], recursive, ignore_symli=
nks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0yield from (Path(f) for f in os.scandir(path))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif path.is_file():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif path.is_file() and (not ignore_symlinks =
or not path.is_symlink()):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield path<br>
+ <br>
+ <br>
+@@ -75,6 +76,7 @@ def main(args):<br>
+=C2=A0 =C2=A0 =C2=A0json =3D args[&quot;--json&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0recursive =3D args[&quot;--recursive&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0libc_path =3D args[&quot;--set-libc&quot;]<br>
++=C2=A0 =C2=A0 ignore_symlinks =3D args[&quot;--ignore-symlinks&quot;]<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0# logging<br>
+=C2=A0 =C2=A0 =C2=A0formatter =3D &quot;%(asctime)s %(levelname)s:%(name)s=
:%(message)s&quot;<br>
+@@ -110,7 +112,7 @@ def main(args):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# we need to consume the i=
terator once to get the total<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# for the progress bar<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_output.enumerating_t=
asks_start()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D sum(1 for i in walk_f=
ilepath_list(filepath_list, recursive))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D sum(1 for i in walk_f=
ilepath_list(filepath_list, recursive, ignore_symlinks))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_output.enumerating_t=
asks_stop(count)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with ProcessPoolExecutor(<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_workers=
=3Dworkers, initializer=3Dworker_initializer, initargs=3D(libc_path,)<br>
+@@ -119,7 +121,7 @@ def main(args):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0check_output.processing_tasks_start()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0future_to_checksec =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pool.submit(checksec_file, filepath): filepath<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for filepath in walk_filepath_list(filepath_list, recursive)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for filepath in walk_filepath_list(filepath_list, recursive, ign=
ore_symlinks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for future in as_completed(future_to_checksec):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0filepath =3D future_to_checksec[future]<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
checksec-py_0.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-checksec=
-py_0.7.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-checksec-py_0.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-ch=
ecksec-py_0.7.5.bb</a><br>
new file mode 100644<br>
index 0000000000..82ef304849<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-checkse=
c-py_0.7.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-checksec-py_0.7=
.5.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Recipe to embedded the Python PiP Package checksec_py&qu=
ot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/checksec_py" rel=3D=
"noreferrer" target=3D"_blank">https://pypi.org/project/checksec_py</a>&quo=
t;<br>
+LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e=
440464&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+inherit pypi python_poetry_core<br>
+PYPI_PACKAGE =3D &quot;checksec_py&quot;<br>
+SRC_URI[sha256sum] =3D &quot;892854f95d17a76d8f45a5c0cc597b9f1bebced3fffb9=
c7205d0baaf5eace886&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-main-Add-option-to-ignore-symlinks.patch \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 python3-docopt \<br>
+=C2=A0 =C2=A0 python3-lief \<br>
+=C2=A0 =C2=A0 python3-pylddwrap \<br>
+=C2=A0 =C2=A0 python3-rich \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
icontract_2.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-icontract_=
2.6.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-icontract_2.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-icontrac=
t_2.6.6.bb</a><br>
new file mode 100644<br>
index 0000000000..5075a1a6a1<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-icontra=
ct_2.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-icontract_2.6.6.b=
b</a><br>
@@ -0,0 +1,14 @@<br>
+SUMMARY =3D &quot;Recipe to embedded the Python PiP Package icontract&quot=
;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/icontract" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.org/project/icontract</a>&quot;<b=
r>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D1d4a9b1f6b84bedf7a3884=
3931e0dd57&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+PYPI_PACKAGE =3D &quot;icontract&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c1fd55c7709ef18a2ee64313fe863be2668b53060828f=
cca3525051160c92691&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;python3-asttokens&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pylddwrap_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylddwrap_=
1.2.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pylddwrap_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylddwra=
p_1.2.2.bb</a><br>
new file mode 100644<br>
index 0000000000..045ccb9f1e<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pylddwr=
ap_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pylddwrap_1.2.2.b=
b</a><br>
@@ -0,0 +1,26 @@<br>
+SUMMARY =3D &quot;Recipe to embedded the Python PiP Package pylddwrap&quot=
;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/pylddwrap" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.org/project/pylddwrap</a>&quot;<b=
r>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D48fd6c978d39a38b3a04f45a14=
56d0fa&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+PYPI_PACKAGE =3D &quot;pylddwrap&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a70437fea7bca647c0e98161e1006ef49970267999c57=
1b499760f1c43c6ba10&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;python3-icontract&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 # similarly to <a href=3D"https://gitlab.com/akuster/meta-se=
curity/-/commit/0fd8e0f8cae612010bafecbff77ed9bb6f647a2d#4e154e295e639fd6c2=
98ca644c75291eb99e0a57_0_16" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/akuster/meta-security/-/commit/0fd8e0f8cae612010bafecbff77ed9bb6f=
647a2d#4e154e295e639fd6c298ca644c75291eb99e0a57_0_16</a><br>
+=C2=A0 =C2=A0 # but delete it from prefix and delete requirements.txt as w=
ell.<br>
+=C2=A0 =C2=A0 # ERROR: QA Issue: python3-pylddwrap: Files/directories were=
 installed but not shipped in any package:<br>
+=C2=A0 =C2=A0 # /usr/README.rst<br>
+=C2=A0 =C2=A0 # /usr/requirements.txt<br>
+=C2=A0 =C2=A0 # /usr/LICENSE<br>
+=C2=A0 =C2=A0 # Please set FILES such that these items are packaged. Alter=
natively if they are unneeded, avoid installing them or delete them within =
do_install.<br>
+=C2=A0 =C2=A0 # python3-pylddwrap: 3 installed and not shipped files. [ins=
talled-vs-shipped]<br>
+=C2=A0 =C2=A0 rm -f ${D}${prefix}/README.rst ${D}${prefix}/requirements.tx=
t ${D}${prefix}/LICENSE<br>
+}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121658): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121658" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121658</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116281662/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116281662/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d4f1a70643889149--

