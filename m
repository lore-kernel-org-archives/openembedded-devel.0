Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72668C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:05:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9634.1670580306807334305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 02:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9342dfa444=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B98kp1M016014
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Dec 2022 02:05:06 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqw33a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 02:05:06 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 9 Dec 2022 02:05:05 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 9 Dec 2022 02:05:05 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] xf86-video-amdgpu: add opengl to REQUIRED_DISTRO_FEATURES
Date: Fri, 9 Dec 2022 18:05:03 +0800
Message-ID: <20221209100504.660239-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VoypyjcObmxMn1XAu4DMIxUenZ7omVHX
X-Proofpoint-GUID: VoypyjcObmxMn1XAu4DMIxUenZ7omVHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 10:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100004

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below yocto compliance issue:
  ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/libc
  virtual/libomxil
  virtual/libusb0
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-video-amdgpu', 'virtual/libgbm']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
index 94e2ea43e..3082e2e6b 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] = "bc47a1a8854e790270fa5de2fb9dfe8558139b03d8f68ac1057dcd235d
 XORG_DRIVER_COMPRESSOR = ".tar.gz"
 DEPENDS += "virtual/libx11 libdrm virtual/libgbm xorgproto"
 
+REQUIRED_DISTRO_FEATURES += "opengl"
+
 PACKAGECONFIG ??= "udev glamor"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor"
-- 
2.25.1


