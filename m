Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CF1E77184
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 10:36:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53624.1734345388381964261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 02:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2080fd93a2=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG5A2a6009362
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:28 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6681jxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Dec 2024 02:36:27 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 16 Dec 2024 02:36:26 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 5/5] garcon: 4.19.1 -> 4.20.0
Date: Mon, 16 Dec 2024 18:36:18 +0800
Message-ID: <20241216103618.4078816-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216103618.4078816-1-kai.kang@windriver.com>
References: <20241216103618.4078816-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZTuzikuLItR5wRHY6cHscVTsSTozL-Rl
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=676002ac cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=EreUobg2VYWv24VzISEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZTuzikuLItR5wRHY6cHscVTsSTozL-Rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_04,2024-12-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412160089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114330

From: Kai Kang <kai.kang@windriver.com>

4.20.0 (2024-12-15)
======
- Translation Updates:
  Polish
4.19.3 (2024-12-01)
======
- menu-item: Ensure UTF-8 strings
- Translation Updates:
  Galician
4.19.2 (2024-11-01)
======
- Fix doc annotation
- build: Bump requirements for Xfce 4.20
- Apply .clang-format file
- Sort includes
- clang-format: Add file
- gcc-analyzer: Add false positive file
- scan-build: Add false positive file
- build: Use AM_DISTCHECK_CONFIGURE_FLAGS
- menu-item: Honor TryExec again
- menu-item: Let glib check for absolute path to executable
- Use Exec instead of TryExec for menu item visibility (#22)
- Translation Updates:
  Asturian, Catalan, Polish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/garcon/{garcon_4.19.1.bb => garcon_4.20.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.19.1.bb => garcon_4.20.0.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.19.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.19.1.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
index c4371a507..c827f96d3 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.19.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[sha256sum] = "5d4c9504a0c73b0f8f14b70875bd0ac5f280c99754e9c2e575031ca03cc87eb1"
+SRC_URI[sha256sum] = "7fb8517c12309ca4ddf8b42c34bc0c315e38ea077b5442bfcc4509415feada8f"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.34.1


