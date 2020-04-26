Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.5807.1587934255502886877
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2020 13:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NVkBYj0b;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id f82so14766223ilh.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2020 13:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=wm3XWNfNCc0wl5A8Paobt1x6BfrTYTIdXkJYycvKzq8=;
        b=NVkBYj0bFz5dv35W0Aeyjac3gKGQDUoSWYKCfxuK1xMZotaVAYZmWgx62x/DsBayc+
         FKPDfvLLK4LYfFRIJjl9hRmRsawKrLRBbmhU1XkitOWmhzkMOESDlqE0/tUtpcYGigiw
         TMWzc2bBbkcWOjGqDUO2O7rTlm6zNwTuBX7J4jd7epYtHD1I+eUs+Mh3x/8IPvXS9PGx
         /nHqvADl9+n20xCM8Ji4460LYV1l+Qthd1DbJgEZ0DYXVgnx1+I32wIldM9KIe5vk7Xt
         tapDGkrhpyHEq5SNUfFp4vCnrHHHSp2lkTdX3xpllPtJ7T7qs13HqEAPSZVln2t7wW/p
         NSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=wm3XWNfNCc0wl5A8Paobt1x6BfrTYTIdXkJYycvKzq8=;
        b=eVLjEwHKStoqJUWygLIV8+tVJA/2k0s1NzGf1p04mXogikC4VXfQzJAKA17fDJqVUR
         aswZWeh068vS0hnq3NK4i9n7uqoiHjdPKG0mtlGNo0JKmQIHaXvAduUYRG9LekWw9CU3
         1/T/XOPPyQjoWrYBMrG9tRrrDcaMeAvu+hHinaSnKSuMHxIo0MOb3UBr5j3jjMeYBpud
         xQP8V6Mkr4IWLh8LzddhT53NVh5cDK1zvTNOXpms/SfRYm9yTTu3LnlrGxbiAUeS2CB2
         YOml8ENeWyjalOBm6mxmXmz+9Vs9FWy0vnEnYxNU9OaLS56H7397CXHRPOGOnsfcU1c8
         i8cA==
X-Gm-Message-State: AGi0PuYG86oTaoK2a0vFIl+ajVrJmWEu25Pj1BqDFvCj/gYcAm7OehgN
	l8/EIw1CAPAIxZfuOQmEXHI0k1uC3AGSXQrw6uk=
X-Google-Smtp-Source: APiQypI4DMFQw+jl5vHVT/FC7Y4eF/lSzfDMH7KJioH6TecysPe1Bd7IPrHSO8L5AdPoDbHBuRQg/sL+StjDEuj9GjM=
X-Received: by 2002:a92:1b91:: with SMTP id f17mr18202659ill.142.1587934254797;
 Sun, 26 Apr 2020 13:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <16094BCD2252299B.10056@lists.openembedded.org>
In-Reply-To: <16094BCD2252299B.10056@lists.openembedded.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sun, 26 Apr 2020 13:50:44 -0700
Message-ID: <CANx9H-DwDY4UuY28U+dMPjW7-6jbUiZAxkpNgn3AgFD1TCoAqQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-cryptography: merge bb and inc
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002f171705a437c12b"

--0000000000002f171705a437c12b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For some reason patchwork didn=E2=80=99t pick up these two patches

On Sat, Apr 25, 2020 at 11:48 PM Tim Orling via lists.openembedded.org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> From: Tim Orling <ticotimo@gmail.com>
>
> Drop python-cryptography/ not used anywhere.
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  .../python/python-cryptography.inc            | 58 ------------------
>  .../python/python-cryptography/run-ptest      |  2 -
>  .../python/python3-cryptography_2.8.bb        | 61 ++++++++++++++++++-
>  3 files changed, 59 insertions(+), 62 deletions(-)
>  delete mode 100644
> meta-python/recipes-devtools/python/python-cryptography.inc
>  delete mode 100644
> meta-python/recipes-devtools/python/python-cryptography/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc
> b/meta-python/recipes-devtools/python/python-cryptography.inc
> deleted file mode 100644
> index 5acd02d67d..0000000000
> --- a/meta-python/recipes-devtools/python/python-cryptography.inc
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -SUMMARY =3D "Provides cryptographic recipes and primitives to python
> developers"
> -HOMEPAGE =3D "https://cryptography.io/"
> -LICENSE =3D "Apache-2.0 | BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D097f805837700cfac572ac274cd3=
8124"
> -
> -LDSHARED +=3D "-pthread"
> -
> -DEPENDS +=3D " \
> -    ${PYTHON_PN}-cffi \
> -    ${PYTHON_PN}-cffi-native \
> -    ${PYTHON_PN}-asn1crypto \
> -    ${PYTHON_PN}-six \
> -"
> -
> -SRC_URI[md5sum] =3D "77730058b556c6d9838679a94c6229ce"
> -SRC_URI[sha256sum] =3D
> "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
> -
> -RDEPENDS_${PN} +=3D " \
> -    ${PYTHON_PN}-cffi \
> -    ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-asn1crypto \
> -    ${PYTHON_PN}-setuptools \
> -    ${PYTHON_PN}-six \
> -"
> -
> -RDEPENDS_${PN}_class-target +=3D " \
> -    ${PYTHON_PN}-cffi \
> -    ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-asn1crypto \
> -    ${PYTHON_PN}-setuptools \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-threading \
> -"
> -
> -RDEPENDS_${PN}-ptest +=3D " \
> -    ${PN} \
> -    ${PYTHON_PN}-cryptography-vectors \
> -    ${PYTHON_PN}-iso8601 \
> -    ${PYTHON_PN}-pretend \
> -    ${PYTHON_PN}-pytest \
> -    ${PYTHON_PN}-pytz \
> -"
> -
> -inherit ptest
> -
> -do_install_ptest() {
> -    install -d ${D}${PTEST_PATH}/tests
> -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -    install -d ${D}${PTEST_PATH}/tests/hazmat
> -    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
> -}
> -
> -FILES_${PN}-dbg +=3D " \
> -
> ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debu=
g \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> a/meta-python/recipes-devtools/python/python-cryptography/run-ptest
> b/meta-python/recipes-devtools/python/python-cryptography/run-ptest
> deleted file mode 100644
> index 0ba239c2a4..0000000000
> --- a/meta-python/recipes-devtools/python/python-cryptography/run-ptest
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/bin/sh
> -py.test
> diff --git a/meta-python/recipes-devtools/python/
> python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/
> python3-cryptography_2.8.bb
> index 195923343b..c75dabb974 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> @@ -1,8 +1,65 @@
> -inherit pypi setuptools3
> -require python-cryptography.inc
> +SUMMARY =3D "Provides cryptographic recipes and primitives to python
> developers"
> +HOMEPAGE =3D "https://cryptography.io/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2.0 | BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D097f805837700cfac572ac274cd3=
8124"
>
>  LDSHARED +=3D "-pthread"
>
> +SRC_URI[md5sum] =3D "77730058b556c6d9838679a94c6229ce"
> +SRC_URI[sha256sum] =3D
> "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
> +
>  SRC_URI +=3D " \
>      file://run-ptest \
>  "
> +
> +inherit pypi setuptools3
> +
> +DEPENDS +=3D " \
> +    ${PYTHON_PN}-cffi \
> +    ${PYTHON_PN}-cffi-native \
> +    ${PYTHON_PN}-asn1crypto \
> +    ${PYTHON_PN}-six \
> +"
> +
> +RDEPENDS_${PN} +=3D " \
> +    ${PYTHON_PN}-cffi \
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-asn1crypto \
> +    ${PYTHON_PN}-setuptools \
> +    ${PYTHON_PN}-six \
> +"
> +
> +RDEPENDS_${PN}_class-target +=3D " \
> +    ${PYTHON_PN}-cffi \
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-asn1crypto \
> +    ${PYTHON_PN}-setuptools \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-threading \
> +"
> +
> +RDEPENDS_${PN}-ptest +=3D " \
> +    ${PN} \
> +    ${PYTHON_PN}-cryptography-vectors \
> +    ${PYTHON_PN}-iso8601 \
> +    ${PYTHON_PN}-pretend \
> +    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-pytz \
> +"
> +
> +inherit ptest
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    install -d ${D}${PTEST_PATH}/tests/hazmat
> +    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
> +}
> +
> +FILES_${PN}-dbg +=3D " \
> +
> ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debu=
g \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.0
>
>=20
>

--0000000000002f171705a437c12b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">For some=C2=A0reason patchwork didn=E2=80=99t pick u=
p these two patches</div></div><div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Sat, Apr 25, 2020 at 11:48 PM Tim Orling =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_bl=
ank">ticotimo@gmail.com</a>&gt;<br>
<br>
Drop python-cryptography/ not used anywhere.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/python-cryptography.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 58 ------------------<br>
=C2=A0.../python/python-cryptography/run-ptest=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 -<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography_2.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-cryptography_2.8.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 | 61 ++++++++++++++++++-<br>
=C2=A03 files changed, 59 insertions(+), 62 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python-crypto=
graphy.inc<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python-crypto=
graphy/run-ptest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b=
/meta-python/recipes-devtools/python/python-cryptography.inc<br>
deleted file mode 100644<br>
index 5acd02d67d..0000000000<br>
--- a/meta-python/recipes-devtools/python/python-cryptography.inc<br>
+++ /dev/null<br>
@@ -1,58 +0,0 @@<br>
-SUMMARY =3D &quot;Provides cryptographic recipes and primitives to python=
 developers&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://cryptography.io/" rel=3D"noreferrer=
" target=3D"_blank">https://cryptography.io/</a>&quot;<br>
-LICENSE =3D &quot;Apache-2.0 | BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D097f805837700cfac572ac274=
cd38124&quot;<br>
-<br>
-LDSHARED +=3D &quot;-pthread&quot;<br>
-<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cffi-native \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;77730058b556c6d9838679a94c6229ce&quot;<br>
-SRC_URI[sha256sum] =3D &quot;3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65c=
db3ab3765e4b02871651&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-idna \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
-&quot;<br>
-<br>
-RDEPENDS_${PN}_class-target +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-idna \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-numbers \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
-&quot;<br>
-<br>
-RDEPENDS_${PN}-ptest +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PN} \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-iso8601 \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pretend \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pytz \<br>
-&quot;<br>
-<br>
-inherit ptest<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
-=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests/hazmat<br>
-=C2=A0 =C2=A0 cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/<=
br>
-}<br>
-<br>
-FILES_${PN}-dbg +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/b=
indings/.debug \<br>
-&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/python-cryptography/run-p=
test b/meta-python/recipes-devtools/python/python-cryptography/run-ptest<br=
>
deleted file mode 100644<br>
index 0ba239c2a4..0000000000<br>
--- a/meta-python/recipes-devtools/python/python-cryptography/run-ptest<br=
>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-#!/bin/sh<br>
-py.test<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-cryptography_2.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy_2.8.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-cryptography_2.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography_2.8.bb</a><br>
index 195923343b..c75dabb974 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-crypto=
graphy_2.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_2.=
8.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-crypto=
graphy_2.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_2.=
8.bb</a><br>
@@ -1,8 +1,65 @@<br>
-inherit pypi setuptools3<br>
-require python-cryptography.inc<br>
+SUMMARY =3D &quot;Provides cryptographic recipes and primitives to python=
 developers&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://cryptography.io/" rel=3D"noreferrer=
" target=3D"_blank">https://cryptography.io/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0 | BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D097f805837700cfac572ac274=
cd38124&quot;<br>
<br>
=C2=A0LDSHARED +=3D &quot;-pthread&quot;<br>
<br>
+SRC_URI[md5sum] =3D &quot;77730058b556c6d9838679a94c6229ce&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65c=
db3ab3765e4b02871651&quot;<br>
+<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cffi-native \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-idna \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN}_class-target +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-idna \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-numbers \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PN} \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-iso8601 \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pretend \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pytz \<br>
+&quot;<br>
+<br>
+inherit ptest<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests/hazmat<br>
+=C2=A0 =C2=A0 cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/<=
br>
+}<br>
+<br>
+FILES_${PN}-dbg +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/b=
indings/.debug \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000002f171705a437c12b--
