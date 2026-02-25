Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF133F357D5
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 06:51:59 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40309.1772002309766661805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 22:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qto2q21m;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79801df3e42so7815687b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 22:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772002309; cv=none;
        d=google.com; s=arc-20240605;
        b=WtWxFCgoXA3DEkWhyrmcSx8KoEjk6T9ZtT8dL83/ShM2ZPh3QMa0gpNS5zBl3ftk3C
         DkvR/eQTPuXg/dFx+EX/uSc/V97qTdMRIQ9DzNLkIOr9xa44cEFrBWc/U7EFN1xkpSH5
         uzj4NgvMjdMG6455QPp2AoA1Yv1sSo6SM77x+gZav9TsNPUAensQbV9unc5ml9v+ohjf
         cFiJBlE1t6OX1L8u0zW3py1ZfCLO4WLeF29qSHDXNYyJttdLB+5qCnR4qpnCM8ge08qA
         /Dea4ABUrdaXas+6/u+LZ9+v+kRn1dpye5KeXDPlNRpO2JV8Si5RxqSyoQxebY0a6ojF
         A87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XvfHJJXAnAIMv4HIdXIzwgRI8Nm9v5hlRZcmzjAc8XM=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=TtX3Hvu/j9Ag9CcZ4nXQnnNaZ8pQgtLbCvPA+kov36Pq10A2utPXxATLZMihKNFmmt
         P39bsZKAHR8vw0FHI/Wqg+hVD2HmYS3TOop/4gOp8mnozSCfUHQ+Upnen51zwOJ9vmH4
         FqNBbLbG+tgxbO0baJbKTMe/i3ATs76rrzoA2sIFcL4YGqtUYismo1ShciMgaYfJ+ki0
         hE0Ep1yCxXOenGq8gADWu71yPVJzM9MGOIjO6+DGtly8SP1MXytseSxQg33iQs7uR+q+
         Dq0ivWz4vQRb791vHjOukYO3Js76oW6M5TACZaaEOK16EYZbH9HLbAq7m2jQdp65gjUE
         nOzQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772002309; x=1772607109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XvfHJJXAnAIMv4HIdXIzwgRI8Nm9v5hlRZcmzjAc8XM=;
        b=Qto2q21mnbW2NnSywelQe5ciNB6OeeZa82h+6iPYApO+lCWuBdrzW6/Cc8Tsu6Igfa
         wOcFzXsSjV//YnEzmagFJAlvzUYp0XTxbK1KZ82PQzAMtRsirBv/LWA5PQp+Rx7J+ght
         gHjNpTXyw3Lekot27I/frkozBdxwJ70hIcsx9bhUI5YVNVyoIpB4xMDojlzL0cYnTk5T
         8vwvTPUVu+7T6FahaR45YMzqcwTtbz9buy+8JfxfBW+LBoSa3bJcmJuUgKcqFCdoQCAS
         yY6mL/Kcf0szwCfwTkAkio7ftt29nAoi0brByqCrpeChx4DyxHsvsUwyH/GsJOXvQCnd
         wI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002309; x=1772607109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvfHJJXAnAIMv4HIdXIzwgRI8Nm9v5hlRZcmzjAc8XM=;
        b=u4aV9MO/xw+VPTZethAhKUzplZ+BDONIMK/t5yjgzJ2wmKcGs1uvjrq8W+izIbRT2A
         ylnGA1aFW3srO8gC///1Cxa+y3B7/TDQhMJHh36Ma8bEiiym7z6SZaQRUUhoamL4O6Zj
         M3K0LP9fcl1s8Lc21gDOm50HzGmcFz3KbkH3AQiynKceL1a1Vn8PcG8JnqBYjS2AEuyy
         YKDWysYsHNNL+3ebcuGbPM4jxu5t9lhDiS4TrMVoOj4Ylw9QE+SvLwynRkcOgoax5PRY
         wxQV+5flbfzUWMeO864QSXX7fKbNg/4ESkRjb5Vkr9eePZLGgp7+oM/X63aleXYYHF/P
         skug==
X-Gm-Message-State: AOJu0YyiPCkgiGjeNTdNXaA5Y55ATZ/eD8HX5p4sWS+zsnc+OdQEggEp
	nNFU8tPycEm+kqyRx7kyFq/fWXf4n08Hea53sdAKBGrx81+iMrw8nRWeHY8q0BU562sptPtyhrL
	DluDPlWqf/V1nbBqDUlQTMaH/ln3CJBM=
X-Gm-Gg: ATEYQzyCFZn3lB+lq7qpqhwdk2OLhbWR00N6y9WyNJbyyPNJw2dVbc+d/gQlQ7PN9rX
	PzNviICFkNJpFzuVarOQFovkxenMAmor0ywGgT3e7a8B7B1ZaZNovlAkYUY8cUyX3tj+wm+H1GX
	fovTOTGR5XMW149gcEWBg20Q6Um3wTMp4XBu9cPDnjlFizwJyE3X598OcofP4RarAfS6vL8Bcri
	8ZF5K5sYA1WocHubMe2CB7XcIp3j/0Pk05avLquMwNl8Eq7NeYRRwJlaVHMRB/wYmynxgVVRvA5
	XAZtEiW9iCDnNDROFTz1+R+MsTHxGJv43IIqvavRwFtSAczWmC/KhimARvFWCtn5q2n27j4uqyQ
	ZY+03sYtOswLvZGCqMwy4+hY=
X-Received: by 2002:a05:690c:9691:b0:798:5bb7:4982 with SMTP id
 00721157ae682-79865048c01mr23846397b3.16.1772002308740; Tue, 24 Feb 2026
 22:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20260225063735.17946-1-f_l_k@t-online.de>
In-Reply-To: <20260225063735.17946-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Feb 2026 22:51:22 -0800
X-Gm-Features: AaiRm53J84T8fIGmV9rSRYKgMj7nGAeiG75evhUo-A4_QFYL8jWmnQ5OB79dcGQ
Message-ID: <CAMKF1srUO2mtiwjiZWS5N3v5orW8KeKVPYvF27JrO+oBte5OXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsdl3-image: add PACKAGECONFIG for av1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002759fa064ba07042"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 06:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124610

--0000000000002759fa064ba07042
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had reverted the previous upgrade patch. So please squash this one into
your original patch and send a v3.

On Tue, Feb 24, 2026 at 10:38=E2=80=AFPM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> - libavif is in meta-multimedia -> dont enable by default
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
> b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
> index 5d6c1cf21b..324332eb84 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
> @@ -4,13 +4,16 @@ SECTION =3D "libs"
>  LICENSE =3D "Zlib"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e9cf81bb7f43dbf7"
>
> -DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp libjxl libavif"
> +DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
>
>  SRC_URI =3D "git://
> github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;branch=3Drelease-3.4=
.x"
>  SRCREV =3D "ad58ecfc27a1bd09e510ceff8bbbdb1094806476"
>
>  EXTRA_OECMAKE +=3D "-DSDLIMAGE_JXL=3DON"
>
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG[av1] =3D "-DSDLIMAGE_AVIF=3DON,-DSDLIMAGE_AVIF=3DOFF,libav=
if"
> +
>  inherit cmake pkgconfig
>
>  FILES:${PN} +=3D "${datadir}/licenses"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124608):
> https://lists.openembedded.org/g/openembedded-devel/message/124608
> Mute This Topic: https://lists.openembedded.org/mt/117990968/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002759fa064ba07042
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I had reverted the previous upgrade patch. So please squas=
h this one into your original patch and send a v3.</div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Feb 24, 2026 at 10:38=E2=80=AFPM Markus Volk via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mail=
to:t-online.de@lists.openembedded.org">t-online.de@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- =
libavif is in meta-multimedia -&gt; dont enable by default<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-image_3.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.0.bb</a> | 5 +=
+++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-ima=
ge_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.0.bb</a=
> b/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-image_3.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.0.bb</a><br>
index 5d6c1cf21b..324332eb84 100644<br>
--- a/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-image_3.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-image_3.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.0.bb</a><br>
@@ -4,13 +4,16 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;Zlib&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e=
9cf81bb7f43dbf7&quot;<br>
<br>
-DEPENDS =3D &quot;tiff zlib libpng jpeg libsdl3 libwebp libjxl libavif&quo=
t;<br>
+DEPENDS =3D &quot;tiff zlib libpng jpeg libsdl3 libwebp libjxl&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/libsdl-org/SDL_i=
mage.git;protocol=3Dhttps;branch=3Drelease-3.4.x" rel=3D"noreferrer" target=
=3D"_blank">github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;branch=3Dr=
elease-3.4.x</a>&quot;<br>
=C2=A0SRCREV =3D &quot;ad58ecfc27a1bd09e510ceff8bbbdb1094806476&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DSDLIMAGE_JXL=3DON&quot;<br>
<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
+PACKAGECONFIG[av1] =3D &quot;-DSDLIMAGE_AVIF=3DON,-DSDLIMAGE_AVIF=3DOFF,li=
bavif&quot;<br>
+<br>
=C2=A0inherit cmake pkgconfig<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${datadir}/licenses&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124608): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124608" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124608</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117990968/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117990968/1997914</a><br>
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

--0000000000002759fa064ba07042--

