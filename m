Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12460.1795500044055481053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WVLeU1rU;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=26487; q=dns/txt;
  s=iport01; t=1795500044; x=1796709644;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=H07cmVmgxd0rALBWLQffowcfapWfOOcXAgrep/XnMGg=;
  b=WVLeU1rUeoz3SvCH0kMZRwUievqOHZaAk0x1wPYWy58qYcDd0PQ+fnex
   q1crxEw8+B0GexIjECEiGhqWy5/jThbIbez68Jdz07NJZHQ9tIY8vtMWe
   M/7vE0VcSQQUVKb+qFMNuKMO0RMhdTrzKt5W7TDCMffJ6cvk4lHNQBwvg
   9RXhgRBq1UkPtG0y2J6oaGsF5KpIi9T+hicrZesHwaFeibb0myRo+fmYZ
   5tXQJa28ALlWc/M7TW1BkyuPPqkYteWnDh/5lVxFbmfQp7oQgkHVvDrmV
   3g4gC5S2Cq0c3uACSJdH09CX4iQiYd4+TaHqUYct6y6xLXNxTp/dw5Nl6
   g==;
X-CSE-ConnectionGUID: h2iz4VLDQTyNlLpVnwlz5g==
X-CSE-MsgGUID: mD40DWE/StmpcjTH9486FQ==
X-IPAS-Result: =?us-ascii?q?A0AUBABaJwVr/9BK/pBaglmCV3VgQ0mUKoIhA4pMgRqFa?=
 =?us-ascii?q?oxZgX4PAQEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAxoNCwEYAT0cAwECLyALIwgZgwIBgjoDN?=
 =?us-ascii?q?wMRum+BeTOBAYMpAT8CQ1DYTA1ygWgBCxQBgTiFQoMAhSRdGAGEfScbgUlEg?=
 =?us-ascii?q?lCBOXaBBYEaQgEBgScGG4ZeBIIiehKBVIECCYwMAoFPiElIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQM?=
 =?us-ascii?q?B4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgihyAUpDA?=
 =?us-ascii?q?QckBBA0PQwHK1AgCxAYD5JIJJJAinOVLXGEK4wkjz6FfBozhVulFwuYfY4Kh?=
 =?us-ascii?q?AqCS48MCCYLN4RqgWg8gUcLBzMaCBsVO4JnCUoZD44rDguDYIF/g2VLEcgbJ?=
 =?us-ascii?q?jICCTIBAQcCBw4DC4FokAABJwSBUgEB?=
IronPort-Data: A9a23:sVUM/6PGxAi7Xw7vrR3wlsFynXyQoLVcMsEvi/4bfWQNrUoi1jIAx
 mdNXWmPbKqCN2OnfIgla9yx9xgB75KAx9VjSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWIsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/U0DVNqA6k0w9pmJ2Vq7
 cIeNzQfMx/W0opawJrjIgVtrs0uNozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I/BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCNllIgi+axa7I5fPSPaZkNsnm14
 Vna+nzyAC06ZYDPlxS8pyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgaWEW2pdG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnSjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:YsyEFKOPwbVW4cBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:wcITPG8WUYjsLzuLxLiVv05OG9J5TFnx9UvBBUucEVhvV7mHFFDFrQ==
X-Talos-MUID: 9a23:56AsNAqy//igBm9LrqYezzROaJ9E3InpM1wIiZ4Eh+nVaXwuFQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62693643"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:00:40 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 873C718000441
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:39 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id BDC23CC124B; Mon, 23 Nov 2026 22:00:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 5/5] python3-twisted: Fix CVE-2026-115778
Date: Mon, 23 Nov 2026 22:00:35 -0800
Message-Id: <20261124060035.1651451-6-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124060035.1651451-1-yurade@cisco.com>
References: <20261124060035.1651451-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132926
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [5],
using the commit shown in [1], [2], [3] and [4].

[1] https://github.com/twisted/twisted/commit/5d91cc66a3591faba758a80a1479e0103602facc
[2] https://github.com/twisted/twisted/commit/073ba878c6c07d569cb61abc5ae76d46eff1b529
[3] https://github.com/twisted/twisted/commit/306985969879a8aeab811e9730b3d0e54ff372e8
[4] https://github.com/twisted/twisted/commit/1baff09a1d56ca9254a6d6f02005f17a7c53a282
[5] https://github.com/twisted/twisted/pull/12750
[6] https://nvd.nist.gov/vuln/detail/cve-2026-115778

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-twisted/CVE-2026-115778_p1.patch  | 105 +++++++
 .../python3-twisted/CVE-2026-115778_p2.patch  | 286 ++++++++++++++++++
 .../python3-twisted/CVE-2026-115778_p3.patch  | 108 +++++++
 .../python3-twisted/CVE-2026-115778_p4.patch  |  36 +++
 .../python/python3-twisted_25.5.0.bb          |   4 +
 5 files changed, 539 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p4.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p1.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p1.patch
new file mode 100644
index 0000000000..86900be690
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p1.patch
@@ -0,0 +1,105 @@
+From 5d91cc66a3591faba758a80a1479e0103602facc Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Thu, 30 Jul 2026 11:07:01 +0200
+Subject: [PATCH] conch.telnet: bound the subnegotiation buffer to prevent a memory DoS (Fixes #12706)
+
+CVE: CVE-2026-115778
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/5d91cc66a3591faba758a80a1479e0103602facc]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/conch/newsfragments/12706.bugfix |  1 +
+ src/twisted/conch/telnet.py                  | 12 +++++++--
+ src/twisted/conch/test/test_telnet.py        | 27 ++++++++++++++++++++
+ 3 files changed, 38 insertions(+), 2 deletions(-)
+ create mode 100644 src/twisted/conch/newsfragments/12706.bugfix
+
+diff --git a/src/twisted/conch/newsfragments/12706.bugfix b/src/twisted/conch/newsfragments/12706.bugfix
+new file mode 100644
+index 000000000..5c9782e64
+--- /dev/null
++++ b/src/twisted/conch/newsfragments/12706.bugfix
+@@ -0,0 +1 @@
++twisted.conch.telnet.Telnet now limits how much data it buffers for a single telnet subnegotiation, so a peer can no longer exhaust server memory by sending a subnegotiation that is never terminated.
+diff --git a/src/twisted/conch/telnet.py b/src/twisted/conch/telnet.py
+index 4221bf90a..d008b354a 100644
+--- a/src/twisted/conch/telnet.py
++++ b/src/twisted/conch/telnet.py
+@@ -377,6 +377,9 @@ class Telnet(protocol.Protocol):
+     # One of a lot of things
+     state = "data"
+ 
++    # Cap the per-subnegotiation buffer against an unterminated IAC SB.
++    MAX_SUBNEGOTIATION_LENGTH = 4096
++
+     def __init__(self):
+         self.options = {}
+         self.negotiationMap = {}
+@@ -517,6 +520,11 @@ class Telnet(protocol.Protocol):
+         data = data.replace(IAC, IAC * 2)
+         self._write(IAC + SB + about + data + IAC + SE)
+ 
++    def _bufferSubnegotiation(self, b):
++        # Append until the cap, then drop the rest.
++        if len(self.commands) < self.MAX_SUBNEGOTIATION_LENGTH:
++            self.commands.append(b)
++
+     def dataReceived(self, data):
+         appDataBuffer = []
+ 
+@@ -579,7 +587,7 @@ class Telnet(protocol.Protocol):
+                 if b == IAC:
+                     self.state = "subnegotiation-escaped"
+                 else:
+-                    self.commands.append(b)
++                    self._bufferSubnegotiation(b)
+             elif self.state == "subnegotiation-escaped":
+                 if b == SE:
+                     self.state = "data"
+@@ -591,7 +599,7 @@ class Telnet(protocol.Protocol):
+                     self.negotiate(commands)
+                 else:
+                     self.state = "subnegotiation"
+-                    self.commands.append(b)
++                    self._bufferSubnegotiation(b)
+             else:
+                 raise ValueError("How'd you do this?")
+ 
+diff --git a/src/twisted/conch/test/test_telnet.py b/src/twisted/conch/test/test_telnet.py
+index b32fdfd3b..7df22d08a 100644
+--- a/src/twisted/conch/test/test_telnet.py
++++ b/src/twisted/conch/test/test_telnet.py
+@@ -263,6 +263,33 @@ class TelnetTransportTests(unittest.TestCase):
+             self.assertEqual(h.data, b"".join(L).replace(cmd, b""))
+             self.assertEqual(h.subcmd, [telnet.SE] + list(iterbytes(b"hello")))
+ 
++    def test_subnegotiationBufferIsBounded(self):
++        # An unterminated subnegotiation is capped and the connection stays open.
++        cap = telnet.Telnet.MAX_SUBNEGOTIATION_LENGTH
++        self.p.dataReceived(telnet.IAC + telnet.SB + b"\x12")
++        self.p.dataReceived(b"A" * (cap * 4))
++        self.assertEqual(len(self.p.commands), cap)
++        self.assertFalse(self.t.disconnecting)
++
++    def test_oversizedSubnegotiationIsTruncated(self):
++        # An over-long subnegotiation is delivered truncated, not dropped.
++        h = self.p.protocol
++        cap = telnet.Telnet.MAX_SUBNEGOTIATION_LENGTH
++        cmd = (
++            telnet.IAC + telnet.SB + b"\x12" + b"B" * (cap * 2) + telnet.IAC + telnet.SE
++        )
++        self.p.dataReceived(cmd)
++        self.assertEqual(len(h.subcmd), cap - 1)
++        self.assertFalse(self.t.disconnecting)
++
++    def test_subnegotiationEscapedBytesCountTowardCap(self):
++        # IAC-escaped bytes (IAC IAC) also count toward the cap.
++        cap = telnet.Telnet.MAX_SUBNEGOTIATION_LENGTH
++        self.p.dataReceived(telnet.IAC + telnet.SB + b"\x12")
++        self.p.dataReceived((telnet.IAC + telnet.IAC) * (cap * 2))
++        self.assertEqual(len(self.p.commands), cap)
++        self.assertFalse(self.t.disconnecting)
++
+     def _enabledHelper(self, o, eL=[], eR=[], dL=[], dR=[]):
+         self.assertEqual(o.enabledLocal, eL)
+         self.assertEqual(o.enabledRemote, eR)
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p2.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p2.patch
new file mode 100644
index 0000000000..d5a35f6a00
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p2.patch
@@ -0,0 +1,286 @@
+From 073ba878c6c07d569cb61abc5ae76d46eff1b529 Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Fri, 31 Jul 2026 14:41:59 +0200
+Subject: [PATCH] conch.telnet: address review, private cap and drop on overflow
+
+CVE: CVE-2026-115778
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/073ba878c6c07d569cb61abc5ae76d46eff1b529]
+
+Backport Changes:
+- Upstream removes the preceding patch's unannotated
+  _bufferSubnegotiation(self, b) helper, moving the cap check inline to
+  dataReceived; no replacement helper signature or typing-only imports are
+  needed.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/conch/newsfragments/12706.bugfix |   2 +-
+ src/twisted/conch/telnet.py                  |  60 +++++++--
+ src/twisted/conch/test/test_telnet.py        | 126 +++++++++++++++++--
+ 3 files changed, 168 insertions(+), 20 deletions(-)
+
+diff --git a/src/twisted/conch/newsfragments/12706.bugfix b/src/twisted/conch/newsfragments/12706.bugfix
+index 5c9782e64..31ca8f7b9 100644
+--- a/src/twisted/conch/newsfragments/12706.bugfix
++++ b/src/twisted/conch/newsfragments/12706.bugfix
+@@ -1 +1 @@
+-twisted.conch.telnet.Telnet now limits how much data it buffers for a single telnet subnegotiation, so a peer can no longer exhaust server memory by sending a subnegotiation that is never terminated.
++twisted.conch.telnet.Telnet.dataReceived now limits how much data it buffers for a single telnet subnegotiation, so a peer can no longer exhaust server memory by sending a subnegotiation that is never terminated.
+diff --git a/src/twisted/conch/telnet.py b/src/twisted/conch/telnet.py
+index d008b354a..8a462a573 100644
+--- a/src/twisted/conch/telnet.py
++++ b/src/twisted/conch/telnet.py
+@@ -372,13 +372,29 @@ class Telnet(protocol.Protocol):
+     should not be made to it.
+ 
+     @ivar transport: This protocol's transport object.
++
++    @cvar _MAX_SUBNEGOTIATION_LENGTH: The maximum number of bytes buffered for a
++        single subnegotiation, that is the subnegotiation command byte and its
++        payload between C{IAC SB} and C{IAC SE}.  Legitimate subnegotiations
++        carry small option parameters, such as a terminal type (RFC 1091), a
++        window size (RFC 1073, four bytes), or a set of environment variables
++        (RFC 1572), so the default of 4096 is far larger than any real
++        subnegotiation while still bounding the amount of memory a single
++        connection can consume.  A peer that sends more than this many bytes
++        without an C{IAC SE} terminator is treated as a protocol violation: the
++        buffer is not grown further, a warning is logged, and the connection is
++        dropped, matching the way L{twisted.protocols.basic.LineReceiver}
++        handles a line that exceeds its C{MAX_LENGTH}.  This attribute is
++        private; a subclass that needs a different bound may override it.
+     """
+ 
++    _log = Logger()
++
+     # One of a lot of things
+     state = "data"
+ 
+-    # Cap the per-subnegotiation buffer against an unterminated IAC SB.
+-    MAX_SUBNEGOTIATION_LENGTH = 4096
++    # See the class docstring for the rationale behind this bound.
++    _MAX_SUBNEGOTIATION_LENGTH = 4096
+ 
+     def __init__(self):
+         self.options = {}
+@@ -520,10 +536,27 @@ class Telnet(protocol.Protocol):
+         data = data.replace(IAC, IAC * 2)
+         self._write(IAC + SB + about + data + IAC + SE)
+ 
+-    def _bufferSubnegotiation(self, b):
+-        # Append until the cap, then drop the rest.
+-        if len(self.commands) < self.MAX_SUBNEGOTIATION_LENGTH:
+-            self.commands.append(b)
++    def _subnegotiationLengthExceeded(self):
++        """
++        Handle a subnegotiation that reaches L{_MAX_SUBNEGOTIATION_LENGTH}
++        without an C{IAC SE} terminator.
++
++        A well-behaved peer terminates a subnegotiation with C{IAC SE} long
++        before the cap is reached.  A peer that does not is treated as a
++        protocol violation: a warning is logged and the connection is dropped,
++        mirroring L{twisted.protocols.basic.LineReceiver.lineLengthExceeded},
++        rather than buffering the subnegotiation without bound.  The
++        C{disconnecting} guard keeps this to a single log line if more
++        subnegotiation payload arrives while the connection is still closing.
++        """
++        if self.transport.disconnecting:
++            return
++        self._log.warn(
++            "Telnet subnegotiation exceeded {length} bytes without an "
++            "IAC SE terminator; dropping connection.",
++            length=self._MAX_SUBNEGOTIATION_LENGTH,
++        )
++        self.transport.loseConnection()
+ 
+     def dataReceived(self, data):
+         appDataBuffer = []
+@@ -586,8 +619,15 @@ class Telnet(protocol.Protocol):
+             elif self.state == "subnegotiation":
+                 if b == IAC:
+                     self.state = "subnegotiation-escaped"
++                # The cap is checked inline rather than in a helper to avoid a
++                # Python call per byte on subnegotiation-heavy streams.
++                elif len(self.commands) < self._MAX_SUBNEGOTIATION_LENGTH:
++                    self.commands.append(b)
+                 else:
+-                    self._bufferSubnegotiation(b)
++                    # Stop parsing; the loop's final flush still delivers any
++                    # application data received before the violation.
++                    self._subnegotiationLengthExceeded()
++                    break
+             elif self.state == "subnegotiation-escaped":
+                 if b == SE:
+                     self.state = "data"
+@@ -599,7 +639,11 @@ class Telnet(protocol.Protocol):
+                     self.negotiate(commands)
+                 else:
+                     self.state = "subnegotiation"
+-                    self._bufferSubnegotiation(b)
++                    if len(self.commands) < self._MAX_SUBNEGOTIATION_LENGTH:
++                        self.commands.append(b)
++                    else:
++                        self._subnegotiationLengthExceeded()
++                        break
+             else:
+                 raise ValueError("How'd you do this?")
+ 
+diff --git a/src/twisted/conch/test/test_telnet.py b/src/twisted/conch/test/test_telnet.py
+index 7df22d08a..11a612cdb 100644
+--- a/src/twisted/conch/test/test_telnet.py
++++ b/src/twisted/conch/test/test_telnet.py
+@@ -12,6 +12,7 @@ from zope.interface.verify import verifyObject
+ 
+ from twisted.conch import telnet
+ from twisted.internet import defer
++from twisted.logger import LogLevel, globalLogPublisher
+ from twisted.python.compat import iterbytes
+ from twisted.test import proto_helpers
+ from twisted.trial import unittest
+@@ -263,33 +264,136 @@ class TelnetTransportTests(unittest.TestCase):
+             self.assertEqual(h.data, b"".join(L).replace(cmd, b""))
+             self.assertEqual(h.subcmd, [telnet.SE] + list(iterbytes(b"hello")))
+ 
+-    def test_subnegotiationBufferIsBounded(self):
+-        # An unterminated subnegotiation is capped and the connection stays open.
+-        cap = telnet.Telnet.MAX_SUBNEGOTIATION_LENGTH
++    def test_boundedSubnegotiationIsDelivered(self):
++        """
++        A subnegotiation whose payload is within
++        L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH} is delivered to the
++        negotiation handler as usual and the connection is left open.
++        """
++        h = self.p.protocol
++        payload = b"C" * 16
++        cmd = telnet.IAC + telnet.SB + b"\x12" + payload + telnet.IAC + telnet.SE
++        self.p.dataReceived(cmd)
++        self.assertEqual(h.subcmd, list(iterbytes(payload)))
++        self.assertFalse(self.t.disconnecting)
++
++    def test_applicationDataBeforeOversizedSubnegotiationIsDelivered(self):
++        """
++        Application data received before an over-long subnegotiation in the
++        same call is still delivered when the connection is dropped, so valid
++        data received before the protocol violation is not lost.
++        """
++        h = self.p.protocol
++        cap = telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH
++        self.p.dataReceived(
++            b"hello" + telnet.IAC + telnet.SB + b"\x12" + b"A" * (cap * 2)
++        )
++        self.assertEqual(h.data, b"hello")
++        self.assertTrue(self.t.disconnecting)
++
++    def test_oversizedSubnegotiationDropsConnection(self):
++        """
++        A subnegotiation whose payload reaches
++        L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH} without an C{IAC SE}
++        terminator is a protocol violation: the buffer stops growing at the
++        cap and the connection is dropped rather than exhausting memory.
++        Further subnegotiation payload that arrives after the cap is discarded
++        without growing the buffer, so a peer cannot keep buffering.
++        """
++        cap = telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH
+         self.p.dataReceived(telnet.IAC + telnet.SB + b"\x12")
+         self.p.dataReceived(b"A" * (cap * 4))
++        self.assertTrue(self.t.disconnecting)
++        self.assertEqual(len(self.p.commands), cap)
++        self.p.dataReceived(b"A" * 16)
+         self.assertEqual(len(self.p.commands), cap)
+-        self.assertFalse(self.t.disconnecting)
+ 
+-    def test_oversizedSubnegotiationIsTruncated(self):
+-        # An over-long subnegotiation is delivered truncated, not dropped.
++    def test_oversizedSubnegotiationIsNotDelivered(self):
++        """
++        An over-long subnegotiation is dropped rather than delivered truncated:
++        the negotiation handler is never invoked and the connection is dropped.
++        """
+         h = self.p.protocol
+-        cap = telnet.Telnet.MAX_SUBNEGOTIATION_LENGTH
++        # A distinguishable sentinel, so the assertion proves the handler was
++        # never called rather than merely matching the default empty payload.
++        h.subcmd = "UNSET"
++        cap = telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH
+         cmd = (
+             telnet.IAC + telnet.SB + b"\x12" + b"B" * (cap * 2) + telnet.IAC + telnet.SE
+         )
+         self.p.dataReceived(cmd)
+-        self.assertEqual(len(h.subcmd), cap - 1)
+-        self.assertFalse(self.t.disconnecting)
++        self.assertEqual(h.subcmd, "UNSET")
++        self.assertTrue(self.t.disconnecting)
+ 
+     def test_subnegotiationEscapedBytesCountTowardCap(self):
+-        # IAC-escaped bytes (IAC IAC) also count toward the cap.
+-        cap = telnet.Telnet.MAX_SUBNEGOTIATION_LENGTH
++        """
++        Bytes delivered as an escaped C{IAC IAC} inside a subnegotiation count
++        toward L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH}, so a flood of them
++        also stops at the cap and drops the connection.
++        """
++        cap = telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH
+         self.p.dataReceived(telnet.IAC + telnet.SB + b"\x12")
+         self.p.dataReceived((telnet.IAC + telnet.IAC) * (cap * 2))
++        self.assertTrue(self.t.disconnecting)
+         self.assertEqual(len(self.p.commands), cap)
++
++    def test_subnegotiationAtCapIsDelivered(self):
++        """
++        A properly terminated subnegotiation that fills the buffer to exactly
++        L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH} is delivered, so the cap
++        does not reject a legitimate maximum-size subnegotiation.
++        """
++        h = self.p.protocol
++        cap = telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH
++        # One command byte plus (cap - 1) payload bytes fills the buffer to cap.
++        payload = b"D" * (cap - 1)
++        cmd = telnet.IAC + telnet.SB + b"\x12" + payload + telnet.IAC + telnet.SE
++        self.p.dataReceived(cmd)
++        self.assertEqual(h.subcmd, list(iterbytes(payload)))
+         self.assertFalse(self.t.disconnecting)
+ 
++    def test_capResetsPerSubnegotiation(self):
++        """
++        The cap is per subnegotiation: several separately terminated,
++        under-cap subnegotiations in a row are each delivered and the
++        connection stays open.
++        """
++        h = self.p.protocol
++        one = telnet.IAC + telnet.SB + b"\x12" + b"E" * 32 + telnet.IAC + telnet.SE
++        for _ in range(2000):
++            self.p.dataReceived(one)
++        self.assertEqual(h.subcmd, list(iterbytes(b"E" * 32)))
++        self.assertFalse(self.t.disconnecting)
++
++    def test_oversizedSubnegotiationLogsAndDropsOnce(self):
++        """
++        Reaching the cap logs a single warning and drops the connection once,
++        even when further subnegotiation payload keeps arriving afterwards.
++        """
++        cap = telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH
++        events = []
++        globalLogPublisher.addObserver(events.append)
++        self.addCleanup(globalLogPublisher.removeObserver, events.append)
++        drops = []
++        original = self.t.loseConnection
++
++        def countingLoseConnection():
++            drops.append(None)
++            original()
++
++        self.t.loseConnection = countingLoseConnection
++        self.p.dataReceived(telnet.IAC + telnet.SB + b"\x12")
++        self.p.dataReceived(b"A" * (cap * 4))
++        self.p.dataReceived(b"A" * 128)
++        warnings = [
++            e
++            for e in events
++            if e.get("log_level") is LogLevel.warn
++            and "subnegotiation" in (e.get("log_format") or "")
++        ]
++        self.assertEqual(len(warnings), 1)
++        self.assertEqual(len(drops), 1)
++
+     def _enabledHelper(self, o, eL=[], eR=[], dL=[], dR=[]):
+         self.assertEqual(o.enabledLocal, eL)
+         self.assertEqual(o.enabledRemote, eR)
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p3.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p3.patch
new file mode 100644
index 0000000000..23d9f7b835
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p3.patch
@@ -0,0 +1,108 @@
+From 306985969879a8aeab811e9730b3d0e54ff372e8 Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Mon, 17 Aug 2026 09:37:00 +0100
+Subject: [PATCH] Apply suggestions from code review
+
+add type annotation
+
+Co-authored-by: Glyph <code@glyph.im>
+Co-authored-by: Adi Roiban <adiroiban@gmail.com>
+
+CVE: CVE-2026-115778
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/306985969879a8aeab811e9730b3d0e54ff372e8]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/conch/telnet.py           |  2 +-
+ src/twisted/conch/test/test_telnet.py | 16 ++++++++--------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/twisted/conch/telnet.py b/src/twisted/conch/telnet.py
+index 8a462a573..6dbb65c9e 100644
+--- a/src/twisted/conch/telnet.py
++++ b/src/twisted/conch/telnet.py
+@@ -536,7 +536,7 @@ class Telnet(protocol.Protocol):
+         data = data.replace(IAC, IAC * 2)
+         self._write(IAC + SB + about + data + IAC + SE)
+ 
+-    def _subnegotiationLengthExceeded(self):
++    def _subnegotiationLengthExceeded(self) -> None:
+         """
+         Handle a subnegotiation that reaches L{_MAX_SUBNEGOTIATION_LENGTH}
+         without an C{IAC SE} terminator.
+diff --git a/src/twisted/conch/test/test_telnet.py b/src/twisted/conch/test/test_telnet.py
+index 11a612cdb..48ae4ccf9 100644
+--- a/src/twisted/conch/test/test_telnet.py
++++ b/src/twisted/conch/test/test_telnet.py
+@@ -264,7 +264,7 @@ class TelnetTransportTests(unittest.TestCase):
+             self.assertEqual(h.data, b"".join(L).replace(cmd, b""))
+             self.assertEqual(h.subcmd, [telnet.SE] + list(iterbytes(b"hello")))
+ 
+-    def test_boundedSubnegotiationIsDelivered(self):
++    def test_boundedSubnegotiationIsDelivered(self) -> None:
+         """
+         A subnegotiation whose payload is within
+         L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH} is delivered to the
+@@ -277,7 +277,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.assertEqual(h.subcmd, list(iterbytes(payload)))
+         self.assertFalse(self.t.disconnecting)
+ 
+-    def test_applicationDataBeforeOversizedSubnegotiationIsDelivered(self):
++    def test_applicationDataBeforeOversizedSubnegotiationIsDelivered(self) -> None:
+         """
+         Application data received before an over-long subnegotiation in the
+         same call is still delivered when the connection is dropped, so valid
+@@ -291,7 +291,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.assertEqual(h.data, b"hello")
+         self.assertTrue(self.t.disconnecting)
+ 
+-    def test_oversizedSubnegotiationDropsConnection(self):
++    def test_oversizedSubnegotiationDropsConnection(self) -> None:
+         """
+         A subnegotiation whose payload reaches
+         L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH} without an C{IAC SE}
+@@ -308,7 +308,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.p.dataReceived(b"A" * 16)
+         self.assertEqual(len(self.p.commands), cap)
+ 
+-    def test_oversizedSubnegotiationIsNotDelivered(self):
++    def test_oversizedSubnegotiationIsNotDelivered(self) -> None:
+         """
+         An over-long subnegotiation is dropped rather than delivered truncated:
+         the negotiation handler is never invoked and the connection is dropped.
+@@ -325,7 +325,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.assertEqual(h.subcmd, "UNSET")
+         self.assertTrue(self.t.disconnecting)
+ 
+-    def test_subnegotiationEscapedBytesCountTowardCap(self):
++    def test_subnegotiationEscapedBytesCountTowardCap(self) -> None:
+         """
+         Bytes delivered as an escaped C{IAC IAC} inside a subnegotiation count
+         toward L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH}, so a flood of them
+@@ -337,7 +337,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.assertTrue(self.t.disconnecting)
+         self.assertEqual(len(self.p.commands), cap)
+ 
+-    def test_subnegotiationAtCapIsDelivered(self):
++    def test_subnegotiationAtCapIsDelivered(self) -> None:
+         """
+         A properly terminated subnegotiation that fills the buffer to exactly
+         L{telnet.Telnet._MAX_SUBNEGOTIATION_LENGTH} is delivered, so the cap
+@@ -352,7 +352,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.assertEqual(h.subcmd, list(iterbytes(payload)))
+         self.assertFalse(self.t.disconnecting)
+ 
+-    def test_capResetsPerSubnegotiation(self):
++    def test_capResetsPerSubnegotiation(self) -> None:
+         """
+         The cap is per subnegotiation: several separately terminated,
+         under-cap subnegotiations in a row are each delivered and the
+@@ -365,7 +365,7 @@ class TelnetTransportTests(unittest.TestCase):
+         self.assertEqual(h.subcmd, list(iterbytes(b"E" * 32)))
+         self.assertFalse(self.t.disconnecting)
+ 
+-    def test_oversizedSubnegotiationLogsAndDropsOnce(self):
++    def test_oversizedSubnegotiationLogsAndDropsOnce(self) -> None:
+         """
+         Reaching the cap logs a single warning and drops the connection once,
+         even when further subnegotiation payload keeps arriving afterwards.
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p4.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p4.patch
new file mode 100644
index 0000000000..59ab21e47e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p4.patch
@@ -0,0 +1,36 @@
+From 1baff09a1d56ca9254a6d6f02005f17a7c53a282 Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Sat, 22 Aug 2026 14:06:08 +0200
+Subject: [PATCH] use transport.disconnecting for the subnegotiation drop guard
+
+CVE: CVE-2026-115778
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/1baff09a1d56ca9254a6d6f02005f17a7c53a282]
+
+Backport Changes:
+- Upstream removes the temporary _subnegotiationOverflowReported flag
+  and its class-docstring text. The earlier CVE-2026-115778_p2 patch
+  already uses transport.disconnecting as the overflow guard, so that
+  cleanup does not apply to this target patch series. The transport
+  assertion and type-ignore annotation follow upstream.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/conch/telnet.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/twisted/conch/telnet.py b/src/twisted/conch/telnet.py
+index 6dbb65c9e..480883d02 100644
+--- a/src/twisted/conch/telnet.py
++++ b/src/twisted/conch/telnet.py
+@@ -549,7 +549,10 @@ class Telnet(protocol.Protocol):
+         C{disconnecting} guard keeps this to a single log line if more
+         subnegotiation payload arrives while the connection is still closing.
+         """
+-        if self.transport.disconnecting:
++        assert self.transport is not None
++        # disconnecting is not declared on ITransport, but every real transport
++        # implements it.
++        if self.transport.disconnecting:  # type: ignore[attr-defined]
+             return
+         self._log.warn(
+             "Telnet subnegotiation exceeded {length} bytes without an "
diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 72dc23e3fb..48deee6fdc 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -24,6 +24,10 @@ SRC_URI += "file://CVE-2026-42304_p1.patch \
            file://CVE-2026-115774_p2.patch \
            file://CVE-2026-115776_p1.patch \
            file://CVE-2026-115776_p2.patch \
+           file://CVE-2026-115778_p1.patch \
+           file://CVE-2026-115778_p2.patch \
+           file://CVE-2026-115778_p3.patch \
+           file://CVE-2026-115778_p4.patch \
            "
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
-- 
2.53.0

