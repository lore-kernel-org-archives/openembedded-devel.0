Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28A4C4708D
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106118.1671917639276385777
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nKBmmPZe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLTVGh010425;
	Sat, 24 Dec 2022 13:33:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=Mg+aSa8p+p66AECTC2Oq1FM8jHIkKGmAHIpkSupM8bg=;
 b=nKBmmPZep3zxASv5XnP4dGlGsANDqrXP2k7SbZanGjTsa9lTNJCjZW0+we5MLDac5+Cg
 1NFhpcwXjmJacyQDr4qgaSQoW2VYIfz3vIdEUgh9OpeVb4SsOLlZmcAdRaGPWGUaCXxw
 w8S8hHDIvgXZnDSnDT3grUy6z1i/tu+r067kckAU8frCiNfdsWQeTzKfY+DHgQXHb9vd
 B3P/A5MwHI/26v/bjy1GSUdKbquwGplMCXLJljTkAyOUXx9lmvXOQAjsz/GeHPGvcOl2
 2Z+/cEeanzoq1y4SSGuIhlORAXxvKL6oKDOhX6uUBs+4u0yj/pzQ7EgUrZyENSp0C0az fQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trg6cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:33:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:33:57 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:33:57 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 03/16] libxfce4ui: 4.16.1 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:34 +0800
Message-ID: <20221224213347.39959-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: omfEQUtO9BSjlJ-Yf1Ru55YJpWMdBQTa
X-Proofpoint-ORIG-GUID: omfEQUtO9BSjlJ-Yf1Ru55YJpWMdBQTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=944
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100211

From: Kai Kang <kai.kang@windriver.com>

Update libxfce4ui from 4.16.1 to 4.18.0. And update license which should
be LGPL-2.0-or-later according to

https://gitlab.xfce.org/xfce/libxfce4ui/-/commit/797b7a6b

and

https://gitlab.xfce.org/xfce/libxfce4ui/-/blob/master/COPYING#L457
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
index 692c79f3c..7ff9d1b12 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
+LICENSE = "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 DEPENDS = "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-tools xfconf"
 
 inherit xfce gtk-doc gobject-introspection features_check
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "d96946ae5af6bf078dda415419e0021909f763ee0020b42f3e26f603e51585f6"
+SRC_URI[sha256sum] = "532247c4387c17bb9ef94a73147039b8d013c3131c95cdbd2fa85fbcc848d06b"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.17.1


