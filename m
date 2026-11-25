Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34116.1795573005018636686
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 18:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=A9EgZPq5;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c246c0c60so4614179d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 18:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573004; cv=none;
        d=google.com; s=arc-20260327;
        b=NL2ZelIY2uCGwbvwPppm9R/D5/RcBrAj85LaXGoE3m+tcLk4/GjMSTy541xN07Ma+P
         HbYDA+sEv65LrAE+7eG0N2tVadZXVUPMT0wpaGhXZ1R92Ab0tb/hgVuTyH5WCw5xS01L
         jMupGzu6HrB9K62KntzbxW/MEA1UT5PToq9fFemAuQ8GADy6kIl8t6B//w/GHK++ebeI
         sGGHn/ESt2q59pgNED1Q/8x+XxaJj6eZN9e2aKW7/JK0ooBtYJi09bVPNNhQ2qEcqMPD
         j7YAu3789ej4Ha7veROifgtKITeL5pZy1xn1kl64qAsNx2qcm7LRzJyw5S3DJ0bOVU4C
         4pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hw76LW1ND68ac+Aw5F6qoAXz4UBI/7V6ev9Rs6pSEL0=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=obVpJ5vsFAwB5yEBxOZa4udwr+8nvBuJPNzRytrghfyPMPtQZpwMJ8lVSGeZJH71G0
         qU7R87VPKfNQi/lWxCM0h5KIaUqz0Xb+e9ZX/0FG826/zmDO3oS8tY8+Yv+7dX5+sMbj
         AOZA1vgA4MhuJo6GGje3rASt+t7Kmn4QjRulDXBrNYhnw3T9jx8inrQjS7mtuYW6At3z
         0A1Wx0Ts5TK9753kzQpgAr5vPBI1pBDX/oKXJ4NMiwYuQoQ565le5RG7ydoYL6ah4Vxv
         Qfc12ox7Z6btv7IOcYg25tA0wCddn5thdZNSmlqotMnkgLyVvU1UPCcOvPQGV0nQoNdz
         yo9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573004; x=1796177804; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw76LW1ND68ac+Aw5F6qoAXz4UBI/7V6ev9Rs6pSEL0=;
        b=A9EgZPq5ZEArB8NCeGH+FXJCYS1zN/v1xdBblmWHBioYT+X+v19ws+ydZwT6Uo1dGC
         meW6sNsrl5MEO9kWOZl4VRO1djScy5FQsarqH4kZv3t40Y5+2rIk1FUyYWOGrlYI8bKe
         8wkFVrnMrabN8FMjrN2wCMxJgZT0bGa4BPzL9W8Bn1L0taTFPr/7GPVNb18l2cGDNTZo
         geml/c22Lc9hbE7VbyjgeUlliO9gPKCibx1Wr88uI3oI1pZT1gpIvA4T0QOmWb22j8sZ
         g0W8UwjTAAL3O4BV84P4C1Yvxhdj8ki+1K/uXXf7YDrgS/1vqjAkV9EYao7voBMSLQw4
         4a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573004; x=1796177804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hw76LW1ND68ac+Aw5F6qoAXz4UBI/7V6ev9Rs6pSEL0=;
        b=EJIjGwAwpaRPryNAWiRepI+sz7REsItvi2HVdbOcsp7wZpKjGleokc9oJyVQraixy5
         TFW/cpECB2MJx218MxfSHrUxmjmrNhe+GolBdY2gWDYG6lWlcLg4yMX6bTHOixl0nmHt
         CtyXiAj5B9FlN3ekoa2oHwwOw1aSafDI7FoItieKB+IgY469DtD0S5injLSzyVOspkVM
         5/PWq7dlzhh6NHCIVmpoXRGC8eDPo3sB6KjMiFxyF5RoMW1EB1FWwV2x+A2A46qDTh6D
         wEw8WtM/m4FEOiHIFMEit+DciKNZ2zvKdR4h8hswbBLWPsSFGJSCqhoR5fWNiXrzBHPE
         Jw5A==
X-Gm-Message-State: APuU4Z/PvztVoPgssLcOcNaZo4X57j78tims8n43z8xic0Y/0xrT9rp1
	IdFKT6K3HFAm8M3qTrsPFbUPe4c6t/9r0zcCsVFjam9p6Tp+qNSsvzO2YyRpeOL38UiJgtC82u+
	u3aeU31GDsIzLS9FwZVOhqBBPolbE9iA=
X-Gm-Gg: AZFdTZcNTxJSKm74ow4RT1QwrqQq+oIXleEsrMuOv1NzPTNeO5hLOgN2jAFcgstYS9h
	EnKcMUmD97DxPyUkKTwTJH3GmzcM6NNb/bs6exE/XzhuR/k0BiGcR2SJRud1yRzW/u6jlqcS7kO
	WM4JvUxr9chNJ2G7LOlVWB3/Pz4TiAzqmBWyKy3IFvkWCqJPoTW/a5gVb5F1f9HTBhDzBseDtmK
	fd5KC35mcoDHSvtMmCI7douiKEWfkk+IOvI47y7yBpuVGXEspInJOIYMuQMulIscaSGRrJRIE2H
	cWhBKiPv7QT8yTup9bIH8Yzmdcxlt4uMbXUx5VPH5kZIYhG+6zYbtqLfJSBBpLNT+I9qS2n84FD
	ADzwJ6QnnSez3F6cnY19isbmXWBvL4gEliAzv6tV8MwDHEBIMyzYqbRveR+d7Ou5liSksKDdsYf
	++ontbwS2kHuSgt9hErBgRySLIoasW4/eHX8iTcC1XnWqGRxJsqePe46iYOaEOB6Bl65rbnB6Pu
	07MYTuRnzovvFshj725ojxqfR5TsTXvcLZMJ78sqKXquUJWYQd8acyhKIpz6DlTpr5FgTfebhHY
	zh5nYFiohTo0+WwCsPWP7Gzx0r1OEjryZs/6yPN8pvaXJcMtDcMybZ5yJrRuXdcQa86SgexQn6R
	CIxE993a/EOl5g2FyLD2OYg==
X-Received: by 2002:a05:690e:4394:b0:677:b7c3:12c3 with SMTP id
 956f58d0204a3-67df447e63amr3428620d50.29.1795573003895; Tue, 24 Nov 2026
 18:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20261125011338.871556-1-schonm@gmail.com>
In-Reply-To: <20261125011338.871556-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Nov 2026 18:16:17 -0800
X-Gm-Features: Aa3M54pAf3PN2LQ9eoV-p5rtW97A2JXa0pb7pDnKXOO7JPpMHEtfwX5f049z07I
Message-ID: <CAMKF1srk-s7fAW1ky3Rxo5S8VjGvmjSbvyPGu9g=BDc9gO8Xbg@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH] libmine-types-perl: fix HOMEPAGE
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000010cac40661106b5e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 02:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132963

--00000000000010cac40661106b5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:13=E2=80=AFPM J. S. via openembedded-devel <schon=
m=3D
gmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
> b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
> index e6a72577ba..1fd9b71521 100644
> --- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
> +++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
> @@ -5,7 +5,7 @@ is transmitted. Sometimes real knowledge about a mime-typ=
e
> is need.\
>  \n\
>  This module maintains a set of MIME::Type objects, which each describe \
>  one known mime type."
> -HOMEPAGE =3D "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
> +HOMEPAGE =3D "https://metacpan.org/release/MARKOV/MIME-Types-2.30"
>

I wonder if its better to use https://metacpan.org/dist/MIME-Types and make
it PV independent.


>  SECTION =3D "libraries"
>
>  LICENSE =3D "Artistic-1.0 OR GPL-1.0-or-later"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132962):
> https://lists.openembedded.org/g/openembedded-devel/message/132962
> Mute This Topic: https://lists.openembedded.org/mt/122439189/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000010cac40661106b5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24,=
 2026 at 5:13=E2=80=AFPM J. S. via openembedded-devel &lt;schonm=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail.com" ta=
rget=3D"_blank">schonm@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-perl/recipes-perl/libmime/<a href=3D"http://libmime-types-perl_2=
.30.bb" rel=3D"noreferrer" target=3D"_blank">libmime-types-perl_2.30.bb</a>=
 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-perl/recipes-perl/libmime/<a href=3D"http://libmime-types=
-perl_2.30.bb" rel=3D"noreferrer" target=3D"_blank">libmime-types-perl_2.30=
.bb</a> b/meta-perl/recipes-perl/libmime/<a href=3D"http://libmime-types-pe=
rl_2.30.bb" rel=3D"noreferrer" target=3D"_blank">libmime-types-perl_2.30.bb=
</a><br>
index e6a72577ba..1fd9b71521 100644<br>
--- a/meta-perl/recipes-perl/libmime/<a href=3D"http://libmime-types-perl_2=
.30.bb" rel=3D"noreferrer" target=3D"_blank">libmime-types-perl_2.30.bb</a>=
<br>
+++ b/meta-perl/recipes-perl/libmime/<a href=3D"http://libmime-types-perl_2=
.30.bb" rel=3D"noreferrer" target=3D"_blank">libmime-types-perl_2.30.bb</a>=
<br>
@@ -5,7 +5,7 @@ is transmitted. Sometimes real knowledge about a mime-type =
is need.\<br>
=C2=A0\n\<br>
=C2=A0This module maintains a set of MIME::Type objects, which each describ=
e \<br>
=C2=A0one known mime type.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://metacpan.org/release/MARKOV/MIME-Typ=
es-2.27" rel=3D"noreferrer" target=3D"_blank">https://metacpan.org/release/=
MARKOV/MIME-Types-2.27</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://metacpan.org/release/MARKOV/MIME-Typ=
es-2.30" rel=3D"noreferrer" target=3D"_blank">https://metacpan.org/release/=
MARKOV/MIME-Types-2.30</a>&quot;<br></blockquote><div><br></div><div>I wond=
er if its better to use=C2=A0<a href=3D"https://metacpan.org/dist/MIME-Type=
s">https://metacpan.org/dist/MIME-Types</a> and make it PV independent.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0SECTION =3D &quot;libraries&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;Artistic-1.0 OR GPL-1.0-or-later&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132962): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132962" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132962</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122439189/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122439189/1997914</a><br>
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

--00000000000010cac40661106b5e--
