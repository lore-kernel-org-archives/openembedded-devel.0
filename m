Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B3EC4167B
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4642.1668069390791703059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bkL+HzG4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7cCsm030330
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=Zu3gzjjYLd4zLL9/aZPnyAqVIKZ9UF3d/7LR6HQ55SI=;
 b=bkL+HzG4X8lECOUb0ELJK/2h2LJwn8s8t9yjpp+acAK+4yXFq5y4ztZmjRDhwn25574l
 3IQgjJr/t/7zidlclHstxmoL5kotTXrV+zfAQvEOIb4/OLmpJhtAHJzeMk7neIdfBImQ
 Z+JgU96HpwGVAbmB7QhP1bXYn4BCVV/KGuuZFZASAsIl2ufJ7m8+YJUytLaFSKt1dwSE
 1Cbqrm5XEZKga3eFFTgv0mRYY22qieWcP2NEmyZFXU5tQFr9OsMUwbHk5A6CQajaMjtR
 qw5dlJT4HzVUf6eTu6VSk7bMSGf9tzu77gKtq/FSJxOmZ2tDPaizUmgzIMbJsEUt+JnO Eg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:29 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:36:28 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:27 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 02/14] waylandpp: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:13 +0800
Message-ID: <20221110083625.840996-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: O-xQ8GwAP10vSEpFSd_h8BpQnQL4rqyL
X-Proofpoint-ORIG-GUID: O-xQ8GwAP10vSEpFSd_h8BpQnQL4rqyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=668 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99519

From: Mingli Yu <mingli.yu@windriver.com>

waylandpp needs virtual/libgles2 which is available when opengl
is enabled in mesa recipe, so also add the check for waylandpp.

Fixes:
  ERROR: Nothing PROVIDES 'virtual/libgles2' (but /build/layers/meta-openembedded/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb DEPENDS on or otherwise requires it). Close matches:
    virtual/imlib2
    virtual/libc
    virtual/libsdl2
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'waylandpp', 'virtual/libgles2']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
index f075f2a3a..0deed332c 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
@@ -10,7 +10,9 @@ DEPENDS:append:class-target = " waylandpp-native wayland virtual/egl virtual/lib
 S = "${WORKDIR}/git"
 SRCREV = "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OECMAKE:class-native = " \
 	-DBUILD_SCANNER=ON \
-- 
2.25.1


