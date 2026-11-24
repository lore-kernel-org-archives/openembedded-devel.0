Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11752.1795496988276601818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g03GvipL;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14004; q=dns/txt;
  s=iport01; t=1795496989; x=1796706589;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b1COx5h4CA3w0xTEkqCQkkPV7OxSsH3i7w9jJRplATM=;
  b=g03GvipLrSPFLOrFaBwpIEP3qlamVnMVP+9qpdsTfsU3tXR/JRHu3vnz
   k26XuFwJkEnbX3/nVnPGzI3U9J/7CFwM8ZXv5oktRxkxmI4tISapfrwW0
   otySSD0Dxbt7f2FSWNuH8uISXB5BNqp1/R6ypGoOz2qlEzW69g0pglgjA
   ZdpOhH/ofPmppCa3xpE2Agy69jLhSH8IlPFDZiGYlypu7nOghhYLjF7Jl
   xONozXHLwSaAaZTeQW9KwZOBFZl76rWoq4NEz4tGQ14bYLcC3cJZ8Tt7r
   goojFaPiHZ2XPsyc2GKsq+hhmtMPaZ4xdIuNfVE+bOX1Yc4/cWkDJDA2a
   w==;
X-CSE-ConnectionGUID: lMQl8eFxTpmIpWzL2G4ofw==
X-CSE-MsgGUID: AswWtJ9/QZSWA7kbAAi5LA==
X-IPAS-Result: =?us-ascii?q?A0AaAAADGgVr/89K/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YUJJA4RUiBuHOIIhA4tmkkOBGwNgDwEBAQ9EDQQBAYQ/RgKOI?=
 =?us-ascii?q?gImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECA?=
 =?us-ascii?q?QMjDwEYAT0JEwMBAgMCJgICIAsjCBAJgwIBgjoDNwIBEZ9jmyR6gTKBAYMpA?=
 =?us-ascii?q?YFU2EwNgloBCxQBgQouAYVBgwAgAYUDXRgBRIQ5JxsbgXKBFYEXglOBBYEaQ?=
 =?us-ascii?q?gKFPIJqBIIiehKBVB4xM4wVAoFPiElIgQIcA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBD?=
 =?us-ascii?q?CcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4HlBSCJ0YtASwfFAEtAQcBI1Y7B?=
 =?us-ascii?q?wECRQxABUmjBoIhoCBxCiiDeYwkjz6FfBozhASBV5JDklQLmH2OCoQKhQeMT?=
 =?us-ascii?q?SZNhGqBaDyBWXAVO4JnCUoZD445g2uEUIEUyHcjNQIJAy8BAQcCBwEMAQMLg?=
 =?us-ascii?q?WiQACyBUgEB?=
IronPort-Data: A9a23:siDArqOhd15UYy7vrR3xlsFynXyQoLVcMsEvi/4bfWQNrUpz1WZSy
 WMaXDuOafbfZWTzft9yYInkphsFuZ6Hx4dnQHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWUsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/FLNUVmMKMIxv5yIHlx5
 9hCB2wKYA/W0opawJrjIgVtrs0uNozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IwBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kV0gjeWwboC9ltqibN5KoVq69
 yX/zV/GK04ZPvW2yGeh2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVlOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:ErCqDKH5EZ4p5/tbpLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:ir4LkG42dLS3OZrEVtss8GstHpAoXG3h1HLxO3CqLTxGFLqbVgrF
X-Talos-MUID: 9a23:CQFPpguyMeFKdwItNM2nrSp9C9tKsuOXOnsyuMoFseCtNHFUEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="59955562"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:46 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 968F318000486
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id DCBFACC51C3; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 12/12]  python3-virtualenv: fix CVE-2026-113722
Date: Mon, 23 Nov 2026 21:09:42 -0800
Message-Id: <20261124050942.1795310-13-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132915
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Adapt launcher generation and pip-seeder repair to virtualenv 20.25.3.
Include the safe RECORD-writing correction from [3], using the helper
provided by the CVE-2026-113721 backport.

[1] https://github.com/pypa/virtualenv/commit/2519941bed33ee0d3ac99277f67913e439e476a9
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-c978-59m8-c77v
[3] https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4

Package each additional upstream prerequisite or correction in its own
embedded patch with its own upstream metadata.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113722.patch  | 207 ++++++++++++++++++
 .../seed-record-exclusive-write.patch         |  48 ++++
 .../python/python3-virtualenv_20.25.3.bb      |   2 +
 3 files changed, 257 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/seed-record-exclusive-write.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722.patch
new file mode 100644
index 0000000000..b70f63a60c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722.patch
@@ -0,0 +1,207 @@
+From 2519941bed33ee0d3ac99277f67913e439e476a9 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:41:16 -0700
+Subject: [PATCH] 🐛 fix(seed): preserve interpreter paths in console scripts (#3417)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113722
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/2519941bed33ee0d3ac99277f67913e439e476a9]
+
+Backport Changes:
+ - Adapt launcher quoting and pip-seeder repair to the older interfaces
+   and external distlib. Preserve the original raw interpreter path.
+ - Replace newer upstream fixtures with unittest checks for benign path
+   characters and RECORD integrity; omit docs/changelog/3417.bugfix.rst.
+   The exclusive RECORD writer is applied as a separate follow-up patch.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/embed/pip_invoke.py            | 45 ++++++++++++++
+ .../seed/embed/via_app_data/pip_install/base.py    | 15 +++++
+ tests/unit/seed/embed/test_cve_2026_113722.py      | 68 ++++++++++++++++++++++
+ 3 files changed, 128 insertions(+)
+
+diff --git a/src/virtualenv/seed/embed/pip_invoke.py b/src/virtualenv/seed/embed/pip_invoke.py
+index 2625a01de3982c1918ec3057af7384d5317195a0..46c88b756d20688a1305cb0b144db3775f98e434 100644
+--- a/src/virtualenv/seed/embed/pip_invoke.py
++++ b/src/virtualenv/seed/embed/pip_invoke.py
+@@ -1,11 +1,20 @@
+ from __future__ import annotations
+ 
++import csv
++import hashlib
++import io
+ import logging
++import os
++from base64 import urlsafe_b64encode
+ from contextlib import contextmanager
++from importlib.metadata import distributions
++from pathlib import Path
++from stat import S_IMODE
+ from subprocess import Popen
+ 
+ from virtualenv.discovery.cached_py_info import LogCmd
+ from virtualenv.seed.embed.base_embed import BaseEmbed
++from virtualenv.seed.embed.via_app_data.pip_install.base import shell_shebang
+ from virtualenv.seed.wheels import Version, get_wheel, pip_wheel_env_run
+ 
+ 
+@@ -20,6 +29,42 @@ class PipInvoke(BaseEmbed):
+         with self.get_pip_install_cmd(creator.exe, for_py_version) as cmd:
+             env = pip_wheel_env_run(self.extra_search_dir, self.app_data, self.env)
+             self._execute(cmd, env)
++        if os.name == "posix":
++            self._rewrite_launchers(creator)
++
++    def _rewrite_launchers(self, creator):
++        selected = self.distribution_to_versions()
++        exe = str(creator.exe).encode("utf-8")
++        for distribution in distributions(path=sorted({str(creator.purelib), str(creator.platlib)})):
++            if distribution.metadata["Name"].lower().replace("-", "_") not in selected:
++                continue
++            rows = list(csv.reader(io.StringIO(distribution.read_text("RECORD") or "")))
++            changed = False
++            for row in rows:
++                path = Path(os.path.abspath(str(distribution.locate_file(row[0]))))
++                if path.parent != creator.script_dir or not path.is_file():
++                    continue
++                content = path.read_bytes()
++                if content.startswith(b"#!/bin/sh\n'''exec' "):
++                    body = content.split(b"\n", 3)[3]
++                elif content.startswith(b"#!" + exe + b"\n") and len(exe.split()) > 1:
++                    body = content.split(b"\n", 1)[1]
++                else:
++                    continue
++                content = shell_shebang(str(creator.exe)) + body
++                mode = S_IMODE(path.stat().st_mode) & 0o755
++                path.unlink()
++                with os.fdopen(os.open(str(path), os.O_WRONLY | os.O_CREAT | os.O_EXCL, mode), "wb") as stream:
++                    stream.write(content)
++                row[1:] = [
++                    "sha256=" + urlsafe_b64encode(hashlib.sha256(content).digest()).rstrip(b"=").decode("ascii"),
++                    str(len(content)),
++                ]
++                changed = True
++            if changed:
++                record = next(row[0] for row in rows if row[0].endswith(".dist-info/RECORD"))
++                with Path(str(distribution.locate_file(record))).open("w", encoding="utf-8", newline="") as stream:
++                    csv.writer(stream).writerows(rows)
+ 
+     @staticmethod
+     def _execute(cmd, env):
+diff --git a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+index 3a210b97b5d505d56ac9b124cb220d13f56f311c..b889885f051891d20a390ff4a4f8d8b9cc952fbb 100644
+--- a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
++++ b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+@@ -3,6 +3,7 @@ from __future__ import annotations
+ import logging
+ import os
+ import re
++import shlex
+ import zipfile
+ from abc import ABC, abstractmethod
+ from configparser import ConfigParser
+@@ -205,6 +206,13 @@ class ScriptMakerCustom(ScriptMaker):
+         self.version_info = version_info.major, version_info.minor
+         self.variants = {"", "X", "X.Y"}
+         self._name = name
++        self._raw_executable = str(executable)
++
++    def _build_shebang(self, executable, post_interp):
++        shebang = super()._build_shebang(executable, post_interp)
++        if os.name != "posix" or len(shebang.split()) == 1:
++            return shebang
++        return shell_shebang(self._raw_executable, post_interp)
+ 
+     def _write_script(self, names, shebang, script_bytes, filenames, ext):  # noqa: PLR0913
+         names.add(f"{self._name}{self.version_info[0]}.{self.version_info[1]}")
+@@ -215,6 +223,13 @@ class ScriptMakerCustom(ScriptMaker):
+         super()._write_script(names, shebang, script_bytes, filenames, ext)
+ 
+ 
++def shell_shebang(executable, post_interp=b""):
++    # The exec line is read by both sh and Python; double-quoted backslashes survive both readers.
++    quoted = shlex.quote(executable).replace("\\", "'\"\\\\\"'")
++    return b"#!/bin/sh\n'''exec' " + quoted.encode("utf-8") + post_interp + b' "$0" "$@"\n' + b"' '''\n"
++
++
+ __all__ = [
+     "PipInstall",
++    "shell_shebang",
+ ]
+diff --git a/tests/unit/seed/embed/test_cve_2026_113722.py b/tests/unit/seed/embed/test_cve_2026_113722.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..21432d6f093d7bb1c45106dce86319249fd813a0
+--- /dev/null
++++ b/tests/unit/seed/embed/test_cve_2026_113722.py
+@@ -0,0 +1,68 @@
++import csv
++import hashlib
++import io
++import os
++import subprocess
++import sys
++import tempfile
++import unittest
++from base64 import urlsafe_b64encode
++from pathlib import Path
++from types import SimpleNamespace
++
++from virtualenv.seed.embed.pip_invoke import PipInvoke
++from virtualenv.seed.embed.via_app_data.pip_install.base import ScriptMakerCustom, shell_shebang
++
++
++@unittest.skipUnless(os.name == "posix", "POSIX console launchers")
++class TestConsoleLauncherPaths(unittest.TestCase):
++    def test_app_data_launcher_preserves_interpreter_path(self):
++        names = ["plain", "two words", "owner's env", 'double"quote env', r"env \path", "env\tname", "a" * 120]
++        for name in names:
++            with self.subTest(name=name), tempfile.TemporaryDirectory() as root:
++                root = Path(root)
++                folder = root / name
++                folder.mkdir()
++                executable = folder / "python"
++                executable.symlink_to(sys.executable)
++                scripts = root / "scripts"
++                scripts.mkdir()
++                (root / "report.py").write_text("import sys\ndef main():\n    print(sys.executable)\n", encoding="utf-8")
++                maker = ScriptMakerCustom(scripts, sys.version_info, executable, "report")
++                maker.make("report = report:main")
++                for prefix in ([], [str(executable)]):
++                    result = subprocess.run(
++                        [*prefix, str(scripts / "report")],
++                        env={**os.environ, "PYTHONPATH": str(root)},
++                        capture_output=True, text=True, check=True, timeout=10,
++                    )
++                    self.assertEqual(result.stdout.strip(), str(executable))
++
++    def test_pip_rewrite_refreshes_launcher_record(self):
++        with tempfile.TemporaryDirectory() as root:
++            root = Path(root) / "two words"
++            scripts = root / "bin"
++            scripts.mkdir(parents=True)
++            library = root / "lib"
++            metadata = library / "demo-1.0.dist-info"
++            metadata.mkdir(parents=True)
++            executable = scripts / "python"
++            executable.symlink_to(sys.executable)
++            launcher = scripts / "demo"
++            body = b"import sys\nprint(sys.executable)\n"
++            launcher.write_bytes(b"#!/bin/sh\n'''exec' \"" + str(executable).encode() + b'\" "$0" "$@"\n' + b"' '''\n" + body)
++            launcher.chmod(0o755)
++            (metadata / "METADATA").write_text("Name: demo\nVersion: 1.0\n", encoding="utf-8")
++            record = metadata / "RECORD"
++            record.write_text("../bin/demo,,\ndemo-1.0.dist-info/RECORD,,\n", encoding="utf-8")
++            creator = SimpleNamespace(exe=executable, purelib=library, platlib=library, script_dir=scripts)
++            seeder = object.__new__(PipInvoke)
++            seeder.distribution_to_versions = lambda: {"demo": "1.0"}
++            seeder._rewrite_launchers(creator)
++            content = launcher.read_bytes()
++            self.assertEqual(content, shell_shebang(str(executable)) + body)
++            row = next(csv.reader(io.StringIO(record.read_text(encoding="utf-8"))))
++            digest = urlsafe_b64encode(hashlib.sha256(content).digest()).rstrip(b"=").decode("ascii")
++            self.assertEqual(row, ["../bin/demo", "sha256=" + digest, str(len(content))])
++            result = subprocess.run([str(launcher)], capture_output=True, text=True, check=True, timeout=10)
++            self.assertEqual(result.stdout.strip(), str(executable))
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/seed-record-exclusive-write.patch b/meta-python/recipes-devtools/python/python3-virtualenv/seed-record-exclusive-write.patch
new file mode 100644
index 0000000000..b305a460d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/seed-record-exclusive-write.patch
@@ -0,0 +1,48 @@
+From 3598e201f6f044e389136b2347a8a919ac03c5f4 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Thu, 22 Oct 2026 13:06:22 -0700
+Subject: [PATCH] 🐛 fix(bash): escape the prompt for every PS1 state (#3466)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4]
+
+Backport Changes:
+ - Select only the pip seeder's RECORD-writing correction and refresh
+   context for the older imports and untyped API. Reuse write_file from
+   CVE-2026-113721.patch and retain newline="" in the in-memory CSV buffer.
+ - Omit the other upstream source, tooling, test-fixture and documentation
+   changes, including docs/changelog/3466.bugfix.rst. The Bash prompt-state
+   subset is applied separately by bash-prompt-state-followup.patch.
+ - Retain the existing launcher/RECORD integrity checks in the CVE patch.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/embed/pip_invoke.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/virtualenv/seed/embed/pip_invoke.py b/src/virtualenv/seed/embed/pip_invoke.py
+index 46c88b756d20688a1305cb0b144db3775f98e434..95b2af56be1642d776517d538d992b0cbddfdd12 100644
+--- a/src/virtualenv/seed/embed/pip_invoke.py
++++ b/src/virtualenv/seed/embed/pip_invoke.py
+@@ -16,6 +16,7 @@ from virtualenv.discovery.cached_py_info import LogCmd
+ from virtualenv.seed.embed.base_embed import BaseEmbed
+ from virtualenv.seed.embed.via_app_data.pip_install.base import shell_shebang
+ from virtualenv.seed.wheels import Version, get_wheel, pip_wheel_env_run
++from virtualenv.util.path import write_file
+ 
+ 
+ class PipInvoke(BaseEmbed):
+@@ -63,8 +64,9 @@ class PipInvoke(BaseEmbed):
+                 changed = True
+             if changed:
+                 record = next(row[0] for row in rows if row[0].endswith(".dist-info/RECORD"))
+-                with Path(str(distribution.locate_file(record))).open("w", encoding="utf-8", newline="") as stream:
+-                    csv.writer(stream).writerows(rows)
++                buffer = io.StringIO(newline="")
++                csv.writer(buffer).writerows(rows)
++                write_file(Path(str(distribution.locate_file(record))), buffer.getvalue().encode("utf-8"))
+ 
+     @staticmethod
+     def _execute(cmd, env):
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 01fddebdfa..ac2e376b40 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -23,6 +23,8 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2026-113720.patch \
             file://CVE-2026-113719.patch \
             file://CVE-2026-113721.patch \
+            file://CVE-2026-113722.patch \
+            file://seed-record-exclusive-write.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

