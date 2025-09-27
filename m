Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7E7CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 04:34:35 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.5887.1758947670352110190
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 21:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Byfn+Djg;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-72ce9790acdso33901547b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 21:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758947667; x=1759552467; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DYikD0XncsGoX0rHzVFOtx+jUn08K6DL+0Ff0z45zvY=;
        b=Byfn+Djg0yavA7g+Ee6hDbndEOq2y8ItUU6XQ5i+s7+wpse/vIwsmslm64KE3EfSN4
         KRY1gNOuUgS94cNFk3K6DVUlDzGJBvGAQUWPbJ+zJMnBHEz/ixFozSd6a7DVFAnoFiTz
         2c7zSESnmtxNgKDGLEN3jJislBveKTxPKvVr/0zf4GvkirthnmPQfoyrjjF0TOHyapv7
         xt4A/cwXdeVUWIDA40+r9pJFf5Wnm2cg9nAb4j9kBAt8PMxY0J0whG1U3r8ui2qJLs3/
         atBRDt2ZREJ7EEoqI/hBguHOcK9kTSJHVnV66lqlmfKd9r+M6wIFY1zO3tSRDOjPEImV
         xkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758947667; x=1759552467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYikD0XncsGoX0rHzVFOtx+jUn08K6DL+0Ff0z45zvY=;
        b=wOlPWpqfx4NM7m4EelY8gqh2hD29BfAzAYx+9CQNK+wjhg9IfcV5NHFDt4R/Z6bZss
         Gum/SlTMAC25mFFMx+PqkL5NwU6cbWHVjcem8p57mi5QUiKA9r+duFjk+ze39yHQdzdy
         F/Rss28I9lAf2jeXVN08wcOl2s2liZpDUiAygGLYq5VXKPTKlVBF6BW9/kAlebPN8cUD
         kvrpJP8fBDvcmB1VureKNcl2ogyDoAxUXVq+lDH/S2MNki74piV4p2BoqbaP/FzfSpoT
         BACEg1xkFozHkFFCZKEVnA+o386O4rby3j5/ilgkmDHCUnXU8AL/fQ07hNEhJtc6Au3R
         CxEg==
X-Gm-Message-State: AOJu0YwyRfY00KOq/ojWzWq2G75L/wcFLni6hiJBEkrt3AyUwfuHGLuO
	ASnC3BsT8WUSmdhzitLZtTjqD3lsqRLaSuhm5gMqUqNXxe0bUuTkeqTUKM0/z01TI/sRBAyQcV/
	aE1L7oc/zK7IB9MWwJwd/jfx75GKUBxA=
X-Gm-Gg: ASbGncvyD7orA6WmCSS6U7CU9HI9N9lkDmeeSbwB1VJXlv/rVu1o9emE083WHyFBwX/
	UQ+15x3BQJ1j74ZSgJiSvhBxj/OQyJTHnJkSSZPPYMD+g8YDBildpwZlOXi1k4r/hmEubltY3tC
	SUfa/SMETx/27eBRTuKH1Znx84d9IuMI155vQRDh7MFPzvW/Jc0Lw4afoFq/ymEf5vo6+fKT8ix
	4NQ2PDqe+T7zWyUIWcIiZL85aZc5Kn4QzecOB6/MAy3DGCNsqkfsPoKZZ5IVmCZpzC0xUbYfXwg
	HD7ASGeQSmUGtInVbQbMT95I+qGYvr08/SHdxcHuDSZrzG8+hoN3/JcvSOeAFg4XHU5Q
X-Google-Smtp-Source: AGHT+IFtZ/jYozbdvjVrMQwI3wHmrV77FxVwc3895NeN6pv4jZPPX413e8FvhLCgnK7StPa42seUv+//vTuaAeTE1Rw=
X-Received: by 2002:a53:d015:0:b0:635:4ecf:bdd1 with SMTP id
 956f58d0204a3-6361a8d4824mr9554352d50.51.1758947665432; Fri, 26 Sep 2025
 21:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250927024742.1485096-1-pkj@axis.com> <20250927024742.1485096-2-pkj@axis.com>
In-Reply-To: <20250927024742.1485096-2-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Sep 2025 21:34:14 -0700
X-Gm-Features: AS18NWBWrYKddoqS684dppKti6WsRxrNYlsW8wjsec40z8Ieg-uSeWiflkbzcRs
Message-ID: <CAMKF1sp6TgO=1tiw2Ro2z=JyO-bCGkoPEshrapmf5+Q47WjA0w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] opencv: Support building for native
To: peter.kjellerstedt@axis.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c6d35f063fc0ea3f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 04:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119951

--000000000000c6d35f063fc0ea3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am curious what=E2=80=99s the use case ?

On Fri, Sep 26, 2025 at 7:47=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.or=
g>
wrote:

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> index d1ab87b06f..27499caa92 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> @@ -200,11 +200,6 @@ do_install:append() {
>          mv ${D}/usr/lib/* ${D}/${libdir}/
>          rm -rf ${D}/usr/lib
>      fi
> -    # remove build host path to improve reproducibility
> -    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
> -        sed -e 's@${STAGING_DIR_HOST}@@g' \
> -            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
> -    fi
>      # remove setup_vars_opencv4.sh as its content is confusing and usele=
ss
>      if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
>          rm -rf ${D}${bindir}/setup_vars_opencv4.sh
> @@ -222,3 +217,13 @@ do_install:append() {
>          mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
>      fi
>  }
> +
> +do_install:append:class-target() {
> +    # remove build host path to improve reproducibility
> +    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
> +        sed -e 's@${STAGING_DIR_HOST}@@g' \
> +            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
> +    fi
> +}
> +
> +BBCLASSEXTEND =3D "native"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119949):
> https://lists.openembedded.org/g/openembedded-devel/message/119949
> Mute This Topic: https://lists.openembedded.org/mt/115460185/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c6d35f063fc0ea3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am curious what=E2=80=99s the use case ?</div><div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Sep 26, 2025 at 7:47=E2=80=AFPM Peter Kjellerstedt via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;pe=
ter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.openembedded.org">axis.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Signed-=
off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.co=
m" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a> | 15 ++++++++++----=
-<br>
=C2=A01 file changed, 10 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0=
.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a> b/meta-oe/re=
cipes-support/opencv/<a href=3D"http://opencv_4.12.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">opencv_4.12.0.bb</a><br>
index d1ab87b06f..27499caa92 100644<br>
--- a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a><br>
+++ b/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a><br>
@@ -200,11 +200,6 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}/usr/lib/* ${D}/${libdir}/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/usr/lib<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 # remove build host path to improve reproducibility<br>
-=C2=A0 =C2=A0 if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; t=
hen<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s@${STAGING_DIR_HOST}@@g&#39; \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${libdir}/cmake/opencv4/O=
penCVModules.cmake<br>
-=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0# remove setup_vars_opencv4.sh as its content is confus=
ing and useless<br>
=C2=A0 =C2=A0 =C2=A0if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${bindir}/setup_vars_opencv4.s=
h<br>
@@ -222,3 +217,13 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}/${bindir}/shape ${D}/${bindir}/op=
encv_shape<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
+<br>
+do_install:append:class-target() {<br>
+=C2=A0 =C2=A0 # remove build host path to improve reproducibility<br>
+=C2=A0 =C2=A0 if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; t=
hen<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s@${STAGING_DIR_HOST}@@g&#39; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${libdir}/cmake/opencv4/O=
penCVModules.cmake<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119949): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119949" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119949</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115460185/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115460185/1997914</a><br>
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

--000000000000c6d35f063fc0ea3f--

