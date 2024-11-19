Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DF7D6C285
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 18:00:01 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.28018.1732039194262348158
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xi1x2u4E;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d410b5a94eso8532326d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732039193; x=1732643993; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxaGKGe3Aly6PLoPhpSc0A5dZCo8yjoXb/0W0hZedX8=;
        b=Xi1x2u4E2FmUNSXeHOhx/D5Coc59mPOdBQ1VtT3Hj4f5mk8DuAYCpUL0gKlarHNdb0
         PeOsBnGT8et9RlDczVYtTWNEufVodsXo/ltxFRluAI9gCoOtbj5/ZHGmaNO44d0KxlJY
         YOls4kKrlgckjhSod53WifAUpZgUE62NPgDoJvub3oGiUsSTboEbfAnTZCrHuYFdhInz
         7bwnGYe1DGXAXReh8EPCZRiaQg3sW3dW9rOxeV21xLa4nI+0c6X8YwnUzLufEGYdUaLo
         6yr8bZjDtMVSV5hzZgEGrNTcrekzvHrwMI6aOybgFBV6SwQ4vE6VD8zeZvAU1NxVdxri
         0tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732039193; x=1732643993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxaGKGe3Aly6PLoPhpSc0A5dZCo8yjoXb/0W0hZedX8=;
        b=GutdRHCkQKynvoviZB79FEG942o+O48HmcwLI7fR9qQTPu1BEUfyqKfbemVe2C200U
         E9pp/anhOzDHhUrPXnPj0KhhjGqg9+SDmHWhyVX5NXgPg77N1w2U9yUMe6CCUskZGG2q
         QvvEkIOz4BK7Dj2d1nzzWnShj+879uoVoaiEbC5LUDPe8tSmhvvSkzS6zpGGJboUMg/n
         Cc06/RB6z1ds+FlczQaT9/Q+urOgrKTSs1Pcf1T2XXXG/1vCFcDz2kvWlq+QvJAw37sM
         Y+weqOtWsghxzVWX+IOOU1K7umiOWWtgCqFwCGqFFWRYJDsnpLq91Tt36/SrBlCuQpbk
         M6kw==
X-Gm-Message-State: AOJu0YwYmZaOmVSWNWYDYaNkt/mQfB7LaJxggRBbk5or2A39AqmhF/xH
	evel/G34trKf4VH3OiF82FyNtuUXw9UeUABCbj8IFWbS8D7hS/HTpw0NcjaPpGurfODAOGc9od4
	j3eO7GE4OjC/1u/emOlnjetlbuJM=
X-Google-Smtp-Source: AGHT+IGqdl8jW7kbEcVLh7Nof3+nSUdfkePZuPp0HwVOpBoYQFeBpwKuYKzYQdPBxfBgwSbIlXFyXnzL9KNRXrEp7cc=
X-Received: by 2002:a05:6214:240f:b0:6d4:1a99:4279 with SMTP id
 6a1803df08f44-6d41a9944a1mr172232536d6.39.1732039193207; Tue, 19 Nov 2024
 09:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20241119175446.1889573-1-yoann.congal@smile.fr>
In-Reply-To: <20241119175446.1889573-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2024 18:59:42 +0100
Message-ID: <CANNYZj-aJBLNGRcsTGPiRnJKmB+kSCPd-UO9DeHOaOTcBQ1vXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tk: make tk_8.x depend on tcl8
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d927d8062747cc7b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 18:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113912

--000000000000d927d8062747cc7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is probably unneeded as there=E2=80=99s an update to tk 9.x in master-=
next.

Alex

On Tue 19. Nov 2024 at 18.54, Yoann Congal via lists.openembedded.org
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:

> From: Yoann Congal <yoann.congal@smile.fr>
>
> tk_8.x depends on tcl8 (tcl is the 9.x version in OE-core)
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> NB: This patch fixes a do_configure failure but a later do_compile
> failure is fixed by a patch in OE-Core:
> https://lists.openembedded.org/g/openembedded-core/message/207399
>
> This is kind of a workaround since the proper solution would be to
> upgrade to tk_9.x. But I would rather fix the build first and upgrade
> later.
> ---
>  meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> index 1438a05625..ddd7043c0a 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D
> "file://license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
>      file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
>  "
>
> -DEPENDS =3D "tcl virtual/libx11 libxt"
> +DEPENDS =3D "tcl8 virtual/libx11 libxt"
>
>  SRC_URI =3D "\
>      ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113911):
> https://lists.openembedded.org/g/openembedded-devel/message/113911
> Mute This Topic: https://lists.openembedded.org/mt/109669370/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d927d8062747cc7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is probably unneeded as there=E2=80=99s an update to=
 tk 9.x in master-next.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue 19. Nov 2024 at 18.54, Yoann Congal via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;yoann.congal=3D<a hre=
f=3D"mailto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">From: Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</=
a>&gt;<br>
<br>
tk_8.x depends on tcl8 (tcl is the 9.x version in OE-core)<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
NB: This patch fixes a do_configure failure but a later do_compile<br>
failure is fixed by a patch in OE-Core:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/20739=
9" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/207399</a><br>
<br>
This is kind of a workaround since the proper solution would be to<br>
upgrade to tk_9.x. But I would rather fix the build first and upgrade<br>
later.<br>
---<br>
=C2=A0meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D=
"noreferrer" target=3D"_blank">tk_8.6.15.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">tk_8.6.15.bb</a> b/meta-oe/recipes-de=
vtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D"noreferrer" target=3D"_=
blank">tk_8.6.15.bb</a><br>
index 1438a05625..ddd7043c0a 100644<br>
--- a/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D=
"noreferrer" target=3D"_blank">tk_8.6.15.bb</a><br>
+++ b/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D=
"noreferrer" target=3D"_blank">tk_8.6.15.bb</a><br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://license.terms;md5=3Dc88=
f99decec11afa967ad33d314f87fe \<br>
=C2=A0 =C2=A0 =C2=A0file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33=
d314f87fe \<br>
=C2=A0&quot;<br>
<br>
-DEPENDS =3D &quot;tcl virtual/libx11 libxt&quot;<br>
+DEPENDS =3D &quot;tcl8 virtual/libx11 libxt&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#113911): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/113911" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/113911</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109669370/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109669370/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d927d8062747cc7b--

