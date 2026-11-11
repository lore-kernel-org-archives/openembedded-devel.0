Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3283.1794374983856874227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dQo+jbP2;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=37212; q=dns/txt;
  s=iport01; t=1794374985; x=1795584585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z1jqVoJRIdFrep/lZnaWYt2/++hnpN/18Itf+miG2gU=;
  b=dQo+jbP2IJg4buc3/iHfOA9ABW+Fqq65AyvTEgg2eGFe4SFOimcMKODf
   iqQE0vV7/q8/DSoIEsPFOM2ZPLGwee7jVA9NzJqLHwNVd+VQAyYpmNj/+
   rZ2rfOJ/UvbfTI+m/fipAEI7XQ0lUEhqNLYUaM82BOgbeC7aHgiJGA04D
   BxRGhCXB3nZLK3p8GO7ii9/dT7Nzgg0I0cK8u3LpXac6FKwGfR2JGIUHv
   GeB/2pPoedroBU1QWXdg5SFhDuEaJm2ktXlEM2STbBjlKWuPQDXLemBqI
   mgYSHQnZXgd3m2T/fFllXaqPi8pdEnXGdAEXhLcqL/j1HNoDBZyMBKdWh
   g==;
X-CSE-ConnectionGUID: fsjoo6iyQy2VoYTm3RNywQ==
X-CSE-MsgGUID: 5xyuU/CvTMKwkBE99v/w5A==
X-IPAS-Result: =?us-ascii?q?A0AnAABQ/PNq/4v/Ja1RAQgdAQEBAQkBEgEFBQGBfAgBC?=
 =?us-ascii?q?wGCVnVgQ0kDhFSIG4lZA4ETilKFZ4xWFIFqDwEBAQ9EDQQBAYQ/RgKOHgImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaA?=
 =?us-ascii?q?QgECwEYARsSEBwDAQIDAhEVAgIgCx0BBQgQCYMCAYI6AzcDEQa5Unp/M4EBg?=
 =?us-ascii?q?ykBgVTYTA2CWgELFAGBCi4BhUGDACABhQNdGAFEhDknGxuBchd+gnN2gQWBG?=
 =?us-ascii?q?kICAQEBgRYODQQBDliDHYJIIgSCDRV6EoFaHmQHAoIZgxgDhlsCgU+HJUiBA?=
 =?us-ascii?q?hwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBHIEegRKBB12BKyhdA?=
 =?us-ascii?q?SGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IESw3FRkEPQFuB5JughE3LSABLBA+C?=
 =?us-ascii?q?QoBGwoBAwIVOwQCOwcBAQYtMAcHAhMMDwILLwOSZwKQHoIhjACUIHEKKIN4j?=
 =?us-ascii?q?CSPPoV8GjOEBIFXkkOSVAuYfY1cLoQKkSsuBhsDSoRqgWg8RoETcBU7gmcJS?=
 =?us-ascii?q?hkPjisDCwuDYIRQQ8lIJjICCQMvAQEHAgcOAwuBaJAAAQMkdmABAQ?=
IronPort-Data: A9a23:UzUn76hBF7kJet3lnp74j2jpX161MBEKZh0ujC45NGQN5FlHY01je
 htvUDrUafePa2T2Ktx/boS2oU8Du5GAx9ZrTgo6qSE9HiljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvva8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUW4eRwBj9P5
 MUJcg4KXyyG3NiQ0a2CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DUHp0KwBbHz
 o7A1znpEwwnc/eB9R+m7XGGq76eg2TkBatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:B2aCI6hGSwQAqbsJ29Y6svoqDXBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHnJYVcqKRYdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILXFuFfBOLZqlWKcREWtNQtsJ
 uIGJIRNDSfNzRHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:7w6d62A8dPVkiQv6Eyd89kkTRME0S2yH8nDhH0rjM0B4V4TAHA==
X-Talos-MUID: 9a23:a0mekQtjRnGGCIdTsM2n2SFzKfovyLqSLWMSkr8r6piacjMtEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546307687"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 619E31800020D;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id BA6F5CBF234; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 6/9] python3-filelock: fix CVE-2026-112940
Date: Tue, 10 Nov 2026 21:29:35 -0800
Message-Id: <20261111052938.3691463-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132120
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the private SQLite filename changes from [1], following
advisory [2]. Use checked private hard links in shared directories so
SQLite cannot reopen attacker-controlled database or side-file names.
Check database identity before statements and after BEGIN, and keep
private aliases until the existing persistent connection closes.

Include the WAL-header prerequisite [3] and inherited-ACL correction
[4]. Retain the journal, replacement, cleanup and descriptor-lifetime
regressions. Add the hashing module used for private-alias ownership.

[1] https://github.com/tox-dev/filelock/commit/5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d
[2] https://github.com/tox-dev/filelock/security/advisories/GHSA-v4x8-3wr5-3wq8
[3] https://github.com/tox-dev/filelock/commit/015d27c10d4bdbaaf94aeafb15ee931a2bd6a019
[4] https://github.com/tox-dev/filelock/commit/21bc250542497ff2d74151cdf7f98069d929465a

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-112940_p1.patch | 699 ++++++++++++++++++
 .../python3-filelock/CVE-2026-112940_p2.patch | 104 +++
 .../python/python3-filelock_3.25.2.bb         |   3 +
 3 files changed, 806 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p1.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p1.patch
new file mode 100644
index 0000000000..fda3195568
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p1.patch
@@ -0,0 +1,699 @@
+From 5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:39:07 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(read-write):=20keep=20SQLite?=
+ =?UTF-8?q?=20off=20shared=20names,=20bound=20schema=20(#834)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112940
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d]
+
+Backport Changes:
+- Split the shared-path changes from upstream schema hardening,
+  already applied separately for CVE-2026-112915.
+- Transplant applicable POSIX helpers into _rw_security.py without
+  importing the newer public, cancellation or fork-safety APIs.
+- Retain each private alias until the existing 3.25.2 connection
+  closes; this release keeps connections across lock releases.
+- Check the opened database identity before any statement and
+  after BEGIN, and roll back if acquisition is refused.
+- Include the required WAL-header guard from upstream PR #805.
+- Adapt dead-holder cleanup to local PID/start-token/host helpers
+  because 3.25.2 lacks the newer process-identity module.
+- Reset the new descriptor pool after fork without adding newer
+  fork behavior to the existing public API.
+- Keep hard-link and trusted-ancestor constraints in the docstring.
+- Consolidate applicable journal, replacement, cleanup, side-file
+  and probe-lifetime regressions in the dedicated test file.
+- Adapt construction timing and explicit close calls to persistent
+  3.25.2 connections instead of newer per-acquisition connections.
+- Omit Windows ACL/handle code and tests for this POSIX recipe,
+  together with absent fd-fallback/fork fixtures and task metadata.
+- Keep upstream owner-PID bounds and reject overlong decimals
+  before probing stale private directories.
+- Retain database identity in the older mocked-connection tests
+  and restore/close their original persistent connections.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_read_write.py       |  59 +++++----
+ src/filelock/_rw_security.py      | 261 ++++++++++++++++++++++++++++++++++++--
+ tests/test_read_write_security.py | 190 ++++++++++++++++++++++++++-
+ tests/test_read_write_unit.py     |  12 +-
+ 4 files changed, 486 insertions(+), 36 deletions(-)
+
+diff --git a/src/filelock/_read_write.py b/src/filelock/_read_write.py
+index 66a4664..8918fc7 100644
+--- a/src/filelock/_read_write.py
++++ b/src/filelock/_read_write.py
+@@ -13,7 +13,7 @@ from weakref import WeakValueDictionary
+ 
+ from ._api import AcquireReturnProxy
+ from ._error import Timeout
+-from ._rw_security import bounded_schema, canonical, connect
++from ._rw_security import bounded_schema, canonical, connect, raise_if_database_replaced
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Generator
+@@ -107,7 +107,10 @@ class ReadWriteLock(metaclass=_ReadWriteLockMeta):
+     acquired them.
+ 
+     By default, ``is_singleton=True``: calling ``ReadWriteLock(path)`` with the same resolved path returns the same
+-    instance. The lock file must use a ``.db`` extension (SQLite database).
++    instance. The lock file must use a ``.db`` extension (SQLite database). On POSIX, a database directory writable by
++    other accounts must also be writable by this account and support hard links. The database directory and its
++    ancestors must not be replaceable by another account. Give the lock a file of its own; WAL-mode and oversized-schema
++    databases are refused. Private aliases are retained until :meth:`close`, along with the SQLite connection.
+ 
+     :param lock_file: path to the SQLite database file used as the lock
+     :param timeout: maximum wait time in seconds; ``-1`` means block indefinitely
+@@ -189,28 +192,36 @@ class ReadWriteLock(metaclass=_ReadWriteLockMeta):
+     def _configure_and_begin(
+         self, mode: Literal["read", "write"], timeout: float, *, blocking: bool, start_time: float
+     ) -> None:
+-        with bounded_schema(self._con, self.lock_file):
+-            waited = time.perf_counter() - start_time
+-            timeout_ms = timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)
+-            self._con.execute(f"PRAGMA busy_timeout={timeout_ms};").close()
+-            # Use legacy journal mode (not WAL) because WAL does not block readers when a concurrent EXCLUSIVE
+-            # write transaction is active, making read-write locking impossible without modifying table data.
+-            # MEMORY is safe here since no actual writes happen — crashes cannot corrupt the DB.
+-            # See https://sqlite.org/lang_transaction.html#deferred_immediate_and_exclusive_transactions
+-            #
+-            # Set here (not in __init__) because this pragma itself may block on a locked database,
+-            # so it must run after busy_timeout is configured above.
+-            self._con.execute("PRAGMA journal_mode=MEMORY;").close()
+-            # Recompute remaining timeout after the potentially blocking journal_mode pragma.
+-            waited = time.perf_counter() - start_time
+-            if (recomputed := timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)) != timeout_ms:
+-                self._con.execute(f"PRAGMA busy_timeout={recomputed};").close()
+-            stmt = "BEGIN EXCLUSIVE TRANSACTION;" if mode == "write" else "BEGIN TRANSACTION;"
+-            self._con.execute(stmt).close()
+-            if mode == "read":
+-                # A SELECT is needed to force SQLite to actually acquire the SHARED lock on the database.
+-                # https://www.sqlite.org/lockingv3.html#transaction_control
+-                self._con.execute("SELECT name FROM sqlite_schema LIMIT 1;").close()
++        # Refuse a swapped path before any statement can replay an adjacent journal, and after the BEGIN.
++        try:
++            raise_if_database_replaced(self._con, self._canonical_path)
++            with bounded_schema(self._con, self.lock_file):
++                waited = time.perf_counter() - start_time
++                timeout_ms = timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)
++                self._con.execute(f"PRAGMA busy_timeout={timeout_ms};").close()
++                # Use legacy journal mode (not WAL) because WAL does not block readers when a concurrent EXCLUSIVE
++                # write transaction is active, making read-write locking impossible without modifying table data.
++                # MEMORY is safe here since no actual writes happen — crashes cannot corrupt the DB.
++                # See https://sqlite.org/lang_transaction.html#deferred_immediate_and_exclusive_transactions
++                #
++                # Set here (not in __init__) because this pragma itself may block on a locked database,
++                # so it must run after busy_timeout is configured above.
++                self._con.execute("PRAGMA journal_mode=MEMORY;").close()
++                # Recompute remaining timeout after the potentially blocking journal_mode pragma.
++                waited = time.perf_counter() - start_time
++                if (recomputed := timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)) != timeout_ms:
++                    self._con.execute(f"PRAGMA busy_timeout={recomputed};").close()
++                stmt = "BEGIN EXCLUSIVE TRANSACTION;" if mode == "write" else "BEGIN TRANSACTION;"
++                self._con.execute(stmt).close()
++                if mode == "read":
++                    # A SELECT is needed to force SQLite to actually acquire the SHARED lock on the database.
++                    # https://www.sqlite.org/lockingv3.html#transaction_control
++                    self._con.execute("SELECT name FROM sqlite_schema LIMIT 1;").close()
++            raise_if_database_replaced(self._con, self._canonical_path)
++        except BaseException:
++            with suppress(sqlite3.Error):
++                self._con.rollback()
++            raise
+ 
+     def _acquire(self, mode: Literal["read", "write"], timeout: float, *, blocking: bool) -> AcquireReturnProxy:
+         opposite = "write" if mode == "read" else "read"
+diff --git a/src/filelock/_rw_security.py b/src/filelock/_rw_security.py
+index 9e4f92f..82b5803 100644
+--- a/src/filelock/_rw_security.py
++++ b/src/filelock/_rw_security.py
+@@ -1,23 +1,36 @@
+ from __future__ import annotations
+ 
++import errno
++import hashlib
+ import os
+ import pathlib
++import secrets
++import socket
+ import sqlite3
+ import stat
+ import sys
++import tempfile
+ import threading
+ from collections import deque
+ from contextlib import contextmanager, suppress
+ from dataclasses import dataclass, field
+ from itertools import count
+-from typing import TYPE_CHECKING, NamedTuple
++from typing import TYPE_CHECKING, Final, NamedTuple
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Generator
+ 
+ _DatabaseIdentity = tuple[int, int]
+ _DB_OPEN_FLAGS = os.O_RDWR | os.O_CREAT | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_NONBLOCK", 0)
+-_FD_DIR = "/proc/self/fd" if sys.platform == "linux" else "/dev/fd"
++_DIRECTORY_FLAGS = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
++# Header bytes 18 and 19 hold the file format versions, 2 in WAL mode: https://www.sqlite.org/fileformat.html
++_SQLITE_MAGIC = b"SQLite format 3\x00"
++_FORMAT_VERSIONS = slice(18, 20)
++_HEADER_SIZE = 20
++_WAL_FORMAT_VERSION = 2
++_LINK_PREFIX = ".filelock-"
++_LINK_NAME = "lock.db"
++_SWEPT_DATABASES: set[_DatabaseIdentity] = set()
+ 
+ 
+ def canonical(database: str | os.PathLike[str]) -> pathlib.Path:
+@@ -119,21 +132,40 @@ class _ProbeDescriptors:
+                 with suppress(OSError):
+                     os.close(fd)
+ 
++    def _reset_after_fork_in_child(self) -> None:
++        # The child owns no POSIX locks, and must not reuse the parent's descriptor leases.
++        descriptors = self._unclaimed + [fd for probes in self._inodes.values() for fd in probes.descriptors]
++        self._lock = threading.Lock()
++        self._inodes = {}
++        self._unclaimed = []
++        self._releases = deque()
++        for fd in descriptors:
++            with suppress(OSError):
++                os.close(fd)
++
+ 
+ _PROBE_DESCRIPTORS = _ProbeDescriptors()
++if hasattr(os, "register_at_fork"):
++    os.register_at_fork(after_in_child=_PROBE_DESCRIPTORS._reset_after_fork_in_child)
+ 
+ 
+ class _Connection(sqlite3.Connection):
+     _probe: _Probe | None = None
++    _database_directory: _LinkDirectory | None = None
+     database_identity: _DatabaseIdentity | None = None
+ 
+     def close(self) -> None:
+         try:
+             super().close()
+         finally:
+-            if (probe := self._probe) is not None:
+-                self._probe = None
+-                _PROBE_DESCRIPTORS.release(probe)
++            try:
++                if (directory := self._database_directory) is not None:
++                    self._database_directory = None
++                    _remove_link_directory(directory)
++            finally:
++                if (probe := self._probe) is not None:
++                    self._probe = None
++                    _PROBE_DESCRIPTORS.release(probe)
+ 
+     def __del__(self) -> None:
+         with suppress(Exception):
+@@ -159,19 +191,43 @@ def connect(database: str) -> sqlite3.Connection:
+         # Windows handle hardening is not part of the POSIX recipe backport.
+         return sqlite3.connect(database, check_same_thread=False, cached_statements=0)
+     claimed: list[_Probe] = []
++    link: _LinkDirectory | None = None
+     try:
+         if (probe := _PROBE_DESCRIPTORS.adopt(database, claimed)) is None:
+             fd, identity = _open_lock_database(database)
+             probe = _PROBE_DESCRIPTORS.retain(fd, identity, claimed)
+         _PROBE_DESCRIPTORS.drain()
+-        connection = sqlite3.connect(f"{_FD_DIR}/{probe.fd}", check_same_thread=False, factory=_Connection, cached_statements=0)
++        _raise_if_wal(probe.fd, database)
++        target = database
++        # SQLite resolves descriptor paths back to names and then opens adjacent journal/WAL files. Only a name in
++        # a directory no other account can write is safe; otherwise use an identity-checked private hard link.
++        if not _names_are_private(pathlib.Path(database).parent, os.geteuid()):
++            link = _link_beside(database, probe.identity, os.geteuid())
++            target = os.fspath(link.database)
++        connection = sqlite3.connect(target, check_same_thread=False, factory=_Connection, cached_statements=0)
+         connection._probe = probe
+         connection.database_identity = probe.identity
++        connection._database_directory = link
+         claimed.clear()
+         return connection
+     finally:
+-        for probe in claimed:
+-            _PROBE_DESCRIPTORS.release(probe)
++        for unowned in claimed:
++            _PROBE_DESCRIPTORS.release(unowned)
++        if claimed and link is not None:
++            _remove_link_directory(link)
++
++
++def raise_if_database_replaced(connection: sqlite3.Connection, database: pathlib.Path) -> None:
++    if sys.platform == "win32":
++        return
++    try:
++        status = database.stat(follow_symlinks=False)
++    except OSError as exc:
++        msg = f"lock database was replaced while acquiring: {database!s}"
++        raise OSError(msg) from exc
++    if (status.st_dev, status.st_ino) != connection.database_identity:
++        msg = f"lock database was replaced while acquiring: {database!s}"
++        raise OSError(msg)
+ 
+ 
+ @contextmanager
+@@ -195,3 +251,192 @@ def bounded_schema(connection: sqlite3.Connection, database: str) -> Generator[N
+         raise
+     finally:
+         connection.set_progress_handler(None, 0)
++
++
++def _names_are_private(directory: pathlib.Path, owner: int) -> bool:  # pragma: win32 no cover
++    status: Final = os.lstat(directory)
++    # The sticky bit still lets others create names, so a directory anyone else may write to never qualifies.
++    return status.st_uid in {owner, 0} and not status.st_mode & (stat.S_IWGRP | stat.S_IWOTH)
++
++
++class _LinkDirectory(NamedTuple):  # pragma: needs posix-hard-link
++    path: pathlib.Path
++    identity: _DatabaseIdentity
++    # Made through a descriptor of path, which nobody else can list, so a directory another process swaps in under
++    # path cannot hold this name and SQLite fails to open instead of following the swap.
++    name: str
++
++    @property
++    def database(self) -> pathlib.Path:
++        return self.path / self.name / _LINK_NAME
++
++
++def _link_beside(  # pragma: needs posix-hard-link
++    database: str, identity: _DatabaseIdentity, owner: int
++) -> _LinkDirectory:
++    # Beside the database because a link cannot cross filesystems, and TMPDIR is often on another one.
++    parent: Final = pathlib.Path(database).parent
++    _sweep_links_of_the_dead(parent, identity, owner)
++    path: Final = pathlib.Path(tempfile.mkdtemp(prefix=_link_prefix(), dir=parent))
++    fd: Final = os.open(path, _DIRECTORY_FLAGS)
++    try:
++        made: Final = os.fstat(fd)
++        # Whoever can rename in the parent can put another directory under the new name before it opens.
++        if made.st_uid != owner or made.st_mode & 0o077:
++            msg = f"link directory {os.fspath(path)!r} was replaced while opening"
++            raise OSError(msg)
++        link: Final = _LinkDirectory(path, (made.st_dev, made.st_ino), secrets.token_hex(8))
++        try:
++            os.mkdir(link.name, 0o700, dir_fd=fd)
++            os.link(database, link.database, follow_symlinks=False)
++            linked: Final = link.database.stat(follow_symlinks=False)
++        except BaseException:
++            _remove_link_directory(link)
++            raise
++    finally:
++        os.close(fd)
++    if (linked.st_dev, linked.st_ino) != identity:
++        _remove_link_directory(link)
++        msg = f"lock database changed while opening: {database!r}"
++        raise OSError(msg)
++    return link
++
++
++def _sweep_links_of_the_dead(
++    parent: pathlib.Path, identity: _DatabaseIdentity, owner: int
++) -> None:  # pragma: needs posix-hard-link
++    # A process killed while it held a link leaves the directory, and an extra link to the database, behind for good.
++    # Two threads sweeping at once only both try the same removals, which a lock would cost a fork-safety reset for.
++    if identity in _SWEPT_DATABASES:
++        return
++    _SWEPT_DATABASES.add(identity)
++    try:
++        with os.scandir(parent) as entries:
++            names: Final = [
++                entry.name
++                for entry in entries
++                if entry.name.startswith(_LINK_PREFIX) and entry.is_dir(follow_symlinks=False)
++            ]
++    except OSError:
++        return
++    for name in names:
++        # A peer sweeping alongside, or a directory this user cannot remove, must not fail the connect.
++        with suppress(OSError):
++            _remove_dead_links(parent / name, identity, owner)
++
++
++def _remove_dead_links(
++    path: pathlib.Path, identity: _DatabaseIdentity, owner: int
++) -> None:  # pragma: needs posix-hard-link
++    # Any directory can carry a dead holder's name after a rename in the parent, so only hard links to this database
++    # go, and the directory only once that leaves it empty.
++    fd: Final = os.open(path, _DIRECTORY_FLAGS)
++    try:
++        # Only a directory this account made carries a holder of its own; a name another account chose is never
++        # parsed, so no PID is probed on its behalf.
++        if os.fstat(fd).st_uid != owner or not _owner_is_gone(path.name):
++            return
++        with os.scandir(fd) as entries:
++            names: Final = [entry.name for entry in entries]
++        for entry in names:
++            # Releases up to 4.2.0 linked the database right inside the directory.
++            if entry == _LINK_NAME:
++                _unlink_link_to(identity, fd)
++                continue
++            try:
++                nested = os.open(entry, _DIRECTORY_FLAGS, dir_fd=fd)
++            except OSError:
++                continue
++            try:
++                _unlink_link_to(identity, nested)
++            finally:
++                os.close(nested)
++            with suppress(OSError):
++                os.rmdir(entry, dir_fd=fd)
++    finally:
++        os.close(fd)
++    with suppress(OSError):
++        path.rmdir()
++
++
++def _unlink_link_to(identity: _DatabaseIdentity, dir_fd: int) -> None:  # pragma: needs posix-hard-link
++    try:
++        linked: Final = os.stat(_LINK_NAME, dir_fd=dir_fd, follow_symlinks=False)
++    except OSError:
++        return
++    if (linked.st_dev, linked.st_ino) == identity:
++        os.unlink(_LINK_NAME, dir_fd=dir_fd)
++
++
++def _remove_link_directory(link: _LinkDirectory) -> None:  # pragma: needs posix-hard-link
++    # A rename in the parent may have put any directory under this name, so entries go through a descriptor checked
++    # to be the directory made, and the name goes only through rmdir, which refuses a non-empty directory.
++    try:
++        fd: Final = os.open(link.path, _DIRECTORY_FLAGS)
++    except OSError:
++        return
++    try:
++        opened: Final = os.fstat(fd)
++        if (opened.st_dev, opened.st_ino) != link.identity:
++            return
++        for suffix in ("", "-journal", "-wal", "-shm"):
++            with suppress(FileNotFoundError):
++                os.unlink(f"{link.name}/{_LINK_NAME}{suffix}", dir_fd=fd)
++        with suppress(FileNotFoundError):
++            os.rmdir(link.name, dir_fd=fd)
++    finally:
++        os.close(fd)
++    # The link is gone, so a failure here leaves one stray empty directory and is not worth failing a release for.
++    with suppress(OSError):
++        link.path.rmdir()
++
++
++def _raise_if_wal(fd: int, database: str) -> None:
++    # SQLite derives the -wal name from the path it connects through, a descriptor name on POSIX, and WAL never blocks
++    # readers behind a writer, so the lock cannot work on such a database.
++    # pread: an adopted probe is shared, so its file offset is not this connect's to move.
++    header: Final = os.pread(fd, _HEADER_SIZE, 0) if hasattr(os, "pread") else os.read(fd, _HEADER_SIZE)
++    if header.startswith(_SQLITE_MAGIC) and _WAL_FORMAT_VERSION in header[_FORMAT_VERSIONS]:
++        msg = f"refusing a WAL-mode lock database: {database!r}; give ReadWriteLock a file of its own"
++        raise ValueError(msg)
++
++
++def _process_start_token(pid: int) -> str | None:
++    # Linux proc field 22 identifies a process despite PID reuse. Other POSIX systems can still safely test liveness.
++    if sys.platform != "linux":
++        return None
++    try:
++        return pathlib.Path(f"/proc/{pid}/stat").read_text(encoding="utf-8").rpartition(")")[2].split()[19]
++    except (OSError, IndexError):
++        return None
++
++
++def _host_digest(host: str) -> str:
++    return hashlib.sha256(host.encode()).hexdigest()[:16]
++
++
++def _link_prefix() -> str:
++    pid = os.getpid()
++    return f"{_LINK_PREFIX}{pid}-{_process_start_token(pid) or ''}-{_host_digest(socket.gethostname())}-"
++
++
++def _owner_is_gone(name: str) -> bool:
++    parts = name.removeprefix(_LINK_PREFIX).split("-")
++    if len(parts) != 4:
++        return False
++    pid, start, host, _ = parts
++    if not pid.isascii() or not pid.isdigit() or len(pid) > 10:
++        return False
++    owner_pid = int(pid)
++    if not 1 <= owner_pid <= 2**31 - 1:
++        return False
++    if start and (not start.isascii() or not start.isdigit()):
++        return False
++    if host != _host_digest(socket.gethostname()):
++        return False
++    try:
++        os.kill(owner_pid, 0)
++    except OSError as exc:
++        return exc.errno == errno.ESRCH
++    current = _process_start_token(owner_pid)
++    return bool(start and current is not None and current != start)
+diff --git a/tests/test_read_write_security.py b/tests/test_read_write_security.py
+index a995c80..992cd75 100644
+--- a/tests/test_read_write_security.py
++++ b/tests/test_read_write_security.py
+@@ -3,11 +3,12 @@ from __future__ import annotations
+ import errno
+ import os
+ import struct
+-from typing import Literal
+ import subprocess
+ import sys
++from contextlib import closing
+ from pathlib import Path
+ from collections.abc import Generator
++from typing import Literal
+ 
+ import pytest
+ 
+@@ -166,6 +167,174 @@ def _varint(value: int) -> bytes:
+     return bytes(groups)
+ 
+ 
++@pytest.fixture
++def shared_database(tmp_path: Path) -> Path:
++    shared = tmp_path / "shared"
++    shared.mkdir()
++    shared.chmod(0o777)
++    return shared / "lock.db"
++
++
++def _hot_journal(super_journal: Path) -> bytes:
++    # A journal whose tail names a super-journal makes SQLite unlink that file once it finishes the journal:
++    # https://www.sqlite.org/fileformat.html#the_rollback_journal
++    name = os.fsencode(super_journal)
++    return name + struct.pack(">II", len(name), sum(name)) + bytes.fromhex("d9d505f920a163d7")
++
++
++def _entries(directory: Path) -> list[tuple[str, bytes | None]]:
++    return sorted((path.name, path.read_bytes() if path.is_file() else None) for path in directory.iterdir())
++
++
++def test_shared_directory_ignores_a_journal_beside_the_database(shared_database: Path, tmp_path: Path) -> None:
++    # SQLite treats a journal beside a non-empty database as an interrupted transaction, and finishing it deletes the
++    # super-journal file the journal names.
++    named = tmp_path / "notes.txt"
++    named.write_text("keep")
++    with closing(sqlite3.connect(shared_database)) as connection:
++        connection.execute("CREATE TABLE application (value)")
++    Path(f"{shared_database}-journal").write_bytes(_hot_journal(named))
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    try:
++        with lock.read_lock():
++            pass
++    finally:
++        lock.close()
++    assert named.read_text() == "keep"
++
++
++def test_shared_directory_ignores_a_directory_at_the_wal_name(shared_database: Path) -> None:
++    Path(f"{shared_database}-wal").mkdir()
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    try:
++        with lock.write_lock():
++            pass
++    finally:
++        lock.close()
++
++
++def test_private_alias_cleanup_waits_for_connection_close(shared_database: Path) -> None:
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    link = lock._con._database_directory
++    assert link is not None
++    assert link.path.parent == shared_database.parent
++    try:
++        assert link.database.stat().st_ino == shared_database.stat().st_ino
++        assert link.path.stat().st_mode & 0o777 == 0o700
++        with lock.read_lock():
++            pass
++        # filelock 3.25.2 keeps its connection across releases, so its safe name must live just as long.
++        assert link.database.exists()
++        with lock.write_lock():
++            pass
++    finally:
++        lock.close()
++    assert not link.path.exists()
++
++
++def test_private_alias_failure_preserves_a_peer_lock(shared_database: Path, monkeypatch: pytest.MonkeyPatch) -> None:
++    holder = ReadWriteLock(shared_database, is_singleton=False)
++    try:
++        holder.acquire_write()
++        def deny_link(*args: object, **kwargs: object) -> None:
++            raise PermissionError("no hard links")
++        monkeypatch.setattr(os, "link", deny_link)
++        with pytest.raises(PermissionError, match="no hard links"):
++            ReadWriteLock(shared_database, is_singleton=False)
++        result = subprocess.run(
++            [sys.executable, "-c", "import sqlite3,sys; c=sqlite3.connect(sys.argv[1], timeout=0); c.execute('BEGIN EXCLUSIVE')", str(shared_database)],
++            capture_output=True, text=True, check=False,
++        )
++        assert result.returncode != 0
++        assert "database is locked" in result.stderr
++    finally:
++        holder.close()
++
++
++def test_private_alias_cleanup_keeps_a_directory_renamed_onto_its_name(shared_database: Path, tmp_path: Path) -> None:
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    link = lock._con._database_directory
++    assert link is not None
++    link.path.rename(tmp_path / "moved")
++    link.path.mkdir(mode=0o700)
++    note = link.path / "notes.txt"
++    note.write_text("keep")
++    lock.close()
++    assert note.read_text() == "keep"
++
++
++def test_acquire_refuses_a_replaced_database_before_statements(shared_database: Path, tmp_path: Path) -> None:
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    replacement = tmp_path / "replacement.db"
++    replacement.write_bytes(b"keep")
++    replacement.replace(shared_database)
++    try:
++        with pytest.raises(OSError, match="replaced while acquiring"):
++            lock.acquire_write()
++        assert shared_database.read_bytes() == b"keep"
++        assert not lock._con.in_transaction
++    finally:
++        lock.close()
++
++
++def test_shared_directory_keeps_sqlite_off_an_unlinked_name(
++    shared_database: Path, tmp_path: Path, monkeypatch: pytest.MonkeyPatch
++) -> None:
++    target = tmp_path / "target.txt"
++    Path(f"{shared_database} (deleted)").symlink_to(target)
++    shared_database.touch()
++    kept = shared_database.with_name("kept.db")
++    kept.hardlink_to(shared_database)
++    connect = sqlite3.connect
++    def relink_then_connect(path: str, **kwargs: object) -> sqlite3.Connection:
++        shared_database.unlink()
++        shared_database.hardlink_to(kept)
++        return connect(path, **kwargs)
++    monkeypatch.setattr(sqlite3, "connect", relink_then_connect)
++    ReadWriteLock(shared_database, is_singleton=False).close()
++    assert not target.exists()
++
++
++def test_private_directory_under_shared_parent_refuses_replacement(
++    shared_database: Path, tmp_path: Path, monkeypatch: pytest.MonkeyPatch
++) -> None:
++    private = shared_database.parent / "private"
++    private.mkdir(mode=0o700)
++    database = private / "lock.db"
++    moved = shared_database.parent / "moved"
++    note = tmp_path / "notes.txt"
++    note.write_text("keep")
++    connect = sqlite3.connect
++    replaced: list[list[tuple[str, bytes | None]]] = []
++    def replace_then_connect(path: str, **kwargs: object) -> sqlite3.Connection:
++        private.rename(moved)
++        private.mkdir(mode=0o700)
++        with closing(connect(database)) as created:
++            created.execute("CREATE TABLE application (value)")
++        Path(f"{database}-journal").write_bytes(_hot_journal(note))
++        replaced.append(_entries(private))
++        return connect(path, **kwargs)
++    monkeypatch.setattr(sqlite3, "connect", replace_then_connect)
++    lock = ReadWriteLock(database, is_singleton=False)
++    try:
++        with pytest.raises(OSError, match="replaced while acquiring"):
++            lock.acquire_write()
++        assert note.read_text() == "keep"
++        assert _entries(private) == replaced[0]
++    finally:
++        lock.close()
++
++
++def test_wal_mode_database_is_refused(tmp_path: Path) -> None:
++    database = tmp_path / "lock.db"
++    with closing(sqlite3.connect(database)) as created:
++        created.execute("PRAGMA journal_mode=WAL")
++        created.execute("CREATE TABLE application(value)")
++        created.commit()
++    with pytest.raises(ValueError, match="WAL-mode"):
++        ReadWriteLock(database, is_singleton=False)
++
++
+ def _fail_opened_database_fstat(database: Path, monkeypatch: pytest.MonkeyPatch) -> list[int]:
+     opened: list[int] = []
+     real_open = os.open
+@@ -219,3 +388,22 @@ def test_failed_database_fstat_preserves_a_peer_lock(tmp_path: Path, monkeypatch
+     with pytest.raises(OSError) as caught:
+         os.fstat(opened[0])
+     assert caught.value.errno == errno.EBADF
++
++
++@pytest.mark.parametrize("pid", ["2147483648", "9999999999", "999999999999999999999999999999"])
++def test_private_link_sweep_ignores_out_of_range_owner_pids(
++    shared_database: Path, monkeypatch: pytest.MonkeyPatch, pid: str
++) -> None:
++    host = _rw_security._host_digest(_rw_security.socket.gethostname())
++    planted = shared_database.parent / f".filelock-{pid}--{host}-planted"
++    planted.mkdir(mode=0o700)
++    def unexpected_probe(owner_pid: int, signal: int) -> None:
++        raise AssertionError("must not probe an out-of-range owner PID")
++    monkeypatch.setattr(os, "kill", unexpected_probe)
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    try:
++        with lock.read_lock():
++            pass
++    finally:
++        lock.close()
++    assert planted.is_dir()
+diff --git a/tests/test_read_write_unit.py b/tests/test_read_write_unit.py
+index 3a2d272..f657f9a 100644
+--- a/tests/test_read_write_unit.py
++++ b/tests/test_read_write_unit.py
+@@ -525,12 +525,18 @@ def test_operational_error_handling(
+     mode: Literal["read", "write"],
+ ) -> None:
+     lock = ReadWriteLock(lock_file, is_singleton=False)
++    original = lock._con
+     con_mock = mocker.MagicMock()
++    con_mock.database_identity = original.database_identity
+     con_mock.execute.side_effect = sqlite3.OperationalError(error_msg)
+     lock._con = con_mock
+-    acquire = lock.acquire_read if mode == "read" else lock.acquire_write
+-    with pytest.raises(expected_exception):
+-        acquire()
++    try:
++        acquire = lock.acquire_read if mode == "read" else lock.acquire_write
++        with pytest.raises(expected_exception):
++            acquire()
++    finally:
++        lock._con = original
++        lock.close()
+ 
+ 
+ def test_write_lock_context_manager_overrides_defaults(lock_file: str) -> None:
diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p2.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p2.patch
new file mode 100644
index 0000000000..5fc7faf5d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p2.patch
@@ -0,0 +1,104 @@
+From 21bc250542497ff2d74151cdf7f98069d929465a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Fri, 30 Oct 2026 12:20:29 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(rw):=20close=20a=20link=20di?=
+ =?UTF-8?q?rectory=20an=20ACL=20opened=20(#898)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112940
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/21bc250542497ff2d74151cdf7f98069d929465a]
+
+Backport Changes:
+- Apply POSIX inherited-ACL tightening to _rw_security.py, where
+  the preceding backport keeps its private-directory helpers.
+- Adapt the ACL regressions to the dedicated security test file,
+  persistent connection lifetime and pytest monkeypatch fixture.
+- Omit the standalone changelog fragment, which is absent from the
+  3.25.2 source archive.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_rw_security.py      | 16 +++++++++++++++-
+ tests/test_read_write_security.py | 38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 53 insertions(+), 1 deletion(-)
+
+diff --git a/src/filelock/_rw_security.py b/src/filelock/_rw_security.py
+index 82b5803..f02c4bf 100644
+--- a/src/filelock/_rw_security.py
++++ b/src/filelock/_rw_security.py
+@@ -282,9 +282,23 @@ def _link_beside(  # pragma: needs posix-hard-link
+     try:
+         made: Final = os.fstat(fd)
+         # Whoever can rename in the parent can put another directory under the new name before it opens.
+-        if made.st_uid != owner or made.st_mode & 0o077:
++        loose: Final = made.st_mode & 0o077
++        if made.st_uid != owner or (loose and os.listdir(fd)):
+             msg = f"link directory {os.fspath(path)!r} was replaced while opening"
+             raise OSError(msg)
++        # An inherited ACL, such as an NFSv4 one on ZFS, overrides the mode mkdtemp asks for. Only an empty directory
++        # is tightened, so one swapped in with contents is still refused above.
++        if loose:
++            msg = (
++                f"link directory {os.fspath(path)!r} stays open to other accounts through an inherited ACL"
++                f" that chmod 0700 cannot close; make {os.fspath(parent)!r} writable by its owner only"
++            )
++            try:
++                os.fchmod(fd, 0o700)
++            except PermissionError as exc:  # ZFS with aclmode=restricted refuses a chmod on a non-trivial ACL
++                raise OSError(msg) from exc
++            if os.fstat(fd).st_mode & 0o077:
++                raise OSError(msg)
+         link: Final = _LinkDirectory(path, (made.st_dev, made.st_ino), secrets.token_hex(8))
+         try:
+             os.mkdir(link.name, 0o700, dir_fd=fd)
+diff --git a/tests/test_read_write_security.py b/tests/test_read_write_security.py
+index 992cd75..4d0a6ae 100644
+--- a/tests/test_read_write_security.py
++++ b/tests/test_read_write_security.py
+@@ -335,6 +335,44 @@ def test_wal_mode_database_is_refused(tmp_path: Path) -> None:
+         ReadWriteLock(database, is_singleton=False)
+ 
+ 
++@pytest.fixture
++def loosened_directories(monkeypatch: pytest.MonkeyPatch) -> list[Path]:
++    directories: list[Path] = []
++    mkdtemp = _rw_security.tempfile.mkdtemp
++    def create_with_group_access(*, prefix: str, dir: Path) -> str:
++        # Stands in for an inheritable ACL entry that grants the group access to every new directory.
++        directory = Path(mkdtemp(prefix=prefix, dir=dir))
++        directory.chmod(0o770)
++        directories.append(directory)
++        return str(directory)
++    monkeypatch.setattr(_rw_security.tempfile, "mkdtemp", create_with_group_access)
++    return directories
++
++
++def test_private_link_closes_a_mode_an_inherited_acl_opened(
++    shared_database: Path, loosened_directories: list[Path]
++) -> None:
++    lock = ReadWriteLock(shared_database, is_singleton=False)
++    try:
++        with lock.read_lock():
++            assert [directory.stat().st_mode & 0o777 for directory in loosened_directories] == [0o700]
++    finally:
++        lock.close()
++
++
++@pytest.mark.parametrize("refused", [False, True])
++def test_private_link_refuses_a_directory_chmod_cannot_close(
++    shared_database: Path, loosened_directories: list[Path], monkeypatch: pytest.MonkeyPatch, refused: bool
++) -> None:
++    def fchmod(fd: int, mode: int) -> None:
++        if refused:
++            raise PermissionError("Operation not permitted")
++    monkeypatch.setattr(os, "fchmod", fchmod)
++    with pytest.raises(OSError, match="writable by its owner only"):
++        ReadWriteLock(shared_database, is_singleton=False)
++    assert len(loosened_directories) == 1
++
++
+ def _fail_opened_database_fstat(database: Path, monkeypatch: pytest.MonkeyPatch) -> list[int]:
+     opened: list[int] = []
+     real_open = os.open
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 4f059e438e..6f52b19272 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -16,6 +16,8 @@ SRC_URI += " file://run-ptest \
     file://CVE-2026-112909_p2.patch \
     file://CVE-2026-112936.patch \
     file://CVE-2026-112915.patch \
+    file://CVE-2026-112940_p1.patch \
+    file://CVE-2026-112940_p2.patch \
 "
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
@@ -28,6 +30,7 @@ DEPENDS += "\
 "
 
 RDEPENDS:${PN} += " \
+    python3-crypt \
     python3-ctypes \
     python3-core \
     python3-logging \
-- 
2.35.6
