Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D46C77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:27:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5523.1681363640070380073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gk8Y02wX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3467d2966e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D5GVtV004282
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=qhqouFYZT7hkYbl3+5ZTK65S0YXHKAjJr/vjm3XwHSw=;
 b=gk8Y02wXk7JqgCePkF0ZogPN5hcqR5ms2yKi1QcKde/hx8crgX3Eolo0LIPQcLIvRPFQ
 zEDRNTeChTziQ0qRRpv3Vjq1BG5kGVGO6+H/y066WNMKfWF1qOAs5EHF6t7OLoA9r9FI
 ukmZDzzADGlIuqqegF4lRXifLYZ4kk1UVTstFcdRiRHBB/4hba5B2oRKGMHfTcC+0mId
 lcTPo8LcyxLKn9Ou8PPd75grJNsAk7QAs5Q1OYcw6dPOPH3pLsjiPYcD9un5K5AoA7BP
 esEaQGpxt+IOw9xjbXtLMeHGihKpF5fGvN7i19/mjMzmocCy+w1/Z62wZb62QKZTbbLU 2Q== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2g6eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 22:27:18 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 22:27:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/5] libxfce4util: 4.18.0 -> 4.18.1
Date: Thu, 13 Apr 2023 13:27:11 +0800
Message-ID: <20230413052715.23982-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BZN30eYqxJ8oFC6re651iAdPSVPLsh6r
X-Proofpoint-GUID: BZN30eYqxJ8oFC6re651iAdPSVPLsh6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_02,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=922 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 05:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102068

From: Kai Kang <kai.kang@windriver.com>

Release notes for 4.18.1
========================
- Handle remaining escape sequences
- Fix desktop entry value escaping

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4util_4.18.0.bb => libxfce4util_4.18.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.18.0.bb => libxfce4util_4.18.1.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb
index 3dd1f55b4..683f6c337 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb
@@ -6,4 +6,4 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection vala
 
-SRC_URI[sha256sum] = "1157ca717fd3dd1da7724a6432a4fb24af9cd922f738e971fd1fd36dfaeac3c9"
+SRC_URI[sha256sum] = "8a52063a5adc66252238cad9ee6997909b59983ed21c77eb83c5e67829d1b01f"
-- 
2.17.1


