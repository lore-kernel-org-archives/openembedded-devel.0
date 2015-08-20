Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id C2206766DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:01:50 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so38679184wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oVUByhi6HctjBCmOhvvmL1yo82qh08Q4mam3KEetZmQ=;
	b=0iV3FA5r0/68fOwegqKDDal8nWVcHm4+vG6qV1NIniQeUFB/qK4Y4YzJc0NsHnJfnJ
	sWhNQSFJGeQqLYWLXk9ciJRFhXft4jfdW8L7KEp4NX+9uXqBGwHODNCaF1y2bHSAZ+Bg
	XIWK7EF3SGL4JM9wKbUBctJQdRJ/i3SmS89P2/tyDbqWcw1Da78TOBEPz9rqzWe2vx3w
	lryzyb0jJppEGhb1mxyliEXxea3Yzz0J/v4z9qfoIExUrqkwLVP7AH+AiznunGiKxKQv
	nJFQ5IG7095Z2WWjSarsRHTP3UhzbMpPbpE5NuQfZNOTDwOqGo0pFF6xoQE/rFAb+eHN
	c+mw==
X-Received: by 10.194.117.133 with SMTP id ke5mr6840188wjb.116.1440082909994; 
	Thu, 20 Aug 2015 08:01:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fz16sm6530183wic.3.2015.08.20.08.01.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:01:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:02:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150216.GE2446@jama>
References: <1439527440-33965-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1439527440-33965-3-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1439527440-33965-3-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v5 2/6] konkretcmpi: add new recipe for openlmi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2015 15:01:51 -0000
X-Groupsio-MsgNum: 56833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline

--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2015 at 12:43:56PM +0800, Lei Maohui wrote:
> Konkretcmpi is dependence of openlmi.
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../konkretcmpi/konkretcmpi-native_0.9.2.bb        | 28 ++++++++++++++++
>  ...txt-fix-lib64-can-not-be-shiped-in-64bit-.patch | 31 ++++++++++++++++=
++
>  ...x-lib64-can-not-be-shiped-in-64bit-target.patch | 36 ++++++++++++++++=
++++
>  ...-0.9.2-fix-returning-instance-from-method.patch | 38 ++++++++++++++++=
++++++
>  .../konkretcmpi/konkretcmpi_0.9.2.bb               | 34 ++++++++++++++++=
+++
>  5 files changed, 167 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi-nati=
ve_0.9.2.bb
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001=
-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001=
-to-fix-lib64-can-not-be-shiped-in-64bit-target.patch
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konk=
retcmpi-0.9.2-fix-returning-instance-from-method.patch
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.=
2.bb
>=20
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.=
2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
> new file mode 100644
> index 0000000..d04c103
> --- /dev/null
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Tool for rapid CMPI providers development"
> +DESCRIPTION =3D "\
> +KonkretCMPI makes CMPI provider development easier by generating type-sa=
fe \
> +concrete CIM interfaces from MOF definitions and by providing default \
> +implementations for many of the provider operations."
> +HOMEPAGE =3D "https://github.com/rnovacek/konkretcmpi"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df673270bfc350d9ce1efc8724c6c1=
873"
> +DEPENDS =3D "cmake-native cmpi-bindings-native"
> +
> +SRC_URI =3D "https://github.com/rnovacek/${BPN}/archive/${PV}/${BP}.tar.=
gz \

Don't use github archives, they are regenerated from time to time with=20
different checksums.

> +           file://konkretcmpi-0.9.2-fix-returning-instance-from-method.p=
atch \
> +           file://0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64b=
it-.patch "
> +
> +SRC_URI[md5sum] =3D "7e8ed4f47d1a9e5cbed4208920f89d64"
> +SRC_URI[sha256sum] =3D "2ac52fc374e46d68317194bbd6b44e0b2f934df24b201efb=
395d3eccf0fed634"
> +
> +inherit native cmake
> +LDFLAGS_append =3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' =
-fuse-ld=3Dbfd ', '', d)}"
> +
> +EXTRA_OECMAKE =3D "-DWITH_PYTHON=3DON \
> +                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> +                "
> +
> +do_install_append() {
> +    rm -rf ${D}${datadir}
> +}
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeL=
ists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch b/meta-oe/recipes-exte=
nded/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shipe=
d-in-64bit-.patch
> new file mode 100644
> index 0000000..40a0643
> --- /dev/null
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.tx=
t-fix-lib64-can-not-be-shiped-in-64bit-.patch
> @@ -0,0 +1,31 @@
> +From d97ac2bf2ed9c84ffd65ff10989068b202e09fdf Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Mon, 3 Aug 2015 00:29:54 +0900
> +Subject: [PATCH] CMakeLists.txt: fix lib64 can not be shiped in 64bit ta=
rget
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + CMakeLists.txt | 7 -------
> + 1 file changed, 7 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index be544d1..14696e4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -11,13 +11,6 @@ set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cma=
ke/modules ${CMAKE_MODULE_P
> +=20
> + find_package(CMPI)
> +=20
> +-# Set LIB_SUFFIX to 64 on 64bit architectures
> +-if(CMAKE_SIZEOF_VOID_P EQUAL 4)
> +-    set(LIB_SUFFIX "")
> +-else(CMAKE_SIZEOF_VOID_P EQUAL 4)
> +-    set(LIB_SUFFIX 64)
> +-endif(CMAKE_SIZEOF_VOID_P EQUAL 4)
> +-
> + option(WITH_PYTHON "Build experimental Python bindings" OFF)
> +=20
> + add_subdirectory(cmake)
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix=
-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-extended/k=
onkretcmpi/konkretcmpi/0001-to-fix-lib64-can-not-be-shiped-in-64bit-target.=
patch
> new file mode 100644
> index 0000000..7da13ee
> --- /dev/null
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix-lib64-=
can-not-be-shiped-in-64bit-target.patch
> @@ -0,0 +1,36 @@
> +From f3c39fd2a4b5f53338b5f821788c63858bf860cf Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Sun, 2 Aug 2015 22:08:43 +0900
> +Subject: [PATCH] to fix lib64 can not be shiped in 64bit target
> +
> +To fix the warning as following:
> +WARNING: QA Issue: konkretcmpi: Files/directories were installed but not=
 shipped in any package:
> +  /usr/lib64
> +  /usr/lib64/libkonkret.so
> +  /usr/lib64/libkonkret.so.0.0.1
> +  /usr/lib64/libkonkret.so.0
> +  /usr/lib64/libkonkretmof.so.0.0.1
> +  /usr/lib64/libkonkretmof.so
> +  ...
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + cmake/modules/FindKonkretCMPI.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cmake/modules/FindKonkretCMPI.cmake b/cmake/modules/FindKon=
kretCMPI.cmake
> +index b888cfd..097caed 100644
> +--- a/cmake/modules/FindKonkretCMPI.cmake
> ++++ b/cmake/modules/FindKonkretCMPI.cmake
> +@@ -9,7 +9,7 @@ find_path(KONKRETCMPI_INCLUDE_DIR
> + find_library(KONKRETCMPI_LIBRARY
> +     NAMES konkret
> +     HINTS $ENV{KONKRETCMPI_LIB_DIR}
> +-    PATH_SUFFIXES lib64 lib
> ++    PATH_SUFFIXES lib lib64
> +     PATHS /usr /usr/local
> + )
> +=20
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi=
-0.9.2-fix-returning-instance-from-method.patch b/meta-oe/recipes-extended/=
konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-metho=
d.patch
> new file mode 100644
> index 0000000..b54d091
> --- /dev/null
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-=
fix-returning-instance-from-method.patch
> @@ -0,0 +1,38 @@
> +Port from Fedora20
> +
> +    | commit aca6c7f910ffe9930b5789969f0adfadd668bb46
> +    | Author: Michal Minar <miminar@redhat.com>
> +    | Date:   Fri Jun 20 10:50:45 2014 +0200
> +    |=20
> +    |     Fix returning instance as an output argument from method
> +    |    =20
> +    |     Submitted By: Radek Novacek <rnovacek@redhat.com>
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +
> +diff --git a/src/program/main.cpp b/src/program/main.cpp
> +index 885dc12..9e7108a 100644
> +--- a/src/program/main.cpp
> ++++ b/src/program/main.cpp
> +@@ -506,7 +506,11 @@ static void gen_feature_decls(
> +=20
> +             // Add sig entry [type][length][name][zero-terminator]
> +=20
> +-            KTag tag =3D _ktag(pd->data_type, pd->array_index, key, fal=
se, false);
> ++            KTag tag;
> ++            if (pd->qualifiers->has_key("EmbeddedInstance"))
> ++                tag =3D _ktag(TOK_INSTANCE, pd->array_index, key, false=
, false);
> ++            else
> ++                tag =3D _ktag(pd->data_type, pd->array_index, key, fals=
e, false);
> +             pack_tag(sig, tag);
> +             pack_name(sig, pd->name);
> +             count++;
> +@@ -640,6 +644,7 @@ static void gen_param(FILE* os, MOF_Parameter* p, ve=
ctor<unsigned char>& sig)
> +         const char* ktn =3D _ktype_name(p->data_type);
> +=20
> +         if (p->qualifiers->has_key("EmbeddedInstance")) {
> ++            tag =3D _ktag(TOK_INSTANCE, p->array_index, false, in, out);
> +             if (p->array_index)
> +                 put(os, "    KInstanceA $0;\n", p->name, NULL);
> +             else
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/=
meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> new file mode 100644
> index 0000000..fc15fae
> --- /dev/null
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Tool for rapid CMPI providers development"
> +DESCRIPTION =3D "\
> +KonkretCMPI makes CMPI provider development easier by generating type-sa=
fe \
> +concrete CIM interfaces from MOF definitions and by providing default \
> +implementations for many of the provider operations."
> +HOMEPAGE =3D "https://github.com/rnovacek/konkretcmpi"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df673270bfc350d9ce1efc8724c6c1=
873"
> +DEPENDS =3D "swig sblim-cmpi-devel python cmake-native"
> +
> +SRC_URI =3D "https://github.com/rnovacek/${BPN}/archive/${PV}/${BP}.tar.=
gz \
> +           file://konkretcmpi-0.9.2-fix-returning-instance-from-method.p=
atch \
> +           file://0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64b=
it-.patch \
> +           "
> +
> +SRC_URI[md5sum] =3D "7e8ed4f47d1a9e5cbed4208920f89d64"
> +SRC_URI[sha256sum] =3D "2ac52fc374e46d68317194bbd6b44e0b2f934df24b201efb=
395d3eccf0fed634"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DWITH_PYTHON=3DON \
> +                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> +                "
> +
> +do_install_append() {
> +    rm -rf ${D}${datadir}
> +}
> +
> +PACKAGES =3D+ "${PN}-python ${PN}-python-dbg"
> +
> +FILES_${PN}-python =3D "${libdir}/python2.7/site-packages/konkretmof.py*=
 ${libdir}/python2.7/site-packages/_konkretmof.so"
> +FILES_${PN}-python-dbg =3D "${libdir}/python2.7/site-packages/.debug/*"
> +
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV6/cACgkQN1Ujt2V2gByaFwCfYwSUcanqteY1gPqocVCURkwK
qjcAn0vDpj4you1ozZiptSs9CggsOPJu
=BuOQ
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--
