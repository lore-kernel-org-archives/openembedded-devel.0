Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC6AC77B77
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49243.1681718184596865105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=h0WRQOdM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3471b6e0c9=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H6C3NL006739
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 00:56:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=sT0RNpbFxe/pIdyZTzh3fAq45vl2Y9xPqMviY2rkCLQ=;
 b=h0WRQOdMw9GGCBU/NuO6CsSQ78MjukHa2uz09Eh+fbWpKifg8h6dLtUpfeO3yN9b8Zp1
 fZn3402JeYmpfZGv+FWLZx2yWJB2+oWI7oiCU4jvPefD6B+CTuvjWxTkA3aw4cY3kB9G
 zrgPj5kpypMhXd85AIIKI/gy31VNkxgNKIbjpB6cYBXH6/ntQohnCgSaP13pnYGia9GS
 lafmuWn2ByTNBMjpkS5xYjt6LnvO4lfeF0qcxHytM7XKt8uW6FeV5j1S3Crnk03bknUB
 KJajq/bvf2RvDOlWzo1zmDac7wKnB5wWTZUIKsASkq90waaxLLSXCxkZYQBv/6/riuji Uw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76j7bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 00:56:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 00:56:23 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 00:56:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 3/4] xfce4-power-manager: 4.18.0 -> 4.18.1
Date: Mon, 17 Apr 2023 15:56:16 +0800
Message-ID: <20230417075617.35121-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417075617.35121-1-kai.kang@windriver.com>
References: <20230417075617.35121-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9uVOz81pQCnIB6Qs2zlswIzRMDTM-rEr
X-Proofpoint-GUID: 9uVOz81pQCnIB6Qs2zlswIzRMDTM-rEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=627 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102124

From: Kai Kang <kai.kang@windriver.com>

Release notes for 4.18.1
========================
- Update copyright year
- Use XfceScreensaver from Libxfce4ui (!33)
- screensaver: Fall back on lock command if D-Bus call failed (#142, !24)
- panel-plugin: Properly disconnect signal handler
- build: Fix autotools warnings
- Fix management of source ids
- panel-plugin: Add missing ref on image
- Fix blurriness in icons when UI scale factor > 1 (!30)
- Translation Updates:
  Chinese (China), English (Canada), Greek, Korean, Turkish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-power-manager_4.18.0.bb => xfce4-power-manager_4.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.18.0.bb => xfce4-power-manager_4.18.1.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
index f61c9cd6a..f7f72356d 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
@@ -11,7 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "2eee467886252f9fa704c978ec67dafad5274ede93e59b092a688faa7e72c39a"
+SRC_URI[sha256sum] = "6b08b10c4cb7516377dbd32c6cc2296a9faf47022c555f11e75b38fde14aff03"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.17.1


