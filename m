Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4B9E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 06:38:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9317.1734935909670801437
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Dec 2024 22:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2087a7b2cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5ra7V025634;
	Sun, 22 Dec 2024 22:38:28 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub1auy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Dec 2024 22:38:28 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 22 Dec 2024 22:38:27 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 22 Dec 2024 22:38:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH 2/3] Update p7zip to 7zip
Date: Mon, 23 Dec 2024 14:38:23 +0800
Message-ID: <20241223063824.2495987-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223063824.2495987-1-hongxu.jia@windriver.com>
References: <20241223063824.2495987-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=67690564 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=oEeSjR_EbzVdMEr6biMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ndkwMfvIMcLZHi3G3zqK9Yx6l41SCOTX
X-Proofpoint-ORIG-GUID: ndkwMfvIMcLZHi3G3zqK9Yx6l41SCOTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_02,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=966
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 06:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114464

Due to commit [Use 7zip 24.09 to replace p7zip 16.02] applied,
update affected recipes

(cherry picked from commit 751cc692ee13f0e7ba7a82d73dd4c987da3d578d)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 765edc5c5..ab7302235 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -375,7 +375,7 @@ RDEPENDS:packagegroup-meta-oe-extended ="\
     nana \
     nicstat \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
-    p7zip \
+    7zip \
     isomd5sum \
     jpnevulator \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-datetime polkit-group-rule-network polkit", "", d)} \
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index ea7e8005e..3951ab757 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -30,4 +30,4 @@ do_configure:prepend() {
 
 FILES:${PN} += "${libdir}/thunar-archive-plugin"
 
-RRECOMMENDS:${PN} = "lzop zip tar bzip2 unzip xz p7zip"
+RRECOMMENDS:${PN} = "lzop zip tar bzip2 unzip xz 7zip"
-- 
2.34.1


