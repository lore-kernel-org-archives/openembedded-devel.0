Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3364.1794374983916368146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hm6S6nlU;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15187; q=dns/txt;
  s=iport01; t=1794374984; x=1795584584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fDJukE3FBwP4GfwfI45J8y5RekQ3PP8r42m6Qr/bRXo=;
  b=hm6S6nlUfKb2wgnC57UZHC7Xcqr62LNVacrlCimy2dOkyxlMmzcKu1iV
   qfylgpbuB5HiMh7PPqY8/t7mjQrF2b+cjJrNtS77gDUBxKDZIs1PJku9X
   czkSlNUJe1j1kiY4HQAB4nHNSD4CjI/dw3DOpXB/Of5GoYFeMNOHv/8GO
   YrFgdAZqYlLVU1322WdyszTRqfBLqNpRN6Ncp0jmLsiHYDoVcHrn4AXSp
   LldKEs0vFSu3leAktCRK/lyusuYo4Nxop0kfYBk2Om717qfPoNofjxURp
   PxzaugscstDrDsz13VK5cTBjeR9/7AGjbTmcNc9Mu5HVSJu1XSfs0nteB
   w==;
X-CSE-ConnectionGUID: mG1Jr12xQ6WjqY2BgXstUQ==
X-CSE-MsgGUID: x+NliCO3SKKYgFkwmWjvzQ==
X-IPAS-Result: =?us-ascii?q?A0BQAgDN/PNq/4z/Ja1RAQiCWYJXdWBDSQOEVJF0A4tlh?=
 =?us-ascii?q?WeMVoF+DwEBAQ9EDQQBAYQ/RgKOHgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAEtEBwDAQIDAiYCAiALHQEFC?=
 =?us-ascii?q?BAJgwIBgjoDNwMRBrlYen8zgQGDKQGBVNhMDYJaAQsUAYEKLoVCgwAgAYUDX?=
 =?us-ascii?q?RgBRIQ5JxsbgXKBFYNpgQWBGkICAoEyBAGEA4JIIgSCDRV6EoFagQIHghuDG?=
 =?us-ascii?q?AOGWwKBT4clSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGBYEcg?=
 =?us-ascii?q?R6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRLDcVGQQ9AW4Hk?=
 =?us-ascii?q?m6CdR8BFkMiEwEHHwMCFRolMQxbGScPEykDkmcCkB6CIaAgcQoog3iMJI8+h?=
 =?us-ascii?q?XwaM4QElBqSVAuYfY4KhAqRXxtNhGqBaDxGgRNwFTuCZwlKGQ+OKw4Lg2CFE?=
 =?us-ascii?q?8lIJjICCQMvAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:j2hACa68we1ivmt/kZQKAwxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 msbCm/VOf6IYGumfY10bInl9RgO75KEztJjGQBsqHs8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztNsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eOKJB2PwuW3F3q
 8MaMQFXRB+znP6L+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeJJIHQFJ0Oxi50o
 ErWvEL9Azo9b+e86guK3HGzg9DNgzHCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:dIs/GK0tMdEFHbD0jX5cUgqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZImPH7P+VEssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCZgguVxehZhOOIqQEIWReOk9K1vp
 0PT0ERMrHN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:XeNxhW8WoCNSNAix3lmVv0s7Q+I/KyfN9SnvIVaJU0xmeKaJdGbFrQ==
X-Talos-MUID: 9a23:wrciWwpCnUZXQ2l7UYAezyEhEsNpyIP1M2MuoJoouNaBCi5uKQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546529030"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 4FD96180001C8;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B6740CBF21E; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 5/9] python3-filelock: fix CVE-2026-112915
Date: Tue, 10 Nov 2026 21:29:34 -0800
Message-Id: <20261111052938.3691463-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132117
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the schema-work guards from [1], as identified by advisory
[2]. Bound SQLite schema size and query work before acquisition so a
crafted lock database cannot cause unbounded schema processing.

Retain 3.25.2's persistent connections and timeout behavior. Use the
SQLite limits available in Wrynose's Python 3.14, disable statement
caching for guarded work and retain both upstream malformed-schema
regressions. The shared-path changes follow in the CVE-2026-112940 fix.

[1] https://github.com/tox-dev/filelock/commit/5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d
[2] https://github.com/tox-dev/filelock/security/advisories/GHSA-cwqr-hh33-gh44

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-112915.patch    | 280 ++++++++++++++++++
 .../python/python3-filelock_3.25.2.bb         |   1 +
 2 files changed, 281 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112915.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112915.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112915.patch
new file mode 100644
index 0000000000..47aa3a3aba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112915.patch
@@ -0,0 +1,280 @@
+From 5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 03:39:07 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(read-write):=20keep=20SQLite?=
+ =?UTF-8?q?=20off=20shared=20names,=20bound=20schema=20(#834)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112915
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/5e3f2ec0c5fb17cb2635b60b2b68bc63ab81ca2d]
+
+Backport Changes:
+- Split the schema-loading guard from the shared-path changes,
+  which are applied separately for CVE-2026-112940.
+- Place the guard in _rw_security.py and wrap the existing 3.25.2
+  configure/begin path instead of newer operation-context classes.
+- Keep the per-instance connection and existing timeout semantics.
+- Disable statement caching so guarded statements are prepared
+  within the schema budget.
+- Use sqlite3.Connection.setlimit supplied by Wrynose Python 3.14;
+  this ReadWriteLock backport requires Python 3.11 or newer.
+- Retain both upstream malformed-schema fixtures in the dedicated
+  regression file and explicitly close persistent connections.
+- Omit unrelated path, Windows, fork and coverage-task changes
+  from this split patch; applicable path changes follow separately.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_read_write.py       |  45 ++++++-------
+ src/filelock/_rw_security.py      |  34 ++++++++--
+ tests/test_read_write_security.py | 101 ++++++++++++++++++++++++++++++
+ 3 files changed, 154 insertions(+), 26 deletions(-)
+
+diff --git a/src/filelock/_read_write.py b/src/filelock/_read_write.py
+index e8b6420..66a4664 100644
+--- a/src/filelock/_read_write.py
++++ b/src/filelock/_read_write.py
+@@ -13,7 +13,7 @@ from weakref import WeakValueDictionary
+ 
+ from ._api import AcquireReturnProxy
+ from ._error import Timeout
+-from ._rw_security import canonical, connect
++from ._rw_security import bounded_schema, canonical, connect
+ 
+ if TYPE_CHECKING:
+     from collections.abc import Generator
+@@ -189,27 +189,28 @@ class ReadWriteLock(metaclass=_ReadWriteLockMeta):
+     def _configure_and_begin(
+         self, mode: Literal["read", "write"], timeout: float, *, blocking: bool, start_time: float
+     ) -> None:
+-        waited = time.perf_counter() - start_time
+-        timeout_ms = timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)
+-        self._con.execute(f"PRAGMA busy_timeout={timeout_ms};").close()
+-        # Use legacy journal mode (not WAL) because WAL does not block readers when a concurrent EXCLUSIVE
+-        # write transaction is active, making read-write locking impossible without modifying table data.
+-        # MEMORY is safe here since no actual writes happen — crashes cannot corrupt the DB.
+-        # See https://sqlite.org/lang_transaction.html#deferred_immediate_and_exclusive_transactions
+-        #
+-        # Set here (not in __init__) because this pragma itself may block on a locked database,
+-        # so it must run after busy_timeout is configured above.
+-        self._con.execute("PRAGMA journal_mode=MEMORY;").close()
+-        # Recompute remaining timeout after the potentially blocking journal_mode pragma.
+-        waited = time.perf_counter() - start_time
+-        if (recomputed := timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)) != timeout_ms:
+-            self._con.execute(f"PRAGMA busy_timeout={recomputed};").close()
+-        stmt = "BEGIN EXCLUSIVE TRANSACTION;" if mode == "write" else "BEGIN TRANSACTION;"
+-        self._con.execute(stmt).close()
+-        if mode == "read":
+-            # A SELECT is needed to force SQLite to actually acquire the SHARED lock on the database.
+-            # https://www.sqlite.org/lockingv3.html#transaction_control
+-            self._con.execute("SELECT name FROM sqlite_schema LIMIT 1;").close()
++        with bounded_schema(self._con, self.lock_file):
++            waited = time.perf_counter() - start_time
++            timeout_ms = timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)
++            self._con.execute(f"PRAGMA busy_timeout={timeout_ms};").close()
++            # Use legacy journal mode (not WAL) because WAL does not block readers when a concurrent EXCLUSIVE
++            # write transaction is active, making read-write locking impossible without modifying table data.
++            # MEMORY is safe here since no actual writes happen — crashes cannot corrupt the DB.
++            # See https://sqlite.org/lang_transaction.html#deferred_immediate_and_exclusive_transactions
++            #
++            # Set here (not in __init__) because this pragma itself may block on a locked database,
++            # so it must run after busy_timeout is configured above.
++            self._con.execute("PRAGMA journal_mode=MEMORY;").close()
++            # Recompute remaining timeout after the potentially blocking journal_mode pragma.
++            waited = time.perf_counter() - start_time
++            if (recomputed := timeout_for_sqlite(timeout, blocking=blocking, already_waited=waited)) != timeout_ms:
++                self._con.execute(f"PRAGMA busy_timeout={recomputed};").close()
++            stmt = "BEGIN EXCLUSIVE TRANSACTION;" if mode == "write" else "BEGIN TRANSACTION;"
++            self._con.execute(stmt).close()
++            if mode == "read":
++                # A SELECT is needed to force SQLite to actually acquire the SHARED lock on the database.
++                # https://www.sqlite.org/lockingv3.html#transaction_control
++                self._con.execute("SELECT name FROM sqlite_schema LIMIT 1;").close()
+ 
+     def _acquire(self, mode: Literal["read", "write"], timeout: float, *, blocking: bool) -> AcquireReturnProxy:
+         opposite = "write" if mode == "read" else "read"
+diff --git a/src/filelock/_rw_security.py b/src/filelock/_rw_security.py
+index 6916212..9e4f92f 100644
+--- a/src/filelock/_rw_security.py
++++ b/src/filelock/_rw_security.py
+@@ -7,10 +7,13 @@ import stat
+ import sys
+ import threading
+ from collections import deque
+-from contextlib import suppress
++from contextlib import contextmanager, suppress
+ from dataclasses import dataclass, field
+ from itertools import count
+-from typing import NamedTuple
++from typing import TYPE_CHECKING, NamedTuple
++
++if TYPE_CHECKING:
++    from collections.abc import Generator
+ 
+ _DatabaseIdentity = tuple[int, int]
+ _DB_OPEN_FLAGS = os.O_RDWR | os.O_CREAT | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_NONBLOCK", 0)
+@@ -154,14 +157,14 @@ def _open_lock_database(database: str) -> tuple[int, _DatabaseIdentity]:
+ def connect(database: str) -> sqlite3.Connection:
+     if sys.platform == "win32":
+         # Windows handle hardening is not part of the POSIX recipe backport.
+-        return sqlite3.connect(database, check_same_thread=False)
++        return sqlite3.connect(database, check_same_thread=False, cached_statements=0)
+     claimed: list[_Probe] = []
+     try:
+         if (probe := _PROBE_DESCRIPTORS.adopt(database, claimed)) is None:
+             fd, identity = _open_lock_database(database)
+             probe = _PROBE_DESCRIPTORS.retain(fd, identity, claimed)
+         _PROBE_DESCRIPTORS.drain()
+-        connection = sqlite3.connect(f"{_FD_DIR}/{probe.fd}", check_same_thread=False, factory=_Connection)
++        connection = sqlite3.connect(f"{_FD_DIR}/{probe.fd}", check_same_thread=False, factory=_Connection, cached_statements=0)
+         connection._probe = probe
+         connection.database_identity = probe.identity
+         claimed.clear()
+@@ -169,3 +172,26 @@ def connect(database: str) -> sqlite3.Connection:
+     finally:
+         for probe in claimed:
+             _PROBE_DESCRIPTORS.release(probe)
++
++
++@contextmanager
++def bounded_schema(connection: sqlite3.Connection, database: str) -> Generator[None]:
++    # The first statement loads the file's complete schema, which no timeout bounds, and a lock database has none.
++    # Waiting for a lock runs no virtual machine steps, so a step budget bounds only that load.
++    calls = count()
++    max_calls = 10
++    connection.setlimit(sqlite3.SQLITE_LIMIT_LENGTH, 4096)
++    connection.set_progress_handler(lambda: next(calls) >= max_calls, 1000)
++    try:
++        yield
++    except sqlite3.DatabaseError as error:
++        # An interrupted schema load reports a malformed schema rather than the interrupt.
++        if isinstance(error, sqlite3.DataError) or next(calls) > max_calls:
++            msg = (
++                f"refusing a lock database whose schema is too large to load: {database!r}; "
++                "give ReadWriteLock a file of its own"
++            )
++            raise ValueError(msg) from error
++        raise
++    finally:
++        connection.set_progress_handler(None, 0)
+diff --git a/tests/test_read_write_security.py b/tests/test_read_write_security.py
+index e2b862a..a995c80 100644
+--- a/tests/test_read_write_security.py
++++ b/tests/test_read_write_security.py
+@@ -2,6 +2,8 @@ from __future__ import annotations
+ 
+ import errno
+ import os
++import struct
++from typing import Literal
+ import subprocess
+ import sys
+ from pathlib import Path
+@@ -65,6 +67,105 @@ def test_closing_a_peer_keeps_another_connections_lock(tmp_path: Path) -> None:
+         holder.close()
+ 
+ 
++_PAGE_SIZE = 4096
++
++
++_TABLE_LEAF_PAGE = 0x0D
++
++
++@pytest.mark.timeout(60)
++@pytest.mark.parametrize("mode", [pytest.param("read", id="read"), pytest.param("write", id="write")])
++def test_read_write_lock_refuses_a_schema_that_never_finishes_loading(
++    tmp_path: Path, mode: Literal["read", "write"]
++) -> None:
++    # Every interior page leads to the next one through each of its 660 cells, so the schema has 661**4 rows to scan.
++    database = tmp_path / "lock.db"
++    pages = [
++        _btree_page(
++            0x05,  # table interior page
++            struct.pack(">IB", number + 1, 1),
++            660,
++            right_child=struct.pack(">I", number + 1),
++            header_at=100 if number == 1 else 0,
++        )
++        for number in range(1, 5)
++    ]
++    pages.append(_btree_page(_TABLE_LEAF_PAGE, bytes([6, 1, 6, 0, 0, 0, 0, 0]), 1))
++    pages[0][:100] = _file_header(len(pages))
++    database.write_bytes(b"".join(pages))
++    lock = ReadWriteLock(database, is_singleton=False)
++
++    try:
++        with pytest.raises(ValueError, match="schema"):
++            (lock.acquire_read if mode == "read" else lock.acquire_write)(timeout=1)
++    finally:
++        lock.close()
++
++
++@pytest.mark.parametrize("mode", [pytest.param("read", id="read"), pytest.param("write", id="write")])
++def test_read_write_lock_refuses_a_schema_row_longer_than_a_lock_needs(
++    tmp_path: Path, mode: Literal["read", "write"]
++) -> None:
++    # The row's text continues on an overflow page that names itself as the next one, so one page of disk reads as a
++    # megabyte, far more schema text than a lock database holds and below SQLite's one-billion-byte string limit.
++    long_sql_length = 1_000_000
++    database = tmp_path / "lock.db"
++    statement = b"CREATE TABLE application (value) --"
++    columns = [b"table", b"application", b"application", b"\x02"]
++    serial_types = [13 + 2 * len(column) for column in columns[:3]] + [1, 13 + 2 * long_sql_length]
++    record_header = b"".join(_varint(serial_type) for serial_type in serial_types)
++    record_start = _varint(len(record_header) + 1) + record_header + b"".join(columns) + statement
++    record_length = len(record_start) + long_sql_length - len(statement)
++    # How much of an overflowing record a table leaf keeps on its own page.
++    local = (minimum := (_PAGE_SIZE - 12) * 32 // 255 - 23) + (record_length - minimum) % (_PAGE_SIZE - 4)
++    cell = _varint(record_length) + _varint(1) + record_start.ljust(local, b"-") + struct.pack(">I", 2)
++    leaf = _btree_page(_TABLE_LEAF_PAGE, cell, 1, header_at=100)
++    page_count = long_sql_length // _PAGE_SIZE + 2
++    leaf[:100] = _file_header(page_count)
++    database.write_bytes(leaf + struct.pack(">I", 2).ljust(_PAGE_SIZE, b"-"))
++    # SQLite refuses a record longer than the file, which a hole stretches at no cost.
++    os.truncate(database, page_count * _PAGE_SIZE)
++    lock = ReadWriteLock(database, is_singleton=False)
++
++    try:
++        with pytest.raises(ValueError, match="schema"):
++            (lock.acquire_read if mode == "read" else lock.acquire_write)(timeout=1)
++    finally:
++        lock.close()
++
++
++def _btree_page(kind: int, cell: bytes, cell_count: int, *, right_child: bytes = b"", header_at: int = 0) -> bytearray:
++    page = bytearray(_PAGE_SIZE)
++    cell_at = _PAGE_SIZE - len(cell)
++    page[cell_at:] = cell
++    # Every slot of the cell pointer array names the one cell.
++    header = struct.pack(">BHHHB", kind, 0, cell_count, cell_at, 0) + right_child
++    pointers = struct.pack(">H", cell_at) * cell_count
++    page[header_at : header_at + len(header) + len(pointers)] = header + pointers
++    return page
++
++
++def _file_header(page_count: int) -> bytes:
++    # Rollback journal format, a matching change counter and version-valid-for, so SQLite trusts the page count.
++    return struct.pack(
++        ">16sH6B12I20s2I",
++        b"SQLite format 3\0",
++        _PAGE_SIZE,
++        *(1, 1, 0, 64, 32, 32),
++        *(1, page_count, 0, 0, 1, 4, 0, 0, 1, 0, 0, 0),
++        b"",
++        1,
++        3040001,
++    )
++
++
++def _varint(value: int) -> bytes:
++    groups = [value & 0x7F]
++    while value := value >> 7:
++        groups.insert(0, value & 0x7F | 0x80)
++    return bytes(groups)
++
++
+ def _fail_opened_database_fstat(database: Path, monkeypatch: pytest.MonkeyPatch) -> list[int]:
+     opened: list[int] = []
+     real_open = os.open
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index db7f9187de..4f059e438e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -15,6 +15,7 @@ SRC_URI += " file://run-ptest \
     file://CVE-2026-112909_p1.patch \
     file://CVE-2026-112909_p2.patch \
     file://CVE-2026-112936.patch \
+    file://CVE-2026-112915.patch \
 "
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
-- 
2.35.6
