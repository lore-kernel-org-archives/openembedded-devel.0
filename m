Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DDBC79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:59 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31910.1788776630861871142
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b5jR0MS4;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-85377c8bc96so3074281b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776630; x=1789381430; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPZIVLW7sOO3e0HC8g4Jm/btV1zU+HjgjcuEoolkFHo=;
        b=b5jR0MS4b9tjeHTV72IJMZR4uQUA7d34S8yDZOFrlgjCZGrvhdzo15FIvcP82Axqlv
         CE4ltNUO1b2kXQIPR0IgCJEG7jy1aUU5H0ugSdqVL4K0PBeAjD97Kwpsi7S9VwUG4vTg
         P54n3/FrP5ek25WmhU9vMab3FLbiS8rHSfVtmOw9dzmposl6JJt8tR2AvCmVw18JvBcV
         vzEIPG3d7cRgG9u7e0BIfNQWvmcclLXvduDM7NOosGVNlYw5Ki9VNOA/Zk21NVsW6efJ
         +wzG9Os54f96pJAhA3j2vozBn1398CBv5VKcJJozZIzZw7zMop0EYdAjxrfOPTgqIzTr
         TtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776630; x=1789381430;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPZIVLW7sOO3e0HC8g4Jm/btV1zU+HjgjcuEoolkFHo=;
        b=Ka3BVTVGibeLi5o1UtYLlqmRWr1wsFgf8SH9FeuON03MIML5W+HoJ3OluwY+vc+PIP
         giFczB1wxTFWYJJweDSSZIG7PWAvSBMAW5h1gtErjVR+oYT5coAD/QjEvtcsWTL9LhPQ
         t0P9BiTZCOq2twIU60mR+7sa6EiGHmEqPsXN/XxuxTu7oxXf12cUZ6pJEbj1tmZTgXNZ
         oOVMVXgxmD2338afVc1Rk+A0Z9DoVG+HgFHglpt5y0GvSPZovChRujI45P8Q7y8+m951
         TGJ4o1bcH8EHU2HKUA+DfEp/yj+r2HqtNOe+siHxBFgCJpH6KvZ9NtSokTX5bBJ1Gja6
         RAQg==
X-Gm-Message-State: AFuF++k9lxqgq/TCRnt6HgBZnAc1/KkdUjZxWTg4ZVOn9V9gFPEkSFA1
	FF3JUWKvL+S56KpbMyKWTTbWgo8j5h9WQDR3inr1q7MtBN6LGUqpyfvj54ovLXlg
X-Gm-Gg: AYBFou0pKBwoHloRzGCLdXGBGjFhHQ2FZ6Y0vatx/3mTBQFHgTuigPE48m1X0l1XnwR
	NtZ9J/FlW3VRpXh9zUHvOQg5HVR41NcIuL2/SYVJrN4YSpBVRhuQGntUpOhO3bOHt8j95chzgqZ
	GFPGMqVu2Bhpqd8a/Coa5+/x44ErSTiHPBTQ5ESj+9OJ51ZDqEKNFSYk+1za7sp/6YudrOPus3m
	ObcFIZO8LENXw0Ufe6TvP+joeq9uQ5JhOgs4gvpBuRXBFIRMN9XZ/kAHCxnSK9QR6LizF8ZNhCN
	X1Ewj7q4P8wjpxazQe8zn/9KEVaqB2YghsXOxza4ixqrrumT+GqB0f/cqth4RS7/2NaGdY4ZdRq
	NAnzblXvZBPfiaphTeuscMqvpsHAUliiWtWqjhjbqozqqM8VioBWJ7BYPCYOev0qcjwggPbnXs2
	Hv3ULjK/gkzy6wYztHmo0njMPvKid+ITl9KUKbCgaH9dvyIj1LH6kUui/V1T1imtGhEKAGcKOHz
	g==
X-Received: by 2002:a05:6a20:244a:b0:3cd:9f0b:f788 with SMTP id adf61e73a8af0-3da39d12327mr31717504637.12.1788776629645;
        Mon, 07 Sep 2026 03:23:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 9/33] python3-zeroconf: patch CVE-2026-47184
Date: Mon,  7 Sep 2026 22:22:53 +1200
Message-ID: <20260907102318.2459883-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129821

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47184

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-zeroconf/CVE-2026-47184.patch     | 558 ++++++++++++++++++
 .../python/python3-zeroconf_0.148.0.bb        |   1 +
 2 files changed, 559 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47184.patch

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47184.patch b/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47184.patch
new file mode 100644
index 0000000000..73d4c2bd9c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47184.patch
@@ -0,0 +1,558 @@
+From 61d9e147da48ffb5f660e639f6d457e5cda008d4 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 17 May 2026 21:48:40 -0700
+Subject: [PATCH] fix: bound DNSCache record count to prevent unbounded
+ LAN-driven growth (#1718)
+
+(cherry picked from commit 0ad3f37b5b852b8f614d322283d148efb2cef6e4)
+
+CVE: CVE-2026-47184
+Upstream-Status: Backport [https://github.com/python-zeroconf/python-zeroconf/commit/0ad3f37b5b852b8f614d322283d148efb2cef6e4]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/zeroconf/_cache.pxd              |  11 +-
+ src/zeroconf/_cache.py               |  79 +++++----
+ src/zeroconf/const.py                |   6 +
+ tests/benchmarks/test_cache_bound.py |  68 ++++++++
+ tests/test_cache.py                  | 241 ++++++++++++++++++++++++++-
+ 5 files changed, 374 insertions(+), 31 deletions(-)
+ create mode 100644 tests/benchmarks/test_cache_bound.py
+
+diff --git a/src/zeroconf/_cache.pxd b/src/zeroconf/_cache.pxd
+index 05a40c0..023304b 100644
+--- a/src/zeroconf/_cache.pxd
++++ b/src/zeroconf/_cache.pxd
+@@ -19,6 +19,7 @@ cdef object _UNIQUE_RECORD_TYPES
+ cdef unsigned int _TYPE_PTR
+ cdef cython.uint _ONE_SECOND
+ cdef unsigned int _MIN_SCHEDULED_RECORD_EXPIRATION
++cdef unsigned int _MAX_CACHE_RECORDS
+ 
+ 
+ @cython.locals(record_cache=dict)
+@@ -31,6 +32,7 @@ cdef class DNSCache:
+     cdef public cython.dict service_cache
+     cdef public list _expire_heap
+     cdef public dict _expirations
++    cdef public unsigned int _total_records
+ 
+     cpdef bint async_add_records(self, object entries)
+ 
+@@ -60,10 +62,17 @@ cdef class DNSCache:
+         service_store=cython.dict,
+         service_record=DNSService,
+         when=object,
+-        new=bint
++        new=bint,
++        is_new=bint
+     )
+     cdef bint _async_add(self, DNSRecord record)
+ 
++    @cython.locals(record=DNSRecord, when_record=tuple)
++    cdef void _async_evict_oldest(self)
++
++    @cython.locals(expire_heap_len="unsigned int")
++    cdef void _maybe_rebuild_heap(self)
++
+     @cython.locals(service_record=DNSService)
+     cdef void _async_remove(self, DNSRecord record)
+ 
+diff --git a/src/zeroconf/_cache.py b/src/zeroconf/_cache.py
+index c7ca847..d323a6a 100644
+--- a/src/zeroconf/_cache.py
++++ b/src/zeroconf/_cache.py
+@@ -37,7 +37,7 @@ from ._dns import (
+     DNSText,
+ )
+ from ._utils.time import current_time_millis
+-from .const import _ONE_SECOND, _TYPE_PTR
++from .const import _MAX_CACHE_RECORDS, _ONE_SECOND, _TYPE_PTR
+ 
+ _UNIQUE_RECORD_TYPES = (DNSAddress, DNSHinfo, DNSPointer, DNSText, DNSService)
+ _UniqueRecordsType = Union[DNSAddress, DNSHinfo, DNSPointer, DNSText, DNSService]
+@@ -72,6 +72,7 @@ class DNSCache:
+         self._expire_heap: list[tuple[float, DNSRecord]] = []
+         self._expirations: dict[DNSRecord, float] = {}
+         self.service_cache: _DNSRecordCacheType = {}
++        self._total_records: int = 0
+ 
+     # Functions prefixed with async_ are NOT threadsafe and must
+     # be run in the event loop.
+@@ -89,15 +90,34 @@ class DNSCache:
+         # replaces any existing records that are __eq__ to each other which
+         # removes the risk that accessing the cache from the wrong
+         # direction would return the old incorrect entry.
+-        if (store := self.cache.get(record.key)) is None:
++        store = self.cache.get(record.key)
++        is_new = store is None or record not in store
++        # Bound total cache size; evict closest-to-expiration entry to
++        # make room before inserting a new record. Prevents a LAN-local
++        # flood of unique-name records from growing the cache without
++        # bound (RFC 6762 §10 advisory caching, defense-in-depth).
++        if is_new and self._total_records >= _MAX_CACHE_RECORDS:
++            self._async_evict_oldest()
++            # The victim may have been the last record under
++            # ``record.key``, in which case ``_remove_key`` deleted
++            # the bucket. Re-fetch before creating below.
++            store = self.cache.get(record.key)
++        if store is None:
+             store = self.cache[record.key] = {}
+-        new = record not in store and not isinstance(record, DNSNsec)
++        new = is_new and not isinstance(record, DNSNsec)
++        if is_new:
++            self._total_records += 1
+         store[record] = record
+         when = record.created + (record.ttl * 1000)
+         if self._expirations.get(record) != when:
+-            # Avoid adding duplicates to the heap
+             heappush(self._expire_heap, (when, record))
+             self._expirations[record] = when
++            # Re-adds of an existing record with a new TTL push a fresh
++            # entry but leave the prior tuple behind as stale, so a peer
++            # that just replays cached records can grow ``_expire_heap``
++            # without ever tripping the cap. Rebuild when stale entries
++            # dominate.
++            self._maybe_rebuild_heap()
+ 
+         if isinstance(record, DNSService):
+             service_record = record
+@@ -106,6 +126,28 @@ class DNSCache:
+             service_store[service_record] = service_record
+         return new
+ 
++    def _async_evict_oldest(self) -> None:
++        """Drop the closest-to-expiration record to make room for a new one."""
++        while self._expire_heap:
++            when_record = heappop(self._expire_heap)
++            record = when_record[1]
++            if self._expirations.get(record) != when_record[0]:
++                continue
++            self._async_remove(record)
++            return
++
++    def _maybe_rebuild_heap(self) -> None:
++        """Rebuild ``_expire_heap`` when stale entries dominate live ones."""
++        expire_heap_len = len(self._expire_heap)
++        if (
++            expire_heap_len > _MIN_SCHEDULED_RECORD_EXPIRATION
++            and expire_heap_len > len(self._expirations) * 2
++        ):
++            self._expire_heap = [
++                entry for entry in self._expire_heap if self._expirations.get(entry[1]) == entry[0]
++            ]
++            heapify(self._expire_heap)
++
+     def async_add_records(self, entries: Iterable[DNSRecord]) -> bool:
+         """Add multiple records.
+ 
+@@ -129,6 +171,7 @@ class DNSCache:
+             _remove_key(self.service_cache, service_record.server_key, service_record)
+         _remove_key(self.cache, record.key, record)
+         self._expirations.pop(record, None)
++        self._total_records -= 1
+ 
+     def async_remove_records(self, entries: Iterable[DNSRecord]) -> None:
+         """Remove multiple records.
+@@ -145,43 +188,23 @@ class DNSCache:
+ 
+         :param now: The current time in milliseconds.
+         """
+-        if not (expire_heap_len := len(self._expire_heap)):
++        if not self._expire_heap:
+             return []
+ 
+         expired: list[DNSRecord] = []
+-        # Find any expired records and add them to the to-delete list
+         while self._expire_heap:
+             when_record = self._expire_heap[0]
+             when = when_record[0]
+             if when > now:
+                 break
+             heappop(self._expire_heap)
+-            # Check if the record hasn't been re-added to the heap
+-            # with a different expiration time as it will be removed
+-            # later when it reaches the top of the heap and its
+-            # expiration time is met.
++            # Skip entries left behind by a TTL re-add; the live tuple is
++            # later in the heap and will be removed when it reaches the top.
+             record = when_record[1]
+             if self._expirations.get(record) == when:
+                 expired.append(record)
+ 
+-        # If the expiration heap grows larger than the number expirations
+-        # times two, we clean it up to avoid keeping expired entries in
+-        # the heap and consuming memory. We guard this with a minimum
+-        # threshold to avoid cleaning up the heap too often when there are
+-        # only a few scheduled expirations.
+-        if (
+-            expire_heap_len > _MIN_SCHEDULED_RECORD_EXPIRATION
+-            and expire_heap_len > len(self._expirations) * 2
+-        ):
+-            # Remove any expired entries from the expiration heap
+-            # that do not match the expiration time in the expirations
+-            # as it means the record has been re-added to the heap
+-            # with a different expiration time.
+-            self._expire_heap = [
+-                entry for entry in self._expire_heap if self._expirations.get(entry[1]) == entry[0]
+-            ]
+-            heapify(self._expire_heap)
+-
++        self._maybe_rebuild_heap()
+         self.async_remove_records(expired)
+         return expired
+ 
+diff --git a/src/zeroconf/const.py b/src/zeroconf/const.py
+index 1db39a4..a17e468 100644
+--- a/src/zeroconf/const.py
++++ b/src/zeroconf/const.py
+@@ -59,6 +59,12 @@ _DNS_OTHER_TTL = 4500  # 75 minutes for non-host records (PTR, TXT etc) as-per R
+ # level of rate limit and safe guards so we use 1/4 of the recommended value
+ _DNS_PTR_MIN_TTL = 1125
+ 
++# Upper bound on the number of records the DNSCache will hold before it
++# starts evicting the closest-to-expiration entry to make room for new
++# arrivals. Bounds the memory a malicious LAN peer can force the cache
++# to retain by multicasting many unique-name records.
++_MAX_CACHE_RECORDS = 10000
++
+ _DNS_PACKET_HEADER_LEN = 12
+ 
+ _MAX_MSG_TYPICAL = 1460  # unused
+diff --git a/tests/benchmarks/test_cache_bound.py b/tests/benchmarks/test_cache_bound.py
+new file mode 100644
+index 0000000..774129e
+--- /dev/null
++++ b/tests/benchmarks/test_cache_bound.py
+@@ -0,0 +1,68 @@
++"""Benchmark for the DNSCache record-count bound + overflow eviction."""
++
++from __future__ import annotations
++
++from collections.abc import Iterator
++from itertools import count
++
++from pytest_codspeed import BenchmarkFixture
++
++from zeroconf import DNSAddress, DNSCache, current_time_millis
++from zeroconf.const import _CLASS_IN, _MAX_CACHE_RECORDS, _TYPE_A
++
++
++def _make_records(count_: int, now: float, prefix: str = "bench") -> list[DNSAddress]:
++    return [
++        DNSAddress(
++            f"{prefix}-{i}.local.",
++            _TYPE_A,
++            _CLASS_IN,
++            120,
++            bytes(((i >> 24) & 0xFF, (i >> 16) & 0xFF, (i >> 8) & 0xFF, i & 0xFF)),
++            created=now + i,
++        )
++        for i in range(count_)
++    ]
++
++
++def _unbounded_records(now: float, prefix: str = "evict") -> Iterator[DNSAddress]:
++    """Unbounded generator of unique-name DNSAddress records."""
++    for i in count():
++        yield DNSAddress(
++            f"{prefix}-{i}.local.",
++            _TYPE_A,
++            _CLASS_IN,
++            120,
++            bytes(((i >> 24) & 0xFF, (i >> 16) & 0xFF, (i >> 8) & 0xFF, i & 0xFF)),
++            created=now + i,
++        )
++
++
++def test_cache_add_below_cap(benchmark: BenchmarkFixture) -> None:
++    """Adding records while the cache is well below the cap (no eviction)."""
++    now = current_time_millis()
++    records = _make_records(1000, now)
++
++    @benchmark
++    def _add() -> None:
++        cache = DNSCache()
++        cache.async_add_records(records)
++
++
++def test_cache_add_at_cap_evicts(benchmark: BenchmarkFixture) -> None:
++    """Steady-state add at the cap: every measured insert forces one eviction.
++
++    Pre-fills the cache to ``_MAX_CACHE_RECORDS`` outside the timed body so
++    only the eviction-path adds are measured. Each benchmark iteration
++    pulls one fresh unique record from an unbounded generator, keeping the
++    cache permanently at the cap. The generator avoids the iteration-count
++    cap that a pre-built pool would impose for very fast operations.
++    """
++    now = current_time_millis()
++    cache = DNSCache()
++    cache.async_add_records(_make_records(_MAX_CACHE_RECORDS, now, prefix="fill"))
++    pool = _unbounded_records(now + _MAX_CACHE_RECORDS)
++
++    @benchmark
++    def _evict_one() -> None:
++        cache.async_add_records([next(pool)])
+diff --git a/tests/test_cache.py b/tests/test_cache.py
+index 9d55435..aeb3a2a 100644
+--- a/tests/test_cache.py
++++ b/tests/test_cache.py
+@@ -439,7 +439,9 @@ async def test_cache_heap_multi_name_cleanup() -> None:
+         )
+         cache.async_add_records([record])
+ 
+-    assert len(cache._expire_heap) == min_records_to_cleanup + 5
++    # ``_async_add`` rebuilds ``_expire_heap`` proactively when stale entries
++    # dominate (heap > 2x expirations), so the heap is already capped at
++    # ~one entry per unique record long before ``async_expire`` is called.
+     assert len(cache.async_entries_with_name(name)) == 1
+     assert len(cache.async_entries_with_name(name2)) == 5
+ 
+@@ -473,7 +475,8 @@ async def test_cache_heap_pops_order() -> None:
+         )
+         cache.async_add_records([record])
+ 
+-    assert len(cache._expire_heap) == min_records_to_cleanup + 5
++    # ``_async_add`` proactively rebuilds the heap when stale entries dominate,
++    # so the heap holds only one entry per unique record by this point.
+     assert len(cache.async_entries_with_name(name)) == 1
+     assert len(cache.async_entries_with_name(name2)) == 5
+ 
+@@ -482,3 +485,237 @@ async def test_cache_heap_pops_order() -> None:
+         ts, _ = heappop(cache._expire_heap)
+         assert ts >= start_ts
+         start_ts = ts
++
++
++def _addr(name: str, idx: int, *, ttl: int = 120, created: float | None = None) -> r.DNSAddress:
++    """Build a DNSAddress with idx-derived payload for the bound/eviction tests."""
++    return r.DNSAddress(
++        name,
++        const._TYPE_A,
++        const._CLASS_IN,
++        ttl,
++        bytes((idx & 0xFF, (idx >> 8) & 0xFF, 0, 1)),
++        created=r.current_time_millis() if created is None else created,
++    )
++
++
++def test_cache_size_is_bounded() -> None:
++    """A flood of unique-name records is capped at ``_MAX_CACHE_RECORDS``."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++    overflow = 1000
++    flood_size = const._MAX_CACHE_RECORDS + overflow
++
++    cache.async_add_records(_addr(f"flood-{i}.local.", i, created=now + i) for i in range(flood_size))
++
++    total = sum(len(store) for store in cache.cache.values())
++    assert total == const._MAX_CACHE_RECORDS
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++    # FIFO-ish: the earliest-created records (closest to expiration) get
++    # evicted first, so the names that remain are from the tail.
++    for i in range(overflow):
++        assert f"flood-{i}.local." not in cache.cache
++    for i in range(flood_size - overflow, flood_size):
++        assert f"flood-{i}.local." in cache.cache
++
++
++def test_cache_eviction_empty_heap_returns_without_evicting() -> None:
++    """Eviction tolerates an empty ``_expire_heap`` (invariant-violation safety net)."""
++    cache = r.DNSCache()
++    # By the cache invariant every record in ``_total_records`` has a heap
++    # entry, so eviction should never see an empty heap. Force the broken
++    # state directly to pin the defensive behaviour: ``_async_evict_oldest``
++    # returns without raising and the subsequent insert still lands. Since
++    # eviction can't free space, the counter is allowed to drift past the
++    # cap by exactly one — pinned so a future change to the recovery
++    # semantics (e.g., refusing the add or clamping) fails this test.
++    cache._total_records = const._MAX_CACHE_RECORDS
++    cache._expire_heap = []
++    cache.async_add_records([_addr("post-empty.local.", 0)])
++    assert "post-empty.local." in cache.cache
++    assert cache._total_records == const._MAX_CACHE_RECORDS + 1
++
++
++def test_cache_eviction_skips_stale_heap_entries() -> None:
++    """Eviction skips stale heap entries left by TTL re-adds."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++    cache.async_add_records(
++        _addr(f"stale-{i}.local.", i, created=now + i) for i in range(const._MAX_CACHE_RECORDS)
++    )
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++
++    # Re-add the closest-to-expiration record with a longer TTL; the prior
++    # ``(when, record)`` tuple stays as stale, eviction must skip it.
++    victim_name = "stale-0.local."
++    cache.async_add_records([_addr(victim_name, 0, ttl=7200, created=now)])
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++
++    cache.async_add_records([_addr("trigger.local.", 0xFFFF, created=now + const._MAX_CACHE_RECORDS)])
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++    assert victim_name in cache.cache
++    assert "stale-1.local." not in cache.cache
++
++
++def test_cache_eviction_victim_shares_key_with_new_record() -> None:
++    """Inserting a record whose key collides with the eviction victim keeps it reachable."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++    cache.async_add_records(
++        _addr(f"filler-{i}.local.", i, created=now + 1000 + i) for i in range(const._MAX_CACHE_RECORDS - 1)
++    )
++
++    # Insert at "shared.local." with the earliest expiration so eviction
++    # picks it. ``_remove_key`` then deletes ``cache["shared.local."]``.
++    shared_key = "shared.local."
++    cache.async_add_records([_addr(shared_key, 0x0102, created=now)])
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++
++    # Adding a new record under the SAME key: a pre-eviction-captured
++    # ``store`` would write into an orphaned dict; the fix re-resolves.
++    new_shared = _addr(shared_key, 0x0506, created=now + 999)
++    cache.async_add_records([new_shared])
++
++    assert shared_key in cache.cache, "new record orphaned: cache bucket missing"
++    assert new_shared in cache.cache[shared_key]
++    assert cache.async_get_unique(new_shared) == new_shared
++    total = sum(len(store) for store in cache.cache.values())
++    assert total == cache._total_records
++
++
++def test_cache_dnsnsec_at_cap_evicts_prior_record() -> None:
++    """A single DNSNsec arriving at the cap evicts one prior record and stays reachable."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++    cache.async_add_records(
++        _addr(f"fill-{i}.local.", i, created=now + i) for i in range(const._MAX_CACHE_RECORDS)
++    )
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++
++    nsec = r.DNSNsec(
++        "nsec-arrival.local.",
++        const._TYPE_NSEC,
++        const._CLASS_IN,
++        120,
++        "nsec-arrival.local.",
++        [const._TYPE_A],
++    )
++    cache.async_add_records([nsec])
++
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++    assert nsec in cache.cache[nsec.key]
++    # The earliest-created fill record is gone (FIFO-ish eviction).
++    assert "fill-0.local." not in cache.cache
++
++
++def test_cache_dnsnsec_flood_is_bounded() -> None:
++    """DNSNsec records honour ``_MAX_CACHE_RECORDS`` (no bypass via the ``new`` flag)."""
++    cache = r.DNSCache()
++    overflow = 100
++    cache.async_add_records(
++        r.DNSNsec(
++            f"nsec-{i}.local.",
++            const._TYPE_NSEC,
++            const._CLASS_IN,
++            120,
++            f"nsec-{i}.local.",
++            [const._TYPE_A],
++        )
++        for i in range(const._MAX_CACHE_RECORDS + overflow)
++    )
++    assert cache._total_records == const._MAX_CACHE_RECORDS
++    total = sum(len(store) for store in cache.cache.values())
++    assert total == const._MAX_CACHE_RECORDS
++
++
++def test_cache_re_add_flood_does_not_grow_heap_unbounded() -> None:
++    """Replaying cached records with shifting TTLs cannot grow ``_expire_heap`` unbounded."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++    # Stay below the cache cap so eviction never fires; the attack here is
++    # heap growth via re-add, not cap saturation. Clear the
++    # ``_MIN_SCHEDULED_RECORD_EXPIRATION`` floor so the rebuild engages.
++    record_count = 200
++    cache.async_add_records(_addr(f"flood-{i}.local.", i, created=now) for i in range(record_count))
++    assert cache._total_records == record_count
++
++    # 10 cycles x ``record_count`` stale pushes each. Without
++    # ``_maybe_rebuild_heap`` firing inside ``_async_add``, the heap would
++    # grow to ~11 x record_count.
++    for cycle in range(10):
++        cache.async_add_records(
++            _addr(f"flood-{i}.local.", i, ttl=7200 + cycle, created=now) for i in range(record_count)
++        )
++
++    # Heap is bounded near the rebuild threshold; ``+ record_count`` of slack
++    # to stay resilient to where in a re-add cycle the rebuild last fired.
++    assert len(cache._expire_heap) <= 2 * len(cache._expirations) + record_count
++    assert cache._total_records == record_count
++
++
++def test_cache_eviction_decrements_total_records() -> None:
++    """Natural removal (goodbyes, expirations) keeps ``_total_records`` in sync."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++    records = [_addr(f"sync-{i}.local.", i, created=now) for i in range(50)]
++    cache.async_add_records(records)
++    assert cache._total_records == 50
++
++    cache.async_remove_records(records[:20])
++    assert cache._total_records == 30
++
++    cache.async_expire(now + (200 * 1000))
++    assert cache._total_records == 0
++    assert not cache.cache
++
++
++def test_cache_total_records_invariant_under_mixed_ops() -> None:
++    """``_total_records`` stays equal to the sum of bucket sizes across all touched paths."""
++    cache = r.DNSCache()
++    now = r.current_time_millis()
++
++    def actual() -> int:
++        return sum(len(store) for store in cache.cache.values())
++
++    addrs = [_addr(f"mix-{i}.local.", i, created=now + i) for i in range(20)]
++    cache.async_add_records(addrs)
++    assert cache._total_records == actual() == 20
++
++    # Re-add of an identical record: no increment.
++    cache.async_add_records([addrs[0]])
++    assert cache._total_records == actual() == 20
++
++    # DNSService writes service_cache too — counter still matches cache size.
++    svc = r.DNSService("svc.local.", const._TYPE_SRV, const._CLASS_IN, 120, 0, 0, 80, "host.local.")
++    cache.async_add_records([svc])
++    assert cache._total_records == actual() == 21
++    cache.async_remove_records([svc])
++    assert cache._total_records == actual() == 20
++
++    # DNSNsec is stored but excluded from the "new" return; counter tracks it anyway.
++    nsec = r.DNSNsec("nsec.local.", const._TYPE_NSEC, const._CLASS_IN, 120, "nsec.local.", [const._TYPE_A])
++    cache.async_add_records([nsec])
++    assert cache._total_records == actual() == 21
++    cache.async_remove_records([nsec])
++    assert cache._total_records == actual() == 20
++
++    # Shared-key insert/remove: emptying the bucket drops the cache key but
++    # counter decrements only by the records that left.
++    shared_a = _addr("shared.local.", 0x0101, created=now)
++    shared_b = _addr("shared.local.", 0x0202, created=now)
++    cache.async_add_records([shared_a, shared_b])
++    assert cache._total_records == actual() == 22
++    cache.async_remove_records([shared_a, shared_b])
++    assert cache._total_records == actual() == 20
++    assert "shared.local." not in cache.cache
++
++    cache.async_expire(now + (200 * 1000))
++    assert cache._total_records == actual() == 0
++    assert not cache.cache
++
++    # Full-cap eviction loop: counter never grows past the cap, never drifts.
++    cap_records = [_addr(f"cap-{i}.local.", i, created=now + i) for i in range(const._MAX_CACHE_RECORDS + 50)]
++    for rec in cap_records:
++        cache.async_add_records([rec])
++        assert cache._total_records == actual()
++    assert cache._total_records == const._MAX_CACHE_RECORDS
diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
index aa1bb11065..cc68ffbf96 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f
 
 SRC_URI += "file://CVE-2026-47180.patch \
             file://CVE-2026-47183.patch \
+            file://CVE-2026-47184.patch \
 "
 
 inherit pypi python_poetry_core cython

