Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565A7C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 09:45:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.77915.1753695939400314222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 02:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fRpZNdEU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rRqV010591
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 09:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gS3wRWf9umOG5016ZgDAfh
	HX9hGkxnIXgDjTfkEUjy0=; b=fRpZNdEUMxNMlCYRfstsj02wROeS9RugQalN/c
	xnqlc4PlF7gera8hMQg16iqkpgVG1uPyK8wADRCg/lLYQPNJt2BDcUEUGDzu3kuM
	5T0Dvc3+cJQQ1Y42wvSCm8iueCOkhBiAfXEPX8jMcTHoGmmyDnUXGSgclfwjGi0L
	1McwbpIibdPS8x6NJQGgjwyv6JUKeRVhb0hmsaK1LJj01aG3bnyQa5wqekxEZB6q
	y3mtegFAvaC7ESynyx6VX1HH5dvBcOMy1Py+sflRBqoaCSh9G7G82rw2geXb80I5
	5tQV6y5gAQ/aup1ZiJWRgM9PabcZCsbjbAGOWMGPBwLT7zsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xm1qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 09:45:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56S9jbR8017450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 09:45:37 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 28 Jul 2025 02:45:35 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [meta-oe][PATCH] opencv: install test and sample binaries under bin/opencv
Date: Mon, 28 Jul 2025 15:15:18 +0530
Message-ID: <20250728094518.1636494-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=688746c2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=s84kAb1i70EL4LgKGkgA:9
X-Proofpoint-ORIG-GUID: MAeRfp6zjXetwEthyTzRNj3MaUNqQdoj
X-Proofpoint-GUID: MAeRfp6zjXetwEthyTzRNj3MaUNqQdoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3MSBTYWx0ZWRfX1LnVajBehiQi
 EzHAdHB/hC5cdh3vLt1j6k9VFIG/zFGdhgkLSpRDt6LN/TVZ9sWEacfpZAJvm+uWm+LupKR3ema
 ROpj4C/z+Tg8hU65zHAdXm7wYeHd5I4/hWcuUpQzvVvy180RL3UkSCE/FfSf+SXd6SIvj7SNYPQ
 ioDmyPRLGUCAnXglitLfMrPUY28AWnteXUqY8El2bC2oJbE11Fph48JXgdvuGqquF+MbqkNJZKA
 tIsJ5RcaHSYCawoXx31SFq7NERkuNfDTSj3Z3JcdkExAcO1VRubYY3l0uoHEp0No0uQwutq3VnD
 0KMUOJK+5fQduTnNzAmouGrZbJTZ3cfpfbtCsxCc9IvB/33gMjje98cXtJeBI5CWKMTUqBSwBv/
 OzSLBwDt5MrUa8aCeiw6bzFYkAZxVUGb3FQ77VCBVfsYwbDfFFFEbWV7ckVwnhTA1TYRDB9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=588
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 09:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118745

The test and sample binaries were not getting installed.
Install them under "<prefix>/bin/opencv". Installing
binaries under "<prefix>/bin/opencv" avoids conflict with
/usr/bin/shape file contributed to rootfs by mesa-demos
package.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index d8295912fa..4118e96fc5 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -75,6 +75,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
+    -DOPENCV_BIN_INSTALL_PATH=bin/opencv \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41,SSE42", "", d)} \
@@ -113,9 +114,9 @@ PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-infer
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
-- 
2.34.1


