Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1196FC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:34:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.79579.1734435285694502897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20816660d6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH5o3sU017563
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:45 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq2rvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:45 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 17 Dec 2024 03:34:44 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 17 Dec 2024 03:34:43 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/5] thunar: 4.19.0 -> 4.20.0
Date: Tue, 17 Dec 2024 19:34:30 +0800
Message-ID: <20241217113434.2082270-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WlrM6Ssbk5YjzIIBcW0BZe9-8IC5f_ks
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676161d5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=Q_JFiExg7AGcczec1NYA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WlrM6Ssbk5YjzIIBcW0BZe9-8IC5f_ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_06,2024-12-17_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=808 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412170095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 11:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114367

From: Kai Kang <kai.kang@windriver.com>

Upgrade thunar from 4.19.0 to 4.20.0. The change log is at:

https://gitlab.xfce.org/xfce/thunar/-/blob/master/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_4.19.0.bb => thunar_4.20.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.19.0.bb => thunar_4.20.0.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.20.0.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.20.0.bb
index e4d8b7b4d..43125c1e2 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.20.0.bb
@@ -10,7 +10,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[sha256sum] = "684f1422c4d92b00db477ecaa2a0ed38ce688e2a567e5d70b7cf66fc6dd6fd18"
+SRC_URI[sha256sum] = "27731a76f3aecf3752b1ca35afad89e264c52244f70083d933507dd4a17548b0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
-- 
2.34.1


