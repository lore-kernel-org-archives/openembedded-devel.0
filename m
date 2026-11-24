Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11751.1795496988092403056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LXIvqjKz;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7843; q=dns/txt;
  s=iport01; t=1795496990; x=1796706590;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Mwljbu8l08wRCWcivJwwEsG16q4mkDxvmKenpHgr02A=;
  b=LXIvqjKzs1FK96vGEtNzkMktUeEglq80dVZ+CUU6jxKN8OtaUyBQhcM7
   UB4J0wNnMhXcE2jeqWslDDyix4Zi+mXCF5IxDgnzgBPJxCNRLzPxJSlQs
   Av6mnzfas5OQpVAzkEaGgPfLbZHBuAKBkdA7vRSBjz766ooVQqfxKWxxj
   FK4WGxnXlHNXkuZkx5DPkxDRZuhabYAJvSVVsc8YLsXP/8hrcCh87Thzh
   RkBDherZkQdMt+hjep02aeK0RGvaetI2DlCanivsI5av2E5WeXtGoqP+R
   3AcUZW5MQiZULcI6JeuSpKetgcslFMGKYIpDBKWvlW1xA6Ve783xDJUXb
   g==;
X-CSE-ConnectionGUID: peFoDlUxT2e1cSfjy0rrKg==
X-CSE-MsgGUID: ETj/RiBpR5qj4BTMMAgzpA==
X-IPAS-Result: =?us-ascii?q?A0BNAgBOGgVr/8xK/pBaHgEBCxIMggULgld1YUJJA4RUj?=
 =?us-ascii?q?1OCIQOBE4pTkkOBfg8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIw8BGAE9CRMDAQIDAiYCA?=
 =?us-ascii?q?iALIwgQCYMCAYI6AzcCARGfZZskeoEygQGDKQGBVNhMDYJaAQsUAYEKLoVCg?=
 =?us-ascii?q?wAgAYUDXRgBRIQ5JxsbgXKBFYEXgV12gQWBGkICgSeEFYJqBIIiehKBVI0XA?=
 =?us-ascii?q?oFPiElIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7Fy9YGwYFgRyBHoESg?=
 =?us-ascii?q?QNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRL?=
 =?us-ascii?q?DcVGQQ9AW4HlBSDGmABLQEII1AGRVERCAMkEaNDgiGgIHEKKIN5jCSPPoV8G?=
 =?us-ascii?q?jOFW6UXC5h9jgqECoUHjFgLJjeEaoFoPIFZcBWDIglKGQ+OOYNrR4QJgRTId?=
 =?us-ascii?q?yM1AgkDLwEBBwIHDgMLgWiQACyBUgEB?=
IronPort-Data: A9a23:GqhN9K0dhCK94Hk0w/bD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzIGn
 GMbCj2EOvrfYTGjKY8iYY/n8kwBsJ7RztVjTQto3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcuaTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFEwYOqEcx/ZLW2wX/
 scWKiFVdAqgiLfjqF67YrEEasULJcTxeYdasXZ6wHSBVrAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEiojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQviuexbIuEILRmQ+14okTfn
 GPs516kGxNGHuC67BOK4GqF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOH9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:27bCyqxAMBbWlo/vVf7uKrPwDr1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHDP5gr5NEtMpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCRr2Kr7GSoQEIcBeQygcy78
 tdmtBFaOHYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:CeQBd22uO6jg+yEF7web87xfAs0LdVHZ8WfseULhAl1nSqzNU0Wz9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A/wFJ0w1WXkFsKLNOF6qMBP1lmDUjzpisT3oMu40?=
 =?us-ascii?q?85tCGaQZMHhK0gyava9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62744992"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:46 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 8E1C9180006C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id D137ACC51C1; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 10/12]  python3-virtualenv: fix CVE-2026-113719
Date: Mon, 23 Nov 2026 21:09:40 -0800
Message-Id: <20261124050942.1795310-11-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132919
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Adapt metadata cleanup to virtualenv 20.25.3 and keep deletion within the
environment while preserving metadata parent directories.

[1] https://github.com/pypa/virtualenv/commit/e3cea6fa10a50fa29cf1fdddd772458fba076d5f
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-hhxq-47xx-j5xx

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113719.patch  | 141 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
new file mode 100644
index 0000000000..646679ddfa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
@@ -0,0 +1,141 @@
+From e3cea6fa10a50fa29cf1fdddd772458fba076d5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:19:58 -0700
+Subject: [PATCH] 🐛 fix(seed): contain metadata cleanup (#3428)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113719
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/e3cea6fa10a50fa29cf1fdddd772458fba076d5f]
+
+Backport Changes:
+ - Refresh the metadata-cleanup changes for the older untyped PipInstall
+   implementation and its logging interface.
+ - Replace the newer upstream pytest fixture changes with compatible
+   unittest checks; omit docs/changelog/3428.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../seed/embed/via_app_data/pip_install/base.py    | 26 ++++++---
+ tests/unit/seed/embed/test_cve_2026_113719.py      | 65 ++++++++++++++++++++++
+ 2 files changed, 84 insertions(+), 7 deletions(-)
+
+diff --git a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+index 961cd425125269cd87404cfd34c0aec7eb28c2b3..e8a5670f6c627683fb8cae7bd764bd021fcd2291 100644
+--- a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
++++ b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+@@ -146,10 +146,10 @@ class PipInstall(ABC):
+         paths = (p for p in in_folders if p.stem.split("-")[0] == dist_name and p.suffix == ".dist-info" and p.is_dir())
+         existing_dist = next(paths, None)
+         if existing_dist is not None:
+-            self._uninstall_dist(existing_dist)
++            self._uninstall_dist(existing_dist, self._creator.dest)
+ 
+     @staticmethod
+-    def _uninstall_dist(dist):
++    def _uninstall_dist(dist, env_dir):
+         dist_base = dist.parent
+         logging.debug("uninstall existing distribution %s from %s", dist.stem, dist_base)
+ 
+@@ -169,12 +169,24 @@ class PipInstall(ABC):
+             if not any(p in base_dirs for p in path.parents):  # only add if not already added as a base dir
+                 paths.add(path)
+ 
+-        for path in sorted(paths):  # actually remove stuff in a stable order
+-            if path.exists():
+-                if path.is_dir() and not path.is_symlink():
+-                    safe_delete(path)
++        root = env_dir.resolve()
++        metadata_parents = set(dist.resolve().parents)
++        for entry in sorted(paths):
++            if entry.exists() or entry.is_symlink():
++                linked = entry.is_symlink()
++                # Unlinking the final link leaves its target intact; parent links still affect containment.
++                resolved = entry.parent.resolve() / entry.name if linked else entry.resolve()
++                if root not in resolved.parents or resolved in metadata_parents:
++                    logging.warning(
++                        "skip removal of %s listed by %s: not inside environment %s or a parent of the metadata",
++                        entry,
++                        dist.name,
++                        root,
++                    )
++                elif entry.is_dir() and not linked:
++                    safe_delete(entry)
+                 else:
+-                    path.unlink()
++                    entry.unlink()
+ 
+     def clear(self):
+         if self._image_dir.exists():
+diff --git a/tests/unit/seed/embed/test_cve_2026_113719.py b/tests/unit/seed/embed/test_cve_2026_113719.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..c6330e5a9849e42c861454230cbb96aa5c1b428b
+--- /dev/null
++++ b/tests/unit/seed/embed/test_cve_2026_113719.py
+@@ -0,0 +1,65 @@
++import os
++import tempfile
++import unittest
++from pathlib import Path
++
++from virtualenv.seed.embed.via_app_data.pip_install.base import PipInstall
++
++
++class TestMetadataCleanup(unittest.TestCase):
++    def setUp(self):
++        self.directory = tempfile.TemporaryDirectory()
++        self.root = Path(self.directory.name)
++        self.env = self.root / "env"
++        self.packages = self.env / "lib" / "python" / "site-packages"
++        self.dist = self.packages / "pip-1.dist-info"
++        self.dist.mkdir(parents=True)
++        self.package = self.packages / "pip"
++        self.package.mkdir()
++        (self.package / "__init__.py").write_text("", encoding="utf-8")
++
++    def tearDown(self):
++        self.directory.cleanup()
++
++    def test_regular_packages_and_launchers_are_removed(self):
++        launcher = self.env / "bin" / "pip"
++        launcher.parent.mkdir()
++        launcher.write_text("launcher", encoding="utf-8")
++        (self.dist / "top_level.txt").write_text("pip\n", encoding="utf-8")
++        (self.dist / "RECORD").write_text("../../../bin/pip,,\n", encoding="utf-8")
++        PipInstall._uninstall_dist(self.dist, self.env)
++        self.assertFalse(self.dist.exists())
++        self.assertFalse(self.package.exists())
++        self.assertFalse(launcher.exists())
++        self.assertTrue(self.env.is_dir())
++
++    def test_environment_and_metadata_parents_are_preserved(self):
++        (self.dist / "top_level.txt").write_text("\n.\n" + str(self.env) + "\npip\n", encoding="utf-8")
++        PipInstall._uninstall_dist(self.dist, self.env)
++        self.assertTrue(self.env.is_dir())
++        self.assertTrue(self.packages.is_dir())
++        self.assertFalse(self.package.exists())
++        self.assertFalse(self.dist.exists())
++
++    def test_entries_outside_environment_are_preserved(self):
++        outside = self.root / "untouched"
++        outside.write_text("keep", encoding="utf-8")
++        (self.dist / "RECORD").write_text(str(outside) + ",,\n", encoding="utf-8")
++        PipInstall._uninstall_dist(self.dist, self.env)
++        self.assertEqual(outside.read_text(encoding="utf-8"), "keep")
++        self.assertFalse(self.dist.exists())
++
++    @unittest.skipIf(os.name == "nt", "requires POSIX symlink support")
++    def test_final_links_are_removed_without_touching_targets(self):
++        outside = self.root / "untouched"
++        outside.mkdir()
++        (outside / "data").write_text("keep", encoding="utf-8")
++        link = self.packages / "linked"
++        link.symlink_to(outside, target_is_directory=True)
++        dangling = self.packages / "dangling"
++        dangling.symlink_to(self.root / "missing")
++        (self.dist / "top_level.txt").write_text("linked\ndangling\n", encoding="utf-8")
++        PipInstall._uninstall_dist(self.dist, self.env)
++        self.assertFalse(link.is_symlink())
++        self.assertFalse(dangling.is_symlink())
++        self.assertEqual((outside / "data").read_text(encoding="utf-8"), "keep")
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index c6f300f7bc..fb5c03f923 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2026-113723.patch \
             file://bash-prompt-state-followup.patch \
             file://CVE-2026-113720.patch \
+            file://CVE-2026-113719.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

