Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F6EC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 15:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47524.1674141095346772464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 07:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Bqe4G7W6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0383abefc3=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JDmaOH004145
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 15:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=1NR3GTKRqYQ2DU39zpnCjaiSMxNa3+k8OUs/yafEGeo=;
 b=Bqe4G7W6tcCTH1ZfRgwXc8VWHPq7r1g5Sx9Z461HZssxVE0Nujrbx5QtUjLF4pOfMgPc
 Z+eltE/+4FqBUMFHpEs4yZSq3KYvmNXyBDRLvEr/BuXpA2ZgdvI93Q+59xbuP/PomSd7
 1mjOkYqvyotwBFyLPJ9tay4MhZ8D929a6WxkMl8OJfbGKNNCzJ/DUBxBp9pmTt5s+B80
 T1lATpMATU7HhBdcnqx2bk2B+1YB6Rs2//VUK9hYZDXYb7dap99gTvx1oQkr6gIhK1M6
 HjLMyq10uYMQN0N055BCbUBfuJx+EWlIWouoh3patKS6Vh3VkxLHP1R37y36xCHcTHZs SQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6ncrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 15:11:34 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 19 Jan 2023 07:11:33 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 07:11:31 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libnma: 1.10.4 -> 1.10.6
Date: Thu, 19 Jan 2023 23:11:29 +0800
Message-ID: <20230119151129.4351-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 9zhcwNalWatkQINfygDQdLrt0Cm6LWeX
X-Proofpoint-ORIG-GUID: 9zhcwNalWatkQINfygDQdLrt0Cm6LWeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 15:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100659

From: Kai Kang <kai.kang@windriver.com>

=======================================
libnma-1.10.6
Overview of changes since libnma-1.10.4
=======================================

* Fix the path and translation domains of GSchema files.
* Removed strings that don't match our conscious language standards from
  the translation files.
* Added autoptr support.
* Fix translations of country and territory names in the mobile broadband
  dialog.
* Honor explicitly set APN if provider was not present in the mobile
  broadband dialog.
* Make sure Kosovar operators are ordered properly in the mobile broadband
  dialog.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libnma/{libnma_1.10.4.bb => libnma_1.10.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/libnma/{libnma_1.10.4.bb => libnma_1.10.6.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
rename to meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
index 6adb7ec29..bff9a3360 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
@@ -10,7 +10,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)} opengl"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "79e730dda19f9b34886f4064aa170f1a2326b08329d655d80b67e906c7f78b7c"
+SRC_URI[archive.sha256sum] = "53a6fb2b190ad37c5986caed3e98bede7c3c602399ee4f93c8fc054303d76dab"
 
 PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
 PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
-- 
2.17.1


