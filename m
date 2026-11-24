Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11968.1795496988177392376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QPw6ZL9O;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14465; q=dns/txt;
  s=iport01; t=1795496989; x=1796706589;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uKEbtjvp09Mn4u4mJ7tcqJAzNzExbn7lJLV3mgMzw/8=;
  b=QPw6ZL9OQ6z9WT4Qxz+m6GhMnTSuSNlTVOu/7WuksjEB0DW06X7idg43
   AbDgTd1yqNoHV/lWdR1enFNaIa7r/TU006PRtJ/xJ6lL5cQji8CGtxTAh
   EExJBtWU9X1p6RTtMN8u0UnWDq2Jxa/nbmRoZyihFZK29WF3OwOhBfIg3
   D7W2nDiXluyKMgQGEI/W3NfihBjILBsOanZCtONZaUyw745yNAQY6PX40
   ggJxVHVNpercZIHHcz0in6/ha9B2Rc9alvk6HTITB220JfppxMuwr8Al6
   VaZMYJ5YCrJO5nGxRNf9dPZxOcsgbbprkjph2QKzeex03tGRrE4SWHRUg
   Q==;
X-CSE-ConnectionGUID: 6sgH02eCSA29CV+dmLXjig==
X-CSE-MsgGUID: Kyh/LlYkRga4AE21sVLfSw==
X-IPAS-Result: =?us-ascii?q?A0BrAgBXGwVr/9BK/pBaglmCV3VhQkkDhFSPU4IhA4ETg?=
 =?us-ascii?q?gmISoVqjFkUgQcDYA8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIwQLARgBPQkTAwECAwImA?=
 =?us-ascii?q?gIgCx0BBQgQCYMCAYI6AzcCAREGn2KbJHp/M4EBgykBMQWBHthMDYJaAQsUA?=
 =?us-ascii?q?YEKLoVCgwAgAYUDXRgBhH0nGxuBcoEVgReBXXaBBYEaQgIBAYFEg3aCagSCI?=
 =?us-ascii?q?noSgVSNFwKBT4hJSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxcvWBsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWI?=
 =?us-ascii?q?QsbGA1IESw3FRkEPQFuB5QUgmY0MTATGgEIIQIEKyEGKRIHAwUPORUvDgMNM?=
 =?us-ascii?q?JI+BRQQkB+CIaAgcQoog3mKFIIQjz6FfBozhASBV6UXC5h9glmLMYQKhG0aj?=
 =?us-ascii?q?E0LC12EaoFoPIFZcBWDIglKGQ+OKw4Lg2CCWYF3Q1HIdyM1AgEIAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokAAsgVIBAQ?=
IronPort-Data: A9a23:eu/nA6u04HJTEVUXL1u8MrHMfefnVAJfMUV32f8akzHdYApBsoF/q
 tZmKTyPbPeDZzT3KdgjPd609xgBv5GAmtZqGQVt/ik3QSoagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwpP14ITkU+
 NcjAWpcRS7Ai+eS8LC6Rbw57igjBJGD0II3s3x6iDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKLIoXWGpkEwy50o
 Erl7mS+JhUrN+aQwGas3yj1ndHrkxjkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:oB+6KqgoEyrncJNUiBMxdY/jNXBQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:Bf8oCGF3RHXPkMtKqmI570E0QpooWUb0lib7HQy0DEJZSryaHAo=
X-Talos-MUID: 9a23:RxktiAS43xRSCTpSRXTPlTElEMNZ4J6hARwkvM9foPegOxdvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60147495"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:46 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 9173218000242
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id D7616CC51C2; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 11/12]  python3-virtualenv: fix CVE-2026-113721
Date: Mon, 23 Nov 2026 21:09:41 -0800
Message-Id: <20261124050942.1795310-12-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132914
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Reuse the existing directory helper and backport exclusive generated-file
writes and final-entry link replacement to virtualenv 20.25.3.

[1] https://github.com/pypa/virtualenv/commit/d25f28699eefb1fc34a251e5adf2b5de844c36cd
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-558c-9hv2-4prj

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113721.patch  | 294 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   1 +
 2 files changed, 295 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch
new file mode 100644
index 0000000000..0456066cbe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch
@@ -0,0 +1,294 @@
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
+CVE: CVE-2026-113721
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/d25f28699eefb1fc34a251e5adf2b5de844c36cd]
+
+Backport Changes:
+ - Reuse ensure_within from ensure-within-prerequisite.patch
+   and add the remaining exclusive-write and final-entry link handling.
+ - Adapt the generated configuration, activation, import-hook and seed
+   launcher changes to the older untyped APIs and logging interfaces.
+   Preserve the existing PowerShell BOM and pass encoded bytes to the
+   binary write_file helper; describe binary writes without referring
+   to the replaced write_bytes method.
+ - Omit the cachedir-tag update because this release has no such writer.
+ - Replace newer upstream test fixtures with compatible unittest checks;
+   omit docs/changelog/3431.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/via_template.py          | 10 ++-
+ src/virtualenv/create/creator.py                   |  4 +-
+ src/virtualenv/create/pyenv_cfg.py                 |  4 +-
+ src/virtualenv/create/via_global_ref/api.py        |  5 +-
+ src/virtualenv/create/via_global_ref/venv.py       |  4 ++
+ .../seed/embed/via_app_data/pip_install/base.py    |  4 ++
+ src/virtualenv/util/path/__init__.py               |  3 +-
+ src/virtualenv/util/path/_sync.py                  |  9 +++
+ tests/unit/create/test_cve_2026_113721.py          | 77 ++++++++++++++++++++++
+ 9 files changed, 108 insertions(+), 12 deletions(-)
+
+diff --git a/src/virtualenv/activation/via_template.py b/src/virtualenv/activation/via_template.py
+index a1c7b5b62a0062a1ffc8591bf05ba2254dcccc7e..202c13fc76cc7a5f68bca9e534205cfdd6f36954 100644
+--- a/src/virtualenv/activation/via_template.py
++++ b/src/virtualenv/activation/via_template.py
+@@ -6,6 +6,8 @@ import shlex
+ import sys
+ from abc import ABC, abstractmethod
+ 
++from virtualenv.util.path import write_file
++
+ from .activator import Activator
+ 
+ if sys.version_info >= (3, 10):
+@@ -55,14 +57,10 @@ class ViaTemplateActivator(Activator, ABC):
+         for template in templates:
+             text = self.instantiate_template(replacements, template, creator)
+             dest = to_folder / self.as_name(template)
+-            # remove the file if it already exists - this prevents permission
+-            # errors when the dest is not writable
+-            if dest.exists():
+-                dest.unlink()
+             # Powershell assumes Windows 1252 encoding when reading files without BOM
+             encoding = "utf-8-sig" if template.endswith(".ps1") else "utf-8"
+-            # use write_bytes to avoid platform specific line normalization (\n -> \r\n)
+-            dest.write_bytes(text.encode(encoding))
++            # Write bytes to avoid platform specific line normalization (\n -> \r\n).
++            write_file(dest, text.encode(encoding))
+             generated.append(dest)
+         return generated
+ 
+diff --git a/src/virtualenv/create/creator.py b/src/virtualenv/create/creator.py
+index 7a98a5124ff43afe5e0b67177805188a25cba329..790db20063e1bda87ec3f79ce705d4d3cf03d476 100644
+--- a/src/virtualenv/create/creator.py
++++ b/src/virtualenv/create/creator.py
+@@ -11,7 +11,7 @@ from collections import OrderedDict
+ from pathlib import Path
+ 
+ from virtualenv.discovery.cached_py_info import LogCmd
+-from virtualenv.util.path import safe_delete
++from virtualenv.util.path import safe_delete, write_file
+ from virtualenv.util.subprocess import run_cmd
+ from virtualenv.version import __version__
+ 
+@@ -172,7 +172,7 @@ class Creator(ABC):
+         # mark this folder to be ignored by VCS, handle https://www.python.org/dev/peps/pep-0610/#registered-vcs
+         git_ignore = self.dest / ".gitignore"
+         if not git_ignore.exists():
+-            git_ignore.write_text("# created by virtualenv automatically\n*\n", encoding="utf-8")
++            write_file(git_ignore, b"# created by virtualenv automatically\n*\n")
+         # Mercurial - does not support the .hgignore file inside a subdirectory directly, but only if included via the
+         # subinclude directive from root, at which point on might as well ignore the directory itself, see
+         # https://www.selenic.com/mercurial/hgignore.5.html for more details
+diff --git a/src/virtualenv/create/pyenv_cfg.py b/src/virtualenv/create/pyenv_cfg.py
+index 04883dea26508bb77727f0ac274fb2683f17626b..ae8aa30d0d014d8cb8891d4be5d8b7a46074bd01 100644
+--- a/src/virtualenv/create/pyenv_cfg.py
++++ b/src/virtualenv/create/pyenv_cfg.py
+@@ -4,6 +4,8 @@ import logging
+ import os
+ from collections import OrderedDict
+ 
++from virtualenv.util.path import write_file
++
+ 
+ class PyEnvCfg:
+     def __init__(self, content, path) -> None:
+@@ -38,7 +40,7 @@ class PyEnvCfg:
+             logging.debug("\t%s", line)
+             text += line
+             text += "\n"
+-        self.path.write_text(text, encoding="utf-8")
++        write_file(self.path, text.encode("utf-8"))
+ 
+     def refresh(self):
+         self.content = self._read_values(self.path)
+diff --git a/src/virtualenv/create/via_global_ref/api.py b/src/virtualenv/create/via_global_ref/api.py
+index d29067c8b5c68ba348940cc5f144d3cfb5cb5c33..99a21b015ee93dc6accd0a47280317c9cd2e6cfd 100644
+--- a/src/virtualenv/create/via_global_ref/api.py
++++ b/src/virtualenv/create/via_global_ref/api.py
+@@ -7,6 +7,7 @@ from pathlib import Path
+ 
+ from virtualenv.create.creator import Creator, CreatorMeta
+ from virtualenv.info import fs_supports_symlink
++from virtualenv.util.path import write_file
+ 
+ 
+ class ViaGlobalRefMeta(CreatorMeta):
+@@ -89,10 +90,10 @@ class ViaGlobalRefApi(Creator, ABC):
+         if text:
+             pth = self.purelib / "_virtualenv.pth"
+             logging.debug("create virtualenv import hook file %s", pth)
+-            pth.write_text("import _virtualenv", encoding="utf-8")
++            write_file(pth, b"import _virtualenv")
+             dest_path = self.purelib / "_virtualenv.py"
+             logging.debug("create %s", dest_path)
+-            dest_path.write_text(text, encoding="utf-8")
++            write_file(dest_path, text.encode("utf-8"))
+ 
+     def env_patch_text(self):
+         """Patch the distutils package to not be derailed by its configuration files."""
+diff --git a/src/virtualenv/create/via_global_ref/venv.py b/src/virtualenv/create/via_global_ref/venv.py
+index 8ec3540877f159f91f32cabd31c62ffe35273b8d..4812ffca1b0910ea1b7f921e7a187e16f801b34e 100644
+--- a/src/virtualenv/create/via_global_ref/venv.py
++++ b/src/virtualenv/create/via_global_ref/venv.py
+@@ -41,6 +41,10 @@ class Venv(ViaGlobalRefApi):
+         # hard link would receive them outside the environment
+         for directory in (self.bin_dir, *self.libs):
+             ensure_within(self.dest, directory)
++        # stdlib venv writes these paths in place; detach existing links first.
++        for path in (self.dest / "pyvenv.cfg", self.dest / ".gitignore", *self.bin_dir.iterdir()):
++            if path.is_symlink() or (path.is_file() and path.stat().st_nlink > 1):
++                path.unlink()
+         if self.can_be_inline:
+             self.create_inline()
+         else:
+diff --git a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+index e8a5670f6c627683fb8cae7bd764bd021fcd2291..3a210b97b5d505d56ac9b124cb220d13f56f311c 100644
+--- a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
++++ b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+@@ -208,6 +208,10 @@ class ScriptMakerCustom(ScriptMaker):
+ 
+     def _write_script(self, names, shebang, script_bytes, filenames, ext):  # noqa: PLR0913
+         names.add(f"{self._name}{self.version_info[0]}.{self.version_info[1]}")
++        for name in names:
++            path = Path(self.target_dir) / (f"{name}.exe" if os.name == "nt" else name)
++            if path.is_symlink():
++                path.unlink()
+         super()._write_script(names, shebang, script_bytes, filenames, ext)
+ 
+ 
+diff --git a/src/virtualenv/util/path/__init__.py b/src/virtualenv/util/path/__init__.py
+index f2cccc8d83d19c62ea2d6ba1453ac8850dd665fa..451630f4695c36ce4c9e456324d2ac54a92a59f7 100644
+--- a/src/virtualenv/util/path/__init__.py
++++ b/src/virtualenv/util/path/__init__.py
+@@ -1,7 +1,7 @@
+ from __future__ import annotations
+ 
+ from ._permission import make_exe, set_tree
+-from ._sync import copy, copytree, ensure_dir, ensure_within, safe_delete, symlink
++from ._sync import copy, copytree, ensure_dir, ensure_within, safe_delete, symlink, write_file
+ from ._win import get_short_path_name
+ 
+ __all__ = [
+@@ -14,4 +14,5 @@ __all__ = [
+     "safe_delete",
+     "set_tree",
+     "symlink",
++    "write_file",
+ ]
+diff --git a/src/virtualenv/util/path/_sync.py b/src/virtualenv/util/path/_sync.py
+index 41afd0d9ea5fc3449e1e168c54580fb10b0dfa79..1288745fadd60ff03ae35831a150df9af4f04c53 100644
+--- a/src/virtualenv/util/path/_sync.py
++++ b/src/virtualenv/util/path/_sync.py
+@@ -47,6 +47,14 @@ def ensure_within(root, path):
+                 raise NotADirectoryError(f"environment directory is not a real directory: {folder}") from None
+ 
+ 
++def write_file(path, data):
++    if path.is_symlink() or path.exists():
++        path.unlink()
++    # Exclusive creation rejects links introduced after the old entry was removed.
++    with path.open("xb") as stream:
++        stream.write(data)
++
++
+ def ensure_safe_to_do(src, dest):
+     if src == dest:
+         msg = f"source and destination is the same {src}"
+@@ -122,4 +130,5 @@ __all__ = [
+     "safe_delete",
+     "symlink",
+     "symlink",
++    "write_file",
+ ]
+diff --git a/tests/unit/create/test_cve_2026_113721.py b/tests/unit/create/test_cve_2026_113721.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..ff8f9dae2b81f93792fbdad01527a48e6f7e3788
+--- /dev/null
++++ b/tests/unit/create/test_cve_2026_113721.py
+@@ -0,0 +1,77 @@
++import os
++import tempfile
++import unittest
++from pathlib import Path
++from unittest.mock import patch
++
++from virtualenv.create.pyenv_cfg import PyEnvCfg
++from virtualenv.run import cli_run
++from virtualenv.util.path import write_file
++
++
++class TestGeneratedFiles(unittest.TestCase):
++    def test_write_file_replaces_existing_entries(self):
++        with tempfile.TemporaryDirectory() as folder:
++            root = Path(folder)
++            target = root / "target"
++            target.write_bytes(b"keep")
++            for kind in ("file", "symlink", "dangling", "hardlink"):
++                with self.subTest(kind=kind):
++                    output = root / kind
++                    if kind == "file":
++                        output.write_bytes(b"old")
++                    elif kind == "symlink":
++                        output.symlink_to(target)
++                    elif kind == "dangling":
++                        output.symlink_to(root / "missing")
++                    else:
++                        os.link(target, output)
++                    write_file(output, b"new")
++                    self.assertFalse(output.is_symlink())
++                    self.assertEqual(output.read_bytes(), b"new")
++                    self.assertEqual(target.read_bytes(), b"keep")
++                    self.assertFalse((root / "missing").exists())
++
++    def test_write_file_uses_exclusive_creation(self):
++        with tempfile.TemporaryDirectory() as folder:
++            output = Path(folder) / "output"
++            original = Path.open
++            modes = []
++
++            def capture(path, mode="r", *args, **kwargs):
++                modes.append(mode)
++                return original(path, mode, *args, **kwargs)
++
++            with patch.object(Path, "open", capture):
++                write_file(output, b"value")
++            self.assertEqual(modes, ["xb"])
++
++    def test_configuration_replaces_link(self):
++        with tempfile.TemporaryDirectory() as folder:
++            root = Path(folder)
++            target = root / "target"
++            target.write_bytes(b"keep")
++            output = root / "pyvenv.cfg"
++            output.symlink_to(target)
++            PyEnvCfg({"home": "plain-value"}, output).write()
++            self.assertFalse(output.is_symlink())
++            self.assertEqual(target.read_bytes(), b"keep")
++            self.assertEqual(output.read_text(), "home = plain-value\n")
++
++    @unittest.skipIf(os.name == "nt", "uses POSIX executable paths")
++    def test_creators_detach_preexisting_file_links(self):
++        for creator in ("builtin", "venv"):
++            with self.subTest(creator=creator), tempfile.TemporaryDirectory() as folder:
++                root = Path(folder)
++                dest = root / "env"
++                (dest / "bin").mkdir(parents=True)
++                target = root / "target"
++                target.write_bytes(b"home = /usr/bin\n")
++                (dest / "pyvenv.cfg").symlink_to(target)
++                (dest / "bin" / "activate").symlink_to(root / "missing")
++                session = cli_run([str(dest), "--creator", creator, "--no-seed"])
++                self.assertTrue(session.creator.exe.is_file())
++                self.assertFalse((dest / "pyvenv.cfg").is_symlink())
++                self.assertFalse((dest / "bin" / "activate").is_symlink())
++                self.assertFalse((root / "missing").exists())
++                self.assertEqual(target.read_bytes(), b"home = /usr/bin\n")
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index fb5c03f923..01fddebdfa 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://bash-prompt-state-followup.patch \
             file://CVE-2026-113720.patch \
             file://CVE-2026-113719.patch \
+            file://CVE-2026-113721.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

