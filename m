Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3284.1794374984292199101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WQKpVdhs;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18284; q=dns/txt;
  s=iport01; t=1794374984; x=1795584584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5t6KSy7vfPdKsXCtgz/8/DBoScy61xhT9/m3PJr2v4g=;
  b=WQKpVdhsy/Fi72Ob8/RZQCRmwRdyNnUcyunHPeuL1GaR5tBvIlwEX+pu
   +/ikuvwkkAswp1zRJHMp5m0wDbEo+oPr+ih55EbG9EnXTDzNMQv4ZEtZ/
   sipN+1mh0HOMLUTiAU0t91a45aGBdXPDDWDd04/7glX7PGnAuVYP9pp7N
   wVvsIM7W70pwnKlW7KRWK5vKApR83h4ke7iX1dwj2BHhIjuThuPmyzxcQ
   eYDAI0sCLcEaczmmVwbweBEmM1MeVOfvp5vaqYdD4bJ0aaYIJCb2WYaiI
   JWaxp1yy9Ul2W0qVzMOYeim1NJdvcNGFqLDp/uokMyCOYhGc2GSDm/QXn
   A==;
X-CSE-ConnectionGUID: cN0NEegrT6OGN891R6Xucg==
X-CSE-MsgGUID: 59Ys0ctjQniYGxDfrsRoRg==
X-IPAS-Result: =?us-ascii?q?A0BSAgDP+/Nq/5L/Ja1RCYEVgUSCV3VgQ0kDhFSRdAOBE?=
 =?us-ascii?q?4pSkj0UgWoPAQEBD0QNBAEBhD9GAk8VjToCJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIwQLARgBLRAcAwECAwImAgIgC?=
 =?us-ascii?q?x0BBQgQCR6CZAGCOgM3AxEFuVF6fzOBAYMpATEFgR7YTA2CWgELFAGBCi6FQ?=
 =?us-ascii?q?oMAIAGFA10YAYR9JxsbgXKBFYJzdoEFgRpCAoE0EoN2gkgiBIIiehKBWoECB?=
 =?us-ascii?q?4UzA4ZbAoFPhyVIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+Fy9YGwYFg?=
 =?us-ascii?q?RyBHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKfhgNSBEsNxUZBD0Bb?=
 =?us-ascii?q?geSboMVexMBJgUEEzkEKxIJBg89GAchHAIELJJDHQkIkBaCIYE1nmtxCiiDe?=
 =?us-ascii?q?Iwkjz6FfBozhASBV5JDklQLmH2OCoQKhQeMWBtNhGqBaDyBWXAVO4JnCUoZD?=
 =?us-ascii?q?1cBjVYLC4Ngg1LLCSYyAgkDLwEBBwIHDgMLgWiQACxyYAEB?=
IronPort-Data: A9a23:jsHDFaOT8ubntyfvrR31lsFynXyQoLVcMsEvi/4bfWQNrUpw1mYCy
 jQYCm2CO62NNDOgedh+bI2/8xsCvcSGzNFkS3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gmcsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/5IVGcbMIICxrhQLkcep
 KUidgAQZR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsi+K3boCIJIPiqcN9wxepv
 TrN42bABBArG8yzxyCeyHWWibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:yb1smKFyP+IeP6kGpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:mrcQOG4SkAiJkyerE9ss/2hMPO0ofWfhklD/BR/pUFw3eKCeRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ADzA0yA8xgcfdKJHSlrui8k2Qf5o50r/2A1wPqJM?=
 =?us-ascii?q?HiuaUGSJqIA2atjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="532262567"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 09B3318000238;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id AA36ECBF203; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 3/9] python3-filelock: fix CVE-2026-112909
Date: Tue, 10 Nov 2026 21:29:32 -0800
Message-Id: <20261111052938.3691463-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132116
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the UnixFileLock integrity fix [1] referenced by advisory [2].
Open existing lock files without truncation and apply explicit modes
only to files created by this acquisition. Keep descriptors pinned
through ownership-aware fallback cleanup.

Include the required ENOSYS ownership handling [3] and the focused
upstream descriptor-mock correction [4]. Reuse the preceding atomic
helpers and preserve the existing 3.25.2 public API and FUSE retries.

[1] https://github.com/tox-dev/filelock/commit/e1e825b1992f69fb6b346dc395d5ae4893536c0a
[2] https://github.com/tox-dev/filelock/security/advisories/GHSA-69hj-f68j-2879
[3] https://github.com/tox-dev/filelock/commit/17a7c3182674601998588eb7aad6ec765c959251
[4] https://github.com/tox-dev/filelock/commit/65f5ea039c30ac6a77f09a88c1920503bff10a82

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-112909_p1.patch | 312 ++++++++++++++++++
 .../python3-filelock/CVE-2026-112909_p2.patch |  53 +++
 .../python/python3-filelock_3.25.2.bb         |   2 +
 3 files changed, 367 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p1.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p1.patch
new file mode 100644
index 0000000000..b145023a31
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p1.patch
@@ -0,0 +1,312 @@
+From e1e825b1992f69fb6b346dc395d5ae4893536c0a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:47:58 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(open):=20keep=20lock=20files?=
+ =?UTF-8?q?=20intact,=20honor=20deadlines=20and=20mode=20(#835)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112909
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/e1e825b1992f69fb6b346dc395d5ae4893536c0a]
+
+Backport Changes:
+- Backport only the UnixFileLock file-integrity changes and regressions.
+- Adapt acquisition, creation detection, cleanup and comments to the
+  3.25.2 context and helper layout; keep its pathname, FUSE/NFS retries
+  and unlink-on-release behavior.
+- Reuse remove_own_file() from the preceding helper backport for ENOSYS
+  cleanup while the created descriptor still pins its inode.
+- Include the own-placeholder ENOSYS handling and regressions from
+  commit 17a7c3182674601998588eb7aad6ec765c959251, plus the
+  placeholder-swap regression from the preceding helper backport.
+- Omit unrelated lease/oplock deadline and Windows permission changes,
+  newer descriptor/read-write/strict/soft plumbing and its tests, plus
+  associated build, task and documentation changes.
+- Use this suite's Unix marks, inline flock mocks and two-line
+  PID/hostname format instead of newer capability/identity helpers.
+
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_unix.py       | 82 +++++++++++++++++++++++--------------
+ tests/test_filelock.py      | 45 +++++++++++++++++++-
+ tests/test_unix_fallback.py | 79 ++++++++++++++++++++++++++++++++++-
+ 3 files changed, 171 insertions(+), 35 deletions(-)
+
+diff --git a/src/filelock/_unix.py b/src/filelock/_unix.py
+index ac5f26a..650be40 100644
+--- a/src/filelock/_unix.py
++++ b/src/filelock/_unix.py
+@@ -9,7 +9,7 @@ from pathlib import Path
+ from typing import cast
+ 
+ from ._api import BaseFileLock
+-from ._util import ensure_directory_exists
++from ._util import ensure_directory_exists, remove_own_file
+ 
+ #: a flag to indicate if the fcntl API is available
+ has_fcntl = False
+@@ -45,52 +45,72 @@ else:  # pragma: win32 no cover
+ 
+         def _acquire(self) -> None:  # noqa: C901, PLR0912
+             ensure_directory_exists(self.lock_file)
+-            open_flags = os.O_RDWR | os.O_TRUNC
++            if (opened := self._open_lock_file()) is None:
++                return
++            fd, created = opened
++            keep_fd = False
++            missing_flock = False
++            try:
++                if created and self.has_explicit_mode:
++                    # Before the flock: a peer may win it first, and only the creator may set the mode.
++                    # An fchmod that answers ENOSYS says nothing about flock.
++                    with suppress(PermissionError):
++                        os.fchmod(fd, self._context.mode)
++                try:
++                    fcntl.flock(fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
++                except OSError as exception:
++                    if exception.errno == ENOSYS:
++                        # Keep the descriptor open so a peer cannot reuse this inode while its own placeholder
++                        # is removed. An existing file may be a peer's live marker and must stay.
++                        if created:
++                            with suppress(OSError):
++                                remove_own_file(self.lock_file, fd)
++                        missing_flock = True
++                    elif exception.errno not in {EAGAIN, EWOULDBLOCK}:
++                        raise
++                else:
++                    # A lock on an inode unlinked between open() and flock() guards no name. Retry it.
++                    if os.fstat(fd).st_nlink != 0:
++                        self._context.lock_file_fd = fd
++                        keep_fd = True
++            except BaseException:
++                self._context.lock_file_fd = None
++                keep_fd = False
++                raise
++            finally:
++                if not keep_fd:
++                    os.close(fd)
++            if missing_flock:
++                self._fallback_to_soft_lock()
++                self._acquire()
++
++        def _open_lock_file(self) -> tuple[int, bool] | None:
++            # A renamed or hard-linked regular file is indistinguishable from an existing lock file: do not
++            # truncate it. O_EXCL identifies a file this acquire created, so only that file receives its mode.
++            open_flags = os.O_RDWR
+             o_nofollow = getattr(os, "O_NOFOLLOW", None)
+             if o_nofollow is not None:
+                 open_flags |= o_nofollow
+-            open_flags |= os.O_CREAT
+             open_mode = self._open_mode()
+             try:
+-                fd = os.open(self.lock_file, open_flags, open_mode)
++                return os.open(self.lock_file, open_flags | os.O_CREAT | os.O_EXCL, open_mode), True
++            except FileExistsError:
++                pass
+             except FileNotFoundError:
+                 # On FUSE/NFS, os.open(O_CREAT) is not atomic: LOOKUP + CREATE can be split, allowing a concurrent
+                 # unlink() to delete the file between them. For valid paths, treat ENOENT as transient contention.
+                 # For invalid paths (e.g., empty string), re-raise to avoid infinite retry loops.
+                 if self.lock_file and Path(self.lock_file).parent.exists():
+-                    return
++                    return None
+                 raise
+             except PermissionError:
+                 # Sticky-bit dirs (e.g. /tmp): O_CREAT fails if the file is owned by another user (#317).
+-                # Fall back to opening the existing file without O_CREAT.
+                 if not Path(self.lock_file).exists():
+                     raise
+-                try:
+-                    fd = os.open(self.lock_file, open_flags & ~os.O_CREAT, open_mode)
+-                except FileNotFoundError:
+-                    return
+-            if self.has_explicit_mode:
+-                with suppress(PermissionError):
+-                    os.fchmod(fd, self._context.mode)
+             try:
+-                fcntl.flock(fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
+-            except OSError as exception:
+-                os.close(fd)
+-                if exception.errno == ENOSYS:
+-                    with suppress(OSError):
+-                        Path(self.lock_file).unlink()
+-                    self._fallback_to_soft_lock()
+-                    self._acquire()
+-                    return
+-                if exception.errno not in {EAGAIN, EWOULDBLOCK}:
+-                    raise
+-            else:
+-                # The file may have been unlinked by a concurrent _release() between our open() and flock().
+-                # A lock on an unlinked inode is useless — discard and let the retry loop start fresh.
+-                if os.fstat(fd).st_nlink == 0:
+-                    os.close(fd)
+-                else:
+-                    self._context.lock_file_fd = fd
++                return os.open(self.lock_file, open_flags, open_mode), False
++            except FileNotFoundError:
++                return None
+ 
+         def _fallback_to_soft_lock(self) -> None:
+             from ._soft import SoftFileLock  # noqa: PLC0415
+diff --git a/tests/test_filelock.py b/tests/test_filelock.py
+index 38c7b90..b733f1b 100644
+--- a/tests/test_filelock.py
++++ b/tests/test_filelock.py
+@@ -7,10 +7,10 @@ import sys
+ import threading
+ from concurrent.futures import ThreadPoolExecutor
+ from contextlib import contextmanager
+-from errno import ENOSYS
++from errno import EIO, ENOSYS, EWOULDBLOCK
+ from inspect import getframeinfo, stack
+ from pathlib import Path, PurePath
+-from stat import S_IWGRP, S_IWOTH, S_IWUSR, filemode
++from stat import S_IMODE, S_IWGRP, S_IWOTH, S_IWUSR, filemode
+ from types import TracebackType
+ from typing import TYPE_CHECKING, Any
+ from uuid import uuid4
+@@ -1146,3 +1146,44 @@ def test_filenotfound_on_fuse_nfs_retries(tmp_path: Path, mocker: MockerFixture)
+     # First call failed with ENOENT, retry succeeded
+     assert call_count >= 2
+     lock.release()
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Unix flock semantics")
++@pytest.mark.parametrize("mode", [pytest.param(-1, id="default-mode"), pytest.param(0o666, id="explicit-mode")])
++def test_winner_leaves_existing_file_as_found(tmp_path: Path, mode: int) -> None:
++    (journal := tmp_path / "journal.log").write_text("data", encoding="utf-8")
++    journal.chmod(0o600)
++    # A regular file with one name is indistinguishable from a lock file an earlier holder left.
++    journal.rename(lock_path := tmp_path / "resource.lock")
++
++    with FileLock(lock_path, timeout=0, mode=mode):
++        assert (lock_path.read_text(encoding="utf-8"), S_IMODE(lock_path.stat().st_mode)) == ("data", 0o600)
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Unix flock semantics")
++def test_creator_that_loses_the_flock_applies_mode(tmp_path: Path, mocker: MockerFixture) -> None:
++    lock_path = tmp_path / "resource.lock"
++    # A peer may win the flock first, and only the creator may set the mode.
++    mocker.patch("filelock._unix.fcntl.flock", side_effect=OSError(EWOULDBLOCK, "Resource temporarily unavailable"))
++
++    initial_umask = os.umask(0o077)
++    try:
++        with pytest.raises(Timeout):
++            FileLock(lock_path, timeout=0, mode=0o666).acquire()
++    finally:
++        os.umask(initial_umask)
++
++    assert S_IMODE(lock_path.stat().st_mode) == 0o666
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Unix flock semantics")
++@pytest.mark.parametrize("failing", [pytest.param("fchmod", id="fchmod"), pytest.param("fstat", id="fstat")])
++def test_post_open_failure_closes_fd(tmp_path: Path, mocker: MockerFixture, failing: str) -> None:
++    mocker.patch(f"os.{failing}", side_effect=OSError(EIO, "Input/output error"))
++    open_spy = mocker.spy(os, "open")
++    close_spy = mocker.spy(os, "close")
++
++    with pytest.raises(OSError, match="Input/output error"):
++        FileLock(tmp_path / "resource.lock", timeout=0, mode=0o644).acquire()
++
++    assert any(call.args and call.args[0] == open_spy.spy_return for call in close_spy.call_args_list)
+diff --git a/tests/test_unix_fallback.py b/tests/test_unix_fallback.py
+index b99c716..d48a1f6 100644
+--- a/tests/test_unix_fallback.py
++++ b/tests/test_unix_fallback.py
+@@ -3,12 +3,13 @@ from __future__ import annotations
+ import os
+ import socket
+ import sys
++import warnings
+ from errno import EIO, ENOSYS
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
+-from filelock import SoftFileLock, UnixFileLock
++from filelock import SoftFileLock, Timeout, UnixFileLock
+ 
+ if TYPE_CHECKING:
+     from pathlib import Path
+@@ -111,3 +112,77 @@ def test_release_suppresses_eio_on_close(tmp_path: Path, mocker: MockerFixture)
+     mocker.patch("filelock._unix.os.close", side_effect=_close_eio)
+     lock.release()
+     assert not lock.is_locked
++
++
++@unix_only
++def test_fchmod_enosys_is_not_a_missing_flock(tmp_path: Path, mocker: MockerFixture) -> None:  # pragma: needs fcntl
++    mocker.patch("os.fchmod", side_effect=OSError(ENOSYS, "Function not implemented"))
++    lock = UnixFileLock(tmp_path / "test.lock", mode=0o644)
++
++    with warnings.catch_warnings(record=True) as recorded:
++        warnings.simplefilter("always")
++        with pytest.raises(OSError, match="Function not implemented"):
++            lock.acquire()
++
++    assert not recorded
++    assert not isinstance(lock, SoftFileLock)
++
++
++@unix_only
++@pytest.mark.filterwarnings("ignore:flock not supported on this filesystem:UserWarning")
++def test_fallback_removes_placeholder_it_created(tmp_path: Path, mocker: MockerFixture) -> None:  # pragma: needs fcntl
++    mocker.patch(_FLOCK_PATCH_TARGET, side_effect=_ENOSYS_SIDE_EFFECT)
++    lock = UnixFileLock(tmp_path / "test.lock")
++
++    lock.acquire(timeout=0)
++    assert lock.is_locked
++    lock.release()
++
++
++@unix_only
++@pytest.mark.filterwarnings("ignore:flock not supported on this filesystem:UserWarning")
++def test_fallback_keeps_peer_soft_marker(tmp_path: Path, mocker: MockerFixture) -> None:  # pragma: needs fcntl
++    mocker.patch(_FLOCK_PATCH_TARGET, side_effect=_ENOSYS_SIDE_EFFECT)
++    lock_path = tmp_path / "test.lock"
++    holder = UnixFileLock(lock_path)
++    holder.acquire()
++    marker = lock_path.stat().st_ino, lock_path.read_bytes()
++
++    with pytest.raises(Timeout):
++        UnixFileLock(lock_path).acquire(timeout=0)
++    assert (lock_path.stat().st_ino, lock_path.read_bytes()) == marker
++    holder.release()
++
++
++@unix_only
++@pytest.mark.filterwarnings("ignore:flock not supported on this filesystem:UserWarning")
++def test_fallback_spares_a_peer_marker_that_replaced_its_placeholder(  # pragma: needs fcntl
++    tmp_path: Path, mocker: MockerFixture
++) -> None:
++    lock_path: Final = tmp_path / "test.lock"
++    peer_marker: Final = f"{os.getpid()}\n{socket.gethostname()}\n"
++    lstat: Final = os.lstat
++    stalled: list[bool] = []
++
++    def flock_missing(fd: int, operation: int) -> None:
++        stalled.append(False)
++        raise OSError(ENOSYS, f"Function not implemented for {fd} with {operation}")
++
++    def lstat_then_peer_replaces_placeholder(path: str, *, dir_fd: int | None = None) -> os.stat_result:
++        found: Final = lstat(path, dir_fd=dir_fd)
++        if stalled == [False] and os.fspath(path) == os.fspath(lock_path):
++            # The cleanup stalls past the grace a waiting soft lock gives an empty file, which evicts the placeholder
++            # and publishes its own marker.
++            stalled[0] = True
++            lock_path.unlink()
++            lock_path.write_text(peer_marker, encoding="utf-8")
++        return found
++
++    mocker.patch("filelock._unix.fcntl.flock", side_effect=flock_missing)
++    mocker.patch("os.lstat", side_effect=lstat_then_peer_replaces_placeholder)
++    with pytest.raises(Timeout):
++        UnixFileLock(lock_path).acquire(timeout=0)
++    mocker.stopall()
++
++    # Where os.link cannot restore it, the peer's marker waits under a break name, but it is never deleted.
++    assert peer_marker in [path.read_text(encoding="utf-8") for path in tmp_path.glob("test.lock*")]
diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p2.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p2.patch
new file mode 100644
index 0000000000..62bff82a46
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p2.patch
@@ -0,0 +1,53 @@
+From 65f5ea039c30ac6a77f09a88c1920503bff10a82 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Tue, 27 Oct 2026 21:01:48 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=A7=AA=20test:=20narrow=20fstat=20mocks?=
+ =?UTF-8?q?=20to=20the=20lock's=20descriptor=20(#893)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112909
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/65f5ea039c30ac6a77f09a88c1920503bff10a82]
+
+Backport Changes:
+- Retain only the test_post_open_failure_closes_fd() correction; the
+  other newer test modules and cases are absent from this backport.
+- Add the required Final import and retain the target Unix skip mark.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/test_filelock.py | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_filelock.py b/tests/test_filelock.py
+index b733f1b..0479c85 100644
+--- a/tests/test_filelock.py
++++ b/tests/test_filelock.py
+@@ -12,7 +12,7 @@ from inspect import getframeinfo, stack
+ from pathlib import Path, PurePath
+ from stat import S_IMODE, S_IWGRP, S_IWOTH, S_IWUSR, filemode
+ from types import TracebackType
+-from typing import TYPE_CHECKING, Any
++from typing import TYPE_CHECKING, Any, Final
+ from uuid import uuid4
+ from weakref import WeakValueDictionary
+ 
+@@ -1179,9 +1179,16 @@ def test_creator_that_loses_the_flock_applies_mode(tmp_path: Path, mocker: Mocke
+ @pytest.mark.skipif(sys.platform == "win32", reason="Unix flock semantics")
+ @pytest.mark.parametrize("failing", [pytest.param("fchmod", id="fchmod"), pytest.param("fstat", id="fstat")])
+ def test_post_open_failure_closes_fd(tmp_path: Path, mocker: MockerFixture, failing: str) -> None:
+-    mocker.patch(f"os.{failing}", side_effect=OSError(EIO, "Input/output error"))
+     open_spy = mocker.spy(os, "open")
+     close_spy = mocker.spy(os, "close")
++    real: Final = getattr(os, failing)
++
++    def fail_for_the_lock_file(fd: int, *args: int) -> os.stat_result | None:
++        if fd == open_spy.spy_return:
++            raise OSError(EIO, "Input/output error")
++        return real(fd, *args)
++
++    mocker.patch(f"os.{failing}", side_effect=fail_for_the_lock_file)
+ 
+     with pytest.raises(OSError, match="Input/output error"):
+         FileLock(tmp_path / "resource.lock", timeout=0, mode=0o644).acquire()
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 352ab29a29..a4bd002f1f 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -12,6 +12,8 @@ SRC_URI += " file://run-ptest \
     file://CVE-2026-112935_p1.patch \
     file://CVE-2026-112935_p2.patch \
     file://CVE-2026-112935_p3.patch \
+    file://CVE-2026-112909_p1.patch \
+    file://CVE-2026-112909_p2.patch \
 "
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
-- 
2.35.6
