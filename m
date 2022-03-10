Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0375C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9345.1646918727928129300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53BC11691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03B2C3FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 9/9] meta-python: migrate away from setuptool3 where possible
Date: Thu, 10 Mar 2022 13:25:23 +0000
Message-Id: <20220310132523.2253188-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95931

Many recipes are currently building with setuptools3 but can use a more
modern tool: typically setuptools_build_meta but ordered-set can use
flit_core and pyrad can use poetry_core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-aiohttp_3.8.1.bb |  3 ++-
 .../python/python3-ansi2html_1.7.0.bb                |  7 +------
 .../python/python3-asttokens_2.0.5.bb                |  7 ++-----
 .../python/python3-async-timeout_4.0.2.bb            |  2 +-
 .../recipes-devtools/python/python3-bcrypt_3.2.0.bb  |  2 +-
 .../recipes-devtools/python/python3-bidict_0.21.4.bb |  2 +-
 .../python/python3-cachetools_4.2.4.bb               |  2 +-
 .../recipes-devtools/python/python3-cbor2_5.4.2.bb   |  2 +-
 .../python/python3-dateutil_2.8.2.bb                 |  2 +-
 .../python/python3-engineio_4.3.1.bb                 |  2 +-
 .../python/python3-fasteners_0.17.3.bb               |  7 +------
 .../python/python3-flask-migrate_3.1.0.bb            |  2 +-
 .../python/python3-flask-socketio_5.1.1.bb           |  2 +-
 .../python/python3-frozenlist_1.3.0.bb               |  2 +-
 .../python/python3-httplib2_0.20.4.bb                |  2 +-
 .../python/python3-humanize_4.0.0.bb                 |  2 +-
 .../python/python3-hyperlink_21.0.0.bb               |  2 +-
 .../recipes-devtools/python/python3-icu_2.8.1.bb     |  2 +-
 .../recipes-devtools/python/python3-iso3166_2.0.2.bb |  2 +-
 .../python/python3-license-expression_21.6.14.bb     |  7 ++-----
 .../python/python3-luma-core_2.3.1.bb                |  4 +---
 .../recipes-devtools/python/python3-lz4_4.0.0.bb     |  2 +-
 .../recipes-devtools/python/python3-mypy_0.910.bb    |  2 +-
 .../python/python3-ordered-set_4.1.0.bb              |  2 +-
 .../recipes-devtools/python/python3-pint_0.18.bb     |  2 +-
 .../python/python3-pyhamcrest_2.0.3.bb               |  2 +-
 .../recipes-devtools/python/python3-pynacl_1.5.0.bb  |  3 +--
 .../recipes-devtools/python/python3-pyrad_2.4.bb     |  2 +-
 .../python/python3-pyscaffold_4.1.5.bb               |  2 +-
 .../python/python3-pytest-forked_1.4.0.bb            |  2 +-
 .../python3-pytest-helpers-namespace_2021.4.29.bb    | 12 +-----------
 .../python/python3-pytest-html_3.1.1.bb              |  3 +--
 .../python/python3-pytest-runner_5.3.1.bb            |  4 ++--
 .../python/python3-pytest-xdist_2.5.0.bb             |  2 +-
 .../python3-pytz-deprecation-shim_0.1.0.post0.bb     |  7 +------
 .../recipes-devtools/python/python3-pyzmq_22.3.0.bb  |  2 +-
 .../python/python3-simpleeval_0.9.12.bb              |  6 +-----
 .../python/python3-socketio_5.5.2.bb                 |  2 +-
 .../python/python3-soupsieve_2.3.1.bb                |  2 +-
 .../recipes-devtools/python/python3-tqdm_4.63.0.bb   |  2 +-
 .../python/python3-traitlets_5.1.1.bb                |  2 +-
 .../recipes-devtools/python/python3-twine_3.8.0.bb   |  7 +------
 .../python/python3-twisted_22.2.0.bb                 |  2 +-
 .../python/python3-typeguard_2.13.3.bb               |  2 +-
 .../recipes-devtools/python/python3-tzlocal_4.1.bb   |  2 +-
 .../python/python3-waitress_2.1.0.bb                 |  2 +-
 .../python/python3-yamlloader_1.1.0.bb               |  2 +-
 47 files changed, 51 insertions(+), 94 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb=
 b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
index 1d8434e3ca..3a4c510144 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8074d6c6e2=
17873b2a018a4522243ea3"
 SRC_URI[sha256sum] =3D "fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1=
cbce40427f0b7578"
=20
 PYPI_PACKAGE =3D "aiohttp"
-inherit setuptools3 pypi
+inherit setuptools_build_meta pypi
+
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-attrs \
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.=
bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
index 0a81ebdded..9a6e0f7a3a 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE =3D "ansi2html"
=20
 SRC_URI[sha256sum] =3D "69316be8c68ac91c5582d397c2890e69c993cc7cda52062a=
c7e45fcb660d8edc"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D " \
 	${PYTHON_PN}-setuptools-scm-native \
@@ -18,8 +18,3 @@ RDEPENDS:${PN} =3D " \
 	${PYTHON_PN}-six \
 	${PYTHON_PN}-compression \
 "
-
-do_compile:prepend() {
-	echo "from setuptools import setup" > ${S}/setup.py
-	echo "setup()" >> ${S}/setup.py
-}
diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.=
bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
index 429a56bae6..d45e70ce8a 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
@@ -5,13 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a=
364313df4b21ef20c29e"
=20
 PYPI_PACKAGE =3D "asttokens"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "9a54c114f02c7a9480d56550932546a3f1fe71d8a02f1bc7=
ccd0ee3ee35cf4d5"
=20
-DEPENDS +=3D "\
-    python3-setuptools-scm-native \
-    python3-wheel-native \
-"
+DEPENDS +=3D "python3-setuptools-scm-native"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.=
0.2.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.=
bb
index 7355f00131..9545b40712 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fa41f15bb5f=
23b6d3560c5845eb8d57"
 SRC_URI[sha256sum] =3D "2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74=
a847056bc2976b15"
=20
 PYPI_PACKAGE =3D "async-timeout"
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-asyncio \
diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb =
b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
index a6d5007069..92a6a0d8c5 100644
--- a/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.2.0.bb
@@ -7,7 +7,7 @@ DEPENDS +=3D "${PYTHON_PN}-cffi-native"
 SRC_URI[md5sum] =3D "fe31390dab603728f756cd3d6830c80a"
 SRC_URI[sha256sum] =3D "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a689=
2f5d9e7c6cfbfb29"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb=
 b/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
index 266dc606a2..95426a4ae7 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef561=
31163e13b9db1241b3"
=20
 SRC_URI[sha256sum] =3D "42c84ffbe6f8de898af6073b4be9ea7ccedcd78d3474aa84=
4c54e49d5a079f6f"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4=
.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
index 1040dc7e5a..060a615d0b 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
@@ -8,7 +8,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D439a07e400525964c3c82684146e4=
6eb"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b=
/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index d3f6cd8c16..8d357b0ebd 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache=
-2.0;md5=3D89aea4e17d99a7ca
=20
 SRC_URI[sha256sum] =3D "e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664=
c69e639135e6b3b8"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.b=
b b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
index 75221d8f9d..588a5f9ab0 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "0123cacc1627ae19ddf3c27a5de5bd67e=
e4586fbdd6440d9748f8abb48
=20
 PYPI_PACKAGE =3D "python-dateutil"
 PIP_INSTALL_PACKAGE =3D "python_dateutil"
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 PACKAGES =3D+ "${PN}-zoneinfo"
 FILES:${PN}-zoneinfo =3D "${libdir}/${PYTHON_DIR}/site-packages/dateutil=
/zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.1.b=
b b/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
index a16306effb..c5a8851ffc 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D42d0a9e728978f0eeb759c3be9153=
6b8"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 PYPI_PACKAGE =3D "python-engineio"
=20
diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.17.3=
.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
index d672708776..9baf23b7c0 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
@@ -5,14 +5,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4476c4be31402=
271e101d9a4a3430d52"
=20
 SRC_URI[sha256sum] =3D "a9a42a208573d4074c77d041447336cf4e3c1389a256fd3e=
113ef59cf29b7980"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
 	${PYTHON_PN}-logging \
 	${PYTHON_PN}-fcntl \
 "
-
-do_compile:prepend() {
-	echo "from setuptools import setup" > ${S}/setup.py
-	echo "setup()" >> ${S}/setup.py
-}
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_3.=
1.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.=
bb
index 7a7c3fa3f3..b6e565f471 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
@@ -6,7 +6,7 @@ SRC_URI[sha256sum] =3D "57d6060839e3a7f150eaab6fe4e726d9e=
3e7cffe2150fb223d73f92421
=20
 PYPI_PACKAGE =3D "Flask-Migrate"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-flask-sqlalchemy \
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5=
.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.=
1.bb
index 3d7a1cb6a8..b854ce7f72 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38cc21254909604298ce763a6e444=
0a0"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 PYPI_PACKAGE =3D "Flask-SocketIO"
=20
diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
index e3a932f773..2297d7c883 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf056e8e7a0a54=
77451af18b7b5aa98c"
=20
 SRC_URI[sha256sum] =3D "ce6f2ba0edb7b0c1d8976565298ad2deba6f8064d2bebb6f=
fce2ca896eb35b0b"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.=
bb b/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
index 6d22286caf..94568fc691 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D56e5e931172b61=
64b62dc7c4aba6c8cf"
=20
 SRC_URI[sha256sum] =3D "58a98e45b4b1a48273073f905d2961666ecf0fbac4250ea5=
b47aef259eb5c585"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-compression \
diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.0.0.b=
b b/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
index f84034f3cd..5d6a6c9d08 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4ecc42519e84f6=
f3e23529464df7bd1d"
=20
 SRC_URI[sha256sum] =3D "ee1f872fdfc7d2ef4a28d4f80ddde9f96d36955b5d6b0dac=
4bdeb99502bddb00"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "\
     ${PYTHON_PN}-setuptools-scm-native \
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0=
.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
index e9bf92aa1a..7be4b66a85 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6dc5b4bd3d02fa=
edf08461621aa2aeca"
=20
 SRC_URI[sha256sum] =3D "427af957daa58bc909471c6c40f74c5450fa123dd093fc53=
efd2e91d2705a56b"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYT=
HON_PN}-idna"
=20
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb b/m=
eta-python/recipes-devtools/python/python3-icu_2.8.1.bb
index 09543d753d..e958309664 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] =3D "f0b9549a87f87ba7c413f13679d1372=
71e0b37f1f39b0109ace38257d4
=20
 SRC_URI +=3D "file://0001-Fix-host-contamination-of-include-files.patch"
=20
-inherit pkgconfig pypi setuptools3
+inherit pkgconfig pypi setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb=
 b/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
index bc05f066a6..f3ef467f4b 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5e2f4edc7e=
7408a82e4a1d05f229b695"
=20
 SRC_URI[sha256sum] =3D "04d02cfcfc18a6f8a9a4edb4d0a55e2e4fc575626c29d702=
f750de415e88d372"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-license-expressi=
on_21.6.14.bb b/meta-python/recipes-devtools/python/python3-license-expre=
ssion_21.6.14.bb
index efa8854411..01a5a94e1a 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_21.6=
.14.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_21.6=
.14.bb
@@ -6,12 +6,9 @@ LIC_FILES_CHKSUM =3D "file://apache-2.0.LICENSE;md5=3D94=
29839cdc4b292ff46e88b524c6e0
=20
 SRC_URI[sha256sum] =3D "9de87a427c9a449eee7913472fb9ed03b63036295547369f=
dbf95f76a8b924b2"
=20
-inherit pypi ptest setuptools3
+inherit pypi ptest setuptools_build_meta
=20
-DEPENDS +=3D "\
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-wheel-native \
-"
+DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-booleanpy \
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.=
bb b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
index c37cc22c46..9614039f01 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
@@ -4,12 +4,10 @@ HOMEPAGE =3D "https://github.com/rm-hull/luma.core"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D3b1d500f5911ec7522f1f790d=
616e0ee"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "f293f5fff8946eea62af3a5d5d7da55c37d2b64aac6c9c90=
180a385da9f7d003"
=20
-CLEANBROKEN =3D "1"
-
 PYPI_PACKAGE =3D "luma.core"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/m=
eta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
index 472e152db2..40b2186b2c 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
@@ -10,6 +10,6 @@ DEPENDS +=3D " \
=20
 SRC_URI[sha256sum] =3D "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d=
010c67c9fd1beca3"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.910.bb b/=
meta-python/recipes-devtools/python/python3-mypy_0.910.bb
index 1a494af5af..be9ad3f66a 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D17b7180fcfc43c=
4e70c07c71588604c4"
=20
 PYPI_PACKAGE =3D "mypy"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "704098302473cb31a218f1775a873b376b30b4c18229421e=
9e9dc8916fd16150"
=20
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.=
0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 2740b33551..b3600d093a 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://MIT-LICENSE;md5=3D3bf5e1ad64=
c0d99032c3143361fa234e"
=20
 SRC_URI[sha256sum] =3D "694a8e44c87657c59292ede72891eb91d34131f6531463aa=
b3009191c77364a8"
=20
-inherit pypi setuptools3 ptest
+inherit pypi flit_core ptest
=20
 DEPENDS +=3D "python3-pytest-runner-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.18.bb b/m=
eta-python/recipes-devtools/python/python3-pint_0.18.bb
index a7a1384da1..c8a394b922 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.18.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.18.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbccf8242026922=
70a1e0829a62e3f47b"
=20
 PYPI_PACKAGE :=3D "Pint"
=20
-inherit pypi ptest setuptools3
+inherit pypi ptest setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "8c4bce884c269051feb7abc69dbfd18403c0c764abc83da1=
32e8a7222f8ba801"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3=
.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
index 7c0824c2d1..4f047368f6 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE =3D "PyHamcrest"
=20
 SRC_URI[sha256sum] =3D "dfb19cf6d71743e086fbb761ed7faea5aacbc8ec10c17a08=
b93ecde39192a3db"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "${PYTHON_PN}-six"
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb =
b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index 10f624b484..fd27c62d15 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -8,10 +8,9 @@ SRC_URI[sha256sum] =3D "8ac7448f09ab85811607bdd21ec24644=
95ac8b7c66d146bf545b0f08fb
=20
 PYPI_PACKAGE =3D "PyNaCl"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "\
-    ${PYTHON_PN}-wheel-native \
     ${PYTHON_PN}-cffi-native \
     libsodium \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/m=
eta-python/recipes-devtools/python/python3-pyrad_2.4.bb
index 86a95a4aa4..665aaf38bd 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3De910b35b0ef4e1f665
 PYPI_PACKAGE =3D "pyrad"
 SRC_URI[sha256sum] =3D "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a6=
9beaff15c47e30d9"
=20
-inherit pypi setuptools3
+inherit pypi poetry_core
diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5=
.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
index cd160a69eb..9cf876ae36 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
@@ -11,7 +11,7 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 SRC_URI[sha256sum] =3D "55f6532fd6d62b3b698d604257f7a7eda6a87557bbec2276=
0f8c0d9549454802"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 PYPI_PACKAGE =3D "PyScaffold"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.=
4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.=
bb
index c6f352bc61..d75dd401d1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D772fcdaca14b37=
8878d05c7d857e6c3e"
=20
 SRC_URI[sha256sum] =3D "8b67587c8f98cbbadfdd804539ed5455b6ed03802203485d=
d2f53c1422d7440e"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-n=
amespace_2021.4.29.bb b/meta-python/recipes-devtools/python/python3-pytes=
t-helpers-namespace_2021.4.29.bb
index 0ee1bd6866..6ccf365f43 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.4.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.4.29.bb
@@ -6,17 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D440a4cdb311cd=
7ad181efb4cba06d562"
=20
 SRC_URI[sha256sum] =3D "183524e3db4e2a1fea92e0ca3662a624ba44c9f3568da156=
79d7535ba6838a6a"
=20
-inherit pypi setuptools3
-
-# Workaround for network access issue during compile step
-# this needs to be fixed in the recipes buildsystem to move
-# this such that it can be accomplished during do_fetch task
-do_compile[network] =3D "1"
-
-DEPENDS +=3D "\
-    ${PYTHON_PN}-wheel-native \
-    ${PYTHON_PN}-pip-native \
-"
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.=
1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
index cd0450f519..4b4aff01ce 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d425c8f3157d=
bf212db2ec53d9e5132"
=20
 SRC_URI[sha256sum] =3D "3ee1cf319c913d19fe53aeb0bc400e7b0bc2dbeb47755373=
3db1dad12eb75ee3"
=20
-
 PYPI_PACKAGE =3D "pytest-html"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.=
3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.=
bb
index 0ca007dd44..fed2d91140 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e0682062=
90f3fe9f8d6c713ea6"
=20
 SRC_URI[sha256sum] =3D "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e207=
7a89ebcf204aac91"
=20
-inherit pypi setuptools3
-PIP_INSTALL_PACKAGE =3D "pytest_runner"
+inherit pypi setuptools_build_meta
+
 DEPENDS +=3D " \
     ${PYTHON_PN}-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5=
.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
index a10ac8cc49..6ad01d08e5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D772fcdaca14b37=
8878d05c7d857e6c3e"
=20
 SRC_URI[sha256sum] =3D "4580deca3ff04ddb2ac53eba39d76cb5dd5edeac050cb6fb=
c768b0dd712b4edf"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation=
-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-d=
eprecation-shim_0.1.0.post0.bb
index 76487c830f..96f1522b76 100644
--- a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0=
.1.0.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0=
.1.0.post0.bb
@@ -8,9 +8,4 @@ SRC_URI[sha256sum] =3D "af097bae1b616dde5c5744441e2ddc69e=
74dfdcb0c263129610d85b874
 PYPI_PACKAGE =3D "pytz_deprecation_shim"
 PYPI_SRC_URI =3D "https://files.pythonhosted.org/packages/94/f0/909f94fe=
a74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV=
}.tar.gz"
=20
-inherit pypi setuptools3
-
-do_compile:prepend() {
-	echo "from setuptools import setup" > ${S}/setup.py
-	echo "setup()" >> ${S}/setup.py
-}
+inherit pypi setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index d2893ccbb1..7f0d998f3b 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "zeromq"
 SRC_URI +=3D "file://club-rpath-out.patch"
 SRC_URI[sha256sum] =3D "8eddc033e716f8c91c6a2112f0a8ebc5e00532b4a6ae1eb0=
ccc48e027f9c671c"
=20
-inherit pypi pkgconfig setuptools3
+inherit pypi pkgconfig setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
 	${PYTHON_PN}-multiprocessing \
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.1=
2.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
index 8ad6acc875..279c2562fe 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Ddc9277482effe5=
9b734b004cbcc1fee7"
=20
 SRC_URI[sha256sum] =3D "3e0be507486d4e21cf9d08847c7e57dd61a1603950399985=
f7c5a0be7fd33e36"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -21,10 +21,6 @@ RDEPENDS:${PN}-ptest +=3D " \
 	${PYTHON_PN}-pytest \
 "
=20
-do_configure:prepend() {
-	sed -i -e "/use_2to3=3DTrue,/d" ${S}/setup.py
-}
-
 do_install_ptest() {
 	cp -f ${S}/test_simpleeval.py ${D}${PTEST_PATH}/
 }
diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.5.2.b=
b b/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
index 4b22a73553..67e5bb71f2 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D42d0a9e728978f0eeb759c3be9153=
6b8"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 PYPI_PACKAGE =3D "python-socketio"
=20
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.=
bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
index f4cf93daba..cb87ec936c 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D33c3a77def9=
b3ad83e01c65bdcc1af67"
=20
 SRC_URI[sha256sum] =3D "b8d49b1cd4f037c7082a9683dfa1801aa2597fb11c3a1155=
b7a5b94829b4f1f9"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb b=
/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
index cd5f1aab53..e7ba1d4e82 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1672e2674934fd=
93a31c09cf17f34100"
=20
 SRC_URI[sha256sum] =3D "1d9835ede8e394bb8c9dcbffbca02d717217113adc679236=
873eeaac5bc0b3cd"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.=
bb b/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
index bfed02d6f5..b9301ecaf9 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-decorator \
 "
=20
-inherit setuptools3 pypi
+inherit pypi setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb b=
/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
index d9aa3dce93..b96e153b5a 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da3d1106b253a8d=
50dd82a4202a045b4c"
=20
 SRC_URI[sha256sum] =3D "8efa52658e0ae770686a13b675569328f1fba9837e5de186=
7bfe5f46a9aefe19"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 DEPENDS +=3D "\
 	${PYTHON_PN}-setuptools-scm-native \
@@ -15,9 +15,4 @@ RDEPENDS:${PN} +=3D " \
 	${PYTHON_PN}-importlib-metadata \
 "
=20
-do_compile:prepend() {
-	echo "from setuptools import setup" > ${S}/setup.py
-	echo "setup()" >> ${S}/setup.py
-}
-
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.b=
b b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 5a000bc6a1..053b5c0619 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "57f32b1f6838facb8c004c894678403=
67ad38e9e535f8252091345dba5
=20
 PYPI_PACKAGE =3D "Twisted"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 do_install:append() {
     # remove some useless files before packaging
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3=
.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
index 21ca439505..368112b0b2 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0e423eea5c91e=
7aa21bdb70184b3e53"
=20
 SRC_URI[sha256sum] =3D "00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e=
80251cc13dfbb8c4"
=20
-inherit pypi setuptools3 ptest
+inherit pypi setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb b=
/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
index 29a69f8b8f..a323f1fff0 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D57e0bd6164=
3d81d05683cdce65b11d10"
=20
 SRC_URI[sha256sum] =3D "0f28015ac68a5c067210400a9197fc5d36ba9bc3f8eaf1da=
3cbd59acdfed9e09"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
 	${PYTHON_PN}-pytz-deprecation-shim \
diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.0.b=
b b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
index 99e483962f..31a77c5b9e 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640d=
c841e1baecb3e27a6966b2"
=20
 SRC_URI[sha256sum] =3D "ec8a8d9b6b15f3bb2c1a82b8f3929a029c333c35fcafb08c=
185a9e562d8cc9c2"
=20
-inherit setuptools3 pypi
+inherit setuptools_build_meta pypi
diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0=
.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
index a5510d5dc7..06f3488921 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6831ef36faa293=
29bce2420c5356f97e"
=20
 SRC_URI[sha256sum] =3D "8a297c7a197683ba02e5e2b882ffd6c6180d01bdefb534b6=
9cd3962df020bfe6"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN}:class-target +=3D "\
     ${PYTHON_PN}-pyyaml \
--=20
2.25.1


