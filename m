Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B52CEE342
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 17:25:30 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2532.1763486722822555676
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 09:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CAVjlZ/P;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787e84ceaf7so64444197b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763486722; x=1764091522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RuadRbuXRYQ5LBh13VnegAVXNaOiYxA3QWAJSPL5xsc=;
        b=CAVjlZ/Pd+eLlZS0sAqwpvNMPIt0JbtxpfdVMhFzfT+NeF5x0k1rMW5Z4bkCh7MwNd
         Es1baZ3PLpSGrDirmDhr0UKvZQJwmUkRfWp0wR5qXyl7Uj6Kd2w4I+qmDpW+sfpHp0/F
         DU+b+vzjdu7ljymQLH7JZDnmTfXafNhBeDbO4JzT9f6oy+b81iz5RKciI26Ozwir3szW
         2zwZYRojYxkK1ory6YIRp1h6ovdC8IjjYGOpLjoIqVhpMBIAc8q4UY34nXDJcp8pgTMF
         9+P3wsBSG72IJLokCRQsEqGTuR8whhxRIuvyyzaKHBllYkWwExLcHn0LS7j7IE3EOc5F
         SelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763486722; x=1764091522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuadRbuXRYQ5LBh13VnegAVXNaOiYxA3QWAJSPL5xsc=;
        b=TX8s/ZbR7u3la/tkparkT0Y7Woa4mLlFYklOQQPu8ieZe8P8b6luOZsGF3YxnHBbwd
         PFhwuMW3EP3ysf2sxBL1cMwpTk33jy2BDGp9/UoguHllhA+ISe4eaHjlMQGSxkiLIPHX
         mGFXlT7OGFJO3ICER+CIBV6AZO0VbrN+dtiy6Cc9nZKPNH3akaXZlJYcAYdcdbjXNfWk
         TstpTEUgHImRXVWDMuYS21RXVFm9YDM4ujV6qWKoQvd/IvrzjuQKdx3IXLXN5xuOsTd4
         WAgRi46ul0dPkIhtVRou/DcXFg1fIjp6XR+TKKitGrn+BhDPfYhgFm3jkafrWZlsWYcn
         ZrUA==
X-Gm-Message-State: AOJu0YzQM6Vs2gHb0gh576hO/rpDISV/na9hUe8iRITvr3sHBirfPzg4
	5XsYOZT3Pm8QuBvHp2K1hSHvUgLRr3liJAm1crHx2vmStVyTyOPf9mssDyk0PFbX2dEhCBCiDRL
	CS5jvK1Lc5bL+Fzeubjiusyv8xn+lAMp0lTPuxRtQRw==
X-Gm-Gg: ASbGncvDt8u4PP/eDTRyXOnByv0uELp708qkh0gQWhhaLx2wsmOn7xFHi5uOTFr+jzt
	jaSOrvJsdj454CeOJqny+kzuL2YLvFcMolnm0126MmZdJo0BV0h6rpXeXB6Z0+poJZAA+l+4FM1
	mg3LK1TIwAHervg08NV0gMkztSsvCl26zAMNKHca+60eBNQdUhmQO6Q7kz6JZtuIMvXcoOz6B2b
	AbUgH6ceRUQcR54t3bgIk1T9Mf+0mQBzeqkEFpBILuE1xYV7C/DCONBRPKyYDy4cJaX8kWS8gZy
	zyo7kwGQ6JhK4bSfmOWeSXRUqRiHGUC0lc1kpOZBnlussudMNfxUoOWlDVOe9Zq+oSNGUvQL4MF
	hlszOUyA8f66PVYN1G3kVXe0=
X-Google-Smtp-Source: AGHT+IGXdW/YhoHln97NjJGCrjYnJI+xyppPh/13gOVelR8/zJw4+w216qY2mgdTZ6BJ/9nLeV4j1YjY06ADJBwQjN4=
X-Received: by 2002:a53:acc3:0:10b0:63f:ba88:e905 with SMTP id
 956f58d0204a3-641e757cfa3mr11719992d50.30.1763486721916; Tue, 18 Nov 2025
 09:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20251116225013.2063395-1-t.f.g.geelen@gmail.com>
In-Reply-To: <20251116225013.2063395-1-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 09:24:55 -0800
X-Gm-Features: AWmQ_bkVtiMDR33NaXeERDeAlbUbVAJOCetC6oGt2RPecsr3wcrujtDscdxqbD4
Message-ID: <CAMKF1soQYmApxJ1weUw1PSxQGA0sbGiiYPPH8zFENCyPwZogkQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-orjson: 3.10.17 -> 3.11.3
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a045270643e1bfda"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 17:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121864

--000000000000a045270643e1bfda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails to build on riscv64 -
https://gist.github.com/kraj/8d818b0bb2ec93afc4abf5b1ed06a7df

On Sun, Nov 16, 2025 at 2:50=E2=80=AFPM Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../{python3-orjson_3.10.17.bb =3D> python3-orjson_3.11.3.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb =
=3D>
> python3-orjson_3.11.3.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.b=
b
> b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
> rename to meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
> index 7db76c9415..7fdd0fef9b 100644
> --- a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
> +++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://pypi.org/project/orjson/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE-MIT;md5=3Db377b220f43d747efdec40d69fcaa69d"
>
> -SRC_URI[sha256sum] =3D
> "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
> +SRC_URI[sha256sum] =3D
> "1c0603b1d2ffcd43a411d64797a19556ef76958aef1c182f22dc30860152a98a"
>
>  require ${BPN}-crates.inc
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121749):
> https://lists.openembedded.org/g/openembedded-devel/message/121749
> Mute This Topic: https://lists.openembedded.org/mt/116329171/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a045270643e1bfda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this=C2=A0fails to build on riscv64 -=C2=A0<a href=3D"http=
s://gist.github.com/kraj/8d818b0bb2ec93afc4abf5b1ed06a7df">https://gist.git=
hub.com/kraj/8d818b0bb2ec93afc4abf5b1ed06a7df</a></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On S=
un, Nov 16, 2025 at 2:50=E2=80=AFPM Tom Geelen via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;t.f.g.geelen=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com" targe=
t=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-orjson_3.10.17.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-orjson_3.10.17.bb</a> =3D&gt; <a href=3D"http://p=
ython3-orjson_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjso=
n_3.11.3.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-orjson_3.10.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.1=
0.17.bb</a> =3D&gt; <a href=3D"http://python3-orjson_3.11.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-orjson_3.11.3.bb</a>} (84%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
orjson_3.10.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.10=
.17.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
orjson_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.11.=
3.bb</a><br>
similarity index 84%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-o=
rjson_3.10.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.10.=
17.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-orj=
son_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.11.3.b=
b</a><br>
index 7db76c9415..7fdd0fef9b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-orjson_=
3.10.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.10.17.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-orjson_=
3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.11.3.bb</a=
><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/orjs=
on/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/orjson/<=
/a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE-MIT;md5=3Db377b220f43d747ef=
dec40d69fcaa69d&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfc=
f0370dbd41f5ff6058b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1c0603b1d2ffcd43a411d64797a19556ef76958aef1c1=
82f22dc30860152a98a&quot;<br>
<br>
=C2=A0require ${BPN}-crates.inc<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121749): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121749" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121749</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116329171/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116329171/1997914</a><br>
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

--000000000000a045270643e1bfda--

