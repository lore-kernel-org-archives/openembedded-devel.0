Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B49EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:41:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8388.1692787294915619143
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nNoLh031;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75991bd149=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N9jACZ004446;
	Wed, 23 Aug 2023 03:41:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=RSU5s
	XBJci+t+5ohPd1AxrriwLnJulvHOoJUQWJF5Ss=; b=nNoLh031uvlq2VlUiNh3w
	8XsVQGiOKZ/sG12bdeDMyZDr97oDpuSjklZU160hpfsg8ftgiL8zYNWc6F46IdpG
	nIqvA8Ozm1B0GLfSQ7Ivq8VENw/ezWI6aiWwuXWbtc494XLnds5KKG0DDgU0MnCo
	hOX8RtAXGQPgcZkwVJVa4SNw57i4yJKG4aSXgoZvngQdqO8R43mUwz2jLX11kGr7
	ptXgnhMtR9dAq3F5+O5e+57BX+i9KEecexcox8aSHpa3uNAD2mkGjchIepF76Hxb
	KLgoFyEJpmgEpyVkphunRFV6iwOmpCN1ocIoRiM/BIkySmracdZHQVJArnaaQ+8v
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e0mtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Aug 2023 03:41:30 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 03:41:28 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH v2 1/2] python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
Date: Wed, 23 Aug 2023 10:41:09 +0000
Message-ID: <20230823104110.1949022-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: fEeQ1-UCoMtVSI_8-4cJhwV5yk0I7Qzz
X-Proofpoint-ORIG-GUID: fEeQ1-UCoMtVSI_8-4cJhwV5yk0I7Qzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 10:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104535

From: Narpat Mali <narpat.mali@windriver.com>

Changelog:
https://pyup.io/packages/pypi/requests-toolbelt/changelog
https://github.com/requests/toolbelt/blob/master/HISTORY.rst

- License-Update: url of License changed from http to https.
- Fixing missing newline in dump utility.
- Add support for preparing requests in BaseUrlSession.
- Fix urllib3 warning to only emit on X509Adapter usage

Upstream master patches:
0.9.1 -> 0.10.0  : https://git.openembedded.org/meta-openembedded/commit/?id=a4f2646ef27a3f27bc607d57b8166071f307426f
0.10.0 -> 0.10.1 : https://git.openembedded.org/meta-openembedded/commit/?id=b5cd6f6164eb3ab0403f610236ac0cbbe5459671

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...abc-deprecation-warning-in-downloadu.patch | 41 -------------------
 ...bb => python3-requests-toolbelt_0.10.1.bb} |  8 ++--
 2 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
 rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.9.1.bb => python3-requests-toolbelt_0.10.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
deleted file mode 100644
index baa833b6d2..0000000000
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
-From: Jon Dufresne <jon.dufresne@gmail.com>
-Date: Fri, 1 Feb 2019 16:30:01 -0800
-Subject: [PATCH] Fix collections.abc deprecation warning in downloadutils
-
-Warning appears as:
-
-tests/test_downloadutils.py::test_stream_response_to_specific_filename
-  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated, and in 3.8 it will stop working
-    if path and isinstance(getattr(path, 'write', None), collections.Callable):
-
-Upstream-Status: Backport [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]
-
-Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
----
- requests_toolbelt/downloadutils/stream.py | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/requests_toolbelt/downloadutils/stream.py b/requests_toolbelt/downloadutils/stream.py
-index eed60a7..1d1c31b 100644
---- a/requests_toolbelt/downloadutils/stream.py
-+++ b/requests_toolbelt/downloadutils/stream.py
-@@ -1,6 +1,5 @@
- # -*- coding: utf-8 -*-
- """Utilities for dealing with streamed requests."""
--import collections
- import os.path
- import re
- 
-@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=None, chunksize=_DEFAULT_CHUNKSIZE):
-     pre_opened = False
-     fd = None
-     filename = None
--    if path and isinstance(getattr(path, 'write', None), collections.Callable):
-+    if path and callable(getattr(path, 'write', None)):
-         pre_opened = True
-         fd = path
-         filename = getattr(fd, 'name', None)
--- 
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
index 72ad7a6180..c39950ab5d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
@@ -3,14 +3,12 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
 AUTHOR = "Ian Cordasco, Cory Benfield"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
 
 SRC_URI = "file://run-ptest \
-           file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch \
-           "
+          "
 
-SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
-SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
+SRC_URI[sha256sum] = "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
 
 inherit pypi setuptools3 ptest
 
-- 
2.40.0


