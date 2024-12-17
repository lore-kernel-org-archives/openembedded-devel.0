Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101C9E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:34:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.79305.1734435287186307303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20816660d6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH5o3sV017563
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq2rw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 17 Dec 2024 03:34:45 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 17 Dec 2024 03:34:44 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/5] thunar-volman: 4.18.0 -> 4.20.0
Date: Tue, 17 Dec 2024 19:34:31 +0800
Message-ID: <20241217113434.2082270-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113434.2082270-1-kai.kang@windriver.com>
References: <20241217113434.2082270-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5habuiVHDp5GPHBRq-kFF-k1LRk1C1Kp
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676161d6 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=2mlphCoshwCK-qECdc0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5habuiVHDp5GPHBRq-kFF-k1LRk1C1Kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_06,2024-12-17_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412170095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 11:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114368

From: Kai Kang <kai.kang@windriver.com>

4.20.0 (2024-12-15)
======
- Translation Updates:
  Finnish, Portuguese
4.19.1 (2024-12-01)
======
- Translation Updates:
  Spanish, Vietnamese
4.19.0 (2024-11-01)
======
- build: Fix deprecation warning
- build: Bump requirements for Xfce 4.20
- build: Use XDT_VERSION_INIT and get rid of configure.ac.in
- README: correct documentation URL
- settings: make `option_entries` NULL-terminated
- tvm-input-device: Avoid criticals when ID_MODEL missing (#25)
- I18n: Update po/LINGUAS list
- build: Get rid of intltool
- Add icons at missing sizes, clean up SVG metadata
- Declare use of function (fixes #24)
- settings: Fix critical warning when closing embedded dialog
- Update bug report address
- Translation Updates:
  Asturian, Croatian, English (Canada), Greek, Italian, Polish,
  Portuguese, Russian

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{thunar-volman_4.18.0.bb => thunar-volman_4.20.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.18.0.bb => thunar-volman_4.20.0.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb
index a136ba054..afdf410c6 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb
@@ -8,7 +8,7 @@ inherit xfce features_check perlnative
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "93b75c7ffbe246a21f4190295acc148e184be8df397e431b258d0d676e87fc65"
+SRC_URI[sha256sum] = "b0dad852959b515b8fbfd1ed552e362340347d26d5246e7f1b973027131eb1da"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.34.1


