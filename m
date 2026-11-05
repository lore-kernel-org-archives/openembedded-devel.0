Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30269.1793869209791001985
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VjXD8cyL;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15204; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=myaF5RjFauFZwaXBqFJqUad1D714SIA9wcMfcdV2Jlc=;
  b=VjXD8cyLHpq3HUruJPEenisfczjvjYK4yntcI1hzZwhrfdhqtKngqENC
   +MXn0za5KdJRLMBa3+joZzUy6LloMW4u19GcALeVWu/geEDY7Sh9X/yNq
   dcYbV6xeiw50S4EVoYwOqr/KJ2Kl7t+XNH67QHOEzpGtBjTwm2elH2xrS
   MNRf5/Aevsml8ee0kRp48iQaHR0PCGALrouI4uFbB7HoSsQfy9zxp77wN
   zxmZ0+kIYVXbkTBCQ9HYFmlFyS+lpLs88J440b9n/YBTpSZvICEqyD+eE
   6Q4++OADu7h25eWk3AEddKjtOv+LUpH5t10G6zuQ3Oyq1WFqTQ7/BHPQl
   A==;
X-CSE-ConnectionGUID: nqH1OvrMT2S+90wnyrMvcg==
X-CSE-MsgGUID: 4XATFuPWTcStt8f11w1/tA==
X-IPAS-Result: =?us-ascii?q?A0AnAABRROxq/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJhFeIG4c4giEDi2WSPIF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAEbI?=
 =?us-ascii?q?gkTAwECAwImAgIgCx0BBQgQCYMCAYI6AzcDEaEGmyR6fzOBAYMpAT8CQ1DYT?=
 =?us-ascii?q?A2CWgELFAGBCi4BhT+CfyABhQNdGAFEhDknGxuBcoEVg2mBBYEaQgEBgScRh?=
 =?us-ascii?q?ASCagSCIoEMgVoeMjOMFQKBUoZxSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPhcvWBsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNS?=
 =?us-ascii?q?BEsNxUZBD0BbgeSL4JkLAEBLDMuAQckBFI7CEcMGC0JQJMtj1qCIaAgcQoog?=
 =?us-ascii?q?3iMJI8+hXwaM4QEgVeSQpJUC5h9glmLMYQKhQeNQIRpgWg8gUcLB3AVO4JnC?=
 =?us-ascii?q?UoZD44rDguDYIF/glGBFMh3JjICCTIBAQcCBwEMAQMLgWiQAAEnBIFSAQE?=
IronPort-Data: A9a23:vR219qu+zzpPmMh5QezcmTFruufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWyAbvuDYTT3ftgkbYmx/ENQvZLWmIM1GgBl/ik2QyITgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/P9XWEZQ7
 9kkcgtOP0icgfOs5aywRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4DWHpsIxhfAz
 o7A1zjJKy00KeSg9TG+7m78iLaWgnq8RKtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:kfguvK7ekXXkNJAWTgPXwOrXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:yUDbXWPj1zinM+5DXjBHrWkKAOUZKEaenS/PJV6iLHhiR+jA
X-Talos-MUID: 9a23:F/ybKQW2sDj5q5rq/GPcrQ1MKf9X36+VFFxdn8xfpJDDKQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544365090"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 8DF36180007FA
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9AFA0CBEF6F; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 14/18] python3-virtualenv: fix CVE-2026-113722
Date: Thu,  5 Nov 2026 01:00:03 -0800
Message-Id: <20261105090007.351866-15-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131891
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Preserve interpreter paths as literal data in
POSIX console launchers for both the app-data and pip seeders, and
update the pip launchers' RECORD hashes after rewriting them.

Include the RECORD-writing follow-up from [3] so the new rewrite path
replaces existing links and uses exclusive creation. The required
write_file helper comes from the preceding CVE-2026-113721 fix [4].

Regenerate existing environments to repair their launchers. A later
independent pip install or upgrade can replace the corrected launchers;
this backport does not modify pip's vendored distlib.

[1] https://github.com/pypa/virtualenv/commit/2519941bed33ee0d3ac99277f67913e439e476a9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-113722
[3] https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4
[4] https://github.com/pypa/virtualenv/commit/d25f28699eefb1fc34a251e5adf2b5de844c36cd

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-113722_p1.patch                  | 262 ++++++++++++++++++
 .../CVE-2026-113722_p2.patch                  |  50 ++++
 .../python/python3-virtualenv_21.2.1.bb       |   2 +
 3 files changed, 314 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1.patch
new file mode 100644
index 0000000000..26a6917c9a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1.patch
@@ -0,0 +1,262 @@
+From 2519941bed33ee0d3ac99277f67913e439e476a9 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:41:16 -0700
+Subject: [PATCH] 🐛 fix(seed): preserve interpreter paths in console scripts
+ (#3417)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113722
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/2519941bed33ee0d3ac99277f67913e439e476a9]
+
+Backport Changes:
+- Add the os import absent from the older pip seeder and import only
+  shell_shebang, without the later EntryPointConfig helper. The older
+  module has no existing EntryPointConfig import to replace.
+- Omit the release-only changelog fragment; the release documentation
+  directory is absent from the 21.2.1 source distribution.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/embed/pip_invoke.py       | 44 +++++++++
+ .../embed/via_app_data/pip_install/base.py    | 15 +++
+ .../embed/test_bootstrap_link_via_app_data.py | 92 ++++++++++++++++++-
+ 3 files changed, 150 insertions(+), 1 deletion(-)
+
+diff --git a/src/virtualenv/seed/embed/pip_invoke.py b/src/virtualenv/seed/embed/pip_invoke.py
+index 1f333d3..6a16605 100644
+--- a/src/virtualenv/seed/embed/pip_invoke.py
++++ b/src/virtualenv/seed/embed/pip_invoke.py
+@@ -1,14 +1,22 @@
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
+ from pathlib import Path
+ from shutil import copyfile
++from stat import S_IMODE
+ from subprocess import Popen
+ from tempfile import TemporaryDirectory
+ from typing import TYPE_CHECKING, Final
+ 
+ from virtualenv.seed.embed.base_embed import BaseEmbed
++from virtualenv.seed.embed.via_app_data.pip_install.base import shell_shebang
+ from virtualenv.seed.wheels import get_wheel, pip_wheel_env_run
+ from virtualenv.seed.wheels.util import Version
+ from virtualenv.util.subprocess import LogCmd
+@@ -33,6 +41,42 @@ class PipInvoke(BaseEmbed):
+         with self.get_pip_install_cmd(creator.exe, for_py_version) as cmd:
+             env = pip_wheel_env_run(self.extra_search_dir, self.app_data, self.env)
+             self._execute(cmd, env)
++        if os.name == "posix":
++            self._rewrite_launchers(creator)
++
++    def _rewrite_launchers(self, creator: Creator) -> None:
++        selected: Final = self.distribution_to_versions()
++        exe: Final = str(creator.exe).encode("utf-8")
++        for distribution in distributions(path=sorted({str(creator.purelib), str(creator.platlib)})):
++            if distribution.metadata["Name"].lower().replace("-", "_") not in selected:
++                continue
++            rows: Final = list(csv.reader(io.StringIO(distribution.read_text("RECORD") or "")))
++            changed = False
++            for row in rows:
++                path: Final = Path(os.path.abspath(str(distribution.locate_file(row[0]))))
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
++                mode: Final = S_IMODE(path.stat().st_mode) & 0o755
++                path.unlink()
++                with os.fdopen(os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, mode), "wb") as stream:
++                    stream.write(content)
++                row[1:] = [
++                    "sha256=" + urlsafe_b64encode(hashlib.sha256(content).digest()).rstrip(b"=").decode("ascii"),
++                    str(len(content)),
++                ]
++                changed = True
++            if changed:
++                record: Final = next(row[0] for row in rows if row[0].endswith(".dist-info/RECORD"))
++                with Path(str(distribution.locate_file(record))).open("w", encoding="utf-8", newline="") as stream:
++                    csv.writer(stream).writerows(rows)
+ 
+     @staticmethod
+     def _execute(cmd: list[str], env: dict[str, str]) -> Popen[bytes]:
+diff --git a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+index 086ae0c..c741bd3 100644
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
+@@ -214,6 +215,13 @@ class ScriptMakerCustom(ScriptMaker):
+         self.version_info = version_info.major, version_info.minor  # ty: ignore[unresolved-attribute]
+         self.variants = {"", "X", "X.Y"}
+         self._name = name
++        self._raw_executable = str(executable)
++
++    def _build_shebang(self, executable: bytes, post_interp: bytes) -> bytes:
++        shebang: Final = super()._build_shebang(executable, post_interp)
++        if os.name != "posix" or len(shebang.split()) == 1:
++            return shebang
++        return shell_shebang(self._raw_executable, post_interp)
+ 
+     def _write_script(
+         self, names: set[str], shebang: bytes, script_bytes: bytes, filenames: list[str], ext: str
+@@ -226,6 +234,13 @@ class ScriptMakerCustom(ScriptMaker):
+         super()._write_script(names, shebang, script_bytes, filenames, ext)
+ 
+ 
++def shell_shebang(executable: str, post_interp: bytes = b"") -> bytes:
++    # The exec line is read by both sh and Python; double-quoted backslashes survive both readers.
++    quoted: Final = shlex.quote(executable).replace("\\", "'\"\\\\\"'")
++    return b"#!/bin/sh\n'''exec' " + quoted.encode("utf-8") + post_interp + b' "$0" "$@"\n' + b"' '''\n"
++
++
+ __all__ = [
+     "PipInstall",
++    "shell_shebang",
+ ]
+diff --git a/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py b/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
+index 278a48e..a9917c4 100644
+--- a/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
++++ b/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
+@@ -1,10 +1,13 @@
+ from __future__ import annotations
+ 
+ import contextlib
++import csv
++import hashlib
+ import os
+ import sys
++from base64 import urlsafe_b64encode
+ from stat import S_IWGRP, S_IWOTH, S_IWUSR
+-from subprocess import Popen, check_call
++from subprocess import Popen, check_call, run
+ from threading import Thread
+ from typing import TYPE_CHECKING, Final
+ 
+@@ -23,6 +26,7 @@ if TYPE_CHECKING:
+     from pytest_mock import MockerFixture
+ 
+ 
++@pytest.mark.usefixtures("_no_coverage")
+ @pytest.mark.parametrize(
+     ("metadata_file", "content"),
+     [
+@@ -109,6 +113,70 @@ def test_seed_metadata_keeps_reseeding_supported(
+     )
+ 
+ 
++@pytest.mark.parametrize(
++    "name",
++    [
++        pytest.param("plain", id="plain"),
++        pytest.param("two words", id="space"),
++        pytest.param("owner's env", id="apostrophe"),
++        pytest.param("$(echo a) `echo b`", id="command-substitution"),
++        pytest.param("a" * 120, id="long", marks=pytest.mark.skipif(os.name == "nt", reason="POSIX shebang limit")),
++        pytest.param("env \\path", id="backslash", marks=pytest.mark.skipif(os.name == "nt", reason="POSIX filename")),
++        pytest.param("env\tname", id="tab", marks=pytest.mark.skipif(os.name == "nt", reason="POSIX filename")),
++    ],
++)
++@pytest.mark.parametrize(
++    "via_python",
++    [
++        pytest.param(False, id="launcher"),
++        pytest.param(
++            True, id="python", marks=pytest.mark.skipif(os.name == "nt", reason="Windows launcher is an executable")
++        ),
++    ],
++)
++@pytest.mark.parametrize("seeder", [pytest.param("app-data", id="app-data"), pytest.param("pip", id="pip")])
++def test_console_script_preserves_interpreter_path(
++    tmp_path: Path, current_fastest: str, name: str, via_python: bool, seeder: str
++) -> None:
++    destination: Final = os.path.join(str(tmp_path), name, "env")
++    run(
++        [
++            sys.executable,
++            "-m",
++            "virtualenv",
++            destination,
++            "--seeder",
++            seeder,
++            "--creator",
++            current_fastest,
++            "--activators",
++            "",
++            "--no-periodic-update",
++            "--pip",
++            "embed",
++        ],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        timeout=60,
++        check=True,
++    )
++    scripts: Final = os.path.join(destination, "Scripts" if os.name == "nt" else "bin")
++    result: Final = run(
++        [
++            *([os.path.join(scripts, "python")] if via_python else []),
++            os.path.join(scripts, "pip.exe" if os.name == "nt" else "pip"),
++            "--version",
++        ],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        timeout=30,
++        check=True,
++    )
++    assert os.path.normcase(destination) in os.path.normcase(result.stdout)
++
++
+ @pytest.mark.slow
+ @pytest.mark.parametrize("copies", [False, True] if fs_supports_symlink() else [True])
+ def test_seed_link_via_app_data(tmp_path, coverage_env, current_fastest, copies, for_py_version) -> None:  # noqa: PLR0915
+@@ -348,3 +416,25 @@ def _run_parallel_threads(tmp_path):
+     for thread in threads:
+         thread.join()
+     return exceptions
++
++
++@pytest.mark.skipif(os.name != "posix", reason="POSIX shell launchers")
++@pytest.mark.parametrize(
++    ("name", "via_shell"),
++    [
++        pytest.param("plain", False, id="plain"),
++        pytest.param("two words", True, id="space"),
++        pytest.param("env\tname", True, id="tab"),
++    ],
++)
++def test_pip_launcher_record_matches_contents(tmp_path: Path, name: str, via_shell: bool) -> None:
++    session: Final = cli_run([str(tmp_path / name), "--seeder", "pip", "--pip", "embed", "--no-periodic-update"])
++    record: Final = next(session.creator.purelib.glob("pip-*.dist-info/RECORD"))
++    with record.open(encoding="utf-8", newline="") as stream:
++        row: Final = next(row for row in csv.reader(stream) if row[0].endswith("/bin/pip"))
++    content: Final = (session.creator.script_dir / "pip").read_bytes()
++    assert content.startswith(b"#!/bin/sh\n") is via_shell
++    assert row[1:] == [
++        "sha256=" + urlsafe_b64encode(hashlib.sha256(content).digest()).rstrip(b"=").decode("ascii"),
++        str(len(content)),
++    ]
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2.patch
new file mode 100644
index 0000000000..5ae6733326
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2.patch
@@ -0,0 +1,50 @@
+From 3598e201f6f044e389136b2347a8a919ac03c5f4 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Thu, 22 Oct 2026 13:06:22 -0700
+Subject: [PATCH] 🐛 fix(bash): escape the prompt for every PS1 state (#3466)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113722
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4]
+
+Backport Changes:
+- Carry only pip_invoke.py's helper import and exclusive RECORD-write
+  change, now required by the backported launcher rewrite. Use the
+  write_file helper introduced by the CVE-2026-113721 backport.
+- Omit the remaining shell, Windows, test, tooling and documentation
+  changes. The required Bash/Zsh fixes are already carried separately
+  in CVE-2026-115586.patch; the other changes are outside this fix.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/seed/embed/pip_invoke.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/virtualenv/seed/embed/pip_invoke.py b/src/virtualenv/seed/embed/pip_invoke.py
+index 6a16605..e098128 100644
+--- a/src/virtualenv/seed/embed/pip_invoke.py
++++ b/src/virtualenv/seed/embed/pip_invoke.py
+@@ -19,6 +19,7 @@ from virtualenv.seed.embed.base_embed import BaseEmbed
+ from virtualenv.seed.embed.via_app_data.pip_install.base import shell_shebang
+ from virtualenv.seed.wheels import get_wheel, pip_wheel_env_run
+ from virtualenv.seed.wheels.util import Version
++from virtualenv.util.path import write_file
+ from virtualenv.util.subprocess import LogCmd
+ 
+ if TYPE_CHECKING:
+@@ -75,8 +76,9 @@ class PipInvoke(BaseEmbed):
+                 changed = True
+             if changed:
+                 record: Final = next(row[0] for row in rows if row[0].endswith(".dist-info/RECORD"))
+-                with Path(str(distribution.locate_file(record))).open("w", encoding="utf-8", newline="") as stream:
+-                    csv.writer(stream).writerows(rows)
++                buffer: Final = io.StringIO()
++                csv.writer(buffer).writerows(rows)
++                write_file(Path(str(distribution.locate_file(record))), buffer.getvalue().encode("utf-8"))
+ 
+     @staticmethod
+     def _execute(cmd: list[str], env: dict[str, str]) -> Popen[bytes]:
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 1a60c04c44..b13b7d4fdd 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -28,6 +28,8 @@ SRC_URI += " \
     file://CVE-2026-113719.patch \
     file://CVE-2026-113721.patch \
     file://CVE-2026-113716.patch \
+    file://CVE-2026-113722_p1.patch \
+    file://CVE-2026-113722_p2.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

