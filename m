Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.69997.1629382364989314280
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 07:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uiyHi4L/;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id az7so7263645qkb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ptf6tOYzbwqUJPUlSxegwujVkxUTHOK4b3q4Dwqdilo=;
        b=uiyHi4L/UB6WALLIOHqTYmV6Tdg8Xqi5C9UZKwwO8yl8PjcUx4RtA/LF71WnvPgG4M
         GU1mGdc9qJ4Tyx8xi48CxZQwZUzcWuuhNe61xd0WNHZUXyGJQZPfsJZoXkfAIZv7Nclb
         fQZXIjLrEwEXrD1rCzvfI7JrD0yOE+wiYl1E9TxdMud3muVJKEHyFzrmI3oOe2dsNODQ
         Db7Aj9YRG3OBUIu00O9yr63sK4yAs1FXC4YCkbPfhSE99Spd0nJwgCQFCpJWaFLKK24e
         pckcvaZDEbhgN74EQquU0HWjdYFnVPHs2RA1PTBps/Rt05d3FUXiUs06b0hrydFLwBto
         OHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ptf6tOYzbwqUJPUlSxegwujVkxUTHOK4b3q4Dwqdilo=;
        b=SbKXzcI7YgcKXeR78/JT3EYUmAO069lOBAUHzWuWUFg8FSdqtJWFXYa2GOG+X9PS6D
         2C6fhPG07BAij9s7QZZ+l47jNEhE0FHCgBGITEf7DCZqd1zwfUNwy2Yghv+eZR/tEuSM
         5qofaPvKBsV5OxDIl35YwfNfL/3UcmKgcKYv+A99YLkKoD2qBxRqSsTFB+VD8PokxUAW
         2JZrrEndSe5hQbpcSHtBMAA2uFp2+t2qbMzEPVBInlZnafnOvkPNgwbtDIURPOLMpn3Q
         +0dirFbNeK4NRQn7dm9m/Q9PNcAxKh753aQXGhKDKAVNWOUAR8RS21p2Vi20iyqPlbFZ
         GjUA==
X-Gm-Message-State: AOAM533jnVVcGhdgb4VzwHnOmt2R7u6g+2+0rfhIJVw4Q6T+MQ7mZoil
	01PxukqGatLNNsM7l6i0j6eKkEOpAaVCmL9K33o=
X-Google-Smtp-Source: ABdhPJzjy+nEWtgeaYUXvi0sun5Nxy2aJhZALeJG52KxeW69Tmf0XqrFOnaOZF4/wJnUxaUSLdYypKudEqCn31eZduI=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr3910786qka.125.1629382364090;
 Thu, 19 Aug 2021 07:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210819110248.3505349-1-schnitzeltony@gmail.com>
In-Reply-To: <20210819110248.3505349-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 19 Aug 2021 07:12:33 -0700
Message-ID: <CAMKF1srH-YoTsww_ZjNgY11U6CwG+cycvAMWmU8EZvbNAs+E4g@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/5] fltk/CMake: Do not export executable 'fluid'
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003d6fd05c9ea2505"

--00000000000003d6fd05c9ea2505
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 4:02 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> It does not work for us: The executable 'fluid' is not installed in
> receipe-sysroot. So fltk cmake config contains an invalid reference.
> Consumers of fltk using cmake will fail during configure for this invalid
> reference with something like:
>
> | CMake Error at
> <...>/recipe-sysroot/usr/share/fltk/FLTK-Targets.cmake:129 (message):
> |   The imported target "fluid" references the file
> |
> |      "<...>/recipe-sysroot/usr/bin/fluid"
> |
> |   but this file does not exist.


Do we get it from native sysroot then ? Or is it not required at all for
cross compiles

>
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-support/fltk/fltk.bb          |  2 +
>  ...Lists.txt-Do-not-export-fluid-target.patch | 42 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export=
-fluid-target.patch
>
> diff --git a/meta-oe/recipes-support/fltk/fltk.bb
> b/meta-oe/recipes-support/fltk/fltk.bb
> index ca2b517d7..3c9ee5ee3 100644
> --- a/meta-oe/recipes-support/fltk/fltk.bb
> +++ b/meta-oe/recipes-support/fltk/fltk.bb
> @@ -5,6 +5,8 @@ DEPENDS =3D "alsa-lib zlib jpeg libpng libxext libxft"
>  inherit features_check binconfig lib_package gtk-icon-cache mime mime-xd=
g
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> +SRC_URI +=3D
> "file://0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch"
> +
>  EXTRA_OECMAKE =3D " \
>      -DOPTION_BUILD_SHARED_LIBS=3DON \
>      -DOPTION_USE_THREADS=3DON \
> diff --git
> a/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-expo=
rt-fluid-target.patch
> b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-expo=
rt-fluid-target.patch
> new file mode 100644
> index 000000000..72bb48a32
> --- /dev/null
> +++
> b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-expo=
rt-fluid-target.patch
> @@ -0,0 +1,42 @@
> +From b6985abcb03fb09685da4044963e8f085035b208 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 19 Aug 2021 08:06:45 +0200
> +Subject: [PATCH] fluid/CMakeLists.txt: Do not export fluid target
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It does not work for us: The executable 'fluid' is not installed in
> +receipe-sysroot. So fltk cmake config contains an invalid reference.
> +Consumers of fltk using cmake will fail during configure for this invali=
d
> +reference with something like:
> +
> +| CMake Error at
> <...>/recipe-sysroot/usr/share/fltk/FLTK-Targets.cmake:129 (message):
> +|   The imported target "fluid" references the file
> +|
> +|      "<...>/recipe-sysroot/usr/bin/fluid"
> +|
> +|   but this file does not exist.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + fluid/CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/fluid/CMakeLists.txt b/fluid/CMakeLists.txt
> +index 472c84c..f971121 100644
> +--- a/fluid/CMakeLists.txt
> ++++ b/fluid/CMakeLists.txt
> +@@ -86,7 +86,6 @@ if (APPLE AND (NOT OPTION_APPLE_X11))
> +   install (TARGETS fluid DESTINATION ${FLTK_BINDIR})
> + else()
> +   install (TARGETS fluid
> +-    EXPORT FLTK-Targets
> +     RUNTIME DESTINATION ${FLTK_BINDIR}
> +     LIBRARY DESTINATION ${FLTK_LIBDIR}
> +     ARCHIVE DESTINATION ${FLTK_LIBDIR}
> +--
> +2.31.1
> +
> --
> 2.31.1
>
>
>=20
>
>

--00000000000003d6fd05c9ea2505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 19, 2021 at 4:02 AM Andreas M=C3=BCller &lt;<a =
href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">It does not work for us: The ex=
ecutable &#39;fluid&#39; is not installed in<br>
receipe-sysroot. So fltk cmake config contains an invalid reference.<br>
Consumers of fltk using cmake will fail during configure for this invalid<b=
r>
reference with something like:<br>
<br>
| CMake Error at &lt;...&gt;/recipe-sysroot/usr/share/fltk/FLTK-Targets.cma=
ke:129 (message):<br>
|=C2=A0 =C2=A0The imported target &quot;fluid&quot; references the file<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0 &quot;&lt;...&gt;/recipe-sysroot/usr/bin/fluid&quot;<=
br>
|<br>
|=C2=A0 =C2=A0but this file does not exist.</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">Do we get it from native sysroot then ? Or is it=
 not required at all for cross compiles=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmai=
l.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/fltk/<a href=3D"http://fltk.bb" rel=3D"norefe=
rrer" target=3D"_blank">fltk.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +<br>
=C2=A0...Lists.txt-Do-not-export-fluid-target.patch | 42 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 44 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/fltk/fltk/0003-fluid-CMake=
Lists.txt-Do-not-export-fluid-target.patch<br>
<br>
diff --git a/meta-oe/recipes-support/fltk/<a href=3D"http://fltk.bb" rel=3D=
"noreferrer" target=3D"_blank">fltk.bb</a> b/meta-oe/recipes-support/fltk/<=
a href=3D"http://fltk.bb" rel=3D"noreferrer" target=3D"_blank">fltk.bb</a><=
br>
index ca2b517d7..3c9ee5ee3 100644<br>
--- a/meta-oe/recipes-support/fltk/<a href=3D"http://fltk.bb" rel=3D"norefe=
rrer" target=3D"_blank">fltk.bb</a><br>
+++ b/meta-oe/recipes-support/fltk/<a href=3D"http://fltk.bb" rel=3D"norefe=
rrer" target=3D"_blank">fltk.bb</a><br>
@@ -5,6 +5,8 @@ DEPENDS =3D &quot;alsa-lib zlib jpeg libpng libxext libxft&=
quot;<br>
=C2=A0inherit features_check binconfig lib_package gtk-icon-cache mime mime=
-xdg<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
+SRC_URI +=3D &quot;file://0003-fluid-CMakeLists.txt-Do-not-export-fluid-ta=
rget.patch&quot;<br>
+<br>
=C2=A0EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DOPTION_BUILD_SHARED_LIBS=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DOPTION_USE_THREADS=3DON \<br>
diff --git a/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do=
-not-export-fluid-target.patch b/meta-oe/recipes-support/fltk/fltk/0003-flu=
id-CMakeLists.txt-Do-not-export-fluid-target.patch<br>
new file mode 100644<br>
index 000000000..72bb48a32<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-ex=
port-fluid-target.patch<br>
@@ -0,0 +1,42 @@<br>
+From b6985abcb03fb09685da4044963e8f085035b208 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br=
>
+Date: Thu, 19 Aug 2021 08:06:45 +0200<br>
+Subject: [PATCH] fluid/CMakeLists.txt: Do not export fluid target<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+It does not work for us: The executable &#39;fluid&#39; is not installed i=
n<br>
+receipe-sysroot. So fltk cmake config contains an invalid reference.<br>
+Consumers of fltk using cmake will fail during configure for this invalid<=
br>
+reference with something like:<br>
+<br>
+| CMake Error at &lt;...&gt;/recipe-sysroot/usr/share/fltk/FLTK-Targets.cm=
ake:129 (message):<br>
+|=C2=A0 =C2=A0The imported target &quot;fluid&quot; references the file<br=
>
+| <br>
+|=C2=A0 =C2=A0 =C2=A0 &quot;&lt;...&gt;/recipe-sysroot/usr/bin/fluid&quot;=
<br>
+| <br>
+|=C2=A0 =C2=A0but this file does not exist.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
+---<br>
+ fluid/CMakeLists.txt | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/fluid/CMakeLists.txt b/fluid/CMakeLists.txt<br>
+index 472c84c..f971121 100644<br>
+--- a/fluid/CMakeLists.txt<br>
++++ b/fluid/CMakeLists.txt<br>
+@@ -86,7 +86,6 @@ if (APPLE AND (NOT OPTION_APPLE_X11))<br>
+=C2=A0 =C2=A0install (TARGETS fluid DESTINATION ${FLTK_BINDIR})<br>
+ else()<br>
+=C2=A0 =C2=A0install (TARGETS fluid<br>
+-=C2=A0 =C2=A0 EXPORT FLTK-Targets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${FLTK_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${FLTK_LIBDIR}<br>
+=C2=A0 =C2=A0 =C2=A0ARCHIVE DESTINATION ${FLTK_LIBDIR}<br>
+-- <br>
+2.31.1<br>
+<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000003d6fd05c9ea2505--
