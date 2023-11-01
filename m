Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D98C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 07:07:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1489.1698822450082080439
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 00:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OXixLBTB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9669bac9c4=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A16ilXj015477;
	Wed, 1 Nov 2023 07:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=NLE7N
	EjfQx3ka+Eb1ddcNe+6GpHqnu8M465jJFq2wwk=; b=OXixLBTBYChDw5zk7A9m7
	QYFffUnrs8rBQmfvZIs3ScWxQ5OlrGG630RZ/Zip1IIBTIt321qFyVByX/KYjGYw
	17VdNScDNZ8eoYTMbx4W3TwlctV0A5tLqBLVgMwQ49PkErZmdJHATV8P5ZrIr1r0
	8KPYrxkoXKtdNgHUnCAefBijVuiJ067Yukg6NLQWwBG0D+5QPHI+2mJBYi5y5Q99
	U2I8t8bt0NsFkebbTz9CQyoHYm/Go2S6bIfT+BiZUUjU2myMIKmSckrtjQ1zGRCX
	a+zm2WhxBECpecvhBy0zlZdqGJ8ysz74OVn7WmzwmpIiy9UJ76ewx0ZYpFNnLzPf
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s96cjsb-18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 01 Nov 2023 07:07:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 00:07:29 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 00:07:29 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-nacl: drop duplicate recipe
Date: Wed, 1 Nov 2023 15:07:22 +0800
Message-ID: <20231101070722.2549598-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ma1pAEt_E29LVW42fXeXvSL__OKZ8LN4
X-Proofpoint-GUID: ma1pAEt_E29LVW42fXeXvSL__OKZ8LN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_04,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311010059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 07:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105814

From: Kai Kang <kai.kang@windriver.com>

Recipes python3-nacl and python3-pynacl are exactly the same reipces for
python packge "PyNaCl", so drop the latter one python3-nacl_1.5.0.bb.

And let python3-pynacl rprovides python3-nacl in case it is required by
other recipes. Ajust the order in python3-pynacl as well accord to

https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html#recipe-ordering

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python/python3-nacl_1.5.0.bb              | 25 -------------------
 .../python/python3-pynacl_1.5.0.bb            | 22 ++++++++--------
 2 files changed, 12 insertions(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
deleted file mode 100644
index 7d5292745..000000000
--- a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
-HOMEPAGE = "https://github.com/pyca/pynacl"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
-
-PYPI_PACKAGE = "PyNaCl"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
-
-DEPENDS += "\
-    libsodium \
-    python3-cffi-native \
-    python3-pip-native \
-"
-
-RDEPENDS:${PN}:class-target += " \
-    python3-cffi \
-    python3-pycparser \
-"
-
-export SODIUM_INSTALL = "system"
-
-BBCLASSEXTEND = "native"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index 5a8ed131a..0747c67c1 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -10,21 +10,11 @@ PYPI_PACKAGE = "PyNaCl"
 
 inherit pypi python_setuptools_build_meta
 
-# in meta-virtualization layer
-#
-RCONFLICTS:${PN} = "python3-nacl"
-
 DEPENDS += "\
     ${PYTHON_PN}-cffi-native \
     libsodium \
 "
 
-RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-cffi \
-    libsodium \
-"
-
 do_compile:prepend() {
     export SODIUM_INSTALL=system
 }
@@ -32,3 +22,15 @@ do_compile:prepend() {
 do_install:prepend() {
     export SODIUM_INSTALL=system
 }
+
+RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-cffi \
+    libsodium \
+"
+
+RPROVIDES:${PN} = "python3-nacl"
+
+# in meta-virtualization layer
+#
+RCONFLICTS:${PN} = "python3-nacl"
-- 
2.34.1


