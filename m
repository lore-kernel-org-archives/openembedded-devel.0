Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8974EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 06:54:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52898.1694415244584779022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 23:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CpL/MXXJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76188869a3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38B6FmJP028933
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 06:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=bMgth
	hRf/FwwdD/G4zWR7uAzFksi/TreTVg0zz8VDVY=; b=CpL/MXXJKCCqCLtucYLZH
	LrwZmAq63cwYyJxBsg7r6xFRzfFyNKc07DdbvBxZKjU7UBZ/pxh2J/t/4eE/6M6o
	vXAkV5KEUXDJokk2vaEvsOaEEvoJZTHjUl6fAyUVqmhoQJaRdfbDLi2Doka2x5jy
	9MKUjYxBh24ED5IzlbHeK68UqsxQatNFRrSDJd7n5B+UqZGxjWtK0P7/4VfcrcJb
	5d6ahUDkPea2PDk04S1dfmG/h+UQK8ahcu6/durZVh4T9gR0MmZFB40YMfMqoY94
	oYT2tLyaTqWkL1OYlSQG2vaa5aMQKCHMPlhDG+dqTsD3Ak0R6xTP7f5i8bdY6Kc5
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0dwxsdds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 06:54:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 10 Sep 2023 23:54:01 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 10 Sep 2023 23:53:59 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH] hdf5: Fix CVE-2021-37501
Date: Mon, 11 Sep 2023 14:54:00 +0800
Message-ID: <20230911065400.2633164-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6Cq8NmXooxyR68Yyeo2mH1lDDnVaR83T
X-Proofpoint-GUID: 6Cq8NmXooxyR68Yyeo2mH1lDDnVaR83T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309110061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 06:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104834

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2021-37501.

[1] https://github.com/HDFGroup/hdf5/commit/b16ec83d4bd79f9ffaad85de16056419f3532887

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../hdf5/files/CVE-2021-37501.patch           | 37 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch b/meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch
new file mode 100644
index 000000000..01099f343
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch
@@ -0,0 +1,37 @@
+From 602015eacc53bf2699bf4c4e5420b63c3f067547 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 11 Sep 2023 14:01:37 +0800
+Subject: [PATCH] Check for overflow when calculating on-disk attribute data
+ size
+
+Bogus sizes in this test case causes the on-disk data size
+calculation in H5O_attr_decode() to overflow so that the
+calculated size becomes 0. This causes the read to overflow
+and h5dump to segfault.
+
+CVE: CVE-2021-37501
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/b16ec83d4bd79f9ffaad85de16056419f3532887]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/H5Oattr.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/H5Oattr.c b/src/H5Oattr.c
+index c2c0fe3..c289344 100644
+--- a/src/H5Oattr.c
++++ b/src/H5Oattr.c
+@@ -217,6 +217,9 @@ H5O_attr_decode(H5F_t *f, hid_t dxpl_id, H5O_t *open_oh, unsigned H5_ATTR_UNUSED
+ 
+     /* Compute the size of the data */
+     H5_CHECKED_ASSIGN(attr->shared->data_size, size_t, H5S_GET_EXTENT_NPOINTS(attr->shared->ds) * H5T_get_size(attr->shared->dt), hsize_t);
++    /* Check if multiplication has overflown */
++    if ((attr->shared->data_size / H5T_get_size(attr->shared->dt)) != H5S_GET_EXTENT_NPOINTS(attr->shared->ds))
++        HGOTO_ERROR(H5E_RESOURCE, H5E_OVERFLOW, NULL, "data size exceeds addressable range");
+ 
+     /* Go get the data */
+     if(attr->shared->data_size) {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
index 7b886a463..4110e9cea 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0001-cross-compiling-support.patch \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
+    file://CVE-2021-37501.patch \
 "
 SRC_URI[md5sum] = "2d2408f2a9dfb5c7b79998002e9a90e9"
 SRC_URI[sha256sum] = "e5b1b1dee44a64b795a91c3321ab7196d9e0871fe50d42969761794e3899f40d"
-- 
2.25.1


