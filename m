Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A848CA9EBD
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:58:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11993.1791563540298351480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g1D/zmuj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: joel.winarske@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so3175274a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791563539; x=1792168339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EV8XLdAJncl7Zs8Vg87RuTgYEwveThRlH+K5MNMve8U=;
        b=g1D/zmujwNREcoDxzT29hgc8prFs3cIaSMyUJjNzcAEzuvsf8XgDH66AjK5p2JhsNT
         ujgZQxuxy6yZOezeqaiF0RxC5FR2xE41LR8IXm9wIA6X1iFwl3tWBDxfOOLoyr+QeDLy
         MnhZT94ilzhKg9LPf3gb0mBqZvrF0oWMkn2ajq4cAZRB7rPJdF+W9NAYsnvEmK2BcX7q
         yFqd+zg4KKkUpIL1a4jOD0G7qgbnuFN+lvsEA1q6JtKCEcwIWasC+SHWeYb6at9Su8DA
         2nqdbkNCzSNfTb16VLfE5KEEBNT/Z+bDVxOQBKu0E9KqH55ktso4V6HQ+v1J8bPWw5NY
         63EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563539; x=1792168339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EV8XLdAJncl7Zs8Vg87RuTgYEwveThRlH+K5MNMve8U=;
        b=iSrdvtG3yGtHSYdT9cMlS/NA85MP64Wx2KRzJ7h6PskifoCjSivGD7tA7fGuNxIFq4
         bMx466DI2fEKbiQQW+K9xvlJT443S6Ff+eWeTksykcS1j/m1dtk9GLX/FV+WZcfwA8nd
         KNaIkZO8/hoqeCutCWds2JkyU67evl9K5/zuLBZlMxdNYjYt1egkbUHLjCtblOmQIhIB
         p+y8R1wNl1nYvUYfi7axO+l+JUWQTTrRQp0QJL5UFa/eSxRNZIPwwy9t6nW7j7jI8KTm
         65Ujoc3tWShrugYJOQZF3xuXLvdI1InDZadMCpQSFg3lz0f04D9B39iYS9IxyB1gsoLD
         +/uQ==
X-Gm-Message-State: AFq9FYIx4GWu9cSWZ2TdsdkLvN+CUXL17Wo0J6Ue9izbkjZL3pnOqUY4
	NQtlegZSYvVmqU/teRzkVKiDWql9//dvmPU2Qxrzgxs5ShYDiCJbsFHrsjk1s9mp
X-Gm-Gg: AYBFou0ruDQTEv3WOZFxqqjSH0nT7wDUyreDU9FrGAiYQaCSyp0gcZ6jEVCM/VqJoOQ
	zeePyW3nkMfhmbrxvJGBv49dpnZFEGjDyLP22TV2Fwottj6EG34XW0dkHaaJANGY/gaV65wTLVg
	7SW9fWN7d4l8dNGXtt0gfPqZHskLFnMkbTa0N5UvzJHKl8ITvPU08LNLAgUg38gcROxeGw5rTJa
	Zhw9yL3XjCxWjQ7Fn4jTSxRsKajk2fSpWsCYKDe2VW9xbXleFzT0/RzdmDdKSMPimuVH7tbAklN
	ilJXfHnR4SDvS9YgMTDN3pJTwzlMBSQCDPbtcx66q1otCDIceeVQXVHp2CRzdFysgTov3L8FZ1s
	cnSPJm7hMIZKB3v4IkXbNhHPsYRh2eDLGEe0giLDP1Qr/fbR3J+JYfe8FvWb9owm5JNxb20KQXS
	dHQ9dskF0FIIeCxej8RFbuIFkWQ0X3CcQFJ10vLeGeH52tGBnS2S/7xjpqIKUkvQPmw6y23ROP1
	e3GVaAJ5ZlGGgeTXHG8RpPIfhVbj4dSXniMWVHF5RniuH0fNQ==
X-Received: by 2002:a17:90b:2d06:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ab3acdf2e1mr1931955a91.42.1791563538669;
        Fri, 09 Oct 2026 09:32:18 -0700 (PDT)
Received: from air ([2601:602:580:a250:62eb:81a:51d8:6bf6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm4335102a91.0.2026.10.09.09.32.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:32:17 -0700 (PDT)
From: "Joel Winarske" <joel.winarske@gmail.com>
X-Google-Original-From: Joel Winarske <joel.winarske@linux.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-*: set PYPI_PACKAGE_SDIST for non-normalized sdists
Date: Fri,  9 Oct 2026 09:32:13 -0700
Message-ID: <20261009163214.3203833-1-joel.winarske@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 18:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130707

From: Joel Winarske <joel.winarske@gmail.com>

oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized project name and
derives the sdist name from it by replacing - with _. 264698b8a migrated
oe-core's own recipes. These were not, so each builds a URL that does not
exist: the sdists predate PEP 625 and are still hyphenated.

  ERROR: python3-absl-native-2.1.0-r0 do_fetch: Fetcher failure: Fetch command
  ['wget', ..., '.../source/a/absl_py/absl_py-2.1.0.tar.gz'] failed with exit
  code 8

64 recipes, 42 taking the derived default and 22 setting PYPI_PACKAGE. 54 can
use ${PYPI_PACKAGE} as Martin's patches do. The other 10 cannot: normalizing
lowercases the name while the sdist keeps its case, as in flask-restful
against Flask-RESTful, so those name the sdist directly.

No PYPI_PACKAGE is removed. Dropping a non-redundant one repoints HOMEPAGE,
UPSTREAM_CHECK_URI and the SPDX purl at the name BPN derives, which is not
always the project.

Checksums are unaffected, only the URLs.

python3-async-timeout, python3-google-api-core,
python3-google-api-python-client, python3-googleapis-common-protos and
python3-requests-toolbelt are left out, already covered by Martin's patches.
python3-tomli-w is already tomli_w-1.2.0.tar.gz and needs nothing.

Verified against oe-core master with an empty DL_DIR: all 64 fail do_fetch
before and fetch after, checksums validated.

Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
---
 .../recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb  | 1 +
 meta-python/recipes-devtools/python/python3-absl_2.1.0.bb      | 1 +
 .../recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb      | 2 ++
 .../recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb   | 1 +
 .../recipes-devtools/python/python3-asyncio-glib_0.1.bb        | 2 ++
 .../recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb  | 2 ++
 .../recipes-devtools/python/python3-click-repl_0.3.0.bb        | 2 ++
 .../recipes-devtools/python/python3-click-spinner_0.1.10.bb    | 2 ++
 meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb  | 1 +
 .../recipes-devtools/python/python3-dbus-deviation_0.6.1.bb    | 2 ++
 meta-python/recipes-devtools/python/python3-decouple_3.8.bb    | 1 +
 meta-python/recipes-devtools/python/python3-editor_1.0.4.bb    | 1 +
 .../recipes-devtools/python/python3-eth-keyfile_0.8.0.bb       | 2 ++
 meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb   | 2 ++
 .../recipes-devtools/python/python3-file-magic_0.4.1.bb        | 2 ++
 .../recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb | 3 ++-
 .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb    | 3 ++-
 meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb | 3 ++-
 .../recipes-devtools/python/python3-flask-login_0.6.3.bb       | 3 ++-
 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb   | 2 ++
 .../recipes-devtools/python/python3-flask-restful_0.3.10.bb    | 3 ++-
 .../recipes-devtools/python/python3-flask-restx_1.3.2.bb       | 2 ++
 .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb       | 3 ++-
 .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb     | 3 ++-
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb       | 3 ++-
 .../python/python3-flask-versioned_0.9.4-20101221.bb           | 3 ++-
 .../recipes-devtools/python/python3-flask-xstatic_0.0.1.bb     | 3 ++-
 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb  | 2 ++
 .../recipes-devtools/python/python3-javaobj-py3_0.4.4.bb       | 2 ++
 .../recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb       | 2 ++
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb      | 1 +
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb       | 2 ++
 meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb    | 1 +
 .../recipes-devtools/python/python3-precise-runner_0.3.1.bb    | 2 ++
 .../recipes-devtools/python/python3-process-tests_3.0.0.bb     | 2 ++
 .../recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb        | 2 ++
 .../recipes-devtools/python/python3-py-ubjson_0.16.1.bb        | 2 ++
 .../recipes-devtools/python/python3-pyserial-asyncio_0.6.bb    | 2 ++
 .../recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb  | 2 ++
 .../recipes-devtools/python/python3-pytest-forked_1.6.0.bb     | 2 ++
 .../python/python3-pytest-helpers-namespace_2021.12.29.bb      | 2 ++
 .../python/python3-pytest-json-report_1.5.0.bb                 | 2 ++
 .../python/python3-pytest-localserver_0.8.1.bb                 | 2 ++
 .../recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb    | 2 ++
 .../recipes-devtools/python/python3-pytest-runner_6.0.1.bb     | 2 ++
 .../recipes-devtools/python/python3-pytest-sugar_1.1.1.bb      | 2 ++
 .../python/python3-pytest-tempdir_2019.10.12.bb                | 2 ++
 meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb  | 1 +
 .../recipes-devtools/python/python3-requests-ftp_0.3.1.bb      | 2 ++
 .../recipes-devtools/python/python3-requests-mock_1.12.1.bb    | 2 ++
 .../recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb | 2 ++
 .../python/python3-robotframework-seriallibrary_0.4.3.bb       | 2 ++
 .../python3-setuptools-declarative-requirements_1.3.0.bb       | 2 ++
 meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb    | 1 +
 .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb     | 2 ++
 meta-python/recipes-devtools/python/python3-systemd_235.bb     | 1 +
 .../recipes-devtools/python/python3-trafaret-config_2.0.2.bb   | 2 ++
 .../python/python3-types-python-dateutil_2.9.0.20241003.bb     | 2 ++
 .../python/python3-types-setuptools_75.5.0.20241120.bb         | 2 ++
 .../recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb    | 1 +
 64 files changed, 116 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
index 08ec2cf670..f496bb0705 100644
--- a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
+++ b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
@@ -5,5 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=13f7629e8e4989b66b4a913ab05a91de"
 SRC_URI[sha256sum] = "20b53ea7a09dfe173c00ec0a00eea508b05e959f5dc4b4bb698aa52252192f8f"
 
 PYPI_PACKAGE = "python-pytun"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
index 5bdb83175d..210bfeeff9 100644
--- a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI[sha256sum] = "7820790efbb316739cde8b4e19357243fc3608a152024288513dd968d7d959ff"
 
 PYPI_PACKAGE = "absl-py"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
index df4a0adcaf..c82ad89c9f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=29dca541e03964615590ca7b50392d97"
 
 SRC_URI[sha256sum] = "a3a7ff5264e5bca52e8ae547bbfd0761b72495230d438d05b6c0915be619b0e2"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
index 431d37c7d7..260d16d358 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4b18e4a9f93178eaa50a9a37f26da7f7"
 SRC_URI[sha256sum] = "3cd282f5ea7cfb841537fe01f143350fdb1c0b1ce7981443a2fa8513fddb6d1a"
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
index d73e83de54..602bcca715 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -2,6 +2,8 @@ SUMMARY = "An implementation of the Python 3 asyncio event loop on top of GLib"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit setuptools3 pypi features_check
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
index 040e70940b..e04372af59 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7906e56b70808e1ade6ca05e0bb48d5"
 
 SRC_URI[sha256sum] = "2675282e99d9129ecc446f917e174bc205c65e36c602aa18603b4948567fcbd4"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-asyncio"
diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
index b0844ed5a2..4e0d145a83 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=580facc4832cac548fad94845542da44"
 
 SRC_URI[sha256sum] = "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69ced26a9"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
index 7f19cc3458..0d09fbdbdf 100644
--- a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 SRC_URI += "file://0001-Update-Versioneer-to-0.22.patch"
 SRC_URI[sha256sum] = "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-json"
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index dd3f55edf9..e66e4f32b7 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
 
 PYPI_PACKAGE = "python-dateutil"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
index e969e85465..70066d548b 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90263a49bc1d9a204656fec4d5616c66"
 
 SRC_URI[sha256sum] = "e06b88efe223885d2725df51cf7c9b7b463d1c6f04ea49d4690874318d0eb7a3"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 SRC_URI += "file://0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch"
diff --git a/meta-python/recipes-devtools/python/python3-decouple_3.8.bb b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
index 20d614a423..b0076dd504 100644
--- a/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a46375b26bb7d7603565d829a2a51782"
 SRC_URI[sha256sum] = "ba6e2657d4f376ecc46f77a3a615e058d93ba5e465c01bbe57289bfb7cce680f"
 
 PYPI_PACKAGE = "python-decouple"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index 6ec72d02aa..de00edad99 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
 
 PYPI_PACKAGE = "python-editor"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
index 741db5ced0..2b4c27e36b 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
 SRC_URI[sha256sum] = "02e3c2e564c7403b92db3fef8ecae3d21123b15787daecd5b643a57369c530f9"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
index aabfff1b1d..4d1f3d9652 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
 SRC_URI[sha256sum] = "a0abccb83f3d84322591a2c047a1e3aa52ea86b185fa3e82ce311d120ca2791e"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-eth-utils"
diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
index 4bdc0c8873..a66ec21086 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
 SRC_URI[sha256sum] = "d5b408a8cd20ed496e8e66d0559560d29bc21cee482f893936a1f05d0dddc4a0"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
diff --git a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
index cf0296b018..faf081097f 100644
--- a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e949c0b3fb4fd86232f00c6ee0bdef3"
 
 SRC_URI[sha256sum] = "a91d1483117f7ed48cd0238ad9be36b04824d57e9c38ea7523113989e81b9c53"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
index e28e41c124..239b97ea51 100644
--- a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 
 SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
 
-PYPI_PACKAGE = "Flask-Bootstrap"
+PYPI_PACKAGE = "flask-bootstrap"
+PYPI_PACKAGE_SDIST = "Flask-Bootstrap"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
index 93ecf08453..3ecd75f104 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -4,7 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.rst;md5=bd59445a234a0c8250b39178d42e3148"
 
-PYPI_PACKAGE = "Flask-Jsonpify"
+PYPI_PACKAGE = "flask-jsonpify"
+PYPI_PACKAGE_SDIST = "Flask-Jsonpify"
 
 SRC_URI[sha256sum] = "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2fedbfb"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
index f7044b314f..d4ce779eb4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -4,7 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ff00db41c47ec84b4567a8b3c246a959"
 
-PYPI_PACKAGE = "Flask-JWT"
+PYPI_PACKAGE = "flask-jwt"
+PYPI_PACKAGE_SDIST = "Flask-JWT"
 
 SRC_URI[sha256sum] = "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
index df22ca112c..3382124acd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
 SRC_URI[sha256sum] = "5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75947bf9c147330333"
 
-PYPI_PACKAGE = "Flask-Login"
+PYPI_PACKAGE = "flask-login"
+PYPI_PACKAGE_SDIST = "Flask-Login"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index 16afb1d1ce..9e74a112fd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
 SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
 
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
index 8ea455c633..89afc42cb2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "fe4af2ef0027df8f9b4f797aba20c5566801b6ade995ac63b588abf1a5
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE = "Flask-RESTful"
+PYPI_PACKAGE = "flask-restful"
+PYPI_PACKAGE_SDIST = "Flask-RESTful"
 
 RDEPENDS:${PN} = "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
index bf0f3b374a..917f4fa506 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
@@ -6,6 +6,8 @@ SRC_URI[sha256sum] = "0ae13d77e7d7e4dce513970cfa9db45364aef210e99022de26d2b73eb4
 
 CVE_PRODUCT = "flask-restx"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
index d518a1877f..60dd5bdd93 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
 
 SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
 
-PYPI_PACKAGE = "Flask-Sijax"
+PYPI_PACKAGE = "flask-sijax"
+PYPI_PACKAGE_SDIST = "Flask-Sijax"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
index a51ead3c8a..a04f5c0dc5 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
 
 SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
 
-PYPI_PACKAGE = "Flask-Uploads"
+PYPI_PACKAGE = "flask-uploads"
+PYPI_PACKAGE_SDIST = "Flask-Uploads"
 
 inherit pypi setuptools3
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 951020dae9..cfa485c4cd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
 
 SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
 
-PYPI_PACKAGE = "Flask-User"
+PYPI_PACKAGE = "flask-user"
+PYPI_PACKAGE_SDIST = "Flask-User"
 
 CVE_PRODUCT = "flask-user_project:flask-user"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
index 3492d5efc8..68cbc44a44 100644
--- a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
@@ -3,7 +3,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://flaskext/versioned/__init__.py;md5=dcb7d97884bf08c256ff5795766bcd24"
 
-PYPI_PACKAGE = "Flask-Versioned"
+PYPI_PACKAGE = "flask-versioned"
+PYPI_PACKAGE_SDIST = "Flask-Versioned"
 
 SRC_URI[sha256sum] = "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
index c4cad466ad..8a52ab0086 100644
--- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
@@ -6,7 +6,8 @@ SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381
 
 SRC_URI += "file://remove-pip-requires.patch"
 
-PYPI_PACKAGE = "Flask-XStatic"
+PYPI_PACKAGE = "flask-xstatic"
+PYPI_PACKAGE_SDIST = "Flask-XStatic"
 
 RDEPENDS:${PN} += "\
     python3-flask \
diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
index d2cfbf46a0..dff21c4b9a 100644
--- a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=10;endline=10;md5=c2d9994c57f0444e
 SRC_URI[sha256sum] = "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a77215cf644a33513192"
 
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
index cc431b33bd..3ff8a0cae8 100644
--- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a61b9c5aec8796b64a6bf15d42605073"
 SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
 
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
index d71101ee2c..3e5b6c0f48 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
 SRC_URI[sha256sum] = "e4e3257ef2cf81a3339787a4d5cf924e54c91f095a723f6d2584dae61d4396ed"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
index 8d846ab720..2e89d5dd94 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://README.rst;beginline=198;endline=215;md5=2866908485c1
 SRC_URI += "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index d136dcb005..4f9072d2be 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 
 SRC_URI[sha256sum] = "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
index 25e382088b..29b1e5ce0b 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS += "python3-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "8465cfb013f5cdfa8a1050c40cdae600b581ee32f1864ec404927aee49b4262c"
 
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 6dbc9d6538..a9494d0f90 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=3bf5e1ad64c0d99032c3143361fa234e"
 
 SRC_URI[sha256sum] = "694a8e44c87657c59292ede72891eb91d34131f6531463aab3009191c77364a8"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_flit_core ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
index 84bc17959a..5414e720c1 100644
--- a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://README.rst;beginline=337;endline=358;md5=f68bda54505b
 SRC_URI[sha256sum] = "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290803286f9e46bf7"
 
 PYPI_PACKAGE = "python-pkcs11"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3 cython
 
diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
index 53fc31ab83..991e3b9a98 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://README.md;md5=2ad29e930f3107d52d2a55728bf62116"
 
 SRC_URI[sha256sum] = "1a464209fb4bf0a3f5d5a428310cb2a70487a01a6bc3a960d1dda90af896b80d"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
diff --git a/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb b/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
index a16497b984..4c113f8d7b 100644
--- a/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aea36d49429f53e06868d87cd9d62349"
 
 SRC_URI[sha256sum] = "e5d57dea7161251e91cadb84bf3ecc85275fb121fd478e579f800777b1d424bd"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-core"
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index db0e2a96d8..17bfccc768 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2379ecb0d7a8299101b1e4c160cd1f7"
 
 SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
index 0db9d65fd3..3fa07f3e3d 100644
--- a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=383b9e6c3f9d1386a4eea17792291d91"
 
 SRC_URI[sha256sum] = "b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
index 30ff62a7ed..1ba02b04b1 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9a79418f241689e78034391d51162d24"
 
 SRC_URI[sha256sum] = "b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-asyncio python3-core python3-pyserial"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
index ae4b12c210..442bda09f6 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
 
 SRC_URI[sha256sum] = "9ea661cdc292e8231f7cd4c10b0319e56a2118e2c09d9f50e1b3d150d2aca105"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-core python3-py-cpuinfo python3-pytest python3-aspectlib"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
index f573bf0523..62893c741c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
 SRC_URI[sha256sum] = "4dafd46a9a600f65d822b8f605133ecf5b3e1941ebb3588e943b4e3eb71a5a3f"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 PEP517_BUILD_OPTS = "--skip-dependency-check"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
index 6698b6dde3..3bdc479340 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=440a4cdb311cd7ad181efb4cba06d562"
 
 SRC_URI[sha256sum] = "792038247e0021beb966a7ea6e3a70ff5fcfba77eb72c6ec8fd6287af871c35b"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native python3-setuptools-declarative-requirements-native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb
index 8834a6b586..374d30df69 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b4ca2f2ad5aaaebd8eb24f262f8fe60"
 SRC_URI[sha256sum] = "2dde3c647851a19b5f3700729e8310a6e66efb2077d674f27ddea3d34dc615de"
 
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 DEPENDS += "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
index e9500bd3db..5c644b88f5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8da7a541d738b054dcbf70c31530432"
 
 DEPENDS += "python3-setuptools-scm-native"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "66569c34fef31a5750b16effd1cd1288a7a90b59155d005e7f916accd3dee4f1"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
index 6e56d20b8d..46679d4ae7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
@@ -7,6 +7,8 @@ SRC_URI += "file://0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch"
 
 SRC_URI[sha256sum] = "956ea028ec30dbbfb680dd8e7b4a7fb8f80a239595e88bace018bf2c0d718248"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
index dd3a8d0234..31dce85176 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -9,6 +9,8 @@ SRC_URI += " \
            file://0001-Not-use-functions-from-pkg_resources-any-more.patch \
            "
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
index 22eb3d52ff..765a869e64 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e485b36215d1a038821b3e51bd189197"
 SRC_URI += "file://run-ptest"
 SRC_URI[sha256sum] = "73b8b65163ebf10f9f671efab9eed3d56f20d2ca68bda83fa64740a92c08f65d"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_poetry_core ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
index b161b016bc..104c658317 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9872c3a37cc9baf79a464cd168282be5"
 
 SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63ab36d8"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
index 761676d2ce..48e8ff31e5 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "81e7260f6297cad564389b700783c0a33de71310b9eb01fd013faec5e7
 inherit setuptools3 pypi ptest-python-pytest
 
 PYPI_PACKAGE = "python-rapidjson"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
 
diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
index db7c5fee0b..5acb7d73fd 100644
--- a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6683a23c9968b97709441dc884d46df6"
 SRC_URI += "file://0001-Remove-use-of-the-cgi-module.patch"
 SRC_URI[sha256sum] = "7504ceb5cba8a5c0135ed738596820a78c5f2be92d79b29f96ba99b183d8057a"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
index 248526b00b..8cfc05a713 100644
--- a/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b2eea41aec0f2973a45e1e45f28aa32"
 DEPENDS = "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "e9e12e333b525156e82a3c852f22016b9158220d2f47454de9cae8a77d371401"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb
index 71cafb513d..5fa86e35e5 100644
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb
@@ -3,6 +3,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
 
 SRC_URI[sha256sum] = "b3dffaebd884d8cd778494369603a9e7b58d29111bf6b41bdc2dcd87203af4e9"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-requests python3-oauthlib"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
index 4a8fcde41b..6de6537021 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
@@ -7,6 +7,8 @@ SRC_URI += "file://0001-pyproject.toml-Replace-install_requires.patch"
 SRC_URI[sha256sum] = "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03fa66bae54777e6bb"
 
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
index 44a51b42fb..525eb6a6ed 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI[sha256sum] = "57a5b9bb9ad350c278e8aa6be4cdebbcd925b9ba71d6a712a178a618cfb898f7"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
index bd0979d0b4..e7a05ca7b7 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb8
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-snappy"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += "snappy"
diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
index 472113b059..faf481690d 100644
--- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d413d90f0"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 269e175cc5..58dbf02c6d 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 
 PYPI_PACKAGE = "systemd-python"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
 SRC_URI[sha256sum] = "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a"
 
diff --git a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
index d7a987aa3b..19de00961c 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://README.rst;beginline=98;endline=106;md5=a15308789c3b7
 
 SRC_URI[sha256sum] = "440b6b49e5e975f9a640a2519abb2feddd96eb2aeb1715f87f947a7a079f20be"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
index 09d919dd82..db856b42a2 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 SRC_URI[sha256sum] = "58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
index b9f35406bd..73c6f64e0b 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://github.com/python/typeshed"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "d3c7e95b0598bf87fede29b3b57b19f5cdcd62a85b9298a7b30f8343f6f21c4f"
diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
index e95e4bbfb0..cb6da2e78d 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=17df11353545c53a2df0ce7655859306"
 
 SRC_URI[sha256sum] = "b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a"
 
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3 ptest-python-pytest
 
 do_install_ptest:append() {
diff --git a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
index f63cbf22fc..7fa6db560a 100644
--- a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-Deal-with-64bit-time_t-default-on-32bit-architecture.pat
 SRC_URI[sha256sum] = "853697344b64df5537d4ae32ba6fbcf0515d51a9010910f5d5019959038b6eba"
 
 PYPI_PACKAGE = "python-uinput"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.56.0


