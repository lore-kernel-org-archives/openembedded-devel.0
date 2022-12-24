Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3025C10F1B
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.106127.1671917649236020932
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e3WQJY6z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLXi1b021056;
	Sat, 24 Dec 2022 21:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=66L4pVVeBsiVjHwCbE5JWIWBFAMZJ4lX/AngDZ0R5ig=;
 b=e3WQJY6z5nFog7MklKxvSDxZm6sWiNWTlcwgZvSlWth0/H35LtOHbna6m0ajU7KFGdnN
 LE4v0wxs7FVp26Rxb0kVpdaKwVcPYcvVBEHXOVKJ92OEUbviCnBzuLEAs8VJZuMCyBWy
 8o8uRCem9vVjsaPsahap+8QrW6wY87bUATGNhcWwe35u3D7inY1BEDRNum6dkfVPoKem
 3icTAMoJx/X3L5WIwKJqOLr2Mdhy1h+jXhhsKougf9Q3a6ayiE52wVO5w9+xDlFduoLm
 KJv3vM6wiAbyT81DyF79uDsc1xsyQm8o/UaDTy2CeGqzTSg+yIjBXrEqhD17IPHT0Dva aQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda0dxb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:34:08 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:07 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:07 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 12/16] xfce4-power-manager: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:43 +0800
Message-ID: <20221224213347.39959-13-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EKTUnTLs2YDVXUMGIuoKAmo79ZUD9wG4
X-Proofpoint-GUID: EKTUnTLs2YDVXUMGIuoKAmo79ZUD9wG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=730 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100220

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-power-manager_4.16.0.bb => xfce4-power-manager_4.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.16.0.bb => xfce4-power-manager_4.18.0.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.0.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.0.bb
index 34de7a708..f61c9cd6a 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.0.bb
@@ -11,7 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "eb9c587c01b502fa45a32e7fc2aba98fa6d8391475133883654f77e562c43bf3"
+SRC_URI[sha256sum] = "2eee467886252f9fa704c978ec67dafad5274ede93e59b092a688faa7e72c39a"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.17.1


