Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0C3C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 17:22:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24785.1738344167383580156
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 09:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41264e9b27=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VEkco6011511
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 17:22:46 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf780xq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 17:22:46 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 09:22:45 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 31 Jan 2025 09:22:44 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 7/7] modejs: upgrade 20.18.0 -> 20.18.2
Date: Fri, 31 Jan 2025 17:22:30 +0000
Message-ID: <20250131172230.687050-7-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250131172230.687050-1-archana.polampalli@windriver.com>
References: <20250131172230.687050-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JOrBs9Kb c=1 sm=1 tr=0 ts=679d06e6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=5UDMwDddAManc0QxI4IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jzYBgUwU_S6RzSlqlAklJ40lpkEuFOZs
X-Proofpoint-GUID: jzYBgUwU_S6RzSlqlAklJ40lpkEuFOZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=985 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 17:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115207

From: Archana Polampalli <archana.polampalli@windriver.com>

Below list of CVEs are addressed in this release
CVE-2025-23083
CVE-2025-23084
CVE-2025-23085
CVE-2025-22150

Changelog:
https://github.com/nodejs/node/releases/tag/v20.18.2
https://github.com/nodejs/node/releases/tag/v20.18.1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/{nodejs_20.18.0.bb => nodejs_20.18.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.18.0.bb => nodejs_20.18.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index f937e298e4..1f45c3ec66 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "7d9433e91fd88d82ba8de86e711ec41907638e227993d22e95126b02f6cd714a"
+SRC_URI[sha256sum] = "69bf81b70f3a95ae0763459f02860c282d7e3a47567c8afaf126cc778176a882"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


