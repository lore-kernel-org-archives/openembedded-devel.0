Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30041.1793869209251710244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bEuNHtfj;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9803; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pV5r2fu2IX51bbaXWkzsv6S+6dOC3FmxzqJmEdqVulE=;
  b=bEuNHtfj7b4Hvw0Bs/ZqVh8FYkYOQibKS3dL50dw5X8g8U4+Bjnsc1TD
   q+yxPOnEdx3WBDVrJIJ/fIPZEz3s9MwhzoXhoqSsWFWsta0HdnTIEj1Zw
   xD0qq0agRkiUAyoYuq2dIsvri5EXCq59hmZtG5bMN8kRX6u8yjfPoxvwo
   LDS5vZ69bnELP8viIvnxvzuPfveRbK9ltgtp3L1iV7GehP9XCT1WTvE6Q
   MRAlzjsKgMH5LhulrpfWof1TumrlfRtl009/HH7TYR/buHXlTrHCfalrR
   GkhgP21k5VNioEyKgK+Ubh988EJRyr+yfaUOTz07MtX+wd06yO7JNJGRZ
   g==;
X-CSE-ConnectionGUID: ufcTfPObSJ6HQlF4zGuAWw==
X-CSE-MsgGUID: U8NJJGXxSXq0OLFoNsvxSQ==
X-IPAS-Result: =?us-ascii?q?A0AnAADGROxq/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJhFeIG4c4giEDgROKUpI8gX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYA?=
 =?us-ascii?q?T0JEwMBAgMCJgICIAsjCBAJgwIBgjoDNwMRoQ2bJHp/M4EBgykBPwJDUNhMD?=
 =?us-ascii?q?YJaAQsUAYEKLgGFP4J/IAGFA10YAUSEOScbG4FygRWBF4FcdoEFgRpCAQGFP?=
 =?us-ascii?q?IJqBIIigQyBWo0YAoFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?y9YGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3F?=
 =?us-ascii?q?RkEPQFuB5IvgkRNMRkWLgErUEtREQcEMqNHgiGgIHEKKIN4jCSPPoV8GjOEB?=
 =?us-ascii?q?IFXpRYLmH2CWYsxhAqRVAsxN4RpgWg8gUcLB3AVgyIJShkPji4LC4NggX+CU?=
 =?us-ascii?q?YEUyHcmMgIJMgEBBwIHAQwBAwuBaJF+AQE?=
IronPort-Data: A9a23:hRIPuqA+qqZE9BVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGt00GdRx
 2YXX2jUO/qKM2rzLosjbIqzpxsPvMWEx4dhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3vtlME8OGocj2LhXOGVgq
 e43NRkycUXW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVcpi+O9aoGPEjCMbfgFuGS6i
 VLWxFTgWjY+Gtu50iSVyUv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:uBKpPqx2zyHzeVrC1+gAKrPwDr1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHDP5gr5NEtMpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCRr2Kr7GSoQEIcBeQygcy78
 tdmtBFaOHYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:MVgfCG/oiLGTOQUgU3WVv1MaEfwrSlrX91WOA3a8Jzp7Z6C8dkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A4Xj1mQ9ybFYxK14BHQf+CDaQf/o4xYaMJ3AdqqU?=
 =?us-ascii?q?f4+6gGytWICmNtw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530338232"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 893D0180007DB
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 8E0F1CBEF6B; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 11/18] python3-virtualenv: fix CVE-2026-113719
Date: Thu,  5 Nov 2026 01:00:00 -0800
Message-Id: <20261105090007.351866-12-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131890
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Restrict seed-package metadata cleanup to entries
inside the environment, without deleting the environment itself or
directories containing the metadata. Unlink final symlinks without
following their targets.

[1] https://github.com/pypa/virtualenv/commit/e3cea6fa10a50fa29cf1fdddd772458fba076d5f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-113719

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113719.patch  | 207 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
new file mode 100644
index 0000000000..078ae3974f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
@@ -0,0 +1,207 @@
+From e3cea6fa10a50fa29cf1fdddd772458fba076d5f Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
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
+- Add the Final import required by the unchanged upstream regression
+  tests; the older test module does not already import it.
+- Omit the upstream release changelog fragment, which is not shipped
+  in the 21.2.1 source archive.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../embed/via_app_data/pip_install/base.py    | 43 +++++----
+ .../embed/test_bootstrap_link_via_app_data.py | 88 ++++++++++++++++++-
+ 2 files changed, 115 insertions(+), 16 deletions(-)
+
+diff --git a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+index 89348aa..7697e73 100644
+--- a/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
++++ b/src/virtualenv/seed/embed/via_app_data/pip_install/base.py
+@@ -9,7 +9,7 @@ from configparser import ConfigParser
+ from itertools import chain
+ from pathlib import Path
+ from tempfile import mkdtemp
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ from distlib.scripts import ScriptMaker, enquote_executable
+ 
+@@ -154,35 +154,48 @@ class PipInstall(ABC):
+         paths = (p for p in in_folders if p.stem.split("-")[0] == dist_name and p.suffix == ".dist-info" and p.is_dir())
+         existing_dist = next(paths, None)
+         if existing_dist is not None:
+-            self._uninstall_dist(existing_dist)
++            self._uninstall_dist(existing_dist, self._creator.dest)
+ 
+     @staticmethod
+-    def _uninstall_dist(dist: Path) -> None:
+-        dist_base = dist.parent
++    def _uninstall_dist(dist: Path, env_dir: Path) -> None:
++        dist_base: Final = dist.parent
+         LOGGER.debug("uninstall existing distribution %s from %s", dist.stem, dist_base)
+ 
+-        top_txt = dist / "top_level.txt"  # add top level packages at folder level
+-        paths = (
++        top_txt: Final = dist / "top_level.txt"
++        paths: Final = (
+             {dist.parent / i.strip() for i in top_txt.read_text(encoding="utf-8").splitlines()}
+             if top_txt.exists()
+             else set()
+         )
+-        paths.add(dist)  # add the dist-info folder itself
++        paths.add(dist)
+ 
+-        base_dirs, record = paths.copy(), dist / "RECORD"  # collect entries in record that we did not register yet
++        base_dirs: Final = paths.copy()
++        record: Final = dist / "RECORD"
+         for name in (
+             (i.split(",")[0] for i in record.read_text(encoding="utf-8").splitlines()) if record.exists() else ()
+         ):
+-            path = dist_base / name
+-            if not any(p in base_dirs for p in path.parents):  # only add if not already added as a base dir
++            path: Final = dist_base / name
++            if not any(p in base_dirs for p in path.parents):
+                 paths.add(path)
+ 
+-        for path in sorted(paths):  # actually remove stuff in a stable order
+-            if path.exists():
+-                if path.is_dir() and not path.is_symlink():
+-                    safe_delete(path)
++        root: Final = env_dir.resolve()
++        metadata_parents: Final = set(dist.resolve().parents)
++        for entry in sorted(paths):
++            if entry.exists() or entry.is_symlink():
++                linked: Final = entry.is_symlink()
++                # Unlinking the final link leaves its target intact; parent links still affect containment.
++                resolved: Final = entry.parent.resolve() / entry.name if linked else entry.resolve()
++                if root not in resolved.parents or resolved in metadata_parents:
++                    LOGGER.warning(
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
+     def clear(self) -> None:
+         if self._image_dir.exists():
+diff --git a/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py b/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
+index 502f32a..278a48e 100644
+--- a/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
++++ b/tests/unit/seed/embed/test_bootstrap_link_via_app_data.py
+@@ -6,7 +6,7 @@ import sys
+ from stat import S_IWGRP, S_IWOTH, S_IWUSR
+ from subprocess import Popen, check_call
+ from threading import Thread
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ from python_discovery import PythonInfo
+@@ -23,6 +23,92 @@ if TYPE_CHECKING:
+     from pytest_mock import MockerFixture
+ 
+ 
++@pytest.mark.parametrize(
++    ("metadata_file", "content"),
++    [
++        pytest.param("top_level.txt", "pip\n{dest}\n", id="top-level-env-root"),
++        pytest.param("top_level.txt", "pip\n\n", id="top-level-blank"),
++        pytest.param("RECORD", "{record}\n{outside},,", id="record-traversal"),
++    ],
++)
++def test_seed_metadata_cleanup_stays_inside_package(
++    tmp_path: Path, caplog: pytest.LogCaptureFixture, metadata_file: str, content: str
++) -> None:
++    args: Final = [str(tmp_path / "env"), "--pip", "embed", "--no-periodic-update"]
++    session: Final = cli_run(args, setup_logging=False)
++    purelib: Final = session.creator.purelib
++    markers: Final = [tmp_path / "keep.txt", session.creator.dest / "keep.txt", purelib / "keep.txt"]
++    for marker in markers:
++        marker.write_text("keep", encoding="utf-8")
++    dist_info: Final = next(purelib.glob("pip-*.dist-info"))
++    (dist_info / metadata_file).write_text(
++        content.format(
++            dest=session.creator.dest,
++            outside=os.path.relpath(markers[0], purelib),
++            record=(dist_info / "RECORD").read_text(encoding="utf-8"),
++        ),
++        encoding="utf-8",
++    )
++    cli_run(args, setup_logging=False)
++    assert (
++        [i.exists() for i in markers],
++        (purelib / "pip" / "__init__.py").is_file(),
++        "skip removal of" in caplog.text,
++    ) == (
++        [True, True, True],
++        True,
++        True,
++    )
++
++
++@pytest.mark.skipif(not fs_supports_symlink(), reason="symlinks are unavailable")
++def test_seed_metadata_unlinks_symlink_without_following(tmp_path: Path, caplog: pytest.LogCaptureFixture) -> None:
++    args: Final = [str(tmp_path / "env"), "--pip", "embed", "--no-periodic-update"]
++    session: Final = cli_run(args, setup_logging=False)
++    outside: Final = tmp_path / "outside"
++    outside.mkdir()
++    (outside / "keep.txt").write_text("keep", encoding="utf-8")
++    link: Final = session.creator.purelib / "linked"
++    link.symlink_to(outside, target_is_directory=True)
++    record: Final = next(session.creator.purelib.glob("pip-*.dist-info")) / "RECORD"
++    record.write_text(f"{record.read_text(encoding='utf-8')}\nlinked,,", encoding="utf-8")
++    cli_run(args, setup_logging=False)
++    assert (link.is_symlink(), (outside / "keep.txt").exists(), "skip removal of" in caplog.text) == (
++        False,
++        True,
++        False,
++    )
++
++
++@pytest.mark.parametrize(
++    "linked",
++    [
++        pytest.param(False, id="copy"),
++        pytest.param(
++            True, id="symlink", marks=pytest.mark.skipif(not fs_supports_symlink(), reason="symlinks are unavailable")
++        ),
++    ],
++)
++def test_seed_metadata_keeps_reseeding_supported(
++    tmp_path: Path, linked: bool, caplog: pytest.LogCaptureFixture
++) -> None:
++    args: Final = [
++        str(tmp_path / "env"),
++        "--pip",
++        "embed",
++        "--no-periodic-update",
++        *(["--symlink-app-data"] if linked else []),
++    ]
++    cli_run(args, setup_logging=False)
++    session: Final = cli_run(args, setup_logging=False)
++    package: Final = session.creator.purelib / "pip"
++    assert ((package / "__init__.py").is_file(), package.is_symlink(), "skip removal of" in caplog.text) == (
++        True,
++        linked,
++        False,
++    )
++
++
+ @pytest.mark.slow
+ @pytest.mark.parametrize("copies", [False, True] if fs_supports_symlink() else [True])
+ def test_seed_link_via_app_data(tmp_path, coverage_env, current_fastest, copies, for_py_version) -> None:  # noqa: PLR0915
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index bd92f92555..01b2125df7 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
     file://CVE-2026-115586.patch \
     file://CVE-2026-113715.patch \
     file://CVE-2026-113720.patch \
+    file://CVE-2026-113719.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

