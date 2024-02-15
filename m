Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B48DC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 03:30:54 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.6439.1707967848607709578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 19:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TqbM7a1Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60778d7b02bso4804957b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 19:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707967848; x=1708572648; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DOcWKFH6Q0sEM6DteWbffuaBzytxTfnwoxqrdzcfF/k=;
        b=TqbM7a1QcmsWwxDRf2mWyubhVXqigctImeMBluuVwcEkFp/+Lx0l8eKixGYFhl137s
         Uhw3bgETn/M1xGAKgG9lx8TKb/hP721Ycg7SmsigL4qjxKMTnWme56WpcR/vD9UT45fC
         ItN/ud4Rx9a5t8Uz/MAaImN4Sr/X5aCxd/d9euQWlrpq1GHpN6Y0xKKx+h4fVsaMd6Xb
         CskWhnzeWpKd443CO4qqUsg1x9StbDtBKYm3D8nlwRKf81BVxwXEJTehRQJjxB2DUiHr
         laYhhZYqAf3wmKK26/8aKbIQruBYCsWgfQ88D1Pbfl7JqZJMZd5uWqLj/yQmMDZdWOMP
         kmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707967848; x=1708572648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOcWKFH6Q0sEM6DteWbffuaBzytxTfnwoxqrdzcfF/k=;
        b=ogOLI9BGCq4Brj1JMUMk819hsgshaudwZL6xl+VTmJB4Y7eOMYBlaWaShYjk4UYXAc
         97n2nNH8yZqxv/XnB5Tuicc2bb2RzLOa+oU7zvHMrqJT4kQWK5nlH4T2ti+/npfKPO7q
         /vfGK2Bpbax+y7wBxxFJ+GrIQx/2jYQI/SMTWm4JJ7Fn6uOS9sPLGiGYi5/GpdUOaQ0m
         /VX5jSreul4GWo/ta80cU4XwCa8ajgnVn5cOZgZdkzCet5/imPcyHdZfOmzhF9jJqGuv
         mgupuUiRO8VTGkTB6roQC34Si5iTo493juaJKbmbpZfVPkbUQFNMMgE/1zuwlIbix73W
         bfAg==
X-Gm-Message-State: AOJu0YxDBInkLECi/crSVWcCn/b8oO9pzGxAWssf4NzeBOLSx09XNQ/0
	SCwqZ0RrFpj9IWoFqlpzPV4Tk4mBzOsY6Es3FfNHPrgJK5MBwqReD4nALqjnAjSrMv7eDpw+ADZ
	u5IDvH5mfL2wnmWBvknv3nvfRfjk=
X-Google-Smtp-Source: AGHT+IEWcaYzzM0bufhgQAqD2aMOHPZARX1o6s36mEfsnrejWeJQyLKg/PK7moJT5pv9Oa5uQFUJej+P/FeebktkV3k=
X-Received: by 2002:a05:690c:82e:b0:607:9796:db4f with SMTP id
 by14-20020a05690c082e00b006079796db4fmr556829ywb.5.1707967847679; Wed, 14 Feb
 2024 19:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20240214082449.3498259-1-niko.mauno@vaisala.com> <20240214082449.3498259-2-niko.mauno@vaisala.com>
In-Reply-To: <20240214082449.3498259-2-niko.mauno@vaisala.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 14 Feb 2024 19:30:36 -0800
Message-ID: <CANx9H-DYRrFpa_sfzqbthTrq6B6vzuOBiz8DA9vXiU557gH6_A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-pybind11: Prune redundant inherit
To: niko.mauno@vaisala.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d9493b0611634056"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 03:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108748

--000000000000d9493b0611634056
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 12:25=E2=80=AFAM Niko Mauno via lists.openembedded.=
org
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:

> From: Niko Mauno <niko.mauno@vaisala.com>
>
> Inheriting setuptools3 implies the inherit of python3native, so drop
> the latter inherit as redundant.
>
according to
https://github.com/pybind/pybind11/blob/8b48ff878c168b51fe5ef7b8c728815b9e1=
a9857/pyproject.toml#L3
we should drop setuptools3 and inherit pyyhin_setuptools_build_meta

>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pybind11_2.11.1.bb b/meta-python/recipes-devtools/python/
> python3-pybind11_2.11.1.bb
> index e919e7dcc..442837199 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
> @@ -13,7 +13,7 @@ S =3D "${WORKDIR}/git"
>
>  EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
>
> -inherit cmake setuptools3 python3native
> +inherit cmake setuptools3
>
>  PIP_INSTALL_DIST_PATH =3D "${S}/dist"
>  PIP_INSTALL_PACKAGE =3D "pybind11"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108735):
> https://lists.openembedded.org/g/openembedded-devel/message/108735
> Mute This Topic: https://lists.openembedded.org/mt/104349532/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d9493b0611634056
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 14, 2024 at 12:25=E2=80=AFAM Niko Mauno via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;niko.=
mauno=3D<a href=3D"mailto:vaisala.com@lists.openembedded.org">vaisala.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Niko M=
auno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.m=
auno@vaisala.com</a>&gt;<br>
<br>
Inheriting setuptools3 implies the inherit of python3native, so drop<br>
the latter inherit as redundant.<br>
</blockquote><div dir=3D"auto">according to=C2=A0<div><a href=3D"https://gi=
thub.com/pybind/pybind11/blob/8b48ff878c168b51fe5ef7b8c728815b9e1a9857/pypr=
oject.toml#L3">https://github.com/pybind/pybind11/blob/8b48ff878c168b51fe5e=
f7b8c728815b9e1a9857/pyproject.toml#L3</a></div><div dir=3D"auto">we should=
 drop setuptools3 and inherit pyyhin_setuptools_build_meta</div></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)"><br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108735): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108735" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108735</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104349532/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104349532/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d9493b0611634056--

