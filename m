Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0126FC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:59:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14424.1669186759839081643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VSLG8jBB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83266acff9=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN6jP55032378
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=+kmaUQ1fgFPIx0wKPM2d+0ttctZfRFlbYmlG+d1ApnQ=;
 b=VSLG8jBBXarJgtcQenDNr7ZIP9hhAr4vYuJURVwHCO78Jpue4g7m8VMkSgN/nUCSdmXR
 hxhxIlqT4FrhU0S+mq/AkhL1xCv23Jd+g10wGmI7+DXDsKFa1KaIKjzR3dJB6qSPoDqU
 m1r+lWh9ZG+mJNd4ZIeO+1EKE2OQVUPq4LOeJ38XfDp70ppdcyyN0v8N3w3lulMH/1Wm
 RLgqU/ZvtmgVyQl+pLAjArdqZS+qjKTQT44ckdXUhGJPzVq/7T8/9mpl31Qsm+qqPhyW
 VVKk/m5sSGnp3W2III6Kj+8DzHe1bWx9xLZUpQzzaLyxOLWq9Q6R1wtQwLpapCO+IYBo 6g== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj36qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:59:18 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Nov 2022 22:59:17 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Nov 2022 22:59:17 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-settings: 4.16.3 -> 4.16.5
Date: Wed, 23 Nov 2022 14:59:13 +0800
Message-ID: <20221123065913.32174-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 6iKqxWL7sFvKyzaPhp4ZZQxvBWjATYhE
X-Proofpoint-ORIG-GUID: 6iKqxWL7sFvKyzaPhp4ZZQxvBWjATYhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=4 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=4 adultscore=0 mlxlogscore=557
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99698

From: Kai Kang <kai.kang@windriver.com>

It fixes CVE-2022-45062 in xfce4-settings 4.16.5.

CVE: CVE-2022-45062

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-settings_4.16.3.bb => xfce4-settings_4.16.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.3.bb => xfce4-settings_4.16.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.3.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
index f283edac6..4a4e9f188 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "f299e6d26d8e142c0b7edeb9b8917d6bd50bc8647254ea585069c68f2bab8e64"
+SRC_URI[sha256sum] = "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.17.1


