Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209C9C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 15:53:43 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46427.1785772417501619411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 08:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ll+EUwc0;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66825847b2cso3765553d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 08:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772416; cv=none;
        d=google.com; s=arc-20260327;
        b=MGD2CVrMOOlCk7terdZyc7EHBXWr0tTrfwJ6ejkBeh/EAV61uSdfI3YkDSDbjwvM00
         uiKstIAm9HIQaX+v2C5wcwiyMHnW5ZJWg9usAL7HmEx8khGhXLtAvXxgSAsSf+JqwlwB
         2+X++B2EU/6u6BwwMAh4E2zUxwFrWP6ma31TLnfMEK0pk1mzV7moWyUSiKHFyZiy/sXo
         1SAguxGULQf0+a8xoqR6ghzLdDoJrlGZomI+4+tMQ675YXhWee3LxfYICQsg06qt5Pen
         XL3TQPR3XqHk+bpB7TeGMBZDM2J40+n7VSMfTciRRbJYy0KPsxIl4SDdYr25A/ds+ZPs
         rrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PoPfHG9x0EvPh1KZnCTAOP1zGi2bN7IiLVz5iEv2WOc=;
        fh=B8F3lforaWXqCOLcYLVP4hd84u8I8RwmQUzZM4ZNJEc=;
        b=CTQWDN/ZH3ROraf4zY/U5ppVpHHkX6+U0mF4D1gBtx7SlYDYGN58iTR0W9QFztRts8
         Ap9dwYrgpLCQGhwuk2ARYerRDkT1Sa9Snm33AQEAWapeXWzpWpXpzjsfMIyzk7qvWUHB
         +g8pLAfn46i1ZHX2g3Y87/+mXIthFRHzGwwd9+g3PBAwJ87zOK68FSlsRO6a84ry1ZaS
         CdH8kBMue/TDQQgATUN5g0Nf53A+4kWrhb4rOHobbKsu6vZ6+BPHqUsaME0zBaLilEw0
         aPE+maGo8qfxVkOeCZCyMfA8asXu2AMDLKBJTOmKcEMBaPxuVnWHrPcuZk9jIdPeiTaY
         unWw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772416; x=1786377216; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoPfHG9x0EvPh1KZnCTAOP1zGi2bN7IiLVz5iEv2WOc=;
        b=Ll+EUwc04pPkbwl92BMJQU9lOd1mwYI03cZJdogeO/Yq00faVe5/CYRJ5LK3jiWezX
         E4bvzb66tQdvVlnNKC9O0WTKQFibuPyEJKNxA0oapjll803uRCwLvnAS+RVwKLNQmxlZ
         Ii+Z8qJftxE6snk0m+1eMEzqMtm2OVv7MiT/29nufbq+DVLCOiUiZq+tjqfamZYJIkmm
         HgGpr1tiywRPszajsDFY5s776CBYtotRRh5l7MUvWYOMKxTWWmsJgyqNZ3qz8tCyftA3
         5uyCTEtl4V74T/cm97ADGANYbSeHFKPj+Sx21SKGG6pj7bH9ALM8bVGgReg0NDkZA533
         HMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772416; x=1786377216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoPfHG9x0EvPh1KZnCTAOP1zGi2bN7IiLVz5iEv2WOc=;
        b=qdBJYq8WyHurZPayOkEV02NQ0Assi3Zjb+NwdytAJ8GAv9qEkZlQ5omq2HSHCbRvvY
         xh69TcG9NhHH3kSNjYecm+iI7wCxX4WGYEsLII+eSBOr2KinRWTDvZgIEUqlZ60CipFa
         qAx2iZHSR7e2xuzjC+Wc1rp4MSiR3VjQl4BPajC4TLZPBCPXUbOf9TOwbLL32o77kWDE
         RAEQtUcUaom+Jf+qpz4iLuLCN2K46spzM4s8yfHd0ONC88+98HVOtBPvZO0trABcADXY
         ndAdtqOLafR8+nK2o1ulsYxzTatlPxl2zxCOx6O1UbSKpIdtzIpgzQK+CVbGNMPiFbmF
         IRCw==
X-Gm-Message-State: AOJu0YyoM5zjuxrX5BoMjkoNuck0MVmC+YPC8PYT0s/7RSPdfMoqGMr7
	eq267Y/6hT4vVINumyjNqmJe/o9i2ZewtRybx4C8RgoqOzjC193PkKGhl3OJdza9ZjujLREi2J+
	H2Im77G1EIXs0or2g9futlrHUqhX6LKkqHkQl
X-Gm-Gg: AR+sD12UExmPuqyeTmpi6FmGPYoOAJ+jac6Ig1oLjAM8KpI8/WSHihl5/Z4C9FYi4vy
	txih67hor02wF2tUUK4636EOHDUaVBKH7fxgmqThUAKhjHzwFi9M2Ttkgkh5S1FXLZn7UL2+0yx
	vxPM03ZE3B7cMs5Qoo7gvrQYbRkHNYd7Yu97U1fBUWE5vc0Kf+4pKb0xKLhhG80yl8sHtwZhnQR
	aCMJzMMEDS4Tz4NB2syaCDhyulYN/YW2Az05LJlwQ9tgcmO65GLt13KRpKCj8pZ8ho4V53pGB1O
	PRHZbHAIOtlCYgia0bR5uHRT8wxbMVKX2rvJo9wPiLKwYqDiQR0GwQNztMinMJLmriQfRJmHir0
	dKCmp56rqdJixG1AIqFB7ZISis7PLoJ6zgLBAwo8rnJYk9/LyNqCvcNNp7jm6FY2efl5fe1ja2/
	lk1LSo6kW4JJhdmkNzxw0CAQttCVgcDCPsBP1HTdt6sQ==
X-Received: by 2002:a53:ac90:0:b0:669:483c:f90 with SMTP id
 956f58d0204a3-6694f1c90e8mr12742368d50.32.1785772416460; Mon, 03 Aug 2026
 08:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
 <CAMKF1sqfU+AADR--Bria3NnKDCnKbV7Lux1ESx4ccGTx-60tPg@mail.gmail.com>
 <CADySD0Gw=nY-BYmgrgiwRy5VRq0Oykgg5O1-6u6kX61vEpzG2g@mail.gmail.com> <CADySD0HPxtz3Yj_U9KPE7BeRdNn=sW=38NWJWkKyHnaPQ+nu3Q@mail.gmail.com>
In-Reply-To: <CADySD0HPxtz3Yj_U9KPE7BeRdNn=sW=38NWJWkKyHnaPQ+nu3Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Aug 2026 08:53:09 -0700
X-Gm-Features: AUfX_mxUyvuxmILeZovLtT5xoM7_3MgpkmD3Yr9XC_5YGyGpbF_Q_VAuNizpvhU
Message-ID: <CAMKF1sq4z=9kqdEUKjW39YKh_XkWccKvcM8pu4L648UDsOaJgw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/20] imagemagick: upgrade 7.1.28 -> 7.1.29
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000886b440658268a48"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 15:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128694

--000000000000886b440658268a48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ankur

On Sun, Aug 2, 2026 at 1:14=E2=80=AFAM Ankur Tyagi <ankur.tyagi85@gmail.com=
> wrote:

> You have already done the needful, thanks for sorting it out.
>
> I have sent some additional minor fixes.
>
> On Sun, Aug 2, 2026 at 4:48=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.c=
om>
> wrote:
> >
> > sure, I'll do it soon.
> >
> > On Sun, Aug 2, 2026 at 3:41=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >
> > > please rebase this series on top of master-next and resend please.
> > >
> > > On Sat, Aug 1, 2026 at 6:11=E2=80=AFAM Ankur Tyagi via lists.openembe=
dded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > >>
> > >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > >>
> > >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > >> ---
> > >>  .../{imagemagick_7.1.2-28.bb =3D> imagemagick_7.1.2-29.bb}        |=
 2
> +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-28.bb
> =3D> imagemagick_7.1.2-29.bb} (99%)
> > >>
> > >> diff --git a/meta-oe/recipes-support/imagemagick/
> imagemagick_7.1.2-28.bb b/meta-oe/recipes-support/imagemagick/
> imagemagick_7.1.2-29.bb
> > >> similarity index 99%
> > >> rename from meta-oe/recipes-support/imagemagick/
> imagemagick_7.1.2-28.bb
> > >> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.b=
b
> > >> index 7fd34dc54c..0890edb8c5 100644
> > >> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
> > >> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> > >> @@ -17,7 +17,7 @@ SRC_URI =3D "git://
> github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt
> > >>             file://imagemagick-ptest.sh \
> > >>  "
> > >>
> > >> -SRCREV =3D "c2068fb3394af17fb9e3a78c712af2ca67141836"
> > >> +SRCREV =3D "360eda553586e389c9c725fc49df94f209a8a3c7"
> > >>
> > >>  inherit autotools pkgconfig update-alternatives ptest
> > >>  export ac_cv_sys_file_offset_bits =3D "64"
> > >>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#128595):
> https://lists.openembedded.org/g/openembedded-devel/message/128595
> > >> Mute This Topic: https://lists.openembedded.org/mt/120549559/1997914
> > >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> > >> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
>

--000000000000886b440658268a48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Ankur</div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 2, 2026 at 1=
:14=E2=80=AFAM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">a=
nkur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">You have already done the needful, thanks for sorting=
 it out.<br>
<br>
I have sent some additional minor fixes.<br>
<br>
On Sun, Aug 2, 2026 at 4:48=E2=80=AFPM Ankur Tyagi &lt;<a href=3D"mailto:an=
kur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; sure, I&#39;ll do it soon.<br>
&gt;<br>
&gt; On Sun, Aug 2, 2026 at 3:41=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; please rebase this series on top of master-next and resend please=
.<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Aug 1, 2026 at 6:11=E2=80=AFAM Ankur Tyagi via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.=
openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt=
; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi8=
5@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 .../{<a href=3D"http://imagemagick_7.1.2-28.bb" rel=3D"=
noreferrer" target=3D"_blank">imagemagick_7.1.2-28.bb</a> =3D&gt; <a href=
=3D"http://imagemagick_7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">im=
agemagick_7.1.2-29.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;=C2=A0 rename meta-oe/recipes-support/imagemagick/{<a href=3D"=
http://imagemagick_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagem=
agick_7.1.2-28.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-29.bb" re=
l=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-29.bb</a>} (99%)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta-oe/recipes-support/imagemagick/<a href=3D"h=
ttp://imagemagick_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagema=
gick_7.1.2-28.bb</a> b/meta-oe/recipes-support/imagemagick/<a href=3D"http:=
//imagemagick_7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick=
_7.1.2-29.bb</a><br>
&gt; &gt;&gt; similarity index 99%<br>
&gt; &gt;&gt; rename from meta-oe/recipes-support/imagemagick/<a href=3D"ht=
tp://imagemagick_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagemag=
ick_7.1.2-28.bb</a><br>
&gt; &gt;&gt; rename to meta-oe/recipes-support/imagemagick/<a href=3D"http=
://imagemagick_7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagic=
k_7.1.2-29.bb</a><br>
&gt; &gt;&gt; index 7fd34dc54c..0890edb8c5 100644<br>
&gt; &gt;&gt; --- a/meta-oe/recipes-support/imagemagick/<a href=3D"http://i=
magemagick_7.1.2-28.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.=
1.2-28.bb</a><br>
&gt; &gt;&gt; +++ b/meta-oe/recipes-support/imagemagick/<a href=3D"http://i=
magemagick_7.1.2-29.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.=
1.2-29.bb</a><br>
&gt; &gt;&gt; @@ -17,7 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://g=
ithub.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt" rel=3D"=
noreferrer" target=3D"_blank">github.com/ImageMagick/ImageMagick.git;branch=
=3Dmain;protocol=3Dhtt</a><br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://imagema=
gick-ptest.sh \<br>
&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -SRCREV =3D &quot;c2068fb3394af17fb9e3a78c712af2ca67141836&qu=
ot;<br>
&gt; &gt;&gt; +SRCREV =3D &quot;360eda553586e389c9c725fc49df94f209a8a3c7&qu=
ot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 inherit autotools pkgconfig update-alternatives ptest<b=
r>
&gt; &gt;&gt;=C2=A0 export ac_cv_sys_file_offset_bits =3D &quot;64&quot;<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;&gt; View/Reply Online (#128595): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-devel/message/128595" rel=3D"noreferrer" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-devel/message/128595=
</a><br>
&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/120549559/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/mt/120549559/1997914</a><br>
&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.opene=
mbedded.org</a><br>
&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt;<br>
</blockquote></div>

--000000000000886b440658268a48--

