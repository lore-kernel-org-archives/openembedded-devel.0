Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AF8C982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:37:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42958.1789659455816948771
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DPR+vnh+;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C71BD1476
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10F7D3F7B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789659455; bh=TEOMNBvPHAq7ZoUscLnYbPw6+sE1W59PkfzkBWxsL8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DPR+vnh+OTfGxqZpC7SlWTsOOoCgWipubSeGAa7PYA3j/9yIG/XPZYBbNjtvMxMYO
	 mLc9vmZqylGKmQs4oeNcPoS+p04+fUIuiAKNhIBWiBLfaQB+co6WT7N4YYMwosAoxI
	 uHbXcMfRVminBrDztbqvD9KNu11SZArXWS3e+8Uw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 7/8] meta-python: remove obsolete dependencies on python3-six
Date: Thu, 17 Sep 2026 16:37:24 +0100
Message-ID: <20260917153727.3057505-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917153727.3057505-1-ross.burton@arm.com>
References: <20260917153727.3057505-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 15:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130104

These recipes no longer use six, so remove the dependency.

The list of recipes that still use six is a somewhat useful proxy for
packages that are no longer maintained...

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python-thrift/python3-thrift_0.24.0.bb                    | 1 -
 .../recipes-devtools/python/python3-asttokens_3.0.2.bb        | 4 ----
 .../recipes-devtools/python/python3-autobahn_26.7.1.bb        | 1 -
 .../python/python3-cassandra-driver_3.29.3.bb                 | 1 -
 .../recipes-devtools/python/python3-configobj_5.0.9.bb        | 1 -
 meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb  | 1 -
 .../recipes-devtools/python/python3-eventlet_0.41.2.bb        | 1 -
 meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb   | 1 -
 .../recipes-devtools/python/python3-google-api-core_2.19.1.bb | 1 -
 .../python/python3-google-api-python-client_2.136.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb    | 2 --
 .../recipes-devtools/python/python3-linux-procfs_0.7.4.bb     | 3 ---
 meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb | 2 --
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.53.bb  | 1 -
 .../recipes-devtools/python/python3-pymisp_2.5.34.2.bb        | 1 -
 .../recipes-devtools/python/python3-pymodbus_3.15.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb   | 1 -
 meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb    | 1 -
 meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb  | 1 -
 .../python/python3-service-identity_26.1.0.bb                 | 1 -
 meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb | 1 -
 .../recipes-devtools/python/python3-socketio_5.16.4.bb        | 1 -
 meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb  | 1 -
 meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb | 1 -
 .../recipes-devtools/python/python3-websocket-client_1.9.2.bb | 1 -
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb   | 1 -
 .../python-pykickstart/python3-pykickstart_3.69.bb            | 1 -
 meta-python/recipes-extended/tuna/tuna_0.21.bb                | 1 -
 28 files changed, 35 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrif=
t_0.24.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thri=
ft_0.24.0.bb
index 3d27b7e17da..257122b7840 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.=
0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.=
0.bb
@@ -14,7 +14,6 @@ PYPI_ARCHIVE_NAME_PREFIX =3D "python-"
 RDEPENDS:${PN} +=3D "\
     python3-logging \
     python3-scons \
-    python3-six \
     python3-stringold \
     python3-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.=
bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
index 1c753d6bd37..4bb165b5feb 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
@@ -12,8 +12,4 @@ SRC_URI[sha256sum] =3D "3ecdbd8f2cc195f53ccada3a613538b=
b5f9ef6f6869129f13e03c30a67
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
-RDEPENDS:${PN} +=3D " \
-	python3-six \
-"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.=
bb b/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
index 2274abcff25..c24f1ef95d6 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
@@ -25,5 +25,4 @@ RDEPENDS:${PN} +=3D " \
     python3-snappy \
     python3-pyopenssl \
     python3-txaio \
-    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver=
_3.29.3.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver=
_3.29.3.bb
index 6ab86300f5a..c4768836d3f 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3=
.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3=
.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} +=3D "\
     python3-misc \
     python3-multiprocessing \
     python3-numbers \
-    python3-six \
     libevent \
 "
=20
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.=
bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index 1381ded6970..865b7b5a3c4 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -13,7 +13,6 @@ PTEST_PYTEST_DIR =3D "src/tests"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-pprint \
-	python3-six \
 "
=20
 CVE_STATUS[CVE-2023-26112] =3D "fixed-version: the current version (5.0.=
9) is already fixed"
diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb=
 b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
index fd7507193e6..69e054279ef 100644
--- a/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
@@ -9,7 +9,6 @@ inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
     python3-core \
-    python3-six \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.=
bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
index 864aa20ba89..3292950e2ca 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
@@ -15,6 +15,5 @@ DEPENDS +=3D "python3-hatch-vcs-native"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-dnspython \
-	python3-six \
 	python3-greenlet \
 "
diff --git a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb =
b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
index 7339484379b..a002738d515 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
@@ -16,5 +16,4 @@ RDEPENDS:${PN} +=3D "\
     python3-io \
     python3-json \
     python3-logging \
-    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_=
2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2=
.19.1.bb
index f21b41aab77..84b384e8ca4 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.=
bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.=
bb
@@ -21,5 +21,4 @@ RDEPENDS:${PN} +=3D "\
     python3-protobuf \
     python3-pytz \
     python3-requests \
-    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-google-api-pytho=
n-client_2.136.0.bb b/meta-python/recipes-devtools/python/python3-google-=
api-python-client_2.136.0.bb
index 629f1b9e232..d2802815c09 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-clien=
t_2.136.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-clien=
t_2.136.0.bb
@@ -10,7 +10,6 @@ inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D "\
     python3-logging \
-    python3-six \
     python3-json \
     python3-core \
     python3-netclient \
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb b=
/meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb
index 883aeb2033d..00e9c041341 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb
@@ -14,13 +14,11 @@ BBCLASSEXTEND =3D "native"
=20
 DEPENDS =3D "python3-pkgconfig-native \
            python3-numpy-native \
-           python3-six-native \
            hdf5-native \
            python3 \
            hdf5 \
           "
=20
 RDEPENDS:${PN} =3D "python3-numpy \
-                  python3-six \
                   python3-json \
                  "
diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7=
.4.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.4.bb
index 839ec94600a..7165a7378d9 100644
--- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.4.bb
@@ -7,7 +7,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6855782848d5=
72347212f667a2d637"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-linux-procf=
s/python-linux-procfs.git;branch=3Dmain;tag=3Dv${PV}"
 SRCREV =3D "702d6360ce082d8328e0cfd84f6415b0c94ca6dd"
=20
-
 inherit python_setuptools_build_meta
-
-RDEPENDS:${PN} +=3D "python3-six"
diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.4.b=
b b/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
index ecfd9034ac7..1b156ad53ba 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
@@ -7,7 +7,5 @@ SRC_URI[sha256sum] =3D "f05ade694522bf1720febebe1672f820f=
43a13c6a1664751e7769d47e8
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
-RDEPENDS:${PN} +=3D "python3-six"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3=
.0.53.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0=
.53.bb
index bc0d5510582..7dd173cfa04 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.b=
b
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.b=
b
@@ -11,7 +11,6 @@ PYPI_PACKAGE =3D "prompt_toolkit"
=20
 RDEPENDS:${PN} +=3D " \
     python3-core \
-    python3-six \
     python3-terminal \
     python3-threading \
     python3-wcwidth \
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.=
bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
index 7a82ab5e18a..d011ed1768e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
@@ -12,7 +12,6 @@ RDEPENDS:${PN} +=3D " \
     python3-json \
     python3-jsonschema \
     python3-requests \
-    python3-six \
     python3-deprecated \
     python3-wrapt \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.=
bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
index 0c70d91cd66..8debc4c0679 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
@@ -27,5 +27,4 @@ RDEPENDS:${PN} +=3D " \
=20
 RDEPENDS:${PN} +=3D " \
     python3-pyserial \
-    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb =
b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
index 10bc227d8ec..f2e30f308f7 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
@@ -23,7 +23,6 @@ do_install:prepend() {
 }
=20
 RDEPENDS:${PN} =3D "\
-    python3-six \
     python3-cffi \
     libsodium \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb b=
/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
index 8a12c07e89b..443b280e26a 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
@@ -14,7 +14,6 @@ RDEPENDS:${PN} +=3D " \
     python3-io \
     python3-logging \
     python3-netaddr \
-    python3-six \
 "
=20
 CVE_PRODUCT =3D "pyrad"
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb=
 b/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
index 559b828fcbc..c75d822c487 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
@@ -15,7 +15,6 @@ do_configure:prepend() {
 RDEPENDS:${PN} =3D "\
     python3-ctypes \
     python3-misc \
-    python3-six \
     python3-threading \
     python3-fcntl \
     libudev \
diff --git a/meta-python/recipes-devtools/python/python3-service-identity=
_26.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity=
_26.1.0.bb
index a603cb247b0..4603f688bca 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_26.1.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_26.1.0=
.bb
@@ -20,6 +20,5 @@ RDEPENDS:${PN} +=3D " \
=20
 RDEPENDS:${PN}-ptest +=3D " \
     python3-attrs \
-    python3-six \
     python3-pyopenssl \
 "
diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.b=
b b/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
index 74e6df64a9b..dba63705bba 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
@@ -13,7 +13,6 @@ RDEPENDS:${PN} +=3D " \
     python3-pyusb \
     python3-pyyaml \
     python3-setuptools \
-    python3-six \
 "
=20
 do_install:append() {
diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.4.=
bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
index 83131b26cb9..8eddcc5b653 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} +=3D "\
     python3-pickle \
     python3-json \
     python3-threading \
-    python3-six \
     python3-attrs \
     python3-bidict \
     "
diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb=
 b/meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb
index 69606f1fe81..d7c3cd8990a 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.2.1.bb
@@ -20,5 +20,4 @@ RDEPENDS:${PN}-ptest +=3D " \
     python3-pyopenssl \
     python3-pyasn1-modules \
     python3-service-identity \
-    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.17.0.b=
b b/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
index 6f9c886c350..18375edc615 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
@@ -15,7 +15,6 @@ RDEPENDS:${PN} +=3D "\
     python3-pysocks \
     python3-requests \
     python3-requests-oauthlib \
-    python3-six \
 "
=20
 CVE_PRODUCT =3D "josh_roesslein:tweepy tweepy:tweepy"
diff --git a/meta-python/recipes-devtools/python/python3-websocket-client=
_1.9.2.bb b/meta-python/recipes-devtools/python/python3-websocket-client_=
1.9.2.bb
index 4bcdb8debaf..202a0b0fcda 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.=
bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.=
bb
@@ -14,6 +14,5 @@ PYPI_PACKAGE =3D "websocket_client"
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
-    python3-six \
     python3-logging \
 "
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4=
.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.=
5.bb
index 5305093b2f1..a1ed78685e0 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -42,7 +42,6 @@ RDEPENDS:${PN} =3D "\
     python3-pip \
     python3-pprint \
     python3-pycairo \
-    python3-six \
     python3-xml \
     python3-cairocffi \
 "
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pyki=
ckstart_3.69.bb b/meta-python/recipes-extended/python-pykickstart/python3=
-pykickstart_3.69.bb
index c566f5a0e61..d61a844eb5d 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.69.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.69.bb
@@ -8,7 +8,6 @@ inherit python_setuptools_build_meta ptest
=20
 RDEPENDS:${PN} =3D "python3 \
                   python3-requests \
-                  python3-six \
 "
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-extended/tuna/tuna_0.21.bb b/meta-python=
/recipes-extended/tuna/tuna_0.21.bb
index ccdb305d88a..de80d1aa7a8 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.21.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.21.bb
@@ -12,7 +12,6 @@ RDEPENDS:${PN} +=3D " \
     python3-io \
     python3-linux-procfs \
     python3-logging \
-    python3-six \
     "
=20
 inherit python_setuptools_build_meta
--=20
2.43.0


