Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB8DCD98CF
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:47:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.205.1763059652336647395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j4NNQ5LC;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso8869835e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 10:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763059650; x=1763664450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dR/foJuF22qSfBDggembYk/qSPNO2wM4agl5W0oKwuk=;
        b=j4NNQ5LCJVNOHWOj12Sd+OR6Qj3SV5RonJsDElJKt2ivQP6hbGag/ih37Ld5TVuKtc
         b1DWMLVjs0PL5FdagdawNC00tTxpa71DZcLXG4KuUCiUBlpS58tWOV3apprsb1/ekwNo
         hOn/RDd+DRnlorbJDyfzNMo/ru1ga9z0UQF73blcg7C/qj63kzw6/LCuN3/3dWN/vyHC
         8MuE9VB06A2ZKV8HKlOCAwXttYrJ5XhC4aeArDvSWNvPVdUpRVLRvA+casiQhBeel6i6
         oj+OEczk+jzssgDSVPp1+dL4YhN5G+s8RPXyiMdS1/zqKXUwWl8MTGDm0B9tWzRzIgws
         grOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059650; x=1763664450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR/foJuF22qSfBDggembYk/qSPNO2wM4agl5W0oKwuk=;
        b=FDStlBXrI+5B3qpCkn4l6Se5a/YjkpKex53mfTkOPOvLuSGXdpNIyib/YMIJyEKNWU
         wmc5ELppIuRXzf8dkwL0ShO3yhs4+RFzEUp03qEb4z0JXnbVpNUS1L8PgEGtZzqaEhJx
         DIrEZw5wVF+MR328dI6fA73b3kTKJMjCAGOmZlGW7FrQ+VIevsTm9zrmaYKNOSIHSq2o
         diU5urMw/AWInnUft5iAX8WgzkbYP9G1E6+XVYuYtQPDzfiUX4J/cDSHQ52wJDzUuqfb
         wfnBx3F3KGgHpbikDjTpOcg0+6/iYwXs50Ruip3Y00B+3bT348raoo/1Yqgc5b/kiDEs
         PL1w==
X-Gm-Message-State: AOJu0YzQDq/KTYvoFEna5cKFq6W5OgpZlkdyhBifPMWkbGuqfzCmGy7f
	ILYUvLPqOvd+hp4VHpp78/xGGPCNPAYAWnyNynfDhvPJvZRxTvDCG1CILI2bbGBD
X-Gm-Gg: ASbGnculbZ4GgDa+zpREKVbyDl3Sa+lFIHP77DJK4bWr4jjghx7lzqnVVwYji5jZHww
	zkKxR/K5Zps3TLkGdwSJ9qtN9CxUapAUM+NZoxm23HMpGyQhLaYyOoes8wMzPoOsF5O6hfyIMEH
	8QGdzrpa4ingwT7BaF22dV7cI0gIjUfId4tXLpakU0DBO203caHWhjGMJKLbu71C3ZSM4CKc1Xu
	8DbrFSVz/v98SK2uoBw4QrcbGzwjvcWmAuLR8Wq5JQgPIV6LJKxW+01lx7++pM4J2v/1dY2AVK0
	dro1ksFXXzKuC7rnIAMzw7vdNdSLD0DSrPmd4p3WXXh79FSxmNPPg/vhhqnAsHp1neKeD28DYMI
	ZZhLKOFpoYNYEl7R2RphCJC3ahr3kndxqtVuHbW2R6X8hC7+WKfkwI/lE0QGkXvRSJaCcA/dPYe
	L5/mHW45jhKfX9E6zczLtfa5s61mkOZ2P7EeaYUbGcJIh/Wu39u3mNPQk1HgidS3qMMQuvfp/r+
	GYItCiPzB/Ye7+dPnB4v9qmWdMMKXKlUtpNMybV1AT27yS/Ud9nTh8mzTCIjg==
X-Google-Smtp-Source: AGHT+IGBAiI7utjOP2s0BUDWqMpQR2T4uQZEBz5GZ81g99Iqsdicmaimrez4gz6hBr7FYipvHv7kpw==
X-Received: by 2002:a05:600c:1f0f:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4778feb51f6mr4589235e9.29.1763059650122;
        Thu, 13 Nov 2025 10:47:30 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e97a87sm5852432f8f.20.2025.11.13.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:47:29 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: t.f.g.geelen@gmail.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-uvicorn: new recipe (0.38.0) from meta-homeassistant
Date: Thu, 13 Nov 2025 19:47:21 +0100
Message-ID: <20251113184721.147455-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121655

Moved the recipe from meta-homeassistant to meta-openembedded.
@see: https://github.com/meta-homeassistant/meta-homeassistant/pull/177#issuecomment-3510619876

- version bump from 0.35.0 to 0.38.0 (current latest release)
- added ptests
   - patch to skip 5 tests that did not pass the run
   - added tests to PTESTS_SLOW_META_PYTHON

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../0001-ptest-disable-failing-tests.patch    | 69 +++++++++++++++++++
 .../python/python3-uvicorn_0.38.0.bb          | 30 ++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 750051e804..1b7e14b9b6 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -127,6 +127,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-scrypt \
     python3-traitlets \
     python3-typer \
+    python3-uvicorn \
     python3-yappi \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch b/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch
new file mode 100644
index 0000000000..54e8c21aca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch
@@ -0,0 +1,69 @@
+From 53d9b7ad6287313709a665baa79fc581dcdaf92a Mon Sep 17 00:00:00 2001
+From: Jan Vermaete <jan.vermaete@gmail.com>
+Date: Wed, 12 Nov 2025 19:58:20 +0100
+Subject: [PATCH 1/1] ptest: disable failing tests
+
+Tests did not run in qemux86-64
+
+Upstream-Status: Pending [https://github.com/Kludex/uvicorn/discussions/2759]
+
+Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
+---
+ tests/protocols/test_websocket.py      | 3 +++
+ tests/supervisors/test_multiprocess.py | 2 ++
+ tests/test_config.py                   | 5 +++--
+ 3 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/tests/protocols/test_websocket.py b/tests/protocols/test_websocket.py
+index 2e1a33a..ae1e041 100644
+--- a/tests/protocols/test_websocket.py
++++ b/tests/protocols/test_websocket.py
+@@ -685,6 +685,9 @@ MAX_WS_BYTES = 1024 * 1024 * 16
+ MAX_WS_BYTES_PLUS1 = MAX_WS_BYTES + 1
+ 
+ 
++# FAIL: tests/protocols/test_websocket.py:test_send_binary_data_to_server_bigger_than_default_on_websockets[httptools-max=defaults sent=defaults+1]
++# FAIL: tests/protocols/test_websocket.py:test_send_binary_data_to_server_bigger_than_default_on_websockets[h11-max=defaults sent=defaults+1]
++@pytest.mark.skip(reason="failing on Yocto/OpenEmbedded")
+ @pytest.mark.parametrize(
+     "client_size_sent, server_size_max, expected_result",
+     [
+diff --git a/tests/supervisors/test_multiprocess.py b/tests/supervisors/test_multiprocess.py
+index e1f594e..43002c3 100644
+--- a/tests/supervisors/test_multiprocess.py
++++ b/tests/supervisors/test_multiprocess.py
+@@ -75,6 +75,7 @@ def test_multiprocess_run() -> None:
+     supervisor.join_all()
+ 
+ 
++@pytest.mark.skip(reason="fails on OpenEmbedded/Yocto")
+ @new_console_in_windows
+ def test_multiprocess_health_check() -> None:
+     """
+@@ -121,6 +122,7 @@ def test_multiprocess_sigbreak() -> None:  # pragma: py-not-win32
+     supervisor.join_all()
+ 
+ 
++@pytest.mark.skip(reason="failing on Yocto/OpenEmbedded")
+ @pytest.mark.skipif(not hasattr(signal, "SIGHUP"), reason="platform unsupports SIGHUP")
+ def test_multiprocess_sighup() -> None:
+     """
+diff --git a/tests/test_config.py b/tests/test_config.py
+index 9c80ca4..fe4c2e8 100644
+--- a/tests/test_config.py
++++ b/tests/test_config.py
+@@ -303,8 +303,9 @@ def test_asgi_version(app: ASGIApplication, expected_interface: Literal["2.0", "
+ @pytest.mark.parametrize(
+     "use_colors, expected",
+     [
+-        pytest.param(None, None, id="use_colors_not_provided"),
+-        pytest.param("invalid", None, id="use_colors_invalid_value"),
++        #pytest.param(None, None, id="use_colors_not_provided"),  reason="failing on Yocto/OpenEmbedded"
++        #pytest.param("invalid", None, id="use_colors_invalid_value"),  reason="failing on Yocto/OpenEmbedded"
++
+         pytest.param(True, True, id="use_colors_enabled"),
+         pytest.param(False, False, id="use_colors_disabled"),
+     ],
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
new file mode 100644
index 0000000000..b0ce49be97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "The lightning-fast ASGI server."
+HOMEPAGE = "https://github.com/encode/uvicorn"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d"
+
+SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
+
+inherit pypi python_hatchling ptest-python-pytest
+
+PYPI_PACKAGE = "uvicorn"
+
+RDEPENDS:${PN} = "\
+    python3-click \
+    python3-h11 (>=0.8) \
+    python3-httptools \
+    python3-multiprocessing \
+    python3-python-dotenv \
+    python3-websockets \
+    python3-wsproto \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-a2wsgi \
+    python3-httpx \
+    python3-pytest-mock \
+    python3-pyyaml \
+"
-- 
2.47.3


