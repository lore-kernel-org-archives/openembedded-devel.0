Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1176.1601565006478986219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 08:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hM5MFakq;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: ka6sox@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b22so6980066lfs.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2020 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+SS1ePr4PxsqDTvM1bP64ZjBl5DoBaQ4HKuJFDeKhc=;
        b=hM5MFakqIFA6QhmOhoGYHKYYGOuCO/HwQV+TucUzFJqKoIufVNFdXLcCaYgY/vF8iM
         cA6b95AoPANlWgfzJsf4WqTOFBsiDxluhejYVxEUNZRqBt9mFehlHCW/T7ZdmKNh6H77
         oq8PX6aIxByoXZKTlgylarr1NRb+MrWMR3mg0BsgEB0R54FXKwXoGqjCoJatP14wKQtv
         4a9EwfSK86EzUnFtfS6tWsuk+iSaT8gANPHG2/Y7GkRO8cnWhEaUnVJgQvg9OLEqiJpL
         vttRg01VCZeVl5r16rKSGnIx+rlF5rp7kJn9sOZefDavwpS1e9JlUUSvPMWhByfWKec/
         x1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+SS1ePr4PxsqDTvM1bP64ZjBl5DoBaQ4HKuJFDeKhc=;
        b=uQW3jR+JLDsw5cVLjis0ah9XMvIcxRZaVthArjBiDd8ODfR4xW96QJhqTP7cazo3XD
         C9E/RsywKgt4MKknXjayMAYEl2DmBUYWpR77WvZivfTk+oxlZ2sIrkEU9TmASpKQmre0
         l70F1V6cs6TwaU5PkkE0vJBiohaet/8c5Dh3eYQ7uE2uFBljy/28SuRsboFWNf8vVi4+
         jV24vCX4BrahAkA+eUUwlHELQ5YOIgETKkYvGwNoDTHWwWpUYv7jWvqEB9Yo7Yya8ljQ
         x3UCpmsCfbOI4T5ax3NMBR+mbxakX55VdTPSNRWkx6DBGl/MjzAk88b5hNnXSDan9HUL
         Vz0w==
X-Gm-Message-State: AOAM531dapAZHeW6VfWZw98T61iSzWHJbWP1JW3/0lMn/EdAUVpQhkBV
	QI7/sSH29L5zjrNAzubwTQx5G8Bmqpuk7l5sX8o=
X-Google-Smtp-Source: ABdhPJxHBeymMnHbRsT4biW8VfnsBzanJv4SRekOv7OXfrkCsmpo5HImpfX/l05v42Tp9/v33lJV/oti15j9jPaajBY=
X-Received: by 2002:a19:89d7:: with SMTP id l206mr3111855lfd.110.1601565004367;
 Thu, 01 Oct 2020 08:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200930232008.1342160-1-zig@zigsystem.com>
In-Reply-To: <20200930232008.1342160-1-zig@zigsystem.com>
From: "tom king" <ka6sox@gmail.com>
Date: Thu, 1 Oct 2020 08:09:52 -0700
Message-ID: <CAHQecY7n9s1JXXwxLScCVp58qSF60ggmz5a=Ji2ucuKRKDBHRw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] libuvc: add recipe
To: Zig Globulin <zig@zigsystem.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002b946905b09d69e5"

--0000000000002b946905b09d69e5
Content-Type: text/plain; charset="UTF-8"

Please add SRC_URI[md5sum] and SRC_URI[sha256sum] to recipe

Thanks

Tom

On Wed, Sep 30, 2020 at 4:20 PM Zig Globulin <zig@zigsystem.com> wrote:

> Signed-off-by: Zig Globulin <zig@zigsystem.com>
> ---
>  meta-multimedia/recipes-multimedia/libuvc/libuvc.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> new file mode 100644
> index 000000000..27cc17bc6
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "library for USB video devices built atop libusb"
> +HOMEPAGE = "https://github.com/libuvc/libuvc.git"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=2f1963e0bb88c93463af750daf9ba0c2"
> +DEPENDS = "libusb jpeg"
> +
> +SRC_URI = "git://github.com/libuvc/libuvc.git"
> +SRCREV = "ad6c72a4e390367f0d2be81aac00cfc0b6680d74"
> +PV = "v0.0.6+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> --
> 2.28.0
>
>
>
> 
>
>

--0000000000002b946905b09d69e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please add SRC_URI[md5sum] and SRC_URI[sha256sum] to recip=
e<div><br></div><div>Thanks</div><div><br></div><div>Tom</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 3=
0, 2020 at 4:20 PM Zig Globulin &lt;<a href=3D"mailto:zig@zigsystem.com">zi=
g@zigsystem.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Signed-off-by: Zig Globulin &lt;<a href=3D"mailto:zig@zigsys=
tem.com" target=3D"_blank">zig@zigsystem.com</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.b=
b" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a> | 13 +++++++++++++<br=
>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libuvc/<a href=
=
=3D"http://libuvc.bb" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a><b=
r>
<br>
diff --git a/meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://l=
ibuvc.bb" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a> b/meta-multime=
dia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.bb" rel=3D"noreferre=
r" target=3D"_blank">libuvc.bb</a><br>
new file mode 100644<br>
index 000000000..27cc17bc6<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.b=
b" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;library for USB video devices built atop libusb&quot;<b=
r>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/libuvc/libuvc.git" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/libuvc/libuvc.git</a>=
&quot;<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D2f1963e0bb88c93463af7=
50daf9ba0c2&quot;<br>
+DEPENDS =3D &quot;libusb jpeg&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/libuvc/libuvc.git" r=
el=3D"noreferrer" target=3D"_blank">github.com/libuvc/libuvc.git</a>&quot;<=
br>
+SRCREV =3D &quot;ad6c72a4e390367f0d2be81aac00cfc0b6680d74&quot;<br>
+PV =3D &quot;v0.0.6+git${SRCPV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002b946905b09d69e5--
