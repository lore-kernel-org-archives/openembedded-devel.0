Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06999C624A5
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:51 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23004.1788152269674346202
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k6nJes+4;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8230; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P69w7RImzcVOT3BHlti4noxahk6QvE0gPm0pfOQNTJo=;
  b=k6nJes+4dInNOE5lj3Ws6qN21M+ufa87xvSD81bCCsDWQ6P/oCwDFU/E
   XMrE6aTSIywALYdP+opkIfGniDOZPj8op/34CnQbrXGR1cXxlWEhslANG
   lNPMdW0XgKQZgYSmjaETiyHKVt0PNT10C/hZfaScdodZeir8jnhJY13Sb
   8/QhyekcE6imdmPeGxGdKze2cOp4DTxhCkzIzipKd3fsxM3wdECk+ZrWP
   65SGt/txj1p8p4/1NxOOpOL6Beumq/cFx/PsV1YSzo8omUdSsb7SujzZ7
   b+p+d2Juhh8Ta17FSHvTEYzrPiu5uxPfPx25D7DMC7WcnEqEUD/RFWAfK
   Q==;
X-CSE-ConnectionGUID: mGSFDeO4Szuiyd0negFgeQ==
X-CSE-MsgGUID: j5L+sAxiTd6u1U3T+xT2JQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCvCJVq/44QJK1aglmCV3ReQ0mWSgOeGxSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjXMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEcIDgXkzgQGDK?=
 =?us-ascii?q?AE/AkNQ2zABCxQBgTiFP4giXRgBhHwnGxuBcoJQgi6BBYFcAQGBOA6GXwSCI?=
 =?us-ascii?q?oEMgVqBF5EISIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BK?=
 =?us-ascii?q?IQPIxk2eoEJXoErKWABEheBCYIIAoJaggUCAUlDDgdHUwkECxgNSBEsNxUZB?=
 =?us-ascii?q?D5uB456H4JLgQ4BKgGBfRc0kxCSSoE1n1oKKIN2jCKVOhozhVulEQuYfYs3g?=
 =?us-ascii?q?lOVWnaEaYFoPIFHCwdwFTuCZwlKGQ+OKg4Lg2CBf4NlxlUnMgIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAYEdYAEB?=
IronPort-Data: A9a23:ItFTjaJvtmTNg5cyFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShWMHy
 WoaXGCDPvaMN2fxe40iPtzg9xtSsMWEy4BhT1Md+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Usajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1rI3oYEYA/pt1lHGBf+
 aQeJT8jYR260rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhiuGzaYSOKoHiqcN9nBu85
 Xnv72XFDk8HbeHE9XmVziiOv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:8Eq7I6/cPo0uStqTSv5uk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:2JF1/m7SUodxBEY01Nss8WEvNOwoVSHm3mrRMkPgD2tmZrKYcArF
X-Talos-MUID: 9a23:N9S9oAWRd7nvfz/q/D2xoHJ5Hddp36jwFRkwyqlFq/XeFxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="821616385"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id A1FB118000220;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E017FCD02BE; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 7/9] python3-aiohttp: fix CVE-2026-34513
Date: Sun, 30 Aug 2026 21:57:42 -0700
Message-Id: <20260831045744.3321483-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129606

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

[1] https://github.com/aio-libs/aiohttp/commit/c4d77c3533122be353b8afca8e8675e3b4cbda98
[2] https://github.com/aio-libs/aiohttp/commit/8ab84c52fe58ef34794fa9b12f00b06e626adcc0
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34513

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34513.patch      | 211 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 212 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch
new file mode 100644
index 0000000000..be8c3e4d0f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch
@@ -0,0 +1,211 @@
+From d094b4d3ad66d824ebfc8900234dff7aaf4acec0 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sun, 22 Feb 2026 12:58:22 +0000
+Subject: [PATCH] Bound DNS cache (#12106) (#12117)
+
+---------
+
+CVE: CVE-2026-34513
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/c4d77c3533122be353b8afca8e8675e3b4cbda98]
+
+Backport Changes:
+- Imported OrderedDict for the aiohttp 3.9.5 collections layout.
+- Kept Dict[str, Any] because 3.9.5 lacks ResolveResult.
+- Removed ResolveResult annotations from the backported tests.
+- Kept family: int = 0 from the 3.9.5 connector API.
+- Kept _throttle_dns_events from the 3.9.5 DNS flow.
+
+(cherry picked from commit 8ab84c52fe58ef34794fa9b12f00b06e626adcc0)
+Co-authored-by: gonas <nhjangh@gamil.com>
+(cherry picked from commit c4d77c3533122be353b8afca8e8675e3b4cbda98)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12106.feature.rst |  1 +
+ aiohttp/connector.py      | 26 ++++++++++----
+ tests/test_connector.py   | 76 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 96 insertions(+), 7 deletions(-)
+ create mode 100644 CHANGES/12106.feature.rst
+
+diff --git a/CHANGES/12106.feature.rst b/CHANGES/12106.feature.rst
+new file mode 100644
+index 000000000..daa9088ee
+--- /dev/null
++++ b/CHANGES/12106.feature.rst
+@@ -0,0 +1 @@
++Added a ``dns_cache_max_size`` parameter to ``TCPConnector`` to limit the size of the cache -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/connector.py b/aiohttp/connector.py
+index f95ebe84c..7267d9a5c 100644
+--- a/aiohttp/connector.py
++++ b/aiohttp/connector.py
+@@ -4,7 +4,7 @@ import random
+ import sys
+ import traceback
+ import warnings
+-from collections import defaultdict, deque
++from collections import OrderedDict, defaultdict, deque
+ from contextlib import suppress
+ from http import HTTPStatus
+ from http.cookies import SimpleCookie
+@@ -690,25 +690,33 @@ class BaseConnector:
+ 
+ 
+ class _DNSCacheTable:
+-    def __init__(self, ttl: Optional[float] = None) -> None:
+-        self._addrs_rr: Dict[Tuple[str, int], Tuple[Iterator[Dict[str, Any]], int]] = {}
++    def __init__(self, ttl: Optional[float] = None, max_size: int = 1000) -> None:
++        self._addrs_rr: OrderedDict[
++            Tuple[str, int], Tuple[Iterator[Dict[str, Any]], int]
++        ] = OrderedDict()
+         self._timestamps: Dict[Tuple[str, int], float] = {}
+         self._ttl = ttl
++        self._max_size = max_size
+ 
+     def __contains__(self, host: object) -> bool:
+         return host in self._addrs_rr
+ 
+     def add(self, key: Tuple[str, int], addrs: List[Dict[str, Any]]) -> None:
++        if key in self._addrs_rr:
++            self._addrs_rr.move_to_end(key)
++
+         self._addrs_rr[key] = (cycle(addrs), len(addrs))
+ 
+         if self._ttl is not None:
+             self._timestamps[key] = monotonic()
+ 
++        if len(self._addrs_rr) > self._max_size:
++            oldest_key, _ = self._addrs_rr.popitem(last=False)
++            self._timestamps.pop(oldest_key, None)
++
+     def remove(self, key: Tuple[str, int]) -> None:
+         self._addrs_rr.pop(key, None)
+-
+-        if self._ttl is not None:
+-            self._timestamps.pop(key, None)
++        self._timestamps.pop(key, None)
+ 
+     def clear(self) -> None:
+         self._addrs_rr.clear()
+@@ -719,6 +727,7 @@ class _DNSCacheTable:
+         addrs = list(islice(loop, length))
+         # Consume one more element to shift internal state of `cycle`
+         next(loop)
++        self._addrs_rr.move_to_end(key)
+         return addrs
+ 
+     def expired(self, key: Tuple[str, int]) -> bool:
+@@ -760,6 +769,7 @@ class TCPConnector(BaseConnector):
+         fingerprint: Optional[bytes] = None,
+         use_dns_cache: bool = True,
+         ttl_dns_cache: Optional[int] = 10,
++        dns_cache_max_size: int = 1000,
+         family: int = 0,
+         ssl_context: Optional[SSLContext] = None,
+         ssl: Union[bool, Fingerprint, SSLContext] = True,
+@@ -789,7 +799,9 @@ class TCPConnector(BaseConnector):
+         self._resolver = resolver
+ 
+         self._use_dns_cache = use_dns_cache
+-        self._cached_hosts = _DNSCacheTable(ttl=ttl_dns_cache)
++        self._cached_hosts = _DNSCacheTable(
++            ttl=ttl_dns_cache, max_size=dns_cache_max_size
++        )
+         self._throttle_dns_events: Dict[Tuple[str, int], EventResultOrError] = {}
+         self._family = family
+         self._local_addr = local_addr
+diff --git a/tests/test_connector.py b/tests/test_connector.py
+index 02e48bc10..dd5e2c9e1 100644
+--- a/tests/test_connector.py
++++ b/tests/test_connector.py
+@@ -2197,6 +2197,25 @@ async def test_named_pipe_connector(
+ 
+ 
+ class TestDNSCacheTable:
++    host1 = ("localhost", 80)
++    host2 = ("foo", 80)
++    result1 = {
++        "hostname": "localhost",
++        "host": "127.0.0.1",
++        "port": 80,
++        "family": socket.AF_INET,
++        "proto": 0,
++        "flags": socket.AI_NUMERICHOST,
++    }
++    result2 = {
++        "hostname": "foo",
++        "host": "127.0.0.2",
++        "port": 80,
++        "family": socket.AF_INET,
++        "proto": 0,
++        "flags": socket.AI_NUMERICHOST,
++    }
++
+     @pytest.fixture
+     def dns_cache_table(self):
+         return _DNSCacheTable()
+@@ -2282,6 +2301,63 @@ class TestDNSCacheTable:
+         addrs = dns_cache_table.next_addrs("foo")
+         assert addrs == ["127.0.0.1"]
+ 
++    def test_max_size_eviction(self) -> None:
++        table = _DNSCacheTable(max_size=2)
++
++        table.add(self.host1, [self.result1])
++        table.add(self.host2, [self.result2])
++
++        host3 = ("example.com", 80)
++        result3 = {
++            **self.result1,
++            "hostname": "example.com",
++            "host": "1.2.3.4",
++        }
++        table.add(host3, [result3])
++
++        assert len(table._addrs_rr) == 2
++        assert self.host1 not in table._addrs_rr
++        assert host3 in table._addrs_rr
++
++    def test_lru_eviction(self) -> None:
++        table = _DNSCacheTable(max_size=2)
++
++        table.add(self.host1, [self.result1])
++        table.add(self.host2, [self.result2])
++
++        table.next_addrs(self.host1)
++
++        host3 = ("example.com", 80)
++        result3 = {
++            **self.result1,
++            "hostname": "example.com",
++            "host": "1.2.3.4",
++        }
++        table.add(host3, [result3])
++
++        assert self.host1 in table._addrs_rr
++        assert self.host2 not in table._addrs_rr
++
++    def test_lru_eviction_add(self) -> None:
++        table = _DNSCacheTable(max_size=2)
++
++        table.add(self.host1, [self.result1])
++        table.add(self.host2, [self.result2])
++
++        # Re-add, thus making host1 the most recently used.
++        table.add(self.host1, [self.result1])
++
++        host3 = ("example.com", 80)
++        result3 = {
++            **self.result1,
++            "hostname": "example.com",
++            "host": "1.2.3.4",
++        }
++        table.add(host3, [result3])
++
++        assert self.host1 in table._addrs_rr
++        assert self.host2 not in table._addrs_rr
++
+ 
+ async def test_connector_cache_trace_race():
+     class DummyTracer:
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index f6731a64b3..e104b62e1e 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-69223.patch \
            file://CVE-2026-22815.patch \
            file://CVE-2026-34514.patch \
+           file://CVE-2026-34513.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.35.6


