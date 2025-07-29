Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A512BC83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 06:46:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1485.1753771587843023927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 23:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iBRz9Mya;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLh1tH023606
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Pcb111J8kAk1B2i4uTNf87S4SI0QekjJpUELiBUdGM=; b=iBRz9Myai++3g04z
	eMOyoUq0M/N4HgoIRdn/cckk1WCJwHna+C7K0vmNjntyU1MvMf4U7HCuN1iXOsDK
	uS9msk/NE828nKcSBYwRbHjl/cq+4DlQwVamoGUqiwXHCs6gJL0ygbQIVfmcoWqC
	3ImTaCvb4gU26IBggP4VWUlwN6nYs2HDV0ANbk81R+QSbkZjiQjCjVwzs3aGxHhH
	dLZhtqsBWmfVzwnjJ5JVSm11kt3phLVZ0Vu0ZOzJ0ONJRrXqeRQynJlkICkvz4mJ
	74dS2jSUIFyYRHPPx2aVMZhOlxDg5O6POEQLPgRYX3fNYpicaDvPIy/JXgzOJSo3
	IjbY6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qq13n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:46:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56T6kQFF025433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:46:26 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 28 Jul 2025 23:46:25 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [meta-oe][PATCH v2] opencv: install test and sample binaries, rename /usr/bin/shape
Date: Tue, 29 Jul 2025 12:16:05 +0530
Message-ID: <20250729064605.3045541-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728094157.1636360-1-kraghava@qti.qualcomm.com>
References: <20250728094157.1636360-1-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0OSBTYWx0ZWRfXwyTPkQARexBq
 uqW8l/zLHgj3ieUGtTxGaET2AS3rqz8s34AHOF24ZpPWogXsL088SvcrxgbHUSX8dMczPyVcaEt
 IqvUvlcAtKC3k++dzD4z3jqRjk50l/ws1u243XCGyLgR7hh+6HVZ5QKskfJCmCUj9ps2YCHzAAY
 sg0Sv2ju4HawpoF0DbfdjekB+8Kk99u3LUz/8LEX7mcyD134jX2DRl3d7C4fsY6iBjbgPotb7DA
 AefiZgJ4jn8V+pC5W9arBhAH+22c8XfskN/ly+gyqvezyU81BGXEke02b783xmvTfE1hhLT08Fm
 fo4yMl5e+zdZb822xXvA4yCw3OQIBFNvcJRBcp1HD8bIRsYAEPa7VoV1pVebQphcERJGS5CGyI0
 +7Q0bRkD3cn1VSLCZVvJ3URZ7hZV++4UumEVklRj2BCqv58nLOozZyP+ddkRJzfmtFpuzIbA
X-Proofpoint-ORIG-GUID: yKBMenLUdK-yOLOfmlOXAYk03JCRzpMd
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68886e43 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=C-ofU-Qf8M2prCgkPqAA:9
X-Proofpoint-GUID: yKBMenLUdK-yOLOfmlOXAYk03JCRzpMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=666 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118754

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


