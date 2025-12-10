Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3A4D3C526
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 03:55:59 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6270.1765338950627099640
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 19:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gv9Yel8G;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78c4d112cd8so30027487b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 19:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765338950; x=1765943750; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VY110/ABdSV6znAVKQq/GuMew4mP3s1EJTaxr3hDjvw=;
        b=Gv9Yel8GyprrCNnYogRnIxmkrvQ5Bs68cPDnTl2vkKO6wnkXVYOKRjEJX55e7K765o
         iTXNYl2sr6K+GokyHPijut7vMEW1H1KjYLSPC2gLEVsQ/dtfR7K5jrvALowZtkDe0pNm
         rKjMbNnPlGbCr7eTr98W8MJAo1pSBLVnNtHq+icIf11f17BaPMA6jF11xDPNC+JPsMW+
         k6WqCoOTH0W/cyM9OV/STUUE+q481jDe7LcHAzJuCkRmR/UPDb2X+dg7WYcWJGlUsd1Y
         2zIy2FDMdj/eONaBpU7izjgF25sZjAjUbvPc/F9UD0ENJs1E1Gbu4cNEELTmTPR0y2l+
         s1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765338950; x=1765943750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY110/ABdSV6znAVKQq/GuMew4mP3s1EJTaxr3hDjvw=;
        b=LWecTeyoM37INm+x51SFPug2UAXCUKC72zeLVNTOBL2o0gUV/piLPiK00xcAgHINC1
         WMuqcf0bE/VOh98MdDCY2sp1ErGbL23coPlCkZet6p5mu55v5aXMOw0fCni1x45CBHY7
         LpDnTEI3iPAq0OXqwtFUysQbL/lOyyKi4NV0ZwxHIAW1rJx+zWDHxs8KisJv3wvaM3Ph
         hQL+/TbSbPW9BniFoyW9HAYrsYdj6MwPtZA5IageR789mnjKbiHG8Yyr4fKTHkACK1QK
         muZJdvPm4OBp5pajdXuI5oHFQgO1mANMhN7w5A3UiGPfNZDGa9vrp5S2YLVKLoEuXEXk
         zBDg==
X-Gm-Message-State: AOJu0Yx8PlbHrSRllvPg8Sg56biB2hzRXwsnu8KGITa3dLGiKTYt973H
	uEitUeT/Pzh8P07U9WDPmbye/fXk27Q91PjJGaO20dlB58MWyG5QZvuQkGOkbFrh9FXcc0DyKZQ
	ERW4+1eHJLJtGyEPqXZw2bC/0V2Ckkqo=
X-Gm-Gg: AY/fxX5l1Ww14/ksdg+jWRhCZzBzXNNiv3VMJjPGlplwLM/En0jn0sw9kvjvsRhr5Re
	IRBqVujhcDwBkbdtkj6366NyvR4NV/o/pM3Bx5TyJO04C5XAHfW54KfrBygwik/CaEUbUu/urIG
	9eNcumhUCGNHdh9nTJrDQ35h/su/cck3+FDKt/CoBrTiaGjJFw1tGFzNUGyNl3ea8D1LbJTCaER
	0AfZTQQ6DJw/1exuLvrIyKnCb1EI8it0ms4ZeGGEUfedUV3du3sMRXiaZmBvGTYGQvc2J/I/OHR
	QNIJ/auG/mE+MJ29bhXKeaj5aDx8FzHMlUi0NUqtwmBpt9x7BWM8FgZHfXHujqkrg9HQcl6FqO/
	E91FTWF9WBMzoUrrpwL2jX/yNgBMBFJfB2ebR27q8gRetK5N4LdrYJtt+
X-Google-Smtp-Source: AGHT+IH26x+QcFPq/NNNtNuvF8fffEp6GgzLWJpat/NNkEI1VD0QBQixMZvPnEBJQElAahHfWDd6k2kDrXxVMuX0Ahw=
X-Received: by 2002:a05:690c:4b01:b0:789:2e24:b786 with SMTP id
 00721157ae682-78c9d772f9bmr17313607b3.52.1765338949606; Tue, 09 Dec 2025
 19:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20251209070234.22481-1-liuyd.fnst@fujitsu.com>
 <CAMKF1soysmR5Ms9G_Vuu2oCBgwBFvt-mHD1uLOEra7V-u5LBbA@mail.gmail.com> <TY3PR01MB114831619F50265E95093E9BF9BA0A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB114831619F50265E95093E9BF9BA0A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 19:55:23 -0800
X-Gm-Features: AQt7F2pu9LowX7vCjQrOi5V1e_TUJJZzE_s_JuqwFwwYvHKc3wk3VXEzHIhq17E
Message-ID: <CAMKF1srLhYBtPrVobhE==jzaMNLPVyQkg501ivN+_g+nMZuAcQ@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 3/3] python3-pyzstd: upgrade 0.18.0 -> 0.19.0
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ffe33406459100b8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 03:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122482

--000000000000ffe33406459100b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

its failing for qemuarm, I have queued a local fix for the issue.

On Tue, Dec 9, 2025 at 7:23=E2=80=AFPM Yiding Liu (Fujitsu) <liuyd.fnst@fuj=
itsu.com>
wrote:

> Hi Raj
>    I rebuild the  python3-pyzstd in my local environment with qemuarm in
> ubuntu-24.04 and can't reproduce the configure error in the URL.
>    Could you please tell me more details about the building environment?
>    Thanks.
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Khem Raj <raj.khem@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2025=E5=B9=B412=E6=9C=8810=E6=97=
=A5 00:04
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *=E4=B8=BB=E9=A2=98:* Re: [oe][meta-python][PATCH 3/3] python3-pyzstd: up=
grade 0.18.0 ->
> 0.19.0
>
> its failing to configure
> https://errors.yoctoproject.org/Errors/Details/891457/
>
> On Mon, Dec 8, 2025 at 11:02=E2=80=AFPM Yiding Liu (Fujitsu) via
> lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
> wrote:
>
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

--000000000000ffe33406459100b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">its failing for qemuarm, I have queued a local fix for the=
 issue.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Dec 9, 2025 at 7:23=E2=80=AFPM Yiding=
 Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com">liuyd.fnst@fuj=
itsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div class=3D"msg5230428248540301890">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Raj</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0I rebuild the =C2=A0python3-pyzstd in my local environment wit=
h qemuarm in ubuntu-24.04 and can&#39;t reproduce the configure error in th=
e URL.<br>
=C2=A0 =C2=A0Could you please tell me more details about the building envir=
onment?<br>
=C2=A0 =C2=A0Thanks.</div>
<div id=3D"m_5230428248540301890appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5230428248540301890divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>=E5=8F=91=
=E4=BB=B6=E4=BA=BA:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> 2025=E5=B9=B412=E6=9C=8810=E6=
=97=A5 00:04<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=
=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.f=
nst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b> <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=
=3D"_blank">openembedded-devel@lists.openembedded.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b> Re: [oe][meta-python][PATCH 3/3] python3-pyzstd:=
 upgrade 0.18.0 -&gt; 0.19.0</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">its failing to configure
<div><a href=3D"https://errors.yoctoproject.org/Errors/Details/891457/" tar=
get=3D"_blank">https://errors.yoctoproject.org/Errors/Details/891457/</a></=
div>
</div>
<br>
<div>
<div dir=3D"ltr">On Mon, Dec 8, 2025 at 11:02=E2=80=AFPM Yiding Liu (Fujits=
u) via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembedd=
ed.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrote:=
<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
1. Changelog<br>
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
d" rel=3D"noreferrer" target=3D"_blank">
https://github.com/Rogdham/pyzstd</a>.<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...-setuptools-dependency-from-74-to-89.patch | 27 ------------------=
-<br>
=C2=A0...<a href=3D"http://std_0.18.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">std_0.18.0.bb</a> =3D&gt;
<a href=3D"http://python3-pyzstd_0.19.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pyzstd_0.19.0.bb</a>} |=C2=A0 9 ++++---<br>
=C2=A02 files changed, 5 insertions(+), 31 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-pyzstd=
/0001-Bump-setuptools-dependency-from-74-to-89.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pyzstd_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.18=
.0.bb</a> =3D&gt;
<a href=3D"http://python3-pyzstd_0.19.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pyzstd_0.19.0.bb</a>} (63%)<br>
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
enembedded-devel/message/122401" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/122401</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116690716/199=
7914" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/116690716/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--000000000000ffe33406459100b8--

