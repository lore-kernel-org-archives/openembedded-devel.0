Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30043.1793869213943589263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NH3VnWaJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10568; q=dns/txt;
  s=iport01; t=1793869214; x=1795078814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=++nwjM/0TvJBwhwBxyLyPZOQnYitIFic4A16SMh957k=;
  b=NH3VnWaJxv+u7N85lPcuC9hkcKWK3Px7iePmDgT7Qg5bKF0YizcMSOWy
   caXh5Dy7KBwYK4lWDKP5ll1ZPlBD+NW5gD33X36z6mhdsd4JO8uMWRg5/
   PYQlBlK//oco+vWhIIoTfUYZAcWkXzWjqTSpnLilsZ/0tngmVJzXjdJYe
   TJnFGm7rUmdOFVO+wxsi52NkPN4NkaJISkZfZ4dQOA1YnOmv9f+livtjz
   lI+gJ5OPklYOXode7j6LcRiPUr3am3vVnIUEkQKre2sYelynFbEjhP1zo
   1hISsygyN+7t+xEdqzk+n6noebSrtTnqlTxe1eRRtiXjOeTsXxsOT5iS4
   g==;
X-CSE-ConnectionGUID: ydedooQoR3yj7bqezsL4ww==
X-CSE-MsgGUID: kBBWuY50Qu+7xFxBwUlEPg==
X-IPAS-Result: =?us-ascii?q?A0BtAgBHRexq/47/Ja1aHgEBCxIMggULgld1YENJhFePU?=
 =?us-ascii?q?4IhA4ETggmISZI8gX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0JEwMBAgMCJ?=
 =?us-ascii?q?gICIAsdAQUIEAmDAgGCOgM3AxGhDZsken8zgQGDKQE/AkNQ2EwNgloBCxQBg?=
 =?us-ascii?q?QouhUCCfyABhQNdGAGEfScbG4FygRWBF4FcdoEFgRpCAQGFPIJqBIIigQyBW?=
 =?us-ascii?q?oEDjBUCgVKGcUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBH?=
 =?us-ascii?q?YEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ9AW4Hk?=
 =?us-ascii?q?i+DEQEwDD4TASsETASBFBUHBDJAkj6QSYIhoCBxCiiDeIwkjz6FfBozhVulF?=
 =?us-ascii?q?guYfY4KhAqEbxiMTRZdhGmBaDyBRwsHcBU7gmcJShkPjjmDa4F/WoF3U0HId?=
 =?us-ascii?q?yYyAgkyAQEHAgcBDAEDC4FokX4BAQ?=
IronPort-Data: A9a23:4NJddKxpAjRiVfO4Zrl6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 DQcCGzUMq2MYGahKdh3PYyy8hwD6MWGydQwHFdv/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFA6MIEf/d9wOzpf9
 6MSMT0fdTTfmP3jldpXSsE07igiBNPgMIVavjRryivUSK57B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOXWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxbISMJobUH625mG6bj
 Ej54lWkWigHd4OP5yqv7U+oq9fAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEr994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:WInuyKwh26kWKR4UO4CWKrPwDr1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHDP5gr5NEtMpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCRr2Kr7GSoQEIcBeQygcy78
 tdmtBFaOHYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:SkL4oWyXs4FtYodgMbnGBgUFFs0pdXrky02LMk3nA39kWqaxFUCPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ALwA+8Q541fAKYi+rOCOTo/HxxoxryY6RFXFQyaw?=
 =?us-ascii?q?b+JaUGzxaJAqZoQy4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544614262"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 8AA8C180007F9
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9736ECBEF6D; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 13/18] python3-virtualenv: fix CVE-2026-113716
Date: Thu,  5 Nov 2026 01:00:02 -0800
Message-Id: <20261105090007.351866-14-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131899
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Replace linked output-directory components before
creating interpreter, library and activation files. Reuse ensure_within
from the preceding CVE-2026-113721 backport [3].

[1] https://github.com/pypa/virtualenv/commit/554d9f9d4f7758f5cf53f993031e29787f1f74c5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-113716
[3] https://github.com/pypa/virtualenv/commit/d25f28699eefb1fc34a251e5adf2b5de844c36cd

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113716.patch  | 208 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
new file mode 100644
index 0000000000..e952796dd5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
@@ -0,0 +1,208 @@
+From 554d9f9d4f7758f5cf53f993031e29787f1f74c5 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:36:11 -0700
+Subject: [PATCH] 🐛 fix(create): replace linked output directories (#3429)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113716
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/554d9f9d4f7758f5cf53f993031e29787f1f74c5]
+
+Backport Changes:
+- Add the fs_supports_symlink import required by the upstream utility
+  tests; it is absent from the 21.2.1 test module.
+- Extend the older test_util path import with ensure_within; the later
+  upstream module's safe_delete and symlink imports are unused here.
+- Omit the release-only changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../builtin/via_global_self_do.py             |  4 +-
+ src/virtualenv/create/via_global_ref/venv.py  |  7 ++-
+ tests/unit/create/test_creator.py             | 36 +++++++++++++
+ tests/unit/test_util.py                       | 54 ++++++++++++++++++-
+ 4 files changed, 94 insertions(+), 7 deletions(-)
+
+diff --git a/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py b/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py
+index f86861e..9ada4c1 100644
+--- a/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py
++++ b/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py
+@@ -9,7 +9,7 @@ from virtualenv.create.via_global_ref.builtin.ref import (
+     RefMust,
+     RefWhen,
+ )
+-from virtualenv.util.path import ensure_dir
++from virtualenv.util.path import ensure_within
+ 
+ from .builtin_way import VirtualenvBuiltin
+ 
+@@ -92,7 +92,7 @@ class ViaGlobalRefVirtualenvBuiltin(ViaGlobalRefApi, VirtualenvBuiltin, ABC):
+             if any(i for i in dirs if i is not directory and directory.parts == i.parts[: len(directory.parts)]):
+                 dirs.remove(directory)
+         for directory in sorted(dirs):
+-            ensure_dir(directory)
++            ensure_within(self.dest, directory)
+ 
+         self.set_pyenv_cfg()
+         self.pyenv_cfg.write()
+diff --git a/src/virtualenv/create/via_global_ref/venv.py b/src/virtualenv/create/via_global_ref/venv.py
+index 8b704eb..4e4fc77 100644
+--- a/src/virtualenv/create/via_global_ref/venv.py
++++ b/src/virtualenv/create/via_global_ref/venv.py
+@@ -9,7 +9,7 @@ from python_discovery import PythonInfo
+ from virtualenv.create.pyenv_cfg import _one_line as collapse_line_boundaries
+ from virtualenv.create.via_global_ref.store import handle_store_python
+ from virtualenv.util.error import ProcessCallFailedError
+-from virtualenv.util.path import ensure_dir, ensure_within
++from virtualenv.util.path import ensure_within
+ from virtualenv.util.subprocess import run_cmd
+ 
+ from .api import ViaGlobalRefApi, ViaGlobalRefMeta
+@@ -52,7 +52,8 @@ class Venv(ViaGlobalRefApi):
+     def create(self) -> None:
+         # stdlib venv writes interpreter files, configuration and activation scripts in place, so a planted symlink or
+         # hard link would receive them outside the environment
+-        ensure_within(self.dest, self.bin_dir)
++        for directory in (self.bin_dir, self.purelib, self.platlib):
++            ensure_within(self.dest, directory)
+         for path in (self.dest / "pyvenv.cfg", self.dest / ".gitignore", *self.bin_dir.iterdir()):
+             if path.is_symlink() or (path.is_file() and path.stat().st_nlink > 1):
+                 path.unlink()
+@@ -60,8 +61,6 @@ class Venv(ViaGlobalRefApi):
+             self.create_inline()
+         else:
+             self.create_via_sub_process()
+-        for lib in self.libs:  # ty: ignore[not-iterable]
+-            ensure_dir(lib)
+         if self.describe is not None:
+             self.describe.install_venv_shared_libs(self)
+         super().create()
+diff --git a/tests/unit/create/test_creator.py b/tests/unit/create/test_creator.py
+index bc02679..733a073 100644
+--- a/tests/unit/create/test_creator.py
++++ b/tests/unit/create/test_creator.py
+@@ -220,6 +220,42 @@ def test_venv_creator_accepts_plain_destination(tmp_path: Path) -> None:
+     assert (session.creator.dest / "pyvenv.cfg").is_file()
+ 
+ 
++@pytest.mark.parametrize(
++    "junction",
++    [
++        pytest.param(
++            False, id="symlink", marks=pytest.mark.skipif(not fs_supports_symlink(), reason="symlinks are unavailable")
++        ),
++        pytest.param(True, id="junction", marks=pytest.mark.skipif(os.name != "nt", reason="Windows junctions")),
++    ],
++)
++@pytest.mark.parametrize(
++    "creator_name",
++    [
++        pytest.param("builtin", id="builtin"),
++        pytest.param(
++            "venv",
++            id="venv",
++            marks=pytest.mark.skipif("venv" not in CURRENT_CREATORS, reason="stdlib venv is unavailable"),
++        ),
++    ],
++)
++@pytest.mark.parametrize("folder", [pytest.param("bin_dir", id="executables"), pytest.param("purelib", id="packages")])
++def test_creator_replaces_directory_links(tmp_path: Path, creator_name: str, folder: str, junction: bool) -> None:
++    session: Final = session_via_cli([str(tmp_path / "env"), "--creator", creator_name, "--no-seed"])
++    session.creator.dest.mkdir()
++    stored: Final = session.creator.dest / "stored"
++    stored.mkdir()
++    link: Final = session.creator.dest / getattr(session.creator, folder).relative_to(session.creator.dest).parts[0]
++    if junction:
++        subprocess.run(["cmd", "/c", "mklink", "/J", str(link), str(stored)], capture_output=True, check=True)
++    else:
++        link.symlink_to(stored, target_is_directory=True)
++    with session:
++        session.run()
++    assert (link.resolve(), session.creator.exe.is_file(), list(stored.iterdir())) == (link, True, [])
++
++
+ CREATE_METHODS = []
+ for k, v in CreatorSelector.for_interpreter(CURRENT).key_to_meta.items():
+     if k in CURRENT_CREATORS:
+diff --git a/tests/unit/test_util.py b/tests/unit/test_util.py
+index c4c448a..099798a 100644
+--- a/tests/unit/test_util.py
++++ b/tests/unit/test_util.py
+@@ -2,14 +2,16 @@ from __future__ import annotations
+ 
+ import concurrent.futures
+ import os
++import subprocess
+ import traceback
+ from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
+ from virtualenv.app_data import _cache_dir_with_migration, _default_app_data_dir
++from virtualenv.info import fs_supports_symlink
+ from virtualenv.util.lock import ReentrantFileLock
+-from virtualenv.util.path import copy, write_file
++from virtualenv.util.path import copy, ensure_within, write_file
+ from virtualenv.util.subprocess import run_cmd
+ 
+ if TYPE_CHECKING:
+@@ -69,6 +71,56 @@ def test_write_file_replaces_content(tmp_path: Path, existing: bool) -> None:
+     assert path.read_bytes() == b"generated"
+ 
+ 
++@pytest.mark.parametrize("existing", [pytest.param(False, id="new"), pytest.param(True, id="existing")])
++def test_environment_directories_create_nested_path(tmp_path: Path, existing: bool) -> None:
++    folder: Final = tmp_path / "env" / "lib" / "python"
++    if existing:
++        folder.mkdir(parents=True)
++    ensure_within(tmp_path / "env", folder)
++    assert folder.is_dir()
++
++
++def test_environment_directories_reject_regular_file(tmp_path: Path) -> None:
++    folder: Final = tmp_path / "file"
++    folder.touch()
++    with pytest.raises(NotADirectoryError, match="not a real directory"):
++        ensure_within(tmp_path, folder)
++
++
++def test_environment_directories_reject_parent_components(tmp_path: Path) -> None:
++    with pytest.raises(ValueError, match="must remain inside"):
++        ensure_within(tmp_path, tmp_path / ".." / "folder")
++
++
++@pytest.mark.skipif(not fs_supports_symlink(), reason="symlinks are unavailable")
++@pytest.mark.parametrize(
++    "existing", [pytest.param(False, id="missing-target"), pytest.param(True, id="existing-target")]
++)
++def test_environment_directories_remove_links(tmp_path: Path, caplog: pytest.LogCaptureFixture, existing: bool) -> None:
++    target: Final = tmp_path / "stored"
++    if existing:
++        target.mkdir()
++    link: Final = tmp_path / "link"
++    link.symlink_to(target, target_is_directory=True)
++    ensure_within(tmp_path, link / "nested")
++    assert (
++        link.is_symlink(),
++        link.exists(),
++        target.exists(),
++        f"replace environment directory link {link}" in caplog.text,
++    ) == (False, True, existing, True)
++
++
++@pytest.mark.skipif(os.name != "nt", reason="Windows junctions")
++def test_environment_directories_report_replaced_junction(tmp_path: Path, caplog: pytest.LogCaptureFixture) -> None:
++    target: Final = tmp_path / "stored"
++    target.mkdir()
++    link: Final = tmp_path / "link"
++    subprocess.run(["cmd", "/c", "mklink", "/J", str(link), str(target)], check=True, capture_output=True)
++    ensure_within(tmp_path, link)
++    assert (link.resolve(), f"replace environment directory junction {link}" in caplog.text) == (link, True)
++
++
+ def test_run_fail(tmp_path) -> None:
+     code, out, err = run_cmd([str(tmp_path)])
+     assert err
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index bc31885a02..1a60c04c44 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -27,6 +27,7 @@ SRC_URI += " \
     file://CVE-2026-113720.patch \
     file://CVE-2026-113719.patch \
     file://CVE-2026-113721.patch \
+    file://CVE-2026-113716.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

