Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF79C4828D
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 02:55:55 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.31629.1707015349984565477
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Feb 2024 18:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lz0XkQ1p;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d5206e96so3010603276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Feb 2024 18:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707015349; x=1707620149; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NDKwpCq98JnZWR5aiG8JV6wbM4bJimcp/XBqTGEdDrg=;
        b=Lz0XkQ1pHaV5nEKeOIub5WwhGaXXUbqKWk8vVQpbfVN0jp/oqx4HP+uaDP4ATmxNSj
         bQnom7SwbiovGPpfdX/gkB0cyKhKIucZ2tvFKRSr0hnxdk+c0cikhAIYaiE07ofkXxc1
         djcNCmGLcvfRze07Qybj2/1LEaTBhfhn+QY0dtPa2oxEUbtd9X2u3b0NLydK/KeNyXpz
         3aGo377KiId3wEcEon2kHEDz5FdVm/iw7Bw0jRxFuo8mnShDdp/+sVail4NeWfbXZ90s
         LPl3jzc1eDSZEsl0xZRf6lPNKsFhihUAXPHQ65lkNxGHzqBTHGQV8DxLhR97KjXEAp+7
         Zg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707015349; x=1707620149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDKwpCq98JnZWR5aiG8JV6wbM4bJimcp/XBqTGEdDrg=;
        b=szpxcx9ZuG/wdIdFzTEvvivTHEt+QmaE8qKEQe/k9txqWBT3rGfJ2Cttie0sTisfai
         0XyEezJ7omeRFe3I7e2fh+pFh9oXPFsgWCnbzFwadOu8xAfB2KD4jsswM3ZyE46ppTMW
         vIGQ+gBj3d6rahYRp8WfSW7x7WMvZWUanfJrKBslm21M/IBb4Xd726NnceEU9bHu+pDa
         UfWCDkljDb9Zz+j/AvtLFPJVP9J5Lote2+7YJYGmJw+1kKETpGDY/rfoMKCJQNfYNe9N
         HKkQ9T4HXUDsgVuxW7dar5Iib7hT3jQ2q4MMnxxntvCrrpfZuU1kXIy/Y8xINb7BL3BK
         lXkQ==
X-Gm-Message-State: AOJu0YxxatkJkViI83xh5xY4feWz+HW4XUzjcU8aMT0yaG6R2tXvRwMb
	+WQDT6Kf9KexdI7Smfy+9Gqvap6lJCex6skMRnS51NKq3/2xhtKUH8GVN4jLqTEBRo5Xrjgn3XH
	itgmjKan6AI8RYiZmC13U4Y9Jp98=
X-Google-Smtp-Source: AGHT+IFnqOaAQIhtgY1m4TX029zTYuU2z14p8Z1lpvNs8L0JfTBrbh9lRK09ZCzBKgP7u077cLzRleluasX1dBCzs0s=
X-Received: by 2002:a25:b205:0:b0:dc2:5274:fd3a with SMTP id
 i5-20020a25b205000000b00dc25274fd3amr5847653ybj.23.1707015348898; Sat, 03 Feb
 2024 18:55:48 -0800 (PST)
MIME-Version: 1.0
References: <20240203211307.86988-1-alperyasinak1@gmail.com>
In-Reply-To: <20240203211307.86988-1-alperyasinak1@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 3 Feb 2024 18:55:38 -0800
Message-ID: <CANx9H-A4nWiiXBuFxMtgS5M8GfJd1qLgcjkiVoR5dtJj4XC8XQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-scikit-build: upgrade 0.16.7 -> 0.17.6
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007f50350610857b1c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 02:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108558

--0000000000007f50350610857b1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 3, 2024 at 1:13=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> w=
rote:

> Moved to hatchling as a build backend and requires
> hatch-fancy-pypi-readme, hatch-vcs. Also, added tomli as a RDEPENDS.


We do not actually need tomli, since Python 3.11+ has built in tomllib.
This gates it to Python 3.10 and lower:
https://github.com/scikit-build/scikit-build/blob/main/pyproject.toml#L34

(The host Python version should not matter, we use our own python3-native,
which is currently 3.12.1)

>
>
> As stated in the upstream, the license updated to MIT only.
>
> Changelog: https://github.com/scikit-build/scikit-build/releases
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../python/python3-scikit-build_0.16.7.bb     | 21 -----------------
>  .../python/python3-scikit-build_0.17.6.bb     | 23 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-scikit-build_0.16.7.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-scikit-build_0.17.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-scikit-build_0.16.7.bb b/meta-python/recipes-devtools/python/
> python3-scikit-build_0.16.7.bb
> deleted file mode 100644
> index c033c56ba..000000000
> --- a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY =3D "Improved build system generator for Python
> C/C++/Fortran/Cython extensions"
> -LICENSE =3D "MIT & BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d1fd=
8cc"
> -
> -DEPENDS =3D "python3-setuptools-scm-native"
> -
> -PYPI_PACKAGE =3D "scikit-build"
> -
> -inherit pypi python_setuptools_build_meta
> -SRC_URI[sha256sum] =3D
> "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
> -
> -RDEPENDS:${PN} =3D " \
> -       python3-distro \
> -       python3-packaging \
> -       python3-setuptools \
> -       python3-typing-extensions \
> -       python3-wheel \
> -       cmake \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/
> python3-scikit-build_0.17.6.bb b/meta-python/recipes-devtools/python/
> python3-scikit-build_0.17.6.bb
> new file mode 100644
> index 000000000..8f6e40fa0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Improved build system generator for Python
> C/C++/Fortran/Cython extensions"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d1fd=
8cc"
> +
> +DEPENDS =3D "${PYTHON_PN}-hatch-vcs-native
> ${PYTHON_PN}-hatch-fancy-pypi-readme-native"
> +
> +PYPI_PACKAGE =3D "scikit_build"
> +
> +inherit pypi python_hatchling
> +
> +SRC_URI[sha256sum] =3D
> "b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d"
> +
> +RDEPENDS:${PN} =3D " \
> +       ${PYTHON_PN}-distro \
> +       ${PYTHON_PN}-packaging \
> +       ${PYTHON_PN}-setuptools \
> +       ${PYTHON_PN}-tomli \
> +       ${PYTHON_PN}-typing-extensions \
> +       ${PYTHON_PN}-wheel \
> +       cmake \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108556):
> https://lists.openembedded.org/g/openembedded-devel/message/108556
> Mute This Topic: https://lists.openembedded.org/mt/104145984/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007f50350610857b1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Feb 3, 2024 at 1:13=E2=80=AFPM Alper Ak &lt;<a href=
=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">Moved to hatchling as a build backend and require=
s hatch-fancy-pypi-readme, hatch-vcs. Also, added tomli as a RDEPENDS.</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">We do not actually ne=
ed tomli, since Python 3.11+ has built in tomllib. This gates it to Python =
3.10 and lower:</div><div dir=3D"auto"><div><a href=3D"https://github.com/s=
cikit-build/scikit-build/blob/main/pyproject.toml#L34">https://github.com/s=
cikit-build/scikit-build/blob/main/pyproject.toml#L34</a></div><br></div><d=
iv dir=3D"auto">(The host Python version should not matter, we use our own =
python3-native, which is currently 3.12.1)</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"aut=
o"><br>
<br>
As stated in the upstream, the license updated to MIT only.<br>
<br>
Changelog: <a href=3D"https://github.com/scikit-build/scikit-build/releases=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/scikit-build/scik=
it-build/releases</a><br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-scikit-build_0.16.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-scikit-build_0.16.7.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 21 -----------------<br>
=C2=A0.../python/<a href=3D"http://python3-scikit-build_0.17.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-scikit-build_0.17.6.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 23 +++++++++++++++++++<br>
=C2=A02 files changed, 23 insertions(+), 21 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-scikit-build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-scikit-build_0.16.7.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-scikit-build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-scikit-build_0.17.6.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
scikit-build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit=
-build_0.16.7.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-scikit-build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-scikit-build_0.16.7.bb</a><br>
deleted file mode 100644<br>
index c033c56ba..000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_=
0.16.7.bb</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-SUMMARY =3D &quot;Improved build system generator for Python C/C++/Fortran=
/Cython extensions&quot;<br>
-LICENSE =3D &quot;MIT &amp; BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d=
1fd8cc&quot;<br>
-<br>
-DEPENDS =3D &quot;python3-setuptools-scm-native&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;scikit-build&quot;<br>
-<br>
-inherit pypi python_setuptools_build_meta<br>
-SRC_URI[sha256sum] =3D &quot;a9b9cc7479b71e6c8d434596dfade025253aae23adb22=
a9a2d85850fd51cecfd&quot;<br>
-<br>
-RDEPENDS:${PN} =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-distro \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-packaging \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-setuptools \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-typing-extensions \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-wheel \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmake \<br>
-&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
scikit-build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit=
-build_0.17.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-scikit-build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-scikit-build_0.17.6.bb</a><br>
new file mode 100644<br>
index 000000000..8f6e40fa0<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_=
0.17.6.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Improved build system generator for Python C/C++/Fortran=
/Cython extensions&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d=
1fd8cc&quot;<br>
+<br>
+DEPENDS =3D &quot;${PYTHON_PN}-hatch-vcs-native ${PYTHON_PN}-hatch-fancy-p=
ypi-readme-native&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;scikit_build&quot;<br>
+<br>
+inherit pypi python_hatchling<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;b51a51a36b37c42650994b5047912f59b22e3210b23e3=
21f287611f9ef6e5c9d&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-distro \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-packaging \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-setuptools \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-tomli \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-typing-extensions \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-wheel \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmake \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108556): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108556" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108556</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104145984/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104145984/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007f50350610857b1c--

