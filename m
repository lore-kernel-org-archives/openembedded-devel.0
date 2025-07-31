Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486C7C83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 07:04:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.55942.1753945488115578392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Jul 2025 00:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Dedgqzd6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1g2Co000346
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 07:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X3F+gIqGsLBBQajmRQy2am
	pkHOs0EatZRbwUSHNcW44=; b=Dedgqzd6leN630zKNHwj0RLYEms6muCvG2wJHm
	rqUtwZdY3TK/VdagEVzHpbdjxH9bSwGS/kCQlf2ZnACCwpgv9xpqp1V3cWYij7YU
	yP67Cx/dEJgyf2swS3CN/vjI4G7HLk5FW8nz0e3DFu3g3oaYh2/ALBYEgB4RqdCw
	jdtCTfXkl5o+o55/zRczrESCR55K2rCbUzmnp1eEpbrnvDQ3gNnL2A1b1iDhJNmn
	HwpKnf2k+ga0SPJOxY+jkW1OxgzrUAEBHI2GBZa/j/dQMiamzeJzP3y4dcDPvb+h
	WFqnMQu7XZvIdhALqTs1D4UWicv0qa1ZbArEoSHB1gVHUUGw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep4267-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 07:04:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56V74kxS022837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 07:04:46 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 31 Jul 2025 00:04:45 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [meta-oe]PATCH v4] opencv: install test and sample binaries, rename /usr/bin/shape
Date: Thu, 31 Jul 2025 12:34:26 +0530
Message-ID: <20250731070426.915767-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jwu509_dePYSY8prMKuP9nBJWTydW4xp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA0NiBTYWx0ZWRfXwzokVGdbS5fC
 HL+qjxLUnmfwPcK2pcKLjldtfAoIkqYezhIVHTEYzf1H1dYau+6GWiPWpIvpppkRrtye2IYQrd+
 T2/s45IGLGetQHCkZa809qcxA2W/eD+WoqTkqHSCkIDxBH0uzQvIQ70/tXxYBtNXsje0q9dT9Lc
 YOoyfs7lvz4mEmAcTFSG1QEofvru1loAg0T1SQdPMu4J4o6LQ2FrQe4ysb8mALyu9AfKXNFxMqr
 21+OW7V160pKBgyYQRFmnDPT/wH10YgZhuGgQ8szXz8uP/wHSb+R+x90I7j04e3Ruqi2dvLVoIz
 Cb/4vdSfNe44PBRds8F5nhsLuRI1V8i4mwfEBkSv3WSIAbMcNaxahxWvQWQmlhbrt2cs6XZTro3
 VDwqje/wG3sgX/cACq85NjvxBngF7iTRcCJntcyfq1W/ngyako7Zvxl8IF4DyZnj3/WpiDij
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688b158f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=6I0ZPDnRgnCDHxwlYZkA:9
X-Proofpoint-ORIG-GUID: Jwu509_dePYSY8prMKuP9nBJWTydW4xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=582
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 07:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118815

Install the test and sample binaries. Rename "/usr/bin/shape"
directory to "/usr/bin/opencv_shape". This avoids conflict
with "/usr/bin/shape" file installed by mesa-demos.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index d8295912fa..539190553d 100644
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
+    mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
 }
-- 
2.34.1


