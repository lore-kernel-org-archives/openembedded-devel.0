Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30266.1793869209181269794
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R+sYfznT;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7675; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K68hVde4MGi0CY/HOyI6PwT5yhC9Y3B8pWmZBzHwIA4=;
  b=R+sYfznTpqUp8prIssl75FU21XkaUPY239+6VVQgEdSXxMBWqiGfD1Mn
   kqEk3ebpxcWl1M1RlVWZTG72YBgri1MwWdGfFmTlrRfFAtH90HxIA9bTO
   EX9IanSogBBb392NDHxcD0AGyRtmFRgmtHDVx2gwqB0ybPFv6StQYoTrx
   crMeqP3JV0TsKT/ixcZecckVJ7fLPVe/fXroQZopjvnuPopJd9SttwPAD
   o1frd8c7DcFcgaV9LVgqg251HdK6tAM3Zt66/ZvssQIMZlFa8/sjJsQ5R
   SUuCFO+sn8MQDkkSLjsurVhhrY1zSkiV4oULdBYcjbG3r0hJRSFIg7z28
   g==;
X-CSE-ConnectionGUID: wFk19N9YSuCRtn736GUaTQ==
X-CSE-MsgGUID: skrOjAGkRtGDTETzOhBumw==
X-IPAS-Result: =?us-ascii?q?A0AqAABHRexq/4//Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?QYBAQsBglZ1YENJA4RUj1OCIQOBE4pSkjyBfg8BAQEPRA0EAQGEP0YCjh0CJ?=
 =?us-ascii?q?jUIDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDI?=
 =?us-ascii?q?wQLARgBPQkTAwECAwImAgIgCyMIEAmDAgGCOgM3AxGhDZsken8zgQGDKQGBV?=
 =?us-ascii?q?NhMDYJaAQsUAYEKLgGFP4J/IAGFA10YAYR9JxsbgXKBFYEXgVx2gQWBGkICh?=
 =?us-ascii?q?TyCagSCIoEMgVqBDIwMAoFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM+Fy9YGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IE?=
 =?us-ascii?q?Sw3FRkEPQFuB5IvgnEgMQxRAStUAjsKFB4wL06ScZAWgiGgIHEKKIN4jCSPP?=
 =?us-ascii?q?oV8GjOEBJQZklQLmH2OCoQKhQeMJIEchGmBagI4gVlwFYMiCUoZD405cg4Lg?=
 =?us-ascii?q?2CEUMoLJjICCQMvAQEHAgcBDAEDC4FokX4BAQ?=
IronPort-Data: A9a23:N0WSA6vP5u9lEY+Q5yP+bquuR+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW3XOv3YNGemc4ojYYnn9R8O7JHXz4dmSQRtpXs9RHwUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5ch0WDBop
 M0jNRs3chbc3LyZ/buHc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4DWGJsNxBrBz
 o7A13/6GDYYHfOc8yaq3k6Buv3onQnmXZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:1u1qc6q5HsG73ROerne1sc4aV5oJeYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7290ey7MBDhHP1OkOws1MmZPTUO0VHAROoJ0WKh+UyDJ8SUzIFgPM
 lbH5SWcOeRMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:sV4sBmHr5gZZMBqvqmJ42k1NS+Z0Q0bA503MJRDjV0lUQYGsHAo=
X-Talos-MUID: 9a23:aq4CVgXE4iudtejq/CTvnhZgHehr2biBJHwgrYchu+OZMDMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544560241"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 30841180003AC
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 89E62CBEFBF; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 10/18] python3-virtualenv: fix CVE-2026-113720
Date: Thu,  5 Nov 2026 00:59:59 -0800
Message-Id: <20261105090007.351866-11-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131884
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Apply the current umask when copying interpreter
and seed-package files instead of inheriting cached permission bits.
Do not grant group or world write access to copied files.

[1] https://github.com/pypa/virtualenv/commit/35f0b33562790176dd186d0a3c517af3acc7a0e1
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-fc2g-4w5p-6whm

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113720.patch  | 156 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
new file mode 100644
index 0000000000..dad52942aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
@@ -0,0 +1,156 @@
+From 35f0b33562790176dd186d0a3c517af3acc7a0e1 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:57:36 -0700
+Subject: [PATCH] 🐛 fix(path): apply current permissions to copied files
+ (#3425)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113720
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/35f0b33562790176dd186d0a3c517af3acc7a0e1]
+
+Backport Changes:
+- Import Final without TYPE_CHECKING and remove the now-empty type-only
+  import block: moving Path to runtime leaves no type-only imports in
+  21.2.1's copy helper.
+- Add the copy and Final imports needed by the unchanged upstream
+  regression tests; these imports are absent from 21.2.1's test file.
+- Omit the upstream release changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/util/path/_sync.py | 35 +++++++++++++----------
+ tests/unit/test_util.py           | 47 ++++++++++++++++++++++++++++++-
+ 2 files changed, 66 insertions(+), 16 deletions(-)
+
+diff --git a/src/virtualenv/util/path/_sync.py b/src/virtualenv/util/path/_sync.py
+index 6d701b9..a94466f 100644
+--- a/src/virtualenv/util/path/_sync.py
++++ b/src/virtualenv/util/path/_sync.py
+@@ -4,11 +4,9 @@ import logging
+ import os
+ import shutil
+ import sys
+-from stat import S_IWUSR
+-from typing import TYPE_CHECKING
+-
+-if TYPE_CHECKING:
+-    from pathlib import Path
++from pathlib import Path
++from stat import S_IWUSR, S_IXGRP, S_IXOTH, S_IXUSR
++from typing import Final
+ 
+ LOGGER = logging.getLogger(__name__)
+ 
+@@ -40,22 +38,29 @@ def symlink(src: Path, dest: Path) -> None:
+ 
+ 
+ def copy(src: Path, dest: Path) -> None:
+-    ensure_safe_to_do(src, dest)
+-    is_dir = src.is_dir()
+-    method = copytree if is_dir else shutil.copy
+     LOGGER.debug("copy %s", _Debug(src, dest))
+-    method(str(src), str(dest))
++    if src.is_dir():
++        ensure_safe_to_do(src, dest)
++        copytree(str(src), str(dest))
++    else:
++        _copy_file(src, dest)
+ 
+ 
+ def copytree(src: str, dest: str) -> None:
+     for root, _, files in os.walk(src):
+-        dest_dir = os.path.join(dest, os.path.relpath(root, src))
+-        if not os.path.isdir(dest_dir):
+-            os.makedirs(dest_dir)
++        dest_dir: Final = Path(dest) / os.path.relpath(root, src)
++        dest_dir.mkdir(parents=True, exist_ok=True)
+         for name in files:
+-            src_f = os.path.join(root, name)
+-            dest_f = os.path.join(dest_dir, name)
+-            shutil.copy(src_f, dest_f)
++            _copy_file(Path(root) / name, dest_dir / name)
++
++
++def _copy_file(src: Path, dest: Path) -> None:
++    ensure_safe_to_do(src, dest)
++    mode: Final = 0o755 if src.stat().st_mode & (S_IXUSR | S_IXGRP | S_IXOTH) else 0o644
++    flags: Final = os.O_WRONLY | os.O_CREAT | os.O_EXCL | (os.O_BINARY if os.name == "nt" else 0)
++    # Creation applies the current umask without changing the process-wide setting.
++    with src.open("rb") as source, os.fdopen(os.open(str(dest), flags, mode), "wb") as target:
++        shutil.copyfileobj(source, target, length=1024 * 1024)
+ 
+ 
+ def safe_delete(dest: Path) -> None:
+diff --git a/tests/unit/test_util.py b/tests/unit/test_util.py
+index 2cdc038..ea7030b 100644
+--- a/tests/unit/test_util.py
++++ b/tests/unit/test_util.py
+@@ -3,18 +3,63 @@ from __future__ import annotations
+ import concurrent.futures
+ import os
+ import traceback
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
+ from virtualenv.app_data import _cache_dir_with_migration, _default_app_data_dir
+ from virtualenv.util.lock import ReentrantFileLock
++from virtualenv.util.path import copy
+ from virtualenv.util.subprocess import run_cmd
+ 
+ if TYPE_CHECKING:
+     from pathlib import Path
+ 
+ 
++@pytest.mark.skipif(os.name != "posix", reason="POSIX permission bits")
++@pytest.mark.parametrize("directory", [pytest.param(False, id="file"), pytest.param(True, id="tree")])
++@pytest.mark.parametrize(
++    ("source_mode", "mask", "expected"),
++    [
++        pytest.param(0o666, 0o022, 0o644, id="normal"),
++        pytest.param(0o666, 0o077, 0o600, id="private"),
++        pytest.param(0o444, 0o022, 0o644, id="read-only-source"),
++        pytest.param(0o600, 0o022, 0o644, id="private-source"),
++        pytest.param(0o777, 0o022, 0o755, id="executable"),
++        pytest.param(0o777, 0o077, 0o700, id="private-executable"),
++        pytest.param(0o666, 0o000, 0o644, id="permissive-umask"),
++        pytest.param(0o777, 0o000, 0o755, id="permissive-executable"),
++        pytest.param(0o666, 0o002, 0o644, id="group-umask"),
++        pytest.param(0o777, 0o002, 0o755, id="group-executable"),
++    ],
++)
++def test_copy_uses_current_umask(tmp_path: Path, directory: bool, source_mode: int, mask: int, expected: int) -> None:
++    source: Final = tmp_path / "source"
++    source.mkdir()
++    payload: Final = source / "entry"
++    payload.write_bytes(b"copied bytes")
++    payload.chmod(source_mode)
++    destination: Final = tmp_path / "destination"
++    previous: Final = os.umask(mask)
++    try:
++        copy(source if directory else payload, destination)
++    finally:
++        os.umask(previous)
++    result: Final = destination / "entry" if directory else destination
++    assert (result.read_bytes(), result.stat().st_mode & 0o777) == (b"copied bytes", expected)
++
++
++@pytest.mark.parametrize("directory", [pytest.param(False, id="file"), pytest.param(True, id="tree")])
++def test_copy_replaces_contents(tmp_path: Path, directory: bool) -> None:
++    source: Final = tmp_path / "source"
++    source.mkdir()
++    (source / "entry").write_bytes(b"new")
++    destination: Final = tmp_path / "destination"
++    destination.write_bytes(b"old")
++    copy(source if directory else source / "entry", destination)
++    assert (destination / "entry" if directory else destination).read_bytes() == b"new"
++
++
+ def test_run_fail(tmp_path) -> None:
+     code, out, err = run_cmd([str(tmp_path)])
+     assert err
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index d514e79358..bd92f92555 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -24,6 +24,7 @@ SRC_URI += " \
     file://CVE-2026-113723.patch \
     file://CVE-2026-115586.patch \
     file://CVE-2026-113715.patch \
+    file://CVE-2026-113720.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

