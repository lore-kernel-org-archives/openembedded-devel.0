Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11753.1795496989459483492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JVLQQpZq;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11285; q=dns/txt;
  s=iport01; t=1795496990; x=1796706590;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JMZCTINYzag/mJjwQPUUUFuOWr6Rh0fHSwuk89pxWe8=;
  b=JVLQQpZqFd4nMP7zGapvaGwu0+CQFASrVfy/MfgLutk8jc6qiaM4FPW2
   7zOKtGyvMvE7+FJdSf6ZuNKf3GLzCpFNTqyoyPVauku/WPxniDSXA7Eo7
   iulamETGxnmyNw2NNoAZsKUqrW5iD5xJCR1UpWzsZrwzx/HfFCvMB5aYb
   +pVHcDO+dTxIr4AzmlV+oTYtQT6FspWFdI6+poOwfk+2vXt/vxrnYFz1K
   ZtwMtBRDhUFVaLAZU0GIxYucEmVM6dADIFGwAmFkvIclS077I8QWecEYv
   nSXWGNvh1omb9xOoxjGR84csbEvXbBIJ6XdD0eKTE7Xg7IMYk6yH0hQez
   g==;
X-CSE-ConnectionGUID: ZNTa1S8TQLKmfV2cDXvIyA==
X-CSE-MsgGUID: uuTCYhQVT8+XWm+ZoTuF+g==
X-IPAS-Result: =?us-ascii?q?A0BNAgBXGwVr/81K/pBaglmCV3VhQkkDhFSPU4IhA4ETi?=
 =?us-ascii?q?lOSQ4F+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMjDwEYAT0JEwMBAgMCJgICIAsjCBAJg?=
 =?us-ascii?q?wIBgjoDNwIBEZ9omyR6gTKBAYMpAYFU2EwNgloBCxQBgQouhUKDACABhQNdG?=
 =?us-ascii?q?AGEfScbG4FygRWCdHaBBYEaQgKFPIJqBIIiehKBVIECjBUCgU+ISUiBAhwDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIA?=
 =?us-ascii?q?g0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUF?=
 =?us-ascii?q?IInczEwEwcTAStQBikcBUgVBygOEDCSPpBIgiGgIHEKKIN5jCSPPoV8GjOFW?=
 =?us-ascii?q?6UXC5h9jgqECoRvGIxNPDeEaoFoPIFZcBU7gmcJShkPjjmDa4RQU0HIdyM1A?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiQACyBUgEB?=
IronPort-Data: A9a23:ZbA4YK5YLYxa9Ry1UbsfeAxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 mYYCjiPbPmLMGWgeYt3Pd/ipkkD6pCEmtZrSAY9pCphZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eD6sk879MUV130
 d8dJg5XZTyzmcOn6efuIgVsrpxLwMjDNY4F/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0An1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCzaoWJI4bUFa25mG6Fu
 17tzmTAPC1Kd+ygzHm39U6xqKzAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:mIhmFqmda+soPuLwqyjmBjBE3Q3pDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:7WOJf27FKHDsRH5nhtssxmgoE5keIkHk6FTVLXHiAkpZVpyEYArF
X-Talos-MUID: 9a23:ve4L0AQkqewXhVFeRXTxmQ1JBcdR3Zj+S3AylNY0vPWZG29/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62741268"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:45 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id 87374180001F8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id BFDCECC2EF3; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 07/12]  python3-virtualenv: fix CVE-2026-113716
Date: Mon, 23 Nov 2026 21:09:37 -0800
Message-Id: <20261124050942.1795310-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132920
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix in [1], identified by the
upstream security advisory in [2], to virtualenv 20.25.3.
The backport also includes the required directory handling helper.

[1] https://github.com/pypa/virtualenv/commit/554d9f9d4f7758f5cf53f993031e29787f1f74c5
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-cw65-gx24-rc82

Package each additional upstream prerequisite or correction in its own
embedded patch with its own upstream metadata.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113716.patch  | 117 ++++++++++++++++++
 .../ensure-within-prerequisite.patch          | 107 ++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   2 +
 3 files changed, 226 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/ensure-within-prerequisite.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
new file mode 100644
index 0000000000..8708bc0f2c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
@@ -0,0 +1,117 @@
+From 554d9f9d4f7758f5cf53f993031e29787f1f74c5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
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
+ - Use ensure_within from the separately applied prerequisite patch.
+ - Use self.libs for library paths in the older creator API and create
+   these directories before invoking the stdlib venv creator.
+ - Replace the newer upstream tests with unittest checks for this version;
+   omit docs/changelog/3429.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../via_global_ref/builtin/via_global_self_do.py   |  4 +--
+ src/virtualenv/create/via_global_ref/venv.py       |  8 +++--
+ tests/unit/create/test_cve_2026_113716.py          | 34 ++++++++++++++++++++++
+ 3 files changed, 41 insertions(+), 5 deletions(-)
+
+diff --git a/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py b/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py
+index 2f7f2f11a960db5a73677c6b144c8d8e2cdeecb3..7c05ec5b3d1ef38972fedf2574d2e440c5ce4558 100644
+--- a/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py
++++ b/src/virtualenv/create/via_global_ref/builtin/via_global_self_do.py
+@@ -8,7 +8,7 @@ from virtualenv.create.via_global_ref.builtin.ref import (
+     RefMust,
+     RefWhen,
+ )
+-from virtualenv.util.path import ensure_dir
++from virtualenv.util.path import ensure_within
+ 
+ from .builtin_way import VirtualenvBuiltin
+ 
+@@ -79,7 +79,7 @@ class ViaGlobalRefVirtualenvBuiltin(ViaGlobalRefApi, VirtualenvBuiltin, ABC):
+             if any(i for i in dirs if i is not directory and directory.parts == i.parts[: len(directory.parts)]):
+                 dirs.remove(directory)
+         for directory in sorted(dirs):
+-            ensure_dir(directory)
++            ensure_within(self.dest, directory)
+ 
+         self.set_pyenv_cfg()
+         self.pyenv_cfg.write()
+diff --git a/src/virtualenv/create/via_global_ref/venv.py b/src/virtualenv/create/via_global_ref/venv.py
+index dd05605dab79104a353372bc41f20c43ddfcf4fd..8ec3540877f159f91f32cabd31c62ffe35273b8d 100644
+--- a/src/virtualenv/create/via_global_ref/venv.py
++++ b/src/virtualenv/create/via_global_ref/venv.py
+@@ -6,7 +6,7 @@ from argparse import ArgumentTypeError
+ from virtualenv.create.via_global_ref.store import handle_store_python
+ from virtualenv.discovery.py_info import PythonInfo
+ from virtualenv.util.error import ProcessCallFailedError
+-from virtualenv.util.path import ensure_dir
++from virtualenv.util.path import ensure_within
+ from virtualenv.util.subprocess import run_cmd
+ 
+ from .api import ViaGlobalRefApi, ViaGlobalRefMeta
+@@ -37,12 +37,14 @@ class Venv(ViaGlobalRefApi):
+         return None
+ 
+     def create(self):
++        # stdlib venv writes interpreter files, configuration and activation scripts in place, so a planted symlink or
++        # hard link would receive them outside the environment
++        for directory in (self.bin_dir, *self.libs):
++            ensure_within(self.dest, directory)
+         if self.can_be_inline:
+             self.create_inline()
+         else:
+             self.create_via_sub_process()
+-        for lib in self.libs:
+-            ensure_dir(lib)
+         super().create()
+         self.executables_for_win_pypy_less_v37()
+ 
+diff --git a/tests/unit/create/test_cve_2026_113716.py b/tests/unit/create/test_cve_2026_113716.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..5c1c285f47c30b16dd5aea089b63c428bb712676
+--- /dev/null
++++ b/tests/unit/create/test_cve_2026_113716.py
+@@ -0,0 +1,34 @@
++import os
++import tempfile
++import unittest
++from pathlib import Path
++
++from virtualenv.run import cli_run
++from virtualenv.util.path import ensure_within
++
++
++class TestEnvironmentDirectories(unittest.TestCase):
++    def test_nested_directories_and_reject_files(self):
++        with tempfile.TemporaryDirectory() as root:
++            root = Path(root)
++            ensure_within(root, root / "env" / "lib")
++            self.assertTrue((root / "env" / "lib").is_dir())
++            (root / "file").touch()
++            with self.assertRaises(NotADirectoryError):
++                ensure_within(root, root / "file")
++
++    @unittest.skipIf(os.name == "nt", "test uses the POSIX executable directory")
++    def test_link_is_replaced_before_creation(self):
++        for creator in ("builtin", "venv"):
++            with self.subTest(creator=creator), tempfile.TemporaryDirectory() as root:
++                root = Path(root)
++                dest = root / "env"
++                dest.mkdir()
++                target = root / "untouched"
++                target.mkdir()
++                link = dest / "bin"
++                link.symlink_to(target, target_is_directory=True)
++                session = cli_run([str(dest), "--creator", creator, "--no-seed"])
++                self.assertFalse(link.is_symlink())
++                self.assertTrue(session.creator.exe.is_file())
++                self.assertEqual(list(target.iterdir()), [])
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/ensure-within-prerequisite.patch b/meta-python/recipes-devtools/python/python3-virtualenv/ensure-within-prerequisite.patch
new file mode 100644
index 0000000000..0832bf59b9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/ensure-within-prerequisite.patch
@@ -0,0 +1,107 @@
+From d25f28699eefb1fc34a251e5adf2b5de844c36cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:25:09 -0700
+Subject: [PATCH] 🐛 fix(create): replace generated file links (#3431)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/d25f28699eefb1fc34a251e5adf2b5de844c36cd]
+
+Backport Changes:
+ - Extract only ensure_within and its exports as a prerequisite for the
+   directory-link fix. The remaining file-writing changes are applied
+   separately in CVE-2026-113721.patch.
+ - Adapt the helper to the older untyped path and logging interfaces.
+   Omit the newer test fixtures and release-only changelog; directory
+   creation checks are retained in the following CVE backport.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/util/path/__init__.py |  3 ++-
+ src/virtualenv/util/path/_sync.py    | 36 +++++++++++++++++++++++++++++++++++-
+ 2 files changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/src/virtualenv/util/path/__init__.py b/src/virtualenv/util/path/__init__.py
+index c144d8dfd7704d4727472c3695c32dddfb0b8959..f2cccc8d83d19c62ea2d6ba1453ac8850dd665fa 100644
+--- a/src/virtualenv/util/path/__init__.py
++++ b/src/virtualenv/util/path/__init__.py
+@@ -1,13 +1,14 @@
+ from __future__ import annotations
+ 
+ from ._permission import make_exe, set_tree
+-from ._sync import copy, copytree, ensure_dir, safe_delete, symlink
++from ._sync import copy, copytree, ensure_dir, ensure_within, safe_delete, symlink
+ from ._win import get_short_path_name
+ 
+ __all__ = [
+     "copy",
+     "copytree",
+     "ensure_dir",
++    "ensure_within",
+     "get_short_path_name",
+     "make_exe",
+     "safe_delete",
+diff --git a/src/virtualenv/util/path/_sync.py b/src/virtualenv/util/path/_sync.py
+index 78684f0158315f46c3aaf644fc416c5c414e42e2..bf2410fb1970f5a37dc5a0adf3fa1e873ee1d006 100644
+--- a/src/virtualenv/util/path/_sync.py
++++ b/src/virtualenv/util/path/_sync.py
+@@ -4,7 +4,10 @@ import logging
+ import os
+ import shutil
+ import sys
+-from stat import S_IWUSR
++from stat import S_ISDIR, S_ISLNK, S_IWUSR
++
++if os.name == "nt":
++    from stat import IO_REPARSE_TAG_MOUNT_POINT
+ 
+ 
+ def ensure_dir(path):
+@@ -13,6 +16,36 @@ def ensure_dir(path):
+         os.makedirs(str(path))
+ 
+ 
++def ensure_within(root, path):
++    """Create directories under root, replacing links before writing through them."""
++    parts = path.relative_to(root).parts
++    if ".." in parts:
++        raise ValueError(f"environment directory {path} must remain inside {root}")
++    ensure_dir(root)
++    folder = root
++    for part in parts:
++        folder /= part
++        try:
++            metadata = folder.lstat()
++        except FileNotFoundError:
++            pass
++        else:
++            if S_ISLNK(metadata.st_mode):
++                logging.warning("replace environment directory link %s", folder)
++                folder.unlink()
++            elif os.name == "nt" and metadata.st_reparse_tag == IO_REPARSE_TAG_MOUNT_POINT:
++                logging.warning("replace environment directory junction %s", folder)
++                folder.rmdir()
++        try:
++            folder.mkdir()
++        except FileExistsError:
++            created = folder.lstat()
++            if not S_ISDIR(created.st_mode) or (
++                os.name == "nt" and created.st_reparse_tag == IO_REPARSE_TAG_MOUNT_POINT
++            ):
++                raise NotADirectoryError(f"environment directory is not a real directory: {folder}") from None
++
++
+ def ensure_safe_to_do(src, dest):
+     if src == dest:
+         msg = f"source and destination is the same {src}"
+@@ -77,6 +110,7 @@ __all__ = [
+     "copy",
+     "copytree",
+     "ensure_dir",
++    "ensure_within",
+     "safe_delete",
+     "symlink",
+     "symlink",
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 4e7258019e..21f419844b 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -16,6 +16,8 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2026-113726.patch \
             file://CVE-2026-113725.patch \
             file://CVE-2026-113715.patch \
+            file://ensure-within-prerequisite.patch \
+            file://CVE-2026-113716.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

