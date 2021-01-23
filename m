Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.12550.1611435118069916721
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 12:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AcTfeFuO;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id u20so235844qku.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 12:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twf/RFZK5YNUDnMAwpDX9cXEgMo2/lGZqnPDv2rEHUY=;
        b=AcTfeFuOrdQjKNAF0Cguqwp6ZsMxEWb3OQiCZhy+56JyokK4ny0gQJ0FGOu4/xXtNx
         LyEbP5h7QoZVRC76rQQaQYiVfW5o11PgaF/clVdkICd323Scw0B5GoLKBARY1oBfl2uX
         +kj1VlIKX/F2MrkLQpdAaKeVf+KENLwaP2FHAMWpXIVT3YcHQjNhQzCdtaAAv+Fg6wfi
         eWGqxSMVzaSASsiKF+VWcx5d7JirXPEgjpK6SAKyXcIxWV+08b+0NbLU9DpQqR1SXvo+
         r6wfF/5a/Ow7QRNcS6esiAvTM9zIQSN2Db0K+HkPMtwCAtrHpkuJob7HidD/ESP75UN/
         ET9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twf/RFZK5YNUDnMAwpDX9cXEgMo2/lGZqnPDv2rEHUY=;
        b=BXjG9QDRkDRqpecUnpQdLhgbn1C967jUa2KPH5sWz59K/5lQ9ZgtAKcxco6hvxCBSK
         GUIX6VlXI3QN4lbpflTHqK4r2WIX0VpRQf1b6VRSUWHQw0+KiwZImTatGloPJjPKCZMa
         73XYGNPKfDKxAzmVA1TlhTLc23/p1ugbavbjw7/ALjsz5SqP0olReYGHiZnMeldGcFzL
         smn7Izw407HHWRpkTC51j6AOVBnLnAz1+VaFYjKuXxZsvblayJw1ioXyrxG7oxdgomQM
         gzuTRPU5mepFAILCBPDm9ajWCC9CcvI2MLitqcl9sWuiyHiTf/ATtDMlf83B9/9bNUgL
         +okg==
X-Gm-Message-State: AOAM533gDG0hAXdx8LaVjix99qsKqcgY2t/ur3M0bcQQaKaC+donxkAe
	Cp67y/UvfWRZMsvRy9R/1uZhUAY0IirGE/dBMOc=
X-Google-Smtp-Source: ABdhPJwWYQqtyzldmGvHBQAWobhKlIMKwnHYSACICQMkgqhVJeADXzmLX0JUyRM6yX6MXCfPZ+Pd+Xv4qpyr8hk0xYA=
X-Received: by 2002:a37:2f82:: with SMTP id v124mr2274462qkh.212.1611435117183;
 Sat, 23 Jan 2021 12:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20210123192513.2663547-1-schnitzeltony@gmail.com> <20210123192513.2663547-2-schnitzeltony@gmail.com>
In-Reply-To: <20210123192513.2663547-2-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 23 Jan 2021 12:51:46 -0800
Message-ID: <CAMKF1sqbUbU9+rCmp1cRw7GB6U9_8PcZf1T6VcdsBMfnyisZbA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-mypy: initial add 0.800
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, trevor.gamblin@windriver.com
Content-Type: multipart/alternative; boundary="000000000000bd06d105b997796e"

--000000000000bd06d105b997796e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Someone should delete it from these layers too after it=E2=80=99s applied t=
o
meta-python

On Sat, Jan 23, 2021 at 11:25 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
wrote:

> Currently it lives in:
>
> * meta-microcontroller
> * meta-ros-common
> * meta-sca
>
> Seems important so add it to meta-python
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../python/python3-mypy_0.800.bb               | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-mypy_0.800.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> b/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> new file mode 100644
> index 000000000..0d019dfe1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Optional static typing for Python 3 and 2 (PEP 484)"
> +HOMEPAGE =3D "https://github.com/python/mypy"
> +LICENSE =3D "MIT & Python-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6afb7c151c4dedb5c3dc292cc120=
fadc"
> +
> +RDEPENDS_${PN} =3D " \
> +    ${PYTHON_PN}-mypy-extensions \
> +    ${PYTHON_PN}-typed-ast \
> +    ${PYTHON_PN}-typing-extensions \
> +"
> +
> +PYPI_PACKAGE =3D "mypy"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D
> "e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51d8cd0681ba66940a"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.26.2
>
>
>=20
>
>

--000000000000bd06d105b997796e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Someone should delete it from these layers too after it=
=E2=80=99s applied to meta-python=C2=A0</div><div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 23, 2021 at 11:25 =
AM Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schni=
tzeltony@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">C=
urrently it lives in:<br>
<br>
* meta-microcontroller<br>
* meta-ros-common<br>
* meta-sca<br>
<br>
Seems important so add it to meta-python<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-mypy_0.800.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-mypy_0.800.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-mypy_0.800.bb" rel=3D"noreferrer" target=3D"_blank">python3-my=
py_0.800.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-mypy_0.800.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_0.800.bb<=
/a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-mypy_0.=
800.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_0.800.bb</a><br>
new file mode 100644<br>
index 000000000..0d019dfe1<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-mypy_0=
.800.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_0.800.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Optional static typing for Python 3 and 2 (PEP 484)&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/python/mypy" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/python/mypy</a>&quot;<br>
+LICENSE =3D &quot;MIT &amp; Python-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6afb7c151c4dedb5c3dc292cc=
120fadc&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-mypy-extensions \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-typed-ast \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-typing-extensions \<br>
+&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;mypy&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;e0202e37756ed09daf4b0ba64ad2c245d357659e014c=
3f51d8cd0681ba66940a&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000bd06d105b997796e--
