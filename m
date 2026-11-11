Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3366.1794374984988995796
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Tse9vplq;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=66492; q=dns/txt;
  s=iport01; t=1794374985; x=1795584585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sFcnHbCTTcbMhsVPij7B0u7vGUTYmW+Mxto2MNmm5eg=;
  b=Tse9vplqGXkKNSm2fhIrEIoeGnvedquDaKzIb+OUB9qs3SvWJyuk+SRl
   jpeDbX2aDrN77jqMWfmkC4Av3Cj9Qxmx045TkXmCBPEOOnlrRJcDQVVRl
   VNGC9A7v1F5l0l3Tc6/kjn0YUiZqJWEPrrgFrvaZ3GNSJvJU7cTiyHbdy
   DhngGYXmwRWbwraqvb7y0RclEpwWug/2AeINMQ470gnKYd4r4+IW3rZqm
   azz70UOrxtUpa8e0YgNpMVaGNCSsjJs0HGB4op6GzZ+gfNCx7J4Lqxhz1
   DFNkahuivrjbhcu70kWDx5JixUy3oaDZMGUwhRM1nuIB2on+Vm3AB5GBD
   g==;
X-CSE-ConnectionGUID: rFWc5P5MR52g6BI9RK//Ug==
X-CSE-MsgGUID: 77TNlHOhRseFakNvDW9jlA==
X-IPAS-Result: =?us-ascii?q?A0BUAwBQ/PNq/4z/Ja1RCYJZgld1WwEEQ0kDhFSRdAOBE?=
 =?us-ascii?q?4pShWeMVhSBag8BAQEPRA0EAQGEP0YCjh4CJjUIDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDGgEIBAsBGAEbEhAcAQIBAgMCE?=
 =?us-ascii?q?RUCAiALHQEFCBAJH4JjAYI6AzcDEblYen8zgQGDKQGBVNhMDYJaAQsUAYEKL?=
 =?us-ascii?q?oVCgwAgAYUDXRgBRIQ5JxsbgXKBFYEXgVx2gQWBGkICgRkbDgZXgx2CSCIEg?=
 =?us-ascii?q?iJ6EoFaHmQHAoU0hlsCgU+HJUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XL1gbBgWBHIEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IE?=
 =?us-ascii?q?Sw3FRkEPQFuB5JughkvGRQOEQEBBg8XECQaCQoBBx8FBBEBMggEAgEoBgwIF?=
 =?us-ascii?q?h4fARAODg4FHAIrAgOSVAoCBwIBkB2CIYE1nh5NcQoog3iMJI8+hXwaM4QEg?=
 =?us-ascii?q?VeSQ5JUC5h9jgqECpFZBgsQA0qEaoFpATqBWXAVO4JnCUoZD1iNUwMLC4Ngh?=
 =?us-ascii?q?FDKCyYyAgkDLwEBBwIHAQwBAwuBaIRhix8CJgQDb2ABAQ?=
IronPort-Data: A9a23:j7DtSaK6E+4nLKU0FE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS1zcOy
 2RMWTjVPq3eMzSkft4kbYm+pxsEvpSBm9Y3SFcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmctajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10In49YLVF39wqW24Q3
 91JEhNKKS2M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeSwYIqEIYDSLSlTthnHm
 kTC30P5OAoXGtWc7ySpzSOugsaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:noBkNqPx1tVLT8BcThmjsMiBIKoaSvp037Dk7S9MoHtuA6qlfq
 GV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AA8+AhWooGRs4mUM7FtW+iAHmUdoLTXaA9Cr1GRL?=
 =?us-ascii?q?iBjhDaeyvahjXxawxxg=3D=3D?=
X-Talos-MUID: 9a23:/LfdKgq2c5yfhGjxK6cez249COFsw4OuMlsAv5wFndeoCn1yPx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="545889340"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id E5FEE180001D1;
	Wed, 11 Nov 2026 05:29:42 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A37F9CBF202; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 2/9] python3-filelock: fix CVE-2026-112935
Date: Tue, 10 Nov 2026 21:29:31 -0800
Message-Id: <20261111052938.3691463-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132121
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport atomic stale-marker takeover [1] and its recovery-PID [2]
and raced-restoration [3] corrections, following advisory [4]. Pin
observed inodes and exchange markers atomically so a stale observation
cannot remove a successor's live lock. Route lifetime expiry through
the same takeover path and retain the 3.25.2 public API and records.

Add ctypes for the native atomic-exchange helpers and retain the
applicable upstream recovery regressions.

[1] https://github.com/tox-dev/filelock/commit/740ff666b62a88496c8d7394e4e6230605e4d62b
[2] https://github.com/tox-dev/filelock/commit/5bfde2890ff907a5318c1b7f815fcd52a887f127
[3] https://github.com/tox-dev/filelock/commit/77eb01a21ce842659e7beb9fd50a3dc935647416
[4] https://github.com/tox-dev/filelock/security/advisories/GHSA-fq56-3cx3-fjxp

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-112935_p1.patch | 945 ++++++++++++++++++
 .../python3-filelock/CVE-2026-112935_p2.patch |  90 ++
 .../python3-filelock/CVE-2026-112935_p3.patch | 425 ++++++++
 .../python/python3-filelock_3.25.2.bb         |   4 +
 4 files changed, 1464 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p1.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p1.patch
new file mode 100644
index 0000000000..d7a4bd5944
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p1.patch
@@ -0,0 +1,945 @@
+From 740ff666b62a88496c8d7394e4e6230605e4d62b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:53:44 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(soft):=20break=20stale=20mar?=
+ =?UTF-8?q?kers=20without=20emptying=20the=20lock=20path=20(#843)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112935
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/740ff666b62a88496c8d7394e4e6230605e4d62b]
+
+Backport Changes:
+- Port inode pinning, atomic exchanges and stranded-marker recovery
+  to SoftFileLock; retain two-line PID/hostname owner records.
+- Use existing lock_file/context fields in place of 4.x descriptor
+  state, paths and identity helpers; keep the existing public API.
+- Override lifetime expiry through the secure takeover path and
+  adapt the existing tests for secure marker reads and write rollback.
+- Inject expiry-race failures through the atomic-exchange helpers
+  in the existing regression instead of the former Path.rename path.
+- Omit new marker/lease/strict-lock APIs and their version-specific
+  tests and docs; retain focused SoftFileLock regressions.
+
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_soft.py       | 362 ++++++++++++++++++++++++++++++++++++++------
+ src/filelock/_util.py       | 267 +++++++++++++++++++++++++++++++-
+ tests/test_lock_expiry.py   |   3 +-
+ tests/test_soft_security.py | 129 ++++++++++++++++
+ tests/test_soft_stale.py    |  13 +-
+ 5 files changed, 719 insertions(+), 55 deletions(-)
+ create mode 100644 tests/test_soft_security.py
+
+diff --git a/src/filelock/_soft.py b/src/filelock/_soft.py
+index 3a535ea..852ac71 100644
+--- a/src/filelock/_soft.py
++++ b/src/filelock/_soft.py
+@@ -1,9 +1,12 @@
+ from __future__ import annotations
+ 
+ import os
++import re
++import secrets
+ import socket
+ import stat
+ import sys
++import threading
+ import time
+ from contextlib import suppress
+ from errno import EACCES, EEXIST, EPERM, ESRCH
+@@ -11,68 +14,240 @@ from pathlib import Path
+ from typing import Final
+ 
+ from ._api import BaseFileLock
+-from ._util import ensure_directory_exists, raise_on_not_writable_file
+-
+-#: Contenders act on the record in the marker, so no other account may write it, whatever the mode or umask.
+-_OTHERS_WRITE: Final[int] = stat.S_IWGRP | stat.S_IWOTH
++from ._util import (
++    break_lock_file,
++    ensure_directory_exists,
++    exchange_names,
++    exchange_supported,
++    pin_inode,
++    raise_on_not_writable_file,
++    remove_own_file,
++    write_all,
++)
+ 
+ _WIN_SYNCHRONIZE = 0x100000
+ _WIN_ERROR_INVALID_PARAMETER = 87
++_MAX_LOCK_FILE_SIZE: Final[int] = 1024
++#: Contenders act on the record in the marker, so no other account may write it, whatever the mode or umask.
++_OTHERS_WRITE: Final[int] = stat.S_IWGRP | stat.S_IWOTH
++_CLAIMS_IN_PROGRESS: Final[set[str]] = set()
++_CLAIMS_LOCK: Final[threading.Lock] = threading.Lock()
++_RELEASED_RECORD: Final[str] = "filelock/released\n"
+ 
+ 
+ class SoftFileLock(BaseFileLock):
+     """
+     Portable file lock based on file existence.
+ 
+-    Unlike :class:`UnixFileLock <filelock.UnixFileLock>` and :class:`WindowsFileLock <filelock.WindowsFileLock>`, this
+-    lock does not use OS-level locking primitives. Instead, it creates the lock file with ``O_CREAT | O_EXCL`` and
+-    treats its existence as the lock indicator. This makes it work on any filesystem but leaves stale lock files behind
+-    if the process crashes without releasing the lock.
+-
+-    To mitigate stale locks, the lock file contains the PID and hostname of the holding process. On contention, if the
+-    holder is on the same host and its PID no longer exists, the stale lock is broken automatically.
++    The two-line PID/hostname record remains compatible with filelock 3.25.
++    A stale marker is pinned and exchanged atomically so reclaiming it cannot
++    remove a successor's live lock. Filesystems without an atomic exchange
++    keep the marker rather than leave the lock path temporarily empty.
+ 
+     """
+ 
+     def _acquire(self) -> None:
+         raise_on_not_writable_file(self.lock_file)
+         ensure_directory_exists(self.lock_file)
+-        flags = (
+-            os.O_WRONLY  # open for writing only
+-            | os.O_CREAT
+-            | os.O_EXCL  # together with above raise EEXIST if the file specified by filename exists
+-            | os.O_TRUNC  # truncate the file to zero byte
+-        )
++        flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_TRUNC
+         if (o_nofollow := getattr(os, "O_NOFOLLOW", None)) is not None:
+             flags |= o_nofollow
+         try:
+-            file_handler = os.open(self.lock_file, flags, self._open_mode() & ~_OTHERS_WRITE)
++            fd = os.open(self.lock_file, flags, self._open_mode() & ~_OTHERS_WRITE)
+         except OSError as exception:
+-            if not (
+-                exception.errno == EEXIST or (exception.errno == EACCES and sys.platform == "win32")
+-            ):  # pragma: win32 no cover
++            if not (exception.errno == EEXIST or (exception.errno == EACCES and sys.platform == "win32")):
+                 raise
+-            if exception.errno == EEXIST and sys.platform != "win32":  # pragma: win32 no cover
++            if exception.errno == EEXIST and sys.platform != "win32":
+                 self._try_break_stale_lock()
+         else:
+-            self._write_lock_info(file_handler)
+-            self._context.lock_file_fd = file_handler
++            # Publish held state only once the record is on disk. On failure,
++            # close the descriptor and remove only the marker it created.
++            try:
++                self._write_lock_info(fd)
++            except BaseException:
++                try:
++                    with suppress(OSError):
++                        remove_own_file(self.lock_file, fd)
++                finally:
++                    os.close(fd)
++                raise
++            self._context.lock_file_fd = fd
+ 
+     def _try_break_stale_lock(self) -> None:
+-        with suppress(OSError, ValueError):
+-            content = Path(self.lock_file).read_text(encoding="utf-8")
+-            lines = content.strip().splitlines()
+-            if len(lines) != 2:  # noqa: PLR2004
++        with suppress(OSError, ValueError), pin_inode(self.lock_file) as pinned:
++            content, marker = _read_lock_file(self.lock_file)
++            if pinned not in {None, marker.st_ino}:
+                 return
+-            pid_str, hostname = lines
+-            if hostname != socket.gethostname():
++            if content == _RELEASED_RECORD:
++                self._take_over(marker, None)
+                 return
+-            pid = int(pid_str)
+-            if self._is_process_alive(pid):
++            holder = _parse_lock_holder(content)
++            if holder is None:
++                # 3.25 does not age out malformed or half-written markers.
+                 return
+-            break_path = f"{self.lock_file}.break.{os.getpid()}"
+-            Path(self.lock_file).rename(break_path)
+-            Path(break_path).unlink()
++            pid, hostname = holder
++            if hostname == socket.gethostname() and not self._is_process_alive(pid):
++                self._take_over(marker, pid)
++
++    def _try_break_expired_lock(self) -> None:
++        if (lifetime := self._context.lifetime) is None:
++            return
++        with suppress(OSError), pin_inode(self.lock_file) as pinned:
++            content, marker = _read_lock_file(self.lock_file)
++            if pinned not in {None, marker.st_ino} or time.time() - marker.st_mtime < lifetime:
++                return
++            holder = _parse_lock_holder(content)
++            self._take_over(marker, None if holder is None else holder[0])
++
++    def _take_over(self, marker: os.stat_result, breaker_pid: int | None) -> None:
++        # Swap the judged marker for a complete marker of ours in one exchange, so the lock path never stands empty.
++        # Once the file swapped out proves to be the one judged, this lock holds the path; the caller's pin keeps that
++        # file's inode number from naming anything else. Only a peer's exchange can move our marker after that, and
++        # the peer puts it back because what it took is not the file it judged. Every failure before the handoff takes
++        # our marker off the path and puts back what the exchange took. Without an exchange, the portable break decides.
++        if exchange_supported():  # pragma: win32 no cover
++            self._take_over_by_exchange(marker, breaker_pid)
++        else:
++            break_lock_file(self.lock_file, marker.st_mtime, marker.st_ino)
++
++
++    def _take_over_by_exchange(self, marker: os.stat_result, breaker_pid: int | None) -> None:  # pragma: win32 no cover
++        if (current := os.lstat(self.lock_file)).st_mtime != marker.st_mtime or current.st_ino != marker.st_ino:
++            return
++        if breaker_pid is not None and self._restore_stranded_marker(breaker_pid, marker):
++            return
++        aside: Final = f"{self.lock_file}.break.{os.getpid()}.{secrets.token_hex(16)}"
++        flags: Final = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
++        fd: Final = os.open(aside, flags, self._open_mode() & ~_OTHERS_WRITE)
++        exchanged = held = False
++        try:
++            self._write_lock_info(fd)
++            if not exchange_names(aside, self.lock_file):
++                return  # NFS, SMB and the like refuse it; renaming the marker aside would empty the path
++            exchanged = True
++            if (taken := os.lstat(aside)).st_mtime != marker.st_mtime or taken.st_ino != marker.st_ino:
++                return  # a peer recreated the marker, which the cleanup below swaps back
++            Path(aside).unlink()
++            exchanged = False
++            self._context.lock_file_fd = fd
++            held = True
++        finally:
++            if not held:
++                self._abandon_take_over(fd, aside, put_back=exchanged)
++
++
++    def _restore_stranded_marker(self, breaker_pid: int, marker: os.stat_result) -> bool:  # pragma: win32 no cover
++        # A breaker killed between its exchange and the put-back leaves its own marker at the path and the live
++        # holder's marker under its break name. A recoverer first renames that record to a name of its own. Only one
++        # contender wins the rename, so two of them never exchange the same record and reverse each other. A record
++        # a dead recoverer holds is claimable again. A claim of this process that no thread is working on was
++        # abandoned by a failed put-back, and the next poll takes it up again. Where the marker cannot be put back
++        # the lock counts as held, as it does wherever no exchange is possible.
++        if (candidates := self._stranded_candidates(breaker_pid)) is None:
++            return True
++        return any(self._recover_claimed(path, breaker_pid, marker, adopt=abandoned) for path, abandoned in candidates)
++
++
++    def _stranded_candidates(self, breaker_pid: int) -> list[tuple[str, bool]] | None:  # pragma: win32 no cover
++        directory, name = os.path.split(self.lock_file)
++        stranded: Final = re.compile(rf"{re.escape(name)}\.break\.{breaker_pid}\.[0-9a-f]{{32}}")
++        claimed: Final = re.compile(rf"{re.escape(name)}\.restore\.(\d+)\.[0-9a-f]{{32}}")
++        candidates: list[tuple[str, bool]] = []
++        with os.scandir(directory or os.curdir) as entries:
++            for entry in entries:
++                if not entry.is_file(follow_symlinks=False):
++                    continue
++                path = str(Path(directory) / entry.name)
++                if stranded.fullmatch(entry.name):
++                    candidates.append((path, False))
++                elif found := claimed.fullmatch(entry.name):
++                    ours = int(found[1]) == os.getpid()
++                    if not (ours or not self._is_process_alive(int(found[1]))):
++                        return None
++                    candidates.append((path, ours))
++        return sorted(candidates)
++
++
++    def _recover_claimed(
++        self, path: str, breaker_pid: int, marker: os.stat_result, *, adopt: bool
++    ) -> bool:  # pragma: win32 no cover
++        # One try/finally owns the registration from the first step to the last, so no interruption can leave it set.
++        # Registered before the rename publishes the name, so a thread that scans meanwhile sees a claim in progress.
++        own: Final = path if adopt else f"{self.lock_file}.restore.{os.getpid()}.{secrets.token_hex(16)}"
++        if not _begin_claim(own):
++            return True
++        try:
++            if not adopt:
++                try:
++                    Path(path).rename(own)
++                except OSError:  # a peer that won the rename now holds the record, so the lock counts as held
++                    return True
++            return self._restore_claimed(own, breaker_pid, marker)
++        finally:
++            _end_claim(own)
++
++
++    def _restore_claimed(self, own: str, breaker_pid: int, marker: os.stat_result) -> bool:  # pragma: win32 no cover
++        try:
++            content, _ = _read_lock_file(own)
++        except OSError:
++            self._return_claim(own, breaker_pid)
++            return True
++        if not self._marker_is_live(content, breaker_pid):
++            with suppress(OSError):
++                Path(own).unlink()
++            return False
++        # The inode of the marker judged dead must still be at the path, or a peer has acted since.
++        with suppress(OSError):
++            current = os.lstat(self.lock_file)
++            if (current.st_ino, current.st_mtime) == (marker.st_ino, marker.st_mtime) and exchange_names(
++                own, self.lock_file
++            ):
++                if os.lstat(own).st_ino == marker.st_ino:
++                    Path(own).unlink()
++                    return True
++                # A peer replaced the path after the check, so the exchange took its marker: swap it straight back.
++                exchange_names(own, self.lock_file)
++        self._return_claim(own, breaker_pid)
++        return True
++
++
++    def _return_claim(self, own: str, breaker_pid: int) -> None:  # pragma: win32 no cover
++        # A refused rename leaves the claim under this process's PID, and the next poll retries it.
++        with suppress(OSError):
++            Path(own).rename(f"{self.lock_file}.break.{breaker_pid}.{secrets.token_hex(16)}")
++
++
++    def _abandon_take_over(self, fd: int, aside: str, *, put_back: bool) -> None:  # pragma: win32 no cover
++        self._context.lock_file_fd = None
++        try:
++            if put_back:
++                exchange_names(aside, self.lock_file)
++        finally:
++            try:
++                # Whichever name still holds our marker loses it: the descriptor keeps its inode number ours.
++                own: Final = os.fstat(fd)
++                for name in (self.lock_file, aside):
++                    with suppress(FileNotFoundError):
++                        if os.path.samestat(os.lstat(name), own):
++                            Path(name).unlink()
++            finally:
++                os.close(fd)
++
++
++    @classmethod
++    def _marker_is_live(cls, content: str | None, breaker_pid: int) -> bool:
++        if content == _RELEASED_RECORD:
++            return False
++        holder = _parse_lock_holder(content)
++        if holder is None:
++            # Empty, malformed and newer protocols remain held as in 3.25.
++            return True
++        pid, hostname = holder
++        if pid == breaker_pid and hostname == socket.gethostname():
++            return False
++        return hostname != socket.gethostname() or cls._is_process_alive(pid)
++
+ 
+     @staticmethod
+     def _is_process_alive(pid: int) -> bool:
+@@ -95,27 +270,58 @@ class SoftFileLock(BaseFileLock):
+             raise
+         return True
+ 
++
+     @staticmethod
+     def _write_lock_info(fd: int) -> None:
+-        with suppress(OSError):
+-            os.write(fd, f"{os.getpid()}\n{socket.gethostname()}\n".encode())
++        write_all(fd, f"{os.getpid()}\n{socket.gethostname()}\n".encode())
+ 
+     def _release(self) -> None:
+-        assert self._context.lock_file_fd is not None  # noqa: S101
+-        os.close(self._context.lock_file_fd)
+-        self._context.lock_file_fd = None
++        fd = self._context.lock_file_fd
++        assert fd is not None  # noqa: S101
++        identity: tuple[int, int] | None = None
++        with suppress(OSError):
++            identity = _file_identity(os.fstat(fd))
+         if sys.platform == "win32":
+-            self._windows_unlink_with_retry()
+-        else:
+-            with suppress(OSError):
++            self._context.lock_file_fd = None
++            try:
++                os.close(fd)
++            finally:
++                if identity is not None:
++                    self._windows_unlink_with_retry(identity)
++            return
++        unlinked = self._unlink_open_marker(fd, identity)
++        self._context.lock_file_fd = None
++        try:
++            os.close(fd)
++        finally:
++            if not unlinked and identity is not None:
++                with suppress(OSError):
++                    if _file_identity(os.lstat(self.lock_file)) == identity:
++                        Path(self.lock_file).unlink()
++
++    def _unlink_open_marker(self, fd: int, identity: tuple[int, int] | None) -> bool:
++        if identity is None:
++            return True
++        try:
++            if _file_identity(os.lstat(self.lock_file)) == identity:
+                 Path(self.lock_file).unlink()
++                return True
++            _leave_released_record(fd)
++        except FileNotFoundError:
++            return True
++        except OSError:
++            return False
++        return True
++
+ 
+-    def _windows_unlink_with_retry(self) -> None:
++    def _windows_unlink_with_retry(self, identity: tuple[int, int] | None = None) -> None:
+         max_retries = 10
+         retry_delay = 0.001
+         for attempt in range(max_retries):
+             # Windows doesn't immediately release file handles after close, causing EACCES/EPERM on unlink
+             try:
++                if identity is not None and _file_identity(os.lstat(self.lock_file)) != identity:
++                    return
+                 Path(self.lock_file).unlink()
+             except OSError as exc:  # noqa: PERF203
+                 if exc.errno not in {EACCES, EPERM}:
+@@ -127,6 +333,68 @@ class SoftFileLock(BaseFileLock):
+                 return
+ 
+ 
+-__all__ = [
+-    "SoftFileLock",
+-]
++def _file_identity(st: os.stat_result) -> tuple[int, int]:
++    # (st_dev, st_ino) names the concrete inode behind a path, so a marker recreated at the same pathname after an
++    # expired lease reads as a different file. CPython populates both on Windows from the volume serial and file index.
++    return st.st_dev, st.st_ino
++
++
++def _begin_claim(name: str | Path) -> bool:  # pragma: win32 no cover
++    # Keyed by the file name alone: its random token identifies the claim, and the spelling of the directory varies.
++    with _CLAIMS_LOCK:
++        if (key := Path(name).name) in _CLAIMS_IN_PROGRESS:
++            return False
++        _CLAIMS_IN_PROGRESS.add(key)
++        return True
++
++
++def _end_claim(name: str | Path) -> None:  # pragma: win32 no cover
++    with _CLAIMS_LOCK:
++        _CLAIMS_IN_PROGRESS.discard(Path(name).name)
++
++
++def _leave_released_record(fd: int) -> None:
++    # A peer's exchange holds our marker under its break name and will put it back. Overwriting the record lets
++    # contenders age it out instead of waiting on this live PID. The write comes before the truncate so the file is
++    # never empty.
++    if sys.platform != "win32":  # pragma: win32 no cover
++        os.pwrite(fd, released := b"filelock/released\n", 0)
++        os.ftruncate(fd, len(released))
++
++
++def _read_lock_file(path: str) -> tuple[str | None, os.stat_result]:
++    # A legitimate lock file is always a regular file. Classify the path with lstat first, so any other node (symlink,
++    # FIFO, socket, device) is reported as a malformed lock the caller can evict, without an os.open that would follow
++    # a symlink, stall on a FIFO, or fail on a socket and leave acquisition wedged. The stat result still flows back
++    # for the identity-checked stale break. lstat, not stat, so a hostile symlink is never followed onto its target.
++    st = os.lstat(path)
++    if not stat.S_ISREG(st.st_mode):  # pragma: needs fifo
++        return None, st
++    # Re-check on the opened handle: O_NOFOLLOW refuses a symlink swapped in after the lstat, O_NONBLOCK stops a FIFO
++    # swapped in from stalling the open, and the fstat catches any other non-regular replacement race before we read.
++    # The capped read stops a huge regular file (e.g. one filled from /dev/zero) from exhausting memory.
++    fd = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_NONBLOCK", 0))
++    try:
++        st = os.fstat(fd)
++        if not stat.S_ISREG(st.st_mode):  # pragma: no cover  # only a non-regular node swapped in after the lstat
++            return None, st
++        data = os.read(fd, _MAX_LOCK_FILE_SIZE + 1)
++    finally:
++        os.close(fd)
++    if len(data) <= _MAX_LOCK_FILE_SIZE:
++        with suppress(UnicodeDecodeError):
++            return data.decode("utf-8"), st
++    return None, st
++
++
++def _parse_lock_holder(content: str | None) -> tuple[int, str] | None:
++    if content is None or len(lines := content.strip().splitlines()) != 2:
++        return None
++    pid_text, hostname = lines
++    if not (pid_text.isascii() and pid_text.isdigit()):
++        return None
++    pid = int(pid_text)
++    return (pid, hostname) if 1 <= pid <= 2**31 - 1 else None
++
++
++__all__ = ["SoftFileLock"]
+diff --git a/src/filelock/_util.py b/src/filelock/_util.py
+index 6701523..98d4f6f 100644
+--- a/src/filelock/_util.py
++++ b/src/filelock/_util.py
+@@ -1,10 +1,20 @@
+ from __future__ import annotations
+ 
++import errno
+ import os
++import platform
++import secrets
+ import stat
+ import sys
+-from errno import EACCES, EISDIR
++from contextlib import contextmanager, suppress
++from errno import EACCES, EINVAL, EIO, EISDIR, ENOSYS, EXDEV
++from functools import cache
+ from pathlib import Path
++from typing import TYPE_CHECKING, Final, cast
++
++if TYPE_CHECKING:
++    import ctypes
++    from collections.abc import Callable, Generator
+ 
+ 
+ def raise_on_not_writable_file(filename: str) -> None:
+@@ -47,7 +57,262 @@ def ensure_directory_exists(filename: Path | str) -> None:
+     Path(filename).parent.mkdir(parents=True, exist_ok=True)
+ 
+ 
++def write_all(fd: int, data: bytes) -> None:
++    """
++    Write the whole buffer to *fd*, looping over the short writes POSIX lets ``os.write`` make.
++
++    A caller that stopped after one short write would leave a truncated marker behind. A peer that reads between two
++    writes sees a prefix of the record; each caller has to tolerate that. Lock records need not survive a power loss, so
++    we skip ``fsync``.
++
++    :param fd: file descriptor open for writing.
++    :param data: bytes to write in full.
++
++    :raises OSError: if a write reports zero progress before the record is complete.
++
++    """
++    remaining = memoryview(data)
++    while remaining:
++        if (written := os.write(fd, remaining)) == 0:
++            raise OSError(EIO, "os.write wrote 0 bytes before the record was complete")
++        remaining = remaining[written:]
++
++
++@contextmanager
++def pin_inode(lock_file: str) -> Generator[int | None, None, None]:
++    """
++    Keep the file at *lock_file* allocated for the length of the block and yield its inode number.
++
++    An inode is the kernel's identity for a file, independent of its name, and its number names a file only while the
++    inode stays allocated. ext4 hands a freed number to the next file created. Once a stale marker is unlinked, the next
++    holder's marker can therefore carry the number a contender read a moment ago. A caller that reads the marker inside
++    the block, gives up unless it read the yielded inode, and breaks the marker before leaving can rely on the number.
++
++    :param lock_file: path to the lock file about to be read and perhaps broken.
++
++    :returns: the pinned inode number, or ``None`` where nothing can be pinned. Windows cannot rename a file this
++        process holds open, so it needs no pin. Without ``O_PATH`` a symlink or a socket cannot be opened.
++
++    :raises FileNotFoundError: if the path is gone.
++
++    """
++    if sys.platform == "win32":  # pragma: win32 cover
++        yield None
++    else:  # pragma: win32 no cover
++        # O_PATH pins any node, a symlink or socket included, without read permission and without the filesystem seeing
++        # an open; elsewhere a nonblocking read-only open pins what it can.
++        flags: Final = getattr(os, "O_PATH", os.O_RDONLY | getattr(os, "O_NONBLOCK", 0)) | getattr(os, "O_NOFOLLOW", 0)
++        try:
++            fd = os.open(lock_file, flags)
++        except FileNotFoundError:
++            raise
++        except OSError:
++            yield None
++            return
++        try:
++            yield os.fstat(fd).st_ino
++        finally:
++            os.close(fd)
++
++
++def remove_own_file(lock_file: str, fd: int) -> None:  # pragma: win32 no cover
++    """
++    Remove *lock_file* while it still names the file open as *fd*; the caller closes the descriptor afterwards.
++
++    Where the platform has an atomic exchange, a stale break takes the file through it, so a peer's marker found at the
++    path goes back. Otherwise the path is unlinked by name if it still names this file. The open descriptor keeps the
++    inode allocated, so a matching number cannot belong to a successor's marker.
++
++    :raises OSError: if the descriptor cannot be read or the unlink fails.
++
++    """
++    own: Final = os.fstat(fd)
++    with suppress(FileNotFoundError):
++        break_lock_file(lock_file, own.st_mtime, own.st_ino)
++        if os.path.samestat(os.lstat(lock_file), own):
++            Path(lock_file).unlink()
++
++
++def break_lock_file(lock_file: str, mtime_before: float, ino_before: int) -> None:
++    """
++    Remove the lock file a caller found stale with modification time *mtime_before* and inode *ino_before*.
++
++    The caller keeps the judged file open until we return, through :func:`pin_inode` or its own descriptor, so no
++    other file can carry *ino_before* meanwhile. Right before breaking we ``lstat`` the lock again and leave it alone
++    if a peer recreated it since the caller judged it stale, as Mercurial re-reads a lock under its break lock.
++
++    On Linux (``renameat2``) and macOS (``renamex_np``) the platform can exchange two names in one step. There we swap
++    the marker with a placeholder of our own, so the lock path never stands empty, and a contender that polls meanwhile
++    finds a file it cannot parse and waits. If the file we took is not the one judged stale, a peer recreated the lock,
++    and a second exchange puts it back. Otherwise we remove it and then our placeholder. Of several processes racing to
++    break the same lock, only one takes the stale file.
++
++    Windows cannot exchange names, but it refuses to rename a marker its live holder keeps open. There we rename the
++    marker aside and, if it was recreated after all, link it back. ``link`` never replaces a name, so a marker a third
++    process created meanwhile keeps the path. Elsewhere without an exchange (NFS, SMB and other filesystems that refuse
++    it, platforms without the call) a rename would leave the path empty beside a possibly live holder. We then do not
++    move the marker, and the caller waits for ``timeout`` or ``break_lock()``.
++
++    We compare inodes as well as modification times, because NFS and FAT store coarse modification times. The times are
++    compared for equality, since a file's owner can set any time. We ``lstat`` so a symlink a peer swaps in is never
++    followed. The break name carries a random token so no other process can guess it.
++
++    :param lock_file: path to the lock file to break.
++    :param mtime_before: modification time the caller saw when it judged the lock stale.
++    :param ino_before: inode number the caller saw when it judged the lock stale.
++
++    :raises OSError: if taking the marker fails, for example because the file vanished, another user owns it in a
++        sticky directory, or on Windows its holder keeps it open.
++
++    """
++    if (current := os.lstat(lock_file)).st_mtime != mtime_before or current.st_ino != ino_before:
++        return
++    break_path: Final[str] = f"{lock_file}.break.{os.getpid()}.{secrets.token_hex(16)}"
++    if exchange_supported():  # pragma: win32 no cover
++        _swap_out(lock_file, break_path, mtime_before, ino_before)
++    elif _MOVES_WITHOUT_EXCHANGE:  # pragma: win32 cover
++        _break_by_rename(lock_file, break_path, mtime_before, ino_before)
++
++
++def _swap_out(lock_file: str, break_path: str, mtime_before: float, ino_before: int) -> None:  # pragma: win32 no cover
++    # An atomic exchange with a placeholder takes the marker without the lock path ever being empty. No contender can
++    # then create a marker while this one is judged, and a live marker goes back the same way.
++    fd: Final = os.open(break_path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0), 0o600)
++    try:
++        try:
++            # Not a record any lock writes, so a contender that reads it waits, and one left by a crash ages out. The
++            # PID tells the contender that evicts it whose break names to search for a marker this process left.
++            write_all(fd, f"filelock/break\n{os.getpid()}\n".encode())
++            exchanged = exchange_names(break_path, lock_file)
++        except OSError:
++            exchanged = False
++        if not exchanged:
++            Path(break_path).unlink()
++            return
++        if (grabbed := os.lstat(break_path)).st_mtime == mtime_before and grabbed.st_ino == ino_before:
++            Path(break_path).unlink()
++            # Our descriptor keeps the placeholder's inode allocated, so a matching number at the path is still ours.
++            if os.path.samestat(os.lstat(lock_file), os.fstat(fd)):
++                Path(lock_file).unlink()
++        else:
++            exchange_names(break_path, lock_file)
++            Path(break_path).unlink()
++    finally:
++        os.close(fd)
++
++
++def _break_by_rename(
++    lock_file: str, break_path: str, mtime_before: float, ino_before: int
++) -> None:  # pragma: win32 cover
++    # Renaming the marker aside empties the path until a recreated live marker is put back. link never replaces a name,
++    # so a marker a third process created meanwhile keeps the path, and the live one waits under the break name.
++    # Without os.link, or where the filesystem refuses hard links, the live one waits there too.
++    Path(lock_file).rename(break_path)
++    if (st_after := os.lstat(break_path)).st_mtime == mtime_before and st_after.st_ino == ino_before:
++        Path(break_path).unlink()
++    elif stat.S_ISREG(st_after.st_mode) and hasattr(os, "link"):  # pragma: needs hard-link
++        with suppress(OSError):
++            os.link(break_path, lock_file, follow_symlinks=False)
++            Path(break_path).unlink()
++
++
++def exchange_supported() -> bool:
++    """Whether this platform has a call that swaps two names in one step; a filesystem may still refuse it."""
++    return _rename_call() is not None
++
++
++def exchange_names(source: str, target: str) -> bool:  # pragma: win32 no cover
++    """
++    Swap the names *source* and *target* in one step, so neither ever stands empty, where :func:`exchange_supported`.
++
++    :returns: ``False`` where the filesystem cannot, so the caller falls back
++
++    :raises OSError: for any other failure, such as a missing name or a denied rename
++
++    """
++    renamer, exchange_flag = cast("tuple[Callable[[bytes, bytes, int], int], int]", _rename_call())
++    if not (error := renamer(os.fsencode(source), os.fsencode(target), exchange_flag)):
++        return True
++    # EXDEV: overlayfs and some FUSE filesystems refuse an exchange between layers.
++    if error in {EINVAL, ENOSYS, EXDEV, getattr(errno, "ENOTSUP", EINVAL), getattr(errno, "EOPNOTSUPP", EINVAL)}:
++        return False
++    raise OSError(error, os.strerror(error), source, None, target)
++
++
++@cache
++def _rename_call() -> tuple[Callable[[bytes, bytes, int], int], int] | None:
++    # The call returns 0 or the errno. Looked up on first use, since most processes never break a lock and ctypes is
++    # slow to import. None where ctypes is missing (GraalPy) or the platform has no exchange.
++    try:
++        import ctypes  # ruff:ignore[import-outside-top-level]  # only a stale break needs it
++    except ImportError:  # pragma: no cover  # GraalPy ships without ctypes
++        return None
++    if sys.platform in {"linux", "android"}:  # pragma: linux cover
++        if (renameat2 := _renameat2(ctypes.CDLL(None, use_errno=True))) is None:
++            return None  # pragma: no cover  # an architecture the CI matrix does not run
++        return renameat2, 2  # RENAME_EXCHANGE in linux/fs.h
++    if sys.platform == "darwin":  # pragma: darwin cover
++        renamex_np: Final = ctypes.CDLL(None, use_errno=True).renamex_np
++        renamex_np.argtypes = [ctypes.c_char_p, ctypes.c_char_p, ctypes.c_uint]
++        renamex_np.restype = ctypes.c_int
++
++        def call_renamex_np(source: bytes, target: bytes, flags: int) -> int:
++            return 0 if renamex_np(source, target, flags) == 0 else ctypes.get_errno()
++
++        return call_renamex_np, 0x2  # RENAME_SWAP in sys/stdio.h
++    return None  # pragma: linux no cover  # pragma: android no cover  # pragma: darwin no cover
++
++
++def _renameat2(libc: ctypes.CDLL) -> Callable[[bytes, bytes, int], int] | None:  # pragma: linux cover
++    # Reached through syscall(2) rather than the C library's wrapper. glibc 2.28, musl 1.2.2 and bionic API 30 added
++    # the wrapper, and Termux ships an older bionic; the kernel has had the call since 3.15. The number is the
++    # architecture's own, so an architecture outside the table gets no exchange rather than another call.
++    import ctypes  # ruff:ignore[import-outside-top-level]  # only a stale break needs it
++
++    numbers: Final = {
++        "x86_64": 316,
++        "i386": 353,
++        "i686": 353,
++        "armv7l": 382,
++        "armv8l": 382,
++        "aarch64": 276,
++        "riscv64": 276,
++        "loongarch64": 276,
++        "ppc64le": 357,
++        "s390x": 347,
++    }
++    if (number := numbers.get(platform.machine())) is None:
++        return None  # pragma: no cover  # an architecture the CI matrix does not run
++    syscall: Final = libc.syscall
++    syscall.restype = ctypes.c_long
++    at_fdcwd: Final = -100
++
++    def call_renameat2(source: bytes, target: bytes, flags: int) -> int:
++        arguments: Final = (
++            ctypes.c_long(number),
++            ctypes.c_int(at_fdcwd),
++            ctypes.c_char_p(source),
++            ctypes.c_int(at_fdcwd),
++            ctypes.c_char_p(target),
++            ctypes.c_uint(flags),
++        )
++        return 0 if syscall(*arguments) == 0 else ctypes.get_errno()
++
++    return call_renameat2
++
++
++# Windows refuses to rename a marker its live holder keeps open, so renaming aside only moves a marker nobody holds.
++# Elsewhere without an exchange a contender could take the emptied path beside a live holder, so the marker stays and
++# the lock counts as held.
++_MOVES_WITHOUT_EXCHANGE: Final[bool] = sys.platform == "win32"
++
+ __all__ = [
++    "break_lock_file",
++    "exchange_names",
++    "exchange_supported",
++    "pin_inode",
++    "remove_own_file",
++    "write_all",
+     "ensure_directory_exists",
+     "raise_on_not_writable_file",
+ ]
+diff --git a/tests/test_lock_expiry.py b/tests/test_lock_expiry.py
+index c4481ca..14042a7 100644
+--- a/tests/test_lock_expiry.py
++++ b/tests/test_lock_expiry.py
+@@ -49,7 +49,8 @@ def test_expired_lock_race_rename_fails(tmp_path: Path, mocker: MockerFixture) -
+     lock_path.touch()
+     os.utime(lock_path, (0, 0))
+ 
+-    mocker.patch("filelock._api.pathlib.Path.rename", side_effect=FileNotFoundError)
++    mocker.patch("filelock._soft.exchange_supported", return_value=True)
++    mocker.patch("filelock._soft.exchange_names", side_effect=FileNotFoundError)
+ 
+     lock = SoftFileLock(lock_path, lifetime=0.1, timeout=0.5)
+     with pytest.raises(TimeoutError):
+diff --git a/tests/test_soft_security.py b/tests/test_soft_security.py
+new file mode 100644
+index 0000000..2a49e1f
+--- /dev/null
++++ b/tests/test_soft_security.py
+@@ -0,0 +1,129 @@
++from __future__ import annotations
++
++import os
++import socket
++import sys
++import time
++from pathlib import Path
++from typing import TYPE_CHECKING, Final
++
++import pytest
++
++from filelock import SoftFileLock, Timeout
++from filelock._util import exchange_names, exchange_supported
++
++if TYPE_CHECKING:
++    from collections.abc import Callable
++    from pytest_mock import MockerFixture
++
++pytestmark = pytest.mark.skipif(sys.platform == "win32" or not exchange_supported(), reason="needs atomic exchange")
++_DEAD_PID = 2**22 + 1
++_HOST = socket.gethostname()
++
++@pytest.fixture
++def lock_path(tmp_path: Path) -> Path:
++    return tmp_path / "test.lock"
++
++@pytest.fixture
++def lock_type() -> type[SoftFileLock]:
++    return SoftFileLock
++
++@pytest.fixture
++def record() -> str:
++    return _holder(_DEAD_PID)
++
++@pytest.fixture
++def on_break_recheck(mocker: MockerFixture) -> Callable[[Path, Callable[[], None]], None]:
++    """Schedule an action for right after the stale break re-reads the lock file and before it takes the marker."""
++
++    def schedule(lock: Path, action: Callable[[], None]) -> None:
++        alive: Final = SoftFileLock._is_process_alive
++        lstat: Final = os.lstat
++        state: list[str] = []
++
++        def judged(pid: int) -> bool:
++            # The owner check comes right before the break, whose first look at the path is the recheck.
++            state.append("judged")
++            return alive(pid)
++
++        def lstat_then_act(path: str | os.PathLike[str], *, dir_fd: int | None = None) -> os.stat_result:
++            found: Final = lstat(path, dir_fd=dir_fd)
++            if state == ["judged"] and os.fspath(path) == os.fspath(lock):
++                state.append("acted")
++                action()
++            return found
++
++        mocker.patch.object(SoftFileLock, "_is_process_alive", side_effect=judged)
++        mocker.patch.object(os, "lstat", new=lstat_then_act)
++
++    return schedule
++
++
++def _holder(pid: int, *, host: str = _HOST, start: int | None = None) -> str:
++    return "\n".join([str(pid), host, *([] if start is None else [str(start)])]) + "\n"
++
++
++def test_stale_break_racing_a_successor_admits_no_third_holder(
++    lock_path: Path, mocker: MockerFixture, on_break_recheck: Callable[[Path, Callable[[], None]], None]
++) -> None:
++    lock_path.write_text(_holder(_DEAD_PID), encoding="utf-8")
++    successor: Final[SoftFileLock] = SoftFileLock(lock_path, timeout=0)
++
++    def successor_breaks_and_acquires_first() -> None:
++        lock_path.unlink()
++        successor.acquire()
++
++    on_break_recheck(lock_path, successor_breaks_and_acquires_first)
++    _assert_times_out(lock_path)
++    mocker.stopall()
++
++    _assert_times_out(lock_path)
++    successor.release()
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_keeps_the_lock_when_a_peer_swaps_its_marker_aside(  # pragma: win32 no cover
++    lock_path: Path, mocker: MockerFixture
++) -> None:
++    lock_path.write_text(_holder(_DEAD_PID), encoding="utf-8")
++    (peer := lock_path.with_name("peer")).write_text(_holder(os.getpid()), encoding="utf-8")
++    unlink: Final = Path.unlink
++
++    def peer_exchanges_then_unlink(path: Path, *, missing_ok: bool = False) -> None:
++        exchange_names(str(lock_path), str(peer))
++        unlink(path, missing_ok=missing_ok)
++
++    mocker.patch.object(Path, "unlink", new=peer_exchanges_then_unlink)
++    lock: Final = SoftFileLock(lock_path)
++    lock.acquire(blocking=False)
++    mocker.stopall()
++    exchange_names(str(lock_path), str(peer))
++
++    assert (lock.is_locked, lock_path.read_text(encoding="utf-8")) == (True, _holder(os.getpid()))
++    lock.release()
++    assert list(lock_path.parent.glob("test.lock*")) == []
++
++
++def _break_name(lock: Path, pid: int = _DEAD_PID) -> Path:  # pragma: win32 no cover
++    return lock.with_name(f"test.lock.break.{pid}.{'0' * 32}")
++
++
++def _live(record: str) -> str:  # pragma: win32 no cover
++    return record.replace(str(_DEAD_PID), str(os.getpid()))
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_restores_a_live_marker_a_dead_breaker_left_under_its_break_name(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    _break_name(lock).write_text(_live(record), encoding="utf-8")
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert (lock.read_text(encoding="utf-8"), list(tmp_path.glob("test.lock.break.*"))) == (_live(record), [])
++
++
++def _assert_times_out(lock_path: Path, *, timeout: float = 0.1) -> None:
++    with pytest.raises(TimeoutError):
++        SoftFileLock(lock_path, timeout=timeout).acquire()
+diff --git a/tests/test_soft_stale.py b/tests/test_soft_stale.py
+index ab1ef4f..fcd76e4 100644
+--- a/tests/test_soft_stale.py
++++ b/tests/test_soft_stale.py
+@@ -100,7 +100,7 @@ def test_stale_lock_rename_race(tmp_path: Path, mocker: MockerFixture) -> None:
+     lock_path.write_text(f"{dead_pid}\n{socket.gethostname()}\n", encoding="utf-8")
+ 
+     mocker.patch("filelock._soft.os.kill", side_effect=OSError(ESRCH, "No such process"))
+-    mocker.patch.object(Path, "rename", side_effect=FileNotFoundError("already gone"))
++    mocker.patch("filelock._soft.exchange_names", side_effect=FileNotFoundError("already gone"))
+ 
+     lock = SoftFileLock(lock_path, timeout=0.1)
+     with pytest.raises(TimeoutError):
+@@ -124,7 +124,7 @@ def test_stale_detection_errors_suppressed(tmp_path: Path, mocker: MockerFixture
+     lock_path = tmp_path / "test.lock"
+     lock_path.write_text(f"{os.getpid()}\n{socket.gethostname()}\n", encoding="utf-8")
+ 
+-    mock_read: MagicMock = mocker.patch.object(Path, "read_text", side_effect=OSError("read failed"))
++    mock_read: MagicMock = mocker.patch("filelock._soft._read_lock_file", side_effect=OSError("read failed"))
+ 
+     lock = SoftFileLock(lock_path, timeout=0.1)
+     with pytest.raises(TimeoutError):
+@@ -132,11 +132,12 @@ def test_stale_detection_errors_suppressed(tmp_path: Path, mocker: MockerFixture
+     mock_read.assert_called()
+ 
+ 
+-def test_write_lock_info_errors_suppressed(tmp_path: Path, mocker: MockerFixture) -> None:
++def test_write_lock_info_errors_roll_back(tmp_path: Path, mocker: MockerFixture) -> None:
+     lock_path = tmp_path / "test.lock"
+     mocker.patch("filelock._soft.os.write", side_effect=OSError("write failed"))
+ 
+     lock = SoftFileLock(lock_path)
+-    with lock:
+-        assert lock.is_locked
+-        assert not lock_path.read_text(encoding="utf-8")
++    with pytest.raises(OSError, match="write failed"):
++        lock.acquire()
++    assert not lock.is_locked
++    assert not lock_path.exists()
diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p2.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p2.patch
new file mode 100644
index 0000000000..6b9c14ebdc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p2.patch
@@ -0,0 +1,90 @@
+From 5bfde2890ff907a5318c1b7f815fcd52a887f127 Mon Sep 17 00:00:00 2001
+From: Javid Khan <dxbjavid@gmail.com>
+Date: Wed, 28 Oct 2026 11:55:11 +0530
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(soft):=20ignore=20a=20restor?=
+ =?UTF-8?q?e=20claim=20with=20an=20invalid=20pid=20(#871)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112935
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/5bfde2890ff907a5318c1b7f815fcd52a887f127]
+
+Backport Changes:
+- Apply recovery-claim PID validation to the older SoftFileLock and
+  its existing PID liveness probe.
+- Restrict the upstream regression to SoftFileLock and the existing
+  two-line owner record.
+- Omit the standalone changelog fragment, which is absent from the
+  3.25.2 source archive.
+
+Co-authored-by: Bernát Gábor <gaborjbernat@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_soft.py       | 10 ++++++----
+ tests/test_soft_security.py | 27 +++++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 4 deletions(-)
+
+diff --git a/src/filelock/_soft.py b/src/filelock/_soft.py
+index 852ac71..1681b79 100644
+--- a/src/filelock/_soft.py
++++ b/src/filelock/_soft.py
+@@ -151,7 +151,8 @@ class SoftFileLock(BaseFileLock):
+     def _stranded_candidates(self, breaker_pid: int) -> list[tuple[str, bool]] | None:  # pragma: win32 no cover
+         directory, name = os.path.split(self.lock_file)
+         stranded: Final = re.compile(rf"{re.escape(name)}\.break\.{breaker_pid}\.[0-9a-f]{{32}}")
+-        claimed: Final = re.compile(rf"{re.escape(name)}\.restore\.(\d+)\.[0-9a-f]{{32}}")
++        # [0-9], not \d: a str pattern's \d takes any Unicode digit, and int() reads fullwidth ones as another number.
++        claimed: Final = re.compile(rf"{re.escape(name)}\.restore\.([0-9]+)\.[0-9a-f]{{32}}")
+         candidates: list[tuple[str, bool]] = []
+         with os.scandir(directory or os.curdir) as entries:
+             for entry in entries:
+@@ -160,9 +161,10 @@ class SoftFileLock(BaseFileLock):
+                 path = str(Path(directory) / entry.name)
+                 if stranded.fullmatch(entry.name):
+                     candidates.append((path, False))
+-                elif found := claimed.fullmatch(entry.name):
+-                    ours = int(found[1]) == os.getpid()
+-                    if not (ours or not self._is_process_alive(int(found[1]))):
++                elif (found := claimed.fullmatch(entry.name)) and 1 <= (recoverer := int(found[1])) <= 2**31 - 1:
++                    # No filelock writes a claim outside the pid range; os.kill would raise OverflowError on one.
++                    ours = recoverer == os.getpid()
++                    if not (ours or not self._is_process_alive(recoverer)):
+                         return None
+                     candidates.append((path, ours))
+         return sorted(candidates)
+diff --git a/tests/test_soft_security.py b/tests/test_soft_security.py
+index 2a49e1f..3da9bd1 100644
+--- a/tests/test_soft_security.py
++++ b/tests/test_soft_security.py
+@@ -127,3 +127,30 @@ def test_stale_break_restores_a_live_marker_a_dead_breaker_left_under_its_break_
+ def _assert_times_out(lock_path: Path, *, timeout: float = 0.1) -> None:
+     with pytest.raises(TimeoutError):
+         SoftFileLock(lock_path, timeout=timeout).acquire()
++
++
++def _restore_name(lock: Path, pid: int | str) -> Path:  # pragma: win32 no cover
++    return lock.with_name(f"test.lock.restore.{pid}.{'0' * 32}")
++
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++@pytest.mark.parametrize(
++    "recoverer",
++    [
++        pytest.param(str(2**64), id="oversized"),
++        pytest.param("0", id="zero"),
++        # This process's pid in fullwidth digits, which int() reads back as the same number.
++        pytest.param("".join(chr(0xFF10 + int(digit)) for digit in str(os.getpid())), id="wide"),
++    ],
++)
++def test_stale_break_ignores_a_claim_naming_no_valid_pid(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str, recoverer: str
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    foreign: Final = record.replace(_HOST, "elsewhere")
++    (planted := _restore_name(lock, recoverer)).write_text(foreign, encoding="utf-8")
++    with lock_type(lock) as held:
++        assert held.is_locked
++
++    assert planted.read_text(encoding="utf-8") == foreign
diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p3.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p3.patch
new file mode 100644
index 0000000000..ec5cf824a3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p3.patch
@@ -0,0 +1,425 @@
+From 77eb01a21ce842659e7beb9fd50a3dc935647416 Mon Sep 17 00:00:00 2001
+From: Javid Khan <dxbjavid@gmail.com>
+Date: Sat, 31 Oct 2026 20:38:25 +0530
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(soft):=20restore=20raced=20s?=
+ =?UTF-8?q?tale=20markers=20(#899)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112935
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/77eb01a21ce842659e7beb9fd50a3dc935647416]
+
+Backport Changes:
+- Adapt corrected exchanges and cleanup to the older descriptor
+  context; retain nested-breaker and refused-restore regressions.
+- Add the fixed ctime-sensitive observation only for private exchange
+  placeholders so interrupted helpers can restore stranded holders.
+- Preserve older behavior for empty and malformed user markers; omit
+  the newer general malformed-marker and lease APIs.
+- Guard the older acquire loop when lifetime takeover already owns
+  the descriptor; add a regression for explicit read-only modes.
+- Adapt upstream fixtures and imports for the older test harness.
+- Omit the standalone changelog and concepts documentation, which
+  are absent from the 3.25.2 source archive.
+
+Co-authored-by: Bernát Gábor <gaborjbernat@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_soft.py       |  57 ++++++++++++++-
+ src/filelock/_util.py       |  36 ++++++++-
+ tests/test_soft_security.py | 175 +++++++++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 264 insertions(+), 4 deletions(-)
+
+diff --git a/src/filelock/_soft.py b/src/filelock/_soft.py
+index 1681b79..dd076af 100644
+--- a/src/filelock/_soft.py
++++ b/src/filelock/_soft.py
+@@ -17,6 +17,7 @@ from ._api import BaseFileLock
+ from ._util import (
+     break_lock_file,
+     ensure_directory_exists,
++    exchange_back,
+     exchange_names,
+     exchange_supported,
+     pin_inode,
+@@ -27,6 +28,7 @@ from ._util import (
+ 
+ _WIN_SYNCHRONIZE = 0x100000
+ _WIN_ERROR_INVALID_PARAMETER = 87
++MALFORMED_LOCK_AGE_THRESHOLD: Final[float] = 2.0
+ _MAX_LOCK_FILE_SIZE: Final[int] = 1024
+ #: Contenders act on the record in the marker, so no other account may write it, whatever the mode or umask.
+ _OTHERS_WRITE: Final[int] = stat.S_IWGRP | stat.S_IWOTH
+@@ -46,7 +48,12 @@ class SoftFileLock(BaseFileLock):
+ 
+     """
+ 
++    _marker_seen: tuple[tuple[float, int, int], float] | None = None
++
+     def _acquire(self) -> None:
++        # The 3.25 acquire loop calls us even after the expiry hook claimed the marker.
++        if self.is_locked:
++            return
+         raise_on_not_writable_file(self.lock_file)
+         ensure_directory_exists(self.lock_file)
+         flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_TRUNC
+@@ -81,6 +88,11 @@ class SoftFileLock(BaseFileLock):
+             if content == _RELEASED_RECORD:
+                 self._take_over(marker, None)
+                 return
++            if (breaker := _placeholder_breaker(content)) is not None:
++                # Only our private exchange placeholder is aged out; malformed legacy markers stay held.
++                if self._marker_unchanged_for(marker) >= MALFORMED_LOCK_AGE_THRESHOLD:
++                    self._take_over(marker, breaker)
++                return
+             holder = _parse_lock_holder(content)
+             if holder is None:
+                 # 3.25 does not age out malformed or half-written markers.
+@@ -89,6 +101,19 @@ class SoftFileLock(BaseFileLock):
+             if hostname == socket.gethostname() and not self._is_process_alive(pid):
+                 self._take_over(marker, pid)
+ 
++    def _marker_unchanged_for(self, marker: os.stat_result) -> float:
++        # The mtime is the writer's or file server's clock, so against time.time() a contender whose clock runs ahead
++        # would expire a fresh marker. Only watch it for change, timed on this process's monotonic clock. The owner of a
++        # file sets its mtime, and ext4 reuses a freed inode number, so a new marker can repeat both. The change time
++        # cannot be set and moves with every create, which keeps a new marker from inheriting an old one's age.
++        now: Final = time.monotonic()
++        key: Final = marker.st_mtime, marker.st_ino, marker.st_ctime_ns
++        if (seen := self._marker_seen) is None or seen[0] != key:
++            self._marker_seen = key, now
++            return 0.0
++        return now - seen[1]
++
++
+     def _try_break_expired_lock(self) -> None:
+         if (lifetime := self._context.lifetime) is None:
+             return
+@@ -122,6 +147,10 @@ class SoftFileLock(BaseFileLock):
+         exchanged = held = False
+         try:
+             self._write_lock_info(fd)
++            # The scan and the write take long enough for a peer to have taken the marker since the check above, and an
++            # exchange now would move that peer's live marker aside.
++            if (current := os.lstat(self.lock_file)).st_mtime != marker.st_mtime or current.st_ino != marker.st_ino:
++                return
+             if not exchange_names(aside, self.lock_file):
+                 return  # NFS, SMB and the like refuse it; renaming the marker aside would empty the path
+             exchanged = True
+@@ -222,14 +251,17 @@ class SoftFileLock(BaseFileLock):
+ 
+     def _abandon_take_over(self, fd: int, aside: str, *, put_back: bool) -> None:  # pragma: win32 no cover
+         self._context.lock_file_fd = None
++        put_back_done = not put_back
+         try:
+             if put_back:
+-                exchange_names(aside, self.lock_file)
++                put_back_done = exchange_back(self.lock_file, aside, fd)
+         finally:
+             try:
+                 # Whichever name still holds our marker loses it: the descriptor keeps its inode number ours.
+                 own: Final = os.fstat(fd)
+                 for name in (self.lock_file, aside):
++                    if name == self.lock_file and not put_back_done:
++                        continue
+                     with suppress(FileNotFoundError):
+                         if os.path.samestat(os.lstat(name), own):
+                             Path(name).unlink()
+@@ -399,4 +431,27 @@ def _parse_lock_holder(content: str | None) -> tuple[int, str] | None:
+     return (pid, hostname) if 1 <= pid <= 2**31 - 1 else None
+ 
+ 
++def _placeholder_breaker(content: str | None) -> int | None:  # pragma: win32 no cover
++    # The placeholder a break leaves at the path while it works names the breaker that may have died there.
++    if content is None or not content.startswith(placeholder := "filelock/break\n") or not content.endswith("\n"):
++        return None
++    with suppress(ValueError):
++        return parse_decimal(content.removeprefix(placeholder)[:-1])
++    return None
++
++
++def parse_decimal(text: str) -> int:
++    """
++    Read a PID or start token as a writer formats it: ASCII digits only.
++
++    :raises ValueError: for anything else ``int()`` would accept, such as ``1_000``, surrounding whitespace, a sign or
++        non-ASCII digits; no filelock writes those
++
++    """
++    if not (text.isascii() and text.isdigit()):
++        msg = f"not a decimal integer: {text!r}"
++        raise ValueError(msg)
++    return int(text)
++
++
+ __all__ = ["SoftFileLock"]
+diff --git a/src/filelock/_util.py b/src/filelock/_util.py
+index 98d4f6f..55990c3 100644
+--- a/src/filelock/_util.py
++++ b/src/filelock/_util.py
+@@ -6,6 +6,7 @@ import platform
+ import secrets
+ import stat
+ import sys
++import time
+ from contextlib import contextmanager, suppress
+ from errno import EACCES, EINVAL, EIO, EISDIR, ENOSYS, EXDEV
+ from functools import cache
+@@ -195,8 +196,7 @@ def _swap_out(lock_file: str, break_path: str, mtime_before: float, ino_before:
+             if os.path.samestat(os.lstat(lock_file), os.fstat(fd)):
+                 Path(lock_file).unlink()
+         else:
+-            exchange_names(break_path, lock_file)
+-            Path(break_path).unlink()
++            exchange_back(lock_file, break_path, fd)
+     finally:
+         os.close(fd)
+ 
+@@ -306,8 +306,40 @@ def _renameat2(libc: ctypes.CDLL) -> Callable[[bytes, bytes, int], int] | None:
+ # the lock counts as held.
+ _MOVES_WITHOUT_EXCHANGE: Final[bool] = sys.platform == "win32"
+ 
++def exchange_back(lock_file: str, aside: str, fd: int) -> bool:  # pragma: win32 no cover
++    # Raced breakers nest: each aside holds the prior marker. Returning out of order can strand a live holder's marker.
++    # A peer may move the path between our check and exchange, so stalled breakers exchange to open any resulting ring.
++    try:
++        settled = _exchange_until_aside(lock_file, aside, os.fstat(fd))
++    except FileNotFoundError:
++        settled = True
++    if settled:
++        Path(aside).unlink(missing_ok=True)
++    return settled
++
++
++def _exchange_until_aside(lock_file: str, aside: str, own: os.stat_result) -> bool:  # pragma: win32 no cover
++    # Peers need a few system calls to unwind; a paused or dead peer must not block the caller indefinitely.
++    deadline: Final = time.monotonic() + 2.0
++    stall: Final = 0.01
++    feed_at = time.monotonic() + stall
++    while not os.path.samestat(os.lstat(aside), own):
++        now = time.monotonic()
++        ours = os.path.samestat(os.lstat(lock_file), own)
++        if not ours and now >= deadline:
++            return False
++        if ours or now >= feed_at:
++            if not exchange_names(aside, lock_file):
++                return False
++            feed_at = now + stall
++        else:
++            time.sleep(0.0005)
++    return True
++
++
+ __all__ = [
+     "break_lock_file",
++    "exchange_back",
+     "exchange_names",
+     "exchange_supported",
+     "pin_inode",
+diff --git a/tests/test_soft_security.py b/tests/test_soft_security.py
+index 3da9bd1..0923b23 100644
+--- a/tests/test_soft_security.py
++++ b/tests/test_soft_security.py
+@@ -1,15 +1,20 @@
+ from __future__ import annotations
+ 
++import itertools
+ import os
+ import socket
+ import sys
+ import time
++from contextlib import suppress
+ from pathlib import Path
+ from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
++import filelock
++
+ from filelock import SoftFileLock, Timeout
++from filelock._soft import MALFORMED_LOCK_AGE_THRESHOLD
+ from filelock._util import exchange_names, exchange_supported
+ 
+ if TYPE_CHECKING:
+@@ -133,7 +138,6 @@ def _restore_name(lock: Path, pid: int | str) -> Path:  # pragma: win32 no cover
+     return lock.with_name(f"test.lock.restore.{pid}.{'0' * 32}")
+ 
+ 
+-
+ @pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
+ @pytest.mark.parametrize(
+     "recoverer",
+@@ -154,3 +158,172 @@ def test_stale_break_ignores_a_claim_naming_no_valid_pid(  # pragma: win32 no co
+         assert held.is_locked
+ 
+     assert planted.read_text(encoding="utf-8") == foreign
++
++
++def _break_contents(lock: Path) -> list[str]:  # pragma: win32 no cover
++    return [path.read_text(encoding="utf-8") for path in lock.parent.glob(f"{lock.name}.break.*")]
++
++
++def _lose_to_a_live_holder(  # pragma: win32 no cover
++    lock: Path, live: str, mocker: MockerFixture, then: Callable[[str, str], bool | None]
++) -> None:
++    (holder := lock.with_name("holder")).write_text(live, encoding="utf-8")
++
++    def exchange_after_the_holder_won(aside: str, path: str) -> bool:
++        mocker.patch("filelock._soft.exchange_names", new=exchange_names)
++        holder.replace(lock)
++        exchange_names(aside, path)
++        then(aside, path)
++        return True
++
++    mocker.patch("filelock._soft.exchange_names", new=exchange_after_the_holder_won)
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_exchanges_back_after_the_breaker_that_took_its_marker(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str, mocker: MockerFixture
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    (peer := tmp_path / "peer").write_text(record.replace(_HOST, "elsewhere"), encoding="utf-8")
++
++    def peer_exchanges_back(_seconds: float) -> None:
++        exchange_names(str(peer), str(lock))
++        peer.unlink()
++
++    _lose_to_a_live_holder(lock, _live(record), mocker, lambda _aside, path: exchange_names(str(peer), path))
++    mocker.patch("filelock._util.time", wraps=time, sleep=mocker.Mock(side_effect=peer_exchanges_back))
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert (lock.read_text(encoding="utf-8"), sorted(tmp_path.iterdir())) == (_live(record), [lock])
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_opens_a_ring_of_breakers_holding_each_others_markers(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str, mocker: MockerFixture
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    foreign: Final = record.replace(_HOST, "elsewhere")
++    (peer := tmp_path / "peer").write_text(foreign, encoding="utf-8")
++
++    def peer_then_our_exchange_out_of_turn(aside: str, path: str) -> None:
++        exchange_names(str(peer), path)
++        exchange_names(aside, path)
++
++    def peer_exchanges_back_once_it_stands_at_the_path(_seconds: float) -> None:
++        if lock.read_text(encoding="utf-8") == foreign:
++            exchange_names(str(peer), str(lock))
++            peer.unlink()
++
++    _lose_to_a_live_holder(lock, _live(record), mocker, peer_then_our_exchange_out_of_turn)
++    mocker.patch(
++        "filelock._util.time", wraps=time, sleep=mocker.Mock(side_effect=peer_exchanges_back_once_it_stands_at_the_path)
++    )
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert (lock.read_text(encoding="utf-8"), sorted(tmp_path.iterdir())) == (_live(record), [lock])
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_keeps_every_name_when_the_path_never_comes_back(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str, mocker: MockerFixture
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    foreign: Final = record.replace(_HOST, "elsewhere")
++    (peer := tmp_path / "peer").write_text(foreign, encoding="utf-8")
++    _lose_to_a_live_holder(lock, _live(record), mocker, lambda _aside, path: exchange_names(str(peer), path))
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert sorted([lock.read_text(encoding="utf-8"), *_break_contents(lock)]) == sorted([foreign, _live(record)])
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_keeps_its_marker_when_exchange_back_is_refused(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str, mocker: MockerFixture
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    _lose_to_a_live_holder(lock, _live(record), mocker, lambda _aside, _path: None)
++    mocker.patch("filelock._util.exchange_names", side_effect=[False, AssertionError("retried refused exchange")])
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert (f"{os.getpid()}\n" in lock.read_text(encoding="utf-8"), _break_contents(lock)) == (
++        True,
++        [_live(record)],
++    )
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_drops_what_it_took_when_the_holder_released_the_path(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str, mocker: MockerFixture
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    _lose_to_a_live_holder(lock, _live(record), mocker, lambda _aside, path: Path(path).unlink())
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert list(tmp_path.iterdir()) == []
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++def test_stale_break_leaves_a_marker_taken_since_its_first_look_on_the_path(  # pragma: win32 no cover
++    tmp_path: Path,
++    lock_type: type[SoftFileLock],
++    record: str,
++    mocker: MockerFixture,
++    on_break_recheck: Callable[[Path, Callable[[], None]], None],
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(record, encoding="utf-8")
++    (holder := tmp_path / "holder").write_text(_live(record), encoding="utf-8")
++    exchange: Final = mocker.spy(filelock._soft, "exchange_names")
++
++    def peer_takes_the_marker() -> None:
++        holder.replace(lock)
++
++    on_break_recheck(lock, peer_takes_the_marker)
++    with pytest.raises(Timeout):
++        lock_type(lock).acquire(blocking=False)
++
++    assert (exchange.call_count, lock.read_text(encoding="utf-8"), sorted(tmp_path.iterdir())) == (
++        0,
++        _live(record),
++        [lock],
++    )
++
++
++@pytest.fixture
++def unchanged_past_grace(mocker: MockerFixture) -> None:
++    # Each look at the marker lands a full grace window after the previous one on the observer's clock, so an unchanged
++    # malformed marker ages out on the second look without the test sleeping through the window.
++    mocker.patch("filelock._soft.time.monotonic", side_effect=itertools.count(step=MALFORMED_LOCK_AGE_THRESHOLD))
++
++
++@pytest.mark.skipif(sys.platform == "win32", reason="Windows cannot exchange two names")
++@pytest.mark.usefixtures("unchanged_past_grace")
++def test_stale_break_restores_a_marker_a_dead_breaker_left_beside_its_placeholder(  # pragma: win32 no cover
++    tmp_path: Path, lock_type: type[SoftFileLock], record: str
++) -> None:
++    (lock := tmp_path / "test.lock").write_text(f"filelock/break\n{_DEAD_PID}\n", encoding="utf-8")
++    _break_name(lock).write_text(_live(record), encoding="utf-8")
++    contender: Final = lock_type(lock)
++    for _ in range(2):
++        with suppress(Timeout):
++            contender.acquire(blocking=False)
++
++    assert (contender.is_locked, lock.read_text(encoding="utf-8"), list(tmp_path.glob("test.lock.break.*"))) == (
++        False,
++        _live(record),
++        [],
++    )
++
++
++def test_expired_takeover_with_read_only_explicit_mode(tmp_path: Path) -> None:
++    lock_path = tmp_path / "test.lock"
++    lock_path.write_text(_holder(_DEAD_PID), encoding="utf-8")
++    os.utime(lock_path, (0, 0))
++    lock = SoftFileLock(lock_path, mode=0o400, lifetime=1, timeout=0)
++    with lock:
++        assert lock.is_locked
++        assert lock_path.stat().st_mode & 0o777 == 0o400
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 03c23092b9..352ab29a29 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -9,6 +9,9 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += " file://run-ptest \
     file://CVE-2026-112939.patch \
+    file://CVE-2026-112935_p1.patch \
+    file://CVE-2026-112935_p2.patch \
+    file://CVE-2026-112935_p3.patch \
 "
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
@@ -21,6 +24,7 @@ DEPENDS += "\
 "
 
 RDEPENDS:${PN} += " \
+    python3-ctypes \
     python3-core \
     python3-logging \
     python3-asyncio \
-- 
2.35.6
