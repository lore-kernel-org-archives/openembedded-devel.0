Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09888C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:51:54 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13114.1785995511396216566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ih74iBxe;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14833; q=dns/txt;
  s=iport01; t=1785995511; x=1787205111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mn/MGvpRGi12zNJJxbRAK2qJ4h9NAYwWr/AO0VbJPmY=;
  b=ih74iBxeTB/RCV14Bg+gGNCm0DuF5450Zbz0kit4kk0AjaSvXUTzdTQq
   Qnbcm42BFCavCq9E+HdY32M7HPOqw7aOentxybP6U1rQ5tqgm1Dhkj1Tc
   w8N9GTl8uc+fwo6AGp99LZn2R6Tyyu9sGvGZ9MxTRMlTA3S+ZY2bDIjfq
   Ibo4NzEyFwF3Nx4fN71Yb3pwyVQhrnUh7VDRcp1miLUU+cnBI5Mxn+bgH
   3zOL/iNqwvWM1+A9dv8P46N55CK5kz1sWL4QoSN2NUdcVASynHm+Cl4Fs
   Ag9gLdmbiquQ381jciEDADFIEUmriYUA2foIJ8iolhCK2f2TB0lr3wcrr
   A==;
X-CSE-ConnectionGUID: th0LdhjvQZa9dUbyKo3ffg==
X-CSE-MsgGUID: /Ky255y5QwKo0/muNkNYig==
X-IPAS-Result: =?us-ascii?q?A0BLAgC5IHRq/4wQJK1aglmCV3ReQ0mVXmwDgROKUYVmj?=
 =?us-ascii?q?FEUgWoPAQEBD0QNBAEBhD9GAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvIAsjCBkagmgBgjoDN?=
 =?us-ascii?q?wMRvHSBeTOBAYJmQgGBVNhJDYFJgQ8BCxQBBYEzhT+CfoUjXRgBRIQ4Jxsbg?=
 =?us-ascii?q?XKBFYJzdoEFgRpCAoEnEQ+GXgSCDRWBDIFaHoEteGKDR4NcA4ZLSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRoIxk2eoEJXoEtKmQBE?=
 =?us-ascii?q?heBCYJvAoJ6gSkLGA1IESw3FBkEPm4HjX8ggU5TDhIBFRdhAQckRgIzChQHL?=
 =?us-ascii?q?QgXAR4VGzySbAERkAyCIYpzlF5NcQoog3WMIY8+hXwaM4QEgVeSQJJRC5h9j?=
 =?us-ascii?q?gqECZIFQoRpgWg8gVlwFTuCZwlKGQ9WjVQECguDYIRQQ1HGVScyAgkyAQEHA?=
 =?us-ascii?q?gcOAwuBaJAAASeBVgEB?=
IronPort-Data: A9a23:lgPvRqx5hMRL+zpuBrV6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUCm
 GtMXDiCPP3cazT0ft5wbN+19koDuZ6Bz9NiTQY4/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj9MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF02ZakU+uRpOFNHp
 PAlIiEuaUuNie3jldpXSsE07igiBMDvOIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiYC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOC1aIeEJozSLSlTtgG7t
 zibonWkOw45M4TYzCej8VSdh+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:pLhydKDDcHHKFM7lHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:4wPeHmB8NGVgLCT6EzVnrGoYGsI7S0/UnXvtKV6bDj1nRrLAHA==
X-Talos-MUID: 9a23:bHYGDAkPPasYRx9PWFafdnolF9Yyvvm/VXkSspJe/MyZEy9WCjaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="800059480"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:51:30 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 4AF101800042F;
	Thu,  6 Aug 2026 05:51:30 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id EA517CC12A6; Wed,  5 Aug 2026 22:51:29 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 5/5] python3-twisted: Fix CVE-2026-42304
Date: Wed,  5 Aug 2026 22:51:01 -0700
Message-Id: <20260806055101.23160-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260806055101.23160-1-hthakar@cisco.com>
References: <20260806055101.23160-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128836

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 26.4.0rc2 backport for
CVE-2026-42304. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch header
because the fix expands to multiple commits.

[1] https://github.com/twisted/twisted/commit/2d196123264efb0027eecfe1b430be4a9babdbd8
[2] https://github.com/advisories/GHSA-grgv-6hw6-v9g4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-twisted/CVE-2026-42304.patch      | 369 ++++++++++++++++++
 .../python/python3-twisted_24.3.0.bb          |   2 +-
 2 files changed, 370 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-42304.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-42304.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-42304.patch
new file mode 100644
index 0000000000..e43ae68977
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-42304.patch
@@ -0,0 +1,369 @@
+From 6a1c3399c54a874673a565601bac999ab400c666 Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Wed, 29 Apr 2026 16:03:39 +0100
+Subject: [PATCH] Merge commit from fork
+
+names: mitigate DNS compression-pointer flood (GHSA-grgv-6hw6-v9g4)
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/2d196123264efb0027eecfe1b430be4a9babdbd8]
+
+Backport Changes:
+- Expanded the upstream merge and applied its complete first-parent code
+  and regression-test changes.
+- The expanded dependency sequence is be71ecaa113f642f03083bd5ed33af47c59308c8,
+  86e1b5490de5baa8ca284d1e6f4f0ade3e8ad7e0,
+  c75d44ed81b47f8086ed801cfcdb2568b0b32301,
+  d7d81e08d46b3f266963ea77e5f6b4a333af455f,
+  9df6d960d3569751ebb5567093fe1d1d9f63ca54, and
+  9ca319ebf61386dd33354c4ade3946ef84ad58fb.
+- Retained Scarthgap's `typing.Sequence` import instead of the newer
+  `collections.abc.Sequence` import.
+- Omitted the release-news fragment; it does not affect the fix.
+
+(cherry picked from commit 2d196123264efb0027eecfe1b430be4a9babdbd8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/dns.py           | 160 ++++++++++++++++++++++++++---
+ src/twisted/names/test/test_dns.py |  85 +++++++++++++++
+ 2 files changed, 230 insertions(+), 15 deletions(-)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index c7644ef50..4d093720d 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -11,10 +11,12 @@ Future Plans:
+ from __future__ import annotations
+ 
+ # System imports
++import contextvars
+ import inspect
+ import random
+ import socket
+ import struct
++from contextlib import contextmanager
+ from io import BytesIO
+ from itertools import chain
+ from typing import Optional, Sequence, SupportsInt, Union, overload
+@@ -126,6 +128,7 @@ __all__ = [
+     "OP_UPDATE",
+     "PORT",
+     "AuthoritativeDomainError",
++    "DNSDecodeError",
+     "DNSQueryTimeoutError",
+     "DomainError",
+ ]
+@@ -444,6 +447,87 @@ def readPrecisely(file, l):
+     return buff
+ 
+ 
++class DNSDecodeError(ValueError):
++    """
++    Raised when a DNS message cannot be decoded because it violates a
++    protocol-level safety limit.
++    """
++
++
++class _DecodeContext:
++    """
++    Mutable state shared between the L{IEncodable} decoders invoked while
++    reading a single DNS message.
++
++    The primary purpose is to bound the total number of compression-pointer
++    jumps taken across every name in the message, defending against packets
++    that fan out thousands of records pointing to deeply chained pointers.
++
++    This class is private.  External callers must not rely on it; the
++    per-message scope is installed and torn down by L{Message.decode}
++    through L{_decodeContextVar}.
++
++    @ivar jumps: The number of compression pointers followed so far.
++    @ivar maxJumps: The inclusive upper bound on L{jumps}.  Exceeding it
++        causes L{registerJump} to raise L{DNSDecodeError}.
++    """
++
++    __slots__ = ("jumps", "maxJumps")
++
++    def __init__(self, maxJumps: int = 1000) -> None:
++        self.jumps = 0
++        self.maxJumps = maxJumps
++
++    def registerJump(self) -> None:
++        """
++        Record that a compression pointer has been followed.
++
++        The check is performed before any further bytes are read so the
++        caller fails fast as soon as the aggregate limit is breached, even
++        if additional records remain in the buffer.
++
++        @raise DNSDecodeError: if the cumulative number of jumps exceeds
++            L{maxJumps}.
++        """
++        self.jumps += 1
++        if self.jumps > self.maxJumps:
++            raise DNSDecodeError(
++                "Too many compression pointers while decoding DNS message "
++                f"(limit is {self.maxJumps})"
++            )
++
++
++# Private module-level L{contextvars.ContextVar} used to share a single
++# L{_DecodeContext} across the re-entrant calls performed while decoding one
++# DNS message.  L{contextvars} (rather than a plain module attribute) is used
++# on purpose: although Twisted's reactor is single-threaded, message decoding
++# is re-entrant across many records in a single pass and L{ContextVar}
++# guarantees the scope is restored correctly on exit -- and remains isolated
++# per-task should a future caller decode messages from multiple
++# L{asyncio}-style contexts concurrently.
++_decodeContextVar: contextvars.ContextVar[_DecodeContext | None] = (
++    contextvars.ContextVar("_dnsDecodeContext", default=None)
++)
++
++
++@contextmanager
++def _installDecodeContext(context: _DecodeContext):
++    """
++    Install C{context} on L{_decodeContextVar} for the duration of the
++    C{with} block and restore the previous value on exit.
++
++    This wraps the L{contextvars.ContextVar.set} / L{contextvars.ContextVar.reset}
++    token dance so call sites can use a plain C{with} statement.
++
++    @param context: The L{_DecodeContext} to install as the active context.
++    """
++    token = _decodeContextVar.set(context)
++    try:
++        yield context
++    finally:
++        _decodeContextVar.reset(token)
++
++
+ class IEncodable(Interface):
+     """
+     Interface for something which can be encoded to and decoded
+@@ -549,8 +633,17 @@ class Name:
+ 
+     @ivar name: A byte string giving the name.
+     @type name: L{bytes}
++
++    @ivar maxCompressionPointers: Per-message cap on the total number of
++        compression-pointer dereferences L{decode} will follow before
++        raising L{DNSDecodeError}.  Defaults to C{1000}.  Override it on
++        a subclass or individual instance to tune the trade-off between
++        tolerance for legitimately verbose messages and resistance to
++        denial-of-service attacks.
+     """
+ 
++    maxCompressionPointers: int = 1000
++
+     def __init__(self, name: bytes | str = b""):
+         """
+         @param name: A name.
+@@ -595,16 +688,33 @@ class Name:
+         """
+         Decode a byte string into this Name.
+ 
++        When invoked from L{Message.decode}, a shared compression-pointer
++        counter is picked up transparently from the private
++        L{_decodeContextVar}.  Standalone callers get a fresh per-call
++        counter seeded from L{maxCompressionPointers}, so existing code
++        keeps working unchanged while still being protected against
++        pathological inputs.
++
+         @type strio: file
+         @param strio: Bytes will be read from this file until the full Name
+-        is decoded.
++            is decoded.
++
++        @type length: L{int} or L{None}
++        @param length: Present for compatibility with the L{IEncodable}
++            interface; ignored by this decoder.
+ 
+         @raise EOFError: Raised when there are not enough bytes available
+-        from C{strio}.
++            from C{strio}.
++
++        @raise ValueError: Raised when the name cannot be decoded because
++            it contains a compression loop.
+ 
+-        @raise ValueError: Raised when the name cannot be decoded (for example,
+-            because it contains a loop).
++        @raise DNSDecodeError: Raised when the cumulative number of
++            compression-pointer jumps exceeds the configured limit.
+         """
++        context = _decodeContextVar.get()
++        if context is None:
++            context = _DecodeContext(maxJumps=self.maxCompressionPointers)
+         visited = set()
+         self.name = b""
+         off = 0
+@@ -616,6 +726,7 @@ class Name:
+                 return
+             if (l >> 6) == 3:
+                 new_off = (l & 63) << 8 | ord(readPrecisely(strio, 1))
++                context.registerJump()
+                 if new_off in visited:
+                     raise ValueError("Compression loop in encoded name")
+                 visited.add(new_off)
+@@ -2488,8 +2599,17 @@ class Message(tputil.FancyEqMixin):
+         header fields.
+     @ivar _sectionNames: The names of attributes representing the record
+         sections of this message.
++
++    @ivar maxCompressionPointers: Per-message cap on the total number of
++        compression-pointer dereferences L{decode} will follow across every
++        name in the message before raising L{DNSDecodeError}.  Defaults to
++        C{1000}.  Override it on a subclass or individual instance to tune
++        the trade-off between tolerance for legitimately verbose messages
++        and resistance to denial-of-service attacks.
+     """
+ 
++    maxCompressionPointers: int = 1000
++
+     compareAttributes = (
+         "id",
+         "answer",
+@@ -2704,19 +2824,29 @@ class Message(tputil.FancyEqMixin):
+         self.checkingDisabled = (byte4 >> 4) & 1
+         self.rCode = byte4 & 0xF
+ 
+-        self.queries = []
+-        for i in range(nqueries):
+-            q = Query()
+-            try:
+-                q.decode(strio)
+-            except EOFError:
+-                return
+-            self.queries.append(q)
++        # A single shared counter bounds the total compression-pointer work
++        # performed across every name in this message.  It is installed on
++        # the private context variable so nested record decoders pick it up
++        # without needing to thread it through each signature.
++        decodeContext = _DecodeContext(maxJumps=self.maxCompressionPointers)
++        with _installDecodeContext(decodeContext):
++            self.queries = []
++            for i in range(nqueries):
++                q = Query()
++                try:
++                    q.decode(strio)
++                except EOFError:
++                    return
++                self.queries.append(q)
+ 
+-        items = ((self.answers, nans), (self.authority, nns), (self.additional, nadd))
++            items = (
++                (self.answers, nans),
++                (self.authority, nns),
++                (self.additional, nadd),
++            )
+ 
+-        for l, n in items:
+-            self.parseRecords(l, n, strio)
++            for l, n in items:
++                self.parseRecords(l, n, strio)
+ 
+     def parseRecords(self, list, num, strio):
+         for i in range(num):
+diff --git a/src/twisted/names/test/test_dns.py b/src/twisted/names/test/test_dns.py
+index 3b8f6e130..3be6b4546 100644
+--- a/src/twisted/names/test/test_dns.py
++++ b/src/twisted/names/test/test_dns.py
+@@ -352,6 +352,54 @@ class NameTests(unittest.TestCase):
+         stream = BytesIO(b"\xc0\x00")
+         self.assertRaises(ValueError, name.decode, stream)
+ 
++    def test_rejectTooManyCompressionPointers(self):
++        """
++        L{Name.decode} raises L{dns.DNSDecodeError} when it would have to
++        follow more than L{Name.maxCompressionPointers} compression
++        pointers to finish decoding a name.
++        """
++        # Four distinct pointers chained end-to-end, terminated by a zero
++        # label byte.  With maxCompressionPointers of three the fourth
++        # dereference must trip the safety limit.
++        payload = b"\xc0\x02\xc0\x04\xc0\x06\xc0\x08\x00"
++        name = dns.Name()
++        name.maxCompressionPointers = 3
++        self.assertRaises(
++            dns.DNSDecodeError, name.decode, BytesIO(payload)
++        )
++
++    def test_decodeRecoversAfterDNSDecodeError(self):
++        """
++        After L{Name.decode} raises L{dns.DNSDecodeError}, subsequent
++        L{Name.decode} calls continue to work.  No residual
++        compression-pointer counter leaks across calls, so a legitimate
++        name decoded right after a hostile one still succeeds.
++        """
++        # First, force a DNSDecodeError by decoding a payload that
++        # exceeds the configured limit.
++        hostile = dns.Name()
++        hostile.maxCompressionPointers = 3
++        self.assertRaises(
++            dns.DNSDecodeError,
++            hostile.decode,
++            BytesIO(b"\xc0\x02\xc0\x04\xc0\x06\xc0\x08\x00"),
++        )
++
++        # Then prove the process has not been poisoned: a legitimate
++        # name still decodes normally, both with a fresh instance and
++        # with the instance that just errored.
++        stream = BytesIO()
++        dns.Name(b"example.org").encode(stream)
++
++        fresh = dns.Name()
++        stream.seek(0)
++        fresh.decode(stream)
++        self.assertEqual(fresh.name, b"example.org")
++
++        stream.seek(0)
++        hostile.decode(stream)
++        self.assertEqual(hostile.name, b"example.org")
++
+     def test_equality(self):
+         """
+         L{Name} instances are equal as long as they have the same value for
+@@ -761,6 +809,43 @@ class MessageTests(unittest.SynchronousTestCase):
+         """
+         self.assertEqual(dns.Message().authenticData, 0)
+ 
++    def test_rejectCompressionPointerFlood(self):
++        """
++        L{Message.decode} installs a shared compression-pointer counter and
++        raises L{dns.DNSDecodeError} when the aggregate number of pointer
++        dereferences across every record in the message exceeds
++        L{dns.Message.maxCompressionPointers}.
++        """
++        chainLength = 100
++        numRecords = 8000
++        header = struct.pack(
++            "!H2B4H", 0x1234, 0x80, 0x00, 0, numRecords, 0, 0
++        )
++
++        # Long compression chain inside the RDATA of an unknown
++        # record so that subsequent records can aim pointers at it.
++        owner = b"\x04rrrr\x00"
++        chainBase = len(header) + len(owner) + 10
++        chain = bytearray()
++        for i in range(chainLength):
++            chain += struct.pack("!H", 0xC000 | (chainBase + 2 * (i + 1)))
++        chain += b"\x04test\x00"
++
++        firstRecord = (
++            owner
++            + struct.pack("!HHIH", 999, 1, 0, len(chain))
++            + bytes(chain)
++        )
++        followupRecord = (
++            struct.pack("!H", 0xC000 | chainBase)
++            + struct.pack("!HHIH", 1, 1, 0, 4)
++            + b"\x00\x00\x00\x00"
++        )
++        payload = header + firstRecord + followupRecord * (numRecords - 1)
++
++        message = dns.Message()
++        self.assertRaises(dns.DNSDecodeError, message.decode, BytesIO(payload))
++
+     def test_authenticDataOverride(self):
+         """
+         L{dns.Message.__init__} accepts a C{authenticData} argument which
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 691b80ac68..59aef8a606 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 SRC_URI += " \
     file://CVE-2024-41671.patch \
     file://CVE-2024-41810.patch \
+    file://CVE-2026-42304.patch \
 "
 
 SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"
@@ -178,4 +179,3 @@ FILES:${PN}-pair = " \
 FILES:${PN}-doc += " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/_pydoctortemplates \
 "
-
-- 
2.35.6


