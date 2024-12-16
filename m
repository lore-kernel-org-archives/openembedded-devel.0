Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F7BE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 15:55:30 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.59803.1734364525112375968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 07:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e565708beso1493516a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 07:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364523; x=1734969323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KX+Mj/rq65p5fsMpsGzey7o0Nm2NdWMbDCNHDX2IsbM=;
        b=p9mBPQTe+PQtlYj18jzfAGCZuVKDHvT8z2JbyBFXzyYh+oBRWXG9L0lOFLvwvyNnmt
         LFR/MJpYKBLTQvzKkvQ4ZuGThyZEdvrjrfH47o5LrJ++mbu9g2QHtL7bo/XgR3fKjl6J
         aoFJAybHF8TXdyaOFiMO2gaOEA4sMbPCTWvGa5kgC60Lq5YYg6qTC1wMfrS5qQMs+hJC
         okZAMfFoxxzoUtzCiMXW+IIFtq+wFxpHQj6bU1aMb+Ifu5mAWL7r6KpslRXjva5FrILn
         UsPsMzwXhus5uf1ylDEIkZLLJIIe1uLr1b/0UeYgplWCY/1oYJIPot/fc+Hst7uVe4xd
         SfdQ==
X-Gm-Message-State: AOJu0YzyhkIQ6LUarQj9ZqFeULPM5tnjV7poBdcUElYW+guVCAULFxsc
	TVwsw8mNNuqCJbDBtl8H0kYfJa2JF8J0HyyLys6dSDGaHejTkNQksg6PREsp
X-Gm-Gg: ASbGncsEDg9MwcMqwXlJKykzZ/aXw9BWM+mOm9Oaqe8vdw7GxwRjvb3p8kVHuPVXHdu
	0slPrb+ATHVFoGDFYZJjA1TK589D8JHXUqRvIXCok8B9hezOOSwPnfaSnX+g4xD0/kK5G6PGkN3
	jq4T8M6pIiqnKcelTx7gYwRW2VXngu++Bm8XXQFLwjcgvGIbpe5fx0uKLZcrF6vRRgK4XwWu1QO
	6n1bCMEoyHor7nLpobwfwFtrfmyezKXKxkllRKuWq+/cfybct30kXrnmpPVeoUWqepGGXsgebD1
	q6NihGzroSE+uOzAf59R87rnAQ==
X-Google-Smtp-Source: AGHT+IGTL0BzvjvObRnNYVhb6RsBf7GP/1OMEOnPGqasjr/FkZiyaAuwPWb1O3c31o8b0TjcX99p+g==
X-Received: by 2002:a05:6830:43a0:b0:71d:fdce:79eb with SMTP id 46e09a7af769-71f07474f26mr21336a34.30.1734364522572;
        Mon, 16 Dec 2024 07:55:22 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71e484cfd9dsm1426759a34.65.2024.12.16.07.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:55:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-*: Update recipes to correctly check the upstream packages
Date: Mon, 16 Dec 2024 15:55:14 +0000
Message-Id: <20241216155514.2586748-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 15:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114337

With the upstream check migrated to the simple repo API, a number of the
recipes required updates to:
1. Remove outdated UPSTREAM_CHECK_REGEX checks
2. Add recipe specific UPSTREAM_CHECK_PYPI_PACKAGE definitions for
   packages that use '_', CamelCase, or other deviations from PEP625 in
   the source archive

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb  | 1 +
 .../recipes-devtools/python/python3-annotated-types_0.7.0.bb | 2 ++
 .../recipes-devtools/python/python3-apply-defaults_0.1.6.bb  | 1 +
 .../recipes-devtools/python/python3-arpeggio_2.0.2.bb        | 2 ++
 meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb  | 1 +
 .../recipes-devtools/python/python3-cachecontrol_0.14.1.bb   | 3 ---
 meta-python/recipes-devtools/python/python3-can_4.4.2.bb     | 1 +
 .../recipes-devtools/python/python3-cerberus_1.3.5.bb        | 2 ++
 .../python/python3-charset-normalizer_3.4.0.bb               | 1 +
 .../recipes-devtools/python/python3-cheetah_3.2.6.post1.bb   | 2 ++
 .../recipes-devtools/python/python3-configargparse_1.7.bb    | 1 +
 .../recipes-devtools/python/python3-custom-inherit_2.4.1.bb  | 1 +
 .../recipes-devtools/python/python3-dbus-fast_2.24.4.bb      | 1 +
 .../recipes-devtools/python/python3-dbus-next_0.2.3.bb       | 1 +
 .../recipes-devtools/python/python3-dirty-equals_0.8.0.bb    | 1 +
 .../recipes-devtools/python/python3-django-south_1.0.2.bb    | 2 ++
 meta-python/recipes-devtools/python/python3-django.inc       | 4 ++--
 .../python/python3-dynamic-dispatch_1.0.3.bb                 | 4 +---
 .../recipes-devtools/python/python3-email-validator_2.2.0.bb | 1 +
 .../recipes-devtools/python/python3-et-xmlfile_2.0.0.bb      | 1 +
 meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb | 1 +
 .../recipes-devtools/python/python3-eth-utils_5.0.0.bb       | 1 +
 .../recipes-devtools/python/python3-flask-babel_4.0.0.bb     | 1 +
 .../python/python3-flask-bootstrap_3.3.7.1.bb                | 1 +
 .../recipes-devtools/python/python3-flask-cors_4.0.0.bb      | 1 +
 .../recipes-devtools/python/python3-flask-httpauth_4.8.0.bb  | 1 +
 .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb  | 1 +
 .../python/python3-flask-jwt-extended_4.6.0.bb               | 1 +
 .../recipes-devtools/python/python3-flask-jwt_0.3.2.bb       | 1 +
 .../recipes-devtools/python/python3-flask-login_0.6.3.bb     | 1 +
 .../recipes-devtools/python/python3-flask-mail_0.9.1.bb      | 1 +
 .../python/python3-flask-marshmallow_1.2.1.bb                | 1 +
 .../recipes-devtools/python/python3-flask-migrate_4.0.7.bb   | 1 +
 .../recipes-devtools/python/python3-flask-pymongo_2.3.0.bb   | 1 +
 .../recipes-devtools/python/python3-flask-restful_0.3.10.bb  | 1 +
 .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb     | 1 +
 .../recipes-devtools/python/python3-flask-socketio_5.3.6.bb  | 1 +
 .../python/python3-flask-sqlalchemy_3.1.1.bb                 | 3 +--
 .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb   | 1 +
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb     | 1 +
 .../python/python3-flask-versioned_0.9.4-20101221.bb         | 2 ++
 .../recipes-devtools/python/python3-flask-wtf_1.2.2.bb       | 3 +--
 .../recipes-devtools/python/python3-flask-xstatic_0.0.1.bb   | 1 +
 meta-python/recipes-devtools/python/python3-flask_3.1.0.bb   | 3 ---
 .../recipes-devtools/python/python3-google-auth_2.36.0.bb    | 1 +
 .../python/python3-grpcio-channelz_1.67.1.bb                 | 1 +
 .../python/python3-grpcio-reflection_1.67.1.bb               | 1 +
 .../recipes-devtools/python/python3-grpcio-tools_1.67.1.bb   | 1 +
 .../python/python3-hatch-requirements-txt_0.4.1.bb           | 1 +
 meta-python/recipes-devtools/python/python3-icu_2.14.bb      | 1 +
 .../recipes-devtools/python/python3-idna-ssl_1.1.0.bb        | 5 ++---
 .../python/python3-importlib-metadata_8.4.0.bb               | 2 +-
 .../python/python3-inline-snapshot_0.14.0.bb                 | 1 +
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb      | 1 +
 .../python/python3-ipython-genutils_0.2.0.bb                 | 4 +---
 .../python/python3-keras-preprocessing_1.1.2.bb              | 2 +-
 .../recipes-devtools/python/python3-luma-core_2.4.2.bb       | 1 +
 .../recipes-devtools/python/python3-luma-oled_3.14.0.bb      | 1 +
 .../python/python3-matplotlib-inline_0.1.7.bb                | 2 ++
 .../recipes-devtools/python/python3-mypy-extensions_1.0.0.bb | 1 +
 .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb    | 3 +--
 .../recipes-devtools/python/python3-parse-type_0.6.3.bb      | 1 +
 .../recipes-devtools/python/python3-pastedeploy_3.1.0.bb     | 1 +
 .../recipes-devtools/python/python3-pdm-backend_2.4.2.bb     | 1 +
 .../python/python3-pdm-build-locked_0.3.4.bb                 | 1 +
 meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb | 2 --
 .../recipes-devtools/python/python3-posix-ipc_1.1.1.bb       | 1 +
 .../recipes-devtools/python/python3-protobuf_4.25.3.bb       | 2 --
 .../recipes-devtools/python/python3-ptyprocess_0.7.0.bb      | 2 --
 .../recipes-devtools/python/python3-pure-eval_0.2.3.bb       | 1 +
 .../recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb  | 1 +
 .../recipes-devtools/python/python3-pyaudio_0.2.14.bb        | 1 +
 meta-python/recipes-devtools/python/python3-pybluez_0.23.bb  | 1 +
 .../recipes-devtools/python/python3-pychromecast_14.0.5.bb   | 1 +
 .../recipes-devtools/python/python3-pydantic-core_2.27.1.bb  | 1 +
 .../recipes-devtools/python/python3-pyfirmata_1.1.0.bb       | 2 ++
 .../recipes-devtools/python/python3-pyhamcrest_2.1.0.bb      | 3 ---
 .../recipes-devtools/python/python3-pylyrics_1.1.0.bb        | 1 +
 meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb | 5 ++---
 meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb  | 1 +
 .../recipes-devtools/python/python3-pyproject-api_1.7.2.bb   | 1 +
 .../recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb | 2 ++
 .../recipes-devtools/python/python3-pytest-freezer_0.4.8.bb  | 1 +
 .../recipes-devtools/python/python3-pytest-html_4.1.1.bb     | 1 +
 .../python/python3-pytest-lazy-fixtures_1.1.1.bb             | 1 +
 .../recipes-devtools/python/python3-pytest-socket_0.7.0.bb   | 1 +
 .../python/python3-python-multipart_0.0.12.bb                | 1 +
 .../recipes-devtools/python/python3-requests-file_2.1.0.bb   | 1 +
 .../python/python3-rfc3986-validator_0.1.1.bb                | 2 +-
 .../python/python3-scikit-build-core_0.10.7.bb               | 1 +
 .../recipes-devtools/python/python3-scikit-build_0.18.1.bb   | 1 +
 .../python/python3-service-identity_24.2.0.bb                | 1 +
 meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb   | 2 ++
 .../recipes-devtools/python/python3-stack-data_0.6.3.bb      | 1 +
 .../recipes-devtools/python/python3-strenum_0.4.15.bb        | 1 +
 meta-python/recipes-devtools/python/python3-wand_0.6.13.bb   | 1 +
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb    | 3 +--
 meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb | 3 ---
 .../recipes-devtools/python/python3-xlsxwriter_3.2.0.bb      | 1 +
 .../python/python3-xstatic-font-awesome_6.2.1.1.bb           | 1 +
 meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb | 1 +
 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb | 1 +
 .../recipes-devtools/python/python3-zopeinterface_7.1.1.bb   | 1 +
 .../python3-rouge-score/python3-rouge-score_0.1.2.bb         | 1 +
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb  | 1 +
 .../recipes-extended/send2trash/python3-send2trash_1.8.3.bb  | 1 +
 106 files changed, 112 insertions(+), 43 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
index c49e67c91..9f5e6d6db 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
 SRC_URI[sha256sum] = "511f5b0804e92dd77dc33adf9c947787e3f9e9c5a96b12162f0557a7c4ce21fb"
 
 PYPI_PACKAGE = "Pyro4"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
index 53552d0b7..7b1bb11a1 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d7907235434083
 S = "${WORKDIR}/annotated_types-${PV}"
 PYPI_PACKAGE = "annotated_types"
 
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "python3-typing-extensions"
diff --git a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
index 6bf61cfcd..1be20f179 100644
--- a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
 PYPI_PACKAGE = "apply_defaults"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "3773de3491b94c0fe44310f1a85888389cdc71e1544b343bce0d2bd6991acea5"
 
diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
index 3130e2cb9..85bb066be 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 SRC_URI[sha256sum] = "c790b2b06e226d2dd468e4fbfb5b7f506cec66416031fde1441cf1de2a0ba700"
 
 PYPI_PACKAGE = "Arpeggio"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 # setup.py of Arpeggio needs this.
diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
index 542c8640d..2f7016a54 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 PYPI_PACKAGE = "Brotli"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
 
diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
index 93f8c9f71..c06c090e7 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
@@ -7,9 +7,6 @@ SRC_URI[sha256sum] = "06ef916a1e4eb7dba9948cdfc9c76e749db2e02104a9a1277e8b642591
 
 inherit pypi python_poetry_core
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/CacheControl/"
-UPSTREAM_CHECK_REGEX = "/CacheControl/(?P<pver>(\d+[\.\-_]*)+)"
-
 RDEPENDS:${PN} += "\
     python3-crypt \
     python3-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-can_4.4.2.bb b/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
index 3781737e1..31190a9f1 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI[sha256sum] = "1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5"
 
 PYPI_PACKAGE = "python_can"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
index eb3453aee..7d985fa7a 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
 # The PyPI package uses a capital letter so we have to specify this explicitly
 PYPI_PACKAGE = "Cerberus"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi python_poetry_core
 
 SRC_URI[sha256sum] = "81011e10266ef71b6ec6d50e60171258a5b134d69f8fb387d16e4936d0d47642"
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
index 10f199db4..89d73c08f 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "charset_normalizer"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += " \
 	python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
index 448772960..6cba6b3ad 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
@@ -4,6 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181"
 
 PYPI_PACKAGE = "Cheetah3"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "python3-pickle python3-pprint"
diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
index 1c49d891d..4d18b6392 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 SRC_URI[sha256sum] = "e7067471884de5478c58a511e529f0f9bd1c66bfef1dea90935438d6c23306d1"
 
 PYPI_PACKAGE = "ConfigArgParse"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
index e7409f77e..a8aad4494 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434"
 
 PYPI_PACKAGE = "custom_inherit"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI += "file://0001-versioneer.py-do-not-use-SafeConfigParser.patch"
 SRC_URI[sha256sum] = "7052eb337bcce83551815264391cc4efc2bf70b295a3c52aba64f1ab57c3a8a2"
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
index 48f7d2df5..0652c186d 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 SRC_URI[sha256sum] = "58f97e8342d6cd11ebb2c8ac959c5bb342eb83e29180528690b323a5a5def41c"
 
 PYPI_PACKAGE = "dbus_fast"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_poetry_core cython
 
diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
index 9f6aa7ed7..10c1bfda0 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
 SRC_URI[sha256sum] = "f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5"
 
 PYPI_PACKAGE = "dbus_next"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
index 584d787a7..8be8e5f79 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
@@ -17,6 +17,7 @@ S = "${WORKDIR}/dirty_equals-${PV}"
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "dirty_equals"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += " \
     python3-pytz \
diff --git a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
index 8237cf034..5b0f6c6f3 100644
--- a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c231
 SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
 
 PYPI_PACKAGE = "South"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index d9ab3fd21..6ff9192ca 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -4,9 +4,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
 PYPI_PACKAGE = "Django"
-inherit pypi
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
+inherit pypi
 
 FILES:${PN} += "${datadir}/django"
 
diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index eeb013d4f..227e97c46 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -8,9 +8,7 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb32b273936da89604"
 
 PYPI_PACKAGE = "dynamic_dispatch"
-
-UPSTREAM_CHECK_URI = "https://pypi.org/project/dynamic-dispatch/"
-UPSTREAM_CHECK_REGEX = "/dynamic-dispatch/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
index c17cce723..104e6ef29 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2890aee62bd2a4c3197e2059016a397e"
 SRC_URI[sha256sum] = "cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7"
 
 PYPI_PACKAGE = "email_validator"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
index 1f119c6bd..9439deef0 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
@@ -21,3 +21,4 @@ RDEPENDS:${PN} += " \
 inherit setuptools3 pypi
 
 PYPI_PACKAGE = "et_xmlfile"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
index e8bfb437f..29b96005e 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=731f4de9c79bfeba6d8d55f83d0d2423"
 SRC_URI[sha256sum] = "33ddd756206e90f7ddff1330cc8cac4aa411a824fe779314a0a52abea2c8fc14"
 
 PYPI_PACKAGE = "eth_abi"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
index f0a5e2441..f57a83132 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 SRC_URI[sha256sum] = "a5eb9555f43f4579eb83cb84f9dda9f3d6663bbd4a5a6b693f8d35045f305a1f"
 
 PYPI_PACKAGE = "eth_utils"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
index b445ec0e1..4923eb9d5 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
 SRC_URI[sha256sum] = "dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77ab50f4e9a2602a593"
 
 PYPI_PACKAGE = "flask_babel"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_poetry_core
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
index 7553ce74a..13a224a9d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
 
 PYPI_PACKAGE = "Flask-Bootstrap"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
index 77b51c551..6606b3037 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
@@ -8,6 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
 
 PYPI_PACKAGE = "Flask-Cors"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI += " \
         file://CVE-2024-6221.patch \
diff --git a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
index 51b907e6d..1b43b834c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-HTTPAuth"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "66568a05bc73942c65f1e2201ae746295816dc009edd84b482c44c758d75097a"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
index 93ecf0845..d653b8adb 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.rst;md5=bd59445a234a0c8250b39178d42e3148"
 
 PYPI_PACKAGE = "Flask-Jsonpify"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2fedbfb"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
index cc07c92f4..e188f2b09 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9166295d7c482b9440bbb2b5c0fa43ac"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-JWT-Extended"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "9215d05a9413d3855764bcd67035e75819d23af2fafb6b55197eb5a3313fdfb2"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
index f7044b314..462d065a0 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ff00db41c47ec84b4567a8b3c246a959"
 
 PYPI_PACKAGE = "Flask-JWT"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
index d990d4e80..f197119bb 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 SRC_URI[sha256sum] = "5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75947bf9c147330333"
 
 PYPI_PACKAGE = "Flask-Login"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index 66f3936cd..c5b839eb7 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
 SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
 
 PYPI_PACKAGE = "Flask-Mail"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
index 8408ebd7b..7d87d8c28 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=27586b20700d7544c06933afe56f7df4"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "flask_marshmallow"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "00ee96399ed664963afff3b5d6ee518640b0f91dbc2aace2b5abcf32f40ef23a"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
index bfd854ac0..bacf7851a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 SRC_URI[sha256sum] = "dff7dd25113c210b069af280ea713b883f3840c1e3455274745d7355778c8622"
 
 PYPI_PACKAGE = "Flask-Migrate"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
index 1e751b9e5..75a52a033 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=
 SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
 
 PYPI_PACKAGE = "Flask-PyMongo"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
index 8ea455c63..0f97fbc25 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
@@ -11,5 +11,6 @@ SRC_URI[sha256sum] = "fe4af2ef0027df8f9b4f797aba20c5566801b6ade995ac63b588abf1a5
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-RESTful"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} = "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
index d518a1877..e74f315c4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
 SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
 
 PYPI_PACKAGE = "Flask-Sijax"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
index 6b76e03f8..7371d7646 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "bb8f9f9123ef47632f5ce57a33514b0c0023ec3696b2384457f0fcaa5b70501c"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
index f5fe1cc44..9f3db3895 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] = "e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3dc97dabfa36b8312"
 
 PYPI_PACKAGE = "flask_sqlalchemy"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask-SQLAlchemy"
-UPSTREAM_CHECK_REGEX = "/Flask-SQLAlchemy/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
index a51ead3c8..fa2b32181 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
 SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
 
 PYPI_PACKAGE = "Flask-Uploads"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 65be459b7..fadfabd0c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
 SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
 
 PYPI_PACKAGE = "Flask-User"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
index 7aaf439b8..4e2d5e609 100644
--- a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
@@ -4,6 +4,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://flaskext/versioned/__init__.py;md5=dcb7d97884bf08c256ff5795766bcd24"
 
 PYPI_PACKAGE = "Flask-Versioned"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 SRC_URI[sha256sum] = "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
index ecdcd23d4..0ce3de085 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 SRC_URI[sha256sum] = "79d2ee1e436cf570bccb7d916533fa18757a2f18c290accffab1b9a0b684666b"
 
 PYPI_PACKAGE = "flask_wtf"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask-WTF"
-UPSTREAM_CHECK_REGEX = "/Flask-WTF/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_hatchling
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
index c4cad466a..b8d73c817 100644
--- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381
 SRC_URI += "file://remove-pip-requires.patch"
 
 PYPI_PACKAGE = "Flask-XStatic"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += "\
     python3-flask \
diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
index dd2795bd7..9b10089c9 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
@@ -12,9 +12,6 @@ SRC_URI += " \
         file://run-ptest \
 "
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
-UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
-
 inherit pypi python_setuptools_build_meta ptest
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
index 19f2c6cb2..e36ea4ce5 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
 "
 
 PYPI_PACKAGE = "google_auth"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN}-ptest += " \
         python3-aioresponses \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
index 23447d71e..9f81c6a69 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3
 
 DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "a4ae742c9ca04327ae0eec43d7e5b96c9686b8fc24200ae0816a67ab18342710"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb
index 48c0ccfff..dc7a4c85d 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.67.1.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3
 
 DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "507d9785a72032816e9bb5add4a660c655813a6bc1537b957822c652c88bf458"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
index 6ac826c5c..9e8abeb0f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "grpcio_tools"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-grpcio"
 
diff --git a/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb b/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb
index 8b3218790..d9026e457 100644
--- a/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=58206c261591d2c13b00ab61cec32abe"
 SRC_URI[sha256sum] = "2c686e5758fd05bb55fa7d0c198fdd481f8d3aaa3c693260f5c0d74ce3547d20"
 
 PYPI_PACKAGE = "hatch_requirements_txt"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_hatchling
 
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.14.bb b/meta-python/recipes-devtools/python/python3-icu_2.14.bb
index facfa4ffe..25d592553 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.14.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "acc7eb92bd5c554ed577249c6978450a4feda0aa6f01470152b3a7b382a02132"
 
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
index 503b79d66..331dc0355 100644
--- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a61b9c5aec8796b64a6bf15d42605073"
 SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
 
 PYPI_PACKAGE = "idna-ssl"
-inherit pypi setuptools3
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/idna_ssl/"
-UPSTREAM_CHECK_REGEX = "/idna_ssl/(?P<pver>(\d+[\.\-_]*)+)"
+inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-idna \
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
index b81d17383..763aa170c 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "importlib_metadata"
-UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "9a547d3bc3608b025f93d403fdd1aae741c24fbb8314df4b155675742ce303c5"
 
diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
index 8ccd4ba8d..388649382 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "54fdf7831055d06a2423054875d640102865a164cc8291a8086e44dd9b
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "inline_snapshot"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} = "python3-asttokens \
                   python3-black \
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 6e65d622a..817d04444 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -28,5 +28,6 @@ do_install_ptest() {
 }
 
 PYPI_PACKAGE = "IPy"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
index 2a25d1d91..0ce04829b 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -4,9 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
 
 PYPI_PACKAGE = "ipython_genutils"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ipython_genutils"
-UPSTREAM_CHECK_REGEX = "/ipython_genutils/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
 
diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
index 5a2d7d950..8f382c99b 100644
--- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3"
 
 PYPI_PACKAGE = "Keras_Preprocessing"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/5e/f1/b44337faca48874333769a29398fe4666686733c8880aa160b9fd5dfe600/Keras_Preprocessing-${PV}.tar.gz"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
index 90967f8e5..7c03aef40 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
@@ -9,6 +9,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "963c264164d4374f549d57db09599e0ca458cea1bd05e16939897619be4e6dbd"
 
 PYPI_PACKAGE = "luma.core"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += " \
 	python3-pillow \
diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
index a95254c38..0c0906ced 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
@@ -11,6 +11,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "36218565eda0614c8cf44ef42cb9a5904ddf808e4516e99ddae111fc93c5a206"
 
 PYPI_PACKAGE = "luma_oled"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += " \
 	python3-luma-core \
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
index 335565643..b7d5c8efc 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d4692a0eb42ca54892399db2cb35e61e"
 SRC_URI[sha256sum] = "8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90"
 
 PYPI_PACKAGE = "matplotlib_inline"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-traitlets"
diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
index 4c431431c..cda1eb053 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fe3219e2470a78c0d1837019b8b426e"
 
 PYPI_PACKAGE = "mypy_extensions"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
index 2f94f7a6a..7e389a577 100644
--- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "342dc97b9e88a6495bae22953ee6063f91d2f03db6f727b62ba5c3092a
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "ninja_syntax"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ninja_syntax/"
-UPSTREAM_CHECK_REGEX = "/ninja_syntax/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
index 06843c03c..8932d9560 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
@@ -9,6 +9,7 @@ SRC_URI += " \
 "
 
 PYPI_PACKAGE = "parse_type"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi ptest python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index e3405939c..1f6b36bd2 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "PasteDeploy"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed418b6a7ff6a095a95"
 
diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
index 903caad6e..04686c913 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "1f833e527ae172f34b4b84e2fcf1f65859a2a5ca746e496d8313b3ea65
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE= "pdm_backend"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
index 72ffe6125..5dbd2b0ed 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
@@ -9,5 +9,6 @@ inherit pypi python_setuptools_build_meta
 DEPENDS += " python3-pdm-backend-native"
 
 PYPI_PACKAGE = "pdm_build_locked"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
index 521df9dcd..8305c1ed6 100644
--- a/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
@@ -10,8 +10,6 @@ SRC_URI[sha256sum] = "ee7d41123f3c9911050ea2c2dac107568dc43b2d3b0c7557a33212c398
 
 inherit pypi setuptools3
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
-
 RDEPENDS:${PN} = "\
     python3-core \
     python3-io \
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
index a71187399..7106e9c5e 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=513d94a7390d4d72f3475e2d45c739b5"
 
 PYPI_PACKAGE = "posix_ipc"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7"
 
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index c7e1f3c3f..b92f91b71 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -12,8 +12,6 @@ SRC_URI[sha256sum] = "25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a54
 # Can't find required file: ../src/google/protobuf/descriptor.proto
 CLEANBROKEN = "1"
 
-UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
-
 DEPENDS += "protobuf"
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index e0c5e4719..12f10d824 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -11,8 +11,6 @@ SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347
 
 inherit pypi python_flit_core
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
-
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
index f52b235e8..63212346c 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3d6c15f7859ae235a78f2758e5a48cf"
 DEPENDS = "python3-setuptools-scm-native"
 
 PYPI_PACKAGE = "pure_eval"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
index 03097801b..225da562c 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-Stop-using-pyasn1.compat.octets.patch"
 SRC_URI[sha256sum] = "c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c"
 
 PYPI_PACKAGE = "pyasn1_modules"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi ptest python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
index 6a325dbe8..0e2810ae7 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3152b432b96d6dc4a1cb35397da9ec"
 
 PYPI_PACKAGE = "PyAudio"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a491f790a0895bd2f87"
 
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 188700be2..8887ab27d 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.pat
 SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
 
 PYPI_PACKAGE = "PyBluez"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
index 5deb5e92f..6c8c09348 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
 SRC_URI[sha256sum] = "a8671ee4ea4a7095e2e0670e2215145ec1e3e0aa0737ff74d648ae4dc268b2b1"
 
 PYPI_PACKAGE = "PyChromecast"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
index 2f7a2f242..75c6b46e4 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
@@ -19,6 +19,7 @@ DEPENDS = "python3-maturin-native python3-typing-extensions"
 inherit pypi cargo-update-recipe-crates python_maturin
 
 PYPI_PACKAGE = "pydantic_core"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += " \
     python3-compression \
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
index f902c705e..f57ea97fc 100644
--- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
@@ -1,7 +1,9 @@
 SUMMARY = "A Python interface for the Firmata protocol"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84ddcef430b7c44caa22b2ff4b37a3df"
+
 PYPI_PACKAGE = "pyFirmata"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} = "\
     python3-pyserial \
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
index dcc9ebfa9..9a804f748 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
@@ -9,9 +9,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-hatch-vcs-native"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PyHamcrest/"
-UPSTREAM_CHECK_REGEX = "/PyHamcrest/(?P<pver>(\d+[\.\-_]*)+)"
-
 RDEPENDS:${PN} += " \
     python3-asyncio \
     python3-numbers \
diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
index 49f4f7da8..8c7b1c0f7 100644
--- a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "c5f36e8ef0ed3b487a9242ce34c19f9684e418a5bbffd5d367dc1d1604
 
 PYPI_PACKAGE = "PyLyrics"
 PYPI_PACKAGE_EXT = "zip"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
index 5e56a64aa..19e552bf8 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 SRC_URI[sha256sum] = "4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96"
 
 PYPI_PACKAGE = "PyMySQL"
-inherit pypi python_setuptools_build_meta
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pymysql/"
-UPSTREAM_CHECK_REGEX = "/pymysql/(?P<pver>(\d+[\.\-_]*)+)"
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-cryptography"
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index a2f2ab4df..77ca2e1ff 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
 SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
 
 PYPI_PACKAGE = "PyNaCl"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
index ee8949add..13dbd6b60 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 SRC_URI[sha256sum] = "dc5b0e0f6e291a4f22b46e182c9c6d4915c62b1f089b8de1b73f2d06ae453593"
 
 PYPI_PACKAGE = "pyproject_api"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
index b731e77f1..dd08c0fbf 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
@@ -9,4 +9,6 @@ SRC_URI[sha256sum] = "c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a8711bd2c
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "pytest_codspeed"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 RDEPENDS:${PN} = "python3-cffi python3-filelock python3-pytest"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
index 6ff69a396..8b4f0dd7f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
@@ -13,3 +13,4 @@ RDEPENDS:${PN} = "\
 "
 
 PYPI_PACKAGE = "pytest_freezer"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
index 154ec255c..d45f6a25e 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 SRC_URI[sha256sum] = "70a01e8ae5800f4a074b56a4cb1025c8f4f9b038bba5fe31e3c98eb996686f07"
 
 PYPI_PACKAGE = "pytest_html"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_hatchling
 
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
index bd6d81aec..103ea655b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
@@ -17,5 +17,6 @@ SRC_URI[sha256sum] = "0c561f0d29eea5b55cf29b9264a3241999ffdb74c6b6e8c4ccc0bd2c93
 inherit pypi python_poetry_core
 
 PYPI_PACKAGE = "pytest_lazy_fixtures"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} = "python3-pytest"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
index 86b03724a..feb2f6fbb 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
@@ -12,3 +12,4 @@ RDEPENDS:${PN} = "python3-pytest"
 BBCLASSEXTEND = "native nativesdk"
 
 PYPI_PACKAGE = "pytest_socket"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
index b3c018629..b1ed5e552 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "045e1f98d719c1ce085ed7f7e1ef9d8ccc8c02ba02b5566d5f7521410c
 inherit pypi python_hatchling ptest
 
 PYPI_PACKAGE = "python_multipart"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI += " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
index 4e0adc39f..670a36a64 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 SRC_URI[sha256sum] = "0f549a3f3b0699415ac04d167e9cb39bccfb730cb832b4d20be3d9867356e658"
 
 PYPI_PACKAGE = "requests_file"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta ptest
 
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
index 21f588bc1..9ebc34eab 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
 
 PYPI_PACKAGE = "rfc3986_validator"
-UPSTREAM_CHECK_REGEX = "/rfc3986-validator/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
index 8259f90aa..7c6c9ddda 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
@@ -3,6 +3,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b4e748e5f102e31c9390dcd6fa66f09"
 
 PYPI_PACKAGE = "scikit_build_core"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS = "python3-hatch-vcs-native"
 
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
index eacd67a05..3b2e8b714 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
 DEPENDS = "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-native"
 
 PYPI_PACKAGE = "scikit_build"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_hatchling
 
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
index 2cae3b08c..12dae861d 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557c
 inherit pypi python_hatchling ptest
 
 PYPI_PACKAGE = "service_identity"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI += " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
index 9a28fc558..4d2165005 100644
--- a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
@@ -7,4 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=16e213d75641a392478df50cf0841903"
 SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
 
 PYPI_PACKAGE = "Sijax"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
index 55ddff383..9bf895e38 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3d6c15f7859ae235a78f2758e5a48cf"
 DEPENDS = "python3-setuptools-scm-native"
 
 PYPI_PACKAGE = "stack_data"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
index cbe7fcc21..abe5c03d8 100644
--- a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
@@ -10,5 +10,6 @@ DEPENDS = "python3-pytest-runner-native"
 SRC_URI[sha256sum] = "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeacf3bcd80875c82eff"
 
 PYPI_PACKAGE = "StrEnum"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb b/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
index 85e05ad97..27ae8fe8a 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "f5013484eaf7a20eb22d1821aaefe60b50cc329722372b5f8565d46d4a
 inherit pypi setuptools3
 
 PYPI_PACKAGE="Wand"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 FILES:${PN}-doc += "${datadir}/README.rst"
 
diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index bb0007e61..68ff6c186 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -9,8 +9,7 @@ SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045
 SRC_URI += "file://0001-cli-drop-the-second-argument-from-click.argument-dec.patch"
 
 PYPI_PACKAGE = "wpa_supplicant"
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/wpa_supplicant"
-UPSTREAM_CHECK_REGEX = "/wpa_supplicant/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
index b3ba14ff7..fa5428215 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
@@ -7,9 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
 SRC_URI[sha256sum] = "f8d76180d7239c94c6322f7990ae1216dae3659b7aa1cee94b6318bdffb474b9"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/WTForms"
-UPSTREAM_CHECK_REGEX = "/WTForms/(?P<pver>(\d+[\.\-_]*)+)"
-
 inherit pypi python_hatchling
 
 DEPENDS += "\
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
index 6e8f1b24d..e3376ab55 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a4bab8df34a9a138b4e0ca56b8559a05"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += " \
 	python3-crypt \
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
index f4a51f318..0562cc267 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
@@ -5,6 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1a2fe131dcb2fc6243c26cf05ecdb36"
 
 PYPI_PACKAGE = "XStatic-Font-Awesome"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
 
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
index 22bfa365f..f4a75c9b6 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.txt;md5=1418684272f85f400cebf1b1a255c5cd"
 
 PYPI_PACKAGE = "XStatic"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "402544cc9e179489441054f09c807804e115ea246907de87c0355fb4f5a31268"
 
diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
index 4d914c63e..f03ab22d2 100644
--- a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
@@ -6,5 +6,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=72092419572155ddc2
 SRC_URI[sha256sum] = "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda6955f96bb9b91e67cd"
 
 PYPI_PACKAGE = "zope.event"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
index dcf660d41..79e00ce23 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
@@ -3,6 +3,7 @@ LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
 PYPI_PACKAGE = "zope.interface"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 SRC_URI += "file://0001-Allow-using-setuptools-74.patch"
diff --git a/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb
index 722956a8e..6d07f5451 100644
--- a/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb
+++ b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb
@@ -15,5 +15,6 @@ RDEPENDS:${PN} = "\
 inherit setuptools3 pypi
 
 PYPI_PACKAGE = "rouge_score"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "c7d4da2683e68c9abf0135ef915d63a46643666f848e558a1b9f7ead17ff0f04"
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
index 64e2b3ebb..79ca972b8 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
            "
 
 PYPI_PACKAGE = "wxPython"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI += "file://add-back-option-build-base.patch \
            file://wxgtk-fixup-build-scripts.patch \
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
index 0bbfb9a11..89943095d 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
@@ -7,6 +7,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "b18e7a3966d99871aefeb00cfbcfdced55ce4871194810fc71f4aa484b953abf"
 
 PYPI_PACKAGE = "Send2Trash"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += "\
     python3-io \
-- 
2.34.1


