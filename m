Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF958E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 10:36:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53623.1734345387391311736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 02:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2080fd93a2=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAV1wf007487
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq1e8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:27 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Dec 2024 02:36:26 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 16 Dec 2024 02:36:25 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/5] exo: 4.19.1 -> 4.20.0
Date: Mon, 16 Dec 2024 18:36:17 +0800
Message-ID: <20241216103618.4078816-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216103618.4078816-1-kai.kang@windriver.com>
References: <20241216103618.4078816-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jvr_Npgm1eReYEzsincviImmvozHn4Oc
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676002ab cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=TSbVqHtbAAAA:8 a=t7CeM3EgAAAA:8 a=938B_keZlsxRNfJf1P0A:9 a=NJcUIoPEKLAEIzHnl83t:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jvr_Npgm1eReYEzsincviImmvozHn4Oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_04,2024-12-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412160089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114329

From: Kai Kang <kai.kang@windriver.com>

4.20.0 (2024-12-15)
======
- Translation Updates:
  Finnish, Hebrew, Polish
4.19.2 (2024-12-01)
======
- I18n: Update po/LINGUAS list
- exo-die: Fix string leak in exo_die_g_key_file_set_locale_value
- Translation Updates:
  Belarusian, Czech, English (United Kingdom), French, Galician,
  German, Japanese, Kazakh, Lithuanian, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Serbian, Spanish, Swedish, Turkish,
  Uzbek, Vietnamese

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/exo/{exo_4.19.1.bb => exo_4.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.19.1.bb => exo_4.20.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb b/meta-xfce/recipes-xfce/exo/exo_4.20.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.20.0.bb
index f6b50471c..4b2c5375f 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.20.0.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://exo-no-tests-0.8.patch \
 "
 
-SRC_URI[sha256sum] = "4c3721d47126b1a3143f00a4e4dff5eea364c02c3fa141b09c0b1af16b1f0794"
+SRC_URI[sha256sum] = "4277f799245f1efde01cd917fd538ba6b12cf91c9f8a73fe2035fd5456ec078d"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.34.1


