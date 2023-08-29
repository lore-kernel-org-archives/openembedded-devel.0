Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA1AC83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 09:54:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13843.1693302882296733748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 02:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cDsG3EQT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7605aebdf3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37T9T8MK006116
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 09:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=vPpOe
	tE11syq0WaBk1yZl8yFZcYtdMwU1GvahWVSqqQ=; b=cDsG3EQTgCeYHznbaLfoH
	zz9UDL1rdmk5Eo6bqBwTl2rra0nA8bH0OpblzpdAJWd4sV/DAZenT3b4O57ePWFn
	88evvMIPhixmNWKYF18oM0AtLn+C+ySsQjYpmHxgqPR1TTO44plE7JEiimk7u7Rl
	H46dgzK1rxIOUjuLOqx+Ifq8FhyXT98gJOHltY5N1ENFVZU3TS9u0Qa5H4WnVMdM
	rte3v3wUM7eNOj09TfDRZdwc+cMhRtgaAw9WCaqKMON4g6R5ylxYtXfo4bfkZZ5E
	XZYRJITQDyGy1C1BWnftsjy8E6MRS7HqY24SwXupd9FEb61SxN4OlLqzIZrmEnWP
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c62gbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 09:54:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 02:54:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 02:54:39 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] thrift: Remove buildpaths
Date: Tue, 29 Aug 2023 17:54:38 +0800
Message-ID: <20230829095438.2747087-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Y6iSnOtgp33KRAkwDClNCuL2xPA4BRIS
X-Proofpoint-GUID: Y6iSnOtgp33KRAkwDClNCuL2xPA4BRIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_06,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=573 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 09:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104638

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File /usr/lib64/cmake/thrift/thriftnbTargets.cmake in package thrift-dev contains reference to TMPDIR
  File /usr/lib64/cmake/thrift/thrift_c_glibTargets.cmake in package thrift-dev contains reference to TMPDIR
  File /usr/lib64/cmake/thrift/thrift_c_glib_zlibTargets.cmake in package thrift-dev contains reference to TMPDIR [buildpaths]
  WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.hh in package thrift-src contains reference to TMPDIR
  File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.cc in package thrift-src contains reference to TMPDIR
  File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thriftl.cc in package thrift-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
index ea5a3972d..2809e24ad 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
@@ -35,6 +35,8 @@ EXTRA_OECMAKE = " \
     -DWITH_OPENSSL=ON \
     -DWITH_QT5=OFF \
     -DWITH_ZLIB=ON \
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
 "
 
 PACKAGECONFIG ??= "glib libevent"
@@ -46,6 +48,10 @@ PACKAGECONFIG[python] = "-DWITH_PYTHON=ON,-DWITH_PYTHON=OFF,python"
 
 do_install:append () {
     ln -sf thrift ${D}/${bindir}/thrift-compiler
+    # remove absolute paths
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/thrift/thriftnbTargets.cmake
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/thrift/thrift_c_glibTargets.cmake
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/thrift/thrift_c_glib_zlibTargets.cmake
 }
 
 LEAD_SONAME = "libthrift.so.${PV}"
-- 
2.25.1


