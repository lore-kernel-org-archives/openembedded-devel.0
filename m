Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.1160.1585935058635155351
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cQeY3MfM;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id m15so8353047iob.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5Qvz9aFygHFihQxwKK2dBw+bTDGAIuzLOpgo7W9Qw0=;
        b=cQeY3MfMCPFoASCevGQZDFEGj6c0gD0b8T0Z8Nhre9VUo2bCnogJGZ/PXiTiP1FZaQ
         lWkKEsgCwQqhSnJpFsowOtipRK/ZhBB6iAqtUzzSbdBujVfkh+4xYIE7dXxKYmCkhdZa
         2HTVluYH2xE50B9x3Id1DCIPTEEIl6KvqYX2E0dDC8W+knuMqhc1r6lK5gKHk16/h6Uz
         eWpYgGcByR70R9mNcOQCH8a2kSivf6NVUCt5UoSQCu6g3gnm5vpdOuN0OaP7f52ImEr9
         bdRqX8f8gVHRLz1BIJOb30+vQYWtQe9ZiMtVbD4wvkWjsntPCgzy2dMwN9jRWcx2IUcK
         iulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5Qvz9aFygHFihQxwKK2dBw+bTDGAIuzLOpgo7W9Qw0=;
        b=gKyYQi9Tj0uOfcaaM299j53DNic4lsIC1pf6USiBZq+SWHpgFGP2n/osXM3B5HCCdE
         GtJfawIUF8jnt9gpB2+Nn5kMAK93/DcjL4p5D7yai4I5fOM4VlciCr9d4sQI2Z8/+GE1
         R4rtj4Z60Z/i2+QkYb8iSTBCkQWwv4XbrKTa8Sr92RUfexu3fs5/NVIQ2gqZ1LAz0AJc
         ZGod7DXG/NR+MCgpYZbtTcactf8z678xpeUolF0Ld1MdWPvkrnBB+7wBDz4IrsqOoyJE
         tspzqze18+Y279Dam2w3fQG5tqGnuLCGI9Z2vNv27fNAatb5aJOm9pO4NM71yeQduEAD
         x7gg==
X-Gm-Message-State: AGi0PuYXgVAy4+LCxRHBfhFsUMurGr38u3cddLqs+A2y+B8ICZPYyPvP
	upMDcmjTLOgmRp3YMNdpycSRHHWL06jTocxa4zb0WmCY
X-Google-Smtp-Source: APiQypLvqbJaludEpcEdwFKyM4aABfSpPYozvMwnTzT/913a1qoTWAiO4/ffyQ2zxN8c3ONycCee+y6YT3Fc5PTBTXY=
X-Received: by 2002:a6b:610b:: with SMTP id v11mr8776221iob.146.1585935058011;
 Fri, 03 Apr 2020 10:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com> <1585901748-16446-3-git-send-email-leon.anavi@konsulko.com>
In-Reply-To: <1585901748-16446-3-git-send-email-leon.anavi@konsulko.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 3 Apr 2020 10:30:47 -0700
Message-ID: <CANx9H-Cjz=5vm6sRUJC3c6uSeS9Revmt4Fby0P7B5Cs-DTHxxw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python-luma-oled: add new recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c508da05a2664772"

--000000000000c508da05a2664772
Content-Type: text/plain; charset="UTF-8"

We do not want separate .inc and .bb files. It makes recipe upgrades with
devtool/AUH difficult. Please merge .inc and .bb

On Fri, Apr 3, 2020 at 1:16 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Python library interfacing OLED matrix displays with the SSD1306,
> SSD1309, SSD1322, SSD1325, SSD1327, SSD1331, SSD1351 or SH1106
> driver using I2C/SPI on the Raspberry Pi and other single-board
> computers.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../recipes-devtools/python/python-luma-oled.inc       | 18
> ++++++++++++++++++
>  .../recipes-devtools/python/python3-luma-oled_3.4.0.bb |  2 ++
>  2 files changed, 20 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-luma-oled.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-luma-oled_3.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-luma-oled.inc
> b/meta-python/recipes-devtools/python/python-luma-oled.inc
> new file mode 100644
> index 0000000..dc59024
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-luma-oled.inc
> @@ -0,0 +1,18 @@
> +SUMMARY = "A small library to drive an OLED device"
> +DESCRIPTION = "\
> +A small library to drive an OLED device with either SSD1306 , SSD1309,
> SSD1322, \
> +SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset"
> +HOMEPAGE = "https://github.com/rm-hull/luma.oled"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
> +
> +SRC_URI[md5sum] = "2944155b2242b9d2ddeb6e139c6083b8"
> +SRC_URI[sha256sum] =
> "2ea2b535e7e2f056a51a8c54ad78aa1f00d5699fc439c01bc7c2902823889552"
> +
> +CLEANBROKEN = "1"
> +
> +PYPI_PACKAGE = "luma.oled"
> +
> +RDEPENDS_${PN} += " \
> +       ${PYTHON_PN}-luma-core \
> +"
> diff --git a/meta-python/recipes-devtools/python/
> python3-luma-oled_3.4.0.bb b/meta-python/recipes-devtools/python/
> python3-luma-oled_3.4.0.bb
> new file mode 100644
> index 0000000..4f64a92
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-luma-oled.inc
> --
> 2.7.4
>
> 
>

--000000000000c508da05a2664772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">We do not want separate .inc and .bb files. It makes=
 recipe upgrades with devtool/AUH difficult. Please merge .inc and .bb</div=
></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Apr 3, 2020 at 1:16 AM Leon Anavi &lt;<a href=3D"mailto:leon.=
anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Python library interfacing OLED matrix displays wit=
h the SSD1306,<br>
SSD1309, SSD1322, SSD1325, SSD1327, SSD1331, SSD1351 or SH1106<br>
driver using I2C/SPI on the Raspberry Pi and other single-board<br>
computers.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-luma-oled.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-luma-oled_3.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled_3.4.0.bb</a> |=
=
=C2=A0 2 ++<br>
=C2=A02 files changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python-luma-o=
led.inc<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-luma-oled_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-luma-oled_3.4.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-luma-oled.inc b/me=
ta-python/recipes-devtools/python/python-luma-oled.inc<br>
new file mode 100644<br>
index 0000000..dc59024<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python-luma-oled.inc<br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;A small library to drive an OLED device&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+A small library to drive an OLED device with either SSD1306 , SSD1309, SS=
D1322, \<br>
+SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/rm-hull/luma.oled" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/rm-hull/luma.oled</a>=
&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3Dc328c862c3335ad464e1c=
9a3ba574249&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;2944155b2242b9d2ddeb6e139c6083b8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2ea2b535e7e2f056a51a8c54ad78aa1f00d5699fc439=
c01bc7c2902823889552&quot;<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;luma.oled&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-luma-core \<br>
+&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-luma-oled_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled=
_3.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-luma-oled_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-ol=
ed_3.4.0.bb</a><br>
new file mode 100644<br>
index 0000000..4f64a92<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-o=
led_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-oled_3.4.0.=
bb</a><br>
@@ -0,0 +1,2 @@<br>
+inherit pypi setuptools3<br>
+require python-luma-oled.inc<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--000000000000c508da05a2664772--
