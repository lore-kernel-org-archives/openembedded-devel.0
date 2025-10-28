Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0409CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 05:48:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5242.1761630479193824395
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 22:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PwI/xRRY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2396e7fd64=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S5KDOq2402151
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 22:47:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2AhnRSdCPryt9xIcFAbI
	YP2uthEEUXPx1NZKhSnvdcM=; b=PwI/xRRYyrJDvuh32UuXIBlxf4I+ysmMSFQo
	HPWHeT1mIV2eE+Kr2uL3ucsyXsU5uUyIfoBP9iZF3pcRbfl46WCawl4PiTd/Wc80
	WfjKGpZcygwPUI6qLhcz2xlPzZVewgh8IMRi0XTZbw/8GnpF8BOJfRMYhrF/ZAO9
	4nkS1/F/HR8AL4H2rBkOHG0NPPr55SwGqAKFPUyFmvPZxIk3AtZMselK6iTI/uZ8
	sgbFOKzT3qBpcfZkGFNElMKqHoqVEsdELX87lIIBvzNjZflNXA0w4fnNJKSO4B+1
	Ad3NL6ore6JutXeGSa5wygD+QyPsjxCKKJ/E3fWcjNULifVuJg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e2h8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 22:47:58 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 22:47:58 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 22:47:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nodejs: fix compile failed for 32 bit arm target
Date: Tue, 28 Oct 2025 13:47:56 +0800
Message-ID: <20251028054756.2113752-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ao4RqqnYKtgUzybb1FT6ir23Yf8T7L44
X-Proofpoint-GUID: Ao4RqqnYKtgUzybb1FT6ir23Yf8T7L44
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=6900590e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=QthPNiG_7xnQtsAgc3IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0OCBTYWx0ZWRfX6CmVRGYYashZ
 rAtovmI1KW0Jf7NE/STX0DWKuh5eLJb7hl+hIbJPbkGAC9a+QpCSDAAJP5DsT/3R4NrdKg6A1zB
 9c52Zs+OlXX8b5lqHewe4mEKgNEFPJbFWBzm0hQ39UsaiFbFFyW00mnCCmCO1mNtx+kpoBPKOgw
 F3AHK5aIRKNnIq0T0uJwSxj/tphvOSPVLPPpNenZsYQhvDQYlbly0cjJfpAFXAk1QgaTE7vh8U2
 ji/eojCBbsJxtfdG8qx3764kk+YxLWogwt2c2Uq2C2a61aWFDwEaicEa57HesHysRngAZ1zIwau
 c40qtgctqEPcqrd+GK8FAgKzDtrig7ojaMi0qgISLe7VUHGBPCn7Tb8a+WTBkpGGyYVAh8jiDvb
 BrRKC+OrUuwQo7SzIk1dGZRF+X54ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 05:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121063

When debug build is enabled, build failed for 32 bit arm target

$ echo 'MACHINE = "qemuarm"' >> conf/local.conf
$ echo 'DEBUG_BUILD = "1"  >> conf/local.conf
$ bitbake nodejs
...
 2645 |         );
      |         ^
../deps/llhttp/src/llhttp.c:2643:11: error: incompatible type for argument 1 of 'vandq_u16'
 2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           |
      |           uint8x16_t
...

Use '-flax-vector-conversions' to permit conversions between vectors
with differing element types or numbers of subparts

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
index 6d1a364be0..7a784bf7f2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
@@ -48,6 +48,10 @@ CVE_PRODUCT += "node.js"
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
+# Use '-flax-vector-conversions' to permit conversions between vectors
+# with differing element types or numbers of subparts
+CFLAGS:append:arm = " -flax-vector-conversions"
+
 def map_nodejs_arch(a, d):
     import re
 
-- 
2.34.1


