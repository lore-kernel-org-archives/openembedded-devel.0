Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11969.1795496989552880003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MPqlv05n;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6314; q=dns/txt;
  s=iport01; t=1795496989; x=1796706589;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GXDlbuHh72KJG62mhfI1N19xmowcOI7RmtDeMu94q+g=;
  b=MPqlv05nAH8UUD39tSdQDJAMivYyWENzf1bY99JqYqLD5y8YBBdDjJBl
   nns6IYw/rzvciP4/VI5uabbbA2Ypzb1rxpjSrqb5Zs6Cq05ouZmtbWJmu
   lE+5x1Kx1pGe2Ox58RNdFF7cql6mIMedpjmQCQIyg6JS4C2GJue0IM2AF
   rCyeEU6sEOkxkn5iXLGyNTt4ozs0PE1OwDw8Ud/zwGd/VWUL46CXt3RR+
   skmxMI4wO0hbLXiK1KybK79u2Kag1DqN+01KhwN2VuALIVhgQUjGgboau
   xJlfbpFVdYAUG1TKbB2OdGaxW+QCyeg8NDOL0dKGKNtTwcWPA7y7WkIoB
   g==;
X-CSE-ConnectionGUID: 8fRn5ix+QCqky/XOK/SdwA==
X-CSE-MsgGUID: Vyni0Ok/QGWq/mQojHf2Xg==
X-IPAS-Result: =?us-ascii?q?A0BOAgBXGwVr/8pK/pBaglmCV3VhQkkDhFSPU4IhA4tmk?=
 =?us-ascii?q?kOBfg8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDIw8BGAE9CRMDAQIDAiYCAiALHQEFCBAJg?=
 =?us-ascii?q?wIBgjoDNwIBEZ9omyR6gTKBAYMpAYFU2EwNgloBCxQBgQouhUKDACABhQNdG?=
 =?us-ascii?q?AFEhDknGxuBcoEVg2qBBYEaQgKFPIJqBIIiehKBVI0XAoFPiElIgQIcA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBaAM1EioVbjIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF2A?=
 =?us-ascii?q?oJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAIND?=
 =?us-ascii?q?HQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4HlBSDG?=
 =?us-ascii?q?gEwJwktAStWgRZADpNvj1eCIaAgcQoog3mMJI8+hXwaM4QEgVelFwuYfYJZi?=
 =?us-ascii?q?zGECpFfaIRqgWg8gVlwFYMiCUoZD445g2uFZMh3IzUCCQMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAAiYEA4FPAQE?=
IronPort-Data: A9a23:mnY7daLDFxrsx+NbFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS0WBUz
 zEYW2GCPq7fZGXyeY93Pdji8RlQ75PTnN8yTwAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQoajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0+AnswYIwIud9cGGJfs
 sw/C3c2Yg+q0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3NnwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FIrjui3b4qNEjCMbftEmEfAg
 WGBxkvGG1YfDdud6TTfwn3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:wgXKSKltKkOGu5PHuC5+hik2QqDpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AaOCa42ukFvjgG/vXGB37evEm6It1fEfbkXbAYHa?=
 =?us-ascii?q?TEGV4D42yahir9LxNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A5c8wRAwQNbpAqoHTiCRQqE9SQfeaqJq/DkFVtpZ?=
 =?us-ascii?q?Bgua7LGt1AjCfrDrtcoByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62682780"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:45 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 844B8343F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id BB499CC2EF2; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 06/12]  python3-virtualenv: fix CVE-2026-113715
Date: Mon, 23 Nov 2026 21:09:36 -0800
Message-Id: <20261124050942.1795310-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132918
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix in [1], identified by the
upstream security advisory in [2], to virtualenv 20.25.3.

[1] https://github.com/pypa/virtualenv/commit/b0008a58885ded9227faf8f910c6c402712c750a
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-qmx5-4p3x-wvqf

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113715.patch  | 107 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
new file mode 100644
index 0000000000..823bab9b64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
@@ -0,0 +1,107 @@
+From b0008a58885ded9227faf8f910c6c402712c750a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:56:02 -0700
+Subject: [PATCH] 🐛 fix(create): reject ambiguous venv paths (#3426)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113715
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/b0008a58885ded9227faf8f910c6c402712c750a]
+
+Backport Changes:
+ - Replace the unavailable collapse_line_boundaries helper with a direct
+   check, and use the older system_executable interpreter attribute.
+ - Drop type annotations for the older API while preserving the upstream
+   diagnostic and explanatory comments.
+ - Replace the newer upstream tests with unittest checks for this version;
+   omit docs/changelog/3426.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/create/via_global_ref/venv.py | 24 ++++++++++++++++++++----
+ tests/unit/create/test_cve_2026_113715.py    | 26 ++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 4 deletions(-)
+
+diff --git a/src/virtualenv/create/via_global_ref/venv.py b/src/virtualenv/create/via_global_ref/venv.py
+index 7220af12d00e4f5a5d54108da5cb6baefee5abd9..dd05605dab79104a353372bc41f20c43ddfcf4fd 100644
+--- a/src/virtualenv/create/via_global_ref/venv.py
++++ b/src/virtualenv/create/via_global_ref/venv.py
+@@ -1,7 +1,7 @@
+ from __future__ import annotations
+ 
+ import logging
+-from copy import copy
++from argparse import ArgumentTypeError
+ 
+ from virtualenv.create.via_global_ref.store import handle_store_python
+ from virtualenv.discovery.py_info import PythonInfo
+@@ -57,6 +57,21 @@ class Venv(ViaGlobalRefApi):
+             for exe in creator.executables(self.interpreter):
+                 exe.run(creator, self.symlinks)
+ 
++    @classmethod
++    def validate_dest(cls, raw_value):
++        raw_value = cls._check_line_boundaries(raw_value)
++        return cls._check_line_boundaries(super().validate_dest(raw_value))
++
++    @staticmethod
++    def _check_line_boundaries(value):
++        # stdlib venv writes the destination into pyvenv.cfg without escaping line boundaries.
++        if any(char in value for char in "\n\r\v\f\x1c\x1d\x1e\x85\u2028\u2029"):
++            msg = (
++                f"destination {value!r} must not contain a line boundary as venv cannot record it in pyvenv.cfg"
++            )
++            raise ArgumentTypeError(msg)
++        return value
++
+     def create_inline(self):
+         from venv import EnvBuilder  # noqa: PLC0415
+ 
+@@ -83,10 +98,11 @@ class Venv(ViaGlobalRefApi):
+         return cmd
+ 
+     def set_pyenv_cfg(self):
+-        # prefer venv options over ours, but keep our extra
+-        venv_content = copy(self.pyenv_cfg.refresh())
+         super().set_pyenv_cfg()
+-        self.pyenv_cfg.update(venv_content)
++        if self.interpreter.implementation == "GraalPy":
++            # GraalPy launchers need these settings on Windows and macOS.
++            self.pyenv_cfg["venvlauncher_command"] = self.interpreter.system_executable
++            self.pyenv_cfg["base-executable"] = self.interpreter.system_executable
+ 
+     def __getattribute__(self, item):
+         describe = object.__getattribute__(self, "describe")
+diff --git a/tests/unit/create/test_cve_2026_113715.py b/tests/unit/create/test_cve_2026_113715.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..d9b1fabf18bf595be8757e285ed76fca6a60cb52
+--- /dev/null
++++ b/tests/unit/create/test_cve_2026_113715.py
+@@ -0,0 +1,26 @@
++import tempfile
++import unittest
++from argparse import ArgumentTypeError
++from pathlib import Path
++
++from virtualenv.create.via_global_ref.venv import Venv
++from virtualenv.run import cli_run
++
++
++class TestVenvConfiguration(unittest.TestCase):
++    def test_line_boundaries_are_rejected(self):
++        with tempfile.TemporaryDirectory() as root:
++            for boundary in "\n\r\v\f\x1c\x1d\x1e\x85\u2028\u2029":
++                with self.subTest(boundary=repr(boundary)):
++                    with self.assertRaises(ArgumentTypeError):
++                        Venv.validate_dest(str(Path(root) / ("env" + boundary + "name")))
++
++    def test_normal_environment_uses_selected_configuration(self):
++        with tempfile.TemporaryDirectory() as root:
++            session = cli_run([str(Path(root) / "env"), "--creator", "venv", "--no-seed"])
++            config = session.creator.pyenv_cfg.path.read_text(encoding="utf-8")
++            self.assertIn("include-system-site-packages = false", config)
++            self.assertTrue(session.creator.exe.is_file())
++            session.creator.pyenv_cfg.path.write_text("vendor-marker = unwanted\n", encoding="utf-8")
++            session.creator.set_pyenv_cfg()
++            self.assertNotIn("vendor-marker", session.creator.pyenv_cfg.content)
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 6407eed276..4e7258019e 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://bash-prompt-escaping-prerequisite.patch \
             file://CVE-2026-113726.patch \
             file://CVE-2026-113725.patch \
+            file://CVE-2026-113715.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

