Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9360C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 13:13:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.204786.1672319581427727090
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Dec 2022 05:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eIz1H3G3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0362fa9fb2=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BTDCHbO029366
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 05:13:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=OfPQr7euT5Wb0P8J7C4vF50Syx6Y3yACulZaOpgzg1I=;
 b=eIz1H3G3XV5CQ0lp1GpWOpwtc1rIuSCfwOpHO/m683fYicUoaDLAnYmlmTltDx095x7d
 ZYc/FU6Y4D98YQqXV8XTFk/Q/POfYywRetLYR/TKPTl7zC9yieDXba3p0uo/tN7szV9Q
 RxfEOA7UKbtl/gb6oUuIvYyVsnPWoegQBVYck5t0mWWxG9JGDZvSKkr2hTHMqC7opdEI
 vKFcbJyvIvg0m+5kAkXHT+O5K33nUQR+VGfEFuajdhCt4wIfbPVKmP5NW4O7J5/sDkYL
 gBUo02IH8Lxqcp0DbJ0cfUonHlVLm8NIQUNfZHAveTK75MtP0M+b30zR4ab37eSU7AjK Ng== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trjrm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 05:13:00 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 29 Dec 2022 05:12:58 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 29 Dec 2022 05:12:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] xorg-lib: set XORG_EXT for recipes
Date: Thu, 29 Dec 2022 21:12:58 +0800
Message-ID: <20221229131258.29096-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: RGKrEy-9d7di_rN5yCGYiYAibTKqesOW
X-Proofpoint-ORIG-GUID: RGKrEy-9d7di_rN5yCGYiYAibTKqesOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_06,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=655
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212290109
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 13:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100299

From: Kai Kang <kai.kang@windriver.com>

It sets default value of XORG_EXT with 'tar.xz' in xorg-lib-common.inc,
so set XORG_EXT with previous default value 'tar.bz2' to make recipes
work, including libxaw, libxkbui, libxpresent and liblbxutil.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb  | 2 ++
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb     | 5 +++--
 meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb    | 2 ++
 meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
index 58b4f31b1..ce064903b 100644
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
@@ -7,6 +7,8 @@ DEPENDS += " xorgproto zlib"
 PE = "1"
 PR = "r11"
 
+XORG_EXT = "tar.bz2"
+
 SRC_URI += "file://mkg3states-1.1.patch \
             file://0001-lbx_zlib-Mark-declration-with-extern.patch \
            "
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
index 08d9b232e..4a909848a 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
 
+XORG_PN = "libXaw"
+XORG_EXT = "tar.bz2"
+
 SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
 SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
 
@@ -23,5 +26,3 @@ FILES:libxaw8 = "${libdir}/libXaw8.so.8*"
 
 # Avoid dependency on libxaw as it is not build
 RDEPENDS:${PN}-dev = ""
-
-XORG_PN = "libXaw"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb b/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
index 103da1f08..e7c9b64e8 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
@@ -6,5 +6,7 @@ DEPENDS += "virtual/libx11 libxt libxkbfile"
 PE = "1"
 PR = "r10"
 
+XORG_EXT = "tar.bz2"
+
 SRC_URI[md5sum] = "1143e456f7429e18e88f2eadb2f2b6b1"
 SRC_URI[sha256sum] = "20c23101d63234ee5f6d696dfa069b29c6c58e39eff433bcd7705b50b3ffa214"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
index 2a59a80e4..3b15153b6 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
@@ -4,6 +4,8 @@ DEPENDS += "xorgproto libxfixes libxrandr"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
 
+XORG_EXT = "tar.bz2"
+
 SRC_URI = "http://xorg.freedesktop.org/archive/individual/lib/libXpresent-${PV}.tar.xz"
 SRC_URI[sha256sum] = "b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b"
 
-- 
2.17.1


