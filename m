Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26380E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 06:43:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18187.1735195376614946661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Dec 2024 22:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2090a34e30=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ55ext000344
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 22:42:56 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2pbv34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Dec 2024 22:42:56 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 25 Dec 2024 22:42:55 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 25 Dec 2024 22:42:54 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-beautifulsoup4,python3-soupsieve: fix loop dependency error
Date: Thu, 26 Dec 2024 14:42:54 +0800
Message-ID: <20241226064254.1178852-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YxoKIUEVPYeH03ErpRMWKcY9TqPd8ykz
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=676cfaf0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=RYHR1ms9YbR2KpZOVc4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YxoKIUEVPYeH03ErpRMWKcY9TqPd8ykz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-26_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=929
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412260058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114551

While recipe build depends on python3-beautifulsoup4-native and
python3-soupsieve-native, it failed at fix loop dependency error
...
|ERROR: Task virtual:native:meta-openembedded/meta-python/
recipes-devtools/python/python3-soupsieve_2.6.bb:do_populate_sysroot
has circular dependency on virtual:native:meta-openembedded/
meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb:do_populate_sysroot
...

Correct runtime depends as class-target override to workaround

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb  | 4 +++-
 meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
index 14dedba92..d08017d00 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
@@ -10,9 +10,11 @@ inherit pypi python_hatchling
 RDEPENDS:${PN} = "\
     python3-html5lib \
     python3-lxml \
-    python3-soupsieve \
     python3-html \
     python3-logging \
 "
+RDEPENDS:${PN}:append:class-target = " \
+    python3-soupsieve \
+"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
index 6572a6845..dc317ea6c 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
@@ -14,6 +14,8 @@ SRC_URI += " \
 RDEPENDS:${PN} += " \
     python3-core \
     python3-datetime \
+"
+RDEPENDS:${PN}:append:class-target = " \
     python3-beautifulsoup4 \
 "
 
-- 
2.34.1


