Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.9982.1623528200975992942
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jun 2021 13:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZJrg5wvB;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id ba2so39415356edb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jun 2021 13:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2OaA/cLKazTmABgdaOLuJXidBy68WqeHmwJtNmhY2A=;
        b=ZJrg5wvB+7M4cpSH0A3o9QTEkLNok2ap47JUP2hQpNrPfNAvycb3pix0BNIFjd0gBg
         1QYeiAZNbBAn/5DLV9J0K39lWdJX+qHGqL5h8Dhgel68f648W7B+C5fg7zIiprBgAas5
         f9FJjtxTwtYCGVjsYGazNWeNqOCEzgOV1EPt49ITIGgrG+VHLgTxN0070H9NGMlxPu1b
         vY6q+cC7kB00kzmnl0ZVLzblLEqPlRCoU2XTVFD03xc2Mi8JVQk372YXmDGUXDs1xj0c
         ZQSnxArtFmau7FBmpqDxwyVfyU4UYYeOXQqezmHp90vnkJFch3CUixO643o4Hq9zMTv7
         7FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2OaA/cLKazTmABgdaOLuJXidBy68WqeHmwJtNmhY2A=;
        b=HKsqOO6s9SbMMUb2Ybyb6eEEd/U2EadpB/g48fx9aIaYAtJYdNiAmfW4pyqQ8VQqb9
         HQbRsVrCwULFGERvzeWIPT62iqKD5eLYIkTvSmdZJhC3e5/Q8tg776cO6LAj8GE3W/Wk
         AInbw13zH9u51f/XRhARa+16f6pjmkaTfXc0Uy4E7TdUNUxD7IpyvHdY1yYtwcbmG4IM
         9SPNsJ4WH38uxHHphIXTbMsRQiN1odr0QJE4uVgwyrm7OC2D9CTrU8ktX8oSvDabUjNZ
         2gRugVxPqPnnslJMfR9Re8tOg66lahSV/iPbV6JLXcpqTPD7lZEw7dV1SUsHB8mDKq/2
         303g==
X-Gm-Message-State: AOAM530biGK2YjYnBE5xz+dG+oTJWmc/ogae8KJ7Lc/aD0NVarx2fLkL
	ExFbJAghrMZOuoQmJjkayBp2fbYkE/CDq7hVHME=
X-Google-Smtp-Source: ABdhPJwMtuN7xBYv1lSRh7Vki+9NsBtWG5w2miPKjZTlUw6wFSlAwz+vA+XW5pgHmfc1V6jdsqT8shqF0cOuCoGfDLU=
X-Received: by 2002:a05:6402:3c1:: with SMTP id t1mr9782159edw.270.1623528199435;
 Sat, 12 Jun 2021 13:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210609063831.3400611-1-schnitzeltony@gmail.com> <20210609063831.3400611-19-schnitzeltony@gmail.com>
In-Reply-To: <20210609063831.3400611-19-schnitzeltony@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 12 Jun 2021 22:03:08 +0200
Message-ID: <CA+chaQfmBEmXNda++EU-qYrS2kc5ouURk+ti00-nm+s-V+cfaA@mail.gmail.com>
Subject: Re: [oe] [PATCH 19/28] libmediaart-2.0: upgrade 1.9.4 -> 1.9.5 / merge inc file / build with meson
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009c379505c4971db6"

--0000000000009c379505c4971db6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

rygel and packagegroup-meta-multimedia.bb should be updated to respect
gobject-introspection-data restriction, now world builds are failing with:

ERROR: Nothing PROVIDES 'libmediaart-2.0' (but
meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.=
bb
DEPENDS on or otherwise requires it)
libmediaart-2.0 was skipped: missing required distro feature
'gobject-introspection-data' (not in DISTRO_FEATURES)

ERROR: Nothing RPROVIDES 'rygel' (but
meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.=
bb,
meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/package=
group-meta-multimedia.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'rygel'
NOTE: Runtime target 'rygel' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['rygel']


On Wed, Jun 9, 2021 at 8:39 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> NEW in 1.9.5 - 2021-05-22
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D
>   * libmediaart: Remove QT4 support
>   * libmediaart: Mandate that input strings are UTF8
>   * extract: Remove local storage
>   * build: Drop autotools support
>   * build: Update to recent glib API
>   * build: introspection fixes
>   * build: Added CI
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../libmediaart/libmediaart-2.0_1.9.4.bb      |  7 ------
>  .../libmediaart/libmediaart-2.0_1.9.5.bb      | 23 +++++++++++++++++++
>  .../libmediaart/libmediaart.inc               | 12 ----------
>  3 files changed, 23 insertions(+), 19 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.4.bb
>  create mode 100644 meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.5.bb
>  delete mode 100644
> meta-multimedia/recipes-support/libmediaart/libmediaart.inc
>
> diff --git a/meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.4.bb b/meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.4.bb
> deleted file mode 100644
> index 56a7873fc..000000000
> --- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.=
bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require libmediaart.inc
> -
> -SRC_URI =3D "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
> -SRC_URI[md5sum] =3D "9b960a6a764fba38135fb57219f2e6b4"
> -SRC_URI[sha256sum] =3D
> "a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d"
> -
> -S =3D "${WORKDIR}/libmediaart-${PV}"
> diff --git a/meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.5.bb
> new file mode 100644
> index 000000000..31fe43bfa
> --- /dev/null
> +++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.=
bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Library tasked with managing, extracting and handling medi=
a
> art caches"
> +
> +LICENSE =3D "LGPLv2+ & GPLv2+"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING.LESSER;md5=3D4fbd65380cdd255951079008b364516c \
> +
> file://libmediaart/extract.c;endline=3D18;md5=3Ddff2b6328ab067b5baadc135=
f9876c36
> \
> +
> file://tests/mediaarttest.c;endline=3D18;md5=3D067106eaa1f7a9d918759a096=
667f18e"
> +
> +DEPENDS =3D "glib-2.0 gdk-pixbuf"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +inherit gnomebase gobject-introspection vala features_check
> +
> +SRC_URI =3D "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D
> "07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6"
> +
> +S =3D "${WORKDIR}/libmediaart-${PV}"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST =3D "introspection"
> +
> +EXTRA_OEMESON =3D "-Dimage_library=3Dgdk-pixbuf"
> diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
> b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
> deleted file mode 100644
> index c7b368de3..000000000
> --- a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY =3D "Library tasked with managing, extracting and handling medi=
a
> art caches"
> -
> -LICENSE =3D "LGPLv2+ & GPLv2+"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING.LESSER;md5=3D4fbd65380cdd255951079008b364516c \
> -
> file://libmediaart/extract.c;endline=3D18;md5=3Ddff2b6328ab067b5baadc135=
f9876c36
> \
> -
> file://tests/mediaarttest.c;endline=3D18;md5=3D067106eaa1f7a9d918759a096=
667f18e"
> -
> -DEPENDS =3D "glib-2.0 gdk-pixbuf"
> -
> -inherit gnomebase gtk-doc gobject-introspection
> -
> -EXTRA_OECONF =3D "--disable-qt --enable-gdkpixbuf"
> --
> 2.31.1
>
>
>=20
>
>

--0000000000009c379505c4971db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>rygel and <a href=3D"http://package=
group-meta-multimedia.bb">packagegroup-meta-multimedia.bb</a> should be upd=
ated to respect gobject-introspection-data restriction, now world builds ar=
e failing with:</div><div><br></div><div>ERROR: Nothing PROVIDES &#39;libme=
diaart-2.0&#39; (but meta-openembedded/meta-multimedia/recipes-connectivity=
/rygel/<a href=3D"http://rygel_0.38.3.bb">rygel_0.38.3.bb</a> DEPENDS on or=
 otherwise requires it)<br>libmediaart-2.0 was skipped: missing required di=
stro feature &#39;gobject-introspection-data&#39; (not in DISTRO_FEATURES)<=
br></div><div><br></div><div><pre style=3D"box-sizing:inherit;white-space:p=
re-wrap;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51)">ERROR: Nothin=
g RPROVIDES &#39;rygel&#39; (but meta-openembedded/meta-multimedia/recipes-=
connectivity/rygel/<a href=3D"http://rygel_0.38.3.bb">rygel_0.38.3.bb</a>, =
meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/<a href=
=3D"http://packagegroup-meta-multimedia.bb">packagegroup-meta-multimedia.b=
b</a> RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for &#39;rygel&#39;
NOTE: Runtime target &#39;rygel&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;rygel&#39;]</pre></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Jun 9, 2021 at 8:39 AM Andreas M=C3=BCller &lt;<a href=3D"mailto:sc=
hnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">NEW in 1.9.5 - 2021-05-22<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
=C2=A0 * libmediaart: Remove QT4 support<br>
=C2=A0 * libmediaart: Mandate that input strings are UTF8<br>
=C2=A0 * extract: Remove local storage<br>
=C2=A0 * build: Drop autotools support<br>
=C2=A0 * build: Update to recent glib API<br>
=C2=A0 * build: introspection fixes<br>
=C2=A0 * build: Added CI<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../libmediaart/<a href=3D"http://libmediaart-2.0_1.9.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">libmediaart-2.0_1.9.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 ------<br>
=C2=A0.../libmediaart/<a href=3D"http://libmediaart-2.0_1.9.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libmediaart-2.0_1.9.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 23 +++++++++++++++++++<br>
=C2=A0.../libmediaart/libmediaart.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 12 ----------<br>
=C2=A03 files changed, 23 insertions(+), 19 deletions(-)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-support/libmediaart/<a hr=
ef=3D"http://libmediaart-2.0_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>libmediaart-2.0_1.9.4.bb</a><br>
=C2=A0create mode 100644 meta-multimedia/recipes-support/libmediaart/<a hr=
ef=3D"http://libmediaart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>libmediaart-2.0_1.9.5.bb</a><br>
=C2=A0delete mode 100644 meta-multimedia/recipes-support/libmediaart/libme=
diaart.inc<br>
<br>
diff --git a/meta-multimedia/recipes-support/libmediaart/<a href=3D"http:/=
/libmediaart-2.0_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart=
-2.0_1.9.4.bb</a> b/meta-multimedia/recipes-support/libmediaart/<a href=3D"=
http://libmediaart-2.0_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">libme=
diaart-2.0_1.9.4.bb</a><br>
deleted file mode 100644<br>
index 56a7873fc..000000000<br>
--- a/meta-multimedia/recipes-support/libmediaart/<a href=3D"http://libmed=
iaart-2.0_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart-2.0_1.=
9.4.bb</a><br>
+++ /dev/null<br>
@@ -1,7 +0,0 @@<br>
-require libmediaart.inc<br>
-<br>
-SRC_URI =3D &quot;${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.x=
z&quot;<br>
-SRC_URI[md5sum] =3D &quot;9b960a6a764fba38135fb57219f2e6b4&quot;<br>
-SRC_URI[sha256sum] =3D &quot;a57be017257e4815389afe4f58fdacb6a50e74fd1854=
52b23a652ee56b04813d&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/libmediaart-${PV}&quot;<br>
diff --git a/meta-multimedia/recipes-support/libmediaart/<a href=3D"http:/=
/libmediaart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart=
-2.0_1.9.5.bb</a> b/meta-multimedia/recipes-support/libmediaart/<a href=3D"=
http://libmediaart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libme=
diaart-2.0_1.9.5.bb</a><br>
new file mode 100644<br>
index 000000000..31fe43bfa<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-support/libmediaart/<a href=3D"http://libmed=
iaart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart-2.0_1.=
9.5.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Library tasked with managing, extracting and handling m=
edia art caches&quot;<br>
+<br>
+LICENSE =3D &quot;LGPLv2+ &amp; GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING.LESSER;md5=3D4fbd65380cdd255951=
079008b364516c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://libmediaart/extract.c;endline=3D18;md5=3Ddff2b6328ab067b5baadc135f9876c=
36 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://tests/mediaarttest.c;endline=3D18;md5=3D067106eaa1f7a9d918759a096667f18=
e&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 gdk-pixbuf&quot;<br>
+<br>
+GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
+<br>
+inherit gnomebase gobject-introspection vala features_check<br>
+<br>
+SRC_URI =3D &quot;${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.x=
z&quot;<br>
+SRC_URI[sha256sum] =3D &quot;07def5a42c482ae71d3e1f77a4d0fdc337f74226059a=
65284d6d5a241f0e9cd6&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/libmediaart-${PV}&quot;<br>
+<br>
+# gobject-introspection is mandatory and cannot be configured<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<br>
+UNKNOWN_CONFIGURE_WHITELIST =3D &quot;introspection&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot;-Dimage_library=3Dgdk-pixbuf&quot;<br>
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc b=
/meta-multimedia/recipes-support/libmediaart/libmediaart.inc<br>
deleted file mode 100644<br>
index c7b368de3..000000000<br>
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc<br>
+++ /dev/null<br>
@@ -1,12 +0,0 @@<br>
-SUMMARY =3D &quot;Library tasked with managing, extracting and handling m=
edia art caches&quot;<br>
-<br>
-LICENSE =3D &quot;LGPLv2+ &amp; GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING.LESSER;md5=3D4fbd65380cdd255951=
079008b364516c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://libmediaart/extract.c;endline=3D18;md5=3Ddff2b6328ab067b5baadc135f9876c=
36 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://tests/mediaarttest.c;endline=3D18;md5=3D067106eaa1f7a9d918759a096667f18=
e&quot;<br>
-<br>
-DEPENDS =3D &quot;glib-2.0 gdk-pixbuf&quot;<br>
-<br>
-inherit gnomebase gtk-doc gobject-introspection<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-qt --enable-gdkpixbuf&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009c379505c4971db6--
