Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB35C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 09:15:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3044.1749114956535834724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 02:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82516989db=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5555cfSq004532
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Jun 2025 09:15:55 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t3qxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 09:15:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 02:15:54 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 02:15:53 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-python][kirkstone][PATCH] python3-aiohttp: fix CVE-2024-42367
Date: Thu, 5 Jun 2025 17:15:50 +0800
Message-ID: <20250605091550.1472299-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lFjcBv6e_i-a7r3FcFk7otepxVyK_bHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA4MSBTYWx0ZWRfXx0Ebn7GWu34A 8ZPNkLdOU7HXIIoSfssEM5qfIeYW/uj8c8QKd2ilEoSgvNAiJZRZk5sGRn7YXsWgHxYFHaNnOxT kqH7C3B6Wh0tN2LvGx9rNySmSaQOjxGqDZUbEprmdi9+SC86xJEDyO8porqMzBBK2mIIfW7qpEN
 MPxejQXBedoHraiV3GzZIisLHPPpnsQNeLLigSCT7sFfVwrLslZYkAtHEw4ax7r0fX+b0RQsGFB 70ZibyMHVy3dxj3WHuuox9RcAGbzppaxukS26skRxe5YffaT+b8murl+P/uC+YmAv/pnjidOxTn edfUSfQw2ResuF4iQoJfyZgtjhTMnoaRMhhUWZpPptkc9VqhYfUKGbCoeYMZkYDlqcsLbE1Pn9m
 PTbbTG+1KFi5ehiIrfran1PbQPzlQR74pfaWQmrx9Lj0Cu2LRxZAQiJbbOlX8qitr0Ed4yXN
X-Proofpoint-GUID: lFjcBv6e_i-a7r3FcFk7otepxVyK_bHK
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=6841604b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VlckX9PKAAAA:8 a=tCkGIxjdHwJr90OghpsA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ZmiM9RdZ4sPD_HvZpKn1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 09:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117748

From: Jiaying Song <jiaying.song.cn@windriver.com>

aiohttp is an asynchronous HTTP client/server framework for asyncio and
Python. Prior to version 3.10.2, static routes which contain files with
compressed variants (`.gz` or `.br` extension) are vulnerable to path
traversal outside the root directory if those variants are symbolic
links. The server protects static routes from path traversal outside the
root directory when `follow_symlinks=False` (default). It does this by
resolving the requested URL to an absolute path and then checking that
path relative to the root. However, these checks are not performed when
looking for compressed variants in the `FileResponse` class, and
symbolic links are then automatically followed when performing the
`Path.stat()` and `Path.open()` to send the file. Version 3.10.2
contains a patch for the issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-42367
https://github.com/aio-libs/aiohttp/security/advisories/GHSA-jwhx-xcg6-8xhj

Upstream patch:
https://github.com/aio-libs/aiohttp/commit/ce2e9758814527589b10759a20783fb03b98339f

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-aiohttp/CVE-2024-42367.patch      | 65 +++++++++++++++++++
 .../python/python3-aiohttp_3.8.6.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
new file mode 100644
index 0000000000..dadec31f3a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
@@ -0,0 +1,65 @@
+From e19cb50fb529bbe75cc4f1b68eeb0a3f631ad0d0 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Thu, 8 Aug 2024 11:19:28 -0500
+Subject: [PATCH] Do not follow symlinks for compressed file variants (#8652)
+
+CVE: CVE-2024-42367
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/ce2e9758814527589b10759a20783fb03b98339f]
+
+Co-authored-by: Steve Repsher <steverep@users.noreply.github.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/8652.bugfix.rst     |  1 +
+ aiohttp/web_fileresponse.py | 26 ++++++++++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+ create mode 100644 CHANGES/8652.bugfix.rst
+
+diff --git a/CHANGES/8652.bugfix.rst b/CHANGES/8652.bugfix.rst
+new file mode 100644
+index 000000000..3a1003e50
+--- /dev/null
++++ b/CHANGES/8652.bugfix.rst
+@@ -0,0 +1 @@
++Fixed incorrectly following symlinks for compressed file variants -- by :user:`steverep`.
+diff --git a/aiohttp/web_fileresponse.py b/aiohttp/web_fileresponse.py
+index f41ed3fd0..35dbd41e1 100644
+--- a/aiohttp/web_fileresponse.py
++++ b/aiohttp/web_fileresponse.py
+@@ -127,6 +127,32 @@ class FileResponse(StreamResponse):
+         self.content_length = 0
+         return await super().prepare(request)
+ 
++    def _get_file_path_stat_encoding(
++        self, accept_encoding: str
++    ) -> Tuple[pathlib.Path, os.stat_result, Optional[str]]:
++        """Return the file path, stat result, and encoding.
++
++        If an uncompressed file is returned, the encoding is set to
++        :py:data:`None`.
++
++        This method should be called from a thread executor
++        since it calls os.stat which may block.
++        """
++        file_path = self._path
++        for file_extension, file_encoding in ENCODING_EXTENSIONS.items():
++            if file_encoding not in accept_encoding:
++                continue
++
++            compressed_path = file_path.with_suffix(file_path.suffix + file_extension)
++            with suppress(OSError):
++                # Do not follow symlinks and ignore any non-regular files.
++                st = compressed_path.lstat()
++                if S_ISREG(st.st_mode):
++                    return compressed_path, st, file_encoding
++
++        # Fallback to the uncompressed file
++        return file_path, file_path.stat(), None
++
+     async def prepare(self, request: "BaseRequest") -> Optional[AbstractStreamWriter]:
+         filepath = self._path
+ 
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index 479c2f2064..fdecf9ef4c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2024-23334.patch \
             file://CVE-2024-52304.patch \
             file://CVE-2023-49082.patch \
             file://CVE-2024-27306.patch \
+            file://CVE-2024-42367.patch \
            "
 
 SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
-- 
2.34.1


