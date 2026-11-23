Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53674.1795440983387419496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YJdAg45V;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25382595e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795440981; x=1796045781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBQg5BRaoInmeGMYzORzVNOFXN9fVNzHptGpELBQAvk=;
        b=YJdAg45VplKeVPf0K4yu38AfFDP3bVL3qXAGPr14OdrCW+dw9LncobSOce8hTGganV
         rB2UwxT3xjHi5z3C03ztqPuec2IhxIoU/S7Fdes+J+UA+cArCi102QvrAzi/r1OsUYR8
         jTP82ejZ4egeGPjThzvKzjLJ3rHu9IuZn/LDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440981; x=1796045781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBQg5BRaoInmeGMYzORzVNOFXN9fVNzHptGpELBQAvk=;
        b=eGINq/gpTI1jggIV07RR9JQdjeMTvY+BycNAPFr1spMQO8B5BgawaoLWHuxYv7Ee1y
         ZlX9u9b6nHvsgEEwoJA4l70cdR68KmXLRqdY1bnTthqw5QZoclvsnZ/QQYt2rle/cfic
         RSAmIK1HvApVClTgmYJ22uYeq/qOODLjOfTJcFy0xuORMfvOzVJZorGACVB4ly2ELFya
         4RiDQ6iJ3JDSXIP1tM4M3K3rqdsHzuCKIGSLZWtgNPhRqvpkeuliTu+uyCphdVKmg7Vs
         i1Rq0AeUlxpTjvSlsV1HvqfxW0Qw1CM6UA0qpIZSO2bWHE7UCSVrh6d5dPb6P9sYZaT9
         c9+A==
X-Gm-Message-State: APuU4Z8EXggR9qrGSGoyTlftSbiaTLPhEFOf8p7p+3G7AWQ54xpPJGug
	xvnPzdnw0DDxQdaL3QSftiflcs95jJRQkwlaUVLAyWodPw+G3BUV+KwO4wic7gHlAyLZTnrkQgi
	L5huN
X-Gm-Gg: AZFdTZfbMZ0H9D0dTZ57I0ZrN8K7gHenIrgA57oECdDU61FlwWRiQ+GAxQucMQ95sIa
	y3xhxSY0X0VpphLjB3mBGnm+3VJpU2+FPAzp5+CxRBHcqKQyW77qvMwiMd2GZe2t610ZNpYzQVb
	PRTBR9vDhth2LmwypNPLskKeL39g+xhXoQQMkz0WloyN6JLvTS5orTTs3TbDbJkQ6AJNh4GQnEE
	z7bgl1ywPbJcd7beo6nWYBgPp7xVOSk/kojVyARNLWt5i4mbIUtksMjZltFsx72bC8V2apZd5Zh
	CgJNGaKKNyQKSv7ooxdSk1NjFFYtghrdK5oBo0c+6/7PxeZZqGlT0FzoUKKiKRJzK4oVAbrvT97
	idhXHodIbaSsW1ukZY1BvVOTBGTPqpqCP9/kxqW0iGCb+mAkx12bCnRS+xnxDeFMWGdyH4anMox
	uzZY26SAvduUvqcyIHWYsTs8iyhaODSe5W7W5E9fq6LIQk9VSnU7coQU/BC/+mChZAXHHdsBt9/
	ZJQ4qrOCDlHEXcqtQGA3B1ZpAlMojjcMCDL6rdeZ87yQIIa2ezoagg+6CLlySuo4svhQyEWGniZ
	hCpBLoBTR5YyYMP29Zuu56O+MvzzLMkJ14A4v4cckVn+07pfFlD0fNA45D5JmS9ou8j9ggWaH4m
	Jb0yPfCTyBXLDtKO24tvHOxLAjq61zaB1xoqPkG/fdqqC/BlPvd/Jlw==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr258494135e9.22.1795440981069;
        Mon, 23 Nov 2026 05:36:21 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25192365f8f.24.2026.11.23.05.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-filelock: Upgrade 4.2.12 -> 4.3.0
Date: Mon, 23 Nov 2026 15:36:13 +0200
Message-ID: <20261123133617.3614096-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123133617.3614096-1-leon.anavi@konsulko.com>
References: <20261123133617.3614096-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132890
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.3.0:

Features:

- On Windows, release_with_timeout limits the caller's wait for
  release. If it raises ReleasePendingError, call wait on the
  exception from any thread for the result. On POSIX, release is
  synchronous.

Bug fixes:

- lock_descriptor raises TypeError unless blocking is a bool.
- On POSIX filesystems with atomic exchange, SoftFileLock restores
  a live marker after an interrupted exchange and removes its own
  unfinished marker during cleanup.
- Unix soft fallback markers exclude group and other writes even on
  filesystems without atomic exchange.
- SoftFileLock, MarkerSoftFileLock and SoftFileLease remove empty
  markers after a signal interrupts marker creation or stale-marker
  replacement.
- Unix locks select the soft fallback per resolved path, including
  after a directory change. The lock keeps its Unix type and
  supports pid, is_lock_held_by_us, break_lock() and lifetime
  during fallback.
- On POSIX, ReadWriteLock and AsyncReadWriteLock raise RuntimeError
  in detected subinterpreters, including InterpreterPoolExecutor
  workers and mod_wsgi or uWSGI subinterpreters. Use the main
  interpreter or a separate process. Detection on embedded CPython
  3.11 requires _xxsubinterpreters or ctypes access to the
  interpreter C API.
- On Windows, SoftFileLock treats a symlink as an occupied marker
  and leaves its target untouched.
- SoftFileLock and SoftFileLease clean up markers and descriptors
  across interrupted acquires and releases. POSIX unlink errors
  propagate, with a retry after close on filesystems that require
  it. Retry release if a timeout interrupts restoration of a
  displaced marker.
- A singleton shared by relative and absolute paths refuses
  acquisition if a directory change redirects its stored lock path.
- ReadWriteLock raises RuntimeError if a directory change redirects
  a singleton's cached database path.
- SoftFileLock, MarkerSoftFileLock and SoftFileLease remove their
  pending recovery marker even if another process replaces the
  break name during rollback.
- Single-threaded SQLite read and write lock waits allow Python
  signal handlers to run. Waiting writers keep their place ahead of
  new readers.
- On POSIX, SoftFileLock tries to leave a one-byte recovery record
  if a full filesystem prevents marker cleanup. With atomic
  exchange, a later caller can reclaim it when space is available.
- Windows soft-lock recovery no longer reads proc/self/ns/pid from
  the drive root when identifying a marker's host.
- On Unix filesystems without flock, waiters can reclaim an
  interrupted acquire's recovery marker after two seconds if atomic
  exchange and space for the marker are available.
- SoftReadWriteLock recreates a missing generation directory during
  read or write acquisition, even if a holder record survives.
- On POSIX, soft locks close the inspection descriptor if opening
  an existing marker is interrupted.
- Unix locks can use the soft fallback when the directory denies
  the temporary probe and atomic exchange is unavailable. If native
  locking works there, new lock files exclude group and other
  writes by default. Set mode=0o660 for group sharing. The probe
  removes its temporary name before testing and closes its
  descriptor on interruption.
- ReadWriteLock prevents database redirection in shared, non-sticky
  directories by placing its hard link in a fresh private
  directory. Cleanup recognizes older link layouts.
- AsyncFileLock, AsyncReadWriteLock and AsyncSoftReadWriteLock
  discard executor calls whose submission failed. A queued release
  can no longer drop a later task's lock.
- SoftReadWriteLock scans up to 256 orphan holder records and 256
  temporary files per sweep, resuming where it stopped. Each
  listing removes up to 256 obsolete generations. The lock raises a
  protocol error above 65,536 generation entries.
- SoftReadWriteLock uses fixed-size fingerprints to bound memory
  use per holder record during cleanup.
- StrictSoftFileLock backs off above 1,024 public claims and raises
  SoftFileLockProtocolError above 16,380 directory entries before
  publication. Sentinel cleanup counts only the lock's own records.
- StrictSoftFileLock creates sentinels and claims without group or
  other write permissions. Run chmod go-w on older writable
  sentinels. On Linux, a contender waits if fs.protected_hardlinks
  prevents it from probing another account's claim.
- Timeout and lock_path_occupant now escape control characters and
  other bytes outside printable non-space ASCII in recorded
  hostnames and @gaborbernat.
- A SoftReadWriteLock heartbeat checks the holder token before
  writing. If another file replaces the record and reuses its
  inode, the lock reports a lost hold.
- A SoftReadWriteLock waiter paused past stale_threshold gets a
  fresh token so cleanup of its old record cannot remove the new
  hold.
- A failed acquire rolls back its own nesting level. Releasing that
  level from a hook or signal handler raises RuntimeError. Balanced
  nested holds still work. Retrying an interrupted release on a
  shared instance affects only the original hold. An indefinite
  acquire raises RuntimeError if a signal handler returns holding
  the same path through another instance.
- A forked child with its parent's numeric PID in another Linux PID
  namespace preserves the parent's locks and private SQLite
  database link.
- After an ambiguous Unix unlock error, FileLock rejects reentrant
  acquires until an explicit release() retry resolves the hold.
- Async reader/writer wrappers sharing a lock serve waiting writers
  in arrival order, ahead of new readers. Returning writers rejoin
  at the back.
- At interpreter exit, SoftReadWriteLock keeps holds owned by live
  daemon threads. AsyncSoftReadWriteLock keeps holds whose event
  loops are still running.
- Canceling an AsyncFileLock release still decrements the lock
  counter after the active transition finishes.
- Closing an async reader/writer wrapper stops its contended
  acquires on the next poll, even if another singleton wrapper is
  waiting.
- Closing an async reader/writer wrapper wakes tasks waiting on
  that wrapper even if another singleton wrapper holds the lock.
- During shutdown, another thread's release(force=True) preserves
  the main thread's thread-local hold, including during atexit
  callbacks.
- If an async reader/writer acquire succeeds during close, it waits
  for close to finish. A successful close releases the hold and the
  acquire raises the closed error. If close fails while the lock is
  held, the task receives the hold.
- In a sticky Unix directory such as /tmp, ReadWriteLock raises
  PermissionError unless the caller or directory owner owns the
  database and @gaborbernat.
- In sticky directories, locks reject files and protocol
  directories whose ownership is ambiguous because Linux reports
  the overflow UID.
- Linux accounts without CAP_FOWNER can use their own native,
  strict soft and soft reader/writer locks in sticky directories
  even with an overflow UID or unreadable procfs. This includes
  OverlayFS containers. Use a private directory if ownership cannot
  be verified.
- Linux soft locks ignore a mounted-over boot ID and compare
  process start times, preserving live markers across mounts.
- On Linux, ReadWriteLock and AsyncReadWriteLock honor the acquire
  timeout without busy-waiting on a leased database. Nonblocking
  acquires return promptly.
- On Linux, SoftFileLock, MarkerSoftFileLock and SoftFileLease use
  only the PID to check liveness when the holder or contender sees
  another PID namespace's /proc. This preserves live markers.
- On Linux, a soft lock held by a worker thread no longer admits
  another holder when the main thread exits inside a time namespace.
- On POSIX and Windows, ReadWriteLock opens its database through a
  private hard link if a -journal, -wal or -shm file already
  exists, preventing replay of a leftover journal.
- On POSIX systems with atomic name exchange, SoftFileLock
  preserves the live holder's marker when recovery encounters
  another account's record in a sticky directory.
- On POSIX systems with atomic name exchange, SoftFileLock waits
  for a live stale-lock breaker before recovering its marker.
- On POSIX, StrictSoftFileLock rejects another account's
  compatibility sentinel in a sticky directory, preserving
  exclusion with SoftFileLock.
- On POSIX, ReadWriteLock and AsyncReadWriteLock preserve mutual
  exclusion if their private link disappears before SQLite opens
  it. Linux cleanup preserves peer links when procfs cannot
  identify their PID namespace.
- On POSIX, ReadWriteLock and AsyncReadWriteLock remove dead
  holders' empty link directories after verifying the link belongs
  to the current database.
- On POSIX, SoftFileLease now reports a missing marker when another
  hard link keeps its old inode alive.
- On POSIX, SoftFileLease records claim loss detected during
  release in compromise. Only the heartbeat thread calls
  on_compromise.
- On Windows, ReadWriteLock rejects junctions in its private
  database alias path and prevents directory renames until SQLite
  opens the database.
- On Windows, SoftFileLock rechecks its acquire deadline after each
  half-second attempt to rename a stale marker held by a reader's
  oplock.
- On Windows, StrictSoftFileLock honors its acquire timeout when an
  oplock blocks the sentinel. On Linux, a sentinel lease counts as
  contention after a short grace period, including for
  blocking=False.
- On Windows, StrictSoftFileLock honors the acquire timeout while
  pinning directories, publishing claims or withdrawing after a
  lost race. A worker finishes delayed withdrawal. Interrupted
  publication can leave private records requiring manual removal.
  Release waits for Windows to close both public claims.
- On macOS and systems with CLOCK_BOOTTIME, SoftReadWriteLock
  includes system sleep when checking waiter leases and renews
  expired tokens before entry.
- Outside Windows, StrictSoftFileLock rejects a directory with
  unrelated entries at a protocol path and preserves its
  permissions and contents.
- Under a sticky parent, SoftReadWriteLock rejects a <path>.rw
  tree, gen or holders writable by other accounts and rechecks
  subdirectory ownership on open. Remove unsafe trees so the lock
  can recreate them privately.
- AsyncReadWriteLock can close after the default executor shuts
  down. Closing either async reader/writer lock again after a
  canceled close waits for its worker to exit.
- AsyncSoftReadWriteLock uses a private worker by default, so a
  blocked acquire cannot delay unrelated releases. Awaiting close()
  joins the worker.
- ReadWriteLock and AsyncReadWriteLock reject an acquire if SQLite
  switches to WAL mode after the header check.
- ReadWriteLock and AsyncReadWriteLock reject unsupported SQLite
  file-format versions that could undermine write locking.
- ReadWriteLock and AsyncReadWriteLock reject write locks on
  read-only SQLite connections.
- SoftFileLease and AsyncSoftFileLease reject reentrant acquisition
  after the heartbeat detects a lost claim. Release the lost hold
  before acquiring again.
- SoftReadWriteLock and AsyncSoftReadWriteLock limit generation
  scans during acquire. Release raises a protocol error if it
  cannot withdraw the holder before its stale threshold.
- SoftReadWriteLock and AsyncSoftReadWriteLock preserve active
  readers when a delayed writer tries to reuse the first
  generation. Acquires retry if the log resets before publication.

Documentation:

- A forked child closes the inherited FileLock descriptor. Daemons
  must create and acquire a new lock after forking.
- Explain how to reacquire a Windows SoftFileLock when marker
  deletion is still pending after release.
- Document how to recover a soft lock when a process reuses the PID
  of a dead breaker.
- The API reference now documents lock policy types, acquisition
  proxies, reader/writer settings and asyncio lock contexts.

Security:

- ReadWriteLock and AsyncReadWriteLock limit SQLite schema loading.
  Acquiring a database with a large schema can raise ValueError.
- ReadWriteLock and AsyncReadWriteLock limit the directory entries
  scanned for dead holders when opening a connection.
- A failed AsyncReadWriteLock construction no longer prevents a
  forked child from resetting other locks.
- Canceling an AsyncReadWriteLock acquire on Windows now ends its
  wait for a database oplock.
- On Unix, acquiring a lock with an on_acquired callback raises
  PermissionError when the lock file has another hard link and
  another account can write its directory. Without a callback, or
  in a directory only the caller can write, hard-linked lock names
  still share the same native lock and @gaborbernat.
- On Windows, StrictSoftFileLock skips abandoned private records to
  avoid waiting on reader oplocks. For manual cleanup, see
  how-to:Use fail-closed soft locks.
- On Windows, FileLock treats a pending oplock break as contention
  until the acquire deadline. acquire(blocking=False) raises
  Timeout immediately.
- Strict locks publish hard links without following symlinks even
  when the filesystem capability probe cannot run.

Performance:

- SoftReadWriteLock reuses the generation directory handle to
  reduce ownership checks during write acquisition and release.
- Reduce the cost of reentrant acquire and release.
- Speed up stale lock recovery for SoftFileLock in directories with
  many unrelated files.
- SoftReadWriteLock backs off for up to 10 ms when a peer publishes
  first during withdrawal, reducing filesystem traffic.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_4.2.12.bb => python3-filelock_4.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.2.12.bb => python3-filelock_4.3.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.2.12.bb b/meta-python/recipes-devtools/python/python3-filelock_4.3.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-filelock_4.2.12.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.3.0.bb
index 8c303bc062..b251f6af73 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.3.0.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "7e7da24d3ac39268b0f156e56870001de44886318f092f9d851e692f7114d6dd"
+SRC_URI[sha256sum] = "143407310acf479e82d88068e3b9a6486f45fb410c0ed8729fe7359eaabeb6f1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3

