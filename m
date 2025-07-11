Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06036C83F20
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 07:41:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8401.1752219687816470730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 00:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9287046cd5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5UFF3009421
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 07:41:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19p82b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 07:41:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 00:40:54 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 00:40:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] opencv: use CPU_DISPATCH to instead of ENABLE_XXX
Date: Fri, 11 Jul 2025 15:41:22 +0800
Message-ID: <20250711074123.4123453-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4mEPCfmyYbfZKFCS__YmSSJUffSAN-oH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX1RIc7rWk0pgd JxN8HPl32qoGx8ByqPKgAWpRZN8k0JoEFsAGjaVKFlm+2/jt96yPu2zWq+TJta6zal7SO+ABHOk Fktm/C/J09p/LQ7T/9L3TQnYMmX435ATB1aExHbxmUwkveck8QOgIfS6oSEX2H+EwAyZfEkcCPC
 ssddzvv549nG3jSPXq7Ub2sroxVE2tT/Cg3LkJnNggAU5ChQLOlPn7tIY2HPsiEfmUeyay0tfK2 nTt/LoiGkejWf0LqZqC1HzMc7MyHRXsgqsT592mUQG7hD46xnu3kTlm6sUoHoO6eWSOw45c49ZV oFFkKkuaMt8lcQmINSjn1PEAnPYFZjX/tC7I8f3ZCXxns26lfEHHyaghWzeyexv2KVyGwO9RSRY 34rv8EFw
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=6870c026 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=XH0LBambRuV7qhanhc8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4mEPCfmyYbfZKFCS__YmSSJUffSAN-oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 07:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118432

$ bitbake opencv
$ vim tmp/work/core2-64-wrs-linux/opencv/4.11.0/temp/log.do_configure
...
-- WARNING: Option ENABLE_SSE='1' is deprecated and should not be used anymore
--          Behaviour of this option is not backward compatible
--          Refer to 'CPU_BASELINE'/'CPU_DISPATCH' CMake options documentation
-- WARNING: Option ENABLE_SSE2='1' is deprecated and should not be used anymore
--          Behaviour of this option is not backward compatible
--          Refer to 'CPU_BASELINE'/'CPU_DISPATCH' CMake options documentation
-- WARNING: Option ENABLE_SSE3='1' is deprecated and should not be used anymore
--          Behaviour of this option is not backward compatible
--          Refer to 'CPU_BASELINE'/'CPU_DISPATCH' CMake options documentation
-- WARNING: Option ENABLE_SSSE3='1' is deprecated and should not be used anymore
--          Behaviour of this option is not backward compatible
--          Refer to 'CPU_BASELINE'/'CPU_DISPATCH' CMake options documentation
...

According to [1], flags ENABLE_AVX/ENABLE_AVX2/ENABLE_POPCNT/etc should not be used
anymore. Use options CPU_DISPATCH instead.

[1] https://github.com/opencv/opencv/wiki/CPU-optimizations-build-options#customizing-cmake-options

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 826eff30ca..0ce47ddf82 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -78,9 +78,9 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41,SSE42", "", d)} \
 "
 LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
-- 
2.34.1


