Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17EEE7718E
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:52:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.126723.1734605563888528065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6wNW5018323;
	Thu, 19 Dec 2024 02:52:42 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq5dmw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Dec 2024 02:52:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 02:52:31 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 02:52:30 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/6] xfwm4: 4.19.0 -> 4.20.0
Date: Thu, 19 Dec 2024 18:52:21 +0800
Message-ID: <20241219105225.555464-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219105225.555464-1-kai.kang@windriver.com>
References: <20241219105225.555464-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0cDYsWChtUmCYDFBs8Mz0D4L4u4b-xmn
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=6763fafa cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=bLUHWOKpQtqRoGD5epkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0cDYsWChtUmCYDFBs8Mz0D4L4u4b-xmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=974 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114389

From: Kai Kang <kai.kang@windriver.com>

4.20.0 (2024-12-15)
======
- Translation Updates:
  Finnish, Portuguese, Romanian

4.19.1 (2024-12-01)
======
- I18n: Update po/LINGUAS list
- hints: Fix buffer overflow in XChangeProperty
- Translation Updates:
  Finnish, Kurdish, Polish, Sinhala, Telugu, Vietnamese

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.19.0.bb => xfwm4_4.20.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.19.0.bb => xfwm4_4.20.0.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.19.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.19.0.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
index a11daa58c..8b913ed3d 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://xfwm4-fix-incompatible-pointer-type-error.patch"
 
-SRC_URI[sha256sum] = "73546c60c348bcbe088fd990f7d5d1d6a6eca4226f956c109d3655c00583b9cf"
+SRC_URI[sha256sum] = "a58b63e49397aa0d8d1dcf0636be93c8bb5926779aef5165e0852890190dcf06"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.34.1


