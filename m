Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03466C4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 16:45:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.100428.1671900313927520068
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 08:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qeyUqAUU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOGgSvO022952
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 16:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=BVsZJ0zEpSeLQmsk0sBZqEDRnWB/deqTPGmlkGR+GRA=;
 b=qeyUqAUUwhRr/S45Qfkxr/bnPH2jSY1Zld8qBMaPM9q7sQ0mhAWTL0/9po32O37Dqf1y
 MCeCbEyDcvnboEbS4oWWPpLnH3/p/LAzRLoy9mexcohDSQqvlxwX/GTRUiaOAva4y6J2
 lAw7oTJsd5EzbUFGmyNyRdnMiRWvrYK7aDq57/drDGdSG7A8gTNW9Ius8w+XZ9Zc6mqI
 7tWhJwLJjch1CgxIKdnx+ZaTXnK9kU+cPD3pXvLwvAb1vvzn6G/sdYJDWi4HSO9G5Nce
 AUKcle5RsvgZeeK+AR97bOiRBNqrVsTq4Jl01wEcs2LAJX11/g0t6I9ytSVNj0PehTzq tQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30c24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 16:45:12 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 08:45:12 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 08:45:11 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-xfce][PATCH] xfce4-settings: 4.16.2 -> 4.16.5
Date: Sun, 25 Dec 2022 00:45:09 +0800
Message-ID: <20221224164509.11131-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ifMsN4wSULBEMoTUFj8ai7cYnxdfVJhu
X-Proofpoint-GUID: ifMsN4wSULBEMoTUFj8ai7cYnxdfVJhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_08,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=825 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100207

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-settings to latest 4.16.x. It fixes CVE-2022-45062 in
xfce4-settings 4.16.4.

CVE: CVE-2022-45062

4.16.5 (2022-11-12)
======
- mime-settings: Properly quote command parameters
- Revert "Escape characters which do not belong into an URI/URL (Issue

4.16.4 (2022-11-07)
======
- Escape characters which do not belong into an URI/URL (Issue #390)
- Prefer full command when basic command is env (Fixes #358)
- Translation Updates:
  Japanese, Portuguese, Russian

4.16.3
======
- xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
- build: Fix intltool lock file problem during make distcheck
- Translation Updates:
  Armenian (Armenia), Belarusian, Catalan, English (Canada), English
  (United Kingdom), Estonian, Galician, Greek, Indonesian, Kazakh,
  Korean, Lithuanian, Malay, Occitan (post 1500), Polish, Romanian,
  Swedish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
index aa4265f7b..4a4e9f188 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
+SRC_URI[sha256sum] = "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.17.1


