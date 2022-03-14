Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04375C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 15:33:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.27786.1647272030919538231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=isnHiXEf;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i8so24625014wrr.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tiujiFFQImry5iWpYvMiJh9uIUSKv3q/VtovFHiDAVE=;
        b=isnHiXEf6Y01KJUOPMhgEQSPssFMK3fGYEr9n+UGyC09Idc83dGDTYW95PP+jJ568X
         Z+idD6b9bOnrfy03rIE1rpwalgIyu/R7MRlfev1ea/dvXzYeKLuq9Q2Huad6kpQh5+/7
         ZIHBCOLHHqn/769oVb7nonJ8n/aDWUkAnIoUfqKgca8Lx9KdCGES6/oQ6CA7vtUgAMv0
         YTtGfaaQMG7w8pKz/e89H9sje+XvFVSj7GQEobMv+/xcj3qyQtug2Oa9zzYkTTuFYTFE
         +EGvqZqSvbNpWyoVAvtu1wVGE+TRKJs6UacMWPrUd9wagohbrx7ZfPe0fW1jVmeG4qru
         XcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tiujiFFQImry5iWpYvMiJh9uIUSKv3q/VtovFHiDAVE=;
        b=Gg4wrg4NH77jhNEBxdMRKfh2wlGEckUCQadYRT5RK4rRXxAYjpMdAZlkvnYhoUPsaI
         hIZawgIr8SrvBpe7Unj7Njxq7mYAPGa9BRbxZOSlBbIoe1pOe9dnDuYxYg/KJ/brZR57
         ocSAVUWJMk3KdY26YgVrHd1efhEJOVSBn/t8aa+X/ijEObkgev9WdvsVC5AS3eg+TbFT
         HEBrA9wz7klKBAJ7B9B21448/Q2YjwmI2mWH/Xl+vav31A3BNihj32IgSV+AyZ31hIP4
         wtT7msT8XavEsXDEl9xZpeAl7WBODvRunDTXIthjOZz1fkPmmr1Vr/WZI4ucyT1uMmPS
         7IZg==
X-Gm-Message-State: AOAM533tt7/+FaJNXV5i5yTd8CTzvPeQc/NwBykDlYOKlsxIuk29ICwK
	pFFLg6H5OWM96Ht0SVtpQ29NM5hl+V/gT5RiaQQ=
X-Google-Smtp-Source: 
 ABdhPJwze5mRX+g9C8plz/0ggJw9tjX1z1coGDz21rifoFj/s3WE85xkGXB4Qe3sV41mYf5cOQc/KxyLV7I3dQcJ99E=
X-Received: by 2002:a5d:4387:0:b0:1ed:a13a:ef0c with SMTP id
 i7-20020a5d4387000000b001eda13aef0cmr16990833wrq.62.1647272029078; Mon, 14
 Mar 2022 08:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220314020328.1234253-1-alejandro@enedino.org>
 <CAMKF1srX6O1UstYNudc70PmHqB11APfBwLPq-uJUzi1QZNpvfg@mail.gmail.com>
 <16DC49051D654A56.23528@lists.openembedded.org>
In-Reply-To: <16DC49051D654A56.23528@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 14 Mar 2022 08:33:37 -0700
Message-ID: 
 <CANx9H-BagQmsRqLp0TRQwbf=qpq=h5G1Y3RqiJEmiOJOxaPz9Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] meta-python: Clean up recipes and classes that were
 moved to oe-core
To: ticotimo@gmail.com
Cc: Alejandro Enedino Hernandez Samaniego
 <alejandro.hernandez@linux.microsoft.com>,
	Alejandro Hernandez Samaniego <alejandro@enedino.org>,
 Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000024469005da2f6801"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 15:33:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95980

--00000000000024469005da2f6801
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 8:30 AM Tim Orling via lists.openembedded.org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Sun, Mar 13, 2022 at 8:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> missed python3-pyrad, I have taken care of that
>>
>> On Sun, Mar 13, 2022 at 7:03 PM Alejandro Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> >
>> > From: Alejandro Enedino Hernandez Samaniego <
>> alejandro.hernandez@linux.microsoft.com>
>> >
>> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
>> alejandro.hernandez@linux.microsoft.com>
>> > ---
>> >  meta-python/classes/poetry_core.bbclass       |  15 ---
>> >  meta-python/classes/pyo3.bbclass              |  30 -----
>> >  meta-python/classes/setuptools3_rust.bbclass  |  11 --
>> >  .../python/python3-aiofiles_0.8.0.bb          |   2 +-
>> >  .../python/python3-asn1crypto_1.4.0.bb        |  25 ----
>> >  .../python/python3-cffi_1.15.0.bb             |  18 ---
>> >  .../python3-cryptography-vectors_36.0.1.bb    |  24 ----
>> >  .../0001-Cargo.toml-specify-pem-version.patch |  31 -----
>> >  .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ----
>> >  .../python3-cryptography/check-memfree.py     |  10 --
>> >  .../python/python3-cryptography/run-ptest     |   4 -
>> >  .../python/python3-cryptography_36.0.1.bb     | 123 -----------------=
-
>> >  .../python/python3-dnspython_2.2.0.bb         |   2 +-
>> >  .../python/python3-iso8601_1.0.2.bb           |   2 +-
>> >  .../python/python3-isort_5.10.1.bb            |   2 +-
>> >  .../python/python3-pkgconfig_1.5.5.bb         |   2 +-
>> >  .../python/python3-poetry-core_1.0.8.bb       |   2 +-
>> >  .../python/python3-pycparser_2.21.bb          |  21 ---
>> >  .../python/python3-pymisp_2.4.155.1.bb        |   2 +-
>> >  .../python/python3-pyruvate_1.1.2.bb          |   2 +-
>
> this didn=E2=80=99t move
> I think this list was too aggressive?
>

Oh I think I read it wrong:/

>
>> >  .../python/python3-rsa_4.8.bb                 |   2 +-
>> >  .../python/python3-semantic-version_2.9.0.bb  |  12 --
>> >  .../python3-setuptools-rust-native_1.1.2.bb   |  33 -----
>> >  .../python3-typing-extensions_3.10.0.0.bb     |  12 --
>> >  24 files changed, 9 insertions(+), 406 deletions(-)
>> >  delete mode 100644 meta-python/classes/poetry_core.bbclass
>> >  delete mode 100644 meta-python/classes/pyo3.bbclass
>> >  delete mode 100644 meta-python/classes/setuptools3_rust.bbclass
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-asn1crypto_1.4.0.bb
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-cffi_1.15.0.bb
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-cryptography-vectors_36.0.1.bb
>> >  delete mode 100644
>> meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml=
-specify-pem-version.patch
>> >  delete mode 100644
>> meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml=
-edition-2018-2021.patch
>> >  delete mode 100755
>> meta-python/recipes-devtools/python/python3-cryptography/check-memfree.p=
y
>> >  delete mode 100644
>> meta-python/recipes-devtools/python/python3-cryptography/run-ptest
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-cryptography_36.0.1.bb
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-pycparser_2.21.bb
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-semantic-version_2.9.0.bb
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-setuptools-rust-native_1.1.2.bb
>> >  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-typing-extensions_3.10.0.0.bb
>> >
>> > diff --git a/meta-python/classes/poetry_core.bbclass
>> b/meta-python/classes/poetry_core.bbclass
>> > deleted file mode 100644
>> > index fb37c78c7..000000000
>> > --- a/meta-python/classes/poetry_core.bbclass
>> > +++ /dev/null
>> > @@ -1,15 +0,0 @@
>> > -inherit pip_install_wheel python3native setuptools3-base
>> > -
>> > -DEPENDS +=3D "python3-poetry-core-native"
>> > -
>> > -poetry_core_do_configure () {
>> > -    :
>> > -}
>> > -
>> > -# TODO: ideally this uses pypa/build
>> > -poetry_core_do_compile () {
>> > -    nativepython3 -c "from poetry.core.masonry import api;
>> api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
>> > -}
>> > -do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
>> > -
>> > -EXPORT_FUNCTIONS do_configure do_compile
>> > diff --git a/meta-python/classes/pyo3.bbclass
>> b/meta-python/classes/pyo3.bbclass
>> > deleted file mode 100644
>> > index 6ce21329c..000000000
>> > --- a/meta-python/classes/pyo3.bbclass
>> > +++ /dev/null
>> > @@ -1,30 +0,0 @@
>> > -#
>> > -# This class helps make sure that Python extensions built with PyO3
>> > -# and setuptools_rust properly set up the environment for cross
>> compilation
>> > -#
>> > -
>> > -inherit cargo python3-dir siteinfo
>> > -
>> > -export PYO3_CROSS=3D"1"
>> > -export PYO3_CROSS_PYTHON_VERSION=3D"${PYTHON_BASEVERSION}"
>> > -export PYO3_CROSS_LIB_DIR=3D"${STAGING_LIBDIR}"
>> > -export CARGO_BUILD_TARGET=3D"${HOST_SYS}"
>> > -export RUSTFLAGS
>> > -export PYO3_PYTHON=3D"${PYTHON}"
>> > -export PYO3_CONFIG_FILE=3D"${WORKDIR}/pyo3.config"
>> > -
>> > -pyo3_do_configure () {
>> > -    cat > ${WORKDIR}/pyo3.config << EOF
>> > -implementation=3DCPython
>> > -version=3D${PYTHON_BASEVERSION}
>> > -shared=3Dtrue
>> > -abi3=3Dfalse
>> > -lib_name=3D${PYTHON_DIR}
>> > -lib_dir=3D${STAGING_LIBDIR}
>> > -pointer_width=3D${SITEINFO_BITS}
>> > -build_flags=3DWITH_THREAD
>> > -suppress_build_script_link_lines=3Dfalse
>> > -EOF
>> > -}
>> > -
>> > -EXPORT_FUNCTIONS do_configure
>> > diff --git a/meta-python/classes/setuptools3_rust.bbclass
>> b/meta-python/classes/setuptools3_rust.bbclass
>> > deleted file mode 100644
>> > index fb11f08f8..000000000
>> > --- a/meta-python/classes/setuptools3_rust.bbclass
>> > +++ /dev/null
>> > @@ -1,11 +0,0 @@
>> > -inherit pyo3 setuptools3
>> > -
>> > -DEPENDS +=3D "python3-setuptools-rust-native"
>> > -
>> > -setuptools3_rust_do_configure() {
>> > -    pyo3_do_configure
>> > -    cargo_common_do_configure
>> > -    setuptools3_do_configure
>> > -}
>> > -
>> > -EXPORT_FUNCTIONS do_configure
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-aiofiles_0.8.0.bb b/meta-python/recipes-devtools/python/
>> python3-aiofiles_0.8.0.bb
>> > index d3bca2c21..d50cb8e6f 100644
>> > --- a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
>> > @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D
>> "8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a
>> >
>> >  PYPI_PACKAGE =3D "aiofiles"
>> >
>> > -inherit pypi poetry_core
>> > +inherit pypi python_poetry_core
>> >
>> >  RDEPENDS:${PN} =3D "\
>> >      ${PYTHON_PN}-asyncio \
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-asn1crypto_1.4.0.bb b/meta-python/recipes-devtools/python/
>> python3-asn1crypto_1.4.0.bb
>> > deleted file mode 100644
>> > index c052cb8c8..000000000
>> > --- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
>> > +++ /dev/null
>> > @@ -1,25 +0,0 @@
>> > -DESCRIPTION =3D "A fast, pure Python library for parsing and serializ=
ing
>> ASN.1 structures"
>> > -HOMEPAGE =3D "https://github.com/wbond/asn1crypto"
>> > -SECTION =3D "devel/python"
>> > -LICENSE =3D "MIT"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D7439e38f5e04ff62fae436184786b7ca"
>> > -
>> > -PYPI_PACKAGE =3D "asn1crypto"
>> > -
>> > -SRC_URI[md5sum] =3D "00bf5b72d37778e62cc73b1d8909ae27"
>> > -SRC_URI[sha256sum] =3D
>> "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
>> > -
>> > -inherit pypi setuptools3
>> > -
>> > -RDEPENDS:${PN}:class-target +=3D " \
>> > -    ${PYTHON_PN}-codecs \
>> > -    ${PYTHON_PN}-crypt \
>> > -    ${PYTHON_PN}-ctypes \
>> > -    ${PYTHON_PN}-datetime \
>> > -    ${PYTHON_PN}-io \
>> > -    ${PYTHON_PN}-netclient \
>> > -    ${PYTHON_PN}-numbers \
>> > -    ${PYTHON_PN}-shell \
>> > -"
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.15.0.b=
b
>> b/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
>> > deleted file mode 100644
>> > index c36f23b3d..000000000
>> > --- a/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
>> > +++ /dev/null
>> > @@ -1,18 +0,0 @@
>> > -SUMMARY =3D "Foreign Function Interface for Python calling C code"
>> > -HOMEPAGE =3D "http://cffi.readthedocs.org/"
>> > -LICENSE =3D "MIT"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D5677e2fdbf7cdda61d6dd2b57df547bf"
>> > -DEPENDS +=3D "libffi ${PYTHON_PN}-pycparser"
>> > -
>> > -SRC_URI[sha256sum] =3D
>> "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
>> > -
>> > -inherit pypi setuptools3
>> > -
>> > -RDEPENDS:${PN}:class-target =3D " \
>> > -    ${PYTHON_PN}-ctypes \
>> > -    ${PYTHON_PN}-io \
>> > -    ${PYTHON_PN}-pycparser \
>> > -    ${PYTHON_PN}-shell \
>> > -"
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-cryptography-vectors_36.0.1.bb
>> b/meta-python/recipes-devtools/python/
>> python3-cryptography-vectors_36.0.1.bb
>> > deleted file mode 100644
>> > index b9e6b811c..000000000
>> > --- a/meta-python/recipes-devtools/python/
>> python3-cryptography-vectors_36.0.1.bb
>> > +++ /dev/null
>> > @@ -1,24 +0,0 @@
>> > -SUMMARY =3D "Test vectors for the cryptography package."
>> > -HOMEPAGE =3D "https://cryptography.io/"
>> > -SECTION =3D "devel/python"
>> > -LICENSE =3D "Apache-2.0 | BSD-3-Clause"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>> > -
>> file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \
>> > -
>> file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b"
>> > -
>> > -# NOTE: Make sure to keep this recipe at the same version as
>> python3-cryptography
>> > -#       Upgrade both recipes at the same time
>> > -
>> > -SRC_URI[sha256sum] =3D
>> "fc8490afd5424342b868215435bd174dcd76ab396b4ea9435498be5721dcd598"
>> > -
>> > -PYPI_PACKAGE =3D "cryptography_vectors"
>> > -
>> > -inherit pypi setuptools3
>> > -
>> > -DEPENDS +=3D " \
>> > -    ${PYTHON_PN}-cryptography \
>> > -"
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > -
>> > -UPSTREAM_CHECK_REGEX =3D ""
>> > diff --git
>> a/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.to=
ml-specify-pem-version.patch
>> b/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.to=
ml-specify-pem-version.patch
>> > deleted file mode 100644
>> > index d7ab757bb..000000000
>> > ---
>> a/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.to=
ml-specify-pem-version.patch
>> > +++ /dev/null
>> > @@ -1,31 +0,0 @@
>> > -From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 200=
1
>> > -From: Tim Orling <tim.orling@konsulko.com>
>> > -Date: Fri, 14 Jan 2022 22:02:25 -0800
>> > -Subject: [PATCH] Cargo.toml: specify pem version
>> > -
>> > -pem =3D "1.0" is not resolving, specify the current
>> > -pem =3D { version: "1.0.2"}
>> > -
>> > -Upstream-Status: Pending
>> > -
>> > -Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> > ----
>> > - src/rust/Cargo.toml | 2 +-
>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > -
>> > -diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
>> > -index 617167d0..174eaa80 100644
>> > ---- a/src/rust/Cargo.toml
>> > -+++ b/src/rust/Cargo.toml
>> > -@@ -9,7 +9,7 @@ publish =3D false
>> > - lazy_static =3D "1"
>> > - pyo3 =3D { version =3D "0.15.1" }
>> > - asn1 =3D { version =3D "0.8.7", default-features =3D false, features=
 =3D
>> ["derive"] }
>> > --pem =3D "1.0"
>> > -+pem =3D { version =3D "1.0.2" }
>> > - chrono =3D { version =3D "0.4", default-features =3D false, features=
 =3D
>> ["alloc", "clock"] }
>> > - ouroboros =3D "0.13"
>> > -
>> > ---
>> > -2.30.2
>> > -
>> > diff --git
>> a/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.to=
ml-edition-2018-2021.patch
>> b/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.to=
ml-edition-2018-2021.patch
>> > deleted file mode 100644
>> > index 366e3a4d3..000000000
>> > ---
>> a/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.to=
ml-edition-2018-2021.patch
>> > +++ /dev/null
>> > @@ -1,28 +0,0 @@
>> > -From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 200=
1
>> > -From: Tim Orling <tim.orling@konsulko.com>
>> > -Date: Fri, 14 Jan 2022 22:34:59 -0800
>> > -Subject: [PATCH 2/2] Cargo.toml: edition 2018 -> 2021
>> > -
>> > -Upstream-Status: Pending
>> > -
>> > -Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> > ----
>> > - src/rust/Cargo.toml | 2 +-
>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > -
>> > -diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
>> > -index 174eaa80..7ad053d9 100644
>> > ---- a/src/rust/Cargo.toml
>> > -+++ b/src/rust/Cargo.toml
>> > -@@ -2,7 +2,7 @@
>> > - name =3D "cryptography-rust"
>> > - version =3D "0.1.0"
>> > - authors =3D ["The cryptography developers <cryptography-dev@python.o=
rg
>> >"]
>> > --edition =3D "2018"
>> > -+edition =3D "2021"
>> > - publish =3D false
>> > -
>> > - [dependencies]
>> > ---
>> > -2.30.2
>> > -
>> > diff --git
>> a/meta-python/recipes-devtools/python/python3-cryptography/check-memfree=
.py
>> b/meta-python/recipes-devtools/python/python3-cryptography/check-memfree=
.py
>> > deleted file mode 100755
>> > index c111a9074..000000000
>> > ---
>> a/meta-python/recipes-devtools/python/python3-cryptography/check-memfree=
.py
>> > +++ /dev/null
>> > @@ -1,10 +0,0 @@
>> > -#!/usr/bin/env python3
>> > -#
>> https://stackoverflow.com/questions/22102999/get-total-physical-memory-i=
n-python/28161352
>> > -import sys
>> > -meminfo =3D dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i i=
n
>> open('/proc/meminfo').readlines())
>> > -mem_free =3D meminfo['MemTotal']/1024./1024.
>> > -if mem_free < 2.:
>> > -    raise RuntimeError("Insufficient free memory({:.3f}): requires > =
2
>> GB".format(mem_free))
>> > -    sys.exit(1)
>> > -else:
>> > -    print("Free memory: {:.3f} GB".format(mem_free))
>> > diff --git
>> a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
>> b/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
>> > deleted file mode 100644
>> > index 1e97dda63..000000000
>> > --- a/meta-python/recipes-devtools/python/python3-cryptography/run-pte=
st
>> > +++ /dev/null
>> > @@ -1,4 +0,0 @@
>> > -#!/bin/sh
>> > -if ./check-memfree.py; then
>> > -    pytest -vvvv tests/
>> > -fi
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-cryptography_36.0.1.bb b/meta-python/recipes-devtools/python/
>> python3-cryptography_36.0.1.bb
>> > deleted file mode 100644
>> > index 00791dce2..000000000
>> > --- a/meta-python/recipes-devtools/python/
>> python3-cryptography_36.0.1.bb
>> > +++ /dev/null
>> > @@ -1,123 +0,0 @@
>> > -SUMMARY =3D "Provides cryptographic recipes and primitives to python
>> developers"
>> > -HOMEPAGE =3D "https://cryptography.io/"
>> > -SECTION =3D "devel/python"
>> > -LICENSE =3D "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dbf405a8056a6647e7d077b0e7bc36aba \
>> > -
>> file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \
>> > -
>> file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b \
>> > -
>> file://LICENSE.PSF;md5=3D43c37d21e1dbad10cddcd150ba2c0595 \
>> > -                   "
>> > -LDSHARED +=3D "-pthread"
>> > -
>> > -SRC_URI[sha256sum] =3D
>> "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
>> > -
>> > -SRC_URI +=3D " \
>> > -    file://run-ptest \
>> > -    file://check-memfree.py \
>> > -    file://0001-Cargo.toml-specify-pem-version.patch \
>> > -    file://0002-Cargo.toml-edition-2018-2021.patch \
>> > -"
>> > -
>> > -inherit pypi setuptools3_rust
>> > -
>> > -PIP_INSTALL_DIST_PATH =3D "${S}/dist"
>> > -
>> > -DEPENDS +=3D " \
>> > -    ${PYTHON_PN}-asn1crypto-native \
>> > -    ${PYTHON_PN}-cffi-native \
>> > -    ${PYTHON_PN}-setuptools-rust-native \
>> > -    ${PYTHON_PN}-six-native \
>> > -"
>> > -
>> > -SRC_URI +=3D " \
>> > -    crate://crates.io/Inflector/0.11.4 \
>> > -    crate://crates.io/aliasable/0.1.3 \
>> > -    crate://crates.io/asn1/0.8.7 \
>> > -    crate://crates.io/asn1_derive/0.8.7 \
>> > -    crate://crates.io/autocfg/1.0.1 \
>> > -    crate://crates.io/base64/0.13.0 \
>> > -    crate://crates.io/bitflags/1.3.2 \
>> > -    crate://crates.io/cfg-if/1.0.0 \
>> > -    crate://crates.io/chrono/0.4.19 \
>> > -    crate://crates.io/indoc-impl/0.3.6 \
>> > -    crate://crates.io/indoc/0.3.6 \
>> > -    crate://crates.io/instant/0.1.12 \
>> > -    crate://crates.io/lazy_static/1.4.0 \
>> > -    crate://crates.io/libc/0.2.112 \
>> > -    crate://crates.io/lock_api/0.4.5 \
>> > -    crate://crates.io/num-integer/0.1.44 \
>> > -    crate://crates.io/num-traits/0.2.14 \
>> > -    crate://crates.io/once_cell/1.9.0 \
>> > -    crate://crates.io/ouroboros/0.13.0 \
>> > -    crate://crates.io/ouroboros_macro/0.13.0 \
>> > -    crate://crates.io/parking_lot/0.11.2 \
>> > -    crate://crates.io/parking_lot_core/0.8.5 \
>> > -    crate://crates.io/paste-impl/0.1.18 \
>> > -    crate://crates.io/paste/0.1.18 \
>> > -    crate://crates.io/pem/1.0.2 \
>> > -    crate://crates.io/proc-macro-error-attr/1.0.4 \
>> > -    crate://crates.io/proc-macro-error/1.0.4 \
>> > -    crate://crates.io/proc-macro-hack/0.5.19 \
>> > -    crate://crates.io/proc-macro2/1.0.36 \
>> > -    crate://crates.io/pyo3-build-config/0.15.1 \
>> > -    crate://crates.io/pyo3-macros-backend/0.15.1 \
>> > -    crate://crates.io/pyo3-macros/0.15.1 \
>> > -    crate://crates.io/pyo3/0.15.1 \
>> > -    crate://crates.io/quote/1.0.14 \
>> > -    crate://crates.io/redox_syscall/0.2.10 \
>> > -    crate://crates.io/scopeguard/1.1.0 \
>> > -    crate://crates.io/smallvec/1.7.0 \
>> > -    crate://crates.io/stable_deref_trait/1.2.0 \
>> > -    crate://crates.io/syn/1.0.85 \
>> > -    crate://crates.io/unicode-xid/0.2.2 \
>> > -    crate://crates.io/unindent/0.1.7 \
>> > -    crate://crates.io/version_check/0.9.4 \
>> > -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
>> > -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
>> > -    crate://crates.io/winapi/0.3.9 \
>> > -"
>> > -
>> > -RDEPENDS:${PN} +=3D " \
>> > -    ${PYTHON_PN}-asn1crypto \
>> > -    ${PYTHON_PN}-cffi \
>> > -    ${PYTHON_PN}-idna \
>> > -    ${PYTHON_PN}-setuptools \
>> > -    ${PYTHON_PN}-six \
>> > -"
>> > -
>> > -RDEPENDS:${PN}:append:class-target =3D " \
>> > -    ${PYTHON_PN}-numbers \
>> > -    ${PYTHON_PN}-threading \
>> > -"
>> > -
>> > -RDEPENDS:${PN}-ptest +=3D " \
>> > -    ${PYTHON_PN}-bcrypt \
>> > -    ${PYTHON_PN}-cryptography-vectors \
>> > -    ${PYTHON_PN}-hypothesis \
>> > -    ${PYTHON_PN}-iso8601 \
>> > -    ${PYTHON_PN}-pretend \
>> > -    ${PYTHON_PN}-psutil \
>> > -    ${PYTHON_PN}-pytest \
>> > -    ${PYTHON_PN}-pytest-subtests \
>> > -    ${PYTHON_PN}-pytz \
>> > -"
>> > -
>> > -inherit ptest
>> > -
>> > -do_install_ptest() {
>> > -    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
>> > -    install -d ${D}${PTEST_PATH}/tests
>> > -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> > -    install -d ${D}${PTEST_PATH}/tests/hazmat
>> > -    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
>> > -    cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
>> > -}
>> > -
>> > -FILES:${PN}-ptest +=3D " \
>> > -    ${PTEST_PATH}/check-memfree.py \
>> > -"
>> > -FILES:${PN}-dbg +=3D " \
>> > -    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
>> > -"
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-dnspython_2.2.0.bb b/meta-python/recipes-devtools/python/
>> python3-dnspython_2.2.0.bb
>> > index cf76a142b..eb8269e4f 100644
>> > --- a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
>> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D5af50906b5929837f667dfe31052bd34"
>> >
>> >  SRC_URI[sha256sum] =3D
>> "e79351e032d0b606b98d38a4b0e6e2275b31a5b85c873e587cc11b73aca026d6"
>> >
>> > -inherit pypi poetry_core ptest
>> > +inherit pypi python_poetry_core ptest
>> >
>> >  SRC_URI +=3D " \
>> >         file://run-ptest \
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-iso8601_1.0.2.bb b/meta-python/recipes-devtools/python/
>> python3-iso8601_1.0.2.bb
>> > index aabc47d69..93af233d2 100644
>> > --- a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
>> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Db05625f2336fa024e8d57e65c6595844"
>> >
>> >  SRC_URI[sha256sum] =3D
>> "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
>> >
>> > -inherit pypi poetry_core
>> > +inherit pypi python_poetry_core
>> >
>> >  RDEPENDS:${PN} +=3D "\
>> >      ${PYTHON_PN}-datetime \
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-isort_5.10.1.bb b/meta-python/recipes-devtools/python/
>> python3-isort_5.10.1.bb
>> > index 6a6d5ed13..27977821c 100644
>> > --- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
>> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3D8227180126797a0148
>> >
>> >  SRC_URI[sha256sum] =3D
>> "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
>> >
>> > -inherit pypi poetry_core
>> > +inherit pypi python_poetry_core
>> >
>> >  RDEPENDS:${PN} +=3D "\
>> >      ${PYTHON_PN}-datetime \
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/
>> python3-pkgconfig_1.5.5.bb
>> > index c5a74796a..1aa91deac 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
>> > @@ -10,7 +10,7 @@ RDEPENDS:${PN} =3D "pkgconfig \
>> >                   ${PYTHON_PN}-shell \
>> >                   "
>> >
>> > -inherit pypi poetry_core
>> > +inherit pypi python_poetry_core
>> >
>> >  BBCLASSEXTEND =3D "native"
>> >
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/
>> python3-poetry-core_1.0.8.bb
>> > index 99ec763c4..2e8688b8e 100644
>> > --- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
>> > @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D104d5c3c653aeededf4076773aa4c236 \
>> >
>> >  SRC_URI[sha256sum] =3D
>> "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
>> >
>> > -inherit poetry_core pypi
>> > +inherit python_poetry_core pypi
>> >
>> >  PIP_INSTALL_PACKAGE =3D "poetry_core"
>> >
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-pycparser_2.21.bb b/meta-python/recipes-devtools/python/
>> python3-pycparser_2.21.bb
>> > deleted file mode 100644
>> > index 53b736790..000000000
>> > --- a/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
>> > +++ /dev/null
>> > @@ -1,21 +0,0 @@
>> > -SUMMARY =3D "Parser of the C language, written in pure Python"
>> > -HOMEPAGE =3D "https://github.com/eliben/pycparser"
>> > -LICENSE =3D "BSD-3-Clause"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D2c28cdeabcb88f5843d934381b4b4fea"
>> > -
>> > -SRC_URI[sha256sum] =3D
>> "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
>> > -
>> > -inherit pypi setuptools3
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > -
>> > -RDEPENDS:${PN}:class-target +=3D "\
>> > -    ${PYTHON_PN}-netclient \
>> > -    ${PYTHON_PN}-ply \
>> > -    ${PYTHON_PN}-pprint \
>> > -    "
>> > -
>> > -RSUGGESTS:${PN}:class-target +=3D "\
>> > -    cpp \
>> > -    cpp-symlinks \
>> > -    "
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-pymisp_2.4.155.1.bb b/meta-python/recipes-devtools/python/
>> python3-pymisp_2.4.155.1.bb
>> > index ef18671a0..613a009d4 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
>> > @@ -7,7 +7,7 @@ SRC_URI =3D "git://
>> github.com/MISP/PyMISP.git;protocol=3Dhttps;branch=3Dmain"
>> >  SRCREV =3D "03dc22f9598e6caae81b0e40ce27bf3f17799f4e"
>> >  S =3D "${WORKDIR}/git"
>> >
>> > -inherit poetry_core
>> > +inherit python_poetry_core
>> >
>> >  PIP_INSTALL_PACKAGE =3D "pymisp"
>> >
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/
>> python3-pyruvate_1.1.2.bb
>> > index 143125bbb..97fce690e 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
>> > @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D
>> "10befedd97e73fc18b902d02aa3b24e8978aa162242c1b664849c886c0
>> >
>> >  S =3D "${WORKDIR}/pyruvate-${PV}"
>> >
>> > -inherit pypi setuptools3_rust
>> > +inherit pypi python_setuptools3_rust
>> >
>> >  PIP_INSTALL_DIST_PATH =3D "${S}/dist"
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
>> b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
>> > index 7e572a933..21b664ddd 100644
>> > --- a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
>> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dc403f6882d4f97a9cd927df987d55634"
>> >
>> >  SRC_URI[sha256sum] =3D
>> "5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17"
>> >
>> > -inherit pypi poetry_core update-alternatives
>> > +inherit pypi python_poetry_core update-alternatives
>> >
>> >  ALTERNATIVE:${PN} =3D "\
>> >      pyrsa-decrypt \
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-semantic-version_2.9.0.bb b/meta-python/recipes-devtools/python/
>> python3-semantic-version_2.9.0.bb
>> > deleted file mode 100644
>> > index ee635871b..000000000
>> > --- a/meta-python/recipes-devtools/python/
>> python3-semantic-version_2.9.0.bb
>> > +++ /dev/null
>> > @@ -1,12 +0,0 @@
>> > -SUMMARY  =3D "A library implementing the 'SemVer' scheme."
>> > -DESCRIPTION =3D "Semantic version comparison for Python (see
>> http://semver.org/)"
>> > -HOMEPAGE =3D "https://github.com/rbarrois/python-semanticversion"
>> > -LICENSE =3D "BSD-2-Clause"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D4fb31e3c1c7eeb8b5e8c07657cdd54e2"
>> > -
>> > -SRC_URI[sha256sum] =3D
>> "abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b59dcf214006a12b2"
>> > -
>> > -PYPI_PACKAGE =3D "semantic_version"
>> > -inherit pypi setuptools3
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-setuptools-rust-native_1.1.2.bb
>> b/meta-python/recipes-devtools/python/
>> python3-setuptools-rust-native_1.1.2.bb
>> > deleted file mode 100644
>> > index 73dcbb26e..000000000
>> > --- a/meta-python/recipes-devtools/python/
>> python3-setuptools-rust-native_1.1.2.bb
>> > +++ /dev/null
>> > @@ -1,33 +0,0 @@
>> > -SUMMARY =3D "Setuptools Rust extension plugin"
>> > -DESCRIPTION =3D "setuptools-rust is a plugin for setuptools to build
>> Rust \
>> > -Python extensions implemented with PyO3 or rust-cpython.\
>> > -\
>> > -Compile and distribute Python extensions written in Rust as easily as
>> if they were written in C."
>> > -HOMEPAGE =3D "https://github.com/PyO3/setuptools-rust"
>> > -BUGTRACKER =3D "https://github.com/PyO3/setuptools-rust/issues"
>> > -
>> > -LICENSE =3D "MIT"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D011cd92e702dd9e6b1a26157b6fd53f5"
>> > -
>> > -SRC_URI =3D "
>> https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e45=
4bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz
>> "
>> > -SRC_URI[sha256sum] =3D
>> "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
>> > -
>> > -# While this has a pyproject.toml and declares that
>> setuptools_build_meta should work
>> > -# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay
>> with setuptools3
>> > -# until that can be resolved
>> > -inherit cargo pypi setuptools3 native
>> > -
>> > -# For some reason the wheel is built in ${S} not ${B}
>> > -PIP_INSTALL_DIST_PATH =3D "${S}/dist"
>> > -PIP_INSTALL_PACKAGE =3D "setuptools_rust"
>> > -
>> > -DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
>> > -
>> > -RDEPENDS:${PN}:class-native +=3D " \
>> > -    python3-semantic-version-native \
>> > -    python3-setuptools-native \
>> > -    python3-setuptools-scm-native \
>> > -    python3-toml-native \
>> > -    python3-typing-extensions-native \
>> > -    python3-wheel-native \
>> > -"
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-typing-extensions_3.10.0.0.bb
>> b/meta-python/recipes-devtools/python/
>> python3-typing-extensions_3.10.0.0.bb
>> > deleted file mode 100644
>> > index a5f491c77..000000000
>> > --- a/meta-python/recipes-devtools/python/
>> python3-typing-extensions_3.10.0.0.bb
>> > +++ /dev/null
>> > @@ -1,12 +0,0 @@
>> > -HOMEPAGE =3D "https://github.com/python/typing"
>> > -LICENSE =3D "PSF-2.0"
>> > -LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed72f"
>> > -
>> > -# The name on PyPi is slightly different.
>> > -PYPI_PACKAGE =3D "typing_extensions"
>> > -
>> > -SRC_URI[sha256sum] =3D
>> "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
>> > -
>> > -inherit pypi setuptools3
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > --
>> > 2.25.1
>> >
>> >
>> >
>> >
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95979):
> https://lists.openembedded.org/g/openembedded-devel/message/95979
> Mute This Topic: https://lists.openembedded.org/mt/89765063/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000024469005da2f6801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 14, 2022 at 8:30 AM Tim Orling via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;ticotimo=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)"><div><br></div><div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 1=
3, 2022 at 8:58 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div></div></div><div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)">missed python3-pyrad, I have take=
n care of that<br>
<br>
On Sun, Mar 13, 2022 at 7:03 PM Alejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@en=
edino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:alej=
andro.hernandez@linux.microsoft.com" target=3D"_blank">alejandro.hernandez@=
linux.microsoft.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro.hernandez@linux.microsoft.com" target=3D"_blank">alejandro.h=
ernandez@linux.microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-python/classes/poetry_core.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 15 ---<br>
&gt;=C2=A0 meta-python/classes/pyo3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 30 -----<br>
&gt;=C2=A0 meta-python/classes/setuptools3_rust.bbclass=C2=A0 |=C2=A0 11 --=
<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-aiofiles_0.8.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-aiofiles_0.8.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-asn1crypto_1.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-asn1crypto_1.4.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 25 ----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-cffi_1.15.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-cffi_1.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ---<br>
&gt;=C2=A0 .../<a href=3D"http://python3-cryptography-vectors_36.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-cryptography-vectors_36.0.1.bb</=
a>=C2=A0 =C2=A0 |=C2=A0 24 ----<br>
&gt;=C2=A0 .../0001-Cargo.toml-specify-pem-version.patch |=C2=A0 31 -----<b=
r>
&gt;=C2=A0 .../0002-Cargo.toml-edition-2018-2021.patch=C2=A0 =C2=A0|=C2=A0 =
28 ----<br>
&gt;=C2=A0 .../python3-cryptography/check-memfree.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 --<br>
&gt;=C2=A0 .../python/python3-cryptography/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 -<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-cryptography_36.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 123 ------------------<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-dnspython_2.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-dnspython_2.2.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-iso8601_1.0.2.bb" rel=3D"no=
referrer" target=3D"_blank">python3-iso8601_1.0.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-isort_5.10.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-isort_5.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pkgconfig_1.5.5.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pkgconfig_1.5.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-poetry-core_1.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.0.8.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pycparser_2.21.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pycparser_2.21.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 21 ---<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pymisp_2.4.155.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pymisp_2.4.155.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pyruvate_1.1.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pyruvate_1.1.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-</blockquote></div></div><div><div clas=
s=3D"gmail_quote"><div dir=3D"auto">this didn=E2=80=99t move</div><div dir=
=3D"auto">I think this list was too aggressive?</div></div></div></blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">Oh I think I read it wrong=
:/</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)"><div><div class=3D"gmail_quote"><div dir=3D"auto">=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)" dir=3D"auto"><br></blockquote></div></div><div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto">
&gt;=C2=A0 .../python/<a href=3D"http://python3-rsa_4.8.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-rsa_4.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-semantic-version_2.9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-semantic-version_2.9.0.bb</a>=
=C2=A0 |=C2=A0 12 --<br>
&gt;=C2=A0 .../<a href=3D"http://python3-setuptools-rust-native_1.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-setuptools-rust-native_1.1.2.bb=
</a>=C2=A0 =C2=A0|=C2=A0 33 -----<br>
&gt;=C2=A0 .../<a href=3D"http://python3-typing-extensions_3.10.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-typing-extensions_3.10.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 --<br>
&gt;=C2=A0 24 files changed, 9 insertions(+), 406 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-python/classes/poetry_core.bbclass<br>
&gt;=C2=A0 delete mode 100644 meta-python/classes/pyo3.bbclass<br>
&gt;=C2=A0 delete mode 100644 meta-python/classes/setuptools3_rust.bbclass<=
br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-asn1crypto_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-asn1crypto_1.4.0.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-cffi_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-cffi_1.15.0.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-cryptography-vectors_36.0.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-cryptography-vectors_36.0.1.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/python3-c=
ryptography/0001-Cargo.toml-specify-pem-version.patch<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/python3-c=
ryptography/0002-Cargo.toml-edition-2018-2021.patch<br>
&gt;=C2=A0 delete mode 100755 meta-python/recipes-devtools/python/python3-c=
ryptography/check-memfree.py<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/python3-c=
ryptography/run-ptest<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-cryptography_36.0.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-cryptography_36.0.1.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pycparser_2.21.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pycparser_2.21.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-semantic-version_2.9.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-semantic-version_2.9.0.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-setuptools-rust-native_1.1.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-setuptools-rust-native_1.1.2.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-typing-extensions_3.10.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-typing-extensions_3.10.0.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/cla=
sses/poetry_core.bbclass<br>
&gt; deleted file mode 100644<br>
&gt; index fb37c78c7..000000000<br>
&gt; --- a/meta-python/classes/poetry_core.bbclass<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,15 +0,0 @@<br>
&gt; -inherit pip_install_wheel python3native setuptools3-base<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;python3-poetry-core-native&quot;<br>
&gt; -<br>
&gt; -poetry_core_do_configure () {<br>
&gt; -=C2=A0 =C2=A0 :<br>
&gt; -}<br>
&gt; -<br>
&gt; -# TODO: ideally this uses pypa/build<br>
&gt; -poetry_core_do_compile () {<br>
&gt; -=C2=A0 =C2=A0 nativepython3 -c &quot;from poetry.core.masonry import =
api; api.build_wheel(&#39;${PIP_INSTALL_DIST_PATH}&#39;)&quot;<br>
&gt; -}<br>
&gt; -do_compile[cleandirs] +=3D &quot;${PIP_INSTALL_DIST_PATH}&quot;<br>
&gt; -<br>
&gt; -EXPORT_FUNCTIONS do_configure do_compile<br>
&gt; diff --git a/meta-python/classes/pyo3.bbclass b/meta-python/classes/py=
o3.bbclass<br>
&gt; deleted file mode 100644<br>
&gt; index 6ce21329c..000000000<br>
&gt; --- a/meta-python/classes/pyo3.bbclass<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -#<br>
&gt; -# This class helps make sure that Python extensions built with PyO3<b=
r>
&gt; -# and setuptools_rust properly set up the environment for cross compi=
lation<br>
&gt; -#<br>
&gt; -<br>
&gt; -inherit cargo python3-dir siteinfo<br>
&gt; -<br>
&gt; -export PYO3_CROSS=3D&quot;1&quot;<br>
&gt; -export PYO3_CROSS_PYTHON_VERSION=3D&quot;${PYTHON_BASEVERSION}&quot;<=
br>
&gt; -export PYO3_CROSS_LIB_DIR=3D&quot;${STAGING_LIBDIR}&quot;<br>
&gt; -export CARGO_BUILD_TARGET=3D&quot;${HOST_SYS}&quot;<br>
&gt; -export RUSTFLAGS<br>
&gt; -export PYO3_PYTHON=3D&quot;${PYTHON}&quot;<br>
&gt; -export PYO3_CONFIG_FILE=3D&quot;${WORKDIR}/pyo3.config&quot;<br>
&gt; -<br>
&gt; -pyo3_do_configure () {<br>
&gt; -=C2=A0 =C2=A0 cat &gt; ${WORKDIR}/pyo3.config &lt;&lt; EOF<br>
&gt; -implementation=3DCPython<br>
&gt; -version=3D${PYTHON_BASEVERSION}<br>
&gt; -shared=3Dtrue<br>
&gt; -abi3=3Dfalse<br>
&gt; -lib_name=3D${PYTHON_DIR}<br>
&gt; -lib_dir=3D${STAGING_LIBDIR}<br>
&gt; -pointer_width=3D${SITEINFO_BITS}<br>
&gt; -build_flags=3DWITH_THREAD<br>
&gt; -suppress_build_script_link_lines=3Dfalse<br>
&gt; -EOF<br>
&gt; -}<br>
&gt; -<br>
&gt; -EXPORT_FUNCTIONS do_configure<br>
&gt; diff --git a/meta-python/classes/setuptools3_rust.bbclass b/meta-pytho=
n/classes/setuptools3_rust.bbclass<br>
&gt; deleted file mode 100644<br>
&gt; index fb11f08f8..000000000<br>
&gt; --- a/meta-python/classes/setuptools3_rust.bbclass<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -inherit pyo3 setuptools3<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;python3-setuptools-rust-native&quot;<br>
&gt; -<br>
&gt; -setuptools3_rust_do_configure() {<br>
&gt; -=C2=A0 =C2=A0 pyo3_do_configure<br>
&gt; -=C2=A0 =C2=A0 cargo_common_do_configure<br>
&gt; -=C2=A0 =C2=A0 setuptools3_do_configure<br>
&gt; -}<br>
&gt; -<br>
&gt; -EXPORT_FUNCTIONS do_configure<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-aiofiles_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiofil=
es_0.8.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-aiofiles_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiofil=
es_0.8.0.bb</a><br>
&gt; index d3bca2c21..d50cb8e6f 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ai=
ofiles_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiofiles_0.8.=
0.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ai=
ofiles_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiofiles_0.8.=
0.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D &quot;8334f23235248a3b2e83b2c3a=
78a22674f39969b96397126cc93664d9a<br>
&gt;<br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;aiofiles&quot;<br>
&gt;<br>
&gt; -inherit pypi poetry_core<br>
&gt; +inherit pypi python_poetry_core<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-asyncio \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-asn1crypto_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-asn1=
crypto_1.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-asn1crypto_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
asn1crypto_1.4.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index c052cb8c8..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-as=
n1crypto_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-asn1crypto_=
1.4.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,25 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;A fast, pure Python library for parsing and ser=
ializing ASN.1 structures&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/wbond/asn1crypto" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/wbond/asn1crypto</a>&=
quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7439e38f5e04ff62fae43=
6184786b7ca&quot;<br>
&gt; -<br>
&gt; -PYPI_PACKAGE =3D &quot;asn1crypto&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;00bf5b72d37778e62cc73b1d8909ae27&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f4f6e119474e58e04a2b1af817eb585b4fd72bdd=
89b998624712b5c99be7641c&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}:class-target +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-codecs \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-crypt \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-ctypes \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-io \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-netclient \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-numbers \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-shell \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-cffi_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cffi_1.15=
.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-c=
ffi_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cffi_1.15.0.bb<=
/a><br>
&gt; deleted file mode 100644<br>
&gt; index c36f23b3d..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cf=
fi_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cffi_1.15.0.bb</=
a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,18 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Foreign Function Interface for Python calling C cod=
e&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://cffi.readthedocs.org/" rel=3D"no=
referrer" target=3D"_blank">http://cffi.readthedocs.org/</a>&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5677e2fdbf7cdda61d6dd=
2b57df547bf&quot;<br>
&gt; -DEPENDS +=3D &quot;libffi ${PYTHON_PN}-pycparser&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;920f0d66a896c2d99f0adbb391f990a840911795=
42c205fa53ce5787aff87954&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}:class-target =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-ctypes \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-io \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pycparser \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-shell \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-cryptography-vectors_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-cryptography-vectors_36.0.1.bb</a> b/meta-python/recipes-devtools/py=
thon/<a href=3D"http://python3-cryptography-vectors_36.0.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-cryptography-vectors_36.0.1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index b9e6b811c..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography-vectors_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
cryptography-vectors_36.0.1.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,24 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Test vectors for the cryptography package.&quot;<br=
>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://cryptography.io/" rel=3D"norefe=
rrer" target=3D"_blank">https://cryptography.io/</a>&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0 | BSD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb6fae01f1d2=
53ab91511e4 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b&quot;<br>
&gt; -<br>
&gt; -# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;fc8490afd5424342b868215435bd174dcd76ab39=
6b4ea9435498be5721dcd598&quot;<br>
&gt; -<br>
&gt; -PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; -<br>
&gt; -UPSTREAM_CHECK_REGEX =3D &quot;&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-cryptography/=
0001-Cargo.toml-specify-pem-version.patch b/meta-python/recipes-devtools/py=
thon/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch<br>
&gt; deleted file mode 100644<br>
&gt; index d7ab757bb..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-cryptography/0001-Ca=
rgo.toml-specify-pem-version.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" targe=
t=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; -Date: Fri, 14 Jan 2022 22:02:25 -0800<br>
&gt; -Subject: [PATCH] Cargo.toml: specify pem version<br>
&gt; -<br>
&gt; -pem =3D &quot;1.0&quot; is not resolving, specify the current<br>
&gt; -pem =3D { version: &quot;1.0.2&quot;}<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.c=
om" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/rust/Cargo.toml | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml<br>
&gt; -index 617167d0..174eaa80 100644<br>
&gt; ---- a/src/rust/Cargo.toml<br>
&gt; -+++ b/src/rust/Cargo.toml<br>
&gt; -@@ -9,7 +9,7 @@ publish =3D false<br>
&gt; - lazy_static =3D &quot;1&quot;<br>
&gt; - pyo3 =3D { version =3D &quot;0.15.1&quot; }<br>
&gt; - asn1 =3D { version =3D &quot;0.8.7&quot;, default-features =3D false=
, features =3D [&quot;derive&quot;] }<br>
&gt; --pem =3D &quot;1.0&quot;<br>
&gt; -+pem =3D { version =3D &quot;1.0.2&quot; }<br>
&gt; - chrono =3D { version =3D &quot;0.4&quot;, default-features =3D false=
, features =3D [&quot;alloc&quot;, &quot;clock&quot;] }<br>
&gt; - ouroboros =3D &quot;0.13&quot;<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.30.2<br>
&gt; -<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-cryptography/=
0002-Cargo.toml-edition-2018-2021.patch b/meta-python/recipes-devtools/pyth=
on/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 366e3a4d3..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-cryptography/0002-Ca=
rgo.toml-edition-2018-2021.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" targe=
t=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; -Date: Fri, 14 Jan 2022 22:34:59 -0800<br>
&gt; -Subject: [PATCH 2/2] Cargo.toml: edition 2018 -&gt; 2021<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.c=
om" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/rust/Cargo.toml | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml<br>
&gt; -index 174eaa80..7ad053d9 100644<br>
&gt; ---- a/src/rust/Cargo.toml<br>
&gt; -+++ b/src/rust/Cargo.toml<br>
&gt; -@@ -2,7 +2,7 @@<br>
&gt; - name =3D &quot;cryptography-rust&quot;<br>
&gt; - version =3D &quot;0.1.0&quot;<br>
&gt; - authors =3D [&quot;The cryptography developers &lt;<a href=3D"mailto=
:cryptography-dev@python.org" target=3D"_blank">cryptography-dev@python.org=
</a>&gt;&quot;]<br>
&gt; --edition =3D &quot;2018&quot;<br>
&gt; -+edition =3D &quot;2021&quot;<br>
&gt; - publish =3D false<br>
&gt; -<br>
&gt; - [dependencies]<br>
&gt; ---<br>
&gt; -2.30.2<br>
&gt; -<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-cryptography/=
check-memfree.py b/meta-python/recipes-devtools/python/python3-cryptography=
/check-memfree.py<br>
&gt; deleted file mode 100755<br>
&gt; index c111a9074..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-cryptography/check-m=
emfree.py<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,10 +0,0 @@<br>
&gt; -#!/usr/bin/env python3<br>
&gt; -# <a href=3D"https://stackoverflow.com/questions/22102999/get-total-p=
hysical-memory-in-python/28161352" rel=3D"noreferrer" target=3D"_blank">htt=
ps://stackoverflow.com/questions/22102999/get-total-physical-memory-in-pyth=
on/28161352</a><br>
&gt; -import sys<br>
&gt; -meminfo =3D dict((i.split()[0].rstrip(&#39;:&#39;),int(i.split()[1]))=
 for i in open(&#39;/proc/meminfo&#39;).readlines())<br>
&gt; -mem_free =3D meminfo[&#39;MemTotal&#39;]/1024./1024.<br>
&gt; -if mem_free &lt; 2.:<br>
&gt; -=C2=A0 =C2=A0 raise RuntimeError(&quot;Insufficient free memory({:.3f=
}): requires &gt; 2 GB&quot;.format(mem_free))<br>
&gt; -=C2=A0 =C2=A0 sys.exit(1)<br>
&gt; -else:<br>
&gt; -=C2=A0 =C2=A0 print(&quot;Free memory: {:.3f} GB&quot;.format(mem_fre=
e))<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-cryptography/=
run-ptest b/meta-python/recipes-devtools/python/python3-cryptography/run-pt=
est<br>
&gt; deleted file mode 100644<br>
&gt; index 1e97dda63..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-cryptography/run-pte=
st<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,4 +0,0 @@<br>
&gt; -#!/bin/sh<br>
&gt; -if ./check-memfree.py; then<br>
&gt; -=C2=A0 =C2=A0 pytest -vvvv tests/<br>
&gt; -fi<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-cryptography_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
ryptography_36.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"=
http://python3-cryptography_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-cryptography_36.0.1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 00791dce2..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography_36.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy_36.0.1.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,123 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Provides cryptographic recipes and primitives to py=
thon developers&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://cryptography.io/" rel=3D"norefe=
rrer" target=3D"_blank">https://cryptography.io/</a>&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;( Apache-2.0 | BSD-3-Clause ) &amp; PSF-2.0&quot;<b=
r>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbf405a8056a6647e7d077=
b0e7bc36aba \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.PSF;md5=3D43c37d21e1dbad10cddcd150ba2c0595 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;<br>
&gt; -LDSHARED +=3D &quot;-pthread&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;53e5c1dc3d7a953de055d77bef2ff607ceef7a2a=
ac0353b5d630ab67f7423638&quot;<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; -=C2=A0 =C2=A0 file://check-memfree.py \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Cargo.toml-specify-pem-version.patch \<br>
&gt; -=C2=A0 =C2=A0 file://0002-Cargo.toml-edition-2018-2021.patch \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3_rust<br>
&gt; -<br>
&gt; -PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto-native \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-cffi-native \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools-rust-native \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-six-native \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/Inflector/0.11.4" r=
el=3D"noreferrer" target=3D"_blank">crates.io/Inflector/0.11.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aliasable/0.1.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/aliasable/0.1.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.8.7" rel=3D"=
noreferrer" target=3D"_blank">crates.io/asn1/0.8.7</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.8.7" =
rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.8.7</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.0.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.0.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.13.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.13.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.19" rel=
=3D"noreferrer" target=3D"_blank">crates.io/chrono/0.4.19</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc-impl/0.3.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/indoc-impl/0.3.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/0.3.6" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/0.3.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/instant/0.1.12" rel=
=3D"noreferrer" target=3D"_blank">crates.io/instant/0.1.12</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.4.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.4.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.112" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.112</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.44"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.44</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.14" =
rel=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.14</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.9.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.9.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ouroboros/0.13.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/ouroboros/0.13.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ouroboros_macro/0.1=
3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ouroboros_macro/0.13.0<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.11.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.11.2</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.8.5<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste-impl/0.1.18" =
rel=3D"noreferrer" target=3D"_blank">crates.io/paste-impl/0.1.18</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste/0.1.18" rel=
=3D"noreferrer" target=3D"_blank">crates.io/paste/0.1.18</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/1.0.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/pem/1.0.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-error-at=
tr/1.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-error-a=
ttr/1.0.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-error/1.=
0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-error/1.0.4<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-hack/0.5=
.19" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-hack/0.5.19<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.36"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.36</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.15.1" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.1=
5.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.15.1" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend=
/0.15.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.15.1"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.15.1</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.15.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pyo3/0.15.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.14" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.14</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.2.1=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.2.10</a> =
\<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.7.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.7.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/stable_deref_trait/=
1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/stable_deref_trait/1.=
2.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.85" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/1.0.85</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.2.2" =
rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.2.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.1.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.1.7</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-wind=
ows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-p=
c-windows-gnu/0.4.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-wi=
ndows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_=
64-pc-windows-gnu/0.4.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -RDEPENDS:${PN} +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-asn1crypto \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-cffi \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-idna \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-numbers \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-bcrypt \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-hypothesis \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-iso8601 \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pretend \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-psutil \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pytest-subtests \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pytz \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -inherit ptest<br>
&gt; -<br>
&gt; -do_install_ptest() {<br>
&gt; -=C2=A0 =C2=A0 install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH=
}/<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt; -=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests/hazmat<br>
&gt; -=C2=A0 =C2=A0 cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazm=
at/<br>
&gt; -=C2=A0 =C2=A0 cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/<br>
&gt; -}<br>
&gt; -<br>
&gt; -FILES:${PN}-ptest +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PTEST_PATH}/check-memfree.py \<br>
&gt; -&quot;<br>
&gt; -FILES:${PN}-dbg +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.=
debug \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-dnspython_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dnspy=
thon_2.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-dnspython_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dns=
python_2.2.0.bb</a><br>
&gt; index cf76a142b..eb8269e4f 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dn=
spython_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dnspython_2.=
2.0.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dn=
spython_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dnspython_2.=
2.0.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5af509=
06b5929837f667dfe31052bd34&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;e79351e032d0b606b98d38a4b0e6e2275b3=
1a5b85c873e587cc11b73aca026d6&quot;<br>
&gt;<br>
&gt; -inherit pypi poetry_core ptest<br>
&gt; +inherit pypi python_poetry_core ptest<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-iso8601_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-iso8601=
_1.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-iso8601_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-iso8601_1=
.0.2.bb</a><br>
&gt; index aabc47d69..93af233d2 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-is=
o8601_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-iso8601_1.0.2.=
bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-is=
o8601_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-iso8601_1.0.2.=
bb</a><br>
&gt; @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db05625=
f2336fa024e8d57e65c6595844&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;27f503220e6845d9db954fb212b95b0362d=
8b7e6c1b2326a87061c3de93594b1&quot;<br>
&gt;<br>
&gt; -inherit pypi poetry_core<br>
&gt; +inherit pypi python_poetry_core<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-isort_5.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-isort_5.=
10.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-isort_5.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-isort_5.10.1=
.bb</a><br>
&gt; index 6a6d5ed13..27977821c 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-is=
ort_5.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-isort_5.10.1.bb=
</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-is=
ort_5.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-isort_5.10.1.bb=
</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=
=3D6;endline=3D6;md5=3D8227180126797a0148<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;e8443a5e7a020e9d7f97f1d7d9cd17c88bc=
b3bc7e218bf9cf5095fe550be2951&quot;<br>
&gt;<br>
&gt; -inherit pypi poetry_core<br>
&gt; +inherit pypi python_poetry_core<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pkgconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgco=
nfig_1.5.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-pkgconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkg=
config_1.5.5.bb</a><br>
&gt; index c5a74796a..1aa91deac 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pk=
gconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgconfig_1.=
5.5.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pk=
gconfig_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pkgconfig_1.=
5.5.bb</a><br>
&gt; @@ -10,7 +10,7 @@ RDEPENDS:${PN} =3D &quot;pkgconfig \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${=
PYTHON_PN}-shell \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;<br>
&gt;<br>
&gt; -inherit pypi poetry_core<br>
&gt; +inherit pypi python_poetry_core<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-poetry-core_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-poe=
try-core_1.0.8.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-poetry-core_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-poetry-core_1.0.8.bb</a><br>
&gt; index 99ec763c4..2e8688b8e 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-po=
etry-core_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-cor=
e_1.0.8.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-po=
etry-core_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-cor=
e_1.0.8.bb</a><br>
&gt; @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D104d=
5c3c653aeededf4076773aa4c236 \<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;951fc7c1f8d710a94cb49019ee374212503=
9fc659675912ea614ac2aa405b118&quot;<br>
&gt;<br>
&gt; -inherit poetry_core pypi<br>
&gt; +inherit python_poetry_core pypi<br>
&gt;<br>
&gt;=C2=A0 PIP_INSTALL_PACKAGE =3D &quot;poetry_core&quot;<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pycparser_2.21.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycpar=
ser_2.21.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pycparser_2.21.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycpar=
ser_2.21.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 53b736790..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
cparser_2.21.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycparser_2.2=
1.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,21 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Parser of the C language, written in pure Python&qu=
ot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/eliben/pycparser" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/eliben/pycparser</a>&=
quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2c28cdeabcb88f5843d93=
4381b4b4fea&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;e644fdec12f7872f86c58ff790da456218b10f86=
3970249516d60a5eaca77206&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}:class-target +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-netclient \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-ply \<br>
&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pprint \<br>
&gt; -=C2=A0 =C2=A0 &quot;<br>
&gt; -<br>
&gt; -RSUGGESTS:${PN}:class-target +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 cpp \<br>
&gt; -=C2=A0 =C2=A0 cpp-symlinks \<br>
&gt; -=C2=A0 =C2=A0 &quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pymisp_2.4.155.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymi=
sp_2.4.155.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-pymisp_2.4.155.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pymisp_2.4.155.1.bb</a><br>
&gt; index ef18671a0..613a009d4 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
misp_2.4.155.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymisp_2.4.=
155.1.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
misp_2.4.155.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymisp_2.4.=
155.1.bb</a><br>
&gt; @@ -7,7 +7,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/M=
ISP/PyMISP.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D=
"_blank">github.com/MISP/PyMISP.git;protocol=3Dhttps;branch=3Dmain</a>&quot=
;<br>
&gt;=C2=A0 SRCREV =3D &quot;03dc22f9598e6caae81b0e40ce27bf3f17799f4e&quot;<=
br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit poetry_core<br>
&gt; +inherit python_poetry_core<br>
&gt;<br>
&gt;=C2=A0 PIP_INSTALL_PACKAGE =3D &quot;pymisp&quot;<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruva=
te_1.1.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruva=
te_1.1.2.bb</a><br>
&gt; index 143125bbb..97fce690e 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
ruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.1.=
2.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
ruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.1.=
2.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D &quot;10befedd97e73fc18b902d0=
2aa3b24e8978aa162242c1b664849c886c0<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/pyruvate-${PV}&quot;<br>
&gt;<br>
&gt; -inherit pypi setuptools3_rust<br>
&gt; +inherit pypi python_setuptools3_rust<br>
&gt;<br>
&gt;=C2=A0 PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-rsa_4.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-rsa_4.8.bb</a=
> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-rsa_4.8.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-rsa_4.8.bb</a><br>
&gt; index 7e572a933..21b664ddd 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-rs=
a_4.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-rsa_4.8.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-rs=
a_4.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-rsa_4.8.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc403f6=
882d4f97a9cd927df987d55634&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;5c6bd9dc7a543b7fe4304a631f8a8a3b674=
e2bbfc49c2ae96200cdbe55df6b17&quot;<br>
&gt;<br>
&gt; -inherit pypi poetry_core update-alternatives<br>
&gt; +inherit pypi python_poetry_core update-alternatives<br>
&gt;<br>
&gt;=C2=A0 ALTERNATIVE:${PN} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pyrsa-decrypt \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-semantic-version_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-semantic-version_2.9.0.bb</a> b/meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-semantic-version_2.9.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-semantic-version_2.9.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index ee635871b..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-se=
mantic-version_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-seman=
tic-version_2.9.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,12 +0,0 @@<br>
&gt; -SUMMARY=C2=A0 =3D &quot;A library implementing the &#39;SemVer&#39; s=
cheme.&quot;<br>
&gt; -DESCRIPTION =3D &quot;Semantic version comparison for Python (see <a =
href=3D"http://semver.org/" rel=3D"noreferrer" target=3D"_blank">http://sem=
ver.org/</a>)&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/rbarrois/python-sema=
nticversion" rel=3D"noreferrer" target=3D"_blank">https://github.com/rbarro=
is/python-semanticversion</a>&quot;<br>
&gt; -LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4fb31e3c1c7eeb8b5e8c0=
7657cdd54e2&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;abf54873553e5e07a6fd4d5f653b781f5ae41297=
a493666b59dcf214006a12b2&quot;<br>
&gt; -<br>
&gt; -PYPI_PACKAGE =3D &quot;semantic_version&quot;<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-setuptools-rust-native_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-setuptools-rust-native_1.1.2.bb</a> b/meta-python/recipes-devtools/=
python/<a href=3D"http://python3-setuptools-rust-native_1.1.2.bb" rel=3D"no=
referrer" target=3D"_blank">python3-setuptools-rust-native_1.1.2.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 73dcbb26e..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-se=
tuptools-rust-native_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-setuptools-rust-native_1.1.2.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,33 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Setuptools Rust extension plugin&quot;<br>
&gt; -DESCRIPTION =3D &quot;setuptools-rust is a plugin for setuptools to b=
uild Rust \<br>
&gt; -Python extensions implemented with PyO3 or rust-cpython.\<br>
&gt; -\<br>
&gt; -Compile and distribute Python extensions written in Rust as easily as=
 if they were written in C.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/PyO3/setuptools-rust=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/PyO3/setuptools-r=
ust</a>&quot;<br>
&gt; -BUGTRACKER =3D &quot;<a href=3D"https://github.com/PyO3/setuptools-ru=
st/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/PyO3/set=
uptools-rust/issues</a>&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D011cd92e702dd9e6b1a26=
157b6fd53f5&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://files.pythonhosted.org/packages/=
67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptoo=
ls-rust-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://file=
s.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a0=
6a88b4e38797445822a/setuptools-rust-${PV}.tar.gz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;a0adb9b503c0ffc4e8fe80b7c617898cefa78049=
983aaaea7f747e153a3e65d1&quot;<br>
&gt; -<br>
&gt; -# While this has a pyproject.toml and declares that setuptools_build_=
meta should work<br>
&gt; -# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay =
with setuptools3<br>
&gt; -# until that can be resolved<br>
&gt; -inherit cargo pypi setuptools3 native<br>
&gt; -<br>
&gt; -# For some reason the wheel is built in ${S} not ${B}<br>
&gt; -PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
&gt; -PIP_INSTALL_PACKAGE =3D &quot;setuptools_rust&quot;<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;python3-setuptools-scm-native python3-wheel-native=
&quot;<br>
&gt; -<br>
&gt; -RDEPENDS:${PN}:class-native +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 python3-semantic-version-native \<br>
&gt; -=C2=A0 =C2=A0 python3-setuptools-native \<br>
&gt; -=C2=A0 =C2=A0 python3-setuptools-scm-native \<br>
&gt; -=C2=A0 =C2=A0 python3-toml-native \<br>
&gt; -=C2=A0 =C2=A0 python3-typing-extensions-native \<br>
&gt; -=C2=A0 =C2=A0 python3-wheel-native \<br>
&gt; -&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-typing-extensions_3.10.0.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-typing-extensions_3.10.0.0.bb</a> b/meta-python/recipes-devtools/pyth=
on/<a href=3D"http://python3-typing-extensions_3.10.0.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-typing-extensions_3.10.0.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index a5f491c77..000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ty=
ping-extensions_3.10.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-t=
yping-extensions_3.10.0.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,12 +0,0 @@<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/python/typing" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/python/typing</a>&quot=
;<br>
&gt; -LICENSE =3D &quot;PSF-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D64fc2b30b67d0a8423c25=
0e0386ed72f&quot;<br>
&gt; -<br>
&gt; -# The name on PyPi is slightly different.<br>
&gt; -PYPI_PACKAGE =3D &quot;typing_extensions&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;50b6f157849174217d0656f99dc82fe932884fb2=
50826c18350e159ec6cdf342&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div></div><div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"></blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95979): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95979" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95979</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89765063/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89765063/924729</a><br>
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

--00000000000024469005da2f6801--

