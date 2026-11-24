Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12224.1795500042120444151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=a4RjYBRX;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13522; q=dns/txt;
  s=iport01; t=1795500043; x=1796709643;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=g4REPV/0QhJjfunmx6sL2fXubqIggCHFc6Bu/akOTRY=;
  b=a4RjYBRXygcYVwabJN2/NknM9k2o1A36quOao5HRdBgZ0ZXyubanJBe+
   ayYV48upebyyWRf3HMzDHeNYZvoqa35ACrp1koyITbXh97VT43yjMhO5Q
   wrYoUf0+mM8lHh8xgT3rN4RNQUuY/LVLxjXdHo6o8wUU0e0+8wJTPnEU8
   /Pz1L6LBZ3HL/XC+03BOaL1Ad23/WFRm4cbW929p+PN/1mgvmsqCG90Px
   EqJiuncUaBBd2BIx+fffRPgYYzOISADlWJ30ZI4hS+zaoaFtyoqpYXdw+
   qan1v/HSwX75stPY3B8Dqzg7VVI/+ccJZwFI64f/tuAaf3vFsR1MIHJ8U
   g==;
X-CSE-ConnectionGUID: T6tQXJZ9So+t27oRpt9hTA==
X-CSE-MsgGUID: e5OJkcMKRK+oSbjoP0lI9g==
X-IPAS-Result: =?us-ascii?q?A0BLAgBEJQVr/9FK/pBaHgE8DA4LgVmCV3VgQ0mUKoIhA?=
 =?us-ascii?q?54pFIFqDwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYARsiHAMBAi8rIwgZgwIBgnQDE?=
 =?us-ascii?q?bppgXkzgQGDKQE/AkNQ2UuBaAELFAGBOIVCiCRdGAGEfScbgUlEhH+BBYFcA?=
 =?us-ascii?q?QGBJx8Bhl8Egg2BIYFUgyKDGoZbAoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bC?=
 =?us-ascii?q?oEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgihiEIEOASsEcFFOKKVmo?=
 =?us-ascii?q?RGEK4wklToaM4QEgVeSQ4wkhjALmH2OCoh5jHBohGqBaDyBRwsHMxoIGxWDI?=
 =?us-ascii?q?glKGQ+OOYNrgX9LgxrIdyYyAgkyAQEHAgcOAwuBaJAAAgIkB4FPAQE?=
IronPort-Data: A9a23:DQtMbqOAOklLLkvvrR3wlsFynXyQoLVcMsEvi/4bfWQNrUp3gzdSn
 zZJDD+COvzfZGejfot+PNzn/UkB75CBx9I2G3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWUsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68kwEHgGH79JweE0HTsR8
 sYANGENUjnW0opawJrjIgVtrs0uNozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I+BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCNllMsjui1YbI5fPSHGOJ3nU29h
 VjlvGPCCBMdDISb6GuKpyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgaWEW2pdG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVndjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:1fDs7K6uU2bjiFf+dgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AwMr9MWt6bYVXPfSVu+0zdhn66IsZLGHk/FXicnS?=
 =?us-ascii?q?/SnozF7qvUUPB+J9Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFci3JQ2RCTkn5GyLMBLWWcOJaTUj7vmJKkMGtLY?=
 =?us-ascii?q?8mIqDDiZyPA/FiBXmTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62756809"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:00:38 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 070BB180001A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:38 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id A8BCACC12A7; Mon, 23 Nov 2026 22:00:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 1/5] python3-twisted: Fix CVE-2026-83813
Date: Mon, 23 Nov 2026 22:00:31 -0800
Message-Id: <20261124060035.1651451-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124060035.1651451-1-yurade@cisco.com>
References: <20261124060035.1651451-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132925
Content-Type: text/plain; charset="utf-8"

This series applies the upstream endpoint-validation fix in [1] to Twisted
25.5.0 and carries the related address-map cleanup as separate patches.

CVE-2026-83813_p2.patch adapts the timeout cleanup from [2] to the 25.5.0
DNSDatagramProtocol hook. CVE-2026-83813_p3.patch retains only the successful-
response cleanup from [3], omitting its shared response-handler refactor,
names/client.py changes, logger migration, and related typing changes.
CVE-2026-83813_p4.patch applies [4]'s correction, making timeout cleanup
tolerant if protocol shutdown has already removed the map entry. These changes
are interrelated: p2 adds timeout cleanup, p3 clears successful queries, and
p4 makes the timeout cleanup safe after shutdown.

The upstream regression test in [5] targets a newer DatagramProtocolTests
harness and does not apply directly to Twisted 25.5.0. The series carries an
adapted version in CVE-2026-83813-regression.patch after p1 through p4. It
checks wrong response IDs, hosts, and ports before accepting the expected
endpoint, and verifies address-map cleanup after success and timeout.

Backport the DNS response-origin validation fix from Twisted PR #12700
[7] to Twisted 25.5.0. The backport selects the five upstream commits
needed for the fix and its regression coverage, retaining only relevant
hunks where an upstream commit also contains unrelated changes.

[1] https://github.com/twisted/twisted/commit/b53e1c3477c209b5609a1c74cf9e48373b5879ac
[2] https://github.com/twisted/twisted/commit/fce7991ca2a2c17f3e8f86fb18c2aa17eed2c7e1
[3] https://github.com/twisted/twisted/commit/83f2165703766ba1fd7dc40638ac462bae6924d1
[4] https://github.com/twisted/twisted/commit/f6ee6cf35053382a356ec6f0fff490734737e06c
[5] https://github.com/twisted/twisted/commit/80d4907046def3e839b30dfff860564cb0311082
[6] https://nvd.nist.gov/vuln/detail/cve-2026-83813
[7] https://github.com/twisted/twisted/pull/12700

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-83813-regression.patch           | 62 +++++++++++++++++++
 .../python3-twisted/CVE-2026-83813_p1.patch   | 62 +++++++++++++++++++
 .../python3-twisted/CVE-2026-83813_p2.patch   | 36 +++++++++++
 .../python3-twisted/CVE-2026-83813_p3.patch   | 35 +++++++++++
 .../python3-twisted/CVE-2026-83813_p4.patch   | 28 +++++++++
 .../python/python3-twisted_25.5.0.bb          |  5 ++
 6 files changed, 228 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813-regression.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p4.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813-regression.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813-regression.patch
new file mode 100644
index 0000000000..864cad2a99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813-regression.patch
@@ -0,0 +1,62 @@
+From 80d4907046def3e839b30dfff860564cb0311082 Mon Sep 17 00:00:00 2001
+From: Glyph <code@glyph.im>
+Date: Wed, 15 Jul 2026 21:06:23 -0700
+Subject: [PATCH] failing test for the problem
+
+CVE: CVE-2026-83813
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/80d4907046def3e839b30dfff860564cb0311082]
+
+Backport Changes:
+- Adapted the upstream regression test to the Twisted 25.5.0 test harness.
+  Kept the response-ID, host, and port rejection checks; added downstream
+  assertions for address-map cleanup after success and timeout. Omitted unrelated
+  test-harness modernization.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/names/test/test_dns.py | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/src/twisted/names/test/test_dns.py b/src/twisted/names/test/test_dns.py
+index 3b8f6e1..66bbbac 100644
+--- a/src/twisted/names/test/test_dns.py
++++ b/src/twisted/names/test/test_dns.py
+@@ -1304,6 +1304,28 @@ class DatagramProtocolTests(unittest.TestCase):
+         self.proto.datagramReceived(m.toStr(), ("127.0.0.1", 21345))
+         return d
+ 
++    def test_discardedResponses(self):
++        """
++        Responses to queries sent with the wrong host address or port are
++        ignored until a response from the queried endpoint arrives.
++        """
++        d = self.proto.query(("127.0.0.1", 21345), [dns.Query(b"foo")], id=4321)
++        m = dns.Message()
++        m.id = 1234
++        m.answers = [dns.RRHeader(payload=dns.Record_A(address="1.2.3.4"))]
++        self.proto.datagramReceived(m.toStr(), ("127.0.0.1", 21345))
++        self.assertNoResult(d)
++        m.id = 4321
++        self.proto.datagramReceived(m.toStr(), ("127.0.0.2", 21345))
++        self.assertNoResult(d)
++        self.proto.datagramReceived(m.toStr(), ("127.0.0.1", 21346))
++        self.assertNoResult(d)
++        self.proto.datagramReceived(m.toStr(), ("127.0.0.1", 21345))
++        self.assertEqual(
++            self.successResultOf(d).answers[0].payload.dottedQuad(), "1.2.3.4"
++        )
++        self.assertEqual(self.proto._addressValidation, {})
++
+     def test_queryTimeout(self):
+         """
+         Test that query timeouts after some seconds.
+@@ -1312,6 +1334,7 @@ class DatagramProtocolTests(unittest.TestCase):
+         self.assertEqual(len(self.proto.liveMessages), 1)
+         self.clock.advance(10)
+         self.assertFailure(d, dns.DNSQueryTimeoutError)
++        self.assertEqual(self.proto._addressValidation, {})
+         self.assertEqual(len(self.proto.liveMessages), 0)
+         return d
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p1.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p1.patch
new file mode 100644
index 0000000000..18f5306acd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p1.patch
@@ -0,0 +1,62 @@
+From b53e1c3477c209b5609a1c74cf9e48373b5879ac Mon Sep 17 00:00:00 2001
+From: Glyph <code@glyph.im>
+Date: Wed, 15 Jul 2026 21:14:40 -0700
+Subject: [PATCH] drop responses sent from the wrong host or port
+
+CVE: CVE-2026-83813
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/b53e1c3477c209b5609a1c74cf9e48373b5879ac]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/names/dns.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index ca5079454..650194842 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -3346,13 +3346,17 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+ 
+     resends = None
+ 
+-    def stopProtocol(self):
++    # map of message-id:address
++    _addressValidation: dict[int, tuple[str, int]]
++
++    def stopProtocol(self) -> None:
+         """
+         Stop protocol: reset state variables.
+         """
+         self.liveMessages = {}
+         self.resends = {}
+-        self.transport = None
++        self.transport = None  # type:ignore[assignment]
++        self._addressValidation = {}
+ 
+     def startProtocol(self):
+         """
+@@ -3360,6 +3364,7 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+         """
+         self.liveMessages = {}
+         self.resends = {}
++        self._addressValidation = {}
+ 
+     def writeMessage(self, message, address):
+         """
+@@ -3395,6 +3400,8 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+             return
+ 
+         if m.id in self.liveMessages:
++            if self._addressValidation[m.id] != addr:
++                return
+             d, canceller = self.liveMessages[m.id]
+             del self.liveMessages[m.id]
+             canceller.cancel()
+@@ -3443,6 +3450,7 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+         def writeMessage(m):
+             self.writeMessage(m, address)
+ 
++        self._addressValidation[id] = address
+         return self._query(queries, timeout, id, writeMessage)
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p2.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p2.patch
new file mode 100644
index 0000000000..787839bcae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p2.patch
@@ -0,0 +1,36 @@
+From fce7991ca2a2c17f3e8f86fb18c2aa17eed2c7e1 Mon Sep 17 00:00:00 2001
+From: Glyph <code@glyph.im>
+Date: Thu, 16 Jul 2026 09:14:36 -0700
+Subject: [PATCH] add documentation to these variables
+
+CVE: CVE-2026-83813
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/fce7991ca2a2c17f3e8f86fb18c2aa17eed2c7e1]
+
+Backport Changes:
+- Port the address-validation timeout cleanup into the 25.5.0
+  DNSDatagramProtocol._clearFailed hook. Variable documentation and typing
+  changes from upstream are omitted. Successful-response cleanup is carried
+  separately, followed by the f6ee6cf3 timeout-cleanup correction.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/names/dns.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index 11eb805..7c29ed0 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -3246,6 +3246,10 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+     def startListening(self):
+         self._reactor.listenUDP(0, self, maxPacketSize=512)
+ 
++    def _clearFailed(self, deferred, id):
++        del self._addressValidation[id]
++        super()._clearFailed(deferred, id)
++
+     def datagramReceived(self, data, addr):
+         """
+         Read a datagram, extract the message in it and trigger the associated
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p3.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p3.patch
new file mode 100644
index 0000000000..55f2ceb92e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p3.patch
@@ -0,0 +1,35 @@
+From 83f2165703766ba1fd7dc40638ac462bae6924d1 Mon Sep 17 00:00:00 2001
+From: Glyph <code@glyph.im>
+Date: Fri, 17 Jul 2026 22:27:03 -0700
+Subject: [PATCH] refactor duplicate response handling
+
+more type annotations to make sure we don't make any mistakes
+
+CVE: CVE-2026-83813
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/83f2165703766ba1fd7dc40638ac462bae6924d1]
+
+Backport Changes:
+- Keep only successful-response address-map cleanup in the existing
+  Twisted 25.5.0 UDP handler. Omit the shared response-handler refactor,
+  names/client.py changes, logger migration, and related typing changes.
+  Timeout cleanup is carried separately by p2 and corrected by p4.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/names/dns.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index 7c29ed0..9b4e8e0 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -3277,6 +3277,7 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+                 return
+             d, canceller = self.liveMessages[m.id]
+             del self.liveMessages[m.id]
++            self._addressValidation.pop(m.id)
+             canceller.cancel()
+             # XXX we shouldn't need this hack of catching exception on callback()
+             try:
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p4.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p4.patch
new file mode 100644
index 0000000000..ab3d3721b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p4.patch
@@ -0,0 +1,28 @@
+From f6ee6cf35053382a356ec6f0fff490734737e06c Mon Sep 17 00:00:00 2001
+From: Glyph <code@glyph.im>
+Date: Sat, 18 Jul 2026 08:20:07 -0700
+Subject: [PATCH] quash errors in validation per review
+
+CVE: CVE-2026-83813
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/f6ee6cf35053382a356ec6f0fff490734737e06c]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/names/dns.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/twisted/names/dns.py b/src/twisted/names/dns.py
+index 9b4e8e0..ea59a70 100644
+--- a/src/twisted/names/dns.py
++++ b/src/twisted/names/dns.py
+@@ -3247,7 +3247,7 @@ class DNSDatagramProtocol(DNSMixin, protocol.DatagramProtocol):
+         self._reactor.listenUDP(0, self, maxPacketSize=512)
+ 
+     def _clearFailed(self, deferred, id):
+-        del self._addressValidation[id]
++        self._addressValidation.pop(id, None)
+         super()._clearFailed(deferred, id)
+ 
+     def datagramReceived(self, data, addr):
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 9b40191964..978627077f 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -12,6 +12,11 @@ SRC_URI += "file://CVE-2026-42304_p1.patch \
            file://CVE-2026-42304_p4.patch \
            file://CVE-2026-42304_p5.patch \
            file://CVE-2026-42304_p6.patch \
+           file://CVE-2026-83813_p1.patch \
+           file://CVE-2026-83813_p2.patch \
+           file://CVE-2026-83813_p3.patch \
+           file://CVE-2026-83813_p4.patch \
+           file://CVE-2026-83813-regression.patch \
            "
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
-- 
2.53.0

