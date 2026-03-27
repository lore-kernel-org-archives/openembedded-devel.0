Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8949310ED658
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 10:17:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68661.1774606632537040337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 03:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XVqail1w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7546279899=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R8AJYA1037234
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 10:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UImI03g7G72AT2FwLNht
	taV3xyO5y/8b7ztKmNLV0vA=; b=XVqail1wIhWGq7r5yf7isWdHpDzPYuEgPdc1
	147a2gDVC/OWXshOoE/7dDKFvUSqbW9OkOYG5GDELdt7xMcEgNw312+4n7QBVSQn
	azY/Dr82dp7x2fT98E2M7oX5K6DEVtwBwOM2dylOXcEhW4qTDuprGnj5imEbm4Zd
	qDi06LlR9byCUn3HcWQIV5JBZw6TYhE1cqp+YGGCJd4it3cz+buhBOZBPRar2Vbv
	v69m4uQVED/FBidLnPqBA335SvHo0jDy3Wng0ghKUHN7yMyJNZ/sjbs63rttzdnk
	60xP6mOm8iJOcRqCKy8olTZ/l/PUgzBmE+CE9e0PAU5FMeOslA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d5p52g3xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 10:17:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 27 Mar 2026 03:17:10 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 27 Mar 2026 03:17:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ostree: upgrade 2024.10 -> 2025.7
Date: Fri, 27 Mar 2026 18:17:08 +0800
Message-ID: <20260327101708.2866358-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: G9Kkf44KFbKnvIy_Iigwu_02WoZd95tL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfXzB919pVIx6wh
 J7EfuVH+jHENsNg0Y7wewrYKbkPCopsLxYFcho7oAXEwJ3Y7Ukfney/9WPBHf9hD0bl9uqZWXVt
 y/lYBEw0UdSxWZVlz0PxEiGw4REjN7LcealEpX0XfTnvAoDAvUev3uK2BUpuYXhzy/mnJ5qK6zx
 4mUSLiNG1zpcNI25VyjI4Ux/yIEC7Nzmi8KplqtKJWS1SergL+0wIYYE5TaZFlroikeYn0eiU/u
 F033yahv72BukB90jyj7g1rn3PdoQW7bVxtmbcmkGva4BFKc9OeJcC1S4PlQK+2q4yyh7QRLgps
 hDmaKgEKN65Y217ckBYhX/yAQNwbzPakdz06jp6oQbQaZrJQFN+JEfK7fUGEbBqDvJ7NrwQzOOJ
 saLptPoDSpJSO9++DNCO40uxu9Pln+5hOzBdrVQOWrpdlD4O2KeymUlKdmb0RMjhYI1pbmUDcgV
 uqIfIZ5lYQrxom5H1cg==
X-Authority-Analysis: v=2.4 cv=FeM6BZ+6 c=1 sm=1 tr=0 ts=69c65927 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=89zn5W2gAAAA:20 a=t7CeM3EgAAAA:8
 a=2NPxMYO_cm4uxRP3v5QA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: G9Kkf44KFbKnvIy_Iigwu_02WoZd95tL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 10:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125786

Due to upstream commit [1], drop ostree-finalize-staged.path

[1] https://github.com/ostreedev/ostree/commit/2b9912e9f9210a3fa8396485a91224620b2138bc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ostree/{ostree_2024.10.bb => ostree_2025.7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.10.bb => ostree_2025.7.bb} (97%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb b/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
similarity index 97%
rename from meta-oe/recipes-extended/ostree/ostree_2024.10.bb
rename to meta-oe/recipes-extended/ostree/ostree_2025.7.bb
index 1e9d47643a..764daa8e37 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "54e3387dee1ff16031a0679aca2b60da90ab7f4a26c211822333c7f23000abee"
+SRC_URI[sha256sum] = "af8d080b9585e7fd1faba8f022967e1c268ae62e20ecf32ee7b364c1e307570b"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
@@ -212,7 +212,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-localedata-en-us"
 
 RRECOMMENDS:${PN}:append:class-target = " kernel-module-overlay"
 
-SYSTEMD_SERVICE:${PN} = "ostree-remount.service ostree-finalize-staged.path"
+SYSTEMD_SERVICE:${PN} = "ostree-remount.service"
 SYSTEMD_SERVICE:${PN}-switchroot = "ostree-prepare-root.service"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


