Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.1151.1585935168864099586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iJdjWXwD;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id o127so8408526iof.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tTgiRBeQs2STBcVZobP8nmMUoHDziKCK+ntwmXEj9Hc=;
        b=iJdjWXwDY/u2Rap+b+oLF0mKrtUp4e+qheN2QCAhCNjgaJHdyfxQKk+7pb+jbolm0F
         hc78Vi703dKdDei/k4QCk4b4St3ARCbvlZ1oUGz2Va92WERqV3EoQGDLuDjUsEYb1b8y
         34CPVjlBbZxcWdRM2wmVzUJDJq7ETGwi8GnV0+eCLgHdBiVEwljYz9kV11+FLJtjrAZg
         xpVmKCWR/1i6YQCOSMSTDMOoiJwy6xcHLTx1gWLtdyB93u0Er2cCqcQyMbm5vcoJMHJS
         4ApR0/GJ4QRUB+Al+EC8jHTGwN5DppTvDsupm58WvbFk9VCsi8IQ8ucMJ5iz3cqfy9hE
         1VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tTgiRBeQs2STBcVZobP8nmMUoHDziKCK+ntwmXEj9Hc=;
        b=IlwbVVyJRE13zfVKVa7e0lFwClAlqbfk9RdiGoxiWJ6zv6kuUHvYSjcY5mqRYxR8me
         J07NtwtRhH8fnFd8DUkZS9DZRHjT//5dNOeCA4ibJsQQlAE+ZxQl8z/8mSD05EtWmCuN
         F4Nw/iumL7Az35TQyLU6H9HBGp5TLUJ2dAw/TDtUwufGkOLRBUcHmr8LfhHEDXOl7ZNZ
         anKj8vfcTD+DUut+aRaFClArBIKmiEYpMWjusZjReauhEDilJtphycK+Yetj4SoNNN/n
         XFMeETWXZx0ScvxY0Uy6jWc0sdEIxM6QStaxbhe600DVcwev9ZNbLVaKWQseQYVbydK/
         6DnA==
X-Gm-Message-State: AGi0PuYtP9GT5fn/SOFmkyw3TWidDpvcIU2OojDLLnLOmAvbbiXhcRtQ
	sya1grlHGUlfIOLlhu/AnfzFAzV0CNN4LS44P7s=
X-Google-Smtp-Source: APiQypKCEuHUVLV3yRThokHjGUz14U1H3Jifols+1gxwkNDXFFomdlmlK+Z7AlD1h/KgYJFfFMJhQKTpPS86jSTKJ+0=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr9619251jag.22.1585935168129;
 Fri, 03 Apr 2020 10:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com> <1585901748-16446-2-git-send-email-leon.anavi@konsulko.com>
In-Reply-To: <1585901748-16446-2-git-send-email-leon.anavi@konsulko.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 3 Apr 2020 10:32:36 -0700
Message-ID: <CANx9H-AAy9+3yHD_r4eViKCyLBA9koB_oDL8_oSkhGYNMNF3QA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python-luma-core: add new recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000554ff505a2664e17"

--000000000000554ff505a2664e17
Content-Type: text/plain; charset="UTF-8"

We do not want separate .inc and .bb files. It makes recipe upgrades with
devtool/AUH difficult. Please merge .inc and .bb

On Fri, Apr 3, 2020 at 1:15 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Component library providing a Pillow-compatible drawing canvas,
> and other functionality to support drawing primitives and
> text-rendering capabilities for small displays on the Raspberry Pi
> and other single board computers.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../recipes-devtools/python/python-luma-core.inc       | 18
> ++++++++++++++++++
>  .../python/python3-luma-core_1.12.0.bb                 |  2 ++
>  2 files changed, 20 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-luma-core.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-luma-core_1.12.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-luma-core.inc
> b/meta-python/recipes-devtools/python/python-luma-core.inc
> new file mode 100644
> index 0000000..65350ef
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-luma-core.inc
> @@ -0,0 +1,18 @@
> +SUMMARY = "A component library to support SBC display drivers"
> +DESCRIPTION = "A component library to support SBC display drivers"
> +HOMEPAGE = "https://github.com/rm-hull/luma.core"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
> +
> +SRC_URI[md5sum] = "4378edb99cd12540b4e4a588969567ee"
> +SRC_URI[sha256sum] =
> "864a427de78bcc16758f4f4402a9e61f31cc8857bfae9aba8041159aaec3a491"
> +
> +CLEANBROKEN = "1"
> +
> +PYPI_PACKAGE = "luma.core"
> +
> +RDEPENDS_${PN} += " \
> +       ${PYTHON_PN}-pillow \
> +       ${PYTHON_PN}-threading \
> +       ${PYTHON_PN}-smbus2 \
> +"
> diff --git a/meta-python/recipes-devtools/python/
> python3-luma-core_1.12.0.bb b/meta-python/recipes-devtools/python/
> python3-luma-core_1.12.0.bb
> new file mode 100644
> index 0000000..6e34f81
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-luma-core.inc
> --
> 2.7.4
>
> 
>

--000000000000554ff505a2664e17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"font-size:16px;color:rgb(117,117,117);word-spacing:1px"=
>We do not want separate .inc and .bb files. It makes recipe upgrades with =
devtool/AUH difficult. Please merge .inc and .bb</span><br></div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr=
 3, 2020 at 1:15 AM Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m">leon.anavi@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Component library providing a Pillow-compatible drawing canvas,<br>
and other functionality to support drawing primitives and<br>
text-rendering capabilities for small displays on the Raspberry Pi<br>
and other single board computers.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-luma-core.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-luma-core_1.12.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-luma-core_1.12.0.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A02 files changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python-luma-c=
ore.inc<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-luma-core_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-luma-core_1.12.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-luma-core.inc b/me=
ta-python/recipes-devtools/python/python-luma-core.inc<br>
new file mode 100644<br>
index 0000000..65350ef<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python-luma-core.inc<br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;A component library to support SBC display drivers&quot=
;<br>
+DESCRIPTION =3D &quot;A component library to support SBC display drivers&=
quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/rm-hull/luma.core" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/rm-hull/luma.core</a>=
&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3Deda804060ba2312e41fe9=
6b6fa334fd7&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;4378edb99cd12540b4e4a588969567ee&quot;<br>
+SRC_URI[sha256sum] =3D &quot;864a427de78bcc16758f4f4402a9e61f31cc8857bfae=
9aba8041159aaec3a491&quot;<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;luma.core&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pillow \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-threading \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-smbus2 \<br>
+&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-luma-core_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-cor=
e_1.12.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-luma-core_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma=
-core_1.12.0.bb</a><br>
new file mode 100644<br>
index 0000000..6e34f81<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-luma-c=
ore_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-luma-core_1.12.=
0.bb</a><br>
@@ -0,0 +1,2 @@<br>
+inherit pypi setuptools3<br>
+require python-luma-core.inc<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--000000000000554ff505a2664e17--
