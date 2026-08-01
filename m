Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4566CC55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 15:41:11 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7814.1785598864739325563
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 08:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mcAYCsHF;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81f52945098so34536627b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 08:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785598864; cv=none;
        d=google.com; s=arc-20260327;
        b=cDtwvP/tPcKtT52ngdF/7xuRlVjAWhgdoZzW3PUBG752t5m/onpWVXV7EZ0DoZS9Dl
         afnnqWT3kGsvJjixVNfxzqRzUWMmImScCDb0Z+804m3BlJ1xzIIRYnU1r7Vh7FqUzYQO
         wlFv5Oeb67akHxNhYq9cb89E+j1t92Etn+fWLwEI7tXiGgJzp+FOEpRR6KAI4IJvvzd0
         dPOsR3pYSwqgF1Hb3uM8rqf+7Q3qVkH1s7zgFwf6kCcvuXfh27CRdZ//88xSuqyIbG3y
         jBWD8tJsk6VO9tC9jyAGc+KWQFB1TmDxyndS8g8ebBmTLWulMkJc3zxMGmV7wYaztNx8
         lPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JvS2wI2DelDUc3+FYE6iiX0F632OwydgwoBloSPIPf4=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=jHKDCMzrXwz2iY/kwEXWKoGN9y+l8PxkN5SF5KVD32dKzMejLuOCPElEqq9GSfTGKI
         Rh0Gcr0N0EZkKEuEhEgxB7Mpy2AJpQtRb+mQxIhRQ0J5S58SmTLNMT9ZCt8ha+1WsPm5
         OeaThzsRsj1ZrNM+FGa0bC+/sMPaVpF+ivFS6loFhFBXR6Edlv+IqeL+74fCnasMI3qD
         Mbf69WGaJiR1lDh7tIAVZH0l7QfYRfyMdJRSEOuECLYgOdzAVACbrla81ruYp5QdL9uo
         UcqS+0UGBp/xLvNm2gidOVI2kIXRGta2EvtSKR3wWigTVDO1H8fkumKcnQ25nBVLvzDh
         6LMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785598864; x=1786203664; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvS2wI2DelDUc3+FYE6iiX0F632OwydgwoBloSPIPf4=;
        b=mcAYCsHFb7EYCagJiu1fdv+xMRQwFppijbGVxHuDXJKGZfbG3LHbyI1IdVwtyihuRg
         kuZBTLHBNxbL1nfWIvXKG3wiSj3BIVOxHS1i8PnaLAjua+60RLurw8e6VvLx4gBYkL43
         kSjUPgqJDv9778AQMvldEDit758CufhpirWWmIkztAEOlM7Yk5RY09xmp9VgmPqKY6QG
         AApG/LtaTMh0NVmpBT2kGhp9FIqFw1OvLj7tY32TXN8pgkHWp7tTe5bd4XZzwgixZ3Tk
         4jzeBra5ljO5kgpPKUPOl6u6W6fV+hncaWOF7vPju1vAW4EXFfme2pBsCwWW5oziHfZ6
         nQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785598864; x=1786203664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JvS2wI2DelDUc3+FYE6iiX0F632OwydgwoBloSPIPf4=;
        b=b4mavlk9uASt6F3QpTqbkD6vqzBq9OywEFz5FLOJOs6S9IXpzRoIdQWzy/+tuFGDkh
         3CT+VcvO4m02ucFC3G7fdMHihaQth/mwyf7nkq5vOv6FEMH2JROL7T16qOw8USIfGhjT
         GcvkS3v+M7tjw1iI4i7lox42aoSbj9e+oqvS37kCeYCMEeo3G0QSuEw/y2mmynDRtFk3
         2GeuNG1Gb2mMa3AFx0g8sKUnygvS0uMbTJQqycbRaZc4IQWrVXjMzCO/8+EL/BzNDxX0
         JqG/37dA2YSSDr021/7+DmjrudM7xO7zy5VSs3ezWmn6GlOg1V2M8psWoa+SEorcKcIZ
         rZ6Q==
X-Gm-Message-State: AOJu0YympKEBPUDQRWv0Mnh+EBG9ODZalJPbuqL4Pg+mg97RIiQNgb4e
	O/Xze68Ga3lnUnSJ1wdpCE5JEtTOjto8a9q7m9QK2N4s5UDHhRxSxmQhysLGs/6WJMVggW7LJV7
	LAbLLx8wYamrzyoY1EZZJBzrGjgMUKb4=
X-Gm-Gg: AR+sD11sMn3ori9L/GTrEpct0RXFQRILrH4ralhjuVm7/Ck9kZkRV2ySMOZGgK6IqZg
	CMimdKdB1w8LWvnMEihA2N2WqFTWsACEoUhnIS7fDmnqNYnI/IweespiuS8T8Mp+oXBrXs6n0so
	JAk6HkDW8ZcFmj/FejsBNkifLsZUx082U0G0W+bnTdOwCvpsNReTmSLeXHk2gvVdM8IvrXmbBoZ
	vcVmjXBbXaSAl5LvMeSG0s7GaGfsM9/EOUq4Ska5Hw+MKSDz5xP1648a76vRj+yqcLgQRWhZ4Xb
	BmCjyVQ/E43ZEQXwHlHfyJo4RIgTLHAMtmF7ra7ViN3b3E2zJlak1K4efUD5G4oV+XNI9IbzuRi
	H+de5YF8JOj+jkFN7uG2Wgc5w0mZMO9656Gnqov72qrXyM1hbXgdk9wYpFO5g4K4FaM2zTh+IBo
	pU3mQQQ+4imwMTu1WKsAaJt6FoIxZ6ez5CBIvdDYkNcHs=
X-Received: by 2002:a05:690c:9b09:b0:81e:c95e:2be7 with SMTP id
 00721157ae682-81fd4d36466mr61023447b3.3.1785598863639; Sat, 01 Aug 2026
 08:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Aug 2026 08:40:34 -0700
X-Gm-Features: AUfX_mzeX3F1DH9OufIljeeRZnHq5dkWexHfyXslS7QFt9rTz2Iw8fTGcWyDQ9w
Message-ID: <CAMKF1sqfU+AADR--Bria3NnKDCnKbV7Lux1ESx4ccGTx-60tPg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/20] imagemagick: upgrade 7.1.28 -> 7.1.29
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa86250657fe2132"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 15:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128615

--000000000000fa86250657fe2132
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please rebase this series on top of master-next and resend please.

On Sat, Aug 1, 2026 at 6:11=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../{imagemagick_7.1.2-28.bb =3D> imagemagick_7.1.2-29.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-28.bb =3D>
> imagemagick_7.1.2-29.bb} (99%)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> similarity index 99%
> rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> index 7fd34dc54c..0890edb8c5 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "git://
> github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt
>             file://imagemagick-ptest.sh \
>  "
>
> -SRCREV =3D "c2068fb3394af17fb9e3a78c712af2ca67141836"
> +SRCREV =3D "360eda553586e389c9c725fc49df94f209a8a3c7"
>
>  inherit autotools pkgconfig update-alternatives ptest
>  export ac_cv_sys_file_offset_bits =3D "64"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128595):
> https://lists.openembedded.org/g/openembedded-devel/message/128595
> Mute This Topic: https://lists.openembedded.org/mt/120549559/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fa86250657fe2132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">please rebase this series on top of master-next and resend=
 please.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Aug 1, 2026 at 6:11=E2=80=AFAM Ankur =
Tyagi via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:an=
kur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br=
>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://imagemagick_7.1.2-28.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">imagemagick_7.1.2-28.bb</a> =3D&gt; <a href=3D"http://image=
magick_7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-=
29.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-28=
.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-29.bb" rel=3D"noreferre=
r" target=3D"_blank">imagemagick_7.1.2-29.bb</a>} (99%)<br>
<br>
diff --git a/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemag=
ick_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-28.=
bb</a> b/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagick_=
7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-29.bb</=
a><br>
similarity index 99%<br>
rename from meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagi=
ck_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-28.b=
b</a><br>
rename to meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagick=
_7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-29.bb<=
/a><br>
index 7fd34dc54c..0890edb8c5 100644<br>
--- a/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagick_7.1=
.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-28.bb</a><=
br>
+++ b/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagick_7.1=
.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-29.bb</a><=
br>
@@ -17,7 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/Imag=
eMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protoc=
ol=3Dhtt</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://imagemagick-ptest.sh \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;c2068fb3394af17fb9e3a78c712af2ca67141836&quot;<br>
+SRCREV =3D &quot;360eda553586e389c9c725fc49df94f209a8a3c7&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig update-alternatives ptest<br>
=C2=A0export ac_cv_sys_file_offset_bits =3D &quot;64&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128595): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128595" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128595</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120549559/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120549559/1997914</a><br>
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

--000000000000fa86250657fe2132--

