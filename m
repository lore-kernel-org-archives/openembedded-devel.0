Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11754.1795496989540783888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VMuFd8zk;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6730; q=dns/txt;
  s=iport01; t=1795496989; x=1796706589;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=B9Ej6SQNW7zL+c46wNVC4s/5dp9o4ZTn/F7EcryFw5w=;
  b=VMuFd8zkZoa3daFf+0HkWQmdgw18xhN5GqeQ/IVflXs5+ffICocRHmbc
   N9XJA/26IPer6VogMbYehjtw/SxSX4/4u0FvSc8WMgHG0iGL4h4De3gq6
   rAORfWEDRgGxlD2zt25cQfoF445/1E9nwpIRGVebvPQlyorxeoqY56imP
   6mOc9hql3EspLyOx4ZOa6pXi6LEo0nkQQWJOEnyQrN7vUcnLVjsTIVEh4
   pAVas9D4MvIIuKlxY6jijAf0YHoyVINUaShu1vA+hpqi+PKBCkFfn9jDn
   brvjm2Q4eDQZ/G2vYZZh/P8rh+eAWYLIU4/Bo2dpICbT+3kJZWXJMelJQ
   Q==;
X-CSE-ConnectionGUID: DVyOUZwPTY2HQrsjL3gQEQ==
X-CSE-MsgGUID: TOhbH+xgRTeA1IW/9x0gGg==
X-IPAS-Result: =?us-ascii?q?A0BNAgBOGgVr/9VK/pBaglmCV3VhQkkDhFSPU4IhA4ETi?=
 =?us-ascii?q?lOSQ4F+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMjDwEYAT0JEwMBAgMCJgICIAsjCBAJg?=
 =?us-ascii?q?wIBgjoDNwIBEZ9lmyR6gTKBAYMpAYFU2EwNgloBCxQBgQouhUKDACABhQNdG?=
 =?us-ascii?q?AGEfScbG4FygRWBF4FddoEFgRpCAoU8gmoEgiJ6EoFUjRcCgU+ISUiBAhwDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIA?=
 =?us-ascii?q?g0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUF?=
 =?us-ascii?q?IMaMQwkLQEII1Y7PDgno1SCIaAgcQoog3mMJI8+hXwaM6pyC5h9jgqECoUHj?=
 =?us-ascii?q?HNNhGqBaDyBWXAVgyIJShkPjjmDa4RQygsjNQIJAy8BAQcCBw4DC4FokAAsg?=
 =?us-ascii?q?VIBAQ?=
IronPort-Data: A9a23:giWzyqpSuV+5KaZYmJiWReM/hgReBmJMZBIvgKrLsJaIsI4StFCzt
 garIBmOM/6MZzTxKt53Pdi38k8FsMLWn9dmQFE5ryBgRi4R9+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8kg35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0spJEEZzx
 +MgFAFXTimZnOCSm72CZ9A506zPLOGzVG8eknht13TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA5MYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9JIbVGZkEzx/wS
 mTuw0P5CDFZJNOl9Tesq1OTwb7fxSzUV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:haytE6p2jy+UKSznfK2RFkIaV5oJeYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7290ey7MBDhHP1OkOws1MmZPTUO0VHAROoJ0WKh+UyDJ8SUzIFgPM
 lbH5SWcOeRMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AX8vD7mqu1C/GuOMVaXgYvJXmUewbY1rg/mjoH37?=
 =?us-ascii?q?iKV9zU7+xElCp1Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:NoD+igQyGrHcLyDiRXTQozFoFIR47J6SBWlUsKpB6tncOgN/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62744991"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:45 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 8E59018000210
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id CC094CC51C0; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 09/12]  python3-virtualenv: fix CVE-2026-113720
Date: Mon, 23 Nov 2026 21:09:39 -0800
Message-Id: <20261124050942.1795310-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132917
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Adapt the copy helpers to virtualenv 20.25.3 and apply current permissions
instead of preserving permissive cache modes.

[1] https://github.com/pypa/virtualenv/commit/35f0b33562790176dd186d0a3c517af3acc7a0e1
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-fc2g-4w5p-6whm

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113720.patch  | 135 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
new file mode 100644
index 0000000000..4b702ab9ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
@@ -0,0 +1,135 @@
+From 35f0b33562790176dd186d0a3c517af3acc7a0e1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:57:36 -0700
+Subject: [PATCH] 🐛 fix(path): apply current permissions to copied files (#3425)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113720
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/35f0b33562790176dd186d0a3c517af3acc7a0e1]
+
+Backport Changes:
+ - Adapt the copy helpers to the older untyped API and retain the directory
+   handling already added by the CVE-2026-113716 backport.
+ - Replace the newer upstream pytest fixture changes with compatible
+   unittest checks; omit docs/changelog/3425.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/util/path/_sync.py  | 30 ++++++++++++++--------
+ tests/unit/test_cve_2026_113720.py | 52 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 71 insertions(+), 11 deletions(-)
+
+diff --git a/src/virtualenv/util/path/_sync.py b/src/virtualenv/util/path/_sync.py
+index bf2410fb1970f5a37dc5a0adf3fa1e873ee1d006..41afd0d9ea5fc3449e1e168c54580fb10b0dfa79 100644
+--- a/src/virtualenv/util/path/_sync.py
++++ b/src/virtualenv/util/path/_sync.py
+@@ -4,7 +4,8 @@ import logging
+ import os
+ import shutil
+ import sys
+-from stat import S_ISDIR, S_ISLNK, S_IWUSR
++from pathlib import Path
++from stat import S_ISDIR, S_ISLNK, S_IWUSR, S_IXGRP, S_IXOTH, S_IXUSR
+ 
+ if os.name == "nt":
+     from stat import IO_REPARSE_TAG_MOUNT_POINT
+@@ -67,22 +68,29 @@ def symlink(src, dest):
+ 
+ 
+ def copy(src, dest):
+-    ensure_safe_to_do(src, dest)
+-    is_dir = src.is_dir()
+-    method = copytree if is_dir else shutil.copy
+     logging.debug("copy %s", _Debug(src, dest))
+-    method(str(src), str(dest))
++    if src.is_dir():
++        ensure_safe_to_do(src, dest)
++        copytree(str(src), str(dest))
++    else:
++        _copy_file(src, dest)
+ 
+ 
+ def copytree(src, dest):
+     for root, _, files in os.walk(src):
+-        dest_dir = os.path.join(dest, os.path.relpath(root, src))
+-        if not os.path.isdir(dest_dir):
+-            os.makedirs(dest_dir)
++        dest_dir = Path(dest) / os.path.relpath(root, src)
++        dest_dir.mkdir(parents=True, exist_ok=True)
+         for name in files:
+-            src_f = os.path.join(root, name)
+-            dest_f = os.path.join(dest_dir, name)
+-            shutil.copy(src_f, dest_f)
++            _copy_file(Path(root) / name, dest_dir / name)
++
++
++def _copy_file(src, dest):
++    ensure_safe_to_do(src, dest)
++    mode = 0o755 if src.stat().st_mode & (S_IXUSR | S_IXGRP | S_IXOTH) else 0o644
++    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | (os.O_BINARY if os.name == "nt" else 0)
++    # Creation applies the current umask without changing the process-wide setting.
++    with src.open("rb") as source, os.fdopen(os.open(str(dest), flags, mode), "wb") as target:
++        shutil.copyfileobj(source, target, length=1024 * 1024)
+ 
+ 
+ def safe_delete(dest):
+diff --git a/tests/unit/test_cve_2026_113720.py b/tests/unit/test_cve_2026_113720.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..9ae00d7602c2cd65f99186c1b7289b30aff513e4
+--- /dev/null
++++ b/tests/unit/test_cve_2026_113720.py
+@@ -0,0 +1,52 @@
++import os
++import stat
++import tempfile
++import unittest
++from pathlib import Path
++
++from virtualenv.util.path import copy
++
++
++@unittest.skipUnless(os.name == "posix", "requires POSIX permissions")
++class TestCopyPermissions(unittest.TestCase):
++    def test_modes_follow_current_umask(self):
++        cases = [
++            (0o666, 0o022, 0o644), (0o666, 0o077, 0o600),
++            (0o444, 0o022, 0o644), (0o600, 0o022, 0o644),
++            (0o777, 0o022, 0o755), (0o777, 0o077, 0o700),
++            (0o666, 0o000, 0o644), (0o777, 0o000, 0o755),
++            (0o666, 0o002, 0o644), (0o777, 0o002, 0o755),
++        ]
++        for directory in (False, True):
++            for source_mode, mask, expected in cases:
++                with self.subTest(directory=directory, source_mode=oct(source_mode), mask=oct(mask)):
++                    with tempfile.TemporaryDirectory() as root:
++                        root = Path(root)
++                        src = root / "source"
++                        dest = root / "destination"
++                        if directory:
++                            src.mkdir()
++                            source_file = src / "data"
++                        else:
++                            source_file = src
++                        source_file.write_bytes(b"contents")
++                        source_file.chmod(source_mode)
++                        old_mask = os.umask(mask)
++                        try:
++                            copy(src, dest)
++                        finally:
++                            os.umask(old_mask)
++                        target = dest / "data" if directory else dest
++                        self.assertEqual(target.read_bytes(), b"contents")
++                        self.assertEqual(stat.S_IMODE(target.stat().st_mode), expected)
++                        self.assertEqual(stat.S_IMODE(source_file.stat().st_mode), source_mode)
++
++    def test_existing_destination_is_replaced(self):
++        with tempfile.TemporaryDirectory() as root:
++            root = Path(root)
++            source = root / "source"
++            target = root / "target"
++            source.write_bytes(b"new")
++            target.write_bytes(b"old")
++            copy(source, target)
++            self.assertEqual(target.read_bytes(), b"new")
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index fecbc723a6..c6f300f7bc 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2026-113716.patch \
             file://CVE-2026-113723.patch \
             file://bash-prompt-state-followup.patch \
+            file://CVE-2026-113720.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

