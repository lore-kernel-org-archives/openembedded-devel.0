Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F50C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 18:05:46 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.27092.1637949945418981125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Nov 2021 10:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oB1UAyXq;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id g9so5872655qvd.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Nov 2021 10:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ADmehn6XDfbNDuSBSEWY9sSfks5ok6iDcNQr/C2QLC0=;
        b=oB1UAyXqQ4qNRW8iSnlRd2yciyGmal7yIdPJtI1aFZ622wErlC8wyIR0T4FkdIIJrz
         gNQem9D6ORvPZTEKE/MN7m4KMDyNn/ta5L43B2k5Pea0QBfULMi/rfz7wknwAkLnUdWd
         +zlBc/uDagCrMW+lcZG0jeTe1BKElmVh+SF3DjTDtCzoKb94zJkxHn3UmjOS/BSfZcao
         f8iFcrTCtOt9zmucA2BSRUw+V5wbNrL0CitevIbDl+L84mC/skRJkWYDgFM0En2TBN3M
         4P51Kvhv/eOy8iTZXZjL8F5dz8AoCZhKOf44Qw7c6uyz6x/pD6JXCUJNEuINjEMFfZvc
         EEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ADmehn6XDfbNDuSBSEWY9sSfks5ok6iDcNQr/C2QLC0=;
        b=BQ1bYQ6XZFuMcKEjU6k35yBBqKo/7aA9cigVCKmoLCxV6tNSalVHecPj+trL+XkoNI
         w3wboKGGRawhE4yX1juLhcIGiQPSEHu++JU7Jwf1GY6sRicwUYbew42O07qMUXPNGsmL
         4O3ev3ChDxO0iR1sdp68Xw5YVIe28EImQh1s1SC4dLeHNQXXgABFvZU0QwYHcXfoi7o5
         FPTWQFHXsEk9/mohLJ6kMY8kTUSMABJjAzhcMdH2mMirbf9rVzG0TETimeV17adKg0j7
         XiNItwHL2/RW8M6lmghCQEkuMeuprYKhz2+nGWtZ4Fs4H8QNOJA31mzCn+Md/YL2SSXa
         AgDg==
X-Gm-Message-State: AOAM531lpBOe2YYLBcj56sxbZCHeqkXTnphs02TQONHvO/Iks23JcQmx
	QdGfav0qmo30wQcgpTpr3F5cX+9Fa0SadjYJgqs=
X-Google-Smtp-Source: 
 ABdhPJyyE1U5dLK5qQgtA0fIkkzWelTSfUrib/VMna43VTVZ2cvLHFw7W9F42v/Qd2Jq7iC0QYjmBU2itTtzVyVSJ90=
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr26176137qvb.16.1637949944373;
 Fri, 26 Nov 2021 10:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20211126175439.11956-1-bruce.ashfield@gmail.com>
In-Reply-To: <20211126175439.11956-1-bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Nov 2021 10:05:18 -0800
Message-ID: 
 <CAMKF1sot7sjFotOwaotWe9dL4oom2vemF9kQXiU7wzn=S=XgjQ@mail.gmail.com>
Subject: Re: [PATCH][oe][meta-python] python: remove recipes imported to
 oe-core
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <TicoTimo@gmail.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Nov 2021 18:05:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94128

ah thanks. I was just about sending you a reminder after seeing
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1753/step=
s/11/logs/stdio
:)

On Fri, Nov 26, 2021 at 9:54 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> To support device tree schema validation in kernels v5.16+, we've
> imported dt-schema + dependencies to core. So we can safely drop
> them from meta-python.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...e-pytest-runner-to-test_requirements.patch | 32 -------------
>  .../python/python3-idna_3.3.bb                | 19 --------
>  .../python/python3-jsonpointer/run-ptest      |  3 --
>  .../python/python3-jsonpointer_2.2.bb         | 26 ----------
>  .../python/python3-jsonschema_3.2.0.bb        | 48 -------------------
>  .../python/python3-pyrsistent_0.18.0.bb       | 14 ------
>  .../python/python3-rfc3339-validator_0.1.4.bb | 20 --------
>  .../python/python3-rfc3986-validator_0.1.1.bb | 23 ---------
>  .../python/python3-rfc3987_1.3.8.bb           | 10 ----
>  .../python/python3-ruamel-yaml_0.17.16.bb     | 23 ---------
>  .../python/python3-strict-rfc3339_0.7.bb      | 10 ----
>  .../python/python3-vcversioner_2.16.0.0.bb    | 12 -----
>  .../python/python3-webcolors/run-ptest        |  3 --
>  .../python/python3-webcolors_1.11.1.bb        | 27 -----------
>  14 files changed, 270 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-rfc3986-va=
lidator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
>  delete mode 100644 meta-python/recipes-devtools/python/python3-idna_3.3.=
bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-jsonpoint=
er/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/python3-jsonpoint=
er_2.2.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-jsonschem=
a_3.2.0.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyrsisten=
t_0.18.0.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-rfc3339-v=
alidator_0.1.4.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-rfc3986-v=
alidator_0.1.1.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-rfc3987_1=
.3.8.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-ruamel-ya=
ml_0.17.16.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-strict-rf=
c3339_0.7.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-vcversion=
er_2.16.0.0.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-webcolors=
/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/python3-webcolors=
_1.11.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator=
/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/=
recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-=
runner-to-test_requirements.patch
> deleted file mode 100644
> index 8a646874e..000000000
> --- a/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-s=
etup.py-move-pytest-runner-to-test_requirements.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 3531ff73631a0d59234eb4713e7b3a7f5ea57bbb Mon Sep 17 00:00:00 2001
> -From: Nicola Lunghi <nicola.lunghi@jci.com>
> -Date: Thu, 14 Nov 2019 12:17:51 +0000
> -Subject: [PATCH] setup.py: move pytest-runner to test_requirements
> -
> -This fixes an issue with yocto build.
> -pytest-runner is only needed when running tests.
> -
> -Upstream-Status: Pending
> ----
> - setup.py | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 53ebea7..ebb0de2 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -10,9 +10,9 @@ with open('README.md') as readme_file:
> -
> - requirements =3D []
> -
> --setup_requirements =3D ['pytest-runner', ]
> -+setup_requirements =3D []
> -
> --test_requirements =3D ['pytest>=3D3', ]
> -+test_requirements =3D ['pytest>=3D3', 'pytest-runner']
> -
> - setup(
> -     author=3D"Nicolas Aimetti",
> ---
> -2.20.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-idna_3.3.bb b/me=
ta-python/recipes-devtools/python/python3-idna_3.3.bb
> deleted file mode 100644
> index a0e6b79a5..000000000
> --- a/meta-python/recipes-devtools/python/python3-idna_3.3.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY =3D "Internationalised Domain Names in Applications"
> -HOMEPAGE =3D "https://github.com/kjd/idna"
> -LICENSE =3D "BSD-3-Clause & Python-2.0 & Unicode"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D239668a7c6066d9e0c5382e9c8=
c6c0e1"
> -
> -SRC_URI[sha256sum] =3D "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160b=
c32796e824360e6d"
> -
> -inherit pypi setuptools3
> -
> -# Remove bundled egg-info
> -do_compile:prepend() {
> -    rm -rf ${S}/idna.egg-info
> -}
> -
> -RDEPENDS:${PN}:class-target =3D "\
> -    ${PYTHON_PN}-codecs \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer/run-=
ptest b/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
> deleted file mode 100644
> index 51e609f4b..000000000
> --- a/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -python3 tests.py
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.=
bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
> deleted file mode 100644
> index 225fde755..000000000
> --- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY =3D "Resolve JSON Pointers in Python"
> -HOMEPAGE =3D "https://github.com/stefankoegl/python-json-pointer"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a329130f4e266a=
281ebb3"
> -
> -inherit pypi ptest setuptools3
> -
> -SRC_URI[sha256sum] =3D "f09f8deecaaa5aea65b5eb4f67ca4e54e1a61f7a11c75085=
e360fe6feb6a48bf"
> -
> -RDEPENDS:${PN} +=3D " \
> -    ${PYTHON_PN}-json \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -SRC_URI +=3D " \
> -       file://run-ptest \
> -"
> -
> -RDEPENDS:${PN}-ptest +=3D " \
> -       ${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -       cp -f ${S}/tests.py ${D}${PTEST_PATH}/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0=
.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> deleted file mode 100644
> index c7efe33a8..000000000
> --- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -SUMMARY =3D "An implementation of JSON Schema validation for Python"
> -HOMEPAGE =3D "https://github.com/Julian/jsonschema"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7a60a81c146ec25599a3e1dabb861=
0a8 \
> -                    file://json/LICENSE;md5=3D9d4de43111d33570c8fe49b4cb=
0e01af"
> -DEPENDS +=3D "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-sc=
m-native"
> -
> -SRC_URI[md5sum] =3D "f1a0b5011f05a02a8dee1070cd10a26d"
> -SRC_URI[sha256sum] =3D "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46=
ddefc7187d30797a"
> -
> -inherit pypi setuptools3
> -
> -PACKAGECONFIG ??=3D "format"
> -PACKAGECONFIG[format] =3D ",,,\
> -    ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-jsonpointer \
> -    ${PYTHON_PN}-webcolors \
> -    ${PYTHON_PN}-rfc3987 \
> -    ${PYTHON_PN}-strict-rfc3339 \
> -"
> -PACKAGECONFIG[nongpl] =3D ",,,\
> -    ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-jsonpointer \
> -    ${PYTHON_PN}-webcolors \
> -    ${PYTHON_PN}-rfc3986-validator \
> -    ${PYTHON_PN}-rfc3339-validator \
> -"
> -
> -RDEPENDS:${PN} +=3D " \
> -    ${PYTHON_PN}-attrs \
> -    ${PYTHON_PN}-core \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-importlib-metadata \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-pkgutil \
> -    ${PYTHON_PN}-pprint \
> -    ${PYTHON_PN}-pyrsistent \
> -    ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-unittest \
> -    ${PYTHON_PN}-setuptools-scm \
> -    ${PYTHON_PN}-zipp \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.=
0.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
> deleted file mode 100644
> index 0b4d2564f..000000000
> --- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "Persistent/Immutable/Functional data structures for Python"
> -HOMEPAGE =3D "https://github.com/tobgu/pyrsistent"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.mit;md5=3Da4b94c2b800b582a8d3925a99=
39cbf44"
> -
> -SRC_URI[sha256sum] =3D "773c781216f8c2900b42a7b638d5b517bb134ae1acbebe4d=
1e8f1f41ea60eb4b"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS:${PN} +=3D " \
> -    ${PYTHON_PN}-numbers \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validato=
r_0.1.4.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_=
0.1.4.bb
> deleted file mode 100644
> index 7f1bbaf97..000000000
> --- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4=
.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY =3D "A pure python RFC3339 validator"
> -HOMEPAGE =3D "https://github.com/naimetti/rfc3339-validator"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da21b13b5a996f08f7e0b088aa38ce=
9c6"
> -
> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-rfc3339-validator:"
> -
> -SRC_URI[sha256sum] =3D "138a2abdf93304ad60530167e51d2dfb9549521a836871b8=
8d7f4695d0022f6b"
> -
> -PYPI_PACKAGE =3D "rfc3339_validator"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS:${PN} +=3D "\
> -    ${PYTHON_PN}-core \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-six \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validato=
r_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_=
0.1.1.bb
> deleted file mode 100644
> index 68b3db1f4..000000000
> --- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1=
.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "Pure python rfc3986 validator"
> -HOMEPAGE =3D "https://github.com/naimetti/rfc3986-validator"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da21b13b5a996f08f7e0b088aa38ce=
9c6"
> -
> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-rfc3986-validator:"
> -
> -SRC_URI[md5sum] =3D "47f7657b790aaf6011a1ab3d86c6be95"
> -SRC_URI[sha256sum] =3D "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449=
b145d533b240d055"
> -
> -PYPI_PACKAGE =3D "rfc3986_validator"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI:append =3D " \
> -    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
> -"
> -
> -RDEPENDS:${PN} +=3D "\
> -    python3-core \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb=
 b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
> deleted file mode 100644
> index 80e2aa5bc..000000000
> --- a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -SUMMARY =3D "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 398=
7)"
> -LICENSE =3D "GPLv3+"
> -LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D9;md5=3D2b=
723edf67b2f3088bc5e339b1ceda2d"
> -
> -SRC_URI[md5sum] =3D "b6c4028acdc788a9ba697e1c1d6b896c"
> -SRC_URI[sha256sum] =3D "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92=
b39c7a253d5ca733"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17=
.16.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
> deleted file mode 100644
> index e64f19600..000000000
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "YAML parser/emitter that supports roundtrip preservation of=
 comments, seq/map flow style, and map key order."
> -AUTHOR =3D "Anthon van der Neut"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa0a51dfb461e2f803969e0f3fa71=
dfe"
> -
> -PYPI_PACKAGE =3D "ruamel.yaml"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[sha256sum] =3D "1a771fc92d3823682b7f0893ad56cb5a5c87c48e62b5399d=
6f42c8759a583b33"
> -
> -RDEPENDS:${PN} +=3D "\
> -    ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-netclient \
> -"
> -
> -do_install:prepend() {
> -    export RUAMEL_NO_PIP_INSTALL_CHECK=3D1
> -}
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0=
.7.bb b/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
> deleted file mode 100644
> index 52ae9ebe9..000000000
> --- a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -SUMMARY =3D "Strict, simple, lightweight RFC3339 function.s"
> -LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
> -
> -SRC_URI[md5sum] =3D "4d9b635b4df885bc37bc1189d66c9abc"
> -SRC_URI[sha256sum] =3D "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e855=
46088607ac5e1277"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-vcversioner_2.16=
.0.0.bb b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.=
bb
> deleted file mode 100644
> index 149078c51..000000000
> --- a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY =3D "Python vcversioner, automagically update the project's vers=
ion"
> -HOMEPAGE =3D "https://github.com/habnabit/vcversioner"
> -
> -LICENSE =3D "ISC"
> -LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D827a7a91a8d20d3c666b665cd96d=
b8e3"
> -
> -SRC_URI[md5sum] =3D "aab6ef5e0cf8614a1b1140ed5b7f107d"
> -SRC_URI[sha256sum] =3D "dae60c17a479781f44a4010701833f1829140b1eeccd2587=
62a74974aa06e19b"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/python3-webcolors/run-pt=
est b/meta-python/recipes-devtools/python/python3-webcolors/run-ptest
> deleted file mode 100644
> index 3385d6893..000000000
> --- a/meta-python/recipes-devtools/python/python3-webcolors/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP=
/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'=
| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=
=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1=
.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> deleted file mode 100644
> index 2ec036ef3..000000000
> --- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY =3D "Simple Python module for working with HTML/CSS color defini=
tions."
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25b90379a52351261c51272e7923d=
240"
> -
> -SRC_URI[md5sum] =3D "54d28a7c80b3e4d974ec2fee86768be9"
> -SRC_URI[sha256sum] =3D "76f360636957d1c976db7466bc71dcb713bb95ac8911944d=
ffc55c01cb516de6"
> -
> -inherit pypi setuptools3 ptest
> -
> -RDEPENDS:${PN}:class-target =3D "\
> -    ${PYTHON_PN}-stringold \
> -"
> -
> -SRC_URI +=3D " \
> -    file://run-ptest \
> -"
> -
> -RDEPENDS:${PN}-ptest +=3D " \
> -    ${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -    install -d ${D}${PTEST_PATH}/tests
> -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.19.1
>

