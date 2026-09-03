Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E178C624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:45:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12331.1788453905628381160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oBMyOS00;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB0781596
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 09:45:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED25A3F673
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453904; bh=o8Isa21BqrMTRFl34hFG1ltXKJbmJ6yMBUM6sArbFls=;
	h=From:To:Subject:Date:From;
	b=oBMyOS00kv0K9pMO5KlFQT8fQsG8YL0gLUn+tJtMdPBvqjCibqyEJFX0MjrRWVQwI
	 e7NCkCItcE/CVrO2dIW0/TRNzrzDvKL/BNPySjbSx2e53V0q7X9aw4FgLCvFlAbP4i
	 nilhfpzIm9Ue2k8yuzWpVfqNvZj+hYj54wAVZvbc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] meta-python: remove redundant UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu,  3 Sep 2026 17:44:52 +0100
Message-ID: <20260903164454.152372-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 16:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129744

Remove redundant UPSTREAM_CHECK_PYPI_PACKAGE assignments of PYPI_PACKAGE,
which is the default value.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb     | 1 -
 .../recipes-devtools/python/python3-annotated-doc_0.0.5.bb      | 2 --
 .../recipes-devtools/python/python3-annotated-types_0.8.0.bb    | 2 --
 .../recipes-devtools/python/python3-apply-defaults_0.1.6.bb     | 1 -
 meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb     | 1 -
 .../recipes-devtools/python/python3-cached-property_2.0.1.bb    | 1 -
 meta-python/recipes-devtools/python/python3-can_4.6.1.bb        | 1 -
 meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb   | 2 --
 .../recipes-devtools/python/python3-charset-normalizer_3.4.9.bb | 1 -
 .../recipes-devtools/python/python3-cheetah_3.2.6.post1.bb      | 1 -
 .../recipes-devtools/python/python3-configargparse_1.7.5.bb     | 1 -
 .../recipes-devtools/python/python3-custom-inherit_2.4.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb  | 1 -
 .../recipes-devtools/python/python3-dirty-equals_0.11.bb        | 1 -
 .../recipes-devtools/python/python3-django-south_1.0.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-django.inc          | 1 -
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
 .../recipes-devtools/python/python3-email-validator_2.3.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb  | 1 -
 .../recipes-devtools/python/python3-fastapi-cli_0.0.27.bb       | 2 --
 .../recipes-devtools/python/python3-flask-babel_4.0.0.bb        | 1 -
 .../recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb  | 1 -
 meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb | 1 -
 .../recipes-devtools/python/python3-flask-httpauth_4.8.0.bb     | 1 -
 .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb     | 1 -
 .../recipes-devtools/python/python3-flask-jwt-extended_4.7.4.bb | 1 -
 meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb  | 1 -
 .../recipes-devtools/python/python3-flask-limiter_4.1.1.bb      | 1 -
 .../recipes-devtools/python/python3-flask-login_0.6.3.bb        | 1 -
 .../recipes-devtools/python/python3-flask-mail_0.10.0.bb        | 1 -
 .../recipes-devtools/python/python3-flask-marshmallow_1.5.0.bb  | 1 -
 .../recipes-devtools/python/python3-flask-migrate_4.1.0.bb      | 1 -
 .../recipes-devtools/python/python3-flask-pymongo_3.0.1.bb      | 1 -
 .../recipes-devtools/python/python3-flask-restful_0.3.10.bb     | 1 -
 .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb        | 1 -
 .../recipes-devtools/python/python3-flask-socketio_5.6.1.bb     | 1 -
 .../recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb   | 1 -
 .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb      | 1 -
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 1 -
 .../python/python3-flask-versioned_0.9.4-20101221.bb            | 1 -
 meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb  | 1 -
 .../recipes-devtools/python/python3-flask-xstatic_0.0.1.bb      | 1 -
 .../recipes-devtools/python/python3-google-auth_2.56.3.bb       | 1 -
 .../recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb   | 1 -
 .../recipes-devtools/python/python3-grpcio-reflection_1.76.0.bb | 1 -
 .../recipes-devtools/python/python3-grpcio-tools_1.76.0.bb      | 1 -
 .../python/python3-hatch-requirements-txt_0.4.1.bb              | 1 -
 meta-python/recipes-devtools/python/python3-icu_2.16.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb   | 1 -
 .../recipes-devtools/python/python3-importlib-metadata_9.0.0.bb | 1 -
 .../recipes-devtools/python/python3-inline-snapshot_0.35.4.bb   | 1 -
 meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb   | 1 -
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb         | 1 -
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb   | 1 -
 .../python/python3-keras-preprocessing_1.1.2.bb                 | 1 -
 .../recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb | 1 -
 .../recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb  | 1 -
 .../recipes-devtools/python/python3-mypy-extensions_1.1.0.bb    | 1 -
 .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb | 1 -
 .../recipes-devtools/python/python3-pastedeploy_3.1.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb  | 1 -
 .../recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb   | 1 -
 meta-python/recipes-devtools/python/python3-pybluez_0.23.bb     | 1 -
 .../recipes-devtools/python/python3-pydantic-core_2.46.4.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb     | 1 -
 .../recipes-devtools/python/python3-pyproject-api_1.11.0.bb     | 1 -
 .../recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb     | 1 -
 .../recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb    | 1 -
 meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb | 1 -
 .../recipes-devtools/python/python3-pytest-freezer_0.4.9.bb     | 1 -
 .../recipes-devtools/python/python3-pytest-html_4.2.0.bb        | 1 -
 .../recipes-devtools/python/python3-pytest-httpx_0.36.2.bb      | 1 -
 .../python/python3-pytest-lazy-fixtures_1.1.4.bb                | 1 -
 .../recipes-devtools/python/python3-pytest-mock_3.15.1.bb       | 1 -
 .../recipes-devtools/python/python3-pytest-picked_0.5.1.bb      | 1 -
 .../recipes-devtools/python/python3-pytest-socket_0.7.0.bb      | 1 -
 .../recipes-devtools/python/python3-pytest-timeout_2.5.0.bb     | 1 -
 .../recipes-devtools/python/python3-pytest-xdist_3.8.0.bb       | 1 -
 .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb      | 1 -
 .../recipes-devtools/python/python3-python-multipart_0.0.32.bb  | 1 -
 .../recipes-devtools/python/python3-requests-file_3.0.1.bb      | 1 -
 .../recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb  | 1 -
 .../recipes-devtools/python/python3-rich-argparse_1.8.0.bb      | 1 -
 .../recipes-devtools/python/python3-scikit-build-core_1.0.3.bb  | 1 -
 .../recipes-devtools/python/python3-scikit-build_0.19.1.bb      | 1 -
 .../recipes-devtools/python/python3-service-identity_26.1.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb      | 1 -
 meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb | 1 -
 meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb   | 1 -
 .../recipes-devtools/python/python3-time-machine_3.2.0.bb       | 1 -
 .../recipes-devtools/python/python3-tokenize-rt_6.2.0.bb        | 1 -
 .../python/python3-types-psutil_7.2.2.20260518.bb               | 1 -
 meta-python/recipes-devtools/python/python3-wand_0.7.2.bb       | 1 -
 .../recipes-devtools/python/python3-wheezy-template_3.2.5.bb    | 1 -
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb | 1 -
 .../python/python3-xstatic-font-awesome_6.2.1.2.bb              | 1 -
 meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb    | 1 -
 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb    | 1 -
 .../recipes-devtools/python/python3-zopeinterface_8.6.bb        | 1 -
 .../python3-rouge-score/python3-rouge-score_0.1.2.bb            | 1 -
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb     | 1 -
 .../python3-gpt-image/python3-gpt-image_0.9.1.bb                | 1 -
 .../recipes-extended/send2trash/python3-send2trash_2.1.0.bb     | 1 -
 117 files changed, 121 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_=
5.17.bb b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.1=
7.bb
index c16257beae..1be13146db 100644
--- a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
+++ b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c9ccd5f4ca5d=
0f5057c0e690a0153d"
 SRC_URI[sha256sum] =3D "cfac69638d80943aff9cc5f1466755dd0fef8aed0bb4bda4=
1b5eb045818ce6fc"
=20
 PYPI_PACKAGE =3D "pyro5"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-annotated-doc_0.=
0.5.bb b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.=
bb
index 28d05166f4..1f9164323f 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De36e91f278975b=
8bb76a769f32582892"
=20
 SRC_URI[sha256sum] =3D "c7e58ce09192557605d8bbd92836d7e1d520ac9580096042=
c0bfd197efacf1bb"
=20
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
-
 inherit pypi python_pdm
=20
 PYPI_PACKAGE =3D "annotated_doc"
diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_=
0.8.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.=
8.0.bb
index 3bc397ffa7..28941262b1 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.b=
b
@@ -9,8 +9,6 @@ SRC_URI[sha256sum] =3D "13b2beaad985e05e2d6407ee4c4f35590=
b11f8d693a258a561055cac8f
 S =3D "${UNPACKDIR}/annotated_types-${PV}"
 PYPI_PACKAGE =3D "annotated_types"
=20
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
-
 inherit pypi python_hatchling
=20
 RDEPENDS:${PN} =3D "python3-typing-extensions"
diff --git a/meta-python/recipes-devtools/python/python3-apply-defaults_0=
.1.6.bb b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.=
6.bb
index 1be20f179a..6bf61cfcd3 100644
--- a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc89120516900f96f4c60d35fdc4c3=
f15"
=20
 PYPI_PACKAGE =3D "apply_defaults"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "3773de3491b94c0fe44310f1a85888389cdc71e1544b343b=
ce0d2bd6991acea5"
=20
diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.b=
b b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
index 4d4982dd37..01739adf86 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D33b8d1ba459a2f=
a4d801acfd1d1b7ceb"
 SRC_URI[sha256sum] =3D "9e85ad35cfc6c938676817c7ae9a1000a7c72a34c71db0c6=
87136c460d12b85e"
=20
 PYPI_PACKAGE =3D "Arpeggio"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb =
b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
index f4cdab65b6..643208264c 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
@@ -5,7 +5,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D941ee9cd1609382f946352712a319=
b4b"
=20
 PYPI_PACKAGE =3D "brotli"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 CVE_PRODUCT =3D "brotli"
=20
diff --git a/meta-python/recipes-devtools/python/python3-cached-property_=
2.0.1.bb b/meta-python/recipes-devtools/python/python3-cached-property_2.=
0.1.bb
index 5c88a4e69e..e1ead95cf1 100644
--- a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.b=
b
@@ -6,7 +6,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb7ff60c4e14f58534201242803d8=
abc"
=20
 PYPI_PACKAGE =3D "cached_property"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222db=
d51cd91230897641"
=20
diff --git a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb b/m=
eta-python/recipes-devtools/python/python3-can_4.6.1.bb
index a2746511f8..4f7a8e9b0a 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De6a600fd5e=
1d9cbde2d983680233ad02"
 SRC_URI[sha256sum] =3D "290fea135d04b8504ebff33889cc6d301e2181a540991166=
09f940825ffe5005"
=20
 PYPI_PACKAGE =3D "python_can"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.b=
b b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
index 7b868fad5e..3175db905c 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
@@ -4,8 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48f8e9432d0dac5e0e7a18211a0ba=
cdb"
=20
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
-
 inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "579554887ffd189226774b87570f4a76db75cf0efcbaffca=
cd5e98b8ee877f61"
diff --git a/meta-python/recipes-devtools/python/python3-charset-normaliz=
er_3.4.9.bb b/meta-python/recipes-devtools/python/python3-charset-normali=
zer_3.4.9.bb
index 6df52a23d4..ae93b43d5c 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.=
9.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.=
9.bb
@@ -11,7 +11,6 @@ DEPENDS +=3D "python3-setuptools-scm-native python3-myp=
y-native"
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 PYPI_PACKAGE =3D "charset_normalizer"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.po=
st1.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.=
bb
index e7b404cd8f..252ec4cd89 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D15e13a4ed0e5880e3e55ec88b0921=
181"
=20
 PYPI_PACKAGE =3D "Cheetah3"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1=
.7.5.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.=
5.bb
index 49df56d75b..0bf629dd91 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda746463714cc3=
5999ed9a42339f2943"
 SRC_URI[sha256sum] =3D "e3f9a7bb6be34d66b2e3c4a2f58e3045f8dfae47b0dc039f=
87bcfaa0f193fb0f"
=20
 PYPI_PACKAGE =3D "configargparse"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2=
.4.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.=
1.bb
index a8aad44943..e7409f77e6 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Df910a85a4c3da51edf780f17a7=
608434"
=20
 PYPI_PACKAGE =3D "custom_inherit"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI +=3D "file://0001-versioneer.py-do-not-use-SafeConfigParser.patc=
h"
 SRC_URI[sha256sum] =3D "7052eb337bcce83551815264391cc4efc2bf70b295a3c52a=
ba64f1ab57c3a8a2"
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.=
bb b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
index a45a7fa920..c0c40b6b23 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
@@ -7,7 +7,6 @@ SRC_URI +=3D "file://0001-pyproject.toml-Remove-upper-ver=
sion-constraint-for-C.pat
 SRC_URI[sha256sum] =3D "e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df9=
58cee24bef86b8fe"
=20
 PYPI_PACKAGE =3D "dbus_fast"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_poetry_core cython
=20
diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.=
bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
index 10c1bfda04..9f6aa7ed7f 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94e750c96e5678=
8499b56c81de91431c"
 SRC_URI[sha256sum] =3D "f4eae26909332ada528c0a3549dda8d4f088f9b365153952=
a408e28023a626a5"
=20
 PYPI_PACKAGE =3D "dbus_next"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.1=
1.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
index 098c8ae0e6..daf8567f07 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
@@ -17,7 +17,6 @@ S =3D "${UNPACKDIR}/dirty_equals-${PV}"
 inherit pypi python_hatchling
=20
 PYPI_PACKAGE =3D "dirty_equals"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D " \
     python3-pytz \
diff --git a/meta-python/recipes-devtools/python/python3-django-south_1.0=
.2.bb b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
index 5b0f6c6f3b..152e57f105 100644
--- a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D17;endl=
ine=3D18;md5=3D2155d8ae21e7c231
 SRC_URI[sha256sum] =3D "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b=
381b4fbfef7392f4"
=20
 PYPI_PACKAGE =3D "South"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/met=
a-python/recipes-devtools/python/python3-django.inc
index 4191d4384f..bbf7e564e8 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -4,7 +4,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df09eb47206614a4954c51db8a9484=
0fa"
=20
 PYPI_PACKAGE =3D "django"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi ptest
=20
diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch=
_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_=
1.0.3.bb
index 227e97c46c..fa21531487 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.=
bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.=
bb
@@ -8,7 +8,6 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] =3D "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb=
32b273936da89604"
=20
 PYPI_PACKAGE =3D "dynamic_dispatch"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-email-validator_=
2.3.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.=
3.0.bb
index b745dfbba8..a9401ccf49 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.b=
b
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2890aee62bd2a4=
c3197e2059016a397e"
 SRC_URI[sha256sum] =3D "9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20e=
b10231ba60c54426"
=20
 PYPI_PACKAGE =3D "email_validator"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0=
.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
index 9439deef0a..1f119c6bdf 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
@@ -21,4 +21,3 @@ RDEPENDS:${PN} +=3D " \
 inherit setuptools3 pypi
=20
 PYPI_PACKAGE =3D "et_xmlfile"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
index e1459653ea..340e69ee6b 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b6a85414b7d05=
8ab1c58e11611c21b2"
 SRC_URI[sha256sum] =3D "178703fa98c07d8eecd5ae569e7e8d159e493ebb6eeb534a=
8fe973fbc4e40ef0"
=20
 PYPI_PACKAGE =3D "eth_abi"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.=
bb b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
index 36d787746e..0618814d52 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd3f53e7cc5bf80=
b16eff1f4a38c73182"
 SRC_URI[sha256sum] =3D "eb54b2f82dd300d3142c49a89da195e823f5e5284d432035=
93f87c67bad92a96"
=20
 PYPI_PACKAGE =3D "eth_utils"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.=
27.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
index 218137e5f8..02750e67e1 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
@@ -9,8 +9,6 @@ inherit pypi python_pdm
=20
 PYPI_PACKAGE =3D "fastapi_cli"
=20
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
-
 RDEPENDS:${PN} +=3D "\
     python3-difflib \
     python3-pydantic \
diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.=
0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
index 4923eb9d58..b445ec0e1c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51917f3e8e858f=
5ae295a7d0e2eb3cc9"
 SRC_URI[sha256sum] =3D "dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77a=
b50f4e9a2602a593"
=20
 PYPI_PACKAGE =3D "flask_babel"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_poetry_core
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_=
3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_=
3.3.7.1.bb
index 697c0b1850..e28e41c124 100644
--- a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1=
.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1=
.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Da03749709f061=
18a17349deb5a210619"
 SRC_URI[sha256sum] =3D "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72=
b5da4545ef123ac8"
=20
 PYPI_PACKAGE =3D "Flask-Bootstrap"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2=
.bb b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
index 6134b5ba10..b5a32faa6e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
@@ -8,7 +8,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3D13=
4f1026f0de92fd30e71976590a2868"
=20
 PYPI_PACKAGE =3D "flask_cors"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 CVE_PRODUCT =3D "flask-cors"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-httpauth_4=
.8.0.bb b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.=
0.bb
index f090f1d40f..cf0f73aef5 100644
--- a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
@@ -8,7 +8,6 @@ inherit pypi python_setuptools_build_meta
 DEPENDS +=3D "python3-wheel-native"
=20
 PYPI_PACKAGE =3D "Flask-HTTPAuth"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "66568a05bc73942c65f1e2201ae746295816dc009edd84b4=
82c44c758d75097a"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1=
.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.=
0.bb
index d653b8adbf..93ecf08453 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -5,7 +5,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Dbd59445a234a0c8250b39178d4=
2e3148"
=20
 PYPI_PACKAGE =3D "Flask-Jsonpify"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529b=
ce943817e2fedbfb"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extend=
ed_4.7.4.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-exten=
ded_4.7.4.bb
index de6231ac31..5d7412f1e2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.=
4.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.=
4.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9166295d7c482b=
9440bbb2b5c0fa43ac"
 inherit pypi setuptools3
=20
 PYPI_PACKAGE =3D "flask_jwt_extended"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "78fd0f460317facf3a0084a6457ffaf2f1dda9eefbd576f9=
4cea35b0eadd5531"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.=
bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
index 462d065a0e..f7044b314f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -5,7 +5,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dff00db41c47ec84b4567a8b3c246a=
959"
=20
 PYPI_PACKAGE =3D "Flask-JWT"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089=
cdc5380d323bd0ad"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-limiter_4.=
1.1.bb b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.=
bb
index 7c2e18ffba..884da17052 100644
--- a/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2455d5e574=
bc0fc489411ca45766ac78"
 SRC_URI[sha256sum] =3D "ca11608fc7eec43dcea606964ca07c3bd4ec1ae89043a0f6=
7f717899a4f48106"
=20
 PYPI_PACKAGE =3D "flask_limiter"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.=
3.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
index a50f82abc4..df22ca112c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8aa87a1cd9fa41=
d969ad32cfdac2c596"
 SRC_URI[sha256sum] =3D "5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75=
947bf9c147330333"
=20
 PYPI_PACKAGE =3D "Flask-Login"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.=
0.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
index 53d3333b95..a91a231b95 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D201f2b8011=
2efa61b78515bd54e9f138"
 SRC_URI[sha256sum] =3D "44083e7b02bbcce792209c06252f8569dd5a325a7aaa76af=
e7330422bd97881d"
=20
 PYPI_PACKAGE =3D "flask_mail"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_flit_core
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallo=
w_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallo=
w_1.5.0.bb
index a311730980..9739f31f6f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0=
.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D27586b20700d75=
44c06933afe56f7df4"
 inherit pypi python_flit_core
=20
 PYPI_PACKAGE =3D "flask_marshmallow"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "7c06b56e41647eccdb3cd57c25b109f19191b4c62509362b=
d64920cdf601a066"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.=
1.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.=
bb
index 7cdada071f..fc64d03d38 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b69377f79f3f4=
8c661701236d5a6a85"
 SRC_URI[sha256sum] =3D "1a336b06eb2c3ace005f5f2ded8641d534c18798d64061f6=
ff11f79e1434126d"
=20
 PYPI_PACKAGE =3D "flask_migrate"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_3.=
0.1.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.=
bb
index 7773e2830e..c760ee0219 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://flask_pymongo/wrappers.py;be=
ginline=3D1;endline=3D24;md5=3D
 SRC_URI[sha256sum] =3D "d225b51c21ceca2e670e6cca79b5c584ad17b96252b48e84=
e3b423ddb73304cc"
=20
 PYPI_PACKAGE =3D "flask_pymongo"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.=
3.10.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.1=
0.bb
index 0f97fbc259..8ea455c633 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
@@ -11,6 +11,5 @@ SRC_URI[sha256sum] =3D "fe4af2ef0027df8f9b4f797aba20c55=
66801b6ade995ac63b588abf1a5
 inherit pypi setuptools3
=20
 PYPI_PACKAGE =3D "Flask-RESTful"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} =3D "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.=
1.bb b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
index e74f315c4a..d518a1877f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D266adc7b91=
1b7c84b837bf77196e1ba6"
 SRC_URI[sha256sum] =3D "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2=
427186925cdc429f"
=20
 PYPI_PACKAGE =3D "Flask-Sijax"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5=
.6.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.=
1.bb
index 9e94d20748..edbe6eef08 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38cc2125490960=
4298ce763a6e4440a0"
 inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "flask_socketio"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "fe5bd995c3ed4da9a98f335d0d830fa1a19d84a64789f626=
5642a671fdacaeac"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy=
_3.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_=
3.1.1.bb
index a3fd62228a..c300d0b388 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.=
bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.=
bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dffeffa59c9=
0c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] =3D "e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3=
dc97dabfa36b8312"
=20
 PYPI_PACKAGE =3D "flask_sqlalchemy"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_flit_core
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.=
2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.=
bb
index fa2b321814..a51ead3c8a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Db712ac634b394=
69660c9bdfb8d03421c"
 SRC_URI[sha256sum] =3D "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e529302=
5810cf9d841ecb02"
=20
 PYPI_PACKAGE =3D "Flask-Uploads"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.1=
9.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 9ec9249339..951020dae9 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D97de97cd9d=
6e23c88129d884588ce71a"
 SRC_URI[sha256sum] =3D "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f6=
5a212e4a2c83b302"
=20
 PYPI_PACKAGE =3D "Flask-User"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 CVE_PRODUCT =3D "flask-user_project:flask-user"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_=
0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-ver=
sioned_0.9.4-20101221.bb
index 4e2d5e6095..3492d5efc8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-2=
0101221.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-2=
0101221.bb
@@ -4,7 +4,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://flaskext/versioned/__init__.py;md5=3Ddcb7d9=
7884bf08c256ff5795766bcd24"
=20
 PYPI_PACKAGE =3D "Flask-Versioned"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "516694dc860a1bc4f22ab60b324a85083c0150522be10928=
2a3bed681057fd34"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.=
bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
index 2c1f8af8e8..54c6c8904d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dd98d089889=
e14b227732d45dac3aacc4"
 SRC_URI[sha256sum] =3D "61d5dabc50c3df885c297dcbd80810443a5d632106c8a69c=
ab8ce740f0cdd7cc"
=20
 PYPI_PACKAGE =3D "flask_wtf"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.=
0.1.bb b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.=
bb
index b8d73c8170..c4cad466ad 100644
--- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D "226ea8e97065a9488b59bfe5c94af4c6e=
2ea70a25052e301fb231a1381
 SRC_URI +=3D "file://remove-pip-requires.patch"
=20
 PYPI_PACKAGE =3D "Flask-XStatic"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D "\
     python3-flask \
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.56=
.3.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
index c096c6ab36..c79f51f760 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
@@ -12,7 +12,6 @@ SRC_URI +=3D " \
 SRC_URI[sha256sum] =3D "40e229fc901f0a305b553050e5fce562d509bee0435be053=
abfa91582b51b90c"
=20
 PYPI_PACKAGE =3D "google_auth"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN}-ptest +=3D " \
         python3-aioresponses \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_=
1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1=
.76.0.bb
index 921a9a251a..0f75a7a084 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.=
bb
@@ -9,7 +9,6 @@ inherit pypi setuptools3
=20
 DEPENDS +=3D "python3-grpcio"
 PYPI_PACKAGE =3D "grpcio_channelz"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "2ab15ef7b2252a9ba31df500bbe295ce5310a8b01ea6f6d6=
7a17172d914a41a8"
=20
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflectio=
n_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflecti=
on_1.76.0.bb
index e03fd3e818..910d795553 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.=
0.bb
@@ -9,7 +9,6 @@ inherit pypi setuptools3
=20
 DEPENDS +=3D "python3-grpcio"
 PYPI_PACKAGE =3D "grpcio_reflection"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d5=
67f3d01b799decb1"
=20
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.7=
6.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.=
bb
index 29bf02f786..447ece8594 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D7145f7cdd263359b62
 inherit pypi setuptools3
=20
 PYPI_PACKAGE =3D "grpcio_tools"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 DEPENDS +=3D "python3-grpcio"
=20
diff --git a/meta-python/recipes-devtools/python/python3-hatch-requiremen=
ts-txt_0.4.1.bb b/meta-python/recipes-devtools/python/python3-hatch-requi=
rements-txt_0.4.1.bb
index d9026e4577..8b3218790e 100644
--- a/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_=
0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_=
0.4.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D58206c261591d2=
c13b00ab61cec32abe"
 SRC_URI[sha256sum] =3D "2c686e5758fd05bb55fa7d0c198fdd481f8d3aaa3c693260=
f5c0d74ce3547d20"
=20
 PYPI_PACKAGE =3D "hatch_requirements_txt"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb b/=
meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
index 95e4aa79af..a2ebc40758 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0724597863f158=
1ab01429e0423e779f"
 DEPENDS +=3D "icu"
=20
 PYPI_PACKAGE =3D "pyicu"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "006d51e24b5ec76df6ec2130f3dde269c51db8b8cfebb7d4=
5a427dde0d10aa52"
=20
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.b=
b b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
index 331dc0355c..37a3eea5d4 100644
--- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da61b9c5aec8796=
b64a6bf15d42605073"
 SRC_URI[sha256sum] =3D "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f31=
1254d6d0d92c6c7c"
=20
 PYPI_PACKAGE =3D "idna-ssl"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metada=
ta_9.0.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metad=
ata_9.0.0.bb
index 61f531a9c1..e1a7c1b590 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.=
0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daffe5a7d8b988c=
3db245c01075b29e17"
 inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "importlib_metadata"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "a4f57ab599e6a2e3016d7595cfd72eb4661a5106e787a95b=
cc90c7105b831efc"
=20
diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_=
0.35.4.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0=
.35.4.bb
index c4af98c9e0..d9eea29c1f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.=
bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.=
bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D "82432a58b7ea77a172515f5024cd26fde=
a8dc0f873c7a4251e4e0471a9
 inherit pypi python_hatchling
=20
 PYPI_PACKAGE =3D "inline_snapshot"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} =3D "python3-asttokens \
                   python3-black \
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.b=
b b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
index f442d2faa6..28a679bc99 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159=
876a0ba63099614381"
 SRC_URI[sha256sum] =3D "9aee407f92c7d51a2ce50f3b78291a9094e334e34bd68e82=
bf60020795fa2c94"
=20
 PYPI_PACKAGE =3D "inotify"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/me=
ta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 6a35e12ffe..631354dece 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -16,6 +16,5 @@ inherit pypi setuptools3_legacy ptest-python-pytest
 PTEST_PYTEST_DIR =3D "test"
=20
 PYPI_PACKAGE =3D "IPy"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils=
_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_=
0.2.0.bb
index b26a9ebd53..d880d88d2d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.=
bb
@@ -4,7 +4,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3Df7c3032c3ac398265224533a0a=
333a35"
=20
 PYPI_PACKAGE =3D "ipython_genutils"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e=
33785b887c628ba8"
=20
diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocess=
ing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preproce=
ssing_1.1.2.bb
index 8f382c99b4..f070d79d2b 100644
--- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1=
.2.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1=
.2.bb
@@ -9,7 +9,6 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] =3D "add82567c50c8bc648c14195bf544a5ce7c1f76761536956=
c3d2978970179ef3"
=20
 PYPI_PACKAGE =3D "Keras_Preprocessing"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 BBCLASSEXTEND =3D "native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-prox=
y_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-pro=
xy_1.12.0.bb
index 9ba6ef8b15..acd84efd21 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.=
0.bb
@@ -9,7 +9,6 @@ DEPENDS +=3D "python3-setuptools-scm-native"
 SRC_URI[sha256sum] =3D "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d=
51472c0c124c0c61"
=20
 PYPI_PACKAGE =3D "lazy_object_proxy"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.=
bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
index 1d37cd7187..e19ad56219 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
@@ -11,7 +11,6 @@ DEPENDS +=3D "python3-wheel-native"
 SRC_URI[sha256sum] =3D "963c264164d4374f549d57db09599e0ca458cea1bd05e169=
39897619be4e6dbd"
=20
 PYPI_PACKAGE =3D "luma.core"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-pillow \
diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0=
.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
index df30667775..2d0d88d7b9 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
@@ -13,7 +13,6 @@ DEPENDS +=3D "python3-wheel-native"
 SRC_URI[sha256sum] =3D "16925fe668f484803df0683add800b19e5dd7316a1d64eb0=
6ec2ae817473901e"
=20
 PYPI_PACKAGE =3D "luma_oled"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-luma-core \
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inlin=
e_0.2.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inlin=
e_0.2.2.bb
index b80fc10030..bc515c7b4a 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2=
.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2=
.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd4692a0eb42ca5=
4892399db2cb35e61e"
 SRC_URI[sha256sum] =3D "72f3fe8fce36b70d4a5b612f899090cd0401deddc4ea90e1=
572b9f4bfb058c79"
=20
 PYPI_PACKAGE =3D "matplotlib_inline"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_flit_core
=20
diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_=
1.1.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.=
1.0.bb
index baa76aa60c..33a1551e66 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fe3219e2470a78c0d1837019b8b4=
26e"
=20
 PYPI_PACKAGE =3D "mypy_extensions"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_flit_core
=20
diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7=
.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
index 7e389a5772..e483b98907 100644
--- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -8,6 +8,5 @@ SRC_URI[sha256sum] =3D "342dc97b9e88a6495bae22953ee6063f9=
1d2f03db6f727b62ba5c3092a
 inherit pypi setuptools3
=20
 PYPI_PACKAGE =3D "ninja_syntax"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6=
.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
index 0cffff3e82..979e25b47b 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
@@ -9,7 +9,6 @@ SRC_URI +=3D " \
 "
=20
 PYPI_PACKAGE =3D "parse_type"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi ptest python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.=
0.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index 1f6b36bd2b..e3405939c7 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://license.txt;md5=3D1798f29d55=
080c60365e6283cb49779c"
 inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "PasteDeploy"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed4=
18b6a7ff6a095a95"
=20
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
index 3431e6c7aa..0660bb4ba8 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
@@ -5,7 +5,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3d8df223c2614dbf1aabdc1ca23c=
c10"
=20
 PYPI_PACKAGE =3D "posix_ipc"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "6923232111329954a8349f7d99f212b6e96b5206e77fbd39=
aaf1b3cb4a5e9260"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.=
bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
index 5dbc8b203a..27a6a34f00 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da3d6c15f78=
59ae235a78f2758e5a48cf"
 DEPENDS =3D "python3-setuptools-scm-native"
=20
 PYPI_PACKAGE =3D "pure_eval"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0=
.4.2.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.=
2.bb
index e21bf4427f..3b3bc799a6 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D190f792539=
08c986e6cacf380c3a5f6d"
 SRC_URI[sha256sum] =3D "677091de870a80aae844b1ca6134f54652fa2c8c5a52aa39=
6440ac3106e941e6"
=20
 PYPI_PACKAGE =3D "pyasn1_modules"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi ptest-python-pytest python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.b=
b b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
index 4a80f66fd8..80c04d63e5 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7c3152b432b96d6dc4a1cb353=
97da9ec"
=20
 PYPI_PACKAGE =3D "PyAudio"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a49=
1f790a0895bd2f87"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb =
b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 8887ab27d2..188700be29 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -12,7 +12,6 @@ SRC_URI +=3D "file://0001-Use-Py_ssize_t-when-parsing-b=
uffer-length-fix-426-42.pat
 SRC_URI[sha256sum] =3D "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f=
55fcd7b8582e90de"
=20
 PYPI_PACKAGE =3D "PyBluez"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.=
46.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.=
4.bb
index 9bfbb701e4..bc9f0e2ad3 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
@@ -123,7 +123,6 @@ DEPENDS =3D "python3-maturin-native python3-typing-ex=
tensions"
 inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pyte=
st
=20
 PYPI_PACKAGE =3D "pydantic_core"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D " \
     python3-compression \
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.=
bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
index f57ea97fc5..7ec799e086 100644
--- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
@@ -3,7 +3,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84ddcef430b7c44caa22b2ff4b37a=
3df"
=20
 PYPI_PACKAGE =3D "pyFirmata"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} =3D "\
     python3-pyserial \
diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.b=
b b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
index 8c7b1c0f72..49f4f7da8b 100644
--- a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D "c5f36e8ef0ed3b487a9242ce34c19f968=
4e418a5bbffd5d367dc1d1604
=20
 PYPI_PACKAGE =3D "PyLyrics"
 PYPI_PACKAGE_EXT =3D "zip"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
index 190c80d88f..d062ebe561 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D528175c84163=
bb800d23ad835c7fa0fc"
 SRC_URI[sha256sum] =3D "6c7b17ca686988104d7426c27895b455cdeea3e9d3ceb127=
0f0c3704fead8c33"
=20
 PYPI_PACKAGE =3D "pymysql"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb =
b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
index d72d2be2f1..cc945666a1 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.6.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cc789b082b3d9=
7e1ccc5261f8594d3f"
 SRC_URI[sha256sum] =3D "018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bc=
f018f1ed8436811c"
=20
 PYPI_PACKAGE =3D "pynacl"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.=
11.0.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.=
0.bb
index 4df56aa8df..d0e3c90ac8 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11610a9d8fd956=
49cf8159be12b98cb7"
 SRC_URI[sha256sum] =3D "b8807d85a293e6c9f133e6575946fed45f1d42b22d58c780=
b33aa2421a799549"
=20
 PYPI_PACKAGE =3D "pyproject_api"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
 inherit pypi python_hatchling
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1=
.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.=
0.bb
index 7f237932a7..ad3b2e2d2b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] =3D "c6c0d2259945122819f171a32ecea2c34=
9ead889ee28176caaf4921434
 inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "pytest_asyncio"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_=
5.0.3.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.=
0.3.bb
index a1691024ad..9ed6659a77 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
@@ -9,6 +9,5 @@ SRC_URI[sha256sum] =3D "91afef90e6a96b013495e4702ef5d6358=
614a449e71008cdc194ef6687
 inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "pytest_codspeed"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} =3D "python3-cffi python3-filelock python3-pytest python3=
-rich python3-statistics"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
index 5e76726909..7673a8c569 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
@@ -13,6 +13,5 @@ DEPENDS +=3D "python3-setuptools-scm-native python3-hat=
ch-fancy-pypi-readme-native
 RDEPENDS:${PN} +=3D "python3-coverage python3-pytest python3-pluggy"
=20
 PYPI_PACKAGE =3D "pytest_cov"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
index 3ffe73b864..86fd2c9418 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] =3D "0c1dc1101fb8d3ab3611e8f8d657ba0=
6c3c0c167fc85c90457e5b27f25
 inherit pypi python_hatchling ptest-python-pytest
=20
 PYPI_PACKAGE =3D "pytest_env"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} =3D "python3-pytest python3-tomli"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-freezer_0=
.4.9.bb b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.=
9.bb
index 212be0ef8b..cd09a5c325 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
@@ -13,4 +13,3 @@ RDEPENDS:${PN} =3D "\
 "
=20
 PYPI_PACKAGE =3D "pytest_freezer"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.2.=
0.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
index ea760ff29a..0889417ad0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d425c8f3157db=
f212db2ec53d9e5132"
 SRC_URI[sha256sum] =3D "b6a88cba507500d8709959201e2e757d3941e859fd17cfd4=
ed87b16fc0c67912"
=20
 PYPI_PACKAGE =3D "pytest_html"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.3=
6.2.bb b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.=
bb
index ac1a53d224..2309a96fa5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
@@ -21,4 +21,3 @@ RDEPENDS:${PN}-ptest +=3D "\
 "
=20
 PYPI_PACKAGE =3D "pytest_httpx"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixt=
ures_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-f=
ixtures_1.1.4.bb
index 83b8321df2..64aa5d3ce1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.=
1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.=
1.4.bb
@@ -17,6 +17,5 @@ SRC_URI[sha256sum] =3D "c494b52d798890033d64b28687a4d52=
807c8b0f606d56316e139df0cbe
 inherit pypi python_poetry_core
=20
 PYPI_PACKAGE =3D "pytest_lazy_fixtures"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} =3D "python3-pytest"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15=
.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
index 835ff0ab3a..5ed97e436d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
@@ -13,7 +13,6 @@ SRC_URI[sha256sum] =3D "1849a238f6f396da19762269de72cb1=
814ab44416fa73a8686deac10b0
 inherit pypi python_setuptools_build_meta ptest
=20
 PYPI_PACKAGE =3D "pytest_mock"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked_0.=
5.1.bb b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.=
bb
index c7c2183337..449af2623e 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
@@ -17,4 +17,3 @@ RDEPENDS:${PN} +=3D "\
 "
=20
 PYPI_PACKAGE =3D "pytest_picked"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-socket_0.=
7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.=
bb
index feb2f6fbb5..86b03724a0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
@@ -12,4 +12,3 @@ RDEPENDS:${PN} =3D "python3-pytest"
 BBCLASSEXTEND =3D "native nativesdk"
=20
 PYPI_PACKAGE =3D "pytest_socket"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2=
.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.=
0.bb
index 40c0a2085a..8990e29bba 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8048cd156eda3=
df2e7f111b0ae9ceff"
 SRC_URI[sha256sum] =3D "68c9d82dfe95fa65712e107010c9344e7d8b4afe8c975a7b=
e0d273d939583a93"
=20
 PYPI_PACKAGE =3D "pytest_timeout"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8=
.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
index 3527539f6f..7b340e8920 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
@@ -15,4 +15,3 @@ RDEPENDS:${PN} +=3D " \
 "
=20
 PYPI_PACKAGE =3D "pytest_xdist"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.=
2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.=
bb
index 22b976dd9c..b16d3c766b 100644
--- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
@@ -16,7 +16,6 @@ PACKAGECONFIG:append =3D "${@bb.utils.contains('PTEST_E=
NABLED', '1', ' cli', '', d
 PACKAGECONFIG[cli] =3D ",,,python3-click"
=20
 PYPI_PACKAGE =3D "python_dotenv"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN}-ptest +=3D "\
     coreutils \
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart=
_0.0.32.bb b/meta-python/recipes-devtools/python/python3-python-multipart=
_0.0.32.bb
index 9b73b9470d..db1a9e0415 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32=
.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32=
.bb
@@ -7,7 +7,6 @@ SRC_URI[sha256sum] =3D "be54b7f3fa167bb83e4fcd936b887b708=
f4e57fe75911c02aebf53efaf
 inherit pypi python_hatchling ptest-python-pytest
=20
 PYPI_PACKAGE =3D "python_multipart"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
 CVE_PRODUCT =3D "python-multipart"
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_3.=
0.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.=
bb
index f796c8ef78..16f04a4cad 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9cc728d6087e43=
796227b0a31422de6b"
 SRC_URI[sha256sum] =3D "f14243d7796c588f3521bd423c5dea2ee4cc730e54a3cac9=
574d78aca1272576"
=20
 PYPI_PACKAGE =3D "requests_file"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validato=
r_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validato=
r_0.1.1.bb
index 9ebc34eabc..28904ef18d 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1=
.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1=
.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da21b13b5a996f0=
8f7e0b088aa38ce9c6"
 SRC_URI[sha256sum] =3D "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449=
b145d533b240d055"
=20
 PYPI_PACKAGE =3D "rfc3986_validator"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.=
8.0.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.=
bb
index 2da95ab053..fa9761b72b 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D06f5c372171ce02f7e6a18f5f57f0=
b69"
=20
 PYPI_PACKAGE =3D "rich_argparse"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "679df3d832fa94ad6e4bdb07ded088cd7ea2dddc58ae9b2b=
46346a40b06cbc0c"
=20
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-cor=
e_1.0.3.bb b/meta-python/recipes-devtools/python/python3-scikit-build-cor=
e_1.0.3.bb
index 4a28b119b4..ff5e4c0da0 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3=
.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3=
.bb
@@ -3,7 +3,6 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b4e748e5f102e31c9390dcd6fa66=
f09"
=20
 PYPI_PACKAGE =3D "scikit_build_core"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 DEPENDS =3D "python3-hatch-vcs-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.1=
9.1.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.=
bb
index aff4ba4b68..f10e27a049 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c96d2b08b3cec=
6d3c67fb864d1fd8cc"
 DEPENDS =3D "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-na=
tive"
=20
 PYPI_PACKAGE =3D "scikit_build"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-service-identity=
_26.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity=
_26.1.0.bb
index ed855c4027..a603cb247b 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_26.1.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_26.1.0=
.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D "6358c52882c96e66ac4a55eb3a72c7dd4=
a70763f8cc6fa4e70abde2656
 inherit pypi python_hatchling ptest-python-pytest
=20
 PYPI_PACKAGE =3D "service_identity"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 DEPENDS +=3D "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-n=
ative"
=20
diff --git a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb b=
/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
index 4d21650059..dcb9e64d61 100644
--- a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
@@ -7,6 +7,5 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D16e213d756=
41a392478df50cf0841903"
 SRC_URI[sha256sum] =3D "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5=
f91a0075c6be7c0d"
=20
 PYPI_PACKAGE =3D "Sijax"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3=
.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
index 8adba7e8a4..c5667d34b7 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da3d6c15f78=
59ae235a78f2758e5a48cf"
 DEPENDS =3D "python3-setuptools-scm-native"
=20
 PYPI_PACKAGE =3D "stack_data"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.b=
b b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
index abe5c03d8e..cbe7fcc215 100644
--- a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
@@ -10,6 +10,5 @@ DEPENDS =3D "python3-pytest-runner-native"
 SRC_URI[sha256sum] =3D "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeac=
f3bcd80875c82eff"
=20
 PYPI_PACKAGE =3D "StrEnum"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-time-machine_3.2=
.0.bb b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
index e898a43f99..450214a7a4 100644
--- a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
@@ -9,7 +9,6 @@ PYPI_SRC_URI =3D "git://github.com/adamchainz/time-machin=
e;protocol=3Dhttps;branch=3Dm
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 PYPI_PACKAGE =3D "time_machine"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D "\
     python3-tzdata \
diff --git a/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.=
0.bb b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
index 0f5a1b34d3..ec80ef8ed6 100644
--- a/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
@@ -11,7 +11,6 @@ inherit pypi setuptools3 ptest-python-pytest
 RDEPENDS:${PN} +=3D "python3-core"
=20
 PYPI_PACKAGE =3D "tokenize_rt"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/testing/resources
diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2=
.2.20260518.bb b/meta-python/recipes-devtools/python/python3-types-psutil=
_7.2.2.20260518.bb
index ba8051ce5c..f7f3f8e758 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.2026=
0518.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.2026=
0518.bb
@@ -4,7 +4,6 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dec038232ab86edd7354b091c54e19=
0e2"
=20
 PYPI_PACKAGE =3D "types_psutil"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb b/=
meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
index 305aeaeb11..2eeb2cb9f9 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
@@ -11,7 +11,6 @@ SRC_URI[sha256sum] =3D "0387fd08848d00cadd1d885fcb19a17=
dd4250df2029e5338b6b668b7fe
 inherit pypi python_setuptools_build_meta ptest
=20
 PYPI_PACKAGE =3D "wand"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 FILES:${PN}-doc +=3D "${datadir}/README.rst"
=20
diff --git a/meta-python/recipes-devtools/python/python3-wheezy-template_=
3.2.5.bb b/meta-python/recipes-devtools/python/python3-wheezy-template_3.=
2.5.bb
index 612b3ff106..fab0d5106a 100644
--- a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.b=
b
+++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.b=
b
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa10554c46b94944529c6a886cf85=
631"
=20
 PYPI_PACKAGE =3D "wheezy_template"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392aa17bea0d=
885dcba7356d0867"
=20
diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0=
.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index 68ff6c1863..17149bbadb 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] =3D "3ad0f40a696763bb0f4d4dec5b51f6b53=
ccfeb7c16ebb5897349303045
 SRC_URI +=3D "file://0001-cli-drop-the-second-argument-from-click.argume=
nt-dec.patch"
=20
 PYPI_PACKAGE =3D "wpa_supplicant"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1=
.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
index a1fd09af49..eccdc83ca2 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da4bab8df34=
a9a138b4e0ca56b8559a05"
 inherit pypi setuptools3
=20
 PYPI_PACKAGE =3D "XlsxWriter"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-crypt \
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awe=
some_6.2.1.2.bb b/meta-python/recipes-devtools/python/python3-xstatic-fon=
t-awesome_6.2.1.2.bb
index b8c02dc40b..97e6dcd66f 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.=
2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.=
2.1.2.bb
@@ -5,7 +5,6 @@ LICENSE =3D "CC-BY-4.0 AND MIT AND OFL-1.0"
 LIC_FILES_CHKSUM =3D "file://xstatic/pkg/font_awesome/data/LICENSE.txt;m=
d5=3D57f9201afe70f877988912a7b233de47"
=20
 PYPI_PACKAGE =3D "xstatic_font_awesome"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "9f3cb2f038fad7d352722375d3f25af346da9ee093ed9dc2=
c8c46bd911ab1971"
=20
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb=
 b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
index bf542aba5a..ed73aa48b0 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
@@ -5,7 +5,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D1418684272f85f400cebf1b1a2=
55c5cd"
=20
 PYPI_PACKAGE =3D "XStatic"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI +=3D "file://0001-remove-pkg_resources-import.patch"
 SRC_URI[sha256sum] =3D "402544cc9e179489441054f09c807804e115ea246907de87=
c0355fb4f5a31268"
diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb=
 b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
index f03ab22d24..4d914c63e9 100644
--- a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
@@ -6,6 +6,5 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D72092419572155ddc2
 SRC_URI[sha256sum] =3D "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda69=
55f96bb9b91e67cd"
=20
 PYPI_PACKAGE =3D "zope.event"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.=
6.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
index f79444c7ba..370e07889f 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
@@ -3,7 +3,6 @@ LICENSE =3D "ZPL-2.1"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27=
a6966b2"
=20
 PYPI_PACKAGE =3D "zope_interface"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python3-rouge-score/python3-rou=
ge-score_0.1.2.bb b/meta-python/recipes-devtools/python3-rouge-score/pyth=
on3-rouge-score_0.1.2.bb
index 6d07f5451f..722956a8e2 100644
--- a/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e_0.1.2.bb
+++ b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e_0.1.2.bb
@@ -15,6 +15,5 @@ RDEPENDS:${PN} =3D "\
 inherit setuptools3 pypi
=20
 PYPI_PACKAGE =3D "rouge_score"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "c7d4da2683e68c9abf0135ef915d63a46643666f848e558a=
1b9f7ead17ff0f04"
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4=
.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.=
5.bb
index e1d8ed06e1..5305093b2f 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "python3-attrdict3-native python3-six-native =
wxwidgets-native \
            "
=20
 PYPI_PACKAGE =3D "wxpython"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI +=3D "file://add-back-option-build-base.patch \
            file://wxgtk-fixup-build-scripts.patch \
diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-i=
mage_0.9.1.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gp=
t-image_0.9.1.bb
index 4255de4199..b3c89e5588 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.=
9.1.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.=
9.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd91d608dc8f123=
34a889700389229b7b"
 DEPENDS +=3D "python3-pip"
=20
 PYPI_PACKAGE =3D "gpt_image"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "07363562ec1cf5b50319ad0389486b576ed43c4682a16a82=
86822af9fd1f4594"
=20
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_2=
.1.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.=
0.bb
index 147603a45b..746a41b2c4 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
@@ -8,7 +8,6 @@ SRC_URI +=3D "file://run-ptest"
 SRC_URI[sha256sum] =3D "1c72b39f09457db3c05ce1d19158c2cbef4c32b8bedd02c1=
55e49282b7ea7459"
=20
 PYPI_PACKAGE =3D "send2trash"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 RDEPENDS:${PN} +=3D "\
     python3-io \
--=20
2.43.0


