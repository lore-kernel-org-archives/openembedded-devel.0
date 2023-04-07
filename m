Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096D5C77B6E
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 09:17:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3449.1680859050029520385
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oBHhe6vX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34613e1654=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3379GGiX027963
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Apr 2023 02:17:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=39AF9735jk5vaGSXej/VXqoCHcKHYWYtdrJhzsycJKw=;
 b=oBHhe6vX37IbDYHime3jIcw9myZKzj/Zfu22UfvG33M4gN/46OCMlC68ObuLXLt5Wrop
 jHTjJpYayQiMYqtMN/mQaeT960yy4SlqYh27nQpHdgS8tx4HC7NNiOWRG70CtPCoW/CF
 eZejp4osu4FaSvb0e2YOnbBlL681l1dRLgW3U3WNF6Rj3AGl4r3hWmpYSifwb0plbD5S
 tjpRQ1CXfyLC7ToK9BkepbWBccWYjlE4add5rnA9qf5k6GV9aycYlyCMWQueuldRux2j
 LO87WvuVmz1a+2qGXs6EsHXztU3Ra+aEEsqBIrQ3yCenLbiFYbY2ANOmzZlUO1nLanKy hg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppm4p6g34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 02:17:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 02:17:28 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 02:17:28 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/4] xfce4-taskmanager: 1.5.2 -> 1.5.5
Date: Fri, 7 Apr 2023 17:17:20 +0800
Message-ID: <20230407091722.5576-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230407091722.5576-1-kai.kang@windriver.com>
References: <20230407091722.5576-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: O6CndLPrSsA23cSENqTu53nmWiVHcqBa
X-Proofpoint-ORIG-GUID: O6CndLPrSsA23cSENqTu53nmWiVHcqBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=753 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101978

From: Kai Kang <kai.kang@windriver.com>

The content of the license file has been updated [1].

[1]: https://gitlab.xfce.org/apps/xfce4-taskmanager/-/commit/d47388f7

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb         | 9 ---------
 .../xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb         | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
deleted file mode 100644
index a3d10cd25..000000000
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Easy to use task manager"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-app
-
-DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu xfce4-dev-tools-native"
-
-SRC_URI[sha256sum] = "bd25143f47a29000b4148874863dffa521b1a37cb01dbc026f423ea3160f9a35"
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb
new file mode 100644
index 000000000..802d6af4a
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.5.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Easy to use task manager"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-app
+
+DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu xfce4-dev-tools-native"
+
+SRC_URI[sha256sum] = "f64f01ba241a0b8bbf2ed3274e5decc2313c9f8b0e4d160db3ba69b331558ae5"
-- 
2.17.1


