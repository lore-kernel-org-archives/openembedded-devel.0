Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A335FC54E76
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106402.1671917638582331053
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RRRvakHT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLXuPF031454;
	Sat, 24 Dec 2022 21:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=HsdVlbzGOV/nZ8rvgKrckcD7jmN9Cid70t0WLp0X7wM=;
 b=RRRvakHTGekRLO4D9A1MnNv8BjtRni2SwWpwfGOpp+5HkRLNWxLBM9WWIq0LhqlnrYbs
 pLbl/LIRo1KpMdFAWYbYInNlkmDCzmQFdQc1Ea15d5EGyBL2XPIwix/uVNYOGuhn+KQI
 iwtVg3djjupi1Byu69z82PnjL3qIy1Px5MMnbWA6Wm5ELZ5NwihtgDdfLXt0rmKZqRgo
 pG3zYMDLz2+sq7zq+FcxRRdwcP5cJMm3uuHYt+rat3uf1jDYywODr2A8TpLrfD5pKqpC
 F+IEcdx+ZC6sUqtoG0jKTcvan8919O9LwFqOXr7b5Tzr8f+tZOEoS8yJchBjg6t1Tgx5 PQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30fcy-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:33:57 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:33:56 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:33:56 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 02/16] libxfce4util: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:33 +0800
Message-ID: <20221224213347.39959-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Oh93nxgq-s7Pt4StgTx2zMeisRnQeeN8
X-Proofpoint-GUID: Oh93nxgq-s7Pt4StgTx2zMeisRnQeeN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100210

From: Kai Kang <kai.kang@windriver.com>

Correct the license which should be LGPL-2.0-or-later. And the license
file has been updated by:

https://gitlab.xfce.org/xfce/libxfce4util/-/commit/0c334855

It has such descriptions:

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb     | 9 ---------
 .../recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
 create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
deleted file mode 100644
index 6824ac67e..000000000
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Basic utility library for Xfce4"
-SECTION = "x11/libs"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
-
-inherit xfce gtk-doc gobject-introspection vala
-
-SRC_URI[sha256sum] = "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
new file mode 100644
index 000000000..3dd1f55b4
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Basic utility library for Xfce4"
+SECTION = "x11/libs"
+LICENSE = "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
+DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
+
+inherit xfce gtk-doc gobject-introspection vala
+
+SRC_URI[sha256sum] = "1157ca717fd3dd1da7724a6432a4fb24af9cd922f738e971fd1fd36dfaeac3c9"
-- 
2.17.1


