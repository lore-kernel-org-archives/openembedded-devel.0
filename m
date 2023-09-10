Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F53EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 21:18:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.45114.1694380714421884708
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 14:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L5w+OwNq;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so3485040f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694380712; x=1694985512; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hZWmJu8FTeEPkOS8si7X6oH+/8gifx3hbMqjwHVYpRI=;
        b=L5w+OwNq8FkRo8bEirEUEvgMhKZM26aU9Y+htL9XH5wyW2nYbTPt7MgyrsubNpbyUt
         jtbhqIJFhQxnBx9ek/2wCM7M29dZzPDc6Tw3NHv3RMTQ9iKPD3WCkGntgBeidHkQI8tv
         BN4n2Tjqaebg7hQAp9Lp/5qlkXPpRTyIrJ7bfhqwWv5wTnJYrf9rMm40wXnT0FZV6Elu
         rxKYgDuNWYq6S13VJFr52v1Jq/gD118KZjAahzhGLxgDEF8booTWKllUglpp10uJfavC
         44DVl0AKWRaZq7KD71PDAtK0WZ6bBHXSINuAkr2MCnVR5/qUApBtrcpmEmni3IZTwjbJ
         3acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694380712; x=1694985512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZWmJu8FTeEPkOS8si7X6oH+/8gifx3hbMqjwHVYpRI=;
        b=ZCZ+WZUIT4XbxS5ev8flqsMsLz7grbXBFmP9+855zOyhHM0ef6DSlHeo6HISTAWtFD
         2g62evHG7Yn1ymIH3iQjl2eyYmbYP0vcWOBJgSFJxEOeVNmK6YwjazbeAyUmKp5XK9rS
         diN2qCZ42PPIzjrxoBvfm4HBQypRcVJB00N3QbzYzFoMywPd78Yay1Z6fnvBcLzvJyB2
         ow4hgsCBWQWYe1RJ4Z409IumYVk6oaKvnGrZ8q5r10jwKd9T3wqh6BJsL6fLutuwmWws
         QgrC7bP766fMK7E8Mv5aCn63gzVss10UorEh6cLnQ6u6k04gVXgCqDYP3N5rTIipK/vk
         ECcg==
X-Gm-Message-State: AOJu0YxlE0uBSdXpz5MjLPr5uI2Bg8QTmGgXeowvQJZNQVj4/lLgOyQX
	oQA00BT9RTRtUj8eAx1TAgUibgCIdO+FaVY8rr0=
X-Google-Smtp-Source: AGHT+IFzLOeSfpJaHqFqwr1wd6vOMJZo0YUpmJuel2Ssx2hIl3thA807Y6CZyW1gIwN8Zezoc7fXthUQMC6htHwr0EM=
X-Received: by 2002:a5d:4910:0:b0:317:e5ec:8767 with SMTP id
 x16-20020a5d4910000000b00317e5ec8767mr5583299wrq.21.1694380712159; Sun, 10
 Sep 2023 14:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230910210811.2335948-1-raj.khem@gmail.com>
In-Reply-To: <20230910210811.2335948-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Sep 2023 23:18:21 +0200
Message-ID: <CA+chaQdy8WXLndq64v05wHXJ2ObGYqkURzc3S2XNfRh=E0DAsg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sharutils: Check for intmax_t using configure
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000766fe7060507c0e7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 21:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104831

--000000000000766fe7060507c0e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for this, I've seen it in my world builds yesterday as well. Do you
know what caused this to fail suddenly? Was it that gettext upgrade? as
there weren't many changes since last successful build and sharutils
doesn't depend on much.

Cheers,

On Sun, Sep 10, 2023 at 11:08=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> fixes
> ../../sharutils-4.15.2/lib/system.h:45:14: error: typedef redefinition
> with different types ('long' vs '__intmax_t' (aka 'long long'))
>    45 | typedef long intmax_t;
>       |              ^
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...re.ac-Check-and-define-intmax_t-type.patch | 32 +++++++++++++++++++
>  .../sharutils/sharutils_4.15.2.bb             |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and-d=
efine-intmax_t-type.patch
>
> diff --git
> a/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and=
-define-intmax_t-type.patch
> b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and=
-define-intmax_t-type.patch
> new file mode 100644
> index 0000000000..32562a08bc
> --- /dev/null
> +++
> b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and=
-define-intmax_t-type.patch
> @@ -0,0 +1,32 @@
> +From ea6f7a4c22f1b6f28cf426566cccd65eb9a0e9de Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 10 Sep 2023 13:52:31 -0700
> +Subject: [PATCH] configure.ac: Check and define intmax_t type
> +
> +If stdint.h or inttypes.h defines the type intmax_t, define HAVE_INTMAX_=
T.
> +Otherwise, define intmax_t to the widest signed integer type.
> +
> +intmax_t is defined in lib/system.h if system is not providing it but it
> +needs to be checked by configure for existence first.
> +
> +Upstream-Status: Submitted [https://savannah.gnu.org/bugs/index.php?6465=
3
> ]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1242cb7..2ccaac9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -72,6 +72,7 @@ AC_HEADER_STAT
> + AC_HEADER_STDC
> + AC_STRUCT_TIMEZONE
> + AC_TYPE_SIZE_T
> ++AC_TYPE_INTMAX_T
> + AC_CHECK_FUNCS([fchmod isascii strchr])
> + AC_FUNC_CLOSEDIR_VOID
> + AC_FUNC_FSEEKO
> +--
> +2.42.0
> +
> diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> index bd2776e1bc..2a16b18288 100644
> --- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> +++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://0001-Fix-build-with-recent-gettext.patch \
>             file://0001-Fix-building-with-GCC-10.patch \
>             file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
> +           file://0001-configure.ac-Check-and-define-intmax_t-type.patch=
 \
>             "
>  SRC_URI[md5sum] =3D "32a51b23e25ad5e6af4b89f228be1800"
>  SRC_URI[sha256sum] =3D
> "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104830):
> https://lists.openembedded.org/g/openembedded-devel/message/104830
> Mute This Topic: https://lists.openembedded.org/mt/101280770/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000766fe7060507c0e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>thanks for this, I&#39;ve seen it i=
n my world builds yesterday as well. Do you know what caused this to fail s=
uddenly? Was it that gettext upgrade? as there weren&#39;t many changes sin=
ce last successful build and sharutils doesn&#39;t depend on much.</div><di=
v><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Sep 10, 2023 at 11:08=E2=80=AFPM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">fixes<br>
../../sharutils-4.15.2/lib/system.h:45:14: error: typedef redefinition with=
 different types (&#39;long&#39; vs &#39;__intmax_t&#39; (aka &#39;long lon=
g&#39;))<br>
=C2=A0 =C2=A045 | typedef long intmax_t;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...re.ac-Check-and-define-intmax_t-type.patch | 32 ++++++++++++++++++=
+<br>
=C2=A0.../sharutils/<a href=3D"http://sharutils_4.15.2.bb" rel=3D"noreferre=
r" target=3D"_blank">sharutils_4.15.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-c=
onfigure.ac-Check-and-define-intmax_t-type.patch<br>
<br>
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-=
Check-and-define-intmax_t-type.patch b/meta-oe/recipes-support/sharutils/sh=
arutils/0001-configure.ac-Check-and-define-intmax_t-type.patch<br>
new file mode 100644<br>
index 0000000000..32562a08bc<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-a=
nd-define-intmax_t-type.patch<br>
@@ -0,0 +1,32 @@<br>
+From ea6f7a4c22f1b6f28cf426566cccd65eb9a0e9de Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Sun, 10 Sep 2023 13:52:31 -0700<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: Check and define intmax_t type<br>
+<br>
+If stdint.h or inttypes.h defines the type intmax_t, define HAVE_INTMAX_T.=
<br>
+Otherwise, define intmax_t to the widest signed integer type.<br>
+<br>
+intmax_t is defined in lib/system.h if system is not providing it but it<b=
r>
+needs to be checked by configure for existence first.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://savannah.gnu.org/bugs/index=
.php?64653" rel=3D"noreferrer" target=3D"_blank">https://savannah.gnu.org/b=
ugs/index.php?64653</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 1242cb7..2ccaac9 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -72,6 +72,7 @@ AC_HEADER_STAT<br>
+ AC_HEADER_STDC<br>
+ AC_STRUCT_TIMEZONE<br>
+ AC_TYPE_SIZE_T<br>
++AC_TYPE_INTMAX_T<br>
+ AC_CHECK_FUNCS([fchmod isascii strchr])<br>
+ AC_FUNC_CLOSEDIR_VOID<br>
+ AC_FUNC_FSEEKO<br>
+-- <br>
+2.42.0<br>
+<br>
diff --git a/meta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_=
4.15.2.bb" rel=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a> b/m=
eta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_4.15.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a><br>
index bd2776e1bc..2a16b18288 100644<br>
--- a/meta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_4.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a><br>
+++ b/meta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_4.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a><br>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-with-recent=
-gettext.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-building-with-GCC=
-10.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Do-not-include-lib-md=
5.c-into-src-shar.c.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Check-an=
d-define-intmax_t-type.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;32a51b23e25ad5e6af4b89f228be1800&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ee336e68549664e7a19b117adf02edfdeac6307f=
22e5ba78baca457116914637&quot;<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104830): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104830" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104830</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101280770/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101280770/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000766fe7060507c0e7--

