Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.19214.1622280980378166741
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 02:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kb9FBB2j;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id e12so8960226ejt.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMtnbcOgs9huSPZIDnjGksR5fr+Ue43McNfCMJYBZeY=;
        b=Kb9FBB2jURDCZ9ZQabYV1Xn0zfuopz7u5JrEyvK7+ObcdQSyE8C6DYipFGrRVae78g
         yI5FqYOzmkHsYngBlblvQS/8Hd4cyCAcCvuLfGWjNQULtXBnbIyTIRfz67BMXm9IZ+no
         dL1r5uzL78aDCK/7oBp95s26+rE5tAdb/0QHf7WeMTrIl86IK57flu0h1l7iN1/BoFEh
         esyjbU1qn5GR1fOjRteuX1iT+ks0jlbRk23WwejPa+RteBJTYGs90/+U85ZqVk+H41MV
         AZWQNwd9EnFrmlAzLw3yR7vuK/9ct0k3RH5h2lKYbrPVldNeV3IB+i1Tsaf/vQGEysvL
         Lg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMtnbcOgs9huSPZIDnjGksR5fr+Ue43McNfCMJYBZeY=;
        b=H811uXVmYZCiKcfW7hW8i3P+82U/B3GGAYXR1DCcjORqFlWHRv63O0f95cajs+c92K
         M7zJw1eJt1Fw25VFZWuCpaKfjf07wMKDzIX1xnkEglbW5kbhGzo1D06psNPi8K//ka0z
         IqUbN2DFCxDeSFDMXL0m+QAhJRbVwQoEnAK3cCP05NPasi++QqpP6l+0RYCANOt0Ja1M
         mjoxMhAZ7TWyg12uG6PCz3hbOeE27ccIi2GjL6uxKc/w5rnM8ZgH2YKVJpnwNIM7G3ay
         vGmU2DaDINoFBWEF7Lz37qV7LUNJTaD/a7u27DsUUppQ/NInry8hLRHPXCfbuIHRNaOj
         +7rA==
X-Gm-Message-State: AOAM531a1Q5IH5s6nViXfGxvBfRE4Z+V0YBrRWNiern19vjdH1FPSAUc
	3gK8O9XwIhhY4c807bG/oZclhecVE1zsfE39zvs=
X-Google-Smtp-Source: ABdhPJySnjdsPkc9W6GSyt2evgwRBiXNOHfXfIoirW8QQWpAbNgsOtXLqhyGoFcmqn/Mt2zH0zgh2T/SUf5ZfXV/mOw=
X-Received: by 2002:a17:906:d97:: with SMTP id m23mr3818572eji.392.1622280978685;
 Sat, 29 May 2021 02:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210523223353.2576671-1-schnitzeltony@gmail.com> <20210523223353.2576671-6-schnitzeltony@gmail.com>
In-Reply-To: <20210523223353.2576671-6-schnitzeltony@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 29 May 2021 11:36:07 +0200
Message-ID: <CA+chaQfkJPwW-QA_EHApRL-k7GR9iO=M5CarVLzatSs8wNzpGw@mail.gmail.com>
Subject: Re: [oe] [PATCH 6/7] gtkwave: upgrade 3.3.108 -> 3.3.109 / move to gtk3 / tidy up recipe
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000075e67105c374b9c0"

--00000000000075e67105c374b9c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is now failing with:

| In file included from ../../gtkwave-gtk3-3.3.109/src/debug.h:17,
|                  from ../../gtkwave-gtk3-3.3.109/src/vlist.h:18,
|                  from ../../gtkwave-gtk3-3.3.109/src/analyzer.h:18,
|                  from ../../gtkwave-gtk3-3.3.109/src/symbol.h:20,
|                  from ../../gtkwave-gtk3-3.3.109/src/vcd.h:32,
|                  from ../../gtkwave-gtk3-3.3.109/src/ae2.h:16,
|                  from ../../gtkwave-gtk3-3.3.109/src/globals.h:27,
|                  from ../../gtkwave-gtk3-3.3.109/src/timeentry.c:11:
| ../../gtkwave-gtk3-3.3.109/src/gtk23compat.h:12:10: fatal error:
gdk/gdkwayland.h: No such file or directory
|    12 | #include <gdk/gdkwayland.h>
|       |          ^~~~~~~~~~~~~~~~~~

Will send a patch to restrict REQUIRED_DISTRO_FEATURES to wayland only
(instead of GTK3DISTROFEATURES which includes x11 as well).

On Mon, May 24, 2021 at 12:34 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...{gtkwave_3.3.108.bb =3D> gtkwave_3.3.109.bb} | 33 ++++++++++++++----=
-
>  1 file changed, 25 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.108.bb =3D>
> gtkwave_3.3.109.bb} (47%)
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> similarity index 47%
> rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
> rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> index d9b6886ec..2b572f7e2 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
> @@ -5,19 +5,36 @@ HOMEPAGE =3D "http://gtkwave.sourceforge.net/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef42=
722e"
>
> -SRC_URI =3D "http://gtkwave.sourceforge.net/${BP}.tar.gz"
> +SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
> +SRC_URI[sha256sum] =3D
> "35461eccd9b8b4470caa78ab9a8f14ecacbcc9eff63033d8dce58093e786deb7"
> +S =3D "${WORKDIR}/${BPN}-gtk3-${PV}"
>
> -SRC_URI[md5sum] =3D "dd40f09f44d7aed937e63c29b63cd3af"
> -SRC_URI[sha256sum] =3D
> "ece447340442e7ad029713789552e8392b75dd3808c882ac5193d42fce55eb3b"
> +DEPENDS =3D " \
> +    gperf-native \
> +    gtk+3 \
> +    gdk-pixbuf \
> +    tcl \
> +    tk \
> +    bzip2 \
> +    xz \
> +    pango \
> +    zlib \
> +"
>
>  inherit pkgconfig autotools gettext texinfo mime mime-xdg
> -DEPENDS +=3D "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf
> glib-2.0"
> -RDEPENDS_${PN} +=3D "tk-lib"
>
> -# depends on gtk+ which has this restriction
> +# depends on gtk+3 which has this restriction
>  inherit features_check
> -ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -EXTRA_OECONF =3D "--with-tcl=3D${STAGING_BINDIR_CROSS}
> --with-tk=3D${STAGING_BINDIR_CROSS} --with-tirpc --disable-mime-update"
> +EXTRA_OECONF =3D " \
> +    --enable-gtk3 \
> +    --with-tcl=3D${STAGING_BINDIR_CROSS} \
> +    --with-tk=3D${STAGING_BINDIR_CROSS} \
> +    --with-tirpc \
> +    --disable-mime-update \
> +"
>
>  FILES_${PN} =3D "${bindir} ${datadir}"
> +
> +RDEPENDS_${PN} +=3D "tk-lib"
> --
> 2.31.1
>
>
>=20
>
>

--00000000000075e67105c374b9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is now failing with:<div><br><div>| In file included =
from ../../gtkwave-gtk3-3.3.109/src/debug.h:17,<br>| =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../gtkwave-gtk3-3.3.109/s=
rc/vlist.h:18,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from ../../gtkwave-gtk3-3.3.109/src/analyzer.h:18,<br>| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../gtkwave-gtk=
3-3.3.109/src/symbol.h:20,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from ../../gtkwave-gtk3-3.3.109/src/vcd.h:32,<br>| =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../gtkw=
ave-gtk3-3.3.109/src/ae2.h:16,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from ../../gtkwave-gtk3-3.3.109/src/globals.h:27,<=
br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gtkwave-gtk3-3.3.109/src/timeentry.c:11:<br>| ../../gtkwave-gtk3-3.3.109=
/src/gtk23compat.h:12:10: fatal error: gdk/gdkwayland.h: No such file or di=
rectory<br>| =C2=A0 =C2=A012 | #include &lt;gdk/gdkwayland.h&gt;<br>| =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<b=
r></div></div><div><br></div><div>Will send a patch to restrict REQUIRED_DI=
STRO_FEATURES to wayland only (instead of=C2=A0GTK3DISTROFEATURES which inc=
ludes x11 as well).</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, May 24, 2021 at 12:34 AM Andreas M=C3=BCll=
er &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.=
com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://gtkwave_3.3.108.bb" rel=3D"noreferrer" target=
=3D"_blank">gtkwave_3.3.108.bb</a> =3D&gt; <a href=3D"http://gtkwave_3.3.1=
09.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a>} | 33 ++=
++++++++++++-----<br>
=C2=A01 file changed, 25 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/gtkwave/{<a href=3D"http://gtkwave_3=
.3.108.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.108.bb</a> =3D&=
gt; <a href=3D"http://gtkwave_3.3.109.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gtkwave_3.3.109.bb</a>} (47%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.=
3.108.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.108.bb</a> b/met=
a-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.bb" rel=3D"=
noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a><br>
similarity index 47%<br>
rename from meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3=
.108.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.108.bb</a><br>
rename to meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.1=
09.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a><br>
index d9b6886ec..2b572f7e2 100644<br>
--- a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.108.b=
b" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.108.bb</a><br>
+++ b/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.109.b=
b" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.109.bb</a><br>
@@ -5,19 +5,36 @@ HOMEPAGE =3D &quot;<a href=3D"http://gtkwave.sourceforge=
.net/" rel=3D"noreferrer" target=3D"_blank">http://gtkwave.sourceforge.net/=
</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D75859989545e37968a99=
b631ef42722e&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/$%7BBP%7D.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">http://gtkwave.sourceforge.net/${=
BP}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/gtkwave-gtk3-=
$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://gtkwave.sourc=
eforge.net/gtkwave-gtk3-${PV}.tar.gz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;35461eccd9b8b4470caa78ab9a8f14ecacbcc9eff630=
33d8dce58093e786deb7&quot;<br>
+S =3D &quot;${WORKDIR}/${BPN}-gtk3-${PV}&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;dd40f09f44d7aed937e63c29b63cd3af&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ece447340442e7ad029713789552e8392b75dd3808c8=
82ac5193d42fce55eb3b&quot;<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 gperf-native \<br>
+=C2=A0 =C2=A0 gtk+3 \<br>
+=C2=A0 =C2=A0 gdk-pixbuf \<br>
+=C2=A0 =C2=A0 tcl \<br>
+=C2=A0 =C2=A0 tk \<br>
+=C2=A0 =C2=A0 bzip2 \<br>
+=C2=A0 =C2=A0 xz \<br>
+=C2=A0 =C2=A0 pango \<br>
+=C2=A0 =C2=A0 zlib \<br>
+&quot;<br>
<br>
=C2=A0inherit pkgconfig autotools gettext texinfo mime mime-xdg<br>
-DEPENDS +=3D &quot;tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbu=
f glib-2.0&quot;<br>
-RDEPENDS_${PN} +=3D &quot;tk-lib&quot;<br>
<br>
-# depends on gtk+ which has this restriction<br>
+# depends on gtk+3 which has this restriction<br>
=C2=A0inherit features_check<br>
-ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
-EXTRA_OECONF =3D &quot;--with-tcl=3D${STAGING_BINDIR_CROSS} --with-tk=3D$=
{STAGING_BINDIR_CROSS} --with-tirpc --disable-mime-update&quot;<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 --enable-gtk3 \<br>
+=C2=A0 =C2=A0 --with-tcl=3D${STAGING_BINDIR_CROSS} \<br>
+=C2=A0 =C2=A0 --with-tk=3D${STAGING_BINDIR_CROSS} \<br>
+=C2=A0 =C2=A0 --with-tirpc \<br>
+=C2=A0 =C2=A0 --disable-mime-update \<br>
+&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;${bindir} ${datadir}&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;tk-lib&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000075e67105c374b9c0--
