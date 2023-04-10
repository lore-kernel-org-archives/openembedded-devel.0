Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C08BC77B70
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:17:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43660.1681132654219606889
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 06:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KU8DV9fB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3464c2a9ec=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ABiiwd018243
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 06:17:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=asBWap9d6KAIxuwGcygp0gFsF+eDMvD3MJRugdYWbnA=;
 b=KU8DV9fB8gwKnZtC89OZEYycPPMQ3qQY0IP/Bsn8m6/kUFgBBL4nmQDqOrMMNGLYbW2s
 Bch1Q+jaun76YKRZHkXxzPpYvN8YCCKnuv2eotvrTeeO4HPun0dVqHVDRNvgG1kEXwMC
 lDssYf8C5LFepXCGIocGj0dKBjhQy+jgeuH9H+U+FBikeWVyuDHayiXYNCzbrjw/o2Wp
 rJxkdhy95Gyqqi/6D1op/FqZQMb7w9Lwp28ClOg0eCF+5YsbgpJtKtN077u+/iW55CGP
 quNzZJesrzL8RkKZ0/NhIVEYDVZN08FR2jBCF7XCT7C3cxhQqkQ8C/8wwQMKgNqKKPxd rw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu7snhm1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 06:17:33 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 06:17:33 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 06:17:32 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/2] thunar-media-tags-plugin: 0.3.0 -> 0.4.0
Date: Mon, 10 Apr 2023 21:17:29 +0800
Message-ID: <20230410131730.4445-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 4jupiKmnUk2mLEl8hp2ZJeW-vTk8g7pG
X-Proofpoint-ORIG-GUID: 4jupiKmnUk2mLEl8hp2ZJeW-vTk8g7pG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_09,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 13:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102029

From: Kai Kang <kai.kang@windriver.com>

Update thunar-media-tags-plugin from 0.3.0 to 0.4.0

* update HOMEPAGE
* the license file is out of date and has been updated to latest GPL2
  text [1]

[1]: https://gitlab.xfce.org/thunar-plugins/thunar-media-tags-plugin/-/commit/e206959

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...s-plugin_0.3.0.bb => thunar-media-tags-plugin_0.4.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-thunar-plugins/media-tags/{thunar-media-tags-plugin_0.3.0.bb => thunar-media-tags-plugin_0.4.0.bb} (35%)

diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.4.0.bb
similarity index 35%
rename from meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
rename to meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.4.0.bb
index 06695f694..00afa2bbb 100644
--- a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.4.0.bb
@@ -1,11 +1,10 @@
 SUMMARY = "Adds ID3/OGG tag support to the Thunar bulk rename dialog"
-HOMEPAGE = "http://thunar.xfce.org"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/media-tags"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit thunar-plugin
 
 DEPENDS += "taglib"
 
-SRC_URI[md5sum] = "5e332113e4b0e548ee7abd87629667f7"
-SRC_URI[sha256sum] = "e265c4415abac40337cc5566c6f706efcf0be4e97723abe22ba8b874c93a591b"
+SRC_URI[sha256sum] = "9592111e11699e449c1fbd5f72d1633ef39b00f17a988cd251ba228dab4fc90a"
-- 
2.17.1


