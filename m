Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30041.1793869209251710244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A1/YK71m;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8611; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3zUjOajfTpz6JCpHRPfgNz+qg9TFbfv0WDhRwfAwajE=;
  b=A1/YK71mbbIQjG3KoikgzUEST60iO/pbBCQBg3FhJ3wyFLppw2oQN4+d
   LG87vxAMX7R7axpSRe4eAd3YUtxIisFMj8PqCuNqemfgzBxQKMXez9oWV
   zS6+zhYJkol+LmMAQdNuF1LaShW1tf+4A3RAfPngTQWtYUu5d81gdhfHt
   1SZfN7mmDjalKwV5QKnxl0bBvOOE0lBZbcwZA4b4hVa0dm8+wn7zqmI/U
   eqSXjv2YEkj3LrCF7jKzlJkkq2CjCMVCBxlyHfCfVLmQ4nuZKuObmaL07
   IoODFTn9KNimvZ0i1Via4tXRjJ5KNqLO31iL1XmMfvxLR7Aewzuf+fDzc
   w==;
X-CSE-ConnectionGUID: gihlA6dISyiuCXtIAIXSKg==
X-CSE-MsgGUID: PXJoTMBaS76zFQK29vnvHA==
X-IPAS-Result: =?us-ascii?q?A0BOAgDGROxq/5D/Ja1aHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OCIQOLZZI8gX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0JEwMBAgMCJgICI?=
 =?us-ascii?q?AsdAQUIEAmDAgGCOgM3AxGhDZsken8zgQGDKQGBVNhMDYJaAQsUAYEKLoVAg?=
 =?us-ascii?q?n8gAYUDXRgBRIQ5JxsbgXKBFYNpgQWBGkIChTyCagSCIoEMgVqBAwmMDAKBU?=
 =?us-ascii?q?oZxSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGBYEdgR6BEoEHX?=
 =?us-ascii?q?YErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/F?=
 =?us-ascii?q?QxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD0BbgeSL4MRMQw+E?=
 =?us-ascii?q?wEKIQQTP4EWGScFCZNvj1iCIaAgcQoog3iMJI8+hXwaM4QEgVeSQpJUC5h9g?=
 =?us-ascii?q?lmLMYQKkV9ohGmBaDyBWXAVO4JnCUoZD445g2uFZMh3JjICCQMvAQEHAgcBD?=
 =?us-ascii?q?AEDC4FokAItgU8BAQ?=
IronPort-Data: A9a23:HpqwHamZjj0TuVDUvkTphkro5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeDzyGaKuIZGenLdBzaYm0oUsEvpPSmtJiGwBu/npkE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYIZ+uJeX21vz
 u0ZNRs9cjGqptKN473uH4GAhux7RCXqFJkUtnclyXTSCuwrBMicBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZj/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeOIofRFZ8Pwi50o
 Er+z0b+PjQwPefAlyiry1H21/HJgwPSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:NKGRuamA8ASMW+qRcgKPl8e1m1fpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:eSy/pWwCVd0nq3aYViCvBgUbG8AhWyPR7UzBIlKTOXpIYZylcnyfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AVLsOgw/D5pxgwUBSQ+Ds48yQf/9YwaOSLWoEqsp?=
 =?us-ascii?q?Yqee9FnYhJTGDrB3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530338224"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 30430180004BC
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 85F93CBEFAB; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 09/18] python3-virtualenv: fix CVE-2026-113715
Date: Thu,  5 Nov 2026 00:59:58 -0800
Message-Id: <20261105090007.351866-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131883
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Reject line boundaries in stdlib venv paths and
regenerate pyvenv.cfg from the selected interpreter and options,
instead of merging potentially injected configuration read back from
the intermediate file.

[1] https://github.com/pypa/virtualenv/commit/b0008a58885ded9227faf8f910c6c402712c750a
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-qmx5-4p3x-wvqf

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113715.patch  | 165 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
new file mode 100644
index 0000000000..8ab16b5d93
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
@@ -0,0 +1,165 @@
+From b0008a58885ded9227faf8f910c6c402712c750a Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
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
+- Reuse the identical _one_line helper already backported for
+  CVE-2026-102938 because 21.2.1 lacks the later
+  virtualenv.util.text.collapse_line_boundaries helper.
+- Use the 21.2.1 system_executable API and GraalVM implementation name
+  in the launcher settings and regression test instead of the later
+  system_exe API and GraalPy name.
+- Import Final in the older test module for the upstream annotations.
+- Omit the upstream release changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/create/via_global_ref/venv.py | 26 +++++++--
+ tests/unit/create/test_creator.py            | 56 ++++++++++++++++++++
+ 2 files changed, 77 insertions(+), 5 deletions(-)
+
+diff --git a/src/virtualenv/create/via_global_ref/venv.py b/src/virtualenv/create/via_global_ref/venv.py
+index 9c95d12..2bfd1b4 100644
+--- a/src/virtualenv/create/via_global_ref/venv.py
++++ b/src/virtualenv/create/via_global_ref/venv.py
+@@ -1,11 +1,12 @@
+ from __future__ import annotations
+ 
+ import logging
+-from copy import copy
+-from typing import TYPE_CHECKING
++from argparse import ArgumentTypeError
++from typing import TYPE_CHECKING, Final
+ 
+ from python_discovery import PythonInfo
+ 
++from virtualenv.create.pyenv_cfg import _one_line as collapse_line_boundaries
+ from virtualenv.create.via_global_ref.store import handle_store_python
+ from virtualenv.util.error import ProcessCallFailedError
+ from virtualenv.util.path import ensure_dir
+@@ -67,6 +68,20 @@ class Venv(ViaGlobalRefApi):
+             for exe in creator.executables(self.interpreter):
+                 exe.run(creator, self.symlinks)
+ 
++    @classmethod
++    def validate_dest(cls, raw_value: str) -> str:
++        return cls._check_line_boundaries(super().validate_dest(cls._check_line_boundaries(raw_value)))
++
++    @staticmethod
++    def _check_line_boundaries(value: str) -> str:
++        # stdlib venv writes the destination into pyvenv.cfg without escaping line boundaries.
++        if collapse_line_boundaries(value) != value:
++            msg: Final = (
++                f"destination {value!r} must not contain a line boundary as venv cannot record it in pyvenv.cfg"
++            )
++            raise ArgumentTypeError(msg)
++        return value
++
+     def create_inline(self) -> None:
+         from venv import EnvBuilder  # noqa: PLC0415
+ 
+@@ -95,10 +110,11 @@ class Venv(ViaGlobalRefApi):
+         return cmd  # ty: ignore[invalid-return-type]
+ 
+     def set_pyenv_cfg(self) -> None:
+-        # prefer venv options over ours, but keep our extra
+-        venv_content = copy(self.pyenv_cfg.refresh())
+         super().set_pyenv_cfg()
+-        self.pyenv_cfg.update(venv_content)
++        if self.interpreter.implementation == "GraalVM":
++            # GraalPy launchers need these settings on Windows and macOS.
++            self.pyenv_cfg["venvlauncher_command"] = self.interpreter.system_executable
++            self.pyenv_cfg["base-executable"] = self.interpreter.system_executable
+ 
+     def __getattribute__(self, item: str) -> object:
+         describe = object.__getattribute__(self, "describe")
+diff --git a/tests/unit/create/test_creator.py b/tests/unit/create/test_creator.py
+index 3a8ad25..bd0f071 100644
+--- a/tests/unit/create/test_creator.py
++++ b/tests/unit/create/test_creator.py
+@@ -19,6 +19,7 @@ from pathlib import Path
+ from stat import S_IREAD, S_IRGRP, S_IROTH
+ from textwrap import dedent
+ from threading import Thread
++from typing import Final
+ 
+ import pytest
+ from python_discovery import PythonInfo
+@@ -95,6 +96,42 @@ def system(session_app_data):
+ 
+ 
+ CURRENT_CREATORS = [i for i in CreatorSelector.for_interpreter(CURRENT).key_to_class if i != "builtin"]
++
++
++@pytest.mark.skipif("venv" not in CURRENT_CREATORS, reason="stdlib venv is unavailable")
++@pytest.mark.parametrize(
++    "boundary",
++    [
++        pytest.param(char, id=name)
++        for name, char in (
++            ("newline", "\n"),
++            ("return", "\r"),
++            ("vertical-tab", "\v"),
++            ("form-feed", "\f"),
++            ("file-separator", "\x1c"),
++            ("group-separator", "\x1d"),
++            ("record-separator", "\x1e"),
++            ("next-line", "\x85"),
++            ("line-separator", "\u2028"),
++            ("paragraph-separator", "\u2029"),
++        )
++    ],
++)
++def test_venv_creator_rejects_line_boundary(tmp_path: Path, capsys: pytest.CaptureFixture[str], boundary: str) -> None:
++    destination: Final = tmp_path / f"project{boundary}name"
++    with pytest.raises(SystemExit) as context:
++        cli_run([str(destination), "--creator", "venv", "--no-seed"])
++    assert context.value.code == 2
++    assert "must not contain a line boundary" in capsys.readouterr().err
++    assert not list(tmp_path.iterdir())
++
++
++@pytest.mark.skipif("venv" not in CURRENT_CREATORS, reason="stdlib venv is unavailable")
++def test_venv_creator_accepts_plain_destination(tmp_path: Path) -> None:
++    session: Final = cli_run([str(tmp_path / "environment"), "--creator", "venv", "--no-seed"])
++    assert (session.creator.dest / "pyvenv.cfg").is_file()
++
++
+ CREATE_METHODS = []
+ for k, v in CreatorSelector.for_interpreter(CURRENT).key_to_meta.items():
+     if k in CURRENT_CREATORS:
+@@ -270,6 +307,25 @@ def test_create_vcs_ignore_exists_override(tmp_path) -> None:
+     assert git_ignore.read_text(encoding="utf-8") == "magic"
+ 
+ 
++@pytest.mark.skipif(not CURRENT.has_venv, reason="requires venv")
++@pytest.mark.parametrize("global_packages", [pytest.param(False, id="isolated"), pytest.param(True, id="global")])
++def test_venv_configuration_uses_selected_options(tmp_path: Path, global_packages: bool) -> None:
++    args: Final = [str(tmp_path / "env"), "--creator", "venv", "--no-seed"]
++    if global_packages:
++        args.append("--system-site-packages")
++    session: Final = cli_run(args)
++    session.creator.pyenv_cfg.path.write_text("vendor-marker = unused\n", encoding="utf-8")
++    session.creator.set_pyenv_cfg()
++    executable: Final = session.creator.interpreter.system_executable if CURRENT.implementation == "GraalVM" else None
++    expected: Final = {
++        "vendor-marker": None,
++        "include-system-site-packages": str(global_packages).lower(),
++        "venvlauncher_command": executable,
++        "base-executable": executable,
++    }
++    assert {key: session.creator.pyenv_cfg.content.get(key) for key in expected} == expected
++
++
+ @pytest.mark.skipif(not CURRENT.has_venv, reason="requires interpreter with venv")
+ def test_venv_fails_not_inline(tmp_path, capsys, mocker) -> None:
+     if hasattr(os, "geteuid") and os.geteuid() == 0:
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 2c584361ab..d514e79358 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -23,6 +23,7 @@ SRC_URI += " \
     file://CVE-2026-113725.patch \
     file://CVE-2026-113723.patch \
     file://CVE-2026-115586.patch \
+    file://CVE-2026-113715.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

