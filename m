Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269B2C433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 12:26:17 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.10080.1633177569540292017
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 05:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HByGkSdo;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id a14so936604qvb.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Gg9OKxbnMqYti5gEKirBwRAgQiV3mtVxUmTvfsBlRU=;
        b=HByGkSdowkU9BsYJTdWsHxg6kylKRQaztYhGFclf7WgXpz0dXvkNZ9MzdM38n6L8Mf
         Tydq2WGaZPI0aqBR6j+eMgn+i0gG/h0H03JOsYqV0Sum9coM2Nv0VqqH3QvbcW/gebmM
         pKhO0b6zB9PnkGuoU6+zcY9R6L/7FReynoPuown17EnE06feKmqgLde86B/J+xO3esGU
         BvFF1r0gAEiZNpgTr1ku1qihq+OXoOGD8NoxAfr76iIvzOlPD3XiYFBWO89qsbe1sQYr
         NxagiBwwj73OOZqJSh88nQVrz6SW/jsjeUwF1D05wuOLyTKbvfHEI+emY81unrUxtojP
         Ib7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Gg9OKxbnMqYti5gEKirBwRAgQiV3mtVxUmTvfsBlRU=;
        b=BtuBC8jnMRwbf9aeZLm4UDza/LCc34G77XdnjVy9o/gj9yvyN1DkajSzvbB+fGkBUY
         TPne47CtnXhcMBUJb7lnS5FCNq4OIx68PX2mYBu/DQs6HQSV2e608qr4Fx+sZmTKXyK/
         x2aaUg1fftP7vTyMTo0fq0K2naKmZlq4Knr2Ro7IbtEZRz6LLGXaBwbRX2YCGpy4NoAj
         ybXq+eJySjpixUPkE4eToZjTkjzMPvJw+ERqLC2i1uCJfkqhT/6//7HE+HxPVWfQKwDn
         A9XQ4Khn2t6c5p6mG1zbE0l8TV1Bo4zIVnj2urF6A54SMDaRYSt9mr9qv7LsrfKassb0
         YtPw==
X-Gm-Message-State: AOAM531cnCdseyJ87UM01oMP26yMf0CNV2lMczadWW8gcVkn3zP6hBt3
	dftXO+FUAX159S6znCmr1Cl7qGNOg2t3qv//3VzNkHirx0k=
X-Google-Smtp-Source: 
 ABdhPJwTdmos7tmFXsq8TPQ3261qka0Xdsbdhp2XU1aYFCUHrJe/0yNMNcLQnJI/c/vVxaxB0Jy7Wce0sqdSszTQ15M=
X-Received: by 2002:a0c:8061:: with SMTP id 88mr13693509qva.5.1633177568622;
 Sat, 02 Oct 2021 05:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211002102103.2268157-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211002102103.2268157-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Oct 2021 05:25:58 -0700
Message-ID: 
 <CAMKF1souaZaazD1DxGg0PeK58zVBjwCPEvx6nRbzeOwjOgvoHg@mail.gmail.com>
Subject: Re: [oe] [meta-XXX] [PATCH] gattlib: Place pkgconfig file in correct
 package
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d53c9605cd5dc873"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Oct 2021 12:26:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93190

--000000000000d53c9605cd5dc873
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 2, 2021 at 3:21 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Fixes in OE-Core added some pkgconfig dependencies back and this flagged
> that the .pc file was in ${PN}, not ${PN}-dev. Fix that.


Ah cool I was scratching my head over it too thanks for the  fix

>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> index 234f840f9..8485013ba 100644
> --- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> +++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> @@ -29,4 +29,4 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
>  inherit pkgconfig cmake
>
>  FILES:${PN} = "${libdir}/*"
> -FILES:${PN}-dev = "${includedir}/*"
> +FILES:${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93189):
> https://lists.openembedded.org/g/openembedded-devel/message/93189
> Mute This Topic: https://lists.openembedded.org/mt/86020028/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d53c9605cd5dc873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 2, 2021 at 3:21 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">Fixes in OE-Core added some=
 pkgconfig dependencies back and this flagged<br>
that the .pc file was in ${PN}, not ${PN}-dev. Fix that.</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Ah cool I was scratching my head ov=
er it too thanks for the =C2=A0fix=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"=
><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb=
" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib=
_git.bb" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a> b/meta-oe/=
recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb" rel=3D"noref=
errer" target=3D"_blank">gattlib_git.bb</a><br>
index 234f840f9..8485013ba 100644<br>
--- a/meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb=
" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a><br>
+++ b/meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb=
" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a><br>
@@ -29,4 +29,4 @@ EXTRA_OECMAKE +=3D &quot;-DGATTLIB_BUILD_DOCS=3DOFF&quot;=
<br>
=C2=A0inherit pkgconfig cmake<br>
<br>
=C2=A0FILES:${PN} =3D &quot;${libdir}/*&quot;<br>
-FILES:${PN}-dev =3D &quot;${includedir}/*&quot;<br>
+FILES:${PN}-dev =3D &quot;${includedir}/* ${libdir}/pkgconfig&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93189): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93189" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93189</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86020028/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86020028/1997914</a><br>
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

--000000000000d53c9605cd5dc873--

