Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C611ECCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:20:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8866.1761650399678738737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U/pFRf4m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3396db234c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA2C9c058167
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4iTejuqOV9qV3Pi8gp66
	OrN0ZkF2xqR3WzjnbtpeVM0=; b=U/pFRf4myrX6iwkxTXm8mowMmOqmGCDVvWPk
	zyN0Tp4JwiUMnCdc3bG1f05/tb31m4txC8jUlv455TfcggCGP9xNFiWGSX84DLpA
	d1bURKGVn1d1iiABFxa2BFmYMXdrd0Es6zuKBG5cAtdCt8k4Et1jA/IOKiK6SrdB
	UK1/gOsKD4vVT4pDGw9kR8uwpaPgkleqmOYcH0hNIibsCAibCut+vMMBjrAzYg1D
	irl9ppAsF7M1aNZBpBBjAZHfsiKEDC4wTzcH/Kn0IaJ56e8IBsSv9FyHASirwuA5
	tJJ2juEic3aAsQPdpx9qef7rNpTuXeubf+x+eX5rXCU0n65Z1g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5u38n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:19:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 04:19:57 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 04:19:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] nodejs: fix compile failed for 32 bit arm target
Date: Tue, 28 Oct 2025 19:19:56 +0800
Message-ID: <20251028111956.2903925-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zxHHczHOxeEfhE8o333hL5J0yCs2DVPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5NiBTYWx0ZWRfXyJ3rukozBXTp
 NtBaAww5sttQOeei20l7MN8FVW2yREJJOHc4RfWyRcGfXZAh4WcGG9NCs2fUmTVCaev/Bu6MxHq
 +vpCYodBFmSmb0uQxJrELzWBJA2QnZZiT1OaTcugLfn3CtBLbN+JmiyS19/L2mC+EfwI0CLRTu2
 vKEsSWFdkDSqqQP3so9/jAGpaZxkehSjEk1q6SHzrRapI2HbZR+cHFPF5/v0hL6v4LCyJdFp6GF
 7ID3AmHndTH/EEflxum9EZDDjvqJowYUEyPTE85C0bQ+i4lHKyuAp66kz9YZrNXvgcjNzW+04Go
 pWn9Kv1hLZuxEQ/UY7B8gYwv3B2CNqx7O5WZ6qjBSPZlhm9MGmLge1tvl52VvNxBwhePWPuZnmn
 cfYG06g5soc0BMzWD0h9ntnGCIngUA==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=6900a6de cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=QthPNiG_7xnQtsAgc3IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zxHHczHOxeEfhE8o333hL5J0yCs2DVPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121077

Build failed for 32 bit arm target

$ echo 'MACHINE = "qemuarm"' >> conf/local.conf
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


