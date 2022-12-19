Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F91C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 05:37:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14792.1671428222124597041
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 21:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oYAuLQzJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=935257dbcc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ5VKFU006476
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 21:37:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=0qN+z5/E61Ti4DIZ66DJwg20XoKy0poh4Lm3I5OJUuk=;
 b=oYAuLQzJOuvZGgP7FdGh+BGfzLe+y0kHiyDpTEE+XKZrMGWjgOyv7tSduwd9TAPypxSn
 4hM/D3Myifu+gz8dNRutdTc76ovCJ0IuRKpnv7YEPyPQ3EcC3r7Tw6wVBQPhhAW/XlTd
 D9fDnPHgVtkvtKQ8YlHFNMdTSezpFzEz4b6upur6K8JBLndKJAQlMh9CrHo0GNxt82wp
 73Z53cmAhBIZCPbZfhyyjl2k8/sgfT1ZXnyYg27krS9yF4xRlx4n2xqo8jD4JQBrzMfE
 tw67qpe2fPv7WsYa4G0NL+g6ug+2SKpKOKjkRwa9cbLTnI/gXP9v71gO1ccwTqbVOv82 RQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q8xfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 21:37:01 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 18 Dec 2022 21:37:01 -0800
Received: from pek-hostel-deb01.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Sun, 18 Dec 2022 21:36:59 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc deprecation warning in downloadutils Warning appears as:
Date: Mon, 19 Dec 2022 13:36:18 +0800
Message-ID: <20221219053618.3558291-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PyiEz26CXULjfBDWjLl97vNO5tXZN9K3
X-Proofpoint-GUID: PyiEz26CXULjfBDWjLl97vNO5tXZN9K3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 05:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100089

tests/test_downloadutils.py::test_stream_response_to_specific_filename
  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated, and in 3.8 it will stop working
    if path and isinstance(getattr(path, 'write', None), collections.Callable):

Upstream-Status: Backport [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...abc-deprecation-warning-in-downloadu.patch | 41 +++++++++++++++++++
 .../python/python3-requests-toolbelt_0.9.1.bb |  5 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
new file mode 100644
index 000000000..baa833b6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
@@ -0,0 +1,41 @@
+From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
+From: Jon Dufresne <jon.dufresne@gmail.com>
+Date: Fri, 1 Feb 2019 16:30:01 -0800
+Subject: [PATCH] Fix collections.abc deprecation warning in downloadutils
+
+Warning appears as:
+
+tests/test_downloadutils.py::test_stream_response_to_specific_filename
+  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated, and in 3.8 it will stop working
+    if path and isinstance(getattr(path, 'write', None), collections.Callable):
+
+Upstream-Status: Backport [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ requests_toolbelt/downloadutils/stream.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/requests_toolbelt/downloadutils/stream.py b/requests_toolbelt/downloadutils/stream.py
+index eed60a7..1d1c31b 100644
+--- a/requests_toolbelt/downloadutils/stream.py
++++ b/requests_toolbelt/downloadutils/stream.py
+@@ -1,6 +1,5 @@
+ # -*- coding: utf-8 -*-
+ """Utilities for dealing with streamed requests."""
+-import collections
+ import os.path
+ import re
+ 
+@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=None, chunksize=_DEFAULT_CHUNKSIZE):
+     pre_opened = False
+     fd = None
+     filename = None
+-    if path and isinstance(getattr(path, 'write', None), collections.Callable):
++    if path and callable(getattr(path, 'write', None)):
+         pre_opened = True
+         fd = path
+         filename = getattr(fd, 'name', None)
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
index 366f41ca8..72ad7a618 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -6,7 +6,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
 
 SRC_URI = "file://run-ptest \
-          "
+           file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch \
+           "
 
 SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
 SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
@@ -31,4 +32,4 @@ do_install_ptest() {
 	# remove test test_multipart_encoder.py as it fails,
 	# downloaded file is not supported
 	rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
-}
+} 
-- 
2.25.1


