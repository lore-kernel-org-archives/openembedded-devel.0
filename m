Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DC4C77B7C
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:56:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48592.1681718182995262794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NOe5EBxK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3471b6e0c9=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H4cMDd012997
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=q9ADMzfMZk27dwgTK8VAHks2M/mBfDH/xrIG0phBquk=;
 b=NOe5EBxKNb353pux1SgtjrA0tXHQgM6zkN3VytPO0uBce6+IC8faV4sLXrFAKjtbVFyS
 DWH/esvBsdn2Z4mgggFm3JegX/KzIWGBY1745z07uXhcfKQacGvSeWrQ/Adw3iopnmCd
 sxwgr3vDTxCM6zwgVeOIuwmhAQZME8Pq5th7a4nKshE1OP5fhOimnr8cxAEJ8H2uF8wU
 ZuzbZXKiN/ye5gCkvltjnGFq3TR/dHZKx5MZpYH2aSrDWsrcK3gfR/VNw3UCCBSpjdRD
 2VVlT44oAuqqaYLiY/or3V6w3THh52LJi0EDiZn2kNink68NDOxPMAYa2aNB77eanokb yw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyh53jfjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:22 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 00:56:20 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 00:56:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/4] thunar-archive-plugin: 0.5.0 -> 0.5.1
Date: Mon, 17 Apr 2023 15:56:14 +0800
Message-ID: <20230417075617.35121-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: FRTJk-ClBZbluPnf2lXRz2LT7AsI9Xj8
X-Proofpoint-ORIG-GUID: FRTJk-ClBZbluPnf2lXRz2LT7AsI9Xj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=2 mlxlogscore=727
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102123

From: Kai Kang <kai.kang@windriver.com>

Release notes for 0.5.1
=======================
Bugfix and translation release

Fixes:
- Fix use-after-free crash in "tap_provider_child_watch_destroy"
- build: Add GLib requirement
- build: Fix autotools warnings
- Use generic package icon name in dialog header

Translation Updates:
  English (Canada), Greek, Persian (Iran), Russian

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...r-archive-plugin_0.5.0.bb => thunar-archive-plugin_0.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.5.0.bb => thunar-archive-plugin_0.5.1.bb} (82%)

diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.1.bb
similarity index 82%
rename from meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.0.bb
rename to meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.1.bb
index c2c4b9fa5..044a39a3c 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 
 inherit thunar-plugin
 
-SRC_URI[sha256sum] = "8eca88a358282a5acdea72984db0d930efdf658b4bc5b82ef7bcd06224366ffa"
+SRC_URI[sha256sum] = "a81b3ab1d3cd77c7b3d6db15b37a3c12d65b06e373edc3c21083f02d605d8bed"
 
 # install tap files in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
-- 
2.17.1


