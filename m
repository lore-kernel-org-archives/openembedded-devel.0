Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD48BC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 06:57:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1595.1753772224859959232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 23:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h3IMGAWf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T02447017653
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Pcb111J8kAk1B2i4uTNf87S4SI0QekjJpUELiBUdGM=; b=h3IMGAWfaFI0cF/T
	HkzAXkJwNNLtBscpKmP1cRaONI8bNjx965K3P2uTvrk8jBGshkIgkXbhmJXB8KFZ
	hLy+o5vNxLhDLZqmAzz/xXEQlOUSeQ1wBXlHi5WraGfR/unXnRbgCE+527kvG0Gr
	CNVxvmfFr//qv4sMu7t/guW3XEE6fJ+7mCq17lF2lnq04wIoUqNgjWs6llajH8fS
	6jiiR9BTk8sa0bxb1mEHoEV+LkKipTLS3QpWEDDTq1O2R8m0e7GgPCEjBRm/ikh7
	YuijeTXdEdYZQbgnOIFGB2LrcXbhc+C02qqWPXBeJojzRoEgEZVJOa4GpVo6LCZY
	un6rSw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2f194-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:57:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56T6up4l010851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:56:51 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 28 Jul 2025 23:56:50 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [meta-oe][PATCH v2] opencv: install test and sample binaries, rename /usr/bin/shape
Date: Tue, 29 Jul 2025 12:26:34 +0530
Message-ID: <20250729065634.3055856-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728094518.1636494-1-kraghava@qti.qualcomm.com>
References: <20250728094518.1636494-1-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rnsWR6SDDjaUAdiVIuCWEFDuOQlQq317
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA1MiBTYWx0ZWRfX43FN1XRxN3+G
 QHecZbrXWAuRyWMUR/tV5ipb4i4EtvReASUuWR7bnP8SSsLDrp3b3afKbfX8Ij4PPKnj9KKGVpL
 /b3sg5CuWH2IUE3xzGIBeKzsmdgZhpQz2V9svoKwRtqceR363jb4J4pS7qLsCMdY5CNl2Aex6kW
 DAqfj81M8m4xspKgBQOgcr48OxuVI6Lg1LN94yR5RTEBHqNUo0Bt04CDNuOehPBYn27huZVtHOx
 uaex+ISIoBuBX90KuNLQbFbeaAu1YuK54oSxp3zPbCTz/MaNTzKoSMAtDOCAmiLYmtgi3NoKAhI
 933TTb3T2oUpifZm7qRXB1ph3+b+hJPqi1kxxeEWpde8JHnLwGJUhw89sXGmpH4AQfe/7b+77/c
 SczcnBTnW+9Mv17zwD56ddj86IhhlR43qQAQrHfcvYm4+BBOSUO/qjv2Wc4UzqlQDocObve2
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688870bf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=C-ofU-Qf8M2prCgkPqAA:9
X-Proofpoint-ORIG-GUID: rnsWR6SDDjaUAdiVIuCWEFDuOQlQq317
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=666 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118755

Install the test and sample binaries. Rename "/usr/bin/shape"
directory to "/usr/bin/opencv_shape". This avoids conflict
with "/usr/bin/shape" file installed by mesa-demos.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index d8295912fa..8652baa0e9 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -113,9 +113,9 @@ PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-infer
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
-PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
+PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_BIN_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
-PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
+PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
@@ -213,4 +213,6 @@ do_install:append() {
             sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules/core/$fn
         fi
     done
+
+    mv ${D}/usr/bin/shape ${D}/usr/bin/opencv_shape
 }
-- 
2.34.1


