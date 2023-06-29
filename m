Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB52EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 16:36:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1840.1688056595507667172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jun 2023 09:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=P+wc0dNk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6544be54dc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35TCSvBe005888
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 09:36:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zs1D3
	ipG9kjnxTFtBcjVsKh2LMyFB4IF6REQ2mb+quM=; b=P+wc0dNk61t36O2TGalNc
	JWBFLu7pG6wSf9maaGZrNkgRgOU/yarot0loICMezHkWEc7hA09FZxYQp4R+csKT
	Swe66f+fUzWeJNob+nXi0C2G1JM13gqanUnKGnEbNBIKgfT5EUcaVpfXeZr9ldYl
	cj6eeoEDzz2yk2B3OcJtMtAe6sZzjvLS4nAlTOfI5Gz37+UdexF9mpici8f3LosU
	eTpMYuEOrSgrIKdtqpWFu8fDXPUoVDLsEbiveDlJ/UKaUVSd4T57nT9C4m6BWd1p
	vYDAcV9hz823AwgOIVmccvuRqnFQRNzpmRsoHWxMxrR+qzlyR+NUp8AhpW8tMy8f
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb48hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 09:36:34 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 09:36:32 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-werkzeug: fix for patch-fuzz
Date: Thu, 29 Jun 2023 16:36:08 +0000
Message-ID: <20230629163608.3786099-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: SpSn237pydQXdMMcQEJeWMVzfTwgKv6b
X-Proofpoint-ORIG-GUID: SpSn237pydQXdMMcQEJeWMVzfTwgKv6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=814 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290151
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 16:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103641

From: Narpat Mali <narpat.mali@windriver.com>

Modified the CVE-2023-23934.patch to fix the patch-fuzz.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-werkzeug/CVE-2023-23934.patch     | 35 ++++++++++---------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
index 0be97d288..3a0f4324a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
@@ -1,4 +1,4 @@
-From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17 00:00:00 2001
+From db1457abec7fe27148673f5f8bfdf5c52eb7f29f Mon Sep 17 00:00:00 2001
 From: David Lord <davidism@gmail.com>
 Date: Wed, 10 May 2023 11:33:18 +0000
 Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q
@@ -17,26 +17,26 @@ Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/cf275f42ac
 
 Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
 ---
- CHANGES.rst               |  4 ++++
+ CHANGES.rst               |  3 +++
  src/werkzeug/_internal.py | 13 +++++++++----
  src/werkzeug/http.py      |  4 ----
  tests/test_http.py        |  4 +++-
- 4 files changed, 16 insertions(+), 9 deletions(-)
+ 4 files changed, 15 insertions(+), 9 deletions(-)
 
 diff --git a/CHANGES.rst b/CHANGES.rst
-index a351d7c..23505d3 100644
+index 6e809ba..13ef75b 100644
 --- a/CHANGES.rst
 +++ b/CHANGES.rst
-@@ -1,5 +1,9 @@
- .. currentmodule:: werkzeug
-
+@@ -4,6 +4,9 @@
+     ``RequestEntityTooLarge`` exception is raised on parsing. This mitigates a DoS
+     attack where a larger number of form/file parts would result in disproportionate
+     resource use.
 +-   A cookie header that starts with ``=`` is treated as an empty key and discarded,
 +    rather than stripping the leading ``==``.
 +
-+
+ 
  Version 2.1.1
  -------------
-
 diff --git a/src/werkzeug/_internal.py b/src/werkzeug/_internal.py
 index a8b3523..d6290ba 100644
 --- a/src/werkzeug/_internal.py
@@ -55,14 +55,14 @@ index a8b3523..d6290ba 100644
      i = 0
      n = len(b)
 +    b += b";"
-
+ 
      while i < n:
 -        match = _cookie_re.search(b + b";", i)
 +        match = _cookie_re.match(b, i)
 +
          if not match:
              break
-
+ 
 -        key = match.group("key").strip()
 -        value = match.group("val") or b""
          i = match.end(0)
@@ -70,11 +70,11 @@ index a8b3523..d6290ba 100644
 +
 +        if not key:
 +            continue
-
+ 
 +        value = match.group("val") or b""
          yield key, _cookie_unquote(value)
-
-
+ 
+ 
 diff --git a/src/werkzeug/http.py b/src/werkzeug/http.py
 index 9369900..ae133e3 100644
 --- a/src/werkzeug/http.py
@@ -89,7 +89,7 @@ index 9369900..ae133e3 100644
 -
              val_str = _to_str(val, charset, errors, allow_none_charset=True)
              yield key_str, val_str
-
+ 
 diff --git a/tests/test_http.py b/tests/test_http.py
 index 5936bfa..59cc179 100644
 --- a/tests/test_http.py
@@ -110,7 +110,8 @@ index 5936bfa..59cc179 100644
              '"__Secure-c"': "d",
 +            "__Host-eq": "good",
          }
-
+ 
      def test_dump_cookie(self):
---
+-- 
 2.40.0
+
-- 
2.40.0


