Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142C1C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 05:34:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14531.1742535260482941472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 22:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517513f68b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5FmpL022391;
	Thu, 20 Mar 2025 22:34:19 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jxk21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Mar 2025 22:34:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Mar 2025 22:34:18 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Mar 2025 22:34:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [python3-protobuf][PATCH 2/2] python3-protobuf: 4.25.3 -> 5.29.4
Date: Fri, 21 Mar 2025 13:34:15 +0800
Message-ID: <20250321053415.1875796-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321053415.1875796-1-hongxu.jia@windriver.com>
References: <20250321053415.1875796-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67dcfa5b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xn4mGWU0A0cRP3EbRjMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: LZOUUDWCFUC7C6l7uS4GMKOuQ35SII7-
X-Proofpoint-GUID: LZOUUDWCFUC7C6l7uS4GMKOuQ35SII7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 05:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116163

License-Update: no chnage

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...{python3-protobuf_4.25.3.bb => python3-protobuf_5.29.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.3.bb => python3-protobuf_5.29.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
index e1dd8e17c7..d39c5e9790 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 # https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = " \
-    file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d \
+    file://PKG-INFO;beginline=9;endline=9;md5=53dbfa56f61b90215a9f8f0d527c043d \
     file://utf8_range/utf8_range.h;beginline=1;endline=2;md5=f05b3ef36cc354d7134597075a1af64f \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a5492cc5c"
+SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.34.1


