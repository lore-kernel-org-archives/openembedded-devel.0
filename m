Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CA6C35FF5
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:00:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.26667.1741741201339657205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 18:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5166cf4169=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BKg1rQ029022
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 18:00:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45au8yg9dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 18:00:00 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 18:00:00 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 17:59:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 8/9] pangomm: upgrade 2.46.2 -> 2.46.4
Date: Wed, 12 Mar 2025 08:59:51 +0800
Message-ID: <20250312005952.1469547-8-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312005952.1469547-1-changqing.li@windriver.com>
References: <20250312005952.1469547-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=TsPmhCXh c=1 sm=1 tr=0 ts=67d0dc91 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=O9bkW2lO9MF910mUFAsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: G-MgT5CZnpweWqDwIEqc9K7kELjG2pO5
X-Proofpoint-ORIG-GUID: G-MgT5CZnpweWqDwIEqc9K7kELjG2pO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=930 clxscore=1015 priorityscore=1501
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115903

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/pangomm

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../pango/{pangomm_2.46.2.bb => pangomm_2.46.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.46.2.bb => pangomm_2.46.4.bb} (83%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
similarity index 83%
rename from meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
index da822f3243..6f228b131e 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
@@ -11,7 +11,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "57442ab4dc043877bfe3839915731ab2d693fc6634a71614422fb530c9eaa6f4"
+SRC_URI[archive.sha256sum] = "b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
-- 
2.34.1


