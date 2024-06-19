Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AD8C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.34205.1718835316044212462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XaSbN4JO;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a2424ecb8so2713997b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835315; x=1719440115; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gCBhAoRFjWCX1DP3aakxD2JlCsVymxXvVXGOajCuGk=;
        b=XaSbN4JOoG0xkcsNV811jvsJwi6ni9TDLuqJ+58+1U0d/hsB9OQDnDTVygBE7W13d9
         XDiXj+m/Hdnzxh2kAP4+msjkjTmjGSWAd3DwrEubZJdtKj3IElI8fh+Dejih+h3yA3BE
         UPPxaHWW30ZTykNxteAThBUNYI3s5bUSF9ujr+T4l0CUYBjFdWvctGMSd3+59tzIx/Oo
         RhuoG+KrprodgWD3jU7NiVqfneXCUN4E9Q2MTaN0ca0CFnPNG3i2C4KWZ4jLyEafyTqR
         hFefz9bt/VwqSpwZ8G2RikpIkLnIYcAAyWmY72HunZ2a2RUi5Fucy0PzTg9D8e9mNDmz
         v9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835315; x=1719440115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gCBhAoRFjWCX1DP3aakxD2JlCsVymxXvVXGOajCuGk=;
        b=tBaE5mSj8peoIGOKZD6EF4/Qfgmn5jiJyr8tjqDS3+jVWiDo5u/MSeqnnayU1S7Pet
         9ONSjsVrwccEHtsl7jKzc4rIgLZOSLgroV00JgusYiykK6cJ/0s8cQnStPJIz4EJ/4gH
         v/RWf1AY8qh5hMjsDmfZ9TwWJ5Zk3qvmL1tjStmiRU/5VYgQfyC7un5TPlb9vErm4RA4
         5ghG4wBypxegIN2kOXVnoom1GFhxD1ead5y8UIXixM3o8KI018UHqHAm7y+aql/62mcq
         xbRVmE3ZH3XyzEzKoNFchySoBBKzzQMb89IdZBRkQoAWspIGklzj1AZTQ++MCyAkYnPR
         wiHA==
X-Gm-Message-State: AOJu0Yxo+D0mgOOe2Gy1bbFu8++HWEXUd3HkNYJTk55C9lSWbGMWJV+i
	IwkDgHiJCFS8HTtTdj3/gi1J2EOqukFpYJ4yVXSlTEclN+CmpYDkn5rFLpMuFjwklELiSn8F6sx
	13//G1WWGf2rt0gk/GyrqNA7b9Z0=
X-Google-Smtp-Source: AGHT+IGIovUFP3k16lW9677XIk9MaFB3FjQnRqbucFapqhUvN9M0YmB8+A36wCFYM9Z+cjR85fiRaXsId15dATemxsg=
X-Received: by 2002:a0d:d48d:0:b0:622:c901:950b with SMTP id
 00721157ae682-63a8fddc9d9mr41420387b3.43.1718835315079; Wed, 19 Jun 2024
 15:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240619122019.529213-1-leon.anavi@konsulko.com> <20240619122019.529213-2-leon.anavi@konsulko.com>
In-Reply-To: <20240619122019.529213-2-leon.anavi@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 19 Jun 2024 15:15:04 -0700
Message-ID: <CANx9H-CtguyHBiOX8TF-gk81FGx6-Ja_SbAC0kfhKOQR2Curcw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-tornado: Upgrade 6.4 -> 6.4.1
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000062023a061b45882e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110968

--00000000000062023a061b45882e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We should update to =E2=80=9Cinherit python_setuptools_build_meta=E2=80=9D =
per
https://github.com/tornadoweb/tornado/blob/2a0e1d13b5222dca4388c0ec8a4bb74e=
a6fa4af2/pyproject.toml#L3


On Wed, Jun 19, 2024 at 5:20=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to version 6.4.1:
>
> - Parsing of the Transfer-Encoding header is now stricter.
> - Handling of whitespace in headers now matches the RFC more
>   closely. Only space and tab characters are treated as whitespace
>   and stripped from the beginning and end of header values.
> - tornado.curl_httpclient now prohibits carriage return and
>   linefeed headers in HTTP headers.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/{python3-tornado_6.4.bb =3D> python3-tornado_6.4.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-tornado_6.4.bb =3D>
> python3-tornado_6.4.1.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
> index b01c1cec2..30b50f24f 100644
> --- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRC_URI[sha256sum] =3D
> "72291fa6e6bc84e626589f1c29d90a5a6d593ef5ae68052ee2ef000dfd273dee"
> +SRC_URI[sha256sum] =3D
> "92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9"
>
>  inherit pypi setuptools3
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110965):
> https://lists.openembedded.org/g/openembedded-devel/message/110965
> Mute This Topic: https://lists.openembedded.org/mt/106759044/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000062023a061b45882e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We should update to =E2=80=9Cinherit python_setuptools_bu=
ild_meta=E2=80=9D per</div><div dir=3D"auto"><div><a href=3D"https://github=
.com/tornadoweb/tornado/blob/2a0e1d13b5222dca4388c0ec8a4bb74ea6fa4af2/pypro=
ject.toml#L3">https://github.com/tornadoweb/tornado/blob/2a0e1d13b5222dca43=
88c0ec8a4bb74ea6fa4af2/pyproject.toml#L3</a></div><br></div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 19, =
2024 at 5:20=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulk=
o.com@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">Upgrade to version 6.4.1:<br>
<br>
- Parsing of the Transfer-Encoding header is now stricter.<br>
- Handling of whitespace in headers now matches the RFC more<br>
=C2=A0 closely. Only space and tab characters are treated as whitespace<br>
=C2=A0 and stripped from the beginning and end of header values.<br>
- tornado.curl_httpclient now prohibits carriage return and<br>
=C2=A0 linefeed headers in HTTP headers.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-tornado_6.4.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-tornado_6.4.bb</a> =3D&gt; <a href=3D"http://=
python3-tornado_6.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-torn=
ado_6.4.1.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tornado_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.b=
b</a> =3D&gt; <a href=3D"http://python3-tornado_6.4.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-tornado_6.4.1.bb</a>} (93%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
tornado_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-tornad=
o_6.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.1.bb</=
a><br>
similarity index 93%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-t=
ornado_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb<=
/a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-tor=
nado_6.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.1.b=
b</a><br>
index b01c1cec2..30b50f24f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-tornado=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-tornado=
_6.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.1.bb</a=
><br>
@@ -6,7 +6,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.tornadoweb.org/en/=
stable/" rel=3D"noreferrer" target=3D"_blank">http://www.tornadoweb.org/en/=
stable/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;72291fa6e6bc84e626589f1c29d90a5a6d593ef5ae680=
52ee2ef000dfd273dee&quot;<br>
+SRC_URI[sha256sum] =3D &quot;92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84=
d452800d4ff6fc504e9&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110965): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110965" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110965</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106759044/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106759044/924729</a><br>
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

--00000000000062023a061b45882e--

