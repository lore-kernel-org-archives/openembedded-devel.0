Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D33D0D14E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:40:27 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11915.1767807617945908065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fDc7D+H6;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64472ea7d18so1687903d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767807617; x=1768412417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+V5+7oWe1SFw0eBRowb38a2D+ghVqQPijm9ouxi2kwA=;
        b=fDc7D+H6ZcRHvjIn/UlNzLk2lKCohv93o92wTBfxh5jrfl0bYvooEMHG+kkudjzWlb
         EMetyHyp0tB3Xkgcp4scFcmn4phf5Dmbg57JVzD5LB1lfNDPL1qMD8mRWwBnsQoznjqk
         0s56KNc+cTLdjdM2PFaWZEKeIQGHcf58bJSgg8rcL3y1392+vHD/c8l59CqoFhQegGcB
         Zk1SIX8Ss36obibFCNAzTAxluqXQhhnH/Q+Ska0ineECJEd2UHZHjFDwmp0bwuMCAVUG
         dhIwdjVKbmPxTB8g/J+5ZRNXuEx0zjFKnJpvsG42cgsegaDCZttNO9gZ7hXAiGdPGoxC
         Eqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807617; x=1768412417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V5+7oWe1SFw0eBRowb38a2D+ghVqQPijm9ouxi2kwA=;
        b=sEjoYsa9zwudpjOBLG8eLzIRDx2RNFfhZx8xB0YMBraryb73PoUo3vmGrtg7oKAOtA
         vcaoUx7w/JJ7IFs55BQBeoF0q7Nb/xj/6EuG+TBpGem68qDtFUWiryH11KUZCmwMhEhf
         VHmPbeoKV1v9AbrDPoKco8Ni/nnW6gZ9r0YxA4eyA1S5aGwNHSQ3SczFAOA5fFIVZyIZ
         BPB61OlqfXrY0ssJ0oTgn4uLOSsWhNulkpfZfa+1kd0GCdzQVtzTSiHJrYtP/U/3mg+q
         k3w/KMm2pZOvYVOXH77O2SLKQOP/1JyL3yZy2z3aqFRh0cJ9Ag9DjKkuO0mm93prXEun
         GfZw==
X-Gm-Message-State: AOJu0YwOU0aAJnDEXnEbOLw6/9ehhY8rRCIZYCm2gYEBxuEHQXiHUmYu
	UVNYkFwjoP2I2S6YhU//bA6OrVrhG9xXz5xjUScQrhr/VRCzF/OdrTrduQTlH8dmdb+GFgEgpJo
	GBLTVebxOb2WFPvIAUOxPltvbMd3dclQ=
X-Gm-Gg: AY/fxX6b3MyFdEq2LR8Gypc2rp1zmfwBS5H3MhbDUXP0g3CiHksLiei0mjaBKq1L3Ch
	gbZkpcUZQ78IrOWRC5fDE/2bWlnqCSMutWfTjizi1WYg+35PYEk4hkZQ98f8olR+LPuscdjZZJ/
	I/lMKppbTyIM5dLoj95C6+Yjhggvgx+ggKNiId3J/uAntkh9NJhgegKPnMQdoIVoKUmPCPuiWf2
	lelCKrWUnsdjpaDwtSUIAE7IvdaPo9ZyxxIuxTCuNZstw0Yn8jlWLIb5dgUXTBKPXCiKlrCTMFD
	QQ8mh6zpDm6nreW5c/s1FwqgxFNtudf33aedZwHonA0p07N/64+4PdLb7H9P04aSIw9wUJU7mXF
	kxhwumxMWhMdMvi0rz0+FyON+ZYbBNZ62ROsShKd+Kvl4vA==
X-Google-Smtp-Source: AGHT+IEb2xh3ASx1cgnOKjlrlhm9nVCQjnqjebcwANWQwYnhBMCJEVBk6tTYipYtpvJseGp37RzyFzucGjUb1qne8go=
X-Received: by 2002:a53:d590:0:b0:640:e021:ff6c with SMTP id
 956f58d0204a3-64716b78c18mr1895353d50.38.1767807616917; Wed, 07 Jan 2026
 09:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20260107102855.228-1-wangmy@fujitsu.com> <20260107102855.228-5-wangmy@fujitsu.com>
In-Reply-To: <20260107102855.228-5-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 09:39:50 -0800
X-Gm-Features: AQt7F2qu1IpH9P5tXM-OnGMx0sX9sBol_B80jD5RBP9ORJVzea5-D5LUXmuG4pM
Message-ID: <CAMKF1spSkeMXW8RkvxvjO8bjFVappLtyD_8TFY3zEpasMFLdpQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 05/24] imlib2: upgrade 1.12.5 -> 1.12.6
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009a7450647cfc922"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 17:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123227

--00000000000009a7450647cfc922
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 2:29=E2=80=AFAM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Y4M loader: add support for 10-bit 4:4:4
> - Y4M loader: add support for 10-bit 4:2:2
> - Y4M loader: add example for 8-bit mono
> - Y4M loader: add support for 10-bit mono
> - Y4M loader: fix support for full-range mono
> - Y4M loader: fix support for odd dimensions
> - Y4M loader: add support for 12/14/16-bit mono
> - test/images: Remove intermediate generated file
> - imlib2_view: Set title
> - imlib2_view: Scale image when resizing window
> - imlib2_view: A couple of fixes to previous commit
> - test_load_2: Add new y4m test images
> - test_load_2: Add more new y4m test images
> - test_load_2: Add more new y4m test images
> - autofoo: Use AM_LIBTOOLFLAGS, not LIBTOOLFLAGS
> - gradients: Fix rendering of gradients in larger images
> - imlib2_conv: Fix constness warning
> - gradients: Better gradients with angles
> - Compile cleanly with -Wdouble-promotion
> - XPM loader: Add missing progress callback on incomplete image data
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> index 66e9f8a0c4..c02e497a86 100644
> --- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D344895f253c32f38e182dcaf30fe8a35"
>
>  DEPENDS =3D "freetype "
>  PROVIDES =3D "virtual/imlib2"
> -PV =3D "1.12.5"
> -SRCREV =3D "df73df52ddf0e1ea40507f5ee8c6b794b328b3bc"
> +PV =3D "1.12.6"
> +SRCREV =3D "8c6a7640c91d7815a6318d3641554869c62cc926"
>
>
If we are bumping SRCREV from release to release then rename the recipe to
represent version in it might be
better.


>  inherit autotools pkgconfig lib_package
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123203):
> https://lists.openembedded.org/g/openembedded-devel/message/123203
> Mute This Topic: https://lists.openembedded.org/mt/117131892/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009a7450647cfc922
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, =
2026 at 2:29=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lis=
ts.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &l=
t;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.co=
m</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Y4M loader: add support for 10-bit 4:4:4<br>
- Y4M loader: add support for 10-bit 4:2:2<br>
- Y4M loader: add example for 8-bit mono<br>
- Y4M loader: add support for 10-bit mono<br>
- Y4M loader: fix support for full-range mono<br>
- Y4M loader: fix support for odd dimensions<br>
- Y4M loader: add support for 12/14/16-bit mono<br>
- test/images: Remove intermediate generated file<br>
- imlib2_view: Set title<br>
- imlib2_view: Scale image when resizing window<br>
- imlib2_view: A couple of fixes to previous commit<br>
- test_load_2: Add new y4m test images<br>
- test_load_2: Add more new y4m test images<br>
- test_load_2: Add more new y4m test images<br>
- autofoo: Use AM_LIBTOOLFLAGS, not LIBTOOLFLAGS<br>
- gradients: Fix rendering of gradients in larger images<br>
- imlib2_conv: Fix constness warning<br>
- gradients: Better gradients with angles<br>
- Compile cleanly with -Wdouble-promotion<br>
- XPM loader: Add missing progress callback on incomplete image data<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.b=
b" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> b/meta-oe/recipes=
-graphics/imlib2/<a href=3D"http://imlib2_git.bb" rel=3D"noreferrer" target=
=3D"_blank">imlib2_git.bb</a><br>
index 66e9f8a0c4..c02e497a86 100644<br>
--- a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
+++ b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D344895f253c=
32f38e182dcaf30fe8a35&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;freetype &quot;<br>
=C2=A0PROVIDES =3D &quot;virtual/imlib2&quot;<br>
-PV =3D &quot;1.12.5&quot;<br>
-SRCREV =3D &quot;df73df52ddf0e1ea40507f5ee8c6b794b328b3bc&quot;<br>
+PV =3D &quot;1.12.6&quot;<br>
+SRCREV =3D &quot;8c6a7640c91d7815a6318d3641554869c62cc926&quot;<br>
<br></blockquote><div><br></div><div>If we are bumping SRCREV from release =
to release then rename the recipe to represent version in it might be</div>=
<div>better.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0inherit autotools pkgconfig lib_package<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123203" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123203</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117131892/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117131892/1997914</a><br>
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

--00000000000009a7450647cfc922--

