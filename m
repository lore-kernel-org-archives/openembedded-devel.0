Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C0CC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 13:49:48 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.21598.1713188980812325804
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 06:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QY0S1fx/;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7e81870648cso509242241.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713188980; x=1713793780; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=chAiRiXDkHinXH8N7xxHyS/nQ4KRd4OCVSFAsGLltYU=;
        b=QY0S1fx//t2Lt3nV8Cijy8hlyoKKUmikKYVLN7i9PiT6LTaYW++6YJZLB+SP5GC2Cy
         uf7zN7dVArRXUwhdAY+Le1uAilTjPM8+KiaZcJj76zfufID35H4h0zWoTY7zld2a35Gr
         f7w7S9MAZ74LOZHMPBAeADSZIOw7SFC/cRvMLm1Xx4wr4ZYRIBwtJ10XVO5ECcJeTrxs
         a5qWZy1dnDatqwttJzuRyiFjrnPIvtqr/0sakpT6leSeOYIkEbnhM3VWq9CD64/q9kMr
         pnoAk9hDLE6OjGsmsyoyksMLVGH1opqc2HvPi3wOHN94JzpGs/SFKFmVSikC6QkYPnl0
         HJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188980; x=1713793780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chAiRiXDkHinXH8N7xxHyS/nQ4KRd4OCVSFAsGLltYU=;
        b=aCWNyWYFt4mmGawPFTn6pDGpBb9EYeDlNCHqkACwKGbLYdUlzBVaGRbUxnp2+JAFl9
         L4K9MrZOvCRaTDNdFVJjEGlDWZi/p6aLXLCHsZSbjUrE6cTLJCYZpP9P6Ajsg0jENv4x
         nWYzgXCdMtIPwDHk80GaQE9C17KgibFzi7JClxfWKnl/XEnYiShxmivY789/8lUw3gC6
         FjMUREH6bKDEK9dh/VVqXCLDB0gUbd7yWad96L5Okm1U4LK1g/LFJaETU9VA8J5ZxGfS
         F9Ja8bsyGECwVRjeS4PdGFo6pvbCxDz8cxWiTiEr56RGDkvLQYf+KxPDssGa1xlA19Py
         bLmg==
X-Gm-Message-State: AOJu0YzYBNfblPiXHx2LPQe/xElMUbzG3jxn2TyQPJxzadShRpLAkxcE
	lcWb8mhIj22WBm0Qlsj+02ZvlQvSkeOo8OUt6KytBhP9Ayuhc6ULR86/JRaOQGuAR/Fvjul0tK8
	KPVKlKCkPDAQaUjIKkxp/VFpZ4vc=
X-Google-Smtp-Source: AGHT+IEm8il7LgY2i0o2IKY2SBvRR9JGjAaiM4IkdOWYXpm6IXcdCiEKBsgLwEyFmAyegDgZg9jy3qV/wCUlAikJ7a8=
X-Received: by 2002:a05:6102:4b0c:b0:47b:8c67:7d1c with SMTP id
 ia12-20020a0561024b0c00b0047b8c677d1cmr1315464vsb.6.1713188979610; Mon, 15
 Apr 2024 06:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de>
In-Reply-To: <20240415131443.7295-1-marex@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 15 Apr 2024 14:49:28 +0100
Message-ID: <CANPvuR=KbhHUzs33CHSNut2Nx=fFLLu1NpMxYcJBM652DQ8bdQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: marex@denx.de
Cc: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com
Content-Type: multipart/alternative; boundary="000000000000902fda061622e41e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 13:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109962

--000000000000902fda061622e41e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Last commit on this layer was done 2 years ago and it was at the time to
add Kirkstone compatibility, nothing more since then.
Python 2 is dead since 1/1/2020. That means that we (python dev) will not
improve it anymore after that day,
even if someone finds a security problem in it. You should upgrade to
Python 3 as soon as you can.

https://www.python.org/doc/sunset-python-2

In my opinion the OE community should no longer promote its use.

Jose

Marek Vasut via lists.openembedded.org <marex=3Ddenx.de@lists.openembedded.=
org>
escreveu (segunda, 15/04/2024 =C3=A0(s) 14:15):

> Support both kirkstone and scarthgap as that seems to work well.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 38ef579..0f228ca 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D "1"
>
>  LAYERDEPENDS_meta-python2 =3D "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone"
> +LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone scarthgap"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109961):
> https://lists.openembedded.org/g/openembedded-devel/message/109961
> Mute This Topic: https://lists.openembedded.org/mt/105535514/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000902fda061622e41e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marek,<br><br>Last commit on this layer was done 2=
 years ago and it was at the time to add Kirkstone compatibility,=C2=A0noth=
ing more since then.</div><div>Python 2 is dead since 1/1/2020. That means =
that we (python=C2=A0dev) will not improve it anymore after that day,</div>=
<div>even if someone finds a security problem in it. You should upgrade to =
Python 3 as soon as you can.</div><div><br></div><a href=3D"https://www.pyt=
hon.org/doc/sunset-python-2">https://www.python.org/doc/sunset-python-2</a>=
<br><br>In my opinion the OE community should no longer promote its use.<br=
><br>Jose<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Marek Vasut via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;marex=3D<a href=3D"mailto:denx.de@lists.openembed=
ded.org">denx.de@lists.openembedded.org</a>&gt; escreveu (segunda, 15/04/20=
24 =C3=A0(s) 14:15):<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Support both kirkstone and scarthgap as that seems to work well.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index 38ef579..0f228ca 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-python2 =3D &quot;core openembedded-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_meta-python2 =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_meta-python2 =3D &quot;kirkstone scarthgap&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109961): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109961" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109961</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105535514/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105535514/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--000000000000902fda061622e41e--

