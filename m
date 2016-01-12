Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id B62DA73219
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 00:58:36 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id q63so54656272pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=37GvAriPRAIrI9U67dkqMjmGpyLYGYao9B1K6RpSISI=;
	b=hCD6/PlzQUVDZPPs8EM6Nz5Gu2GOKCfSR+GXQkgPTwqBI+V7bR+judV6aaA2TqS0hg
	S9lqf6XGHntI+fadnhpEyxh8Y4YfnzTo70HdiuKHhSekysE5JolpfSI9AqYzqeHc0ajL
	VwaDVe+ICeKMwp9+EkpmE6Xiax0XhKgnHTI4D6r6W/LdJGSg6ZHw9oPDrks140wpfl0B
	stygLU3YvJiy0WODxS5ZZcbESSe2RAIcmQeSct2xypVshyP5Vll0ULhcY8Uib7YD4ANS
	ixR52DYuPhtcd0JzIzrmjYngakjcjN9gWh9S7dSmO8yGK2B3zveky7ESnFbDLBvtV18K
	uTVQ==
X-Received: by 10.98.43.73 with SMTP id r70mr30233112pfr.4.1452560317453;
	Mon, 11 Jan 2016 16:58:37 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	e14sm188441459pap.24.2016.01.11.16.58.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 16:58:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452086098-31513-1-git-send-email-pascal.bach@siemens.com>
Date: Mon, 11 Jan 2016 16:58:31 -0800
Message-Id: <31425AD5-27AA-42F9-8415-753B70A0C7A1@gmail.com>
References: <1452086098-31513-1-git-send-email-pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCH] poco: Add recipe for POCO C++ library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 00:58:37 -0000
X-Groupsio-MsgNum: 59473
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C33F3028-2DB0-48DF-8F72-1B114D27AA1B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C33F3028-2DB0-48DF-8F72-1B114D27AA1B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 6, 2016, at 5:14 AM, Pascal Bach <pascal.bach@siemens.com> =
wrote:
>=20
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
> ...dation-library-version-back-to-SHARED_LIB.patch |  35 +++++++
> meta-oe/recipes-support/poco/poco/run-ptest        |   9 ++
> meta-oe/recipes-support/poco/poco_1.6.1.bb         | 108 =
+++++++++++++++++++++
> 3 files changed, 152 insertions(+)
> create mode 100644 =
meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-ver=
sion-back-to-SHARED_LIB.patch
> create mode 100644 meta-oe/recipes-support/poco/poco/run-ptest
> create mode 100644 meta-oe/recipes-support/poco/poco_1.6.1.bb

meta-ros has a recipe for libpoco
=
https://github.com/bmwcarit/meta-ros/blob/master/recipes-extended/libpoco/=
libpoco_1.5.3.bb
Can you coordinate with meta-ros maintainers to migrate it into meta-oe

>=20
> diff --git =
a/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-v=
ersion-back-to-SHARED_LIB.patch =
b/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-v=
ersion-back-to-SHARED_LIB.patch
> new file mode 100644
> index 0000000..f65bb15
> --- /dev/null
> +++ =
b/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-v=
ersion-back-to-SHARED_LIB.patch
> @@ -0,0 +1,35 @@
> +=46rom cec5a43151a11d8afbb5dd50caf4e22fb89c6340 Mon Sep 17 00:00:00 =
2001
> +From: Mike Gelfand <mikedld@mikedld.com>
> +Date: Sun, 20 Sep 2015 03:08:19 +0300
> +Subject: [PATCH] Change Foundation library version back to
> + SHARED_LIBRARY_VERSION
> +
> +Foundation is the only library using PROJECT_VERSION as library =
version,
> +the change accidentally introduced by commit b69fafb84c. This causes
> +difference in library being linked to (libPocoFoundation.31.dylib on =
Mac)
> +and library returned by $<TARGET_FILE:Poco::Foundation> for imported
> +target (libPocoFoundation.1.6.1.dylib), causing inconvenience. Also, =
this
> +differs from autoconf-based builds where only "31" (soversion) =
library is
> +being created and not "1.6.1" (project version) one.
> +
> +Upstream-Status: Backport from 1.6.2
> +---
> + Foundation/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Foundation/CMakeLists.txt b/Foundation/CMakeLists.txt
> +index c1dd25f..25f401c 100644
> +--- a/Foundation/CMakeLists.txt
> ++++ b/Foundation/CMakeLists.txt
> +@@ -108,7 +108,7 @@ add_library( "${LIBNAME}" ${LIB_MODE} ${SRCS})
> + add_library( "${POCO_LIBNAME}" ALIAS "${LIBNAME}")
> + set_target_properties( "${LIBNAME}"
> +     PROPERTIES
> +-    VERSION ${PROJECT_VERSION} SOVERSION ${SHARED_LIBRARY_VERSION}
> ++    VERSION ${SHARED_LIBRARY_VERSION} SOVERSION =
${SHARED_LIBRARY_VERSION}
> +     OUTPUT_NAME ${POCO_LIBNAME}
> +     DEFINE_SYMBOL Foundation_EXPORTS
> +     )
> +--
> +2.1.4
> +
> diff --git a/meta-oe/recipes-support/poco/poco/run-ptest =
b/meta-oe/recipes-support/poco/poco/run-ptest
> new file mode 100644
> index 0000000..c479f7a
> --- /dev/null
> +++ b/meta-oe/recipes-support/poco/poco/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +while read runner; do
> +  pushd . >/dev/null
> +  cd bin
> +  echo Testing $runner
> +  ./$runner-testrunner -all
> +  popd >/dev/null
> +done < testrunners
> +
> diff --git a/meta-oe/recipes-support/poco/poco_1.6.1.bb =
b/meta-oe/recipes-support/poco/poco_1.6.1.bb
> new file mode 100644
> index 0000000..9822186
> --- /dev/null
> +++ b/meta-oe/recipes-support/poco/poco_1.6.1.bb
> @@ -0,0 +1,108 @@
> +SUMMARY =3D "Modern, powerful open source cross-platform C++ class =
libraries"
> +DESCRIPTION =3D "Modern, powerful open source C++ class libraries and =
frameworks for building network- and internet-based applications that =
run on desktop, server, mobile and embedded systems."
> +SECTION =3D "libs"
> +HOMEPAGE =3D "http://pocoproject.org/"
> +LICENSE =3D "BSL-1.0"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D4267f48fc738f50380cbeeb76f95cebc"
> +
> +# These dependencies are required by Foundation
> +DEPENDS =3D "libpcre zlib"
> +
> +inherit cmake ptest
> +
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI =3D " \
> +    =
https://github.com/pocoproject/poco/archive/poco-${PV}-release.tar.gz \
> +    =
file://0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch \
> +    file://run-ptest \
> +   "
> +
> +SRC_URI[md5sum] =3D "208872b13d282dfb0f0580fc11df96f3"
> +SRC_URI[sha256sum] =3D =
"08bc0a9bae4fb793eb694ad5ec7742c179bad48a286ae614682483021043658b"
> +
> +S =3D "${WORKDIR}/poco-poco-${PV}-release"
> +
> +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo =
-DPOCO_UNBUNDLED=3DON \
> +                 ${@bb.utils.contains('PTEST_ENABLED', '1', =
'-DENABLE_TESTS=3DON ', '', d)}"
> +
> +# For the native build we want to use the bundled version
> +EXTRA_OECMAKE_append_class-native =3D " -DPOCO_UNBUNDLED=3DOFF"
> +
> +# do not use rpath
> +EXTRA_OECMAKE_append =3D " -DCMAKE_SKIP_RPATH=3DON"
> +
> +# By default the most commonly used poco components are built
> +# Foundation is built anyway and doesn't need to be listed explicitly
> +# these don't have dependencies outside oe-core
> +PACKAGECONFIG ??=3D "XML JSON MongoDB PDF Util Net NetSSL Crypto Data =
DataSQLite Zip"
> +
> +PACKAGECONFIG[XML] =3D "-DENABLE_XML=3DON,-DENABLE_XML=3DOFF,expat"
> +PACKAGECONFIG[JSON] =3D "-DENABLE_JSON=3DON,-DENABLE_JSON=3DOFF"
> +PACKAGECONFIG[MongoDB] =3D "-DENABLE_MONGODB=3DON,-DENABLE_MONGODB=3DOF=
F"
> +PACKAGECONFIG[PDF] =3D "-DENABLE_PDF=3DON,-DENABLE_PDF=3DOFF,zlib"
> +PACKAGECONFIG[Util] =3D "-DENABLE_UTIL=3DON,-DENABLE_UTIL=3DOFF"
> +PACKAGECONFIG[Net] =3D "-DENABLE_NET=3DON,-DENABLE_NET=3DOFF"
> +PACKAGECONFIG[NetSSL] =3D =
"-DENABLE_NETSSL=3DON,-DENABLE_NETSSL=3DOFF,openssl"
> +PACKAGECONFIG[Crypto] =3D =
"-DENABLE_CRYPTO=3DON,-DENABLE_CRYPTO=3DOFF,openssl"
> +PACKAGECONFIG[Data] =3D "-DENABLE_DATA=3DON,-DENABLE_DATA=3DOFF"
> +PACKAGECONFIG[DataSQLite] =3D =
"-DENABLE_DATA_SQLITE=3DON,-DENABLE_DATA_SQLITE=3DOFF,sqlite3"
> +PACKAGECONFIG[Zip] =3D "-DENABLE_ZIP=3DON,-DENABLE_ZIP=3DOFF"
> +
> +# Additional components not build by default,
> +# they might have dependencies not included in oe-core
> +# or they don't work on all architectures
> +PACKAGECONFIG[mod_poco] =3D =
"-DENABLE_APACHECONNECTOR=3DON,-DENABLE_APACHECONNECTOR=3DOFF,apr =
apache2"
> +PACKAGECONFIG[CppParser] =3D =
"-DENABLE_CPPPARSER=3DON,-DENABLE_CPPPARSER=3DOFF"
> +PACKAGECONFIG[DataMySQL] =3D =
"-DENABLE_DATA_MYSQL=3DON,-DENABLE_DATA_MYSQL=3DOFF,mariadb"
> +PACKAGECONFIG[DataODBC] =3D =
"-DENABLE_DATA_ODBC=3DON,-DENABLE_DATA_ODBC=3DOFF,libiodbc"
> +PACKAGECONFIG[PageCompiler] =3D =
"-DENABLE_PAGECOMPILER=3DON,-DENABLE_PAGECOMPILER=3DOFF"
> +PACKAGECONFIG[PageCompilerFile2Page] =3D =
"-DENABLE_PAGECOMPILER_FILE2PAGE=3DON,-DENABLE_PAGECOMPILER_FILE2PAGE=3DOF=
F"
> +PACKAGECONFIG[SevenZip] =3D =
"-DENABLE_SEVENZIP=3DON,-DENABLE_SEVENZIP=3DOFF"
> +
> +# Make a package for each library
> +PACKAGES =3D "${PN}-dbg ${POCO_PACKAGES}"
> +python __anonymous () {
> +    packages =3D []
> +    testrunners =3D []
> +    components =3D d.getVar("PACKAGECONFIG", True).split()
> +    components.append("Foundation")
> +    for lib in components:
> +        pkg =3D ("poco-%s" % lib.lower()).replace("_","")
> +        packages.append(pkg)
> +        if not d.getVar("FILES_%s" % pkg, True):
> +            d.setVar("FILES_%s" % pkg, "${libdir}/libPoco%s.so.*" % =
lib)
> +        testrunners.append("%s" % lib)
> +
> +    d.setVar("POCO_PACKAGES", " ".join(packages))
> +    d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
> +}
> +
> +# "poco" is a metapackage which pulls in all Poco components
> +PACKAGES +=3D "${PN}"
> +RRECOMMENDS_${PN} +=3D "${POCO_PACKAGES}"
> +RRECOMMENDS_${PN}_class-native =3D ""
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +# -dev last to pick up the remaining stuff
> +PACKAGES +=3D "${PN}-dev ${PN}-staticdev"
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/libPoco*.so =
${libdir}/cmake"
> +FILES_${PN}-staticdev =3D "${libdir}/libPoco*.a"
> +
> +# ptest support
> +FILES_${PN}-dbg +=3D "${PTEST_PATH}/bin/.debug"
> +
> +# cppunit is only built if tests are enabled
> +PACKAGES +=3D "${PN}-cppunit"
> +FILES_${PN}-cppunit +=3D "${libdir}/libCppUnit.so*"
> +ALLOW_EMPTY_${PN}-cppunit =3D "1"
> +
> +RDEPENDS_${PN}-ptest +=3D "${PN}-cppunit"
> +
> +do_install_ptest () {
> +       cp -rf ${B}/bin/ ${D}${PTEST_PATH}
> +       cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
> +       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
> +       find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
> +       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
> +}
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C33F3028-2DB0-48DF-8F72-1B114D27AA1B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUT7sACgkQuwUzVZGdMxRQqwCfcmcJaePOHqckKHVMwERceLut
ZgYAn1E221bDeMpA7q91DBicgKcEjxPr
=B2ce
-----END PGP SIGNATURE-----

--Apple-Mail=_C33F3028-2DB0-48DF-8F72-1B114D27AA1B--
