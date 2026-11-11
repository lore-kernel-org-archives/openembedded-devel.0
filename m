Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3364.1794374983916368146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gn3XZNYE;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16510; q=dns/txt;
  s=iport01; t=1794374984; x=1795584584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3y6s7aHkBRDyFfoLwWAj6cL58Oyr25p+gtwDfmobaZU=;
  b=Gn3XZNYEou2kZmw7zc8gUCVDWKroB9egrxGvJW8+AZTwykWyOE77bDhT
   Fud2VN5c8SmNQq8a/hM8bSbi7Q+c2pTeU8kOz3kUIvlypcH0rAlRdF1Wd
   ZCeaFvDX38dRzWYKuY6JZGamtK6E7uzgLIbS4OoWH8NNILPBWCG75WQnv
   mLFAH9l9QuiEB8JiP6PdYXZ6z1M2nSlYks6plV6CSRhhDNKS2/YmkT1Qg
   xZHzP5dkCZtv3FSAEES77qj2IE1S39optqZerX5+e2tb5dWgWxEO5erXd
   Qx0iMpSd4MMOc05ko3TxY1/OCuf+6Mf+g1CWb2gs8EyVgvPOKAyZ61Nkf
   Q==;
X-CSE-ConnectionGUID: Q+E3KhbBQLSXgLSyWifcEA==
X-CSE-MsgGUID: Wb0HGT6QTTKuBuRVdZu6Qg==
X-IPAS-Result: =?us-ascii?q?A0BBAwDN/PNq/43/Ja1RAQiCWYJXdWBDSQOWSAOBE4pSl?=
 =?us-ascii?q?DsPAQEBD0QNBAEBhD9GAo4eAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLyALHQEFCBkZgmkBgjoDN?=
 =?us-ascii?q?wMRuV6BeTOBAYMpAYFU2EwNgloBCxQBgTiFQoMAhSRdGAFEhDknGxuBcoEVg?=
 =?us-ascii?q?nN2gQWBGkICAYEzBYZLIgSCDRV6EoFaHmQJghmJdgKBT4clSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgRyBHoESgQddgSsoXQEhgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0O?=
 =?us-ascii?q?RAwHiQvBRomPhsKfhgNSBEsNxUZBD5uB5JugxUBgQ0BJQEDAlAEPTwwCyQPP?=
 =?us-ascii?q?5ALglUHkCCCIYE1nmtxCiiDeIwkjz6FfBozhASBV5JDklQLmH2OCoQKkV8bT?=
 =?us-ascii?q?YRqgX4mRoETcBU7gmcJShkPWI1hg2uDPoESQ8lIJjICCQMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JACLYFPAQE?=
IronPort-Data: A9a23:7fLvWK/+ItGJCTtbYnyuDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mofXGGEOfbYMWGkc4pxPYW/o09Q7MKGx4AxHQdupXtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtaztNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kPfqBD2eZ9K1hqz
 swXDAscURGNjM+flefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYaLJ4bbHZ8F9qqej
 l3Mp0TWPk8jCOC81BCYyEygtPKRpCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:8XHGbqlusdCVLQUFzfL87BAct+7pDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:skPUq2HX022zFff6qmJet2NPOcAvWET590ffB3SpNmdnQ5C8HAo=
X-Talos-MUID: 9a23:/Ss7/gSFFBCGncTbRXTTjmlCG/s22piSK10njK84t/uZaxV/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546529028"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 108B8180015C0;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id AF188CBF204; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 4/9] python3-filelock: fix CVE-2026-112936
Date: Tue, 10 Nov 2026 21:29:33 -0800
Message-Id: <20261111052938.3691463-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132115
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the POSIX ReadWriteLock symlink checks [1] referenced by
advisory [2]. Resolve only the parent directory and reject final
symlinks or non-regular database paths before opening SQLite.

Adapt descriptor lifetime handling from [3] for 3.25.2's persistent
connections so closing a probe cannot drop a peer's POSIX lock. Keep
the existing public interfaces and add SQLite to the ptest dependencies
to exercise the read-write security regressions.

[1] https://github.com/tox-dev/filelock/commit/4d45e83caf7e31f9a12fb44526bdc07f70114f04
[2] https://github.com/tox-dev/filelock/security/advisories/GHSA-j8f7-rjxc-mr56
[3] https://github.com/tox-dev/filelock/commit/5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-112936.patch    | 382 ++++++++++++++++++
 .../python/python3-filelock_3.25.2.bb         |   2 +
 2 files changed, 384 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112936.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112936.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112936.patch
new file mode 100644
index 0000000000..e4bbc9bd41
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112936.patch
@@ -0,0 +1,382 @@
+From 4d45e83caf7e31f9a12fb44526bdc07f70114f04 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Thu, 1 Oct 2026 13:07:38 -0700
+Subject: [PATCH] Merge commit from fork
+
+ReadWriteLock resolved its path with Path.resolve() and handed it to
+sqlite3.connect(), so a symlink planted in a shared lock directory made
+the victim open, lock, or create the link's target, and repointing the
+link between two constructions let two writers hold the lock at once.
+
+Resolve only the parent directory and open the database through a
+descriptor that refuses a symlink: O_NOFOLLOW and a regular-file check
+on POSIX, with SQLite connecting via /proc/self/fd or /dev/fd, and on
+Windows a handle that refuses reparse points and denies delete sharing.
+Holding that descriptor for the connection's life keeps the name pinned
+to the file that was checked.
+
+GHSA-j8f7-rjxc-mr56
+
+CVE: CVE-2026-112936
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/4d45e83caf7e31f9a12fb44526bdc07f70114f04]
+
+Backport Changes:
+- Adapt parent-only canonicalization and descriptor opening to the
+  3.25.2 constructor without changing public method signatures.
+- Keep compatibility helpers in the new private _rw_security.py.
+- Adapt the later upstream inode-probe pool as a prerequisite for
+  the following shared-path fix and long-lived peer connections.
+- Validate each opened database once and retain its inode identity.
+- Close descriptors after failed fstat; defer unknown-inode closes
+  until all tracked connections close to preserve POSIX locks.
+- Add failed-fstat, non-regular path, symlink and peer-lock cases
+  to a dedicated test_read_write_security.py regression file.
+- Preserve optional SQLite imports in the regression module.
+- Preserve existing Windows opening behavior; omit new handle APIs
+  and newer fork tests because this recipe targets POSIX systems.
+- Omit standalone changelog fragments and newer documentation
+  context not present in the 3.25.2 release source.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_read_write.py       |   6 +-
+ src/filelock/_rw_security.py      | 171 ++++++++++++++++++++++++++++++
+ tests/test_read_write_security.py | 120 +++++++++++++++++++++
+ 3 files changed, 295 insertions(+), 2 deletions(-)
+ create mode 100644 src/filelock/_rw_security.py
+ create mode 100644 tests/test_read_write_security.py
+
+diff --git a/src/filelock/_read_write.py b/src/filelock/_read_write.py
+index 9e26cbf..e8b6420 100644
+--- a/src/filelock/_read_write.py
++++ b/src/filelock/_read_write.py
+@@ -13,6 +13,7 @@ from weakref import WeakValueDictionary
+ 
+ from ._api import AcquireReturnProxy
+ from ._error import Timeout
++from ._rw_security import canonical, connect
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Generator
+@@ -79,7 +80,7 @@ class _ReadWriteLockMeta(type):
+         if not is_singleton:
+             return super().__call__(lock_file, timeout, blocking=blocking, is_singleton=is_singleton)
+ 
+-        normalized = pathlib.Path(lock_file).resolve()
++        normalized = canonical(lock_file)
+         with cls._instances_lock:
+             if normalized not in cls._instances:
+                 instance = super().__call__(lock_file, timeout, blocking=blocking, is_singleton=is_singleton)
+@@ -154,7 +155,8 @@ class ReadWriteLock(metaclass=_ReadWriteLockMeta):
+         self._lock_level = 0
+         self._current_mode: Literal["read", "write"] | None = None
+         self._write_thread_id: int | None = None
+-        self._con = sqlite3.connect(self.lock_file, check_same_thread=False)
++        self._canonical_path = canonical(lock_file)
++        self._con = connect(os.fspath(self._canonical_path))
+         with _all_connections_lock:
+             _all_connections.add(self._con)
+ 
+diff --git a/src/filelock/_rw_security.py b/src/filelock/_rw_security.py
+new file mode 100644
+index 0000000..6916212
+--- /dev/null
++++ b/src/filelock/_rw_security.py
+@@ -0,0 +1,171 @@
++from __future__ import annotations
++
++import os
++import pathlib
++import sqlite3
++import stat
++import sys
++import threading
++from collections import deque
++from contextlib import suppress
++from dataclasses import dataclass, field
++from itertools import count
++from typing import NamedTuple
++
++_DatabaseIdentity = tuple[int, int]
++_DB_OPEN_FLAGS = os.O_RDWR | os.O_CREAT | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_NONBLOCK", 0)
++_FD_DIR = "/proc/self/fd" if sys.platform == "linux" else "/dev/fd"
++
++
++def canonical(database: str | os.PathLike[str]) -> pathlib.Path:
++    # Resolve only the parent, so a symlink at the lock path stays its own key instead of aliasing its target.
++    path = pathlib.Path(database)
++    return path.parent.resolve() / path.name
++
++
++class _Probe(NamedTuple):
++    identity: _DatabaseIdentity
++    fd: int
++    # One per connection, so a release applied again after an interrupt kept it queued counts once.
++    lease: int
++
++
++@dataclass
++class _InodeProbes:
++    leases: set[int] = field(default_factory=set)
++    descriptors: list[int] = field(default_factory=list)
++    idle: list[int] = field(default_factory=list)
++
++
++# POSIX locks belong to the process and the inode, so closing any descriptor on the inode drops the locks every other
++# connection of this process holds there. SQLite defers its own closes for this reason (section 2.2 of
++# https://www.sqlite.org/howtocorrupt.html); the probes stay open until the last connection on their inode closes.
++class _ProbeDescriptors:
++    def __init__(self) -> None:
++        self._lock = threading.Lock()
++        self._inodes: dict[_DatabaseIdentity, _InodeProbes] = {}
++        self._unclaimed: list[int] = []
++        self._releases: deque[_Probe] = deque()
++        self._leases = count()
++
++    def adopt(self, database: str, claimed: list[_Probe]) -> _Probe | None:
++        try:
++            status = os.lstat(database)
++        except OSError:
++            return None
++        identity = status.st_dev, status.st_ino
++        with self._lock:
++            probes = self._inodes.get(identity)
++            if not stat.S_ISREG(status.st_mode) or probes is None or not probes.idle:
++                return None
++            claimed.append(adopted := _Probe(identity, probes.idle.pop(), next(self._leases)))
++            probes.leases.add(adopted.lease)
++        return adopted
++
++    def retain(self, fd: int, identity: _DatabaseIdentity, claimed: list[_Probe]) -> _Probe:
++        with self._lock:
++            probes = self._inodes.setdefault(identity, _InodeProbes())
++            probes.descriptors.append(fd)
++            claimed.append(retained := _Probe(identity, fd, next(self._leases)))
++            probes.leases.add(retained.lease)
++        return retained
++
++    def close_unclaimed(self, fd: int) -> None:
++        # If fstat failed, the inode is unknown. Closing it beside a live SQLite connection could release that
++        # connection's POSIX locks, so defer the close until no tracked connection remains.
++        with self._lock:
++            if self._inodes:
++                self._unclaimed.append(fd)
++            else:
++                with suppress(OSError):
++                    os.close(fd)
++
++    def release(self, probe: _Probe) -> None:
++        # A finalizer may run this on a thread already inside the lock, so it never waits; the lock holder drains.
++        self._releases.append(probe)
++        self.drain()
++
++    def drain(self) -> None:
++        while self._releases and self._lock.acquire(blocking=False):
++            try:
++                while self._releases:
++                    self._release_locked(self._releases[0])
++                    self._releases.popleft()
++            finally:
++                self._lock.release()
++
++    def _release_locked(self, probe: _Probe) -> None:
++        if (probes := self._inodes.get(probe.identity)) is None:
++            return
++        if probe.lease in probes.leases:
++            probes.leases.remove(probe.lease)
++            if probes.leases:
++                probes.idle.append(probe.fd)
++        if probes.leases:
++            return
++        probes.idle.clear()
++        # Closing under the lock keeps a concurrent connect from taking a lock on this inode before the close.
++        while probes.descriptors:
++            fd = probes.descriptors.pop()
++            with suppress(OSError):
++                os.close(fd)
++        del self._inodes[probe.identity]
++        if not self._inodes:
++            while self._unclaimed:
++                fd = self._unclaimed.pop()
++                with suppress(OSError):
++                    os.close(fd)
++
++
++_PROBE_DESCRIPTORS = _ProbeDescriptors()
++
++
++class _Connection(sqlite3.Connection):
++    _probe: _Probe | None = None
++    database_identity: _DatabaseIdentity | None = None
++
++    def close(self) -> None:
++        try:
++            super().close()
++        finally:
++            if (probe := self._probe) is not None:
++                self._probe = None
++                _PROBE_DESCRIPTORS.release(probe)
++
++    def __del__(self) -> None:
++        with suppress(Exception):
++            self.close()
++
++
++def _open_lock_database(database: str) -> tuple[int, _DatabaseIdentity]:
++    fd = os.open(database, _DB_OPEN_FLAGS, 0o600)
++    try:
++        status = os.fstat(fd)
++    except BaseException:
++        _PROBE_DESCRIPTORS.close_unclaimed(fd)
++        raise
++    if not stat.S_ISREG(status.st_mode):
++        os.close(fd)
++        msg = f"refusing a non-regular lock database: {database!r}"
++        raise OSError(msg)
++    return fd, (status.st_dev, status.st_ino)
++
++
++def connect(database: str) -> sqlite3.Connection:
++    if sys.platform == "win32":
++        # Windows handle hardening is not part of the POSIX recipe backport.
++        return sqlite3.connect(database, check_same_thread=False)
++    claimed: list[_Probe] = []
++    try:
++        if (probe := _PROBE_DESCRIPTORS.adopt(database, claimed)) is None:
++            fd, identity = _open_lock_database(database)
++            probe = _PROBE_DESCRIPTORS.retain(fd, identity, claimed)
++        _PROBE_DESCRIPTORS.drain()
++        connection = sqlite3.connect(f"{_FD_DIR}/{probe.fd}", check_same_thread=False, factory=_Connection)
++        connection._probe = probe
++        connection.database_identity = probe.identity
++        claimed.clear()
++        return connection
++    finally:
++        for probe in claimed:
++            _PROBE_DESCRIPTORS.release(probe)
+diff --git a/tests/test_read_write_security.py b/tests/test_read_write_security.py
+new file mode 100644
+index 0000000..e2b862a
+--- /dev/null
++++ b/tests/test_read_write_security.py
+@@ -0,0 +1,120 @@
++from __future__ import annotations
++
++import errno
++import os
++import subprocess
++import sys
++from pathlib import Path
++from collections.abc import Generator
++
++import pytest
++
++pytest.importorskip("sqlite3")
++
++import sqlite3
++
++from filelock import ReadWriteLock
++from filelock import _rw_security
++from filelock._read_write import _cleanup_connections
++
++pytestmark = pytest.mark.skipif(sys.platform == "win32", reason="POSIX read-write lock security backport")
++
++
++@pytest.fixture(autouse=True)
++def _close_read_write_connections() -> Generator[None]:
++    _cleanup_connections()
++    ReadWriteLock._instances.clear()
++    yield
++    _cleanup_connections()
++    ReadWriteLock._instances.clear()
++
++
++def test_read_write_lock_refuses_a_symlinked_path(tmp_path: Path) -> None:
++    target = tmp_path / "target.db"
++    target.write_bytes(b"unchanged")
++    database = tmp_path / "lock.db"
++    database.symlink_to(target)
++    with pytest.raises(OSError):
++        ReadWriteLock(database, is_singleton=False)
++    assert target.read_bytes() == b"unchanged"
++
++
++def test_read_write_lock_refuses_a_non_regular_path(tmp_path: Path) -> None:
++    database = tmp_path / "lock.db"
++    os.mkfifo(database)
++    with pytest.raises(OSError, match="non-regular"):
++        ReadWriteLock(database, is_singleton=False)
++
++
++def test_closing_a_peer_keeps_another_connections_lock(tmp_path: Path) -> None:
++    database = tmp_path / "lock.db"
++    holder = ReadWriteLock(database, is_singleton=False)
++    peer = ReadWriteLock(database, is_singleton=False)
++    try:
++        holder.acquire_write()
++        peer.close()
++        result = subprocess.run(
++            [sys.executable, "-c", "import sqlite3,sys; c=sqlite3.connect(sys.argv[1], timeout=0); c.execute('BEGIN EXCLUSIVE')", str(database)],
++            capture_output=True,
++            text=True,
++            check=False,
++        )
++        assert result.returncode != 0
++        assert "database is locked" in result.stderr
++    finally:
++        holder.close()
++
++
++def _fail_opened_database_fstat(database: Path, monkeypatch: pytest.MonkeyPatch) -> list[int]:
++    opened: list[int] = []
++    real_open = os.open
++    real_fstat = os.fstat
++    def open_database(path: str | os.PathLike[str], flags: int, mode: int = 0o777, **kwargs: object) -> int:
++        fd = real_open(path, flags, mode, **kwargs)
++        if os.fspath(path) == os.fspath(database):
++            opened.append(fd)
++        return fd
++    def fail_fstat(fd: int) -> os.stat_result:
++        if fd in opened:
++            raise OSError(errno.EIO, "database fstat failed")
++        return real_fstat(fd)
++    monkeypatch.setattr(os, "open", open_database)
++    monkeypatch.setattr(os, "fstat", fail_fstat)
++    return opened
++
++
++def test_failed_database_fstat_closes_an_unowned_descriptor(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
++    database = tmp_path / "lock.db"
++    with monkeypatch.context() as patch:
++        opened = _fail_opened_database_fstat(database, patch)
++        with pytest.raises(OSError, match="database fstat failed"):
++            ReadWriteLock(database, is_singleton=False)
++    assert len(opened) == 1
++    with pytest.raises(OSError) as caught:
++        os.fstat(opened[0])
++    assert caught.value.errno == errno.EBADF
++
++
++def test_failed_database_fstat_preserves_a_peer_lock(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
++    database = tmp_path / "lock.db"
++    holder = ReadWriteLock(database, is_singleton=False)
++    try:
++        holder.acquire_write()
++        with monkeypatch.context() as patch:
++            opened = _fail_opened_database_fstat(database, patch)
++            with pytest.raises(OSError, match="database fstat failed"):
++                ReadWriteLock(database, is_singleton=False)
++        assert len(opened) == 1
++        # The unidentified descriptor must remain open while closing it could drop the holder's POSIX locks.
++        os.fstat(opened[0])
++        result = subprocess.run(
++            [sys.executable, "-c", "import sqlite3,sys; c=sqlite3.connect(sys.argv[1], timeout=0); c.execute('BEGIN EXCLUSIVE')", str(database)],
++            capture_output=True, text=True, check=False,
++        )
++        assert result.returncode != 0
++        assert "database is locked" in result.stderr
++    finally:
++        holder.close()
++    with pytest.raises(OSError) as caught:
++        os.fstat(opened[0])
++    assert caught.value.errno == errno.EBADF
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index a4bd002f1f..db7f9187de 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -14,6 +14,7 @@ SRC_URI += " file://run-ptest \
     file://CVE-2026-112935_p3.patch \
     file://CVE-2026-112909_p1.patch \
     file://CVE-2026-112909_p2.patch \
+    file://CVE-2026-112936.patch \
 "
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
@@ -33,6 +34,7 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    python3-sqlite3 \
     python3-pytest-asyncio \
     python3-pytest-mock \
     python3-virtualenv \
-- 
2.35.6
