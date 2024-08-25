Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36321C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:41:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37272.1724611269042919579
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8967a4d043=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PIf8fq032703;
	Sun, 25 Aug 2024 11:41:08 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k8u33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 11:41:08 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 25 Aug 2024 11:41:07 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 25 Aug 2024 11:41:06 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] python3-twisted: Fix CVE-2024-41671
Date: Sun, 25 Aug 2024 18:41:03 +0000
Message-ID: <20240825184103.996628-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kPi4grpLKunf1OUxBbqh3zrgSN4eqtFk
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cb7ac4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=A1X0JdhQAAAA:8 a=PmPdvnPKAAAA:8
 a=PAIoCpI8rF-oIp4kseMA:9 a=iV6zm09U03EEZ5FU:21 a=L03L2QfmqWoA:10 a=1WNtSb5ECZgA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=96-UuAdfYG6OSYlHWuPe:22 a=Df3jFdWbhGDLdZNm0fyq:22 a=ZCh4QoaBVut9GMebS46n:22
X-Proofpoint-GUID: kPi4grpLKunf1OUxBbqh3zrgSN4eqtFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_15,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=969 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408250149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 18:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111936

From: Soumya Sambu <soumya.sambu@windriver.com>

Twisted is an event-based framework for internet applications, supporting
Python 3.6+. The HTTP 1.0 and 1.1 server provided by twisted.web could process
pipelined HTTP requests out-of-order, possibly resulting in information
disclosure. This vulnerability is fixed in 24.7.0rc1.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-41671

Upstream-patches:
https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33
https://github.com/twisted/twisted/commit/4a930de12fb67e88fefcb8822104152f42b27abc

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-twisted/CVE-2024-41671-0001.patch |  89 +++++++
 .../python3-twisted/CVE-2024-41671-0002.patch | 251 ++++++++++++++++++
 .../python/python3-twisted_24.3.0.bb          |   5 +
 3 files changed, 345 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
new file mode 100644
index 000000000..1f6bf6bbf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
@@ -0,0 +1,89 @@
+From 046a164f89a0f08d3239ecebd750360f8914df33 Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Mon Jul 29 14:28:03 2024 +0100
+Subject: [PATCH] Merge commit from fork
+
+Added HTML output encoding the "URL" parameter of the "redirectTo" function
+
+CVE: CVE-2024-41671
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/twisted/web/_template_util.py |  2 +-
+ src/twisted/web/test/test_util.py | 39 ++++++++++++++++++++++++++++++-
+ 2 files changed, 39 insertions(+), 2 deletions(-)
+
+diff --git a/src/twisted/web/_template_util.py b/src/twisted/web/_template_util.py
+index 230c33f..7266079 100644
+--- a/src/twisted/web/_template_util.py
++++ b/src/twisted/web/_template_util.py
+@@ -92,7 +92,7 @@ def redirectTo(URL: bytes, request: IRequest) -> bytes:
+     </body>
+ </html>
+ """ % {
+-        b"url": URL
++        b"url": escape(URL.decode("utf-8")).encode("utf-8")
+     }
+     return content
+
+diff --git a/src/twisted/web/test/test_util.py b/src/twisted/web/test/test_util.py
+index 1e76300..9847dcb 100644
+--- a/src/twisted/web/test/test_util.py
++++ b/src/twisted/web/test/test_util.py
+@@ -5,7 +5,6 @@
+ Tests for L{twisted.web.util}.
+ """
+
+-
+ import gc
+
+ from twisted.internet import defer
+@@ -64,6 +63,44 @@ class RedirectToTests(TestCase):
+         targetURL = "http://target.example.com/4321"
+         self.assertRaises(TypeError, redirectTo, targetURL, request)
+
++    def test_legitimateRedirect(self):
++        """
++        Legitimate URLs are fully interpolated in the `redirectTo` response body without transformation
++        """
++        request = DummyRequest([b""])
++        html = redirectTo(b"https://twisted.org/", request)
++        expected = b"""
++<html>
++    <head>
++        <meta http-equiv=\"refresh\" content=\"0;URL=https://twisted.org/\">
++    </head>
++    <body bgcolor=\"#FFFFFF\" text=\"#000000\">
++    <a href=\"https://twisted.org/\">click here</a>
++    </body>
++</html>
++"""
++        self.assertEqual(html, expected)
++
++    def test_maliciousRedirect(self):
++        """
++        Malicious URLs are HTML-escaped before interpolating them in the `redirectTo` response body
++        """
++        request = DummyRequest([b""])
++        html = redirectTo(
++            b'https://twisted.org/"><script>alert(document.location)</script>', request
++        )
++        expected = b"""
++<html>
++    <head>
++        <meta http-equiv=\"refresh\" content=\"0;URL=https://twisted.org/&quot;&gt;&lt;script&gt;alert(document.location)&lt;/script&gt;\">
++    </head>
++    <body bgcolor=\"#FFFFFF\" text=\"#000000\">
++    <a href=\"https://twisted.org/&quot;&gt;&lt;script&gt;alert(document.location)&lt;/script&gt;\">click here</a>
++    </body>
++</html>
++"""
++        self.assertEqual(html, expected)
++
+
+ class ParentRedirectTests(SynchronousTestCase):
+     """
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
new file mode 100644
index 000000000..147c21d73
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
@@ -0,0 +1,251 @@
+From 4a930de12fb67e88fefcb8822104152f42b27abc Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Mon Jul 29 14:27:23 2024 +0100
+Subject: [PATCH] Merge commit from fork
+
+Address GHSA-c8m8-j448-xjx7
+
+CVE: CVE-2024-41671
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/4a930de12fb67e88fefcb8822104152f42b27abc]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/twisted/web/http.py           |  21 +++--
+ src/twisted/web/test/test_http.py | 122 ++++++++++++++++++++++++++----
+ 2 files changed, 122 insertions(+), 21 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 1c59838..3b784f5 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2000,16 +2000,21 @@ class _ChunkedTransferDecoder:
+         @returns: C{False}, as there is either insufficient data to continue,
+             or no data remains.
+         """
+-        if (
+-            self._receivedTrailerHeadersSize + len(self._buffer)
+-            > self._maxTrailerHeadersSize
+-        ):
+-            raise _MalformedChunkedDataError("Trailer headers data is too long.")
+-
+         eolIndex = self._buffer.find(b"\r\n", self._start)
+
+         if eolIndex == -1:
+             # Still no end of network line marker found.
++            #
++            # Check if we've run up against the trailer size limit: if the next
++            # read contains the terminating CRLF then we'll have this many bytes
++            # of trailers (including the CRLFs).
++            minTrailerSize = (
++                self._receivedTrailerHeadersSize
++                + len(self._buffer)
++                + (1 if self._buffer.endswith(b"\r") else 2)
++            )
++            if minTrailerSize > self._maxTrailerHeadersSize:
++                raise _MalformedChunkedDataError("Trailer headers data is too long.")
+             # Continue processing more data.
+             return False
+
+@@ -2019,6 +2024,8 @@ class _ChunkedTransferDecoder:
+             del self._buffer[0 : eolIndex + 2]
+             self._start = 0
+             self._receivedTrailerHeadersSize += eolIndex + 2
++            if self._receivedTrailerHeadersSize > self._maxTrailerHeadersSize:
++                raise _MalformedChunkedDataError("Trailer headers data is too long.")
+             return True
+
+         # eolIndex in this part of code is equal to 0
+@@ -2342,8 +2349,8 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+             self.__header = line
+
+     def _finishRequestBody(self, data):
+-        self.allContentReceived()
+         self._dataBuffer.append(data)
++        self.allContentReceived()
+
+     def _maybeChooseTransferDecoder(self, header, data):
+         """
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 33d0a49..1130d31 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -135,7 +135,7 @@ class DummyHTTPHandler(http.Request):
+         data = self.content.read()
+         length = self.getHeader(b"content-length")
+         if length is None:
+-            length = networkString(str(length))
++            length = str(length).encode()
+         request = b"'''\n" + length + b"\n" + data + b"'''\n"
+         self.setResponseCode(200)
+         self.setHeader(b"Request", self.uri)
+@@ -563,17 +563,23 @@ class HTTP0_9Tests(HTTP1_0Tests):
+
+ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+     """
+-    Tests that multiple pipelined requests with bodies are correctly buffered.
++    Pipelined requests get buffered and executed in the order received,
++    not processed in parallel.
+     """
+
+     requests = (
+         b"POST / HTTP/1.1\r\n"
+         b"Content-Length: 10\r\n"
+         b"\r\n"
+-        b"0123456789POST / HTTP/1.1\r\n"
+-        b"Content-Length: 10\r\n"
+-        b"\r\n"
+         b"0123456789"
++        # Chunk encoded request.
++        b"POST / HTTP/1.1\r\n"
++        b"Transfer-Encoding: chunked\r\n"
++        b"\r\n"
++        b"a\r\n"
++        b"0123456789\r\n"
++        b"0\r\n"
++        b"\r\n"
+     )
+
+     expectedResponses = [
+@@ -590,14 +596,16 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+             b"Request: /",
+             b"Command: POST",
+             b"Version: HTTP/1.1",
+-            b"Content-Length: 21",
+-            b"'''\n10\n0123456789'''\n",
++            b"Content-Length: 23",
++            b"'''\nNone\n0123456789'''\n",
+         ),
+     ]
+
+-    def test_noPipelining(self):
++    def test_stepwiseTinyTube(self):
+         """
+-        Test that pipelined requests get buffered, not processed in parallel.
++        Imitate a slow connection that delivers one byte at a time.
++        The request handler (L{DelayedHTTPHandler}) is puppeted to
++        step through the handling of each request.
+         """
+         b = StringTransport()
+         a = http.HTTPChannel()
+@@ -606,10 +614,9 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+         # one byte at a time, to stress it.
+         for byte in iterbytes(self.requests):
+             a.dataReceived(byte)
+-        value = b.value()
+
+         # So far only one request should have been dispatched.
+-        self.assertEqual(value, b"")
++        self.assertEqual(b.value(), b"")
+         self.assertEqual(1, len(a.requests))
+
+         # Now, process each request one at a time.
+@@ -618,8 +625,91 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+             request = a.requests[0].original
+             request.delayedProcess()
+
+-        value = b.value()
+-        self.assertResponseEquals(value, self.expectedResponses)
++        self.assertResponseEquals(b.value(), self.expectedResponses)
++
++    def test_stepwiseDumpTruck(self):
++        """
++        Imitate a fast connection where several pipelined
++        requests arrive in a single read. The request handler
++        (L{DelayedHTTPHandler}) is puppeted to step through the
++        handling of each request.
++        """
++        b = StringTransport()
++        a = http.HTTPChannel()
++        a.requestFactory = DelayedHTTPHandlerProxy
++        a.makeConnection(b)
++
++        a.dataReceived(self.requests)
++
++        # So far only one request should have been dispatched.
++        self.assertEqual(b.value(), b"")
++        self.assertEqual(1, len(a.requests))
++
++        # Now, process each request one at a time.
++        while a.requests:
++            self.assertEqual(1, len(a.requests))
++            request = a.requests[0].original
++            request.delayedProcess()
++
++        self.assertResponseEquals(b.value(), self.expectedResponses)
++
++    def test_immediateTinyTube(self):
++        """
++        Imitate a slow connection that delivers one byte at a time.
++        (L{DummyHTTPHandler}) immediately responds, but no more
++        than one
++        """
++        b = StringTransport()
++        a = http.HTTPChannel()
++        a.requestFactory = DummyHTTPHandlerProxy  # "sync"
++        a.makeConnection(b)
++
++        # one byte at a time, to stress it.
++        for byte in iterbytes(self.requests):
++            a.dataReceived(byte)
++            # There is never more than one request dispatched at a time:
++            self.assertLessEqual(len(a.requests), 1)
++
++        self.assertResponseEquals(b.value(), self.expectedResponses)
++
++    def test_immediateDumpTruck(self):
++        """
++        Imitate a fast connection where several pipelined
++        requests arrive in a single read. The request handler
++        (L{DummyHTTPHandler}) immediately responds.
++        This doesn't check the at-most-one pending request
++        invariant but exercises otherwise uncovered code paths.
++        See GHSA-c8m8-j448-xjx7.
++        """
++        b = StringTransport()
++        a = http.HTTPChannel()
++        a.requestFactory = DummyHTTPHandlerProxy
++        a.makeConnection(b)
++
++        # All bytes at once to ensure there's stuff to buffer.
++        a.dataReceived(self.requests)
++
++        self.assertResponseEquals(b.value(), self.expectedResponses)
++
++    def test_immediateABiggerTruck(self):
++        """
++        Imitate a fast connection where a so many pipelined
++        requests arrive in a single read that backpressure is indicated.
++        The request handler (L{DummyHTTPHandler}) immediately responds.
++        This doesn't check the at-most-one pending request
++        invariant but exercises otherwise uncovered code paths.
++        See GHSA-c8m8-j448-xjx7.
++        @see: L{http.HTTPChannel._optimisticEagerReadSize}
++        """
++        b = StringTransport()
++        a = http.HTTPChannel()
++        a.requestFactory = DummyHTTPHandlerProxy
++        a.makeConnection(b)
++
++        overLimitCount = a._optimisticEagerReadSize // len(self.requests) * 10
++        a.dataReceived(self.requests * overLimitCount)
++
++        self.assertResponseEquals(b.value(), self.expectedResponses * overLimitCount)
+
+     def test_pipeliningReadLimit(self):
+         """
+@@ -1522,7 +1612,11 @@ class ChunkedTransferEncodingTests(unittest.TestCase):
+             lambda b: None,  # pragma: nocov
+         )
+         p._maxTrailerHeadersSize = 10
+-        p.dataReceived(b"3\r\nabc\r\n0\r\n0123456789")
++        # 9 bytes are received so far, in 2 packets.
++        # For now, all is ok.
++        p.dataReceived(b"3\r\nabc\r\n0\r\n01234567")
++        p.dataReceived(b"\r")
++        # Once the 10th byte is received, the processing fails.
+         self.assertRaises(
+             http._MalformedChunkedDataError,
+             p.dataReceived,
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 336c17389..272aecb8b 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -6,6 +6,11 @@ HOMEPAGE = "https://twisted.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 
+SRC_URI += " \
+    file://CVE-2024-41671-0001.patch \
+    file://CVE-2024-41671-0002.patch \
+"
+
 SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"
 
 inherit pypi python_hatchling
-- 
2.40.0


