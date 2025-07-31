Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2360CC87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 06:53:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.55641.1753944835947959899
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 23:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=W+Ob87EG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fRuq031818
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 06:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=69yRM/escF2u/AaLoSJxDO
	b9NYsNKgQ1vMcfkPzk78Q=; b=W+Ob87EG3+NMs40NvTa0ehFr7UngJ7wydrnyvV
	LWuvbm1ed7Rcsj7EV8CZKAj28sLR246Twx1kruHSlj6k1MCl3Cv89HHD95hAe48b
	yR7YPuJ2bT2vYOMseeZ9ozmPaoaO8zKPIcVH+9PrM48bpaIkZxWh1S4UY9g+GRlV
	PoEGvIjRZp98mBx8xW+rOAA4bI13+hhpXq5UUSLoJo/lcjopdQDOkHqZX+Qp2W4l
	XFKSNBcc77KrXi2x+UwE7ZquZEqB3n/sfqQxG+ganonvDOV/ziJNSU7BeeYNKOOi
	eDgQ3gBhx4FIeHPeiZn1d25uqsEFWfp9MBiBKqIKER30uDuw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xm4tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 06:53:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56V6rsBw021295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 06:53:54 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 23:53:53 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [meta-oe][PATCH v3] opencv: install test and sample binaries, rename /usr/bin/shape
Date: Thu, 31 Jul 2025 12:23:34 +0530
Message-ID: <20250731065334.915413-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA0NiBTYWx0ZWRfXwnzHDX4P8hsr
 DY7jFXTI7mIQwSHjq/noIc6975Kjs7sxoax3Cz7PxCp6yKCP+LDooBDvemTRUs/wooNt0icpKcQ
 h9RTe5TxrSsum/+65rgmVxv5RZSfsANMNvx8/2ANaM0qyZ5WdhjlRwHqmugDAYTWqOE0aaGVWQt
 DBZDh4IBLE9SIWInjS66A6yuJNkBxLfmjdIH+YrcGsrj6jEPvBKgv2QNiXv+OBch5II6iXH5tdp
 oT5B45HmfB7FQMqDvjtWh1PGmzHcZquaJTVKAyVja1PT2Q6dVFHIXVLgbDp9Ocqap6+D94qpGra
 kdUxNK6EMnV1rPfJxzJCxfCbv9OiDiptJHHve8Rft2XXO2bfOiAFfnQohE/ox0N+RewfcA7gi1L
 fiiqUsJEAvEJZVoD5Qogac2CAk+onVrddpaIeSfvrYWOzus3MxlhtPQlQSJXLkZz73urDsmO
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688b1303 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=6I0ZPDnRgnCDHxwlYZkA:9
X-Proofpoint-ORIG-GUID: 6lfFi-1NdXdUDJD-gXB1BnPh8GVL2DlV
X-Proofpoint-GUID: 6lfFi-1NdXdUDJD-gXB1BnPh8GVL2DlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=582 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 06:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118814

Install the test and sample binaries. Rename "/usr/bin/shape"
directory to "/usr/bin/opencv_shape". This avoids conflict
with "/usr/bin/shape" file installed by mesa-demos.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index d8295912fa..700d68e555 100644
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
@@ -213,4 +213,8 @@ do_install:append() {
             sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules/core/$fn
         fi
     done
+
+    # rename shape dir to avoid rootfs conflict with
+    # mesa-demos /usr/bin/shape file.
+    mv ${D}/${bindir}/shape ${D}/usr/bin/opencv_shape
 }
-- 
2.34.1


