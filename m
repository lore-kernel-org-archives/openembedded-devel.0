Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9589BFF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:06:45 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38208.1777277196671320807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JYk6uNhX;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: nmjain23@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a48deebe95so76820326d6.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 01:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777277196; cv=none;
        d=google.com; s=arc-20240605;
        b=BxI2VK2CU5uxPoGkmPxfiWC93rF5t88zUbUAJlj43Kf1D5bwDyXTQiLn/0o8UdmN9u
         xOFfXRxrhhpKl3IoBiOJD5nZqy2q4cMunea0s26xFuHiZtRvL/YdX5vjN+8I0VpMnJTw
         ppwyoGXcDUyYBB6QfeEKfcFxC2+BlI7lx2U9kbjtFrZeW4uKTCFhls1koON2yg8XjgEo
         Bye+fUjU3Od72VjPeRlaxtUFFaUQY2DvXgzKGMYy32ZGmh7RTmUK3wfk3/4ccjGZ6wPm
         vPjJpB41KyMbDYEULxxE8KMKTekNDa1Xq5wK9Z4/zfyCmGaacHzfIE5IdpnWNOB7dA/F
         6HQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YyCOAnkAd0nTQPYF9/NpJkeP3RiNPJGYfkw3IVnj7Zs=;
        fh=/VmBdcqTGOQWFpIhTZxkrK+79/j4OojpTQsergY0rns=;
        b=QxxVWlSrSOVIEZ+/khfCPuZwRBpu4YbLeFNSf4YoMJhpNm8ZDbKQUsd3fK3mCMi2Oo
         nxyPPzCqc+2v6CUjAnAsN7xcXCLE3RX5xrMoWbeTonR/hsTG2lLdBgnkp6ShHYKFHsEo
         0s8PA0exHtvMTfcmd8oh12vN4UtGY98jfcr7o55RbpgkP6wkm8GtNGN/HVyOH9C34MjG
         50WtdSvB0nsNIvUkiE2uCXSw+r5IswYhR7XMVYGf06i5/iaNS4fPnkz6f6i+kZOLVw3l
         /ah0R2T4ZAcStja0qSr+Uq0+FnWRn8tEjIeJxA3npaBrL/WtO4YsBV+35KjJefyDb17z
         Bu5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277196; x=1777881996; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YyCOAnkAd0nTQPYF9/NpJkeP3RiNPJGYfkw3IVnj7Zs=;
        b=JYk6uNhX9h71dN2WF4ZCertLxtcgc4VfYYxdzDPWbUKSezS/g0g3NRqgmDhnN/FS6Z
         8tFY6ZeaOhsFP8B2Qs1OKPkS0XvHwMd2uyRid1wqGRSFot05GYQ4crm8CKVP+7VioZM2
         2KmElpR7/1GdiYr6a2B63eGO1XljNvU1hPYhrsxtrZYPUFjpCBXQkGZFepj4NpSC+DUW
         6dW5Ljtj++4B9PEGr6NfXLcO/HccSUSu048qQiB2pGbV4QN/b+FXu/h0l+azJRQZX51/
         BzW2Nq76dUM6Zd8MKh7YyUXd3/pGEC8NywbLsk0IE/CWPqSMSZqZQRl8e0rnD011jU7h
         XS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277196; x=1777881996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyCOAnkAd0nTQPYF9/NpJkeP3RiNPJGYfkw3IVnj7Zs=;
        b=fitJW9aHh+U0OYDR+omCaZ83nxzbEDOaCUe/vtHGG8Qa1bxseZLjsLxgMUZkes5tzI
         bX2Z0iODsr1KHHI+v2znRNqbq45G6fjik8EyDaN6369oU3Fu/fkv4mzck1mhNRu7vxG/
         H262t4Q7K1weycsWTldxN77xNSF1ogAZOx2eKw33egw/0vdf19EfGR0ehNzIPs0lzrFk
         Osfw81HIql9fvUy6A6e6MaPd8DoGYWIqEzQlzfFAh0YtikcpW5qacp12iaDPXkm8o+Vk
         /QXDLlXRhE2gEY8bCs1e8js1XXjqkjVodG8RxzeIRwD0zIjy52TPOHmYemfuXuLqiMe2
         ZNlg==
X-Gm-Message-State: AOJu0YztIw5qOy8B9nwUOhuM6+TxckP7SSYYymRapitHANP0Qws7lb77
	0lO2oNSpJyZzBy/4y0H+vHX2fMjNji5TXih2RTdZ87lsmKCU6y951eypi7VwQTyHjthKLw0C/eP
	U2jyQd3/W9IHZr2RC9C8yA0Yls6Cmdo4=
X-Gm-Gg: AeBDiet0eyQnpDpb9gWovGM//3dHhS3qDJocy5q/W0IOIjVYOW6rXCug3krdkm0whk5
	zFKlMdxewI+Cqb8WaFUTVMNv5EXCPLTQsBt1DxTOIB4ZqMvsAZ7n9SBnKZ1sEkiWTR1sbSxhW+a
	nFvJCoa+hPH0U8a39li0g20BtPaBk+95gctfrPz/txui3imVOyj0ACjHGqkg1CtVpbjROpSjnKH
	B5w6+9Kl7Vg7fJjO22wRVEr7jYIEswDyJ4nZ+rhSbTIIaL2odVqYQBWTmPfAQfxVKD+PKAwalxz
	QVAkPEHkDI8PvuGRF16R5846WrMiRTssleTzsL89d/T9BxOMixpf87wuI/aAMA==
X-Received: by 2002:a05:6214:1c0b:b0:8b0:2b9e:963b with SMTP id
 6a1803df08f44-8b02b9e9dcamr666609256d6.12.1777277195499; Mon, 27 Apr 2026
 01:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260427063333.117465-1-naman.jain@partner.bmw.de> <d14f0925-2b52-4c4d-be3b-d740c2b1b5f6@gmail.com>
In-Reply-To: <d14f0925-2b52-4c4d-be3b-d740c2b1b5f6@gmail.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Mon, 27 Apr 2026 13:36:23 +0530
X-Gm-Features: AQROBzBJA3pCFoqxvnzXh0Bjx1h-OoWTIeJ6yVhVxATadxjLZKQmXjC85e9lag4
Message-ID: <CALCkg5Z4WW9dUx2spE_xRhjm7k8M0G19mhhYHC-DdW9C4nzwBA@mail.gmail.com>
Subject: Re: [oe] [PATCH] imagemagick: Fix CVE-2025-68950
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Naman Jain <namanj1@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000e7bd8a06506c978c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 08:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126635

--000000000000e7bd8a06506c978c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Yes, this is for kirkstone

Thanks and regards,
Naman jain

On Mon, 27 Apr, 2026, 1:35=E2=80=AFpm Gyorgy Sarvari, <skandigraun@gmail.co=
m> wrote:

> Just as a confirmation, you meant this for kirkstone, right?
>
>
> On 4/27/26 08:33, Naman Jain via lists.openembedded.org wrote:
> > From: Naman Jain <namanj1@kpit.com>
> >
> > ImageMagick is free and open-source software used for editing and
> > manipulating digital images. Prior to version 7.1.2-12, Magick fails
> > to check for circular references between two MVGs, leading to a
> > stack overflow. This is a DoS vulnerability, and any situation that
> > allows reading the mvg file will be affected.
> > Version 7.1.2-12 fixes the issue.
> > This is a minimal patch required for this cve.
> >
> > Signed-off-by: Naman Jain <namanj1@kpit.com>
> > ---
> >  .../imagemagick/files/CVE-2025-68950.patch    | 24 +++++++++++++++++++
> >  .../imagemagick/imagemagick_7.0.10.bb         |  1 +
> >  2 files changed, 25 insertions(+)
> >  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> >
> > diff --git
> a/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> > new file mode 100644
> > index 0000000000..f839884994
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> > @@ -0,0 +1,24 @@
> > +From 204718c2211903949dcfc0df8e65ed066b008dec Mon Sep 17 00:00:00 2001
> > +From: Cristy <urban-warrior@imagemagick.org>
> > +Date: Fri, 26 Dec 2025 11:22:12 -0500
> > +Subject: [PATCH]
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-7rvh-=
xqp3-pr8j
> > +
> > +Magick fails to check for circular references between two MVGs, leadin=
g
> to a stack overflow.
> > +
> > +CVE: CVE-2025-68950
> > +
> > +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/204718c2211903949dcfc0d=
f8e65ed066b008dec
> ]
> > +
> > +Comment: Refreshed the orignal patch based on 7.0.10-62 version of
> imagemagick
> > +
> > +--- a/MagickCore/draw.c      2026-04-09 13:26:27.935293000 +0530
> > ++++ b/MagickCore/draw.c      2026-04-16 11:52:23.007277997 +0530
> > +@@ -5545,7 +5545,7 @@ MagickExport MagickBooleanType DrawPrimi
> > +               clone_info->size=3DDestroyString(clone_info->size);
> > +             if (clone_info->extract !=3D (char *) NULL)
> > +               clone_info->extract=3DDestroyString(clone_info->extract=
);
> > +-            if (*clone_info->filename !=3D '\0')
> > ++            if ((*clone_info->filename !=3D '\0') &&
> (LocaleCompare(clone_info->magick,"mvg") !=3D 0))
> > +               composite_images=3DReadImage(clone_info,exception);
> > +           }
> > +       clone_info=3DDestroyImageInfo(clone_info);
> > diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> > index 9bc857b715..1dc1005aa7 100644
> > --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> > +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> > @@ -54,6 +54,7 @@ SRC_URI =3D "git://
> github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt
> >      file://CVE-2026-22770.patch \
> >      file://CVE-2026-23874.patch \
> >      file://CVE-2026-23876.patch \
> > +    file://CVE-2025-68950.patch \
> >  "
> >
> >  SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126632):
> https://lists.openembedded.org/g/openembedded-devel/message/126632
> > Mute This Topic: https://lists.openembedded.org/mt/119026610/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000e7bd8a06506c978c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto">Yes, this is for kirkstone=C2=A0</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks and regards,</div><d=
iv dir=3D"auto">Naman jain=C2=A0</div></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Apr,=
 2026, 1:35=E2=80=AFpm Gyorgy Sarvari, &lt;<a href=3D"mailto:skandigraun@gm=
ail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Just as a confirmation, you meant this for kirkstone, right?<br>
<br>
<br>
On 4/27/26 08:33, Naman Jain via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> =
wrote:<br>
&gt; From: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D"_bl=
ank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
&gt; <br>
&gt; ImageMagick is free and open-source software used for editing and<br>
&gt; manipulating digital images. Prior to version 7.1.2-12, Magick fails<b=
r>
&gt; to check for circular references between two MVGs, leading to a<br>
&gt; stack overflow. This is a DoS vulnerability, and any situation that<br=
>
&gt; allows reading the mvg file will be affected.<br>
&gt; Version 7.1.2-12 fixes the issue.<br>
&gt; This is a minimal patch required for this cve.<br>
&gt; <br>
&gt; Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../imagemagick/files/CVE-2025-68950.patch=C2=A0 =C2=A0 | 24 +++=
++++++++++++++++<br>
&gt;=C2=A0 .../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 25 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE=
-2025-68950.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.=
patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f839884994<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch<b=
r>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +From 204718c2211903949dcfc0df8e65ed066b008dec Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" tar=
get=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
&gt; +Date: Fri, 26 Dec 2025 11:22:12 -0500<br>
&gt; +Subject: [PATCH] <a href=3D"https://github.com/ImageMagick/ImageMagic=
k/security/advisories/GHSA-7rvh-xqp3-pr8j" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://github.com/ImageMagick/ImageMagick/security/advisor=
ies/GHSA-7rvh-xqp3-pr8j</a><br>
&gt; +<br>
&gt; +Magick fails to check for circular references between two MVGs, leadi=
ng to a stack overflow. <br>
&gt; +<br>
&gt; +CVE: CVE-2025-68950<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/=
ImageMagick/commit/204718c2211903949dcfc0df8e65ed066b008dec" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagic=
k/commit/204718c2211903949dcfc0df8e65ed066b008dec</a>]<br>
&gt; +<br>
&gt; +Comment: Refreshed the orignal patch based on 7.0.10-62 version of im=
agemagick<br>
&gt; +<br>
&gt; +--- a/MagickCore/draw.c=C2=A0 =C2=A0 =C2=A0 2026-04-09 13:26:27.93529=
3000 +0530<br>
&gt; ++++ b/MagickCore/draw.c=C2=A0 =C2=A0 =C2=A0 2026-04-16 11:52:23.00727=
7997 +0530<br>
&gt; +@@ -5545,7 +5545,7 @@ MagickExport MagickBooleanType DrawPrimi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clone_info-&gt=
;size=3DDestroyString(clone_info-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (clone_info-&gt;ex=
tract !=3D (char *) NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clone_info-&gt=
;extract=3DDestroyString(clone_info-&gt;extract);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*clone_info-&gt;filena=
me !=3D &#39;\0&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((*clone_info-&gt;filen=
ame !=3D &#39;\0&#39;) &amp;&amp; (LocaleCompare(clone_info-&gt;magick,&quo=
t;mvg&quot;) !=3D 0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0composite_imag=
es=3DReadImage(clone_info,exception);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clone_info=3DDestroyImageInfo(clone_info);=
<br>
&gt; diff --git a/meta-oe/recipes-support/imagemagick/<a href=3D"http://ima=
gemagick_7.0.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagema=
gick_7.0.10.bb</a> b/meta-oe/recipes-support/imagemagick/<a href=3D"http://=
imagemagick_7.0.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imag=
emagick_7.0.10.bb</a><br>
&gt; index 9bc857b715..1dc1005aa7 100644<br>
&gt; --- a/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagic=
k_7.0.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagemagick_7.=
0.10.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagic=
k_7.0.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagemagick_7.=
0.10.bb</a><br>
&gt; @@ -54,6 +54,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt" rel=3D"noreferre=
r noreferrer" target=3D"_blank">github.com/ImageMagick/ImageMagick.git;bran=
ch=3Dmain;protocol=3Dhtt</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2026-22770.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2026-23874.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2026-23876.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2025-68950.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRCREV =3D &quot;35b4991eb0939a327f3489988c366e21068b0178&quot;<=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#126632): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/126632" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/126=
632</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11902661=
0/6084445" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/119026610/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigr=
aun@gmail.com" target=3D"_blank" rel=3D"noreferrer">skandigraun@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000e7bd8a06506c978c--

