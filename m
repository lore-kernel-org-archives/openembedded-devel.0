Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.4650.1596891755813749472
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 06:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cdqQsURp;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id r7so2080670vsq.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJJBPYR9YJUI2kgPII4tWkPfserekYBIhHBnoZn6mo8=;
        b=cdqQsURpeZXEfqL1VDPq9YOXw5I6yO1D+iJpcdcXu+MTYoAdWESfVofd6cx91Lusc1
         rTmWiF4DtOSuxW+FwpqyGZhzZjQOmex3clFp9kHeHpdWlfjDvXHogZaMT45r7oJp+vfk
         31TZIBcVyACcHGBT8LXn1JDW0hGMyGNnN0Hj3MtDqmIxTjIn8hDKpmbMNukWrdW/eDdn
         xNtKc64nOILrNSCUc9IJ/c3iN0O0Fo+BZX7kbbYaND+AblN5Jt6K+cfR0fT5c+l9dsF5
         barutx/u1dxGAPwVYzPoqDvg13W5oazJ1weRHUTpBpX64UABmUcpMirLEbDyGI7qslFp
         K1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJJBPYR9YJUI2kgPII4tWkPfserekYBIhHBnoZn6mo8=;
        b=qcvuKg4Lo788aImAq4x1saRwut0TBe5teh5IkiTPhqd2Kstdz7XqR4htQ1Ym6NQtXr
         o7BvwYyuKaB7RqQFB1puq6JfjnV7MstTLg3oubFr3pWk9E1S+9F1TRLYScqk0jQ0gX90
         Hq1h2tveA6QWYB7Z1isYvmLziKbIOJzE/PTW7ouWsZljB8SfH1Ft6nxH2OVGQ79+exBe
         rFgGSkKE0fi2j6+LlnUKn4EZXdRr2xLk1rgm48LKEtHh2VqJwYAu/1oqpdaG6jJH873M
         A3Yvy36f+1+TDpoKO/bRj9avki0Pm/bXDEe0SFIoLbPSbd252ExIfYVSh8vJMdZHiu0a
         C6fQ==
X-Gm-Message-State: AOAM532YmqcJePBpc7CS3eIqWvmbhYs0SGEfOV8EgoH9NGux1LerILaN
	OyV/pzjfbIEZ49mVu9H5hHNrWTXZtWpuKFoCBBZLh9aX
X-Google-Smtp-Source: ABdhPJwAJGd3rD9d8jXp6+juf63OUuVaXvQkL9GWfB5CN0JZ1DYxs19FcurlC3Sz/xYB1FZOeiFKHnzXWrQmv9CBwB4=
X-Received: by 2002:a67:6305:: with SMTP id x5mr13759123vsb.35.1596891754855;
 Sat, 08 Aug 2020 06:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200808125351.17467-1-bunk@stusta.de>
In-Reply-To: <20200808125351.17467-1-bunk@stusta.de>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 8 Aug 2020 15:02:23 +0200
Message-ID: <CANNYZj-qKd0A=DTeDYEHwZ-RpWZnKLo4caJN--GpMk3-=rFKPQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpeas: gobject-introspection is mandatory and cannot be configured
To: Adrian Bunk <bunk@stusta.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb01bb05ac5d55e5"

--000000000000cb01bb05ac5d55e5
Content-Type: text/plain; charset="UTF-8"

There is an option for it:
https://gitlab.gnome.org/GNOME/libpeas/-/blob/master/meson_options.txt#L12

so maybe it's a bug somehow?

Alex

On Sat, 8 Aug 2020 at 14:54, Adrian Bunk <bunk@stusta.de> wrote:

> ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR:
> Unknown variable "libpeas_gir".
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> index 881751008..1b754343a 100644
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> @@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>
>  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
> features_check
>
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection
> --disable-introspection"
> +
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI += " \
> --
> 2.17.1
>
> 
>

--000000000000cb01bb05ac5d55e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There is an option for it:</div><div><a href=3D"https=
://gitlab.gnome.org/GNOME/libpeas/-/blob/master/meson_options.txt#L12">http=
s://gitlab.gnome.org/GNOME/libpeas/-/blob/master/meson_options.txt#L12</a><=
/div><div><br></div><div>so maybe it&#39;s a bug somehow?</div><div><br></d=
iv><div>Alex<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Sat, 8 Aug 2020 at 14:54, Adrian Bunk &lt;<a href=3D"ma=
ilto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">../libpeas-1.26.0/tests/libpeas/introspe=
ction/meson.build:47:0: ERROR: Unknown variable &quot;libpeas_gir&quot;.<br=
>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D=
"_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a> b/meta-oe/=
recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.bb" rel=3D"noreferre=
r" target=3D"_blank">libpeas_1.26.0.bb</a><br>
index 881751008..1b754343a 100644<br>
--- a/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a><br>
+++ b/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a><br>
@@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
<br>
=C2=A0inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache featu=
res_check<br>
<br>
+# gobject-introspection is mandatory and cannot be configured<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<br>
+UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; --enable-introspection --di=
sable-introspection&quot;<br>
+<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000cb01bb05ac5d55e5--
