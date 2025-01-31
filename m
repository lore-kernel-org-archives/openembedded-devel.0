Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D055AC02195
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 17:22:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.24495.1738344160849772192
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 09:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41264e9b27=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VBQrhM021920
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 09:22:40 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf78gxwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 09:22:40 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 09:22:39 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 31 Jan 2025 09:22:38 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 4/7] nodejs: upgrade 20.16.0 -> 20.17.0
Date: Fri, 31 Jan 2025 17:22:27 +0000
Message-ID: <20250131172230.687050-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250131172230.687050-1-archana.polampalli@windriver.com>
References: <20250131172230.687050-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KLugDEFo c=1 sm=1 tr=0 ts=679d06e0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=-LCu6K_DAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=FmfWfhjdfKe8JZWfUtQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: z0jYZtUC9mR3r94w-fqZO_ot1XRip8pl
X-Proofpoint-GUID: z0jYZtUC9mR3r94w-fqZO_ot1XRip8pl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115204

From: "J. S" <schonm@gmail.com>

commit c1ddc60fd25456da07d8402c89157c4354fde5ac
Author: Jason Schonberg <schonm@gmail.com>
Date:   Wed Aug 21 17:40:03 2024 -0400

    License change - remove highlight.js
    https://github.com/nodejs/node/commit/1c5fe040a0a73b483cc3e3fef76efe2d1712205b

    Changelog :
    https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.md#20.17.0

nodejs: upgrade 20.16.0 -> 20.17.0
Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_20.16.bb => nodejs-oe-cache-native_20.17.bb} | 0
 .../nodejs/{nodejs_20.16.0.bb => nodejs_20.17.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.16 => nodejs-oe-cache-20.17}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.16.bb => nodejs-oe-cache-native_20.17.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.16.0.bb => nodejs_20.17.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.16/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.17/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.16/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.17/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.16.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.17.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.16.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.17.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
index 55a9843314..0c07915167 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cef54676c547a5bbab44aa8be3be9ef7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ab85b3bae451276a10919163bcc5b74"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "cd6c8fc3ff2606aadbc7155db6f7e77247d2d0065ac18e2f7f049095584b8b46"
+SRC_URI[sha256sum] = "9abf03ac23362c60387ebb633a516303637145cb3c177be3348b16880fd8b28c"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


