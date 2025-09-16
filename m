Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966F0CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 12:56:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19136.1758027379940530680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 05:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KUbCUg9R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1354656811=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G4eWqY1387408
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 05:56:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iQRttn0G6wbTW67m4MoV
	6+HiOb+WFxXGuz/A4ov5vR0=; b=KUbCUg9RuqA1U3SMLrT4fDA4oF/KaRZ7S5bI
	r7pjxDVgEx7gb5+riKofJ7NDwNxWuvQl6VxjvK7bja/AvmIM5nnc2i2M5uz83dOq
	PIRGmq4PbVlzJdGbDitcxbRwxoAd2YDNSGHwoGxYzt+PirB0skzhSC7ygWU0K19A
	sQ1s7CvqSIDQ5V06AFWFBNAO0f2L+R/EuxRoK9nkWYTbDEUAwpuOrIgs1FWg8Vma
	EaKi59ZFkAR0NynSVqFh3TpR8E5E73F3abl70VgHNXcbc8N7EwT8vuKieN47Ptad
	kPeBa+gLanMPqPVHF6lWPRnktEFM2x+FSWAMelCuK9dFgPIdIQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hk0sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 05:56:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 16 Sep 2025 05:56:18 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 16 Sep 2025 05:56:17 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix CVE-2024-41810
Date: Tue, 16 Sep 2025 18:26:00 +0530
Message-ID: <20250916125600.1274823-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c95e73 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wjU5IotzqukA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=A1X0JdhQAAAA:8 a=PmPdvnPKAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Fh4SmhTExUq_HUniyNMA:9 a=Ft01igJXj0jPiUNu:21 a=L03L2QfmqWoA:10
 a=1WNtSb5ECZgA:10 a=ZCh4QoaBVut9GMebS46n:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDEyMCBTYWx0ZWRfX2yP9QxAeJklx
 zcDaKa8Wk9dW+G2zcX1CnIVwVCc2XR+ahjC2RxGQo0glOPdZERjztXJD/uG4q9mL8hyREqXSz9c
 ZEwClNSeovU6GbWOyMxWMgcqNFy/qoj4YuMo75eW4MlB4p3wo0ZipjrxXC8lmAFanwIi4fGq/bG
 bB36V1/2aBnW4itNcjHNGyhrFWLeS3RYYIckUklnEqCpF/VOYMvaGdpZA4nc8vXvnX/rmr9Cm0a
 kq4NeJ5OVGvtrR68Ea8KCElOGcguhT7fJnpVJVHX0DXquj73GgNYUYuGgGNVjqMw13VlyzI3/bk
 zAdlZ3gQB/ScGbAZHXjW/3KP+xzPzJBQdtTbuN1XeIzZ2o9hjyXLxwB8CNYgzs=
X-Proofpoint-GUID: cglQ9UDThVpmQQELQ8fPq1NqyK5j0A2j
X-Proofpoint-ORIG-GUID: cglQ9UDThVpmQQELQ8fPq1NqyK5j0A2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 12:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119466

From: Soumya Sambu <soumya.sambu@windriver.com>

Twisted is an event-based framework for internet applications, supporting Python 3.6+.
The `twisted.web.util.redirectTo` function contains an HTML injection vulnerability.
If application code allows an attacker to control the redirect URL this vulnerability
may result in Reflected Cross-Site Scripting (XSS) in the redirect response HTML body.
This vulnerability is fixed in 24.7.0rc1.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41810

Upstream patch:
https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-twisted/CVE-2024-41810.patch      | 109 ++++++++++++++++++
 .../python/python3-twisted_22.2.0.bb          |   3 +-
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
new file mode 100644
index 0000000000..c0842304dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
@@ -0,0 +1,109 @@
+From 046a164f89a0f08d3239ecebd750360f8914df33 Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Mon Jul 29 14:28:03 2024 +0100
+Subject: [PATCH] Merge commit from fork
+
+Added HTML output encoding the "URL" parameter of the "redirectTo" function
+
+CVE: CVE-2024-41810
+
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/twisted/web/_template_util.py          |  2 +-
+ src/twisted/web/newsfragments/12263.bugfix |  1 +
+ src/twisted/web/newsfragments/9839.bugfix  |  1 +
+ src/twisted/web/test/test_util.py          | 39 +++++++++++++++++++++-
+ 4 files changed, 41 insertions(+), 2 deletions(-)
+ create mode 100644 src/twisted/web/newsfragments/12263.bugfix
+ create mode 100644 src/twisted/web/newsfragments/9839.bugfix
+
+diff --git a/src/twisted/web/_template_util.py b/src/twisted/web/_template_util.py
+index bd081bd..3fb56e5 100644
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
+diff --git a/src/twisted/web/newsfragments/12263.bugfix b/src/twisted/web/newsfragments/12263.bugfix
+new file mode 100644
+index 0000000..b3982ca
+--- /dev/null
++++ b/src/twisted/web/newsfragments/12263.bugfix
+@@ -0,0 +1 @@
++twisted.web.util.redirectTo now HTML-escapes the provided URL in the fallback response body it returns (GHSA-cf56-g6w6-pqq2). The issue is being tracked with CVE-2024-41810.
+\ No newline at end of file
+diff --git a/src/twisted/web/newsfragments/9839.bugfix b/src/twisted/web/newsfragments/9839.bugfix
+new file mode 100644
+index 0000000..1e2e7f7
+--- /dev/null
++++ b/src/twisted/web/newsfragments/9839.bugfix
+@@ -0,0 +1 @@
++twisted.web.util.redirectTo now HTML-escapes the provided URL in the fallback response body it returns (GHSA-cf56-g6w6-pqq2, CVE-2024-41810).
+diff --git a/src/twisted/web/test/test_util.py b/src/twisted/web/test/test_util.py
+index 996b0d0..87282ce 100644
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
+
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index da83f0123a..ef602890ea 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -12,7 +12,8 @@ SRC_URI[sha256sum] = "57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba5
 PYPI_PACKAGE = "Twisted"
 
 SRC_URI += "file://CVE-2024-41671-0001.patch \
-            file://CVE-2024-41671-0002.patch"
+            file://CVE-2024-41671-0002.patch \
+            file://CVE-2024-41810.patch"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.40.0


