Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB07C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 11:18:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.10415.1663672735113866903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=be59sTXS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6262b0a03a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28KAaCo7031873
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:18:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=hokfQp/KtPHO89gDSF4KHBFKzP8WGBVOPx6JW0Va6Dc=;
 b=be59sTXSVlqGXrd4Yd7BLxV/2wU/PbWC2Wjwl70iklM0rRE4n0cyhI9gIGLOhKd5WHv9
 nLWDw9xcxuHUVk7OIt9EXirB0ZEsg17cBFG3zCXXaTSfG70mLPtvSs9pEuNiSmp53t0D
 q84U823A+zInCZe8tiXGCn6dw11HwAuzz2jP8/5WU/UER1uEUd7kCAXGLR4d0USb9Zyv
 RXovIBg3b2GnXMyBWS2a0DKPTzjyjHwxTl0HhNKjYnajTU03UNHmg++N3LNzJmRSh3F7
 kJILw/f1n1AnmstV0VDOeL1Gcum+n7JEJDd+NDuKcmakXYu7CRozL/R7gA7A2BBj8fpG vA==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn9h3ta8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:18:54 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 20 Sep 2022 04:18:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 20 Sep 2022 04:18:53 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 20 Sep 2022 04:18:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH V2] python3-h5py: fix wrong file driver version
Date: Tue, 20 Sep 2022 19:18:52 +0800
Message-ID: <20220920111852.3597624-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <17168B304E0C4C80.10707@lists.openembedded.org>
References: <17168B304E0C4C80.10707@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D2RR845MCHHTJbt_GOG4-yv_mwVkpn0b
X-Proofpoint-ORIG-GUID: D2RR845MCHHTJbt_GOG4-yv_mwVkpn0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 11:18:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98904

Due to commit [1] applied in hdf5 (1.13.2), import hdf5 failed

|>>> import h5py
|Traceback (most recent call last):
|  File "<stdin>", line 1, in <module>
|  File "/usr/lib/python3.10/site-packages/h5py/__init__.py", line 56, in <module>
|    from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s, h5t, h5p, h5z, h5pl
|  File "h5py/h5fd.pyx", line 220, in init h5py.h5fd
|RuntimeError: Wrong file driver version # (wrong file driver version #)

Initial driver version to fix the error

[1] https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2e108f9463e

Issue: LINUXEXEC-22810
(LOCAL REV: NOT UPSTREAM) -- send to oe-devel on 20220920

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-wrong-file-driver-version.patch  | 53 +++++++++++++++++++
 .../python/python3-h5py_3.7.0.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch
new file mode 100644
index 000000000..2692acde7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch
@@ -0,0 +1,53 @@
+From 5b0b1d0b941ba338d449f9261bdf4cb2b679d048 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 20 Sep 2022 02:53:11 -0700
+Subject: [PATCH] fix wrong file driver version
+
+Due to commit [1] applied in hdf5 (1.13.2), import hdf5 failed
+
+|>>> import h5py
+|Traceback (most recent call last):
+|  File "<stdin>", line 1, in <module>
+|  File "/usr/lib/python3.10/site-packages/h5py/__init__.py", line 56, in <module>
+|    from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s, h5t, h5p, h5z, h5pl
+|  File "h5py/h5fd.pyx", line 220, in init h5py.h5fd
+|RuntimeError: Wrong file driver version # (wrong file driver version #)
+
+Initial driver version to fix the error
+
+[1] https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2e108f9463e
+
+Upstream-Status: Submitted  [https://github.com/h5py/h5py/pull/2153]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ h5py/api_types_hdf5.pxd | 1 +
+ h5py/h5fd.pyx           | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/h5py/api_types_hdf5.pxd b/h5py/api_types_hdf5.pxd
+index 6977f1a7..312fdaa0 100644
+--- a/h5py/api_types_hdf5.pxd
++++ b/h5py/api_types_hdf5.pxd
+@@ -237,6 +237,7 @@ cdef extern from "hdf5.h":
+ 
+   # Class information for each file driver
+   ctypedef struct H5FD_class_t:
++    unsigned version;
+     const char *name
+     haddr_t maxaddr
+     H5F_close_degree_t fc_degree
+diff --git a/h5py/h5fd.pyx b/h5py/h5fd.pyx
+index 04aff077..d41953d0 100644
+--- a/h5py/h5fd.pyx
++++ b/h5py/h5fd.pyx
+@@ -191,6 +191,7 @@ cdef herr_t H5FD_fileobj_flush(H5FD_fileobj_t *f, hid_t dxpl, hbool_t closing) e
+ cdef H5FD_class_t info
+ memset(&info, 0, sizeof(info))
+ 
++info.version = 0x01
+ info.name = 'fileobj'
+ info.maxaddr = libc.stdint.SIZE_MAX - 1
+ info.fc_degree = H5F_CLOSE_WEAK
+-- 
+2.37.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
index 07128bb03..ce4f05dbe 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "3fcf37884383c5da64846ab510190720027dca0768def34dd8dcb659db
 
 SRC_URI:append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
+           file://0001-fix-wrong-file-driver-version.patch \
           "
 
 inherit pkgconfig pypi setuptools3
-- 
2.27.0


