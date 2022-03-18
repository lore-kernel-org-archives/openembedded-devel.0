Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3B8C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 13:10:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9262.1647609051614334601
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 06:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FD411570
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 06:10:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA8F93F7F5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 06:10:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Update for setuptools_build_meta renamed to
 python_setuptools_build_meta
Date: Fri, 18 Mar 2022 13:10:47 +0000
Message-Id: <20220318131047.509502-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 13:10:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96059

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb  | 2 +-
 .../recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb  | 2 +-
 .../recipes-devtools/python/python3-async-timeout_4.0.2.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb | 2 +-
 meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb | 2 +-
 .../recipes-devtools/python/python3-flask-migrate_3.1.0.bb      | 2 +-
 .../recipes-devtools/python/python3-flask-socketio_5.1.1.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-icu_2.8.1.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb | 2 +-
 .../python/python3-license-expression_21.6.14.bb                | 2 +-
 meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-mypy_0.910.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-path_16.4.0.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-pint_0.18.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb | 2 +-
 meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb | 2 +-
 .../recipes-devtools/python/python3-pytest-forked_1.4.0.bb      | 2 +-
 .../python/python3-pytest-helpers-namespace_2021.4.29.bb        | 2 +-
 .../recipes-devtools/python/python3-pytest-html_3.1.1.bb        | 2 +-
 .../recipes-devtools/python/python3-pytest-xdist_2.5.0.bb       | 2 +-
 .../python/python3-pytz-deprecation-shim_0.1.0.post0.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-qface_2.0.6.bb      | 2 +-
 .../recipes-devtools/python/python3-simpleeval_0.9.12.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-twine_3.8.0.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb | 2 +-
 meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb | 2 +-
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb                | 2 +-
 49 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb b/me=
ta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
index a7bc16716f..1508273009 100644
--- a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
+++ b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
@@ -16,4 +16,4 @@ DEPENDS +=3D "cups"
 # See https://pypi.org/project/pycups/ for data
 SRC_URI[sha256sum] =3D "57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13=
471dce350e380c90"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb=
 b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
index 3a4c510144..f2b8d52a72 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8074d6c6e2=
17873b2a018a4522243ea3"
 SRC_URI[sha256sum] =3D "fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1=
cbce40427f0b7578"
=20
 PYPI_PACKAGE =3D "aiohttp"
-inherit setuptools_build_meta pypi
+inherit python_setuptools_build_meta pypi
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-async-timeout \
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.=
bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
index 9a6e0f7a3a..0f1804de88 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE =3D "ansi2html"
=20
 SRC_URI[sha256sum] =3D "69316be8c68ac91c5582d397c2890e69c993cc7cda52062a=
c7e45fcb660d8edc"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D " \
 	${PYTHON_PN}-setuptools-scm-native \
diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4=
.9.2.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.=
2.bb
index 6d67861a26..8a19b6c64c 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb
@@ -6,6 +6,6 @@ SRC_URI[sha256sum] =3D "31f5abdc7faf16a1a6e9bf2eb31565d00=
4359b821b09944436a3436192
=20
 PYPI_PACKAGE =3D "antlr4-python3-runtime"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "nativesdk native"
diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.=
bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
index d45e70ce8a..da49040d76 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a36=
4313df4b21ef20c29e"
=20
 PYPI_PACKAGE =3D "asttokens"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "9a54c114f02c7a9480d56550932546a3f1fe71d8a02f1bc7=
ccd0ee3ee35cf4d5"
=20
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.=
0.2.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.=
bb
index 9545b40712..b1d19ce619 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fa41f15bb5f=
23b6d3560c5845eb8d57"
 SRC_URI[sha256sum] =3D "2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74=
a847056bc2976b15"
=20
 PYPI_PACKAGE =3D "async-timeout"
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-asyncio \
diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb=
 b/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
index 95426a4ae7..a154bfba49 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef561=
31163e13b9db1241b3"
=20
 SRC_URI[sha256sum] =3D "42c84ffbe6f8de898af6073b4be9ea7ccedcd78d3474aa84=
4c54e49d5a079f6f"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4=
.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
index 060a615d0b..bf225e60e0 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
@@ -8,7 +8,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D439a07e400525964c3c82684146e4=
6eb"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b=
/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index 8d357b0ebd..cafc32ad10 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache=
-2.0;md5=3D89aea4e17d99a7ca
=20
 SRC_URI[sha256sum] =3D "e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664=
c69e639135e6b3b8"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.b=
b b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
index 588a5f9ab0..e281f0f285 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "0123cacc1627ae19ddf3c27a5de5bd67e=
e4586fbdd6440d9748f8abb48
=20
 PYPI_PACKAGE =3D "python-dateutil"
 PIP_INSTALL_PACKAGE =3D "python_dateutil"
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 PACKAGES =3D+ "${PN}-zoneinfo"
 FILES:${PN}-zoneinfo =3D "${libdir}/${PYTHON_DIR}/site-packages/dateutil=
/zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.1.b=
b b/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
index c5a8851ffc..35e8d790ab 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D42d0a9e728978f0eeb759c3be9153=
6b8"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "python-engineio"
=20
diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.17.3=
.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
index 9baf23b7c0..51691b7593 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4476c4be314022=
71e101d9a4a3430d52"
=20
 SRC_URI[sha256sum] =3D "a9a42a208573d4074c77d041447336cf4e3c1389a256fd3e=
113ef59cf29b7980"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
 	${PYTHON_PN}-logging \
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_3.=
1.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.=
bb
index b6e565f471..8153156458 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
@@ -6,7 +6,7 @@ SRC_URI[sha256sum] =3D "57d6060839e3a7f150eaab6fe4e726d9e=
3e7cffe2150fb223d73f92421
=20
 PYPI_PACKAGE =3D "Flask-Migrate"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-flask-sqlalchemy \
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5=
.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.=
1.bb
index b854ce7f72..00e958022a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38cc21254909604298ce763a6e444=
0a0"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "Flask-SocketIO"
=20
diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
index 2297d7c883..4dd77383b9 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf056e8e7a0a54=
77451af18b7b5aa98c"
=20
 SRC_URI[sha256sum] =3D "ce6f2ba0edb7b0c1d8976565298ad2deba6f8064d2bebb6f=
fce2ca896eb35b0b"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.=
bb b/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
index 94568fc691..52fd88ddf5 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D56e5e931172b61=
64b62dc7c4aba6c8cf"
=20
 SRC_URI[sha256sum] =3D "58a98e45b4b1a48273073f905d2961666ecf0fbac4250ea5=
b47aef259eb5c585"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-compression \
diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.0.0.b=
b b/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
index 5d6a6c9d08..86eed73388 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4ecc42519e84f6=
f3e23529464df7bd1d"
=20
 SRC_URI[sha256sum] =3D "ee1f872fdfc7d2ef4a28d4f80ddde9f96d36955b5d6b0dac=
4bdeb99502bddb00"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "\
     ${PYTHON_PN}-setuptools-scm-native \
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0=
.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
index 7be4b66a85..7cdecf1094 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6dc5b4bd3d02fa=
edf08461621aa2aeca"
=20
 SRC_URI[sha256sum] =3D "427af957daa58bc909471c6c40f74c5450fa123dd093fc53=
efd2e91d2705a56b"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYT=
HON_PN}-idna"
=20
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb b/m=
eta-python/recipes-devtools/python/python3-icu_2.8.1.bb
index e958309664..027ef129ee 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] =3D "f0b9549a87f87ba7c413f13679d1372=
71e0b37f1f39b0109ace38257d4
=20
 SRC_URI +=3D "file://0001-Fix-host-contamination-of-include-files.patch"
=20
-inherit pkgconfig pypi setuptools_build_meta
+inherit pkgconfig pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb=
 b/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
index f3ef467f4b..e578b8aeff 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5e2f4edc7e=
7408a82e4a1d05f229b695"
=20
 SRC_URI[sha256sum] =3D "04d02cfcfc18a6f8a9a4edb4d0a55e2e4fc575626c29d702=
f750de415e88d372"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0=
.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
index 0f343b2fdd..ab1ad717b4 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df137eeae9cf800=
4d06830f6ab25b2d52"
=20
 SRC_URI[sha256sum] =3D "7508b01e211178a85d21f1f87029846b77b2404a4c68cbd1=
4748d4d4142fa3b8"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "\
     python3-cppy-native \
diff --git a/meta-python/recipes-devtools/python/python3-license-expressi=
on_21.6.14.bb b/meta-python/recipes-devtools/python/python3-license-expre=
ssion_21.6.14.bb
index 01a5a94e1a..2ee4909bd7 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_21.6=
.14.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_21.6=
.14.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://apache-2.0.LICENSE;md5=3D942=
9839cdc4b292ff46e88b524c6e0
=20
 SRC_URI[sha256sum] =3D "9de87a427c9a449eee7913472fb9ed03b63036295547369f=
dbf95f76a8b924b2"
=20
-inherit pypi ptest setuptools_build_meta
+inherit pypi ptest python_setuptools_build_meta
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.=
bb b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
index 9614039f01..1d5b146fa9 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/rm-hull/luma.core"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D3b1d500f5911ec7522f1f790d=
616e0ee"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "f293f5fff8946eea62af3a5d5d7da55c37d2b64aac6c9c90=
180a385da9f7d003"
=20
diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/m=
eta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
index e7a0de2767..ef5b006272 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI +=3D "file://run-ptest"
=20
 SRC_URI[sha256sum] =3D "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d=
010c67c9fd1beca3"
=20
-inherit pkgconfig pypi setuptools_build_meta ptest
+inherit pkgconfig pypi python_setuptools_build_meta ptest
=20
 RDEPENDS:${PN}-ptest +=3D "${PYTHON_PN}-pytest ${PYTHON_PN}-multiprocess=
ing ${PYTHON_PN}-psutil"
=20
diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.910.bb b/=
meta-python/recipes-devtools/python/python3-mypy_0.910.bb
index be9ad3f66a..5dd717ae7d 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D17b7180fcfc43c=
4e70c07c71588604c4"
=20
 PYPI_PACKAGE =3D "mypy"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "704098302473cb31a218f1775a873b376b30b4c18229421e=
9e9dc8916fd16150"
=20
diff --git a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb b=
/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
index 60ac948cf4..7c520dd85a 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e0682062=
90f3fe9f8d6c713ea6"
=20
 SRC_URI[sha256sum] =3D "baf2e757c4b19be8208f9e67e48fb475b4a577d5613590ce=
46693bdbdf082f52"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "nativesdk native"
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.18.bb b/m=
eta-python/recipes-devtools/python/python3-pint_0.18.bb
index c8a394b922..f555144f45 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.18.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.18.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbccf8242026922=
70a1e0829a62e3f47b"
=20
 PYPI_PACKAGE :=3D "Pint"
=20
-inherit pypi ptest setuptools_build_meta
+inherit pypi ptest python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "8c4bce884c269051feb7abc69dbfd18403c0c764abc83da1=
32e8a7222f8ba801"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3=
.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
index 4f047368f6..5b06e52aa1 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE =3D "PyHamcrest"
=20
 SRC_URI[sha256sum] =3D "dfb19cf6d71743e086fbb761ed7faea5aacbc8ec10c17a08=
b93ecde39192a3db"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "${PYTHON_PN}-six"
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb =
b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index fd27c62d15..6e53461979 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "8ac7448f09ab85811607bdd21ec246449=
5ac8b7c66d146bf545b0f08fb
=20
 PYPI_PACKAGE =3D "PyNaCl"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "\
     ${PYTHON_PN}-cffi-native \
diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5=
.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
index 9cf876ae36..7826d89ad0 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
@@ -11,7 +11,7 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 SRC_URI[sha256sum] =3D "55f6532fd6d62b3b698d604257f7a7eda6a87557bbec2276=
0f8c0d9549454802"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE =3D "PyScaffold"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.=
4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.=
bb
index d75dd401d1..a751ad6e5a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D772fcdaca14b37=
8878d05c7d857e6c3e"
=20
 SRC_URI[sha256sum] =3D "8b67587c8f98cbbadfdd804539ed5455b6ed03802203485d=
d2f53c1422d7440e"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-n=
amespace_2021.4.29.bb b/meta-python/recipes-devtools/python/python3-pytes=
t-helpers-namespace_2021.4.29.bb
index 6ccf365f43..024650e9b3 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.4.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.4.29.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D440a4cdb311cd7=
ad181efb4cba06d562"
=20
 SRC_URI[sha256sum] =3D "183524e3db4e2a1fea92e0ca3662a624ba44c9f3568da156=
79d7535ba6838a6a"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.=
1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
index 4b4aff01ce..ce55554a01 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "3ee1cf319c913d19fe53aeb0bc400e7b0=
bc2dbeb477553733db1dad12e
=20
 PYPI_PACKAGE =3D "pytest-html"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5=
.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
index 6ad01d08e5..c3e69e3e0a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D772fcdaca14b37=
8878d05c7d857e6c3e"
=20
 SRC_URI[sha256sum] =3D "4580deca3ff04ddb2ac53eba39d76cb5dd5edeac050cb6fb=
c768b0dd712b4edf"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation=
-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-d=
eprecation-shim_0.1.0.post0.bb
index 96f1522b76..d116c3bd4c 100644
--- a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0=
.1.0.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0=
.1.0.post0.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] =3D "af097bae1b616dde5c5744441e2ddc69e=
74dfdcb0c263129610d85b874
 PYPI_PACKAGE =3D "pytz_deprecation_shim"
 PYPI_SRC_URI =3D "https://files.pythonhosted.org/packages/94/f0/909f94fe=
a74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV=
}.tar.gz"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index 7f0d998f3b..e4762eb5f8 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "zeromq"
 SRC_URI +=3D "file://club-rpath-out.patch"
 SRC_URI[sha256sum] =3D "8eddc033e716f8c91c6a2112f0a8ebc5e00532b4a6ae1eb0=
ccc48e027f9c671c"
=20
-inherit pypi pkgconfig setuptools_build_meta
+inherit pypi pkgconfig python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
 	${PYTHON_PN}-multiprocessing \
diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb b=
/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
index 751e205dbc..63453517ec 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deee61e10a40b0e=
3045ee5965bcd9a8b5"
=20
 SRC_URI[sha256sum] =3D "87ce8ce7123ae57d91ac903c6c330a99273e7f4665a0ab88=
e6a17f9c98143a68"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPS =3D "\
     python3-jinja2 \
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.1=
2.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
index 279c2562fe..343e5c03de 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Ddc9277482effe5=
9b734b004cbcc1fee7"
=20
 SRC_URI[sha256sum] =3D "3e0be507486d4e21cf9d08847c7e57dd61a1603950399985=
f7c5a0be7fd33e36"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.5.2.b=
b b/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
index 67e5bb71f2..6611743bf8 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D42d0a9e728978f0eeb759c3be9153=
6b8"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "python-socketio"
=20
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.=
bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
index cb87ec936c..7cb76b426f 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D33c3a77def9=
b3ad83e01c65bdcc1af67"
=20
 SRC_URI[sha256sum] =3D "b8d49b1cd4f037c7082a9683dfa1801aa2597fb11c3a1155=
b7a5b94829b4f1f9"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb b=
/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
index e7ba1d4e82..3810b10fbf 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1672e2674934fd=
93a31c09cf17f34100"
=20
 SRC_URI[sha256sum] =3D "1d9835ede8e394bb8c9dcbffbca02d717217113adc679236=
873eeaac5bc0b3cd"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.=
bb b/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
index b9301ecaf9..8f80426e6c 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-decorator \
 "
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb b=
/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
index b96e153b5a..4296ab2b33 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da3d1106b253a8d=
50dd82a4202a045b4c"
=20
 SRC_URI[sha256sum] =3D "8efa52658e0ae770686a13b675569328f1fba9837e5de186=
7bfe5f46a9aefe19"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "\
 	${PYTHON_PN}-setuptools-scm-native \
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.b=
b b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 053b5c0619..f4575c9c2e 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "57f32b1f6838facb8c004c894678403=
67ad38e9e535f8252091345dba5
=20
 PYPI_PACKAGE =3D "Twisted"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 do_install:append() {
     # remove some useless files before packaging
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3=
.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
index 368112b0b2..e9fce61452 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0e423eea5c91e=
7aa21bdb70184b3e53"
=20
 SRC_URI[sha256sum] =3D "00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e=
80251cc13dfbb8c4"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb b=
/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
index a323f1fff0..1c910920e0 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D57e0bd6164=
3d81d05683cdce65b11d10"
=20
 SRC_URI[sha256sum] =3D "0f28015ac68a5c067210400a9197fc5d36ba9bc3f8eaf1da=
3cbd59acdfed9e09"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
 	${PYTHON_PN}-pytz-deprecation-shim \
diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.0.b=
b b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
index 31a77c5b9e..e37d1cc6d6 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.0.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640d=
c841e1baecb3e27a6966b2"
=20
 SRC_URI[sha256sum] =3D "ec8a8d9b6b15f3bb2c1a82b8f3929a029c333c35fcafb08c=
185a9e562d8cc9c2"
=20
-inherit setuptools_build_meta pypi
+inherit python_setuptools_build_meta pypi
diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0=
.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
index 06f3488921..0deb1b7dd4 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6831ef36faa293=
29bce2420c5356f97e"
=20
 SRC_URI[sha256sum] =3D "8a297c7a197683ba02e5e2b882ffd6c6180d01bdefb534b6=
9cd3962df020bfe6"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN}:class-target +=3D "\
     ${PYTHON_PN}-pyyaml \
diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce=
/recipes-apps/catfish/catfish_4.16.3.bb
index 27a807be29..98cd251d2d 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -3,7 +3,7 @@ SECTION =3D "x11/application"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b4953313=
5d4"
=20
-inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg
+inherit xfce-app python_setuptools_build_meta gtk-icon-cache mime-xdg
=20
 DEPENDS +=3D "python3-distutils-extra-native"
=20
--=20
2.25.1


