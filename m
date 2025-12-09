Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9756AD3B980
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:04:33 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11240.1765296270336843247
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 08:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAhuy7ew;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63f9beb2730so4830411d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765296269; x=1765901069; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht4gt44jfplihBBTjAu7rNJeiIfrv7wGExkWrjv+GJc=;
        b=IAhuy7ewfgAnfXDM+AbvJBZytVkU9voVl7wuz1MamTXlsWVhEydZUv6ubmdCcktALZ
         IUN4olfAKm+w6PH1lhH7QbuxDFtFPXc+U87KnmAdQaiEUQ1Z7ZO77FXs3e5En3zJggSn
         Ctnt09dKfhhkjLZUtIGsBSt9T9aQRHxGOzKUvWt4+turmfVun9kJYTzS4Vp8hGtwWvos
         I9lV36u3uJj1nlbTHRISRHLGBWOMThBkLESoeSUgV3N275KoyNZQNbgQfEexbesAhEDZ
         OVnTgzKXog4Q2dRmyI5vnLrFbJZYomzWGvakvIDhkcXc9be/kIZ9wpbjpwL3NCv3vgJd
         9a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296269; x=1765901069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht4gt44jfplihBBTjAu7rNJeiIfrv7wGExkWrjv+GJc=;
        b=Dgj47Kg+2OlLFQ1NgMAdEcmHWwnjzIGV+6i26St4iNcCcnZncxeDMoXasmCbjWSaWr
         0xa32Tt8OPjmuD7xxD9OgjnHNVWpCQUr+hRd2JWLU2nt/CiBjaiW5IbyYBEC6Wjs/Y2w
         /jkvk7+NdDmLjVx5hLophK9IFMyivxweMrU1BwUe0dtyL5TLGkA14CaAQb+6s2qtlh9c
         XJDHvLVoNSdnmaqxYvlVJKCF6p6D1yrjaYzl79aXG2WlP0Key+pAnc0Oj/dXgWoRUzSU
         Dk/iiP7lnv8xn+3lXrc73EHPdwHcO2m8ScPSM8U1EvK6l9KTIoStCt/PBcOopKpLNX8n
         le5A==
X-Gm-Message-State: AOJu0YyvnuqTlVEQ5f5nuXKfmFGEJ7UyE6ty4quRiNeQSDtAtE0ryS2M
	HPcsWZOxejI7MkYg4xM7e9JwtiMhUk2trAP7lQgRAUtxsEa3gm+RC7vJx2T6Wue22RRwZfis7if
	lHTo5du+6KD6KIRjca4E4u/TUtB3D2DoS85cM1hWuPQ==
X-Gm-Gg: AY/fxX4weCcgZCBofKYdN7L6ZkA63yVgawyBab5mM6drfwPctntlOKfUJwWFVzC9G7w
	Md01N4s388BOTUgPWYGpr+Ifq+VDrMkSN8FODScnD5yp56IXhsMImt0VR5xRREysuEjRMw53TTj
	P+IhNZ+4mA2ykYMmcUD6B2nLLpvKb4gfqwgcqkYFwqJAOfItfpf6d8lm4B6WcxbdmQCmLJeTuYI
	pJbbGNoKeiofY24dlL/zbORl02bCOjDpne8+YFuFySKBXzQBNRH/0Hd4G1oYSBeNkvjTW0WTxaF
	0NyGQtI/etk1xOvDwsFfvqXVAy27v8vHlVyGZ8poj3HylBzFJGaFkXtWjS0ak9Qyy/jj1a91dps
	B/Y+7oAVwFxgxsayXbZzhSQ5NcTYvRASQqeuoFsCSRBFH
X-Google-Smtp-Source: AGHT+IHvjGY/7s2cD66YzVFC/itvJR7vJlDERGd7uTonziYZO36zuKgDrCa5mDGzsqCBmb39v2roaCqTmfUkHPwze/4=
X-Received: by 2002:a53:c049:0:20b0:644:28d2:a4a6 with SMTP id
 956f58d0204a3-6444e7b99dcmr8412765d50.47.1765296269121; Tue, 09 Dec 2025
 08:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20251209070234.22481-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251209070234.22481-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 08:04:02 -0800
X-Gm-Features: AQt7F2qLwBY8jpNWZPytTWGEgJUKsUYeTorHqls-FLurM5ME9CtkUaCUH8_N5Hs
Message-ID: <CAMKF1soysmR5Ms9G_Vuu2oCBgwBFvt-mHD1uLOEra7V-u5LBbA@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 3/3] python3-pyzstd: upgrade 0.18.0 -> 0.19.0
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000b5e2906458711c5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 16:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122465

--0000000000000b5e2906458711c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

its failing to configure
https://errors.yoctoproject.org/Errors/Details/891457/

On Mon, Dec 8, 2025 at 11:02=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> 1. Changelog
>   - The project has been completely refactored to use the Zstandard
> implementation from the standard library ([PEP-784](
> https://peps.python.org/pep-0784/))
>   - The refactor has some minor impact on public APIs, such as changing
> the exception raised on invalid input
>
> 2. Drop 0001-Bump-setuptools-dependency-from-74-to-89.patch as setuptools
> in requires was removed in pyproject.toml
>
> 3. HOMEPAGE has been changed to https://github.com/Rogdham/pyzstd.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...-setuptools-dependency-from-74-to-89.patch | 27 -------------------
>  ...std_0.18.0.bb =3D> python3-pyzstd_0.19.0.bb} |  9 ++++---
>  2 files changed, 5 insertions(+), 31 deletions(-)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-d=
ependency-from-74-to-89.patch
>  rename meta-python/recipes-devtools/python/{python3-pyzstd_0.18.0.bb =3D=
>
> python3-pyzstd_0.19.0.bb} (63%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-89.patch
> b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-89.patch
> deleted file mode 100644
> index f7b43b12a7..0000000000
> ---
> a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-89.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 9 Apr 2025 14:38:31 -0700
> -Subject: [PATCH] Bump setuptools dependency from 74 to 89
> -
> -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> -support beyond that which is needed for python 3.9 on windows. We
> -do not have this problem on Linux
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index dd885e4..5d4d511 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,6 +1,6 @@
> - [build-system]
> - # setuptools 64+ support --build-option
> - # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9
> under Windows
> --requires =3D ["setuptools>=3D64,<74"]
> -+requires =3D ["setuptools>=3D64,<89"]
> - backend-path =3D ["build_script"]
> - build-backend =3D "pyzstd_pep517"
> diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
> b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
> index 2aee987efa..b41746dbae 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Pyzstd module provides classes and functions for
> compressing and \
>  decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short=
 name)
> algorithm."
> -HOMEPAGE =3D "https://github.com/animalize/pyzstd"
> +HOMEPAGE =3D "https://github.com/Rogdham/pyzstd"
>  SECTION =3D "devel/python"
>
>  LICENSE =3D "BSD-3-Clause"
> @@ -8,10 +8,11 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974b9e"
>
>  PYPI_PACKAGE =3D "pyzstd"
>
> -SRC_URI +=3D "file://0001-Bump-setuptools-dependency-from-74-to-89.patch=
"
> -SRC_URI[sha256sum] =3D
> "81b6851ab1ca2e5f2c709e896a1362e3065a64f271f43db77fb7d5e4a78e9861"
> +SRC_URI[sha256sum] =3D
> "44e7b9be7b445aac742003ddee52ca31385d52dffb8c60adf633fad8e795f10d"
>
> -inherit pypi python_setuptools_build_meta ptest-python-pytest
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
> python_hatchling
> +
> +DEPENDS +=3D "python3-hatch-vcs-native"
>
>  # clang-16 with -flto segfaults on arm, therefore ignore flto for now
>  do_configure:append:arm:toolchain-clang() {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122401):
> https://lists.openembedded.org/g/openembedded-devel/message/122401
> Mute This Topic: https://lists.openembedded.org/mt/116690716/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000b5e2906458711c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">its failing to configure<div><a href=3D"https://errors.yoc=
toproject.org/Errors/Details/891457/">https://errors.yoctoproject.org/Error=
s/Details/891457/</a></div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 8, 2025 at 11:=
02=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu=
.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">1. Changelog=
<br>
=C2=A0 - The project has been completely refactored to use the Zstandard im=
plementation from the standard library ([PEP-784](<a href=3D"https://peps.p=
ython.org/pep-0784/" rel=3D"noreferrer" target=3D"_blank">https://peps.pyth=
on.org/pep-0784/</a>))<br>
=C2=A0 - The refactor has some minor impact on public APIs, such as changin=
g the exception raised on invalid input<br>
<br>
2. Drop 0001-Bump-setuptools-dependency-from-74-to-89.patch as setuptools i=
n requires was removed in pyproject.toml<br>
<br>
3. HOMEPAGE has been changed to <a href=3D"https://github.com/Rogdham/pyzst=
d" rel=3D"noreferrer" target=3D"_blank">https://github.com/Rogdham/pyzstd</=
a>.<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...-setuptools-dependency-from-74-to-89.patch | 27 ------------------=
-<br>
=C2=A0...<a href=3D"http://std_0.18.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">std_0.18.0.bb</a> =3D&gt; <a href=3D"http://python3-pyzstd_0.19.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.0.bb</a>} |=C2=A0 9=
 ++++---<br>
=C2=A02 files changed, 5 insertions(+), 31 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-pyzstd=
/0001-Bump-setuptools-dependency-from-74-to-89.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pyzstd_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.18=
.0.bb</a> =3D&gt; <a href=3D"http://python3-pyzstd_0.19.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pyzstd_0.19.0.bb</a>} (63%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-s=
etuptools-dependency-from-74-to-89.patch b/meta-python/recipes-devtools/pyt=
hon/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch<br>
deleted file mode 100644<br>
index f7b43b12a7..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptoo=
ls-dependency-from-74-to-89.patch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 9 Apr 2025 14:38:31 -0700<br>
-Subject: [PATCH] Bump setuptools dependency from 74 to 89<br>
-<br>
-Upstream sticks to 0.74 since setuptools have dropped msvc9compiler<br>
-support beyond that which is needed for python 3.9 on windows. We<br>
-do not have this problem on Linux<br>
-<br>
-Upstream-Status: Inappropriate [OE-specific]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- pyproject.toml | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/pyproject.toml b/pyproject.toml<br>
-index dd885e4..5d4d511 100644<br>
---- a/pyproject.toml<br>
-+++ b/pyproject.toml<br>
-@@ -1,6 +1,6 @@<br>
- [build-system]<br>
- # setuptools 64+ support --build-option<br>
- # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 un=
der Windows<br>
--requires =3D [&quot;setuptools&gt;=3D64,&lt;74&quot;]<br>
-+requires =3D [&quot;setuptools&gt;=3D64,&lt;89&quot;]<br>
- backend-path =3D [&quot;build_script&quot;]<br>
- build-backend =3D &quot;pyzstd_pep517&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyzstd_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.18.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
zstd_0.19.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.0.=
bb</a><br>
similarity index 63%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
yzstd_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.18.0=
.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyz=
std_0.19.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.0.b=
b</a><br>
index 2aee987efa..b41746dbae 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyzstd_=
0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.18.0.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyzstd_=
0.19.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.0.bb</a=
><br>
@@ -1,6 +1,6 @@<br>
=C2=A0DESCRIPTION =3D &quot;Pyzstd module provides classes and functions fo=
r compressing and \<br>
=C2=A0decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as sh=
ort name) algorithm.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/animalize/pyzstd" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/animalize/pyzstd</a>&quot;=
<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/Rogdham/pyzstd" rel=3D"no=
referrer" target=3D"_blank">https://github.com/Rogdham/pyzstd</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daedb5a267=
9cd1552fb61c181ef974b9e&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyzstd&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-Bump-setuptools-dependency-from-74-to-89.pa=
tch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;81b6851ab1ca2e5f2c709e896a1362e3065a64f271f43=
db77fb7d5e4a78e9861&quot;<br>
+SRC_URI[sha256sum] =3D &quot;44e7b9be7b445aac742003ddee52ca31385d52dffb8c6=
0adf633fad8e795f10d&quot;<br>
<br>
-inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
+inherit pypi python_setuptools_build_meta ptest-python-pytest python_hatch=
ling<br>
+<br>
+DEPENDS +=3D &quot;python3-hatch-vcs-native&quot;<br>
<br>
=C2=A0# clang-16 with -flto segfaults on arm, therefore ignore flto for now=
<br>
=C2=A0do_configure:append:arm:toolchain-clang() {<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122401): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122401" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122401</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116690716/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116690716/1997914</a><br>
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

--0000000000000b5e2906458711c5--

