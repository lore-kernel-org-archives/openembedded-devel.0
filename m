Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30039.1793869208884754057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HVBpcRwM;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11718; q=dns/txt;
  s=iport01; t=1793869212; x=1795078812;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kjT0xNHY2D+6ivrj/wFP5HJ7wa/wGEbbvKr64D7Nuis=;
  b=HVBpcRwMYX5B7MJHLEbIRGr7oxSSF4STS6/ylInIGVTFcrBVk/PquiMo
   wWM1uCmVy3LhX0AHl8SiZmwEMBxZZopwJMvqZXdfo61Z6YUTQwSQPZyvu
   ngxx34QkXO+Xv+txQPmRApWrgGQuqm3o777HuFkAGlTInwRtJP1Uzhyzz
   gjQjufaq6ChCpy7W95xQVPS54DEsD4BDwRQzG/slWxdul6ySB29YTVgFA
   AEUNQ8nLr7anqgicuVAnZgSi0S27m8T05fED/4Gt54NdMVn1wajPlOsAG
   q96t0QFkN98d6PzgDiwbAXMwu/Cy1D9YnY6SU8jaZvAlXTo4MwZ1M1v8y
   w==;
X-CSE-ConnectionGUID: xn8cv2QQSlCeo+/AHkJDpA==
X-CSE-MsgGUID: Xmr+EYFrRF6e/DzouYHI9A==
X-IPAS-Result: =?us-ascii?q?A0AcAABRROxq/5H/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4RUiBuHOIIhA4MciEmSPIF+DwEBAQ9EDQQBAYQ/RgKOH?=
 =?us-ascii?q?QImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECA?=
 =?us-ascii?q?QMjBAsBGAE9CRMDAQIDAiYCAiALIwgQCYMCAYI6AzcDEQahAJsken8zgQGDK?=
 =?us-ascii?q?QGBVNhMDYJaAQsUAYEKLgGFP4J/IAGFA10YAUSEOScbG4FygRWDaYEFS09CA?=
 =?us-ascii?q?oU8gmoEgiJ6EoFaHox6AoFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM+Fy9YGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IE?=
 =?us-ascii?q?Sw3FRkEPQFuB5IvgxEBXxsEDwEHJIFgJCiTDJBJgiGgIHEKKIN4ihSCEI8+h?=
 =?us-ascii?q?XwaM4QEgVelFguYfYJZizGECpFfaIRpgWg8gVlwFYMiCUoZD445g2uBJYE0z?=
 =?us-ascii?q?AImMgIJAy8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:7U7pw6yIibXiC/2MOxd6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUEz
 mpOWWiEM/aKamWjfYx0PNu3p04AuJ6Dz9RhGVBqqlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFEwbYYGoN9OOmVl+
 PtbbxktbTKvn8vjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxbYONI4XVHq25mG6oo
 3iF0lXXGCs0atHY5SiC70OMp77myHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:lxBaVaCelR9qZgflHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:haWuemPBnFW6Z+5DSC83/1BOI/kedlbQyzSXCm+7K0pxYejA
X-Talos-MUID: 9a23:+SA2cgknMy7SzUewjCgZdnpSMd0rzpWAEnojz5hBl9uDKB1QGma02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="545101173"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:12 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 15E16180005B7
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 72F6ACBF204; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 04/18] python3-virtualenv: fix CVE-2026-113732
Date: Thu,  5 Nov 2026 00:59:53 -0800
Message-Id: <20261105090007.351866-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131895
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Use Fish-specific quoting so backslashes and
quotes in an environment path or prompt remain literal data.

Include follow-up [3], released in [4], to preserve apostrophes and
backslashes after multibyte text in Fish 3 legacy locales. Keep the
upstream GBK and UTF-8 regression tests.

[1] https://github.com/pypa/virtualenv/commit/3bddeaf8d02c3ee7f576503efb082f8f494cfcab
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-c947-3pg5-gm8q
[3] https://github.com/pypa/virtualenv/commit/685435d7fb53da12da99e195ee2753f5ca083249
[4] https://github.com/pypa/virtualenv/releases/tag/21.14.9

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-113732_p1.patch                  | 116 +++++++++++++++++
 .../CVE-2026-113732_p2.patch                  | 120 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   2 +
 3 files changed, 238 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1.patch
new file mode 100644
index 0000000000..1afedad035
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1.patch
@@ -0,0 +1,116 @@
+From 3bddeaf8d02c3ee7f576503efb082f8f494cfcab Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Wed, 30 Sep 2026 22:59:45 -0700
+Subject: [PATCH] Merge commit from fork
+
+FishActivator inherited shlex.quote, whose POSIX rules leave a backslash
+literal inside single quotes. fish reads \' there as an escaped quote, so a
+path or --prompt with a backslash before a quote ended the literal early and
+ran the rest as commands, without any error from fish.
+
+Give FishActivator its own quote() that escapes backslashes and quotes.
+
+CVE: CVE-2026-113732
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/3bddeaf8d02c3ee7f576503efb082f8f494cfcab]
+
+Backport Changes:
+- Add the cli_run import required by the upstream regression test;
+  it is absent from the 21.2.1 test module.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/fish/__init__.py |  6 ++++
+ tests/unit/activation/test_fish.py         | 40 ++++++++++++++++++++--
+ 2 files changed, 43 insertions(+), 3 deletions(-)
+
+diff --git a/src/virtualenv/activation/fish/__init__.py b/src/virtualenv/activation/fish/__init__.py
+index 74300db..81d6d92 100644
+--- a/src/virtualenv/activation/fish/__init__.py
++++ b/src/virtualenv/activation/fish/__init__.py
+@@ -15,6 +15,12 @@ class FishActivator(ViaTemplateActivator):
+     def templates(self) -> Iterator[str]:
+         yield "activate.fish"
+ 
++    @staticmethod
++    def quote(string: str) -> str:
++        # fish reads \\ and \' as escapes inside single quotes, unlike POSIX sh, so shlex.quote's output lets a
++        # backslash before a quote end the literal early
++        return "'" + string.replace("\\", "\\\\").replace("'", "\\'") + "'"
++
+     def replacements(self, creator: Creator, dest_folder: Path) -> dict[str, str]:
+         data = super().replacements(creator, dest_folder)
+         data.update({
+diff --git a/tests/unit/activation/test_fish.py b/tests/unit/activation/test_fish.py
+index f726e7e..fc1b8a6 100644
+--- a/tests/unit/activation/test_fish.py
++++ b/tests/unit/activation/test_fish.py
+@@ -1,7 +1,6 @@
+ from __future__ import annotations
+ 
+ import os
+-import shlex
+ import shutil
+ import subprocess
+ import sys
+@@ -13,6 +12,7 @@ import pytest
+ 
+ from virtualenv.activation import FishActivator
+ from virtualenv.info import IS_WIN
++from virtualenv.run import cli_run
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Callable
+@@ -59,8 +59,8 @@ def test_fish_tkinter_generation(
+     assert "set -e _OLD_PKG_CONFIG_PATH" in content
+ 
+     if present:
+-        assert f"set -gx TCL_LIBRARY {shlex.quote(tcl_lib)}\n" in content
+-        assert f"set -gx TK_LIBRARY {shlex.quote(tk_lib)}\n" in content
++        assert f"set -gx TCL_LIBRARY {FishActivator.quote(tcl_lib)}\n" in content
++        assert f"set -gx TK_LIBRARY {FishActivator.quote(tk_lib)}\n" in content
+     else:
+         assert "if test -n ''\n  if set -q TCL_LIBRARY;" in content
+         assert "if test -n ''\n  if set -q TK_LIBRARY;" in content
+@@ -79,6 +79,40 @@ def test_fish_tkinter_path_does_not_run_commands(
+     assert not marker.exists()
+ 
+ 
++@pytest.mark.skipif(IS_WIN, reason="fish is not available on Windows")
++@pytest.mark.skipif(FISH is None, reason="fish is not installed")
++@pytest.mark.parametrize(
++    ("prompt", "env_name"),
++    [
++        pytest.param(r"x\'$(touch PWNED)'\'", "env", id="prompt-backslash-quote"),
++        pytest.param(None, r"x\'$(touch PWNED)'\'", id="dirname-backslash-quote"),
++    ],
++)
++def test_fish_activate_does_not_run_commands(
++    tmp_path: Path, current_fastest: str, prompt: str | None, env_name: str
++) -> None:
++    dest = tmp_path / env_name
++    args = ["--without-pip", str(dest), "--creator", current_fastest, "--no-periodic-update", "--activators", "fish"]
++    if prompt is not None:
++        args += ["--prompt", prompt]
++    cli_run(args)
++    (work_dir := tmp_path / "workdir").mkdir()
++
++    # the path is passed as an argument so the driver cannot expand a payload dir name while locating the script
++    result = subprocess.run(
++        [FISH, "--no-config", "-c", 'source $argv[1]; printf "%s" "$VIRTUAL_ENV"', str(dest / "bin" / "activate.fish")],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        cwd=str(work_dir),
++        timeout=60,
++        check=False,
++    )
++
++    assert not (work_dir / "PWNED").exists()
++    assert result.stdout == str(dest), result.stderr
++
++
+ @pytest.mark.skipif(IS_WIN, reason="we have not setup fish in CI yet")
+ def test_fish(activation_tester_class, activation_tester, monkeypatch, tmp_path) -> None:
+     monkeypatch.setenv("HOME", str(tmp_path))
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2.patch
new file mode 100644
index 0000000000..ad66d9b1e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2.patch
@@ -0,0 +1,120 @@
+From 685435d7fb53da12da99e195ee2753f5ca083249 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:08:22 -0700
+Subject: [PATCH] 🐛 fix(fish): separate escapes from multibyte text (#3413)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113732
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/685435d7fb53da12da99e195ee2753f5ca083249]
+
+Backport Changes:
+- Omit the release-only changelog fragment; the release documentation
+  directory is absent from the 21.2.1 source distribution.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/fish/__init__.py |  6 +--
+ tests/unit/activation/test_fish.py         | 56 +++++++++++++++++++++-
+ 2 files changed, 58 insertions(+), 4 deletions(-)
+
+diff --git a/src/virtualenv/activation/fish/__init__.py b/src/virtualenv/activation/fish/__init__.py
+index 81d6d92..7f376a9 100644
+--- a/src/virtualenv/activation/fish/__init__.py
++++ b/src/virtualenv/activation/fish/__init__.py
+@@ -1,5 +1,6 @@
+ from __future__ import annotations
+ 
++import re
+ from typing import TYPE_CHECKING
+ 
+ from virtualenv.activation.via_template import ViaTemplateActivator
+@@ -17,9 +18,8 @@ class FishActivator(ViaTemplateActivator):
+ 
+     @staticmethod
+     def quote(string: str) -> str:
+-        # fish reads \\ and \' as escapes inside single quotes, unlike POSIX sh, so shlex.quote's output lets a
+-        # backslash before a quote end the literal early
+-        return "'" + string.replace("\\", "\\\\").replace("'", "\\'") + "'"
++        # Keep escapes beside ASCII quotes so legacy decoders cannot absorb them into a preceding multibyte character.
++        return "'" + re.sub(r"[\\']", lambda match: f"'\\{match.group()}'", string) + "'"
+ 
+     def replacements(self, creator: Creator, dest_folder: Path) -> dict[str, str]:
+         data = super().replacements(creator, dest_folder)
+diff --git a/tests/unit/activation/test_fish.py b/tests/unit/activation/test_fish.py
+index fc1b8a6..d131043 100644
+--- a/tests/unit/activation/test_fish.py
++++ b/tests/unit/activation/test_fish.py
+@@ -6,7 +6,7 @@ import subprocess
+ import sys
+ from argparse import Namespace
+ from types import SimpleNamespace
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
+@@ -21,6 +21,60 @@ if TYPE_CHECKING:
+ FISH = shutil.which("fish")
+ 
+ 
++@pytest.mark.skipif(IS_WIN or FISH is None, reason="fish is required")
++@pytest.mark.parametrize(
++    "value",
++    [
++        pytest.param("", id="empty"),
++        pytest.param("plain text", id="space"),
++        pytest.param("café's", id="unicode-apostrophe"),
++        pytest.param("café\\path", id="unicode-backslash"),
++    ],
++)
++def test_fish_quote_preserves_literal(value: str) -> None:
++    result: Final = subprocess.run(
++        [FISH, "--no-config"],
++        input=f"printf '%s' {FishActivator.quote(value)}\n",
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        timeout=30,
++        check=True,
++    )
++    assert result.stdout == value
++
++
++@pytest.mark.skipif(IS_WIN or FISH is None, reason="fish is required")
++@pytest.mark.parametrize("value", [pytest.param("中's", id="apostrophe"), pytest.param("中\\path", id="backslash")])
++def test_fish_quote_preserves_legacy_locale_bytes(value: str) -> None:
++    version: Final = subprocess.check_output([FISH, "--version"], text=True, encoding="utf-8")
++    if not version.startswith("fish, version 3."):
++        pytest.skip("fish 4 always decodes UTF-8")
++    locales: Final = subprocess.check_output(["locale", "-a"], text=True, encoding="utf-8").splitlines()
++    if "zh_CN.gbk" not in locales:
++        pytest.skip("GBK locale is unavailable")
++    result: Final = subprocess.run(
++        [FISH, "--no-config"],
++        input=f"printf '%s' {FishActivator.quote(value)}\n".encode(),
++        env={**os.environ, "LC_ALL": "zh_CN.gbk"},
++        capture_output=True,
++        timeout=30,
++        check=True,
++    )
++    assert result.stdout == value.encode()
++
++
++@pytest.mark.parametrize(
++    ("value", "expected"),
++    [
++        pytest.param("café's", "'café'\\''s'", id="apostrophe"),
++        pytest.param("café\\path", "'café'\\\\'path'", id="backslash"),
++    ],
++)
++def test_fish_quote_separates_escapes(value: str, expected: str) -> None:
++    assert FishActivator.quote(value) == expected
++
++
+ @pytest.fixture
+ def rendered_activate_fish(tmp_path: Path) -> Callable[[str | None, str | None], Path]:
+     def render(tcl_lib: str | None, tk_lib: str | None) -> Path:
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 756a7842b8..66354956b9 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -15,6 +15,8 @@ SRC_URI += " \
     file://CVE-2026-102930_p2.patch \
     file://CVE-2026-102930_p3.patch \
     file://CVE-2026-102925.patch \
+    file://CVE-2026-113732_p1.patch \
+    file://CVE-2026-113732_p2.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

