Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C0FC54E76
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:03:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9881.1672995835677054522
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0370ea45eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3068rtmv026050
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Jan 2023 09:03:55 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxa050670-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 09:03:54 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 01:03:53 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 01:03:53 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 2/3] gnome-photos: add opengl to REQUIRED_DISTRO_FEATURES
Date: Fri, 6 Jan 2023 17:03:50 +0800
Message-ID: <20230106090351.692314-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106090351.692314-1-mingli.yu@eng.windriver.com>
References: <20230106090351.692314-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7-1IZAZe4mAN2nN8mmdmIoEzUUtZREaD
X-Proofpoint-GUID: 7-1IZAZe4mAN2nN8mmdmIoEzUUtZREaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_04,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=949
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100423

From: Mingli Yu <mingli.yu@windriver.com>

gnome-photos depends on libportal which needs opengl DISTRO_FEATURES,
so add the required DISTRO_FEATURES for gnome-photos.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
index 620e76e9a..72ab2eaaf 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
@@ -31,7 +31,7 @@ inherit gnomebase gettext gnome-help features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[doc] = "-Dmanuals=true,-Dmanuals=false,libxslt-native docbook-xsl-stylesheets-native"
-- 
2.25.1


