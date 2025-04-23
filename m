Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54810C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 04:59:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1673.1745384381725567616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 21:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=620871aa93=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N4vVV6015415
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 21:59:41 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd0agt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 21:59:41 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 22 Apr 2025 21:59:40 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 22 Apr 2025 21:59:38 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix CVE-2024-41671
Date: Wed, 23 Apr 2025 04:59:35 +0000
Message-ID: <20250423045935.3624109-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=680873bd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xfoxs9UgAAAA:8
 a=qIH_2GN7qcpZUxBTpp4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=f8UTX3tlV_53kSMYTKjV:22
X-Proofpoint-ORIG-GUID: SqmGhr3ibJjiKnDNmOMlXd4P5JGzrQ7L
X-Proofpoint-GUID: SqmGhr3ibJjiKnDNmOMlXd4P5JGzrQ7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzMCBTYWx0ZWRfX17k+Td6n83zb 5Z4xihgrg6Ah9G2UGtew5L1+ZK1ovBBkFz0YYfHoeGw3I9n/7OqXGB7rlf10POgc7w3MwpK1OyE n3pCa/3HFgbUmS2xz6n2C/rk5Two2HKFiiNY7Ybn+waH7SETMvYTsEJeCTFQpwtrskWwKI+3+xN
 teyGj5JZa4cqXLJKhPxkhtzFxeQj07bo0/+b9gMNi5jwMMVgMOiSOqZ/d5ZWyW2F9e8d3QWykWP VSKjYgGuz3KNqw176IKPkBn6bzyUGI8BQ4D9QkpsMmREgbRQFnw0DGaM3HhMmxUgDMXPz+TEgOs N99NA8jkVhPYhbLZbJdzBF3R8Y0WzleEdn7lagIS9GaGts99ZhM+ehPEZL/xe+/38VeolGTa+4d
 I9d6HQsgr5YyKkwL4Nk9K03ggG5ZnLJLOtxAC7fMDl+Pk2EFri76t1LQwBqcW0FYY1QEaFeB
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_02,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=520 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 04:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117073

From: Soumya Sambu <soumya.sambu@windriver.com>

Twisted is an event-based framework for internet applications, supporting Python 3.6+.
The HTTP 1.0 and 1.1 server provided by twisted.web could process pipelined HTTP
requests out-of-order, possibly resulting in information disclosure. This vulnerability
is fixed in 24.7.0rc1.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-41671
https://ubuntu.com/security/CVE-2024-41671

Upstream patches:
https://github.com/twisted/twisted/commit/f1cb4e616e9f23b4dd044a6db44365060950c64f
https://github.com/twisted/twisted/commit/ef2c755e9e9d57d58132af790bd2fd2b957b3fb1

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-twisted/CVE-2024-41671-0001.patch |  33 +++
 .../python3-twisted/CVE-2024-41671-0002.patch | 196 ++++++++++++++++++
 .../python/python3-twisted_22.2.0.bb          |   3 +
 3 files changed, 232 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
new file mode 100644
index 0000000000..a5bffbd5a5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
@@ -0,0 +1,33 @@
+From f1cb4e616e9f23b4dd044a6db44365060950c64f Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Mon, 22 Jul 2024 22:21:10 -0700
+Subject: [PATCH] Use chunking in the pipelining tests
+
+CVE: CVE-2024-41671
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/f1cb4e616e9f23b4dd044a6db44365060950c64f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/twisted/web/test/test_http.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 7ffea4e..5d88ff1 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -575,9 +575,11 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+         b"Content-Length: 10\r\n"
+         b"\r\n"
+         b"0123456789POST / HTTP/1.1\r\n"
+-        b"Content-Length: 10\r\n"
++        b"Transfer-Encoding: chunked\r\n"
+         b"\r\n"
++        b"a\r\n"
+         b"0123456789"
++        b"0\r\n"
+     )
+
+     expectedResponses = [
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
new file mode 100644
index 0000000000..4775f1c55c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
@@ -0,0 +1,196 @@
+From ef2c755e9e9d57d58132af790bd2fd2b957b3fb1 Mon Sep 17 00:00:00 2001
+From: Tom Most <twm@freecog.net>
+Date: Mon, 22 Jul 2024 23:21:49 -0700
+Subject: [PATCH] Tests and partial fix
+
+CVE: CVE-2024-41671
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/ef2c755e9e9d57d58132af790bd2fd2b957b3fb1]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/twisted/web/http.py           |   2 +-
+ src/twisted/web/test/test_http.py | 112 +++++++++++++++++++++++++++---
+ 2 files changed, 102 insertions(+), 12 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index a53ebc2..96a1335 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2256,8 +2256,8 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
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
+index 5d88ff1..86c85d2 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -136,7 +136,7 @@ class DummyHTTPHandler(http.Request):
+         data = self.content.read()
+         length = self.getHeader(b"content-length")
+         if length is None:
+-            length = networkString(str(length))
++            length = str(length).encode()
+         request = b"'''\n" + length + b"\n" + data + b"'''\n"
+         self.setResponseCode(200)
+         self.setHeader(b"Request", self.uri)
+@@ -567,7 +567,8 @@ class HTTP0_9Tests(HTTP1_0Tests):
+
+ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+     """
+-    Tests that multiple pipelined requests with bodies are correctly buffered.
++    Pipelined requests get buffered and executed in the order received,
++    not processed in parallel.
+     """
+
+     requests = (
+@@ -578,8 +579,9 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
+         b"Transfer-Encoding: chunked\r\n"
+         b"\r\n"
+         b"a\r\n"
+-        b"0123456789"
++        b"0123456789\r\n"
+         b"0\r\n"
++        b"\r\n"
+     )
+
+     expectedResponses = [
+@@ -596,14 +598,16 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
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
+@@ -612,10 +616,9 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
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
+@@ -624,8 +627,95 @@ class PipeliningBodyTests(unittest.TestCase, ResponseTestMixin):
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
++
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
++
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
++
++        This doesn't check the at-most-one pending request
++        invariant but exercises otherwise uncovered code paths.
++        See GHSA-c8m8-j448-xjx7.
++
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
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index c55c86ea50..da83f0123a 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] = "57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba5
 
 PYPI_PACKAGE = "Twisted"
 
+SRC_URI += "file://CVE-2024-41671-0001.patch \
+            file://CVE-2024-41671-0002.patch"
+
 inherit pypi python_setuptools_build_meta
 
 do_install:append() {
-- 
2.40.0


