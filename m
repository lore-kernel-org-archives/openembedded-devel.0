Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60717C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 03:39:44 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.6568.1707968380689352752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 19:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ey3AVgG1;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3beab443a63so329912b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 19:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707968380; x=1708573180; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cHacjssR0MOLUflFWZYFTX5nVE8E8vnn81w9L8VwfFI=;
        b=ey3AVgG1WhmpdWxomsd+q9BuvxRlQymAvggL7nf/cd99RnYP+UpLLDxfgv3m41fL7+
         lyGxMNDFffusfdKhIZ2LQdOsHnDnV5Fr95B88KyhB8ZS/UVlh0jqRzu4fSeqCTilNqQI
         2Hazs2GN4J4sDPInuSe371/uep8rrRU877deH2iPWX+lZfhGe3t/+kPXZ51nKX3CAc1U
         ZNxhzUxTHanIpe6pAgeq0lyq+ykkhfSMbrSiuIXk7meyR9Fu8qQ0N7Q/LzgsvSzwgSkQ
         Ney1IPIuYetppPu6o8RRBYqZKjsmlG4MSYInfzeTmBIveRq2jdDYO9Ss7JaASrx8/oBb
         EqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707968380; x=1708573180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHacjssR0MOLUflFWZYFTX5nVE8E8vnn81w9L8VwfFI=;
        b=JUH4G69XBNNnnelfyHEwPqkPGocsW4EA13UFvS9mtkJsw4QIyE6l29fO84y2qtTWA0
         HR745ixASFyl2Nf69AJK1EJ57LIatFjvhjeWQcArMAN+DyOlZ5vBaI7ISrGdpJg1i3ce
         2n+FFQ+qPIfcsemqW2wmYjKXKWDKaSMf9IschiYE7eRauYyfGys/S6IxWlbEN/Tuad8/
         gq/XzVtfuKR3haM+ljc6cAOB2Tn0ExewJnv8L3thQkRP3QmnW869Xyj/7fbK6lBPEhQ4
         ++hVqH3eUVVfKrpGgd1nCEyrkxnY0h4ySJfxXsPkCfWESL+Fkb55X0Dp1y68LvTwwDdT
         DZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCWaD2h9UE/4OY/DStHpNChxOnRg4rXYitqRr3V21CXRqba40RwtqoZWTGfTqSCgxncRwsToSoUHcBklOjdb/8oJMMIYVDjRf4BCvn9E0sQEv+D9jV+p50n+ng==
X-Gm-Message-State: AOJu0YzhzyoC7ibFgviUOT74x6QAhw3gMQLmnW86EbqVJtitymL8uDds
	JS1uwvAwW6Qx7wA7VViSaetCSkYhdDdvt9uzjwGPkPlVRe0yKShqWFKuAAtEmlj7lHCXTXmKOAQ
	1luPeVYBV8pa6KOghuNtVWZDEL2o=
X-Google-Smtp-Source: AGHT+IHRichuNisB1zoyaPcuEX1Dgp1tY/rP6TcCZzsCrL+6nwh4g9oIlZr0CcM2sbJ0onKSOOlsX+c5oIIpox64ZdE=
X-Received: by 2002:a05:6870:d88d:b0:218:df68:87b2 with SMTP id
 oe13-20020a056870d88d00b00218df6887b2mr505020oac.44.1707968379784; Wed, 14
 Feb 2024 19:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20240214082449.3498259-1-niko.mauno@vaisala.com>
 <20240214082449.3498259-2-niko.mauno@vaisala.com> <CANx9H-DYRrFpa_sfzqbthTrq6B6vzuOBiz8DA9vXiU557gH6_A@mail.gmail.com>
In-Reply-To: <CANx9H-DYRrFpa_sfzqbthTrq6B6vzuOBiz8DA9vXiU557gH6_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Feb 2024 19:39:28 -0800
Message-ID: <CAMKF1spRz8YYP1c5P1p72L3LLVSdW5wTToZT+7WDkkhAwJP=fA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-pybind11: Prune redundant inherit
To: Tim Orling <ticotimo@gmail.com>
Cc: niko.mauno@vaisala.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000090917c06116360b7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 03:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108749

--00000000000090917c06116360b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 7:30=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:

>
>
> On Wed, Feb 14, 2024 at 12:25=E2=80=AFAM Niko Mauno via lists.openembedde=
d.org
> <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
>> From: Niko Mauno <niko.mauno@vaisala.com>
>>
>> Inheriting setuptools3 implies the inherit of python3native, so drop
>> the latter inherit as redundant.
>>
> according to
>
> https://github.com/pybind/pybind11/blob/8b48ff878c168b51fe5ef7b8c728815b9=
e1a9857/pyproject.toml#L3
> we should drop setuptools3 and inherit pyyhin_setuptools_build_meta
>

Good point I think that could be added as a new patch


>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>  meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pybind11_2.11.1.bb b/meta-python/recipes-devtools/python/
>> python3-pybind11_2.11.1.bb
>> index e919e7dcc..442837199 100644
>> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
>> @@ -13,7 +13,7 @@ S =3D "${WORKDIR}/git"
>>
>>  EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
>>
>> -inherit cmake setuptools3 python3native
>> +inherit cmake setuptools3
>>
>>  PIP_INSTALL_DIST_PATH =3D "${S}/dist"
>>  PIP_INSTALL_PACKAGE =3D "pybind11"
>> --
>> 2.39.2
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108748):
> https://lists.openembedded.org/g/openembedded-devel/message/108748
> Mute This Topic: https://lists.openembedded.org/mt/104349532/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000090917c06116360b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 14, 2024 at 7:30=E2=80=AFPM Tim Orling &lt;<a h=
ref=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)"><div><br></div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 14, 2024 at 12:25=E2=80=AFAM N=
iko Mauno via <a href=3D"http://lists.openembedded.org" target=3D"_blank">l=
ists.openembedded.org</a> &lt;niko.mauno=3D<a href=3D"mailto:vaisala.com@li=
sts.openembedded.org" target=3D"_blank">vaisala.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">From: Niko Mauno &lt;<a href=3D"ma=
ilto:niko.mauno@vaisala.com" target=3D"_blank">niko.mauno@vaisala.com</a>&g=
t;<br>
<br>
Inheriting setuptools3 implies the inherit of python3native, so drop<br>
the latter inherit as redundant.<br>
</blockquote><div dir=3D"auto">according to=C2=A0<div><a href=3D"https://gi=
thub.com/pybind/pybind11/blob/8b48ff878c168b51fe5ef7b8c728815b9e1a9857/pypr=
oject.toml#L3" target=3D"_blank">https://github.com/pybind/pybind11/blob/8b=
48ff878c168b51fe5ef7b8c728815b9e1a9857/pyproject.toml#L3</a></div><div dir=
=3D"auto">we should drop setuptools3 and inherit pyyhin_setuptools_build_me=
ta</div></div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Good point I think that could be added as a new patch=C2=A0</div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)"><div><div class=3D"gmail_quote=
"><div dir=3D"auto"><div dir=3D"auto"></div></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pybind1=
1_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybind11_2.11.1.b=
b</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pybind11_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybind11_2=
.11.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pybind11_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybind11=
_2.11.1.bb</a><br>
index e919e7dcc..442837199 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pybind1=
1_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybind11_2.11.1.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pybind1=
1_2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybind11_2.11.1.b=
b</a><br>
@@ -13,7 +13,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE =3D=C2=A0 &quot;-DPYBIND11_TEST=3DOFF&quot;<br>
<br>
-inherit cmake setuptools3 python3native<br>
+inherit cmake setuptools3<br>
<br>
=C2=A0PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
=C2=A0PIP_INSTALL_PACKAGE =3D &quot;pybind11&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108748): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108748" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108748</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104349532/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104349532/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000090917c06116360b7--

