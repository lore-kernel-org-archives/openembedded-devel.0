Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5F1E77187
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 10:36:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53418.1734345386448484577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 02:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2080fd93a2=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGALbXc025622
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:26 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq1e8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Dec 2024 02:36:25 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 16 Dec 2024 02:36:24 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 3/5] libxfce4ui: 4.19.6 -> 4.20.0
Date: Mon, 16 Dec 2024 18:36:16 +0800
Message-ID: <20241216103618.4078816-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216103618.4078816-1-kai.kang@windriver.com>
References: <20241216103618.4078816-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jpsDd4yJpmiA_AyPsDeEsnb9Ob0Lfax1
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676002aa cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=AMtPKpsXUqcRQ-aVgzIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jpsDd4yJpmiA_AyPsDeEsnb9Ob0Lfax1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_04,2024-12-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=727 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412160089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114328

From: Kai Kang <kai.kang@windriver.com>

4.20.0 (2024-12-15)
======
- Update active contributors for 4.20
- Translation Updates:
  Polish
4.19.7 (2024-12-01)
======
- xfce4-about: Don't show mail addresses
- xfce4-about: Init glibtop before using it
- Avoid undefined behavior with NULL msgid strings and dgettext
- Translation Updates:
  Czech, Finnish, Galician, Kazakh, Latvian, Persian (Iran), Polish,
  Spanish, Turkish, Urdu, Urdu (Pakistan)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libxfce4ui/{libxfce4ui_4.19.6.bb => libxfce4ui_4.20.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.6.bb => libxfce4ui_4.20.0.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.6.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.0.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.6.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.0.bb
index e9215f8b9..22ce3fe67 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.6.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.0.bb
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "effe2c29408161beff4ae879f4591e7209c2bf5517c46545a1701337950afc7c"
+SRC_URI[sha256sum] = "75e8996984f20375aadecd5c16f5147c211ed0bd26d7861ab0257561eb76eaee"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.34.1


