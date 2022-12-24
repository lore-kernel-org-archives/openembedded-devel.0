Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95393C4708D
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106412.1671917648746950056
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W8Y5blbX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLXi1a021056;
	Sat, 24 Dec 2022 21:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=5AgjEWUyQpr6I9NS5XOgIXGNNIIuB9QmNPireWjXt2c=;
 b=W8Y5blbXEYYPlLdl0JVqvOwqi/Il5CV6hmEewn2HULBNsFRPy74iKKpB0iVETwABrd/c
 jfgPz8zG/YiBXtHJfjGqzlmNw7ol5spjqQms1B4Segm7uVSlqhHAczNEYrAib+jx8GNj
 Xy/grnzR/xQCNXbWAeUGOidlXAPTAkpEQVRUkM8nDVLEw/zTU9fDi/xKKD9iQ6GtDexW
 NHpVYJlms0iMHNvEmwp6Y4fsykoU+a98LsbjXFhRjKMrb+eqC/ckOhe8lJzPgPI+ACNh
 JervtrA2ZKMvg0WYTqDjmH/6rzkpdSXqdx0u/NIH4viMN4hpGRbkMx/3bFI0rWQVrYEe Nw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda0dxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:34:07 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:06 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:06 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 11/16] xfce4-appfinder: 4.16.1 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:42 +0800
Message-ID: <20221224213347.39959-12-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mQ-HGQpQPfdFW03c1g_SM3f6Z67R7cKS
X-Proofpoint-GUID: mQ-HGQpQPfdFW03c1g_SM3f6Z67R7cKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=909 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100219

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-appfinder from 4.16.1 to 4.18.0.

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...{xfce4-appfinder_4.16.1.bb => xfce4-appfinder_4.18.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb => xfce4-appfinder_4.18.0.bb} (54%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.18.0.bb
similarity index 54%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.18.0.bb
index 18d9fedfc..06dc0a200 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.18.0.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Xfce4 Application Finder"
 SECTION = "x11"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
 
 inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "bfe3e9bd92695014ee74a2fbb7f5fd1b4c29cf043c4a11598b8958324c81e7ec"
+SRC_URI[sha256sum] = "962a98d7b327d2073ed4cd0f78bce7945ed51b97d52fd60196e8b02ef819c18c"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.17.1


