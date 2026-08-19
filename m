Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF45CC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:34 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4433.1787137228449757623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RmDxiOZr;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=38229; q=dns/txt;
  s=iport01; t=1787137233; x=1788346833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wRbC4YaJkUvOHiF1G37d9LNqwsBXXBjUHgAdSjFuHo0=;
  b=RmDxiOZrFLyxlTVPPSck8ytRNDjWFywahRrobECixZXUx1GAW9jK0+QV
   V7dFYamdHjcY0TBcwkIio1IvO2e7NQ62a6A4fIhWTZNQ1mvk/kNkSysOH
   gkPtuSlm2qpPcBPiAoX6+PJJDiodWSck7Z58BsGTp/RBq1NJYQS4P0+3v
   2RL3ODtX4CJoBKcbe1neOSjf0mI+aK87FQkrl/QjINtBEwHl7N130eIaT
   /a7rMD5/pErPczW9lB3OSjeMWJX0z0ii5ZGndwMpXgwuNptdvXynUeZ6U
   PtctPhQwDTp1RD9qps/hlFcrgS8/t7so3hyiHHM3gGZuKKOqVhQA847OA
   w==;
X-CSE-ConnectionGUID: qGssM7mkSZmtRSBgrs3MmA==
X-CSE-MsgGUID: gl7m/4sbRfuLOn6W/djwzQ==
X-IPAS-Result: =?us-ascii?q?A0BAAwDpi4Vq/5QQJK1aglmCV3ReQ0mVXmwDgROKUYVmj?=
 =?us-ascii?q?GWBag8BAQEPRA0EAQGEP0YCjWsCJjcGDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMaAQwLARgBGxIQHAMBAi8gCyMIGYMCAYI6A?=
 =?us-ascii?q?zcDEcNJgXkzgQGCZkIBgVTYSw2BSYEPAQsUAQWBM4U/gn+FI10YAUSCBYIzJ?=
 =?us-ascii?q?xsbgXKBFYE7gTh2gQWBGkICgScRD4ZeBIINFYEMgVqBLXJig0WDMQOHa0iBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiENyMZNnqBCV6BK?=
 =?us-ascii?q?yphARIXgQmCCgKCc4IGAgFJRREKCwsYDUgRLDcUGQQ+bgeOSSCBVFMOEgEsK?=
 =?us-ascii?q?zYBByRGAjMKFActCBcBEQ0VGzwDkmkBBwonj2WCIYE1nhxNcQoog3aMIY8+h?=
 =?us-ascii?q?XwaM4QEgVeSQJJRC5h9glmLMYQJkgVChGmBfiaBWXAVO4JnCUoZD1aNVAQKC?=
 =?us-ascii?q?4NghFBDUcZVJzICCTIBAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:yWCEXqyIYyRS0da4rJB6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVUx
 mQeUDuFb/zcYmGkc4hzboji8xlTvcTSyYQ2GQo5q1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFgZJpY9peN0OlNL6
 cYjAj8XdUumgsvjldpXSsE07igiBMDvOIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiQC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOC8YYOPJoDRLSlTtkmc+
 WeBo3/zOB8HEPuZlwXC/nCzlNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:yYG2z6hFXmnn6k0639g+DXmYKXBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3AgI7AYWjbSB/aYnOEOdhQA3zD5DJua1LG11KPJky?=
 =?us-ascii?q?DO2N1coa/RkWLo4Zhup87?=
X-Talos-MUID: 9a23:NDniwgt9N+rfcEDcX82nizU9MYA0+K6UBl0ptpNYhI6INzNiAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="809912443"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:00:32 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 0A95D18006F0E;
	Wed, 19 Aug 2026 11:00:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9DA07CCA79B; Wed, 19 Aug 2026 04:00:31 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 6/6] python3-twisted: Fix CVE-2026-42304
Date: Wed, 19 Aug 2026 04:00:16 -0700
Message-Id: <20260819110016.252278-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819110016.252278-1-hthakar@cisco.com>
References: <20260819110016.252278-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129346

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream 26.4.0rc2 backport for
CVE-2026-42304. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the patch headers.

[1] https://github.com/twisted/twisted/commit/2d196123264efb0027eecfe1b430be4a9babdbd8
[2] https://github.com/advisories/GHSA-grgv-6hw6-v9g4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/files/CVE-2026-42304_p1.patch      | 299 ++++++++++++++++
 .../python/files/CVE-2026-42304_p2.patch      |  30 ++
 .../python/files/CVE-2026-42304_p3.patch      |  33 ++
 .../python/files/CVE-2026-42304_p4.patch      | 318 ++++++++++++++++++
 .../python/files/CVE-2026-42304_p5.patch      | 218 ++++++++++++
 .../python/files/CVE-2026-42304_p6.patch      |  23 ++
 .../python/python3-twisted_25.5.0.bb          |   8 +
 7 files changed, 929 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p4.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p5.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-42304_p6.patch

diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-42304_p1.patch b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p1.patch
new file mode 100644
index 0000000000..462c4a4f8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p1.patch
@@ -0,0 +1,299 @@
+From a023e4192dbbdc7d8d6b391ef9b226c2cfffe97e Mon Sep 17 00:00:00 2001
+From: tomasilluminati <tomas.illuminati@owasp.org>
+Date: Sun, 19 Apr 2026 05:57:33 -0300
+Subject: [PATCH] (fix): denial of service in twisted.names mitigation
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/be71ecaa113f642f03083bd5ed33af47c59308c8]
+
+(cherry picked from commit be71ecaa113f642f03083bd5ed33af47c59308c8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/dns.py           | 116 +++++++++++++++++++++++++----
+ src/twisted/names/test/test_dns.py |  91 ++++++++++++++++++++++
+ 2 files changed, 193 insertions(+), 14 deletions(-)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index c7644ef50..7142d9e75 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -11,6 +11,7 @@ Future Plans:
+ from __future__ import annotations
+ 
+ # System imports
++import contextvars
+ import inspect
+ import random
+ import socket
+@@ -126,6 +127,7 @@ __all__ = [
+     "OP_UPDATE",
+     "PORT",
+     "AuthoritativeDomainError",
++    "DNSDecodeError",
+     "DNSQueryTimeoutError",
+     "DomainError",
+ ]
+@@ -444,6 +446,64 @@ def readPrecisely(file, l):
+     return buff
+ 
+ 
++# Cap the total number of compression-pointer dereferences performed while
++# decoding a single DNS message.  A hostile peer can otherwise craft a packet
++# in which every record name chases a long compression chain, forcing O(N*M)
++# work and stalling the reactor.
++MAX_COMPRESSION_POINTERS_PER_MESSAGE = 1000
++
++
++class DNSDecodeError(ValueError):
++    """
++    Raised when a DNS message cannot be decoded because it violates a
++    protocol-level safety limit
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
++    @ivar jumps: The number of compression pointers followed so far.
++    @ivar maxJumps: The inclusive upper bound on C{jumps}.  Exceeding it
++        causes L{registerJump} to raise L{DNSDecodeError}.
++    """
++
++    __slots__ = ("jumps", "maxJumps")
++
++    def __init__(self, maxJumps: int = MAX_COMPRESSION_POINTERS_PER_MESSAGE) -> None:
++        self.jumps = 0
++        self.maxJumps = maxJumps
++
++    def registerJump(self) -> None:
++        """
++        Record that a compression pointer has been followed
++
++        @raise DNSDecodeError: if the cumulative number of jumps exceeds
++            L{maxJumps}
++        """
++        self.jumps += 1
++        if self.jumps > self.maxJumps:
++            raise DNSDecodeError(
++                "Too many compression pointers while decoding DNS message "
++                f"(limit is {self.maxJumps})"
++            )
++
++
++# Tracks state across nested calls without altering every record's signature.
++# L{Message.decode} manages the lifecycle per-message, while standalone decoders
++# default to a local context when C{_decodeContextVar} is C{None}
++
++_decodeContextVar: contextvars.ContextVar[_DecodeContext | None] = (
++    contextvars.ContextVar("_dnsDecodeContext", default=None)
++)
++
++
+ class IEncodable(Interface):
+     """
+     Interface for something which can be encoded to and decoded
+@@ -591,7 +651,7 @@ class Name:
+             strio.write(label)
+         strio.write(b"\x00")
+ 
+-    def decode(self, strio, length=None):
++    def decode(self, strio, length=None, context=None):
+         """
+         Decode a byte string into this Name.
+ 
+@@ -599,12 +659,27 @@ class Name:
+         @param strio: Bytes will be read from this file until the full Name
+         is decoded.
+ 
++        @type context: L{_DecodeContext} or L{None}
++        @param context: Shared decoding state used to cap the total number
++            of compression-pointer jumps taken while decoding the enclosing
++            DNS message.  When L{None}, the context installed by
++            L{Message.decode} is used if one is active; otherwise a fresh,
++            call-local context is created so that direct callers remain
++            protected and backwards compatible.
++
+         @raise EOFError: Raised when there are not enough bytes available
+         from C{strio}.
+ 
+-        @raise ValueError: Raised when the name cannot be decoded (for example,
+-            because it contains a loop).
++        @raise ValueError: Raised when the name cannot be decoded because it
++            contains a compression loop.
++
++        @raise DNSDecodeError: Raised when the cumulative number of
++            compression-pointer jumps exceeds the configured limit.
+         """
++        if context is None:
++            context = _decodeContextVar.get()
++            if context is None:
++                context = _DecodeContext()
+         visited = set()
+         self.name = b""
+         off = 0
+@@ -616,6 +691,7 @@ class Name:
+                 return
+             if (l >> 6) == 3:
+                 new_off = (l & 63) << 8 | ord(readPrecisely(strio, 1))
++                context.registerJump()
+                 if new_off in visited:
+                     raise ValueError("Compression loop in encoded name")
+                 visited.add(new_off)
+@@ -2704,19 +2780,31 @@ class Message(tputil.FancyEqMixin):
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
++        # the context variable so nested record decoders pick it up without
++        # needing to thread it through each signature.
++        token = _decodeContextVar.set(_DecodeContext())
++        try:
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
++        finally:
++            _decodeContextVar.reset(token)
+ 
+     def parseRecords(self, list, num, strio):
+         for i in range(num):
+diff --git a/src/twisted/names/test/test_dns.py b/src/twisted/names/test/test_dns.py
+index 3b8f6e130..9b27c4b3a 100644
+--- a/src/twisted/names/test/test_dns.py
++++ b/src/twisted/names/test/test_dns.py
+@@ -352,6 +352,60 @@ class NameTests(unittest.TestCase):
+         stream = BytesIO(b"\xc0\x00")
+         self.assertRaises(ValueError, name.decode, stream)
+ 
++    def test_rejectTooManyCompressionPointers(self):
++        """
++        L{Name.decode} raises L{dns.DNSDecodeError} when the number of
++        compression-pointer dereferences taken for a single message exceeds
++        the limit carried by the shared L{dns._DecodeContext}.
++        """
++        # Five distinct pointers chained end-to-end, terminated by a zero
++        # label byte.  With a maxJumps of three the fourth dereference must
++        # trip the safety limit.
++        payload = b"\xc0\x02\xc0\x04\xc0\x06\xc0\x08\x00"
++        context = dns._DecodeContext(maxJumps=3)
++        self.assertRaises(
++            dns.DNSDecodeError,
++            dns.Name().decode,
++            BytesIO(payload),
++            None,
++            context,
++        )
++
++    def test_compressionPointerCounterIsShared(self):
++        """
++        The L{dns._DecodeContext} counter accumulates across successive
++        L{Name.decode} calls, so that a message whose individual names are
++        each within bounds is still rejected when their aggregate exceeds
++        the configured limit.
++        """
++        payload = b"\xc0\x02\xc0\x04\x00"
++        context = dns._DecodeContext(maxJumps=3)
++
++        stream = BytesIO(payload)
++        dns.Name().decode(stream, context=context)
++        self.assertEqual(context.jumps, 2)
++
++        stream.seek(0)
++        self.assertRaises(
++            dns.DNSDecodeError,
++            dns.Name().decode,
++            stream,
++            None,
++            context,
++        )
++
++    def test_decodeWithoutContextIsBackwardsCompatible(self):
++        """
++        L{Name.decode} continues to work when called without a context,
++        using a fresh per-call counter so existing callers are unaffected.
++        """
++        name = dns.Name()
++        stream = BytesIO()
++        dns.Name(b"example.org").encode(stream)
++        stream.seek(0)
++        name.decode(stream)
++        self.assertEqual(name.name, b"example.org")
++
+     def test_equality(self):
+         """
+         L{Name} instances are equal as long as they have the same value for
+@@ -761,6 +815,43 @@ class MessageTests(unittest.SynchronousTestCase):
+         """
+         self.assertEqual(dns.Message().authenticData, 0)
+ 
++    def test_rejectCompressionPointerFlood(self):
++        """
++        L{Message.decode} installs a shared compression-pointer counter and
++        raises L{dns.DNSDecodeError} when the aggregate number of pointer
++        dereferences across every record in the message exceeds
++        L{dns.MAX_COMPRESSION_POINTERS_PER_MESSAGE}.
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
diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-42304_p2.patch b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p2.patch
new file mode 100644
index 0000000000..2c5490c190
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p2.patch
@@ -0,0 +1,30 @@
+From 094d33d4073368ab1a85fcf63e3b75addb01fd6a Mon Sep 17 00:00:00 2001
+From: Tomas Illuminati Balbin <dev@tomasilluminati.com>
+Date: Mon, 20 Apr 2026 09:17:13 -0300
+Subject: [PATCH] Update src/twisted/names/dns.py
+
+Co-authored-by: Adi Roiban <adiroiban@gmail.com>
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/86e1b5490de5baa8ca284d1e6f4f0ade3e8ad7e0]
+
+(cherry picked from commit 86e1b5490de5baa8ca284d1e6f4f0ade3e8ad7e0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/dns.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index 7142d9e75..93e4080bf 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -2784,8 +2784,7 @@ class Message(tputil.FancyEqMixin):
+         # performed across every name in this message.  It is installed on
+         # the context variable so nested record decoders pick it up without
+         # needing to thread it through each signature.
+-        token = _decodeContextVar.set(_DecodeContext())
+-        try:
++        with _decodeContextVar.set(_DecodeContext()):
+             self.queries = []
+             for i in range(nqueries):
+                 q = Query()
diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-42304_p3.patch b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p3.patch
new file mode 100644
index 0000000000..9b04562ca3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p3.patch
@@ -0,0 +1,33 @@
+From 7213b262b9c98fe6d522dbd23fd83bb9535b54c6 Mon Sep 17 00:00:00 2001
+From: Tomas Illuminati Balbin <dev@tomasilluminati.com>
+Date: Mon, 20 Apr 2026 09:18:05 -0300
+Subject: [PATCH] Update src/twisted/names/test/test_dns.py
+
+Co-authored-by: Adi Roiban <adiroiban@gmail.com>
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/c75d44ed81b47f8086ed801cfcdb2568b0b32301]
+
+(cherry picked from commit c75d44ed81b47f8086ed801cfcdb2568b0b32301)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/test/test_dns.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/twisted/names/test/test_dns.py b/src/twisted/names/test/test_dns.py
+index 9b27c4b3a..94aa4a802 100644
+--- a/src/twisted/names/test/test_dns.py
++++ b/src/twisted/names/test/test_dns.py
+@@ -389,9 +389,9 @@ class NameTests(unittest.TestCase):
+         self.assertRaises(
+             dns.DNSDecodeError,
+             dns.Name().decode,
+-            stream,
+-            None,
+-            context,
++            strio=stream,
++            length=None,
++            context=context,
+         )
+ 
+     def test_decodeWithoutContextIsBackwardsCompatible(self):
diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-42304_p4.patch b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p4.patch
new file mode 100644
index 0000000000..b9b6be31bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p4.patch
@@ -0,0 +1,318 @@
+From 3cb501679cd7f45ab49d32cf72ec546ef3a64825 Mon Sep 17 00:00:00 2001
+From: Tomas Illuminati <tomas.illuminati@owasp.org>
+Date: Mon, 20 Apr 2026 10:01:39 -0300
+Subject: [PATCH] names: Refactor DNS compression mitigation
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/d7d81e08d46b3f266963ea77e5f6b4a333af455f]
+
+Backport Changes:
+- Adapted the 25.5.0 imports by moving Sequence from typing to
+  collections.abc and retaining the target's Optional and Union imports.
+
+(cherry picked from commit d7d81e08d46b3f266963ea77e5f6b4a333af455f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/dns.py                     | 113 +++++++++++++------
+ src/twisted/names/newsfragments/12626.bugfix |   1 +
+ src/twisted/names/test/test_dns.py           |  47 ++++----
+ 3 files changed, 105 insertions(+), 56 deletions(-)
+ create mode 100644 src/twisted/names/newsfragments/12626.bugfix
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index 93e4080bf..869ffec76 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -16,9 +16,11 @@ import inspect
+ import random
+ import socket
+ import struct
++from collections.abc import Sequence
++from contextlib import contextmanager
+ from io import BytesIO
+ from itertools import chain
+-from typing import Optional, Sequence, SupportsInt, Union, overload
++from typing import Final, Optional, SupportsInt, Union, overload
+ 
+ from zope.interface import Attribute, Interface, implementer
+ 
+@@ -446,17 +448,19 @@ def readPrecisely(file, l):
+     return buff
+ 
+ 
+-# Cap the total number of compression-pointer dereferences performed while
+-# decoding a single DNS message.  A hostile peer can otherwise craft a packet
+-# in which every record name chases a long compression chain, forcing O(N*M)
+-# work and stalling the reactor.
+-MAX_COMPRESSION_POINTERS_PER_MESSAGE = 1000
++MAX_COMPRESSION_POINTERS_PER_MESSAGE: Final = 1000
++"""
++Cap the total number of compression-pointer dereferences performed while
++decoding a single DNS message.  A hostile peer can otherwise craft a packet
++in which every record name chases a long compression chain, forcing
++C{O(N*M)} work and stalling the reactor.
++"""
+ 
+ 
+ class DNSDecodeError(ValueError):
+     """
+     Raised when a DNS message cannot be decoded because it violates a
+-    protocol-level safety limit
++    protocol-level safety limit.
+     """
+ 
+ 
+@@ -469,8 +473,12 @@ class _DecodeContext:
+     jumps taken across every name in the message, defending against packets
+     that fan out thousands of records pointing to deeply chained pointers.
+ 
++    This class is private.  External callers must not rely on it; the
++    per-message scope is installed and torn down by L{Message.decode}
++    through L{_decodeContextVar}.
++
+     @ivar jumps: The number of compression pointers followed so far.
+-    @ivar maxJumps: The inclusive upper bound on C{jumps}.  Exceeding it
++    @ivar maxJumps: The inclusive upper bound on L{jumps}.  Exceeding it
+         causes L{registerJump} to raise L{DNSDecodeError}.
+     """
+ 
+@@ -482,10 +490,14 @@ class _DecodeContext:
+ 
+     def registerJump(self) -> None:
+         """
+-        Record that a compression pointer has been followed
++        Record that a compression pointer has been followed.
++
++        The check is performed before any further bytes are read so the
++        caller fails fast as soon as the aggregate limit is breached, even
++        if additional records remain in the buffer.
+ 
+         @raise DNSDecodeError: if the cumulative number of jumps exceeds
+-            L{maxJumps}
++            L{maxJumps}.
+         """
+         self.jumps += 1
+         if self.jumps > self.maxJumps:
+@@ -495,15 +507,37 @@ class _DecodeContext:
+             )
+ 
+ 
+-# Tracks state across nested calls without altering every record's signature.
+-# L{Message.decode} manages the lifecycle per-message, while standalone decoders
+-# default to a local context when C{_decodeContextVar} is C{None}
+-
++# Private module-level L{contextvars.ContextVar} used to share a single
++# L{_DecodeContext} across the re-entrant calls performed while decoding one
++# DNS message.  L{contextvars} (rather than a plain module attribute) is used
++# on purpose: although Twisted's reactor is single-threaded, message decoding
++# is re-entrant across many records in a single pass and L{ContextVar}
++# guarantees the scope is restored correctly on exit -- and remains isolated
++# per-task should a future caller decode messages from multiple
++# L{asyncio}-style contexts concurrently.
+ _decodeContextVar: contextvars.ContextVar[_DecodeContext | None] = (
+     contextvars.ContextVar("_dnsDecodeContext", default=None)
+ )
+ 
+ 
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
+@@ -609,8 +643,18 @@ class Name:
+ 
+     @ivar name: A byte string giving the name.
+     @type name: L{bytes}
++
++    @cvar maxCompressionPointers: Per-message cap on the total number of
++        compression-pointer dereferences L{decode} will follow before
++        raising L{DNSDecodeError}.  Defined as a class attribute so
++        subclasses (and, in the future, individual instances) may override
++        it to tune the trade-off between tolerance for legitimately
++        verbose messages and resistance to denial-of-service attacks.
++    @type maxCompressionPointers: L{int}
+     """
+ 
++    maxCompressionPointers: int = MAX_COMPRESSION_POINTERS_PER_MESSAGE
++
+     def __init__(self, name: bytes | str = b""):
+         """
+         @param name: A name.
+@@ -651,35 +695,37 @@ class Name:
+             strio.write(label)
+         strio.write(b"\x00")
+ 
+-    def decode(self, strio, length=None, context=None):
++    def decode(self, strio, length=None):
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
+ 
+-        @type context: L{_DecodeContext} or L{None}
+-        @param context: Shared decoding state used to cap the total number
+-            of compression-pointer jumps taken while decoding the enclosing
+-            DNS message.  When L{None}, the context installed by
+-            L{Message.decode} is used if one is active; otherwise a fresh,
+-            call-local context is created so that direct callers remain
+-            protected and backwards compatible.
++        @type length: L{int} or L{None}
++        @param length: Present for compatibility with the L{IEncodable}
++            interface; ignored by this decoder.
+ 
+         @raise EOFError: Raised when there are not enough bytes available
+-        from C{strio}.
++            from C{strio}.
+ 
+-        @raise ValueError: Raised when the name cannot be decoded because it
+-            contains a compression loop.
++        @raise ValueError: Raised when the name cannot be decoded because
++            it contains a compression loop.
+ 
+         @raise DNSDecodeError: Raised when the cumulative number of
+             compression-pointer jumps exceeds the configured limit.
+         """
++        context = _decodeContextVar.get()
+         if context is None:
+-            context = _decodeContextVar.get()
+-            if context is None:
+-                context = _DecodeContext()
++            context = _DecodeContext(maxJumps=self.maxCompressionPointers)
+         visited = set()
+         self.name = b""
+         off = 0
+@@ -2782,9 +2828,10 @@ class Message(tputil.FancyEqMixin):
+ 
+         # A single shared counter bounds the total compression-pointer work
+         # performed across every name in this message.  It is installed on
+-        # the context variable so nested record decoders pick it up without
+-        # needing to thread it through each signature.
+-        with _decodeContextVar.set(_DecodeContext()):
++        # the private context variable so nested record decoders pick it up
++        # without needing to thread it through each signature.
++        decodeContext = _DecodeContext(maxJumps=Name.maxCompressionPointers)
++        with _installDecodeContext(decodeContext):
+             self.queries = []
+             for i in range(nqueries):
+                 q = Query()
+@@ -2802,8 +2849,6 @@ class Message(tputil.FancyEqMixin):
+ 
+             for l, n in items:
+                 self.parseRecords(l, n, strio)
+-        finally:
+-            _decodeContextVar.reset(token)
+ 
+     def parseRecords(self, list, num, strio):
+         for i in range(num):
+diff --git a/src/twisted/names/newsfragments/12626.bugfix b/src/twisted/names/newsfragments/12626.bugfix
+new file mode 100644
+index 000000000..44896c3e5
+--- /dev/null
++++ b/src/twisted/names/newsfragments/12626.bugfix
+@@ -0,0 +1 @@
++twisted.names was fix for Denial of Service (DoS) attack via resource exhaustion during DNS name decompression. CVE-REFERENCE HERE
+\ No newline at end of file
+diff --git a/src/twisted/names/test/test_dns.py b/src/twisted/names/test/test_dns.py
+index 94aa4a802..9626115ab 100644
+--- a/src/twisted/names/test/test_dns.py
++++ b/src/twisted/names/test/test_dns.py
+@@ -356,48 +356,51 @@ class NameTests(unittest.TestCase):
+         """
+         L{Name.decode} raises L{dns.DNSDecodeError} when the number of
+         compression-pointer dereferences taken for a single message exceeds
+-        the limit carried by the shared L{dns._DecodeContext}.
++        the limit carried by the shared L{dns._DecodeContext} installed
++        through the private L{dns._decodeContextVar}.
+         """
+         # Five distinct pointers chained end-to-end, terminated by a zero
+         # label byte.  With a maxJumps of three the fourth dereference must
+         # trip the safety limit.
+         payload = b"\xc0\x02\xc0\x04\xc0\x06\xc0\x08\x00"
+         context = dns._DecodeContext(maxJumps=3)
+-        self.assertRaises(
+-            dns.DNSDecodeError,
+-            dns.Name().decode,
+-            BytesIO(payload),
+-            None,
+-            context,
+-        )
++        with dns._installDecodeContext(context):
++            self.assertRaises(
++                dns.DNSDecodeError,
++                dns.Name().decode,
++                BytesIO(payload),
++            )
+ 
+     def test_compressionPointerCounterIsShared(self):
+         """
+         The L{dns._DecodeContext} counter accumulates across successive
+         L{Name.decode} calls, so that a message whose individual names are
+         each within bounds is still rejected when their aggregate exceeds
+-        the configured limit.
++        the configured limit.  This mirrors production: L{Message.decode}
++        invokes L{Name.decode} many times against the same stream under one
++        shared context.
+         """
+         payload = b"\xc0\x02\xc0\x04\x00"
+         context = dns._DecodeContext(maxJumps=3)
+ 
+-        stream = BytesIO(payload)
+-        dns.Name().decode(stream, context=context)
+-        self.assertEqual(context.jumps, 2)
++        with dns._installDecodeContext(context):
++            stream = BytesIO(payload)
++            dns.Name().decode(stream)
++            self.assertEqual(context.jumps, 2)
+ 
+-        stream.seek(0)
+-        self.assertRaises(
+-            dns.DNSDecodeError,
+-            dns.Name().decode,
+-            strio=stream,
+-            length=None,
+-            context=context,
+-        )
++            stream.seek(0)
++            self.assertRaises(
++                dns.DNSDecodeError,
++                dns.Name().decode,
++                stream,
++            )
+ 
+     def test_decodeWithoutContextIsBackwardsCompatible(self):
+         """
+-        L{Name.decode} continues to work when called without a context,
+-        using a fresh per-call counter so existing callers are unaffected.
++        L{Name.decode} continues to work when called with no active
++        L{dns._decodeContextVar}, using a fresh per-call counter seeded
++        from L{dns.Name.maxCompressionPointers} so existing callers are
++        unaffected.
+         """
+         name = dns.Name()
+         stream = BytesIO()
diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-42304_p5.patch b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p5.patch
new file mode 100644
index 0000000000..7c13b42fec
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p5.patch
@@ -0,0 +1,218 @@
+From 4aa0fdb33f2a12db2d234754b9b03d74df8eaf9d Mon Sep 17 00:00:00 2001
+From: Tomas Illuminati <tomas.illuminati@owasp.org>
+Date: Tue, 21 Apr 2026 17:26:49 -0300
+Subject: [PATCH] names: fix changes
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/9df6d960d3569751ebb5567093fe1d1d9f63ca54]
+
+Backport Changes:
+- Retained the 25.5.0 Optional and Union typing imports while removing
+  Final; Sequence remains sourced from collections.abc after p4.
+
+(cherry picked from commit 9df6d960d3569751ebb5567093fe1d1d9f63ca54)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/dns.py           | 37 +++++++------
+ src/twisted/names/test/test_dns.py | 85 +++++++++++++-----------------
+ 2 files changed, 56 insertions(+), 66 deletions(-)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index 869ffec76..ca5079454 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -20,7 +20,7 @@ from collections.abc import Sequence
+ from contextlib import contextmanager
+ from io import BytesIO
+ from itertools import chain
+-from typing import Final, Optional, SupportsInt, Union, overload
++from typing import Optional, SupportsInt, Union, overload
+ 
+ from zope.interface import Attribute, Interface, implementer
+ 
+@@ -448,15 +448,6 @@ def readPrecisely(file, l):
+     return buff
+ 
+ 
+-MAX_COMPRESSION_POINTERS_PER_MESSAGE: Final = 1000
+-"""
+-Cap the total number of compression-pointer dereferences performed while
+-decoding a single DNS message.  A hostile peer can otherwise craft a packet
+-in which every record name chases a long compression chain, forcing
+-C{O(N*M)} work and stalling the reactor.
+-"""
+-
+-
+ class DNSDecodeError(ValueError):
+     """
+     Raised when a DNS message cannot be decoded because it violates a
+@@ -484,7 +475,7 @@ class _DecodeContext:
+ 
+     __slots__ = ("jumps", "maxJumps")
+ 
+-    def __init__(self, maxJumps: int = MAX_COMPRESSION_POINTERS_PER_MESSAGE) -> None:
++    def __init__(self, maxJumps: int = 1000) -> None:
+         self.jumps = 0
+         self.maxJumps = maxJumps
+ 
+@@ -644,16 +635,15 @@ class Name:
+     @ivar name: A byte string giving the name.
+     @type name: L{bytes}
+ 
+-    @cvar maxCompressionPointers: Per-message cap on the total number of
++    @ivar maxCompressionPointers: Per-message cap on the total number of
+         compression-pointer dereferences L{decode} will follow before
+-        raising L{DNSDecodeError}.  Defined as a class attribute so
+-        subclasses (and, in the future, individual instances) may override
+-        it to tune the trade-off between tolerance for legitimately
+-        verbose messages and resistance to denial-of-service attacks.
+-    @type maxCompressionPointers: L{int}
++        raising L{DNSDecodeError}.  Defaults to C{1000}.  Override it on
++        a subclass or individual instance to tune the trade-off between
++        tolerance for legitimately verbose messages and resistance to
++        denial-of-service attacks.
+     """
+ 
+-    maxCompressionPointers: int = MAX_COMPRESSION_POINTERS_PER_MESSAGE
++    maxCompressionPointers: int = 1000
+ 
+     def __init__(self, name: bytes | str = b""):
+         """
+@@ -2610,8 +2600,17 @@ class Message(tputil.FancyEqMixin):
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
+@@ -2830,7 +2829,7 @@ class Message(tputil.FancyEqMixin):
+         # performed across every name in this message.  It is installed on
+         # the private context variable so nested record decoders pick it up
+         # without needing to thread it through each signature.
+-        decodeContext = _DecodeContext(maxJumps=Name.maxCompressionPointers)
++        decodeContext = _DecodeContext(maxJumps=self.maxCompressionPointers)
+         with _installDecodeContext(decodeContext):
+             self.queries = []
+             for i in range(nqueries):
+diff --git a/src/twisted/names/test/test_dns.py b/src/twisted/names/test/test_dns.py
+index 9626115ab..3be6b4546 100644
+--- a/src/twisted/names/test/test_dns.py
++++ b/src/twisted/names/test/test_dns.py
+@@ -354,60 +354,51 @@ class NameTests(unittest.TestCase):
+ 
+     def test_rejectTooManyCompressionPointers(self):
+         """
+-        L{Name.decode} raises L{dns.DNSDecodeError} when the number of
+-        compression-pointer dereferences taken for a single message exceeds
+-        the limit carried by the shared L{dns._DecodeContext} installed
+-        through the private L{dns._decodeContextVar}.
+-        """
+-        # Five distinct pointers chained end-to-end, terminated by a zero
+-        # label byte.  With a maxJumps of three the fourth dereference must
+-        # trip the safety limit.
++        L{Name.decode} raises L{dns.DNSDecodeError} when it would have to
++        follow more than L{Name.maxCompressionPointers} compression
++        pointers to finish decoding a name.
++        """
++        # Four distinct pointers chained end-to-end, terminated by a zero
++        # label byte.  With maxCompressionPointers of three the fourth
++        # dereference must trip the safety limit.
+         payload = b"\xc0\x02\xc0\x04\xc0\x06\xc0\x08\x00"
+-        context = dns._DecodeContext(maxJumps=3)
+-        with dns._installDecodeContext(context):
+-            self.assertRaises(
+-                dns.DNSDecodeError,
+-                dns.Name().decode,
+-                BytesIO(payload),
+-            )
++        name = dns.Name()
++        name.maxCompressionPointers = 3
++        self.assertRaises(
++            dns.DNSDecodeError, name.decode, BytesIO(payload)
++        )
+ 
+-    def test_compressionPointerCounterIsShared(self):
++    def test_decodeRecoversAfterDNSDecodeError(self):
+         """
+-        The L{dns._DecodeContext} counter accumulates across successive
+-        L{Name.decode} calls, so that a message whose individual names are
+-        each within bounds is still rejected when their aggregate exceeds
+-        the configured limit.  This mirrors production: L{Message.decode}
+-        invokes L{Name.decode} many times against the same stream under one
+-        shared context.
++        After L{Name.decode} raises L{dns.DNSDecodeError}, subsequent
++        L{Name.decode} calls continue to work.  No residual
++        compression-pointer counter leaks across calls, so a legitimate
++        name decoded right after a hostile one still succeeds.
+         """
+-        payload = b"\xc0\x02\xc0\x04\x00"
+-        context = dns._DecodeContext(maxJumps=3)
+-
+-        with dns._installDecodeContext(context):
+-            stream = BytesIO(payload)
+-            dns.Name().decode(stream)
+-            self.assertEqual(context.jumps, 2)
+-
+-            stream.seek(0)
+-            self.assertRaises(
+-                dns.DNSDecodeError,
+-                dns.Name().decode,
+-                stream,
+-            )
++        # First, force a DNSDecodeError by decoding a payload that
++        # exceeds the configured limit.
++        hostile = dns.Name()
++        hostile.maxCompressionPointers = 3
++        self.assertRaises(
++            dns.DNSDecodeError,
++            hostile.decode,
++            BytesIO(b"\xc0\x02\xc0\x04\xc0\x06\xc0\x08\x00"),
++        )
+ 
+-    def test_decodeWithoutContextIsBackwardsCompatible(self):
+-        """
+-        L{Name.decode} continues to work when called with no active
+-        L{dns._decodeContextVar}, using a fresh per-call counter seeded
+-        from L{dns.Name.maxCompressionPointers} so existing callers are
+-        unaffected.
+-        """
+-        name = dns.Name()
++        # Then prove the process has not been poisoned: a legitimate
++        # name still decodes normally, both with a fresh instance and
++        # with the instance that just errored.
+         stream = BytesIO()
+         dns.Name(b"example.org").encode(stream)
++
++        fresh = dns.Name()
+         stream.seek(0)
+-        name.decode(stream)
+-        self.assertEqual(name.name, b"example.org")
++        fresh.decode(stream)
++        self.assertEqual(fresh.name, b"example.org")
++
++        stream.seek(0)
++        hostile.decode(stream)
++        self.assertEqual(hostile.name, b"example.org")
+ 
+     def test_equality(self):
+         """
+@@ -823,7 +814,7 @@ class MessageTests(unittest.SynchronousTestCase):
+         L{Message.decode} installs a shared compression-pointer counter and
+         raises L{dns.DNSDecodeError} when the aggregate number of pointer
+         dereferences across every record in the message exceeds
+-        L{dns.MAX_COMPRESSION_POINTERS_PER_MESSAGE}.
++        L{dns.Message.maxCompressionPointers}.
+         """
+         chainLength = 100
+         numRecords = 8000
diff --git a/meta-python/recipes-devtools/python/files/CVE-2026-42304_p6.patch b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p6.patch
new file mode 100644
index 0000000000..2df57691e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/CVE-2026-42304_p6.patch
@@ -0,0 +1,23 @@
+From 2dc37caa8af3559e14fc1a1b36b049851d36943c Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Wed, 29 Apr 2026 15:55:05 +0100
+Subject: [PATCH] Update src/twisted/names/newsfragments/12626.bugfix
+
+CVE: CVE-2026-42304
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/9ca319ebf61386dd33354c4ade3946ef84ad58fb]
+
+(cherry picked from commit 9ca319ebf61386dd33354c4ade3946ef84ad58fb)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/twisted/names/newsfragments/12626.bugfix | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/twisted/names/newsfragments/12626.bugfix b/src/twisted/names/newsfragments/12626.bugfix
+index 44896c3e5..179b92d83 100644
+--- a/src/twisted/names/newsfragments/12626.bugfix
++++ b/src/twisted/names/newsfragments/12626.bugfix
+@@ -1 +1 @@
+-twisted.names was fix for Denial of Service (DoS) attack via resource exhaustion during DNS name decompression. CVE-REFERENCE HERE
+\ No newline at end of file
++twisted.names was fix for Denial of Service (DoS) attack via resource exhaustion during DNS name decompression. CVE-2026-42304
+\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 8ce5740e0b..3b49f56093 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -6,6 +6,14 @@ HOMEPAGE = "https://twisted.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5316a448a61a38d722c291f78d915d11"
 
+SRC_URI += "file://CVE-2026-42304_p1.patch \
+           file://CVE-2026-42304_p2.patch \
+           file://CVE-2026-42304_p3.patch \
+           file://CVE-2026-42304_p4.patch \
+           file://CVE-2026-42304_p5.patch \
+           file://CVE-2026-42304_p6.patch \
+           "
+
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
 
 CVE_PRODUCT = "twisted"
-- 
2.35.6


