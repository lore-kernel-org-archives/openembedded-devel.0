Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F8DC6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 16:18:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.25059.1680365901039196508
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 09:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=Rjl2c0Sl;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so16896309wmq.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680365899; x=1682957899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=abD/GqkWpxOK43uo20PVATciCdybAq/OC51NJo+tp/o=;
        b=Rjl2c0Slp25vq4Mov4pDsi2fp4YnRX5+XKP9BE5BOWUEPtgErUa32j6R22lzzeI4C9
         tqc/OuDaoyp17UvpmbBAiPNla69ife9z/WR8HZqjvIKkAYG/v62ynNaLcsEeltaRVgVg
         OojMfQJ44zwptJoujw3SgrjlQK63TyDXjP+fS2IR+iSvwJilS1Uc7JWf6RZqHLx6X5YR
         2OGQdmv+GLv1hoyTtglzlisgb9S8/0w73D5Hu9xBU6DgkFjHH/qKCSG3tG5NLTimWKzd
         WAQLgrXIgX4yICdLCcplHjknpJedtIowgS4cJQWzbYEfsBz+l84oDBwjAQ20E4wppISv
         wXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680365899; x=1682957899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abD/GqkWpxOK43uo20PVATciCdybAq/OC51NJo+tp/o=;
        b=iEaiM5vbws48kTw20SsQlcQFIVNggFFyBxPNsDo855RBTHAUoKzdO0s7AZaLaUZ5Px
         bsyhbG2ixQjW4H3Qd8RgDHN2HInpsSFZGGyRYLobwCJHnia30rDQtNrN5+GfidAwRh8Q
         4RQ71ayONq0Szq0A/tV/6h38/h8gl+Md+Ysnv7Z5ggZAbXeLNkMtNNm49TdQfWBpa3WF
         XaghAPj6YsoCxSxKk579PnzKvoPuzSswKd8UfR2+s9w2luDL7ELZ7JW4RMq8+n37beV4
         4Meku5OAsPOHvWSZqyMELPVb+JSDxXJxO0/ldzm6TZiTprRugfjjjflfi5vDqhI23Fir
         9stA==
X-Gm-Message-State: AAQBX9dA0d0NZDk0bYYTHIF/njxjnGWL73aeHcU++UKjOrISh5nEk4tA
	Ay3iw7YJNJIgJs1xplkmLvRC3cEGFWqxItTgdzA=
X-Google-Smtp-Source: AKy350bJxpmkFavh3r9/OzJtkDyo1r8gk5PHlwT5dQQrpbzBZglNpB/41Na+jeYm4Y8ZB/rhdndREazEyMvoNyY6LXE=
X-Received: by 2002:a05:600c:1d17:b0:3eb:3998:8bed with SMTP id
 l23-20020a05600c1d1700b003eb39988bedmr4969289wms.1.1680365899205; Sat, 01 Apr
 2023 09:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230110102531.619341-1-raj.khem@gmail.com>
In-Reply-To: <20230110102531.619341-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Apr 2023 18:18:03 +0200
Message-ID: <CA+chaQdo=psqULY_RQfTb052T=LtbMu_o2R3hkPBryXXeb_63Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freeglut: Add packageconfigs for x11/wayland/gles
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000083d44305f848ac1f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 16:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101871

--00000000000083d44305f848ac1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 11:25=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> helps it compiling on on different openGL implementations which may not
> implement fulll openGL specs
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../freeglut/freeglut_3.4.0.bb                 | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> index 627ce23544..86b94149bc 100644
> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> @@ -6,14 +6,24 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78adfb"
>  SRC_URI =3D "
> https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.t=
ar.gz
> "
>  SRC_URI[sha256sum] =3D
> "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
>
> -inherit cmake features_check
> +inherit cmake features_check pkgconfig
>
> -# depends on virtual/libx11, virtual/libgl
> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> +# depends on virtual/libgl
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>

This doesn't seem correct as there is still libxi dependency which requires
x11 in DISTRO_FEATURES.

Are you building freeglut without x11 (and want to support this) or should
I just return x11 to REQUIRED_DISTRO_FEATURES ?

+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d=
)}"
> +PACKAGECONFIG[gles] =3D "-DFREEGLUT_GLES=3DON,-DFREEGLUT_GLES=3DOFF,"
> +PACKAGECONFIG[wayland] =3D
> "-DFREEGLUT_WAYLAND=3DON,-DFREEGLUT_WAYLAND=3DOFF,libxkbcommon"
> +PACKAGECONFIG[demos] =3D
> "-DFREEGLUT_BUILD_DEMOS=3DON,-DFREEGLUT_BUILD_DEMOS=3DOFF,"
> +PACKAGECONFIG[x11] =3D ",,virtual/libx11 libice libxmu libglu libxrandr
> libxext"
>  # Do not use -fno-common, check back when upgrading to new version it
> might not be needed
>  CFLAGS +=3D "-fcommon"
>
>  PROVIDES +=3D "mesa-glut"
>
> -DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
> +DEPENDS =3D "virtual/libgl libxi"
> +
> +do_install:append() {
> +    # Remove buildpaths
> +    sed -i "s#${RECIPE_SYSROOT}##g"
> ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake
> +}
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100516):
> https://lists.openembedded.org/g/openembedded-devel/message/100516
> Mute This Topic: https://lists.openembedded.org/mt/96174302/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000083d44305f848ac1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 10, 2023 at 11:25=E2=80=AFAM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">helps it compiling on on different openGL implementati=
ons which may not<br>
implement fulll openGL specs<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../freeglut/<a href=3D"http://freeglut_3.4.0.bb" rel=3D"noreferrer" =
target=3D"_blank">freeglut_3.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++----<br>
=C2=A01 file changed, 14 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3=
.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a> b/meta-=
oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">freeglut_3.4.0.bb</a><br>
index 627ce23544..86b94149bc 100644<br>
--- a/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a><br>
@@ -6,14 +6,24 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D89c0b58a3=
e01ce3d8254c9f59e78adfb&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceforge.net/projects/$%7BBPN=
%7D/files/$%7BBPN%7D/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferr=
er" target=3D"_blank">https://sourceforge.net/projects/${BPN}/files/${BPN}/=
${PV}/${BPN}-${PV}.tar.gz</a>&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3c0bcb915d9b180a97edaebd011b7a1de54583a8=
38644dcd42bb0ea0c6f3eaec&quot;<br>
<br>
-inherit cmake features_check<br>
+inherit cmake features_check pkgconfig<br>
<br>
-# depends on virtual/libx11, virtual/libgl<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
+# depends on virtual/libgl<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br></blockquote><div><br><=
/div><div>This doesn&#39;t seem correct as there is still libxi dependency =
which requires x11 in DISTRO_FEATURES.</div><div><br></div><div>Are you bui=
lding freeglut without x11 (and want to support this) or should I just retu=
rn x11 to REQUIRED_DISTRO_FEATURES ?</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+PACKAGECONFIG ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#3=
9;wayland x11&#39;, d)}&quot;<br>
+PACKAGECONFIG[gles] =3D &quot;-DFREEGLUT_GLES=3DON,-DFREEGLUT_GLES=3DOFF,&=
quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;-DFREEGLUT_WAYLAND=3DON,-DFREEGLUT_WAYLAN=
D=3DOFF,libxkbcommon&quot;<br>
+PACKAGECONFIG[demos] =3D &quot;-DFREEGLUT_BUILD_DEMOS=3DON,-DFREEGLUT_BUIL=
D_DEMOS=3DOFF,&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;,,virtual/libx11 libice libxmu libglu libxran=
dr libxext&quot;<br>
=C2=A0# Do not use -fno-common, check back when upgrading to new version it=
 might not be needed<br>
=C2=A0CFLAGS +=3D &quot;-fcommon&quot;<br>
<br>
=C2=A0PROVIDES +=3D &quot;mesa-glut&quot;<br>
<br>
-DEPENDS =3D &quot;virtual/libx11 libxmu libxi virtual/libgl libglu libxran=
dr&quot;<br>
+DEPENDS =3D &quot;virtual/libgl libxi&quot;<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 # Remove buildpaths<br>
+=C2=A0 =C2=A0 sed -i &quot;s#${RECIPE_SYSROOT}##g&quot; ${D}${libdir}/cmak=
e/FreeGLUT/FreeGLUTTargets.cmake<br>
+}<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100516): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100516" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100516</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96174302/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96174302/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000083d44305f848ac1f--

