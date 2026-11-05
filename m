Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30040.1793869208926666976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IlOfq4aF;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11857; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ai1wq7cqmciMDWheAPPUbkAG2Q5BjGLaA/M+JTaOpqY=;
  b=IlOfq4aFHIHzYXccfZnsNC8ZntPH0o3dyx1Yibgngz7nxy0DNcK357CP
   SqRjkTajfUWD0sjMIUdztYh9rDpNjKKvYk0iB7Z52P4Su/hW347lCAZF7
   HxSB+j9oNdfP29ajQ1vR4rFwKXU5KlEkWAlsWiAlq0o52G8uIhU69700b
   wpjPjnj3dkDHceUcrMhBJHw0X15AbEubWWBPg32gD6G+pp3Ci45oyvsSi
   M6oFBub101xEKJxhyIcvA0yz1YJvVPzyBLgdHM/PVbKceS5YCzdYGnPru
   N3JadtlU9uZa2lHPENszRm76+Vlf3C5wzRuGMzEbGNnH0zEFeePFDP5zY
   g==;
X-CSE-ConnectionGUID: AupqIdXxQ4uoMgIvtu3bvA==
X-CSE-MsgGUID: tAkNWSU4Rq+PHndwBzn1Vw==
X-IPAS-Result: =?us-ascii?q?A0BtAgBRROxq/5X/Ja1aHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OCIQODHIhJgyaPFoF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9CRMDAQIDA?=
 =?us-ascii?q?iYCAiALIwgQCYMCAYI6AzcDEaEGmyR6fzOBAYMpAYFU2EwNgloBCxQBgQouh?=
 =?us-ascii?q?UCCfyABhQNdGAGEfScbG4FygRWDaYEFS09CAoU8gmoEgiKBDIFaHox6AoFSh?=
 =?us-ascii?q?nFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+Fy9YGwYFgR2BHoESgQddg?=
 =?us-ascii?q?SsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPQFuB5IvgxEBXy4BK?=
 =?us-ascii?q?4EYCDEPHQcokwwTkDaCIaAgcQoog3iKFIIQjz6FfBozhASBV6UWC5h9glmLM?=
 =?us-ascii?q?YQKkkeEaYFoPIFZcBWDIglKGQ+OOYNrgSWBNIN3yAsmMgIJAy8BAQcCBwEMA?=
 =?us-ascii?q?QMLgWiRfgEB?=
IronPort-Data: A9a23:R2DnwavSQRBOkdm4Wxg7kogRtOfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW/TPq7cYWrwcooiO9zj/R4DuJSDzNI3Tgc5rH09EChBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0/tvGEBCx
 ewhdC0KSx+imf6rm7ilY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4fUHpQKwB7Az
 o7A13jQATclD+HD8yPGylKqivDljyWiZp1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ivTLlKrKdam06H0rJhNEPx4aV5oJeYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7290ey7MBDhHP1OkOws1MmZPTUO0VHAROoJ0WKh+UyDJ8SUzIFgPM
 lbH5SWcOeRMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:0m3tLWzz1VK8y3PN79wsBgU9B9g8U3Ht3E6MPkidBkd3VKDOQ0G5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AOWP51Qw3Uxv1xaN+TSfhYh/9+GyaqLiHC2Yyqqh?=
 =?us-ascii?q?agdDHDQx2Nyi3njLufJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="536397600"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:07 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id C2BA118000326
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:07 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6F369CBF203; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 03/18] python3-virtualenv: fix CVE-2026-102925
Date: Thu,  5 Nov 2026 00:59:52 -0800
Message-Id: <20261105090007.351866-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131887
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Remove the extra template quotes around values
that are already quoted for Bash and Fish activation scripts.

[1] https://github.com/pypa/virtualenv/commit/4d5a105ec2a2723b8c7f4571bb68f4f71d01e3f6
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-p58f-9548-mpm2

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-102925.patch  | 296 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 297 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.patch
new file mode 100644
index 0000000000..f9f6747dd9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.patch
@@ -0,0 +1,296 @@
+From 4d5a105ec2a2723b8c7f4571bb68f4f71d01e3f6 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Fri, 18 Sep 2026 06:10:09 +0200
+Subject: [PATCH] 🐛 fix(activation): stop path command injection in bash and
+ fish (#3252)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-102925
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/4d5a105ec2a2723b8c7f4571bb68f4f71d01e3f6]
+
+Backport Changes:
+- Add the shutil and subprocess imports and FISH executable lookup
+  required by the upstream Fish regression tests; these are absent from
+  the 21.2.1 test module.
+- Omit the release-only changelog fragment; the release documentation
+  directory is not included in the 21.2.1 source distribution.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh   |  2 +-
+ src/virtualenv/activation/fish/activate.fish |  4 +-
+ tests/unit/activation/test_bash.py           | 85 ++++++++++++++------
+ tests/unit/activation/test_fish.py           | 82 ++++++++++++-------
+ 4 files changed, 117 insertions(+), 56 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index b418101..18a78e5 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -61,7 +61,7 @@ deactivate () {
+ deactivate nondestructive
+ 
+ if [ ! -d __VIRTUAL_ENV__ ]; then
+-    echo "Virtual environment directory __VIRTUAL_ENV__ does not exist!" >&2
++    echo "Virtual environment directory" __VIRTUAL_ENV__ "does not exist!" >&2
+     CURRENT_PATH=$(realpath "${BASH_SOURCE[0]}")
+     CURRENT_DIR=$(dirname "${CURRENT_PATH}")
+     VIRTUAL_ENV="$(realpath "${CURRENT_DIR}/../")"
+diff --git a/src/virtualenv/activation/fish/activate.fish b/src/virtualenv/activation/fish/activate.fish
+index 33a8c7f..e409de9 100644
+--- a/src/virtualenv/activation/fish/activate.fish
++++ b/src/virtualenv/activation/fish/activate.fish
+@@ -72,13 +72,13 @@ if test -n __TCL_LIBRARY__
+   if set -q TCL_LIBRARY;
+     set -gx _OLD_VIRTUAL_TCL_LIBRARY $TCL_LIBRARY;
+   end
+-  set -gx TCL_LIBRARY '__TCL_LIBRARY__'
++  set -gx TCL_LIBRARY __TCL_LIBRARY__
+ end
+ if test -n __TK_LIBRARY__
+   if set -q TK_LIBRARY;
+     set -gx _OLD_VIRTUAL_TK_LIBRARY $TK_LIBRARY;
+   end
+-  set -gx TK_LIBRARY '__TK_LIBRARY__'
++  set -gx TK_LIBRARY __TK_LIBRARY__
+ end
+ 
+ # Prompt override provided?
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index 7a1bd35..00ac55f 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -3,6 +3,7 @@ from __future__ import annotations
+ import shutil
+ import subprocess
+ from argparse import Namespace
++from typing import TYPE_CHECKING
+ 
+ import pytest
+ 
+@@ -10,6 +11,10 @@ from virtualenv.activation import BashActivator
+ from virtualenv.info import IS_WIN
+ from virtualenv.run import cli_run
+ 
++if TYPE_CHECKING:
++    from collections.abc import Callable
++    from pathlib import Path
++
+ 
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+ @pytest.mark.parametrize(
+@@ -73,34 +78,68 @@ def test_bash_tkinter_generation(tmp_path, tcl_lib, tk_lib, present) -> None:
+         assert "export TCL_LIBRARY" in content
+ 
+ 
++@pytest.fixture
++def relocated_bash_venv(
++    tmp_path: Path, current_fastest: str
++) -> Callable[[str], tuple[subprocess.CompletedProcess[str], Path, Path]]:
++    def source_after_move(name: str) -> tuple[subprocess.CompletedProcess[str], Path, Path]:
++        original = tmp_path / name
++        cli_run([
++            "--without-pip",
++            str(original),
++            "--creator",
++            current_fastest,
++            "--no-periodic-update",
++            "--activators",
++            "bash",
++        ])
++        relocated = tmp_path / "relocated"
++        shutil.move(original, relocated)
++        work_dir = tmp_path / "workdir"
++        work_dir.mkdir()
++        result = subprocess.run(
++            ["bash", "-c", f'source "{relocated / "bin" / "activate"}" 2>/dev/null && echo "$VIRTUAL_ENV"'],
++            capture_output=True,
++            text=True,
++            cwd=str(work_dir),
++            encoding="utf-8",
++            check=False,
++        )
++        return result, relocated, work_dir
++
++    return source_after_move
++
++
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+-def test_bash_activate_relocation_resolves_virtual_env(tmp_path, current_fastest) -> None:
+-    original = tmp_path / "original"
+-    cli_run([
+-        "--without-pip",
+-        str(original),
+-        "--creator",
+-        current_fastest,
+-        "--no-periodic-update",
+-        "--activators",
+-        "bash",
+-    ])
+-    relocated = tmp_path / "relocated"
+-    shutil.move(original, relocated)
+-
+-    work_dir = tmp_path / "workdir"
+-    work_dir.mkdir()
+-    activate_script = relocated / "bin" / "activate"
+-    result = subprocess.run(
+-        ["bash", "-c", f'source "{activate_script}" 2>/dev/null && echo "$VIRTUAL_ENV"'],
+-        capture_output=True,
+-        text=True,
+-        cwd=str(work_dir),
+-    )
++@pytest.mark.parametrize(
++    "name", [pytest.param("original", id="plain"), pytest.param("has(paren)and'quote", id="shell-metacharacters")]
++)
++def test_bash_activate_relocation_resolves_virtual_env(
++    relocated_bash_venv: Callable[[str], tuple[subprocess.CompletedProcess[str], Path, Path]], name: str
++) -> None:
++    result, relocated, _ = relocated_bash_venv(name)
++
+     assert result.returncode == 0
+     assert result.stdout.strip() == str(relocated)
+ 
+ 
++@pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
++@pytest.mark.parametrize(
++    "payload",
++    [
++        pytest.param("x'$(id > PWNED)'y", id="command-substitution"),
++        pytest.param("x'`id > PWNED`'y", id="backticks"),
++        pytest.param("a';id > PWNED;'b", id="statement-separator"),
++    ],
++)
++def test_bash_activate_relocation_does_not_run_path_commands(
++    relocated_bash_venv: Callable[[str], tuple[subprocess.CompletedProcess[str], Path, Path]], payload: str
++) -> None:
++    _, _, work_dir = relocated_bash_venv(payload)
++
++    assert not (work_dir / "PWNED").exists()
++
++
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+ @pytest.mark.parametrize("hashing_enabled", [True, False])
+ def test_bash(raise_on_non_source_class, hashing_enabled, activation_tester) -> None:
+diff --git a/tests/unit/activation/test_fish.py b/tests/unit/activation/test_fish.py
+index 4d28b78..f726e7e 100644
+--- a/tests/unit/activation/test_fish.py
++++ b/tests/unit/activation/test_fish.py
+@@ -1,62 +1,84 @@
+ from __future__ import annotations
+ 
+ import os
++import shlex
++import shutil
++import subprocess
+ import sys
+ from argparse import Namespace
++from types import SimpleNamespace
++from typing import TYPE_CHECKING
+ 
+ import pytest
+ 
+ from virtualenv.activation import FishActivator
+ from virtualenv.info import IS_WIN
+ 
++if TYPE_CHECKING:
++    from collections.abc import Callable
++    from pathlib import Path
++
++FISH = shutil.which("fish")
++
++
++@pytest.fixture
++def rendered_activate_fish(tmp_path: Path) -> Callable[[str | None, str | None], Path]:
++    def render(tcl_lib: str | None, tk_lib: str | None) -> Path:
++        creator = SimpleNamespace(
++            dest=tmp_path,
++            bin_dir=tmp_path / "bin",
++            interpreter=SimpleNamespace(tcl_lib=tcl_lib, tk_lib=tk_lib),
++            pyenv_cfg={},
++            env_name="my-env",
++        )
++        creator.bin_dir.mkdir()
++        FishActivator(Namespace(prompt=None)).generate(creator)
++        return creator.bin_dir / "activate.fish"
++
++    return render
++
+ 
+ @pytest.mark.parametrize(
+     ("tcl_lib", "tk_lib", "present"),
+     [
+         ("/path/to/tcl", "/path/to/tk", True),
++        ("/Program Files/tcl", "/Program Files/tk", True),
+         (None, None, False),
+     ],
+ )
+-def test_fish_tkinter_generation(tmp_path, tcl_lib, tk_lib, present) -> None:
+-    # GIVEN
+-    class MockInterpreter:
+-        pass
+-
+-    interpreter = MockInterpreter()
+-    interpreter.tcl_lib = tcl_lib
+-    interpreter.tk_lib = tk_lib
+-
+-    class MockCreator:
+-        def __init__(self, dest) -> None:
+-            self.dest = dest
+-            self.bin_dir = dest / "bin"
+-            self.bin_dir.mkdir()
+-            self.interpreter = interpreter
+-            self.pyenv_cfg = {}
+-            self.env_name = "my-env"
+-
+-    creator = MockCreator(tmp_path)
+-    options = Namespace(prompt=None)
+-    activator = FishActivator(options)
+-
+-    # WHEN
+-    activator.generate(creator)
+-    content = (creator.bin_dir / "activate.fish").read_text(encoding="utf-8")
+-
+-    # THEN
+-    # PKG_CONFIG_PATH is always set
++def test_fish_tkinter_generation(
++    rendered_activate_fish: Callable[[str | None, str | None], Path],
++    tcl_lib: str | None,
++    tk_lib: str | None,
++    present: bool,
++) -> None:
++    content = rendered_activate_fish(tcl_lib, tk_lib).read_text(encoding="utf-8")
++
+     assert 'set -gx _OLD_PKG_CONFIG_PATH "$PKG_CONFIG_PATH"' in content
+     assert 'set -gx PKG_CONFIG_PATH "$VIRTUAL_ENV/lib/pkgconfig:$PKG_CONFIG_PATH"' in content
+     assert "set -e _OLD_PKG_CONFIG_PATH" in content
+ 
+     if present:
+-        assert "set -gx TCL_LIBRARY '/path/to/tcl'" in content
+-        assert "set -gx TK_LIBRARY '/path/to/tk'" in content
++        assert f"set -gx TCL_LIBRARY {shlex.quote(tcl_lib)}\n" in content
++        assert f"set -gx TK_LIBRARY {shlex.quote(tk_lib)}\n" in content
+     else:
+         assert "if test -n ''\n  if set -q TCL_LIBRARY;" in content
+         assert "if test -n ''\n  if set -q TK_LIBRARY;" in content
+ 
+ 
++@pytest.mark.skipif(IS_WIN, reason="fish is not available on Windows")
++@pytest.mark.skipif(FISH is None, reason="fish is not installed")
++def test_fish_tkinter_path_does_not_run_commands(
++    rendered_activate_fish: Callable[[str | None, str | None], Path], tmp_path: Path
++) -> None:
++    marker = tmp_path / "PWNED"
++    script = rendered_activate_fish(f"/tcl/(touch {marker})/lib", "/tk/lib")
++
++    subprocess.run([FISH, "-c", f"source '{script}'"], capture_output=True, text=True, timeout=60, check=False)
++
++    assert not marker.exists()
++
++
+ @pytest.mark.skipif(IS_WIN, reason="we have not setup fish in CI yet")
+ def test_fish(activation_tester_class, activation_tester, monkeypatch, tmp_path) -> None:
+     monkeypatch.setenv("HOME", str(tmp_path))
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 397c8bfafc..756a7842b8 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
     file://CVE-2026-102930_p1.patch \
     file://CVE-2026-102930_p2.patch \
     file://CVE-2026-102930_p3.patch \
+    file://CVE-2026-102925.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

