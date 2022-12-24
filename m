Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79652C4167B
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106124.1671917645329792419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Tr42lmhE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLY5I7012909
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=Qxhbu3fmlNAWU7Ik9dbQXBXvbSJ2FpueYGuwtmNuGQI=;
 b=Tr42lmhE0fXFqUEAAwWZBydv73BDigM3/Jd1cpat6KFUyPq17Mr12+VE1ujrN6tgnL3T
 /mYMVu6YD4yFF4ZaxWnK8SRLw33Jzc10PxnPJ5WEz3U3Qt2yv9fMsq0fs/5A8cUamf4V
 897GxLcBLF9/eeMEfuqRDxKLnZyHkhdjLVu4sjXaVH8V9OeAq2pgl1P0yPt/0G1cStqV
 7+AorJeJ/1AV4TQ6wWuTluZGJ38ZaghpG3X88UWGuLWVAXfVTP2Xjvd3+Cr1w/SJENlT
 9A3on84w1KCQD0nj6+HJTCJnFXYlZrcqa7n8C6KwtkewDDf7Nszet2OpphYkg4ryGfkN 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:05 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BOLY47P012900
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:04 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:04 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:03 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 09/16] tumbler: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:40 +0800
Message-ID: <20221224213347.39959-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: p3MuBlWsUgr96i1Rhrpu8uAazq-3ymLW
X-Proofpoint-ORIG-GUID: 0v9PaZkflCAK76gpx0b_F2X5QNhjEDsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100217

From: Kai Kang <kai.kang@windriver.com>

Update tumbler from 4.16.0 to 4.18.0

* update license with GPL-2.0-or-later
* add dependency libxfce4util
* inherit systemd

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../tumbler/{tumbler_4.16.0.bb => tumbler_4.18.0.bb}     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.18.0.bb} (80%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb
similarity index 80%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb
index 6a583ade7..0472d4885 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Thumbnail service implementing the thumbnail management D-Bus specification"
 SECTION = "x11/libs"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
+DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf libxfce4util"
 
-inherit xfce gtk-doc
+inherit xfce gtk-doc systemd
 
-SRC_URI[sha256sum] = "9b0b7fed0c64041733d490b1b307297984629d0dd85369749617a8766850af66"
+SRC_URI[sha256sum] = "4087f3af4ef31271d3f315421a2f1fe67e4fda7ad60bbab1f073627914dfcf00"
 
 INSANE_SKIP:${PN} = "dev-so"
 
@@ -23,6 +23,7 @@ FILES:${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
                 ${libdir}/tumbler-1/plugins/cache/*.so \
+                ${systemd_user_unitdir}/tumblerd.service \
 "
 
 FILES:${PN}-dev += "${libdir}/tumbler-1/plugins/*.la \
-- 
2.17.1


