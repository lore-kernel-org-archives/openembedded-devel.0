Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B3AC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:45:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12333.1788453906609707244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TL5TDgYf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D9C21D34
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 09:45:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A2E2F3F673
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453906; bh=BY1LMLtqr1op4JwDyPlXiGzV6tWIuSaAxWKt7DUD0Qo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TL5TDgYfv/v8+g3Y8aae59GoedJ+u+KIojfibDubhCjVvFO8+1xxxFZLGdFNvWHo1
	 VFWFtxKyfAJWnSO0lhkjB5i4ILWOgX16OLWhThCcDESb5YsFRw406hSeHZ5cIEPqAh
	 ZL/8GFTFeoPo91Ba+C1Dgsw1N52ZIBSvkgUP+NBM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] meta-python: remove redundant PYPI_PACKAGE assignments
Date: Thu,  3 Sep 2026 17:44:54 +0100
Message-ID: <20260903164454.152372-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903164454.152372-1-ross.burton@arm.com>
References: <20260903164454.152372-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 16:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129745

Remove assignments to PYPI_PACKAGE where the value is the default value,
that is the recipe name with any python3- prefix removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb     | 1 -
 meta-python/recipes-devtools/python/pamela_1.2.0.bb             | 1 -
 meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-aioredis_2.0.1.bb   | 1 -
 .../recipes-devtools/python/python3-aioresponses_0.7.9.bb       | 2 --
 meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb  | 1 -
 .../recipes-devtools/python/python3-argcomplete_3.7.2.bb        | 1 -
 meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb  | 1 -
 .../recipes-devtools/python/python3-async-timeout_4.0.3.bb      | 1 -
 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb   | 2 --
 meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb       | 1 -
 meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb      | 1 -
 meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb | 1 -
 meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-colorzero_2.0.bb    | 2 --
 .../recipes-devtools/python/python3-configargparse_1.7.5.bb     | 1 -
 meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb  | 1 -
 meta-python/recipes-devtools/python/python3-distro_1.9.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-django.inc          | 1 -
 .../python/python3-djangorestframework_3.18.0.bb                | 1 -
 meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb     | 1 -
 .../recipes-devtools/python/python3-elementpath_5.1.4.bb        | 1 -
 .../recipes-devtools/python/python3-fastnumbers_5.2.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb    | 1 -
 meta-python/recipes-devtools/python/python3-flexcache_0.3.bb    | 1 -
 meta-python/recipes-devtools/python/python3-flexparser_0.4.bb   | 1 -
 meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-glances_4.3.2.bb    | 1 -
 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-huey_3.3.4.bb       | 1 -
 .../recipes-devtools/python/python3-humanfriendly_10.0.bb       | 1 -
 meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb  | 1 -
 meta-python/recipes-devtools/python/python3-identify_2.6.19.bb  | 1 -
 meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb   | 1 -
 meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb      | 1 -
 meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb  | 1 -
 meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb      | 1 -
 meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb   | 2 --
 meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb      | 1 -
 meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-parso_0.8.7.bb      | 1 -
 meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb   | 1 -
 .../recipes-devtools/python/python3-pickleshare_0.7.5.bb        | 1 -
 meta-python/recipes-devtools/python/python3-pika_1.4.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb      | 1 -
 meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb    | 1 -
 meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb      | 2 --
 meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb      | 1 -
 .../recipes-devtools/python/python3-pytest-json-report_1.5.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-raven_6.10.0.bb     | 1 -
 .../python/python3-robotframework-seriallibrary_0.4.3.bb        | 1 -
 meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb    | 1 -
 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb    | 1 -
 meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb   | 1 -
 .../recipes-devtools/python/python3-textparser_0.26.2.bb        | 1 -
 meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-typer_0.27.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-wand_0.7.2.bb       | 1 -
 .../recipes-devtools/python/python3-whitenoise_6.12.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb      | 1 -
 .../recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb  | 1 -
 .../recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb     | 1 -
 .../recipes-extended/python-pytesseract/pytesseract_0.3.13.bb   | 1 -
 .../recipes-extended/send2trash/python3-send2trash_2.1.0.bb     | 1 -
 86 files changed, 91 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_=
5.17.bb b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.1=
7.bb
index 1be13146db..87d63ba4c8 100644
--- a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
+++ b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c9ccd5f4ca5d=
0f5057c0e690a0153d"
=20
 SRC_URI[sha256sum] =3D "cfac69638d80943aff9cc5f1466755dd0fef8aed0bb4bda4=
1b5eb045818ce6fc"
=20
-PYPI_PACKAGE =3D "pyro5"
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/pamela_1.2.0.bb b/meta-p=
ython/recipes-devtools/python/pamela_1.2.0.bb
index d343458aea..2e39300745 100644
--- a/meta-python/recipes-devtools/python/pamela_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/pamela_1.2.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Db5fa9af58a807=
6d81145be56b6801a2b"
=20
 SRC_URI[sha256sum] =3D "0ea6e2a99dded8c7783a4a06f2d31f5bdcad894d79101e8f=
09322e387a34aacf"
=20
-PYPI_PACKAGE =3D "pamela"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.=
bb b/meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb
index 26cc9e81f3..d2de2f1a6f 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907=
fdace235a619d80314"
=20
 SRC_URI[sha256sum] =3D "a8d728f0a29de45dc521f18f07297428d56992a742f0cd27=
01ba86e44d23d5b2"
=20
-PYPI_PACKAGE =3D "aiofiles"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-aioredis_2.0.1.b=
b b/meta-python/recipes-devtools/python/python3-aioredis_2.0.1.bb
index d8a8f2d033..6de7716a5c 100644
--- a/meta-python/recipes-devtools/python/python3-aioredis_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aioredis_2.0.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbf9085f32a671d=
fa86ee69fe0fff7b95"
=20
 SRC_URI[sha256sum] =3D "eaa51aaf993f2d71f54b70527c440437ba65340588afeb78=
6cd87c55c89cd98e"
=20
-PYPI_PACKAGE =3D "aioredis"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-aioresponses_0.7=
.9.bb b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.9.bb
index 87081fc658..3450bcce8c 100644
--- a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.9.bb
@@ -21,5 +21,3 @@ RDEPENDS:${PN} +=3D "python3-aiohttp \
                    python3-yarl"
=20
 # optionally needs asynctest asynctest.case ddt but recipes do not exist=
 for them
-
-PYPI_PACKAGE =3D "aioresponses"
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.=
bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
index cb9234b904..c73ed1ca69 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/pycontribs/ansi2html"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3000208d539ec061b899bce1d9ce9=
404"
 LICENSE =3D "LGPL-3.0-or-later"
=20
-PYPI_PACKAGE =3D "ansi2html"
=20
 SRC_URI[sha256sum] =3D "3453bf87535d37b827b05245faaa756dbab4ec3d69925e35=
2b6319c3c955c0a5"
=20
diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.=
2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
index eac957bb1c..776d256c16 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D2ee41112a4=
4fe7014dce33e26468ba93"
=20
 SRC_URI[sha256sum] =3D "aad8b69a0b9969edb62db0d1752354c0d50717b10e0cbb00=
e2a958381b9fc6b9"
=20
-PYPI_PACKAGE =3D "argcomplete"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.=
bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
index 3dad63b500..1c753d6bd3 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/gristlabs/asttokens"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3d9b931fa23ab1cacd0087f9e2ee1=
2c0"
=20
-PYPI_PACKAGE =3D "asttokens"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.=
0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.=
bb
index 4606234be7..2c05f25956 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fa41f15bb5f=
23b6d3560c5845eb8d57"
=20
 SRC_URI[sha256sum] =3D "4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd=
0ab0bf87c427522f"
=20
-PYPI_PACKAGE =3D "async-timeout"
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.b=
b b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
index 42a7cb987c..18f52dd06c 100644
--- a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/takluyver/backcall"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D40e56b724d016484a7f790ec826d3=
ffc"
=20
-PYPI_PACKAGE =3D "backcall"
=20
 SRC_URI[sha256sum] =3D "5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd=
9cd06e2a4c215e1e"
=20
diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb =
b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
index 643208264c..8e493fd0a0 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D941ee9cd1609382f946352712a319=
b4b"
=20
-PYPI_PACKAGE =3D "brotli"
=20
 CVE_PRODUCT =3D "brotli"
=20
diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.233.b=
b b/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
index 9e45fc9dd2..32a1a15986 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
@@ -37,5 +37,3 @@ RDEPENDS:${PN}-ptest +=3D "\
 # runtime dependencies to the bitbake packages which include them:
 #    libusb-package
 #    pyee
-
-PYPI_PACKAGE =3D "bumble"
diff --git a/meta-python/recipes-devtools/python/python3-cantools_41.0.2.=
bb b/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
index cfc26c3f14..8ca363a044 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd9aa4ec07de78a=
bae21c490c9ffe61bd"
=20
 SRC_URI[sha256sum] =3D "5c91a66e5e03a4ac5727f20207df1da5681748a154c2bc85=
ef532fef9e0109d1"
=20
-PYPI_PACKAGE =3D "cantools"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb b/=
meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb
index 5f27cee388..f502406c22 100644
--- a/meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Validate configuration and produce human rea=
dable error messages."
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92844452d544a48a78abc3a862fbd=
8a4"
=20
-PYPI_PACKAGE =3D "cfgv"
=20
 inherit pypi setuptools3
 SRC_URI[sha256sum] =3D "d5b1034354820651caa73ede66a6294d6e95c1b00acc5e9b=
098e917404669132"
diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb b=
/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
index 5450c33c1d..b6f371a1cc 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "ninja-native cmake-native python3-scikit-build-native pytho=
n3-scikit-build-core-native"
=20
-PYPI_PACKAGE =3D "cmake"
 PYPI_ARCHIVE_NAME_PREFIX =3D "pypi-"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2=
.bb b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
index 498682cd6d..1d201c37a3 100644
--- a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
@@ -9,7 +9,6 @@ inherit pypi python_poetry_core
 SRC_URI +=3D "file://0001-pyproject.toml-Use-poetry-core.patch"
 SRC_URI[sha256sum] =3D "6d4fe287766166a98ca7bc6f6312daf04a0481b1eda43e71=
73484051c0ab4366"
=20
-PYPI_PACKAGE =3D "colorclass"
=20
 RDEPENDS:${PN} +=3D "\
     python3-ctypes \
diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.12.0.=
bb b/meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb
index ec11213103..52626a54b1 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.12.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5c3c6ebdec7792=
ae12df8d1c0a46b26a"
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "colorlog"
=20
 SRC_URI[sha256sum] =3D "2a7924c1dadf18b22a0eb8b06d1c7b01d5341707ec1641eb=
6fcc4fde0c3e8e5f"
=20
diff --git a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb=
 b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
index 4f0706f8f4..261d0aab90 100644
--- a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
@@ -15,5 +15,3 @@ RDEPENDS:${PN} +=3D " \
 SRC_URI[sha256sum] =3D "e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191=
e12d85f8f9d5eb58"
=20
 inherit pypi setuptools3
-
-PYPI_PACKAGE =3D "colorzero"
diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1=
.7.5.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.=
5.bb
index 0bf629dd91..5bd3b185a4 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda746463714cc3=
5999ed9a42339f2943"
=20
 SRC_URI[sha256sum] =3D "e3f9a7bb6be34d66b2e3c4a2f58e3045f8dfae47b0dc039f=
87bcfaa0f193fb0f"
=20
-PYPI_PACKAGE =3D "configargparse"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.=
bb b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
index 440a62352d..840593da5c 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc60ef82f0f4015=
5453f6d5f2c94b6e8e"
=20
 SRC_URI[sha256sum] =3D "2c3a3fa2743d8535d832ec61c2054a1641f41775aa7c5567=
58a109941e33e4fc"
=20
-PYPI_PACKAGE =3D "diskcache"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb =
b/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
index 08a9526783..c94ac45441 100644
--- a/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80=
314"
=20
-PYPI_PACKAGE =3D "distro"
=20
 SRC_URI[sha256sum] =3D "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8=
bafdcabcdd9bdbed"
=20
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/met=
a-python/recipes-devtools/python/python3-django.inc
index bbf7e564e8..e6942176db 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://www.djangoproject.com/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df09eb47206614a4954c51db8a9484=
0fa"
=20
-PYPI_PACKAGE =3D "django"
=20
 inherit pypi ptest
=20
diff --git a/meta-python/recipes-devtools/python/python3-djangorestframew=
ork_3.18.0.bb b/meta-python/recipes-devtools/python/python3-djangorestfra=
mework_3.18.0.bb
index a0f9bef7a2..bab9262ac1 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.1=
8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.1=
8.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D7879a5a7161=
47a784f7e524c9cf103c1"
=20
 SRC_URI[sha256sum] =3D "2323a5111837e0b784dcb8323abc78ecc54fa2a5af7aff26=
77cf50cdd849477f"
=20
-PYPI_PACKAGE =3D "djangorestframework"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb =
b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
index 59774a1681..5142fff297 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D66ffc5e30f76cbb5358fe54b645e5=
a1d"
=20
-PYPI_PACKAGE =3D "ecdsa"
 SRC_URI[sha256sum] =3D "62635b0ac1ca2e027f82122b5b81cb706edc38cd91c63dda=
28e4f3455a2bf930"
=20
 CVE_PRODUCT =3D "python-ecdsa_project:python-ecdsa tlsfuzzer:ecdsa"
diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.=
4.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.4.bb
index 8f15d5c723..186cc6ffcc 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc04ab6ce886cc8=
43af8941bb199406ba"
=20
 SRC_URI[sha256sum] =3D "3c912a9c41311ac5244c038867670d7c0b0fec0e44481360=
8e5b846dbb3428ac"
=20
-PYPI_PACKAGE =3D "elementpath"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.=
0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
index 4ef9361d41..65d7fcea3f 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32431d1b650010945da4e078011c=
8fa"
=20
-PYPI_PACKAGE =3D "fastnumbers"
=20
 SRC_URI[sha256sum] =3D "07266a2fca9e08eeb5a6c70be4c8db3637db9b930ea5198f=
acbbb9b0b31d4d03"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb=
 b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index 3d58461488..16afb1d1ce 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D2729ee82259d6=
01d90d28b0574d12416"
=20
 SRC_URI[sha256sum] =3D "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf3=
6b3aca2e110a33f4"
=20
-PYPI_PACKAGE =3D "flask-nav"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb=
 b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
index e86d7553ca..d46f9eb16f 100644
--- a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] =3D "18743bd5a0621bfe2cf8d519e4c3bfdf5=
7a269c15d1ced3fb4b64e0ff4
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 DEPENDS +=3D "python3-wheel-native"
-PYPI_PACKAGE =3D "flexcache"
=20
 PTEST_PYTEST_DIR =3D "flexcache/testsuite"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.4.b=
b b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
index 011ba596c4..e4e15d1a35 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
@@ -10,7 +10,6 @@ inherit pypi python_setuptools_build_meta ptest-python-=
pytest
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-PYPI_PACKAGE =3D "flexparser"
=20
 PTEST_PYTEST_DIR =3D "flexparser/testsuite"
=20
diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.=
bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
index 7b499907a8..d34b67c428 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D "c803c40f4cf860b49dea58ee3e1c33cb9=
c790520e233537e1340049f89
=20
 inherit pypi python_hatchling ptest
=20
-PYPI_PACKAGE =3D "fsspec"
=20
 DEPENDS =3D "python3-hatch-vcs-native python3-hatchling-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb=
 b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
index e4cd7d59e7..24ccb76c28 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D852ecadc0ac7e6=
f4d7144d5544a3815b"
=20
 SRC_URI[sha256sum] =3D "736faa7faea3bcd58afffd6443974b4ed4b498627a71ce5d=
6c9640b7b5ddbd94"
=20
-PYPI_PACKAGE =3D "glances"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.b=
b b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
index e3da33a23c..d2cfbf46a0 100644
--- a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D10;endline=3D10;md5=3D=
c2d9994c57f0444e39f1dab19af50254"
 SRC_URI[sha256sum] =3D "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a772=
15cf644a33513192"
=20
-PYPI_PACKAGE =3D "gpsd-py3"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb b/=
meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
index c292cd5666..a9103cdf9c 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5cac039fcc82f01141cc170b48f31=
5d4"
=20
-PYPI_PACKAGE =3D "huey"
=20
 SRC_URI[sha256sum] =3D "6de196c6ece2e38b5173f7510600091ab035c0e86b0958d0=
e5b38a82b9984666"
=20
diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_10=
.0.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
index 184ce28c1a..b1fb6947f0 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5d178009f806c2bdd498a19be=
0013a7a"
=20
-PYPI_PACKAGE =3D "humanfriendly"
=20
 SRC_URI[sha256sum] =3D "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f6=
06be6686a2288ddc"
=20
diff --git a/meta-python/recipes-devtools/python/python3-icontract_2.7.3.=
bb b/meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb
index e76c7af8b0..bd80d12fff 100644
--- a/meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-icontract_2.7.3.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1d4a9b1f6b84bedf7a3884393=
1e0dd57"
=20
 inherit pypi setuptools3
-PYPI_PACKAGE =3D "icontract"
 SRC_URI[sha256sum] =3D "df37a43d86d532407bc6b84dea29dd9f7ece794b73211769=
fa8a33a76b8ed145"
=20
 RDEPENDS:${PN} +=3D "python3-asttokens"
diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.19.=
bb b/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
index 9b8d49c61d..e6ad7ab727 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "File identification library for Python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbbdc006359f3157660173ec7f133a=
80e"
=20
-PYPI_PACKAGE =3D "identify"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.b=
b b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
index 37a3eea5d4..cc431b33bd 100644
--- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da61b9c5aec8796=
b64a6bf15d42605073"
=20
 SRC_URI[sha256sum] =3D "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f31=
1254d6d0d92c6c7c"
=20
-PYPI_PACKAGE =3D "idna-ssl"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.b=
b b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
index 28a679bc99..98cd5b265a 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159=
876a0ba63099614381"
=20
 SRC_URI[sha256sum] =3D "9aee407f92c7d51a2ce50f3b78291a9094e334e34bd68e82=
bf60020795fa2c94"
=20
-PYPI_PACKAGE =3D "inotify"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb b=
/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
index 857009948f..5d49bc6cec 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/davidhalter/jedi"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5ed06eebfcb244cd66ebf6cef=
9c23ab4"
=20
-PYPI_PACKAGE =3D "jedi"
=20
 SRC_URI[sha256sum] =3D "c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf7=
04b23f487daa1011"
=20
diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.=
bb b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
index 1c8a99eb33..74a66e9490 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D "dc3369cd1401767b9ecb1117cd6b73fab=
a9038e3bd9e1695a710a9e9d9
=20
 inherit pypi python_hatchling ptest
=20
-PYPI_PACKAGE =3D "libevdev"
=20
 SRC_URI +=3D " \
     file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb b=
/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
index 288ce0c84f..0d94a7a05c 100644
--- a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
@@ -8,7 +8,6 @@ SRC_URI +=3D "\
         file://run-ptest \
 "
=20
-PYPI_PACKAGE =3D "lorem"
=20
 inherit pypi setuptools3 ptest
=20
diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb=
 b/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
index 206e322fbd..44fed0b8df 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32431d1b650010945da4e078011c=
8fa"
=20
-PYPI_PACKAGE =3D "natsort"
 SRC_URI[sha256sum] =3D "45312c4a0e5507593da193dedd04abb1469253b601ecaf63=
445ad80f0a1ea581"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb =
b/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
index 35a192a268..49355a76da 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Ninja is a small build system with a focus o=
n speed"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE_Apache_20;md5=3D19cbd64715b51267a47=
bf3750cc6a8a5"
=20
-PYPI_PACKAGE =3D "ninja"
 PYPI_ARCHIVE_NAME_PREFIX =3D "pypi-"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.b=
b b/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
index 1f02ce7055..37b7c9c8d9 100644
--- a/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Node.js virtual environment builder"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da9e238ffae5bb6447dbac6291e1dc=
3a3"
=20
-PYPI_PACKAGE =3D "nodeenv"
=20
 inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] =3D "996c191ad80897d076bdfba80a41994c2b47c68e224c542b=
48feba42ba00f8bb"
diff --git a/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.b=
b b/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
index a17b7aa5d6..045978a9c2 100644
--- a/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
@@ -17,5 +17,3 @@ do_install_ptest:append() {
=20
 RDEPENDS:${PN} +=3D "python3-core python3-io"
 RDEPENDS:${PN}-ptest +=3D "python3-tox"
-
-PYPI_PACKAGE =3D "objgraph"
diff --git a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb b=
/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
index 69b0f4f2ad..6ffa56e354 100644
--- a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
@@ -33,7 +33,6 @@ LIC_FILES_CHKSUM =3D " \
 	file://GPL-LICENSE-2.txt;md5=3D751419260aa954499f7abaabaa882bbe \
 "
=20
-PYPI_PACKAGE =3D "odfpy"
=20
 inherit pypi ptest-python-pytest setuptools3
 SRC_URI[sha256sum] =3D "db766a6e59c5103212f3cc92ec8dd50a0f3a02790233ed0b=
52148b70d3c438ec"
diff --git a/meta-python/recipes-devtools/python/python3-oletools_0.60.2.=
bb b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
index 35b9781d60..5d2cd3b334 100644
--- a/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
+++ b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
@@ -13,7 +13,6 @@ SRC_URI[sha256sum] =3D "ad452099f4695ffd8855113f4533482=
00d195ee9fa341a09e197d66ee7
=20
 inherit pypi setuptools3 ptest
=20
-PYPI_PACKAGE =3D "oletools"
 PYPI_PACKAGE_EXT =3D "zip"
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.b=
b b/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
index 607fc6c089..7936d8e9a6 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfd0120fc2e9f84=
1c73ac707a30389af5"
=20
 SRC_URI[sha256sum] =3D "36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e78=
7c2dd5a95c0e5e79"
=20
-PYPI_PACKAGE =3D "paramiko"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.7.bb b=
/meta-python/recipes-devtools/python/python3-parso_0.8.7.bb
index 0b2f188e12..4e7a112c31 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.7.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/davidhalter/parso"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbaa2675b2424d771451332a7=
a69503f"
=20
-PYPI_PACKAGE =3D "parso"
=20
 SRC_URI[sha256sum] =3D "eaaac4c9fdd5e9e8852dc778d2d7405897ec510f2a298071=
453e5e3a07914bb1"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.b=
b b/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
index e4246f594e..c32e34a3a9 100644
--- a/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
@@ -7,6 +7,5 @@ SRC_URI[sha256sum] =3D "025f8c809a126f45a082ffa820893e6a8=
d990d9d7ddb68694b5a9f0a6d
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "pcodedmp"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.=
5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
index 8eb55c4604..4d1c26c6d5 100644
--- a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/pickleshare/pickleshare"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D905c08218089ffebea3a64c82fc4d=
7d0"
=20
-PYPI_PACKAGE =3D "pickleshare"
=20
 SRC_URI[sha256sum] =3D "87683d47965c1da65cdacaf31c8441d12b8044cdec9aca50=
0cd78fc2c683afca"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb b/=
meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
index b64a4a508a..b85b063207 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
@@ -20,7 +20,6 @@ SRC_URI =3D "\
=20
 inherit python_setuptools_build_meta ptest-python-pytest
=20
-PYPI_PACKAGE =3D "pika"
=20
 DEPENDS +=3D " \
     python3-setuptools-scm-native \
diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.=
bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
index ad2abc28d9..b18632f926 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
@@ -15,7 +15,6 @@ inherit pypi python_setuptools_build_meta ptest-python-=
pytest
 # so turn it off.
 export CMAKE_ARGS =3D "-DCMAKE_CXX_SCAN_FOR_MODULES=3DOFF"
=20
-PYPI_PACKAGE =3D "pikepdf"
=20
 CVE_PRODUCT =3D "pikepdf"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb b=
/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
index 2343d82dcb..1f755fbf4c 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.2.1.bb
@@ -11,7 +11,6 @@ inherit python_setuptools_build_meta ptest-python-pytes=
t
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-PYPI_PACKAGE =3D "pyais"
=20
 do_install_ptest:append() {
 	install -d ${D}${PTEST_PATH}/examples/
diff --git a/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb=
 b/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
index 968357a1c9..8a0536ff24 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db1538fcaea82eb=
f2313ed648b96c69b1"
=20
 SRC_URI[sha256sum] =3D "5a3c249c830432631439815f9a818463416f2a8cbdb1e988=
e78757de9ae75081"
=20
-PYPI_PACKAGE =3D "pycares"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb b=
/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
index 8c89a7e212..3435ea64a5 100644
--- a/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
@@ -10,5 +10,3 @@ inherit pypi python_setuptools_build_meta ptest-python-=
pytest
 DEPENDS +=3D "python3-wheel-native"
=20
 RDEPENDS:${PN} +=3D "python3-typing-extensions"
-
-PYPI_PACKAGE =3D "pyee"
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb =
b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
index 140d3bf3e4..1b018f605b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4b56d2c9973d8=
cf54655555be06e551"
=20
 SRC_URI[sha256sum] =3D "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f63779=
4879baf1b7703423"
=20
-PYPI_PACKAGE =3D "pyjwt"
 CVE_PRODUCT =3D "pyjwt"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.=
bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index d94051df89..0c264a2c51 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4eaf57328ad29e=
a2e0ed31a57f0914dc"
=20
 SRC_URI[sha256sum] =3D "796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda=
11347f483d245884"
=20
-PYPI_PACKAGE =3D "pykwalify"
=20
 inherit setuptools3 pypi
=20
diff --git a/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.=
bb b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
index a0f5188f28..7c5aff5ccd 100644
--- a/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48fd6c978d39a38b3a04f45a1456d=
0fa"
=20
 inherit pypi setuptools3
-PYPI_PACKAGE =3D "pylddwrap"
 SRC_URI[sha256sum] =3D "a70437fea7bca647c0e98161e1006ef49970267999c571b4=
99760f1c43c6ba10"
=20
 PR =3D "r0"
diff --git a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0=
.bb b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
index 8d966cfb63..f47711c6b5 100644
--- a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
=20
-PYPI_PACKAGE =3D "pymemcache"
=20
 SRC_URI[sha256sum] =3D "27bf9bd1bbc1e20f83633208620d56de50f14185055e4950=
4f4f5e94e94aff94"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
index d062ebe561..12a9e25aa0 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D528175c84163=
bb800d23ad835c7fa0fc"
=20
 SRC_URI[sha256sum] =3D "6c7b17ca686988104d7426c27895b455cdeea3e9d3ceb127=
0f0c3704fead8c33"
=20
-PYPI_PACKAGE =3D "pymysql"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb =
b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
index cc945666a1..10bc227d8e 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cc789b082b3d9=
7e1ccc5261f8594d3f"
=20
 SRC_URI[sha256sum] =3D "018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bc=
f018f1ed8436811c"
=20
-PYPI_PACKAGE =3D "pynacl"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb b=
/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
index d4d061540a..8a12c07e89 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3D53=
dbfa56f61b90215a9f8f0d527c043d"
=20
-PYPI_PACKAGE =3D "pyrad"
 SRC_URI[sha256sum] =3D "e039c48a026c988d49276bd7c75795f55e0e4c2788f7ddf0=
9419ce0e191a154d"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-pytest-json-repo=
rt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-json-rep=
ort_1.5.0.bb
index 6b108a2d0a..8834a6b586 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.=
0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8b4ca2f2ad5aaa=
ebd8eb24f262f8fe60"
=20
 SRC_URI[sha256sum] =3D "2dde3c647851a19b5f3700729e8310a6e66efb2077d674f2=
7ddea3d34dc615de"
=20
-PYPI_PACKAGE =3D "pytest-json-report"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb =
b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
index 54ae1c3139..b1da96524b 100644
--- a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9a4414e08f057=
1d55184531cefc131b"
=20
 SRC_URI[sha256sum] =3D "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db6=
7197bcc23c8fae54"
=20
-PYPI_PACKAGE =3D "raven"
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-s=
eriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robot=
framework-seriallibrary_0.4.3.bb
index 7f282c0fbe..4a8fcde41b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-serialli=
brary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-serialli=
brary_0.4.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad407cda031a6a=
af51a1fecaaa6e7d29"
 SRC_URI +=3D "file://0001-pyproject.toml-Replace-install_requires.patch"
 SRC_URI[sha256sum] =3D "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03=
fa66bae54777e6bb"
=20
-PYPI_PACKAGE =3D "robotframework-seriallibrary"
=20
 inherit pypi python_poetry_core
=20
diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb =
b/meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb
index 1b9a879234..47f17238da 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.6.1.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] =3D "2b043372abf8f6029a632c3aab36b64=
1c5d5872b1cbad599fc68e17ac4
=20
 CLEANBROKEN =3D "1"
=20
-PYPI_PACKAGE =3D "smbus2"
=20
 RDEPENDS:${PN} +=3D "\
         python3-ctypes \
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb=
 b/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
index c177d4020c..e65259a053 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://README.md;md5=3D8b4e2ac8cf248f7b991784f88b6=
30852"
=20
-PYPI_PACKAGE =3D "smpplib"
 SRC_URI[sha256sum] =3D "6f3b036fcb2643c1b7a3289bb5ac4c9a720af1bf73e572e2=
729db6b5d800c273"
=20
 inherit pypi setuptools3 ptest-python-pytest
diff --git a/meta-python/recipes-devtools/python/python3-speaklater_1.3.b=
b b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
index 9d9166831d..65a8796aad 100644
--- a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
@@ -4,5 +4,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db810770075a29b=
f44b96607440e7c801"
=20
 SRC_URI[sha256sum] =3D "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe=
65e6bfffdd6a65a9"
=20
-PYPI_PACKAGE =3D "speaklater"
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb=
 b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
index e7f329e9bb..f0c268887e 100644
--- a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
@@ -3,7 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4382f3a1adb96f258dbd80f5b400f=
0d5"
=20
-PYPI_PACKAGE =3D "sqlsoup"
 SRC_URI[sha256sum] =3D "2fafb7732a663dcd59b37e64d1c94d5fb20d4fad32cd8ee2=
60aa1cd9a10340d6"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.3.0=
.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
index d504298914..9abc9710a9 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.3.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D5b4e3a2=
172bba4c47cded5885e7e507e"
 SRC_URI[sha256sum] =3D "4a2bf149adf42997e1bb44b70c43b613275ec9852c3edacc=
a86a9166b27e945e"
=20
 CVE_PRODUCT =3D "supervisord:supervisor"
-PYPI_PACKAGE =3D "supervisor"
 inherit pypi systemd setuptools3
 RDEPENDS:${PN} =3D "\
     python3-fcntl \
diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0=
.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
index f0cf5c3450..45956d7154 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D15abe157ad=
6f0b483975cc34bcc1aa99"
=20
 SRC_URI[sha256sum] =3D "b5387d811a270b98698081083a7843530c44765c0a023e3c=
ab6fe8d81f8a2c73"
=20
-PYPI_PACKAGE =3D "telnetlib3"
=20
 inherit pypi python_setuptools_build_meta python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.b=
b b/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
index 5200c4c0b5..c0d3f1908c 100644
--- a/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
@@ -11,7 +11,6 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
-PYPI_PACKAGE =3D "tenacity"
=20
 RDEPENDS:${PN}-ptest +=3D "\
     python3-tornado \
diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.26.=
2.bb b/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
index f36308f843..14800dda92 100644
--- a/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfe9942a8bba545=
8a9dbd11277bc347ad"
=20
 SRC_URI[sha256sum] =3D "859825876a9c38f7c313ee1cf991a59d6b56232a9f67be6d=
cc0a758d84654fba"
=20
-PYPI_PACKAGE =3D "textparser"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0=
.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
index 16415ebeee..c5f9e02802 100644
--- a/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
@@ -10,5 +10,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dee157eec4b22=
8c8d5b7a6e0feab2864a"
=20
 SRC_URI[sha256sum] =3D "eb6dc23601be359ee00f5a3d31a46adf3bad0a16f8d60af2=
16cd67982ca75cf4"
=20
-PYPI_PACKAGE =3D "tinyrecord"
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb =
b/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
index 3246de7472..7d3133670f 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
@@ -15,7 +15,6 @@ SRC_URI:append =3D " \
     file://run-ptest \
 "
=20
-PYPI_PACKAGE =3D "typer"
=20
 RDEPENDS:${PN} +=3D "\
     python3-annotated-doc \
diff --git a/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb=
 b/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
index fe25eda63e..c43072cfa1 100644
--- a/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
@@ -2,7 +2,6 @@ SUMMARY =3D "Implementation of bounded Levenshtein distan=
ce (Ukkonen)"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7e49a187324d5a1a6c4ba2b9c3fd4=
033"
=20
-PYPI_PACKAGE =3D "ukkonen"
=20
 inherit python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb=
 b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
index 6ff9a091f0..c6a2148f90 100644
--- a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] =3D "308ebfd98e67d898834876348b27caf41=
470cd853fbe2681cc7dacd8fd
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "unoconv"
=20
 RDEPENDS:${PN} +=3D "\
     python3-setuptools \
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.b=
b b/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
index c5c7ac0a69..7f5c91ff3a 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
@@ -12,7 +12,6 @@ SRC_URI +=3D "file://0001-ptest-disable-failing-tests.p=
atch \
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
-PYPI_PACKAGE =3D "uvicorn"
 CVE_PRODUCT =3D "encode:uvicorn"
 CVE_STATUS[CVE-2020-7694] =3D "fixed-version: The vulnerability has been=
 fixed since 0.11.7"
=20
diff --git a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb b/=
meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
index 2eeb2cb9f9..fbebb5147e 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] =3D "0387fd08848d00cadd1d885fcb19a17=
dd4250df2029e5338b6b668b7fe
=20
 inherit pypi python_setuptools_build_meta ptest
=20
-PYPI_PACKAGE =3D "wand"
=20
 FILES:${PN}-doc +=3D "${datadir}/README.rst"
=20
diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.12.=
0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.12.0.bb
index dd8f189f98..2ee246ca67 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.12.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://whitenoise.evans.io"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daba4901cc64e401cea5a267eac2a2=
e1e"
=20
-PYPI_PACKAGE =3D "whitenoise"
=20
 SRC_URI[sha256sum] =3D "f723ebb76a112e98816ff80fcea0a6c9b8ecde835f8ddda2=
5df7a30a3c2db6ad"
=20
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb b=
/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
index e3e7518eed..4c99153ed0 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI[sha256sum] =3D "e81b83143bee16329c23db3c1b2d82b29892fcbcb849186d=
2f6e98a5abe9a57f"
=20
-PYPI_PACKAGE =3D "yarl"
=20
 inherit pypi ptest-python-pytest python_setuptools_build_meta cython
=20
diff --git a/meta-python/recipes-devtools/python3-breathe/python3-breathe=
_4.36.0.bb b/meta-python/recipes-devtools/python3-breathe/python3-breathe=
_4.36.0.bb
index a31bc4c849..d8dffcf948 100644
--- a/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0=
.bb
+++ b/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0=
.bb
@@ -10,6 +10,5 @@ inherit pypi python_flit_core ptest ptest-python-pytest
=20
 RDEPENDS:${PN} =3D "python3-sphinx"
=20
-PYPI_PACKAGE =3D "breathe"
=20
 BBCLASSEXTEND =3D+ "native nativesdk"
diff --git a/meta-python/recipes-devtools/python3-exhale/python3-exhale_0=
.3.7.bb b/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.=
7.bb
index 01c5566e0d..54e7cbb48c 100644
--- a/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
+++ b/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
@@ -13,7 +13,6 @@ inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-PYPI_PACKAGE =3D "exhale"
=20
 RDEPENDS:${PN} =3D "\
     python3-beautifulsoup4 \
diff --git a/meta-python/recipes-extended/python-pytesseract/pytesseract_=
0.3.13.bb b/meta-python/recipes-extended/python-pytesseract/pytesseract_0=
.3.13.bb
index ca41d1c66b..623cf96629 100644
--- a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.=
bb
+++ b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.=
bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D "4bf5f880c99406f52a3cfc2633e42d9dc=
67615e69d8a509d74867d3bad
=20
 RDEPENDS:${PN}:append =3D " python3-packaging tesseract"
=20
-PYPI_PACKAGE =3D "pytesseract"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_2=
.1.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.=
0.bb
index 746a41b2c4..f612e8137e 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
@@ -7,7 +7,6 @@ inherit pypi python_setuptools_build_meta ptest-python-py=
test
 SRC_URI +=3D "file://run-ptest"
 SRC_URI[sha256sum] =3D "1c72b39f09457db3c05ce1d19158c2cbef4c32b8bedd02c1=
55e49282b7ea7459"
=20
-PYPI_PACKAGE =3D "send2trash"
=20
 RDEPENDS:${PN} +=3D "\
     python3-io \
--=20
2.43.0


