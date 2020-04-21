Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.2934.1587442811702712136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 21:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jwy1Ip1v;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id r19so682043qtu.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 21:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vhbCaoUOcz/WP/wT9Dbk6Il0t2YSTThDsq1w43DK4I8=;
        b=jwy1Ip1v/lZZT6tbRxculO7TdhZN14heiR3ua5fzUUNAauUXs39uQt9dYT82F1zb2K
         8Ps4dPOFQgomopX44us0MhcXpQytOy/WP8dHAG0tw2P8LGNjFLortONzreiiV88bk2yu
         r7YkiFPPa0fY71v0XIeYXIrR5gzbAxnLSSWGGEbgPVdQ8Glko5pm+il093L+Rfgxbtvk
         bPa4awLieQFrZ8S9GwhLc7OQIS/nGuSj0Besf7fnVRZFQlZZEuyUmgCodAcGD2sr3e7e
         Bk2PyocMIAQe/HkPPWIaPbzO3alfKHS6pf2kBu3jqnocnYB7LMaM687+dC+bVNKNYpBj
         awfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vhbCaoUOcz/WP/wT9Dbk6Il0t2YSTThDsq1w43DK4I8=;
        b=gAlvDU/EvNClVwpYZQnr/FPQHxYcKiVIMMlmAyClPAXMMGGdo718BseAJu2yp/+LTJ
         WBVlqjIBoj89FoXdkZG4U1rNPDUyNh8+tJro8x5mNK+Z7LPl732jGzzMsLdrTD+FoxNP
         wQaNrZrPUVOhSJiVNz3cQnwGlsz6GiPeWo5WSDoRDw9/MPd6z5uhkOK8z1B2vbYX3jbf
         LcCY+g9FLeV+Jc98yEPV6Plf6oKTECEkHFmKK0a5ZxV4ztt92awjnHP1V4qTfBpgDyFO
         2HSRczrZi1ndmUhyc6iYjoWe9kFhRUJyqpSsRC9k6l9fGtRI1kASTzzf8o795h7Tif1E
         xxUA==
X-Gm-Message-State: AGi0PubUbPM+bKRfiJXhPFP7z4SAlVHrO6icGHlNWpQi00jgzG5I3rzY
	H9YZUqfflJuXEeGQ27hlLCLVRZOKOU05ThNwln4=
X-Google-Smtp-Source: APiQypK49hGxqWm1NOXEyfHEWnwgF8DqGnVbEsryCHk5FDeqBwhufSPsILb2c6puL8JoDPvjSQmK+SV0AYbmW5slK1g=
X-Received: by 2002:ac8:7944:: with SMTP id r4mr1425450qtt.316.1587442810712;
 Mon, 20 Apr 2020 21:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com> <20200421015855.7687-5-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20200421015855.7687-5-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 21:20:00 -0700
Message-ID: <CAMKF1sqFMCZHYGPp_XvrRYe0vpkALL4b1qw7+eD7NSsgwytcCA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-markupsafe: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d576d405a3c554a0"

--000000000000d576d405a3c554a0
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 7:01 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-markupsafe.inc | 15 ++++++++++++++-
>  .../python/python3-markupsafe/run-ptest           |  3 +++
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc
> b/meta-python/recipes-devtools/python/python-markupsafe.inc
> index 33d63b3e5..480876268 100644
> --- a/meta-python/recipes-devtools/python/python-markupsafe.inc
> +++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
> @@ -7,8 +7,21 @@ SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
>  SRC_URI[sha256sum] =
> "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
>
>  PYPI_PACKAGE = "MarkupSafe"
> -inherit pypi
> +inherit pypi ptest
>
>  RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +SRC_URI += " \
> +       file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}


I wonder of cp would need equivalent options to match install behavior to
not preserve user permissions etc


> diff --git
> a/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
> b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
> new file mode 100644
> index 000000000..5cec71169
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest
> --
> 2.20.1
>
>
>
> 
>

--000000000000d576d405a3c554a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 20, 2020 at 7:01 PM zangrc &lt;<a href=3D"mail=
to:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a hr=
ef=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.f=
ujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-markupsafe.inc | 15 +++++++++++++=
+-<br>
=C2=A0.../python/python3-markupsafe/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A02 files changed, 17 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-marku=
psafe/run-ptest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/m=
eta-python/recipes-devtools/python/python-markupsafe.inc<br>
index 33d63b3e5..480876268 100644<br>
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc<br>
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc<br>
@@ -7,8 +7,21 @@ SRC_URI[md5sum] =3D &quot;43fd756864fe42063068e092e220c57=
b&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;29872e92839765e546828bb7754a68c418d927c=
d064fd4708fab9fe9c8bb116b&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;MarkupSafe&quot;<br>
-inherit pypi<br>
+inherit pypi ptest<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-stringold&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/<br=
>
+}</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder of c=
p would need equivalent options to match install behavior to not preserve u=
ser permissions etc=C2=A0</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe/run-pt=
est b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest<br>
new file mode 100644<br>
index 000000000..5cec71169<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000d576d405a3c554a0--
