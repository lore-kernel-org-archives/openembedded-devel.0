Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD7EE7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 08:33:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9786.1735288419676345966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 00:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=209189776c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR8UDR0026866
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:33:39 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8dc1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:33:38 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 27 Dec 2024 00:33:37 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 27 Dec 2024 00:33:36 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-werkzeug: Fix CVE-2024-49767
Date: Fri, 27 Dec 2024 08:33:32 +0000
Message-ID: <20241227083332.1928449-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: O2mmuj9BnwW_F3wWXP6SswcKza3z0Vma
X-Proofpoint-ORIG-GUID: O2mmuj9BnwW_F3wWXP6SswcKza3z0Vma
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676e6662 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=xwtCrNXfNSw8txiBq-IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=885 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114557

From: Soumya Sambu <soumya.sambu@windriver.com>

Werkzeug is a Web Server Gateway Interface web application library. Applications
using `werkzeug.formparser.MultiPartParser` corresponding to a version of Werkzeug
prior to 3.0.6 to parse `multipart/form-data` requests (e.g. all flask applications)
are vulnerable to a relatively simple but effective resource exhaustion (denial of
service) attack. A specifically crafted form submission request can cause the parser
to allocate and block 3 to 8 times the upload size in main memory. There is no upper
limit; a single upload at 1 Gbit/s can exhaust 32 GB of RAM in less than 60 seconds.
Werkzeug version 3.0.6 fixes this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-49767

Upstream-patch:
https://github.com/pallets/werkzeug/commit/8760275afb72bd10b57d92cb4d52abf759b2f3a7

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-werkzeug/CVE-2024-49767.patch     | 87 +++++++++++++++++++
 .../python/python3-werkzeug_2.1.1.bb          |  3 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-49767.patch

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-49767.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-49767.patch
new file mode 100644
index 0000000000..279c6e522d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-49767.patch
@@ -0,0 +1,87 @@
+From 8760275afb72bd10b57d92cb4d52abf759b2f3a7 Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Fri, 25 Oct 2024 06:46:50 -0700
+Subject: [PATCH] apply max_form_memory_size another level up in the parser
+
+CVE: CVE-2024-49767
+
+Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/8760275afb72bd10b57d92cb4d52abf759b2f3a7]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/werkzeug/formparser.py       | 11 +++++++++++
+ src/werkzeug/sansio/multipart.py |  2 ++
+ tests/test_formparser.py         | 12 ++++++++++++
+ 3 files changed, 25 insertions(+)
+
+diff --git a/src/werkzeug/formparser.py b/src/werkzeug/formparser.py
+index bebb2fc..b82af82 100644
+--- a/src/werkzeug/formparser.py
++++ b/src/werkzeug/formparser.py
+@@ -405,6 +405,7 @@ class MultiPartParser:
+     def parse(
+         self, stream: t.IO[bytes], boundary: bytes, content_length: t.Optional[int]
+     ) -> t.Tuple[MultiDict, MultiDict]:
++        field_size: int | None = None
+         container: t.Union[t.IO[bytes], t.List[bytes]]
+         _write: t.Callable[[bytes], t.Any]
+
+@@ -431,13 +432,23 @@ class MultiPartParser:
+             while not isinstance(event, (Epilogue, NeedData)):
+                 if isinstance(event, Field):
+                     current_part = event
++                    field_size = 0
+                     container = []
+                     _write = container.append
+                 elif isinstance(event, File):
+                     current_part = event
++                    field_size = None
+                     container = self.start_file_streaming(event, content_length)
+                     _write = container.write
+                 elif isinstance(event, Data):
++                    if self.max_form_memory_size is not None and field_size is not None:
++                        # Ensure that accumulated data events do not exceed limit.
++                        # Also checked within single event in MultipartDecoder.
++                        field_size += len(event.data)
++
++                        if field_size > self.max_form_memory_size:
++                            raise RequestEntityTooLarge()
++
+                     _write(event.data)
+                     if not event.more_data:
+                         if isinstance(current_part, Field):
+diff --git a/src/werkzeug/sansio/multipart.py b/src/werkzeug/sansio/multipart.py
+index e7d742b..a91fedd 100644
+--- a/src/werkzeug/sansio/multipart.py
++++ b/src/werkzeug/sansio/multipart.py
+@@ -137,6 +137,8 @@ class MultipartDecoder:
+             self.max_form_memory_size is not None
+             and len(self.buffer) + len(data) > self.max_form_memory_size
+         ):
++            # Ensure that data within single event does not exceed limit.
++            # Also checked across accumulated events in MultiPartParser.
+             raise RequestEntityTooLarge()
+         else:
+             self.buffer.extend(data)
+diff --git a/tests/test_formparser.py b/tests/test_formparser.py
+index 834324f..1a178dd 100644
+--- a/tests/test_formparser.py
++++ b/tests/test_formparser.py
+@@ -459,3 +459,15 @@ class TestMultiPartParser:
+         )
+         assert request.files["rfc2231"].filename == "a b c d e f.txt"
+         assert request.files["rfc2231"].read() == b"file contents"
++
++
++def test_multipart_max_form_memory_size() -> None:
++    """max_form_memory_size is tracked across multiple data events."""
++    data = b"--bound\r\nContent-Disposition: form-field; name=a\r\n\r\n"
++    data += b"a" * 15 + b"\r\n--bound--"
++    # The buffer size is less than the max size, so multiple data events will be
++    # returned. The field size is greater than the max.
++    parser = formparser.MultiPartParser(max_form_memory_size=10, buffer_size=5)
++
++    with pytest.raises(RequestEntityTooLarge):
++        parser.parse(io.BytesIO(data), b"bound", None)
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index 12f6dff17d..5529686aac 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -15,7 +15,8 @@ PYPI_PACKAGE = "Werkzeug"
 SRC_URI += "file://CVE-2023-25577.patch \
             file://CVE-2023-23934.patch \
             file://CVE-2024-34069-0001.patch \
-            file://CVE-2024-34069-0002.patch"
+            file://CVE-2024-34069-0002.patch \
+            file://CVE-2024-49767.patch"
 
 SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
 
-- 
2.40.0


