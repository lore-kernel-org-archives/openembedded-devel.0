Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EA0C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:48 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31689.1788776627622448095
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=moTYZqgN;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so2579834a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776627; x=1789381427; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E69uXQHOAPTZHlSvoWvWzP7KavP+3HVOqftn9f0txIc=;
        b=moTYZqgNDx8qND2AFaZu9DdLMAGFPoA+gsXqC0UCy9uxgaDtA/f+l1V5+v20zs6KqI
         ShuF2RsEtVleIBwhN9t+ZIVqK9JMKdM3CX8B9dKQ2cV48g568MbmIMYe2UfhS5D85g37
         mwjS1b4DWDttUim+HhFkMrQEIrM6e/rEqi3P/TDIWFYuztD8pK3+NSA2ZLAEKX7vR9uA
         HmAVDT+EJZLHDHg+D8HFkQ7JkD+lDVZFCYoF4DEfyTIWsBxsOlPhOpiyX/69sFj28x+4
         TpEKTVSFJlUf4xaJx6vV52SCyfnZdSGB689yvDG9SR8nHkNt0E4y/EiVlSUHLNKyH0hW
         OvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776627; x=1789381427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E69uXQHOAPTZHlSvoWvWzP7KavP+3HVOqftn9f0txIc=;
        b=Ji3weKTPB64sVA+WYT4P1E4czgPQw8CHo2oAYHJUu9Ic/xT7MRFRlZCPBMXtEyF9JB
         6uMzJDz++m4T/I4balKZu6zUxlv/AibPq5qSJZKLMj4nLCcU9x7O9JYwLj7JDc95OC4S
         FCZbQ1WZpS21DdmSKxCKlpooNEnTvIv24CwOlVVC9tsgNGBU7Yl7exDucPQ1BdiUDS7W
         zsK+2cv7lVl5k5E8hcuRVRSiwSTVAOX2GEORXBlYi3H4Uf5XHoZJWRGAUb2bTlgpu/iG
         P7svjpE6cRjxxWQqv+LrE0Z942kdknnag3oD5qSt2TKMptKM7qA2MXLiDV1meELgwmMo
         0Ylw==
X-Gm-Message-State: AFuF++lg9WGMy9JkDN70TP0Cifjc4FjVFRcOuM93kf4fMk/+yGacQdk6
	okyyH2PxHXwhWT50J28ySlFT72sFl/YGGgNyv6EEKUHxDY1K2yzmteeji2vHHA==
X-Gm-Gg: AYBFou3RJ1sD43D0xS1hb9zLGtv1y0c5cZVXhbtmKSLdzwSdgAnjFLonjoUDKVUa/wg
	f5c4j7om7/OvBRTWVQ9Jl/7E5FID8Kx1/DdibzAHw3dlvi/7Rp+vupeC0upyUv2Kb7cOj75cevB
	xC7EBgGUixcXE4AnmKLzAuthctEsH9uL+QaDOPXycR/ZJv32P760BWYg8t5haFfsydVAi1JYg/a
	FVMiprKUE9y8o/nccz6J06VzLfE3nrA1/1HsCUhqaK3q3QQknDVz1JrkrUQ6TFdDSWkbLrnbafA
	NHKUKzemUf4zY6q2+ZgA4fxac81yrCbxXOtY6yEgp+4Lk/C7WHx7l1AQf6jzL+lMut3/An0c/Wq
	zfI5sUoc4I+xxLhlC2opCnYG0f7yjNi66Tf88tZ4woCUBDgp3JBkMP57hpr+6fCtZP5u8zhw6+R
	4EbXVxCZvK9v8466Anp6KVKvCMozUUDadXxEX01XGaEPgDKwWVzxwXYeItm6PT3xqhVsDT+QisY
	Mu2E3fKPGQ4
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39b26277b88mr32966558a91.24.1788776626830;
        Mon, 07 Sep 2026 03:23:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 8/33] python3-zeroconf: patch CVE-2026-47183
Date: Mon,  7 Sep 2026 22:22:52 +1200
Message-ID: <20260907102318.2459883-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129820

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47183

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-zeroconf/CVE-2026-47183.patch     | 401 ++++++++++++++++++
 .../python/python3-zeroconf_0.148.0.bb        |   4 +-
 2 files changed, 404 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47183.patch

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47183.patch b/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47183.patch
new file mode 100644
index 0000000000..a1ab4cbfe6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47183.patch
@@ -0,0 +1,401 @@
+From 831dda6b9d17d6abd6e9501b45ad8b3573a8fab5 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 17 May 2026 20:58:18 -0700
+Subject: [PATCH] fix: bound _seen_logs and stop retaining exc_info (#1717)
+
+(cherry picked from commit 95561e28b24922358f1991e38e3a86d70d72dcec)
+
+CVE: CVE-2026-47183
+Upstream-Status: Backport [https://github.com/python-zeroconf/python-zeroconf/commit/95561e28b24922358f1991e38e3a86d70d72dcec]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/zeroconf/_logger.py            | 89 +++++++++++++++++++-----------
+ src/zeroconf/_protocol/incoming.py | 12 +---
+ tests/benchmarks/test_mark_seen.py | 39 +++++++++++++
+ tests/test_logger.py               | 87 +++++++++++++++++++++++++++--
+ tests/test_protocol.py             | 34 ++++++++++++
+ 5 files changed, 214 insertions(+), 47 deletions(-)
+ create mode 100644 tests/benchmarks/test_mark_seen.py
+
+diff --git a/src/zeroconf/_logger.py b/src/zeroconf/_logger.py
+index 0d734df..99990cf 100644
+--- a/src/zeroconf/_logger.py
++++ b/src/zeroconf/_logger.py
+@@ -25,7 +25,7 @@ from __future__ import annotations
+ 
+ import logging
+ import sys
+-from typing import Any, ClassVar, cast
++from typing import Any
+ 
+ log = logging.getLogger(__name__.split(".", maxsplit=1)[0])
+ log.addHandler(logging.NullHandler())
+@@ -39,50 +39,73 @@ def set_logger_level_if_unset() -> None:
+ set_logger_level_if_unset()
+ 
+ 
+-class QuietLogger:
+-    _seen_logs: ClassVar[dict[str, int | tuple]] = {}
++_MAX_SEEN_LOGS = 512
++_seen_logs: dict[str, None] = {}
++
++
++def _evict_oldest(seen: dict[str, None]) -> bool:
++    """Pop the oldest entry from ``seen``; return False if it raced.
++
++    Individual dict ops (``pop`` with a default, ``next``) are atomic
++    on the free-threaded build, but the compound ``iter`` → ``next``
++    used to pick the FIFO victim can raise ``RuntimeError`` if
++    another thread mutates the dict between the two ops. The caller
++    breaks its drain loop on False so concurrent mutation can't make
++    it spin.
++    """
++    try:
++        seen.pop(next(iter(seen)), None)
++    except (RuntimeError, StopIteration):
++        return False
++    return True
++
++
++def _mark_seen(seen: dict[str, None], key: str) -> bool:
++    """Record ``key`` in ``seen`` and return True if it was newly added.
++
++    Bounds the dict so callers passing attacker-influenced keys (peer
++    addresses, packet offsets) cannot grow it without bound. Evicts
++    the oldest entries on overflow (dict preserves insertion order on
++    Python 3.7+), so ``_MAX_SEEN_LOGS`` is a recency window.
++
++    The dict is shared across all ``Zeroconf`` instances in the
++    process; on the free-threaded build (3.14t) and under multi-
++    instance sync use, callers can race the ``len < cap`` check and
++    both insert, leaving the dict transiently above the cap. The
++    drain loop runs on every call (steady-state-at-cap hits are a
++    single ``len`` + compare past the membership check because the
++    helper short-circuits) so a contention burst is corrected by the
++    next caller regardless of whether it's a hit or a miss.
++    """
++    inserting = key not in seen
++    # Hit (``inserting`` is False): drain only if drifted above cap.
++    # Miss (``inserting`` is True): drain to ``cap - 1`` to make room
++    # for the new key. Bool subtracts as 0/1 to pick the right limit.
++    while len(seen) > _MAX_SEEN_LOGS - inserting and _evict_oldest(seen):
++        pass
++    if inserting:
++        seen[key] = None
++    return inserting
++
+ 
++class QuietLogger:
+     @classmethod
+     def log_exception_warning(cls, *logger_data: Any) -> None:
+-        exc_info = sys.exc_info()
+-        exc_str = str(exc_info[1])
+-        if exc_str not in cls._seen_logs:
+-            # log at warning level the first time this is seen
+-            cls._seen_logs[exc_str] = exc_info
+-            logger = log.warning
+-        else:
+-            logger = log.debug
++        first_time = _mark_seen(_seen_logs, str(sys.exc_info()[1]))
++        logger = log.warning if first_time else log.debug
+         logger(*(logger_data or ["Exception occurred"]), exc_info=True)
+ 
+     @classmethod
+     def log_exception_debug(cls, *logger_data: Any) -> None:
+-        log_exc_info = False
+-        exc_info = sys.exc_info()
+-        exc_str = str(exc_info[1])
+-        if exc_str not in cls._seen_logs:
+-            # log the trace only on the first time
+-            cls._seen_logs[exc_str] = exc_info
+-            log_exc_info = True
+-        log.debug(*(logger_data or ["Exception occurred"]), exc_info=log_exc_info)
++        first_time = _mark_seen(_seen_logs, str(sys.exc_info()[1]))
++        log.debug(*(logger_data or ["Exception occurred"]), exc_info=first_time)
+ 
+     @classmethod
+     def log_warning_once(cls, *args: Any) -> None:
+-        msg_str = args[0]
+-        if msg_str not in cls._seen_logs:
+-            cls._seen_logs[msg_str] = 0
+-            logger = log.warning
+-        else:
+-            logger = log.debug
+-        cls._seen_logs[msg_str] = cast(int, cls._seen_logs[msg_str]) + 1
++        logger = log.warning if _mark_seen(_seen_logs, args[0]) else log.debug
+         logger(*args)
+ 
+     @classmethod
+     def log_exception_once(cls, exc: Exception, *args: Any) -> None:
+-        msg_str = args[0]
+-        if msg_str not in cls._seen_logs:
+-            cls._seen_logs[msg_str] = 0
+-            logger = log.warning
+-        else:
+-            logger = log.debug
+-        cls._seen_logs[msg_str] = cast(int, cls._seen_logs[msg_str]) + 1
++        logger = log.warning if _mark_seen(_seen_logs, args[0]) else log.debug
+         logger(*args, exc_info=exc)
+diff --git a/src/zeroconf/_protocol/incoming.py b/src/zeroconf/_protocol/incoming.py
+index d772f47..ffbbb59 100644
+--- a/src/zeroconf/_protocol/incoming.py
++++ b/src/zeroconf/_protocol/incoming.py
+@@ -37,7 +37,7 @@ from .._dns import (
+     DNSText,
+ )
+ from .._exceptions import IncomingDecodeError
+-from .._logger import log
++from .._logger import _mark_seen, log
+ from .._utils.time import current_time_millis
+ from ..const import (
+     _FLAGS_QR_MASK,
+@@ -63,7 +63,7 @@ MAX_NAME_LENGTH = 253
+ DECODE_EXCEPTIONS = (IndexError, struct.error, IncomingDecodeError, RecursionError)
+ 
+ 
+-_seen_logs: dict[str, int | tuple] = {}
++_seen_logs: dict[str, None] = {}
+ _str = str
+ _int = int
+ 
+@@ -182,13 +182,7 @@ class DNSIncoming:
+ 
+     @classmethod
+     def _log_exception_debug(cls, *logger_data: Any) -> None:
+-        log_exc_info = False
+-        exc_info = sys.exc_info()
+-        exc_str = str(exc_info[1])
+-        if exc_str not in _seen_logs:
+-            # log the trace only on the first time
+-            _seen_logs[exc_str] = exc_info
+-            log_exc_info = True
++        log_exc_info = _mark_seen(_seen_logs, str(sys.exc_info()[1]))
+         log.debug(*(logger_data or ["Exception occurred"]), exc_info=log_exc_info)
+ 
+     def answers(self) -> list[DNSRecord]:
+diff --git a/tests/benchmarks/test_mark_seen.py b/tests/benchmarks/test_mark_seen.py
+new file mode 100644
+index 0000000..4f82da8
+--- /dev/null
++++ b/tests/benchmarks/test_mark_seen.py
+@@ -0,0 +1,39 @@
++"""Benchmark for _logger._mark_seen."""
++
++from __future__ import annotations
++
++from pytest_codspeed import BenchmarkFixture
++
++from zeroconf._logger import _MAX_SEEN_LOGS, _mark_seen
++
++
++def test_mark_seen_hit(benchmark: BenchmarkFixture) -> None:
++    """Benchmark the cache-hit path (same key repeated)."""
++    seen: dict[str, None] = {"warm": None}
++
++    @benchmark
++    def _hit() -> None:
++        for _ in range(1000):
++            _mark_seen(seen, "warm")
++
++
++def test_mark_seen_fill(benchmark: BenchmarkFixture) -> None:
++    """Benchmark filling from empty up to the cap (no evictions)."""
++    keys = [f"key-{i}" for i in range(_MAX_SEEN_LOGS)]
++
++    @benchmark
++    def _fill() -> None:
++        seen: dict[str, None] = {}
++        for k in keys:
++            _mark_seen(seen, k)
++
++
++def test_mark_seen_churn(benchmark: BenchmarkFixture) -> None:
++    """Benchmark sustained eviction (every call past the cap drops oldest)."""
++    keys = [f"churn-{i}" for i in range(_MAX_SEEN_LOGS * 4)]
++
++    @benchmark
++    def _churn() -> None:
++        seen: dict[str, None] = {}
++        for k in keys:
++            _mark_seen(seen, k)
+diff --git a/tests/test_logger.py b/tests/test_logger.py
+index 4e09aa3..8042e49 100644
+--- a/tests/test_logger.py
++++ b/tests/test_logger.py
+@@ -5,7 +5,8 @@ from __future__ import annotations
+ import logging
+ from unittest.mock import call, patch
+ 
+-from zeroconf._logger import QuietLogger, set_logger_level_if_unset
++from zeroconf import _logger
++from zeroconf._logger import _MAX_SEEN_LOGS, QuietLogger, _mark_seen, set_logger_level_if_unset
+ 
+ 
+ def test_loading_logger():
+@@ -25,7 +26,7 @@ def test_loading_logger():
+ 
+ def test_log_warning_once():
+     """Test we only log with warning level once."""
+-    QuietLogger._seen_logs = {}
++    _logger._seen_logs.clear()
+     quiet_logger = QuietLogger()
+     with (
+         patch("zeroconf._logger.log.warning") as mock_log_warning,
+@@ -48,7 +49,7 @@ def test_log_warning_once():
+ 
+ def test_log_exception_warning():
+     """Test we only log with warning level once."""
+-    QuietLogger._seen_logs = {}
++    _logger._seen_logs.clear()
+     quiet_logger = QuietLogger()
+     with (
+         patch("zeroconf._logger.log.warning") as mock_log_warning,
+@@ -71,7 +72,7 @@ def test_log_exception_warning():
+ 
+ def test_llog_exception_debug():
+     """Test we only log with a trace once."""
+-    QuietLogger._seen_logs = {}
++    _logger._seen_logs.clear()
+     quiet_logger = QuietLogger()
+     with patch("zeroconf._logger.log.debug") as mock_log_debug:
+         quiet_logger.log_exception_debug("the exception")
+@@ -84,9 +85,85 @@ def test_llog_exception_debug():
+     assert mock_log_debug.mock_calls == [call("the exception", exc_info=False)]
+ 
+ 
++def test_mark_seen_absorbs_runtime_error_during_eviction() -> None:
++    """Concurrent mutation can make ``iter(seen)`` raise ``RuntimeError``.
++
++    Free-threaded (3.14t) and multi-instance sync callers share
++    ``_seen_logs``; if another thread mutates it between ``iter()``
++    and ``next()`` the iterator raises ``RuntimeError``.
++    ``_mark_seen`` must absorb that and still insert the new key.
++    """
++
++    class RacyDict(dict[str, None]):
++        def __iter__(self):  # type: ignore[override]
++            raise RuntimeError("dictionary changed size during iteration")
++
++    seen: dict[str, None] = RacyDict()
++    for i in range(_MAX_SEEN_LOGS):
++        seen[f"k-{i}"] = None
++    assert _mark_seen(seen, "new-key") is True
++    assert "new-key" in seen
++
++
++def test_mark_seen_drains_drift_above_cap() -> None:
++    """``_mark_seen`` drains a drifted-over-cap dict back to the cap.
++
++    Concurrent inserts on the free-threaded build can leave the dict
++    transiently above ``_MAX_SEEN_LOGS`` (e.g. two threads both passed
++    the ``len < cap`` check and both inserted). The next non-racing
++    call must drain the accumulated overshoot, not just evict one
++    entry — otherwise the cap silently inflates with thread count.
++    """
++    seen: dict[str, None] = {}
++    drift = 10
++    for i in range(_MAX_SEEN_LOGS + drift):
++        seen[f"k-{i}"] = None
++    assert len(seen) == _MAX_SEEN_LOGS + drift
++    assert _mark_seen(seen, "new-key") is True
++    assert len(seen) == _MAX_SEEN_LOGS
++    assert "new-key" in seen
++    for i in range(drift + 1):
++        assert f"k-{i}" not in seen
++
++
++def test_mark_seen_drains_drift_on_hit_path() -> None:
++    """``_mark_seen`` drains drift even when ``key`` is already cached.
++
++    A hit-heavy workload after a contention burst (e.g. the same
++    exception text deduplicated repeatedly) must still correct the
++    overshoot — otherwise the dict can sit permanently above the cap
++    until a miss happens to come along.
++    """
++    seen: dict[str, None] = {}
++    drift = 10
++    for i in range(_MAX_SEEN_LOGS + drift):
++        seen[f"k-{i}"] = None
++    # Hit on a non-oldest key — survives the drift drain.
++    hit_key = f"k-{_MAX_SEEN_LOGS}"
++    assert _mark_seen(seen, hit_key) is False
++    assert len(seen) == _MAX_SEEN_LOGS
++    assert hit_key in seen
++    for i in range(drift):
++        assert f"k-{i}" not in seen
++
++
++def test_seen_logs_is_bounded() -> None:
++    """``_seen_logs`` stays at the cap and evicts oldest-first (FIFO)."""
++    _logger._seen_logs.clear()
++    overflow = 5
++    with patch("zeroconf._logger.log.warning"), patch("zeroconf._logger.log.debug"):
++        for i in range(_MAX_SEEN_LOGS + overflow):
++            QuietLogger.log_warning_once(f"warning-{i}")
++    assert len(_logger._seen_logs) == _MAX_SEEN_LOGS
++    for i in range(overflow):
++        assert f"warning-{i}" not in _logger._seen_logs
++    for i in range(_MAX_SEEN_LOGS, _MAX_SEEN_LOGS + overflow):
++        assert f"warning-{i}" in _logger._seen_logs
++
++
+ def test_log_exception_once():
+     """Test we only log with warning level once."""
+-    QuietLogger._seen_logs = {}
++    _logger._seen_logs.clear()
+     quiet_logger = QuietLogger()
+     exc = Exception()
+     with (
+diff --git a/tests/test_protocol.py b/tests/test_protocol.py
+index bac2b44..782b77a 100644
+--- a/tests/test_protocol.py
++++ b/tests/test_protocol.py
+@@ -14,6 +14,8 @@ import pytest
+ 
+ import zeroconf as r
+ from zeroconf import DNSHinfo, DNSIncoming, DNSText, const, current_time_millis
++from zeroconf._logger import _MAX_SEEN_LOGS
++from zeroconf._protocol import incoming as _incoming_module
+ 
+ from . import has_working_ipv6
+ 
+@@ -962,6 +964,38 @@ def test_dns_compression_generic_failure(caplog):
+     assert "Received invalid packet from ('1.2.3.4', 5353)" in caplog.text
+ 
+ 
++def test_seen_logs_is_bounded():
++    """Corrupt packets from varying peers fill ``_seen_logs`` exactly to the cap."""
++    packet = (
++        b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x06domain\x05local\x00\x00\x01"
++        b"\x80\x01\x00\x00\x00\x01\x00\x04\xc0\xa8\xd0\x05-\x0c\x00\x01\x80\x01\x00\x00"
++        b"\x00\x01\x00\x04\xc0\xa8\xd0\x06"
++    )
++    overflow = 5
++    _incoming_module._seen_logs.clear()
++    # Snapshot the actual key the parser inserted per port. This is whatever
++    # ``str(exc_info()[1])`` produces today — the test stays agnostic to the
++    # exception text format so a future normalization of the message (see
++    # the discussion on #1714) doesn't break the assertions, while still
++    # pinning that the parser exception path actually entered the dict.
++    keys_per_port: list[str] = []
++    for port in range(_MAX_SEEN_LOGS + overflow):
++        r.DNSIncoming(packet, ("1.2.3.4", port))
++        keys_per_port.append(next(reversed(_incoming_module._seen_logs)))
++    # Bound is hit exactly.
++    assert len(_incoming_module._seen_logs) == _MAX_SEEN_LOGS
++    # Each port produced a distinct dedup key — a regression that dropped
++    # the per-packet-varying component (e.g. self.source) from the exception
++    # text would collapse all 517 calls to one key and fail this.
++    assert len(set(keys_per_port)) == _MAX_SEEN_LOGS + overflow
++    # FIFO eviction by key identity (no substring matching on the message
++    # format): the earliest ports' keys are gone, the latest ports' remain.
++    for port in range(overflow):
++        assert keys_per_port[port] not in _incoming_module._seen_logs
++    for port in range(_MAX_SEEN_LOGS, _MAX_SEEN_LOGS + overflow):
++        assert keys_per_port[port] in _incoming_module._seen_logs
++
++
+ def test_label_length_attack():
+     """Test our wire parser does not loop forever when the name exceeds 253 chars."""
+     packet = (
diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
index c405e83b8c..aa1bb11065 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.148.0.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
 SRC_URI[sha256sum] = "03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702"
 
-SRC_URI += "file://CVE-2026-47180.patch"
+SRC_URI += "file://CVE-2026-47180.patch \
+            file://CVE-2026-47183.patch \
+"
 
 inherit pypi python_poetry_core cython
 

