Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE30CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 12:56:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19394.1758027400602663931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 05:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a0NVcMx5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1354656811=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3xOP81733066
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 12:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=r/CaU41NLV+kR21E2ynK
	6Wnc2SIDxBLkr8WMDJ2xD1U=; b=a0NVcMx5XMEjqjPFA2ZV3UeMfaD6Xr+gkOjb
	aAE+tjCBOI5mWBNh1foUIhcqiPY3M04jpdL+Cp7Zl+Yki9U/2hlEI6V4moEuX8Rh
	RE+KSTdvJBHj2BvfF48/3MGxvDK6T4mQ1/LmGWBxlg9/I/EB5B6RvsZOJ75EjTpV
	qa53FiyIQZ1BcReQX/yz15bNozukG9L9hxl+2XXPgDczeTTIMr9aYUq3cmxMDHhi
	2rno0ar64c1NJgQgnmo0qbmePpOZf8vZqHS6kaBA2iwO87FUDpcKysffKgexvlmq
	4kcwfXPfLYf8CRdAYhZL3/ktswsy7v3/oAKH2QkcHQvAk6+npQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu13f3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 12:56:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 16 Sep 2025 05:56:37 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 16 Sep 2025 05:56:36 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix CVE-2023-46137
Date: Tue, 16 Sep 2025 18:26:20 +0530
Message-ID: <20250916125620.1306702-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6IpPuAXsHbZDDDNgWLfkkturGwkdzvQ8
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c95e87 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wjU5IotzqukA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ROTyGP5mAAAA:8 a=0ro5oYpeDTmHoqpDvOYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=94UBJ9-lddKKgNizGTfH:22
X-Proofpoint-GUID: 6IpPuAXsHbZDDDNgWLfkkturGwkdzvQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDEyMCBTYWx0ZWRfX08yYGvDtGds2
 ZREq/bWLxp3GiS2yUmTpQG5a3WUFvJiWnH9acCBcpC9DPpqB8X/ZqEW4Wo9u30AOfONL4WWSTPH
 8BMy/+IvfYsO+nTus+n4MqRKfUyMGbuUggfmyaeVwXbNZacBCWbeFWhEgj+xcvBcQongHqPF0ur
 ZDBqORt9IMdc7lyk7aOvbilFKCp48BaZurKr2/EU3IZcN8DGLWzGKGtHe0P/bIhMCAb5O/BpP82
 ydok1jbDUOdYfoLjtJ3sOdBk36S6aqoCk/aNK0T29aQEIBmh0GLZvH6N8SB88vQ21B79SAV8HLU
 YAOjb1l/u332KLwezQAeqSOld4gYKaXoEZ/ISBBiYiLJkQECbwvqIEwUn0juSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 12:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119467

From: Soumya Sambu <soumya.sambu@windriver.com>

Twisted is an event-based framework for internet applications. Prior to version
23.10.0rc1, when sending multiple HTTP requests in one TCP packet, twisted.web
will process the requests asynchronously without guaranteeing the response order.
If one of the endpoints is controlled by an attacker, the attacker can delay the
response on purpose to manipulate the response of the second request when a
victim launched two requests using HTTP pipeline. Version 23.10.0rc1 contains a
patch for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-46137
https://security-tracker.debian.org/tracker/CVE-2023-46137

Upstream patch:
https://github.com/twisted/twisted/commit/1e6e9d23cac59689760558dcb6634285e694b04c

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-twisted/CVE-2023-46137.patch      | 196 ++++++++++++++++++
 .../python/python3-twisted_22.2.0.bb          |   3 +-
 2 files changed, 198 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2023-46137.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2023-46137.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2023-46137.patch
new file mode 100644
index 0000000000..d504448885
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2023-46137.patch
@@ -0,0 +1,196 @@
+From 1e6e9d23cac59689760558dcb6634285e694b04c Mon Sep 17 00:00:00 2001
+From: Glyph <glyph@twistedmatrix.com>
+Date: Tue Sep 12 11:32:55 2023 -0700
+Subject: [PATCH] 11976 stop processing pipelined HTTP/1.1 requests that are
+ received together (#11979)
+
+CVE: CVE-2023-46137
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/1e6e9d23cac59689760558dcb6634285e694b04c]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/twisted/web/http.py                    | 32 +++++++--
+ src/twisted/web/newsfragments/11976.bugfix |  7 ++
+ src/twisted/web/test/test_web.py           | 81 +++++++++++++++++++++-
+ 3 files changed, 114 insertions(+), 6 deletions(-)
+ create mode 100644 src/twisted/web/newsfragments/11976.bugfix
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 96a1335..b99480f 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2366,14 +2366,38 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+ 
+         self._handlingRequest = True
+ 
++        # We go into raw mode here even though we will be receiving lines next
++        # in the protocol; however, this data will be buffered and then passed
++        # back to line mode in the setLineMode call in requestDone.
++        self.setRawMode()
++
+         req = self.requests[-1]
+         req.requestReceived(command, path, version)
+ 
+-    def dataReceived(self, data):
++    def rawDataReceived(self, data: bytes) -> None:
+         """
+-        Data was received from the network.  Process it.
++        This is called when this HTTP/1.1 parser is in raw mode rather than
++        line mode.
++
++        It may be in raw mode for one of two reasons:
++
++            1. All the headers of a request have been received and this
++               L{HTTPChannel} is currently receiving its body.
++
++            2. The full content of a request has been received and is currently
++               being processed asynchronously, and this L{HTTPChannel} is
++               buffering the data of all subsequent requests to be parsed
++               later.
++
++        In the second state, the data will be played back later.
++
++        @note: This isn't really a public API, and should be invoked only by
++            L{LineReceiver}'s line parsing logic.  If you wish to drive an
++            L{HTTPChannel} from a custom data source, call C{dataReceived} on
++            it directly.
++
++        @see: L{LineReceive.rawDataReceived}
+         """
+-        # If we're currently handling a request, buffer this data.
+         if self._handlingRequest:
+             self._dataBuffer.append(data)
+             if (
+@@ -2385,9 +2409,7 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+                 # ready.  See docstring for _optimisticEagerReadSize above.
+                 self._networkProducer.pauseProducing()
+             return
+-        return basic.LineReceiver.dataReceived(self, data)
+ 
+-    def rawDataReceived(self, data):
+         self.resetTimeout()
+ 
+         try:
+diff --git a/src/twisted/web/newsfragments/11976.bugfix b/src/twisted/web/newsfragments/11976.bugfix
+new file mode 100644
+index 0000000..8ac292b
+--- /dev/null
++++ b/src/twisted/web/newsfragments/11976.bugfix
+@@ -0,0 +1,7 @@
++In Twisted 16.3.0, we changed twisted.web to stop dispatching HTTP/1.1
++pipelined requests to application code.  There was a bug in this change which
++still allowed clients which could send multiple full HTTP requests in a single
++TCP segment to trigger asynchronous processing of later requests, which could
++lead to out-of-order responses.  This has now been corrected and twisted.web
++should never process a pipelined request over HTTP/1.1 until the previous
++request has fully completed.
+diff --git a/src/twisted/web/test/test_web.py b/src/twisted/web/test/test_web.py
+index 3eb35a9..b2b2ad7 100644
+--- a/src/twisted/web/test/test_web.py
++++ b/src/twisted/web/test/test_web.py
+@@ -8,6 +8,7 @@ Tests for various parts of L{twisted.web}.
+ import os
+ import zlib
+ from io import BytesIO
++from typing import List
+ 
+ from zope.interface import implementer
+ from zope.interface.verify import verifyObject
+@@ -17,10 +18,13 @@ from twisted.internet.address import IPv4Address, IPv6Address
+ from twisted.internet.task import Clock
+ from twisted.logger import LogLevel, globalLogPublisher
+ from twisted.python import failure, reflect
++from twisted.python.compat import iterbytes
+ from twisted.python.filepath import FilePath
+-from twisted.test.proto_helpers import EventLoggingObserver
++from twisted.test.proto_helpers import EventLoggingObserver, StringTransport
+ from twisted.trial import unittest
+ from twisted.web import error, http, iweb, resource, server
++from twisted.web.resource import Resource
++from twisted.web.server import NOT_DONE_YET, Request, Site
+ from twisted.web.static import Data
+ from twisted.web.test.requesthelper import DummyChannel, DummyRequest
+ from ._util import assertIsFilesystemTemporary
+@@ -1849,3 +1853,78 @@ class ExplicitHTTPFactoryReactor(unittest.TestCase):
+ 
+         factory = http.HTTPFactory()
+         self.assertIs(factory.reactor, reactor)
++
++
++class QueueResource(Resource):
++    """
++    Add all requests to an internal queue,
++    without responding to the requests.
++    You can access the requests from the queue and handle their response.
++    """
++
++    isLeaf = True
++
++    def __init__(self) -> None:
++        super().__init__()
++        self.dispatchedRequests: List[Request] = []
++
++    def render_GET(self, request: Request) -> int:
++        self.dispatchedRequests.append(request)
++        return NOT_DONE_YET
++
++
++class TestRFC9112Section932(unittest.TestCase):
++    """
++    Verify that HTTP/1.1 request ordering is preserved.
++    """
++
++    def test_multipleRequestsInOneSegment(self) -> None:
++        """
++        Twisted MUST NOT respond to a second HTTP/1.1 request while the first
++        is still pending.
++        """
++        qr = QueueResource()
++        site = Site(qr)
++        proto = site.buildProtocol(None)
++        serverTransport = StringTransport()
++        proto.makeConnection(serverTransport)
++        proto.dataReceived(
++            b"GET /first HTTP/1.1\r\nHost: a\r\n\r\n"
++            b"GET /second HTTP/1.1\r\nHost: a\r\n\r\n"
++        )
++        # The TCP data contains 2 requests,
++        # but only 1 request was dispatched,
++        # as the first request was not yet finalized.
++        self.assertEqual(len(qr.dispatchedRequests), 1)
++        # The first request is finalized and the
++        # second request is dispatched right away.
++        qr.dispatchedRequests[0].finish()
++        self.assertEqual(len(qr.dispatchedRequests), 2)
++
++    def test_multipleRequestsInDifferentSegments(self) -> None:
++        """
++        Twisted MUST NOT respond to a second HTTP/1.1 request while the first
++        is still pending, even if the second request is received in a separate
++        TCP package.
++        """
++        qr = QueueResource()
++        site = Site(qr)
++        proto = site.buildProtocol(None)
++        serverTransport = StringTransport()
++        proto.makeConnection(serverTransport)
++        raw_data = (
++            b"GET /first HTTP/1.1\r\nHost: a\r\n\r\n"
++            b"GET /second HTTP/1.1\r\nHost: a\r\n\r\n"
++        )
++        # Just go byte by byte for the extreme case in which each byte is
++        # received in a separate TCP package.
++        for chunk in iterbytes(raw_data):
++            proto.dataReceived(chunk)
++        # The TCP data contains 2 requests,
++        # but only 1 request was dispatched,
++        # as the first request was not yet finalized.
++        self.assertEqual(len(qr.dispatchedRequests), 1)
++        # The first request is finalized and the
++        # second request is dispatched right away.
++        qr.dispatchedRequests[0].finish()
++        self.assertEqual(len(qr.dispatchedRequests), 2)
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index ef602890ea..5b23ceeb91 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -13,7 +13,8 @@ PYPI_PACKAGE = "Twisted"
 
 SRC_URI += "file://CVE-2024-41671-0001.patch \
             file://CVE-2024-41671-0002.patch \
-            file://CVE-2024-41810.patch"
+            file://CVE-2024-41810.patch \
+            file://CVE-2023-46137.patch"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.40.0


