Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7582DCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:34:39 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28295.1780515278938263017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 12:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OBVqEONO;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66058b880e9so5867236d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 12:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780515278; cv=none;
        d=google.com; s=arc-20240605;
        b=QRWTIlCYdI9ERh2EmW+vCNWaTTrYJnRo+DlkIlhZkhvqNRFHhVWAUb+ZQrXdmYBPGq
         1AQ1AIZ3TdioJeYWUltGOE0v0niQfNxc5P/8z78bDe/oM6RXkDzs+2xi/TxRtbZZ7u7Y
         vBdEqPzFrkaao5P5GmycwwBA0sJ3sLLQgfsGsXDGrxiD/alaiSZYRdksBI72IKI1DdEy
         5yiUF/pHV3pOZF8FG9vkOF2s00xjEbamuPd5LcewX5bcv3KZ7ZyxU6cR5giznsRO3UGY
         H2E/Mzvqe7Qb5bkvYsOkQiAyN96IPR+k2HLCv9bAJBsVAfttHTXPNB5q85C/U7HMZBhC
         NVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=87DIoPt8JX9N8aFiTEl+RckmsITeXOSdQ2vSzR5Fe+E=;
        fh=9580bMxyDi/D1ZqmlHmLEHBJHdNlnG8y+F30gAI5JhE=;
        b=UOVEvfOLPseZzEoeLnTZ8wrIOhbAkYTOPSQxKURA2pLFkI9OCHbP/kDPOl5XJ4sjkx
         DOGUvWOgR9ucgruBQMqqQYRC8Ylqqw2MMWBWVLdiNVKpQJJtFfIRtMWhJXy9v13fuSH4
         cCzLHMz4WaXPAo+VVn2cSuj7yRxnQY8azcyugYBEdCpzcLLq1o0mHUiCEaAJdHDyruAD
         hnTMUlim9Pl/mKkPa1iVgKIhwSlrLXImAVAYHj2eiC+twjkYvAIltuF519pe5i5hwoK3
         h3mhDbp9S/VH+gruJ+u5GhGUi2Emr3gfv+fy0aCmsk1ghWXxfOAzsy9XD4AhN9pGf7Sq
         +k+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780515278; x=1781120078; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87DIoPt8JX9N8aFiTEl+RckmsITeXOSdQ2vSzR5Fe+E=;
        b=OBVqEONOYKaqEjj7sjuKarCt/UHI2QZv4hD6gGLlgc0YMVaZBjxrVWKPQr689+yY0s
         KreBs93VbnCKvDGEGqI9NHVKCnpVLfU+2qyhAXMXkJwNS2ukYqBBWzXAy00408cvLNKm
         IT1DsXre1ANyL6n8E9I8pNFqVc05mB1Oafhc8R2l5vF0Lwz/XkFXlXGZgH3O7lJ5CXib
         ycl5/KDckmoP4fmRVKeIlO+RmZeFfcuSJSz9FTF1PtvBY5zXPPrO7ZCz04RYZ2prlYYl
         1L4t2mTxgP6nN1dg/39ZuRdh5U1Hl2peGyhRVaCYPxxmHojs9M6SVG42f9F7h71UsBJD
         I37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780515278; x=1781120078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87DIoPt8JX9N8aFiTEl+RckmsITeXOSdQ2vSzR5Fe+E=;
        b=ObNSCU8dz6vD9vMtzw7n5+aQx3LyYA2y0wyQbzvxMqT3Kwo8xJcz64WVvKZIqnPTiW
         eZrj7tK0VFnYDU/Q2/ufBDooIOjRCAf4YOjT31Cn5sVWIFkSgYQqZPTxyPpwCtnTsVCl
         23xATIfQabFayS0C3h9UEiIg2q536JctkmAjpJqRiUKpXby/x8GsIIEqIFiYpOCi4OpR
         7gcmQbFnqHsQ6Kh/k7TPX0/B9yksaJznKM2h8RyqYXoXRucAbGSdbs+MOCAAyR1ZHKwU
         t7zHuqLz8sgidgEzjV68dP6HeTUOjN9Im2tbWtGSO4K71Loj73XB8yPMBFzGX5Zs7B2P
         OTIg==
X-Forwarded-Encrypted: i=1; AFNElJ+hZkRXn9rudZGB6jEbOVQ03TvDhtmrR3uynQOY723iehLojUIDtIK6+k+ddzPDWyrkdTCKjAhE59YX9I8Hfj5PVYw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywwmc+S5jNoOCZP3oFSohkeavTuVC7z8rLU91aFlbWoCa7c+xfr
	we3vpAmag9RDpI5IV7sKZKc7nFya/Y0c19ICP1ywNU2mHumzTtnjeiHHgY0aOSW5WRXuEObl8Y6
	mfFhKtNvuWlYd/2q0gvQbt3jPf85mT20=
X-Gm-Gg: Acq92OFqSZmceiZY1ysRg1RuJ7M8URbMo2UX/n0GyoO6WsV6n0VABxiaGAtu0dcnKZ4
	7t8HjlL+9p6I824yDM5O/3yoRkdg6wfB8U7EW+4aHfEHAVKRF+XipCPojXQXH6Hkzx2uLggQTXW
	McEOlVYkEnZbvSAKcTQSOrsrvIeuOCxrwD4Gfc/fycKSO/jj1dt445PFl1QDhRveSv6u61MePJR
	zknRE+LJCYA76u6jJgtvmZvudFvHhEa8r5Sbel1qzIw6DZyTUeweAkFKqnpDNoOUblc2lYdr3TZ
	q6ApvZ16MS8Sxq8eSTfMs3DpvXyKSSpna0KPfOQTVIIHS+Rsm+N4zgmRkeNYXjS6GJ5bP8MmL7/
	brCvyYbElEcSujtoUh/1eVRZmEfE4uqYf/sLOq9Y6Z/+C1zD34ZKWLkvhUk0zMgrKus/MIBeff9
	hQKM/Rx7QoaZ6VuZs=
X-Received: by 2002:a05:690e:c4f:b0:656:b6bb:7c3b with SMTP id
 956f58d0204a3-660dc25e101mr4414632d50.37.1780515277802; Wed, 03 Jun 2026
 12:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260603192101.3085843-1-a-christidis@ti.com>
In-Reply-To: <20260603192101.3085843-1-a-christidis@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2026 21:34:25 +0200
X-Gm-Features: AVHnY4JOYq5qwHwm54U9cyqWXtOxdNRP1oWznz4_2cCR5BmAs5CtlzmeDc2tajI
Message-ID: <CAMKF1soJDCcwa4LjXYTdK1PDr5LiO3P5HHzyfFdyfVrdprGO6w@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH v3] ktx-software: Version change 4.4.0 -> 5.0.0
To: Antonios Christidis <a-christidis@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a692b006535e8466"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127386

--000000000000a692b006535e8466
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you show the diff between old and new text file

On Wed, Jun 3, 2026, 9:21=E2=80=AFPM <a-christidis@ti.com> wrote:

> From: Antonios Christidis <a-christidis@ti.com>
>
> Major 5.0.0 version update. On top of new features, this version fixes
> compilation issues with GCC 16 and C++20.
>
> License-Update: Due to new copyrighted material, no new license.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v3:
> - Use of License-Update tag
> v2:
> - Add reasoning for why LIC_FILES_CHKSUM changed
>
>  .../{ktx-software_4.4.0.bb =3D> ktx-software_5.0.0.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/ktx-software/{ktx-software_4.4.0.bb =3D>
> ktx-software_5.0.0.bb} (85%)
>
> diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> similarity index 85%
> rename from meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> rename to meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> index ae4caeb89c..8db0c79b87 100644
> --- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> +++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> @@ -6,10 +6,10 @@ LICENSE =3D "Apache-2.0 & BSD-1-Clause & BSD-2-Clause &
> BSD-3-Clause & BSL-1.0 \
>            & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark =
&
> fmt & \
>            Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
>
> -LIC_FILES_CHKSUM =3D
> "file://REUSE.toml;md5=3D45910de791d599e6ba472f6fa506f391"
> +LIC_FILES_CHKSUM =3D
> "file://REUSE.toml;md5=3D9f87c97ba36aab42411bf93c094a61f2"
>
>  SRC_URI =3D "git://
> github.com/KhronosGroup/KTX-Software.git;protocol=3Dhttps;branch=3Dmain;l=
fs=3D0"
> -SRCREV =3D "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
> +SRCREV =3D "6269d2752ed04446c2d4749f54f3aad4f94555b5"
>
>  inherit cmake
>
> --
> 2.34.1
>
>

--000000000000a692b006535e8466
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you show the diff between old and new text file=C2=A0=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Jun 3, 2026, 9:21=E2=80=AFPM  &lt;<a href=3D"=
mailto:a-christidis@ti.com">a-christidis@ti.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Antonios Christidis &l=
t;<a href=3D"mailto:a-christidis@ti.com" target=3D"_blank" rel=3D"noreferre=
r">a-christidis@ti.com</a>&gt;<br>
<br>
Major 5.0.0 version update. On top of new features, this version fixes<br>
compilation issues with GCC 16 and C++20.<br>
<br>
License-Update: Due to new copyrighted material, no new license.<br>
<br>
Signed-off-by: Antonios Christidis &lt;<a href=3D"mailto:a-christidis@ti.co=
m" target=3D"_blank" rel=3D"noreferrer">a-christidis@ti.com</a>&gt;<br>
---<br>
v3:<br>
- Use of License-Update tag<br>
v2: <br>
- Add reasoning for why LIC_FILES_CHKSUM changed<br>
<br>
=C2=A0.../{<a href=3D"http://ktx-software_4.4.0.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">ktx-software_4.4.0.bb</a> =3D&gt; <a href=3D"http:=
//ktx-software_5.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">kt=
x-software_5.0.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/ktx-software/{<a href=3D"http://ktx-s=
oftware_4.4.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-softw=
are_4.4.0.bb</a> =3D&gt; <a href=3D"http://ktx-software_5.0.0.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">ktx-software_5.0.0.bb</a>} (85%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-so=
ftware_4.4.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-softwa=
re_4.4.0.bb</a> b/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://k=
tx-software_5.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-s=
oftware_5.0.0.bb</a><br>
similarity index 85%<br>
rename from meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-sof=
tware_4.4.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-softwar=
e_4.4.0.bb</a><br>
rename to meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-softw=
are_5.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-software_=
5.0.0.bb</a><br>
index ae4caeb89c..8db0c79b87 100644<br>
--- a/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-software_=
4.4.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-software_4.4.=
0.bb</a><br>
+++ b/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-software_=
5.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ktx-software_5.0.=
0.bb</a><br>
@@ -6,10 +6,10 @@ LICENSE =3D &quot;Apache-2.0 &amp; BSD-1-Clause &amp; BSD=
-2-Clause &amp; BSD-3-Clause &amp; BSL-1.0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; CC-BY-3.0 &amp; CC-BY-4.0 &a=
mp; CC0-1.0 &amp; Zlib &amp; MIT &amp; HI-Trademark &amp; fmt &amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kodak &amp; PNGSuite &amp; ETCSLA =
&amp; Cesium-Trademark-Terms&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://REUSE.toml;md5=3D45910de791d599e6ba472f6=
fa506f391&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://REUSE.toml;md5=3D9f87c97ba36aab42411bf93=
c094a61f2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/KTX=
-Software.git;protocol=3Dhttps;branch=3Dmain;lfs=3D0" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">github.com/KhronosGroup/KTX-Software.git;protoco=
l=3Dhttps;branch=3Dmain;lfs=3D0</a>&quot;<br>
-SRCREV =3D &quot;beef80159525d9fb7abb8645ea85f4c4f6842e8f&quot;<br>
+SRCREV =3D &quot;6269d2752ed04446c2d4749f54f3aad4f94555b5&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000a692b006535e8466--

