Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F5ED68B0F
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:23:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.36688.1731590615097374595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10487a133e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEAxmrM029301
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:34 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwv4bt9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 05:23:33 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 05:23:31 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 2/7] nodejs: upgrade 20.13.0 -> 20.16.0
Date: Thu, 14 Nov 2024 13:23:23 +0000
Message-ID: <20241114132328.1340824-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241114132328.1340824-1-archana.polampalli@windriver.com>
References: <20241114132328.1340824-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3BY1mYnOa89Tl36z7GS9aIk8FZJm-0aO
X-Authority-Analysis: v=2.4 cv=Ke6AshYD c=1 sm=1 tr=0 ts=6735f9d6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=fZqHTnp-7S5Dpky0ff8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3BY1mYnOa89Tl36z7GS9aIk8FZJm-0aO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=749 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113817

From: Jason Schonberg <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_20.13.bb => nodejs-oe-cache-native_20.16.bb} | 0
 .../nodejs/{nodejs_20.13.0.bb => nodejs_20.16.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.13 => nodejs-oe-cache-20.16}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.13.bb => nodejs-oe-cache-native_20.16.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.13.0.bb => nodejs_20.16.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.13/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.16/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.13/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.16/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.16.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.16.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.13.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.13.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
index 25b59495e..3517fe6dc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.13.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "11d229fcad7e6e10f450301223c602043f021cda51259ffafc7e55e484b37dc7"
+SRC_URI[sha256sum] = "cd6c8fc3ff2606aadbc7155db6f7e77247d2d0065ac18e2f7f049095584b8b46"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


