Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C1BCCF9E5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 05:15:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20927.1761801308769592536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 22:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ifXsFkk/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=339869172a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U4o2Tu097681
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CQT3RehLbUyx7bNBAUbv
	AsjdszvyADsNb5a3fdzX1IU=; b=ifXsFkk/q5m5ouUIUEdaxuBV71NLVY3JDqWT
	vYArNGlHfWXGDmtiY5Nqx9onP8q6x8C+5uHcPRwczpn/i1nQlSbCeva3OiIYUkgY
	MdCfV06xlAf9R0jxc9W6klLJq9CWxFjIb9s4rJj5V3pnSr2dqkWk0XTqqIK5tHdP
	i5yOAOjX2dlYJZp3zLUKH06E3aqKY52upVFHOqlSp56pL1LMQ7BGAGpnik0Y9OGM
	CmcArjKXL4kn4kKhl/U8dkfpOxJ8hHSxMEEw0+fQG9yX1/gaaSwyIkxjlLIrQzKi
	sRVVJganB010GiivqsYgxtfXybeIUy8FYR7ygOLLc995n19Hng==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w7hg5t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 29 Oct 2025 22:15:06 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 29 Oct 2025 22:15:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3 1/2] nodejs: fix gcc compile failed for 32 bit arm target
Date: Thu, 30 Oct 2025 13:15:04 +0800
Message-ID: <20251030051505.1693030-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA0MCBTYWx0ZWRfX/vdNiIRN+FR8
 r/zVlwHP2tJ382ktMU4BU7i41k8ilxh190GMsF/SplNzDHO0e8jrfHbFK6HZ8o4Cv2adTYGx3b5
 bSjss8P+ociMQEORCPwgRTisQK9DeKTPT7f3Tz1j8Ni8WV6eBHnRoTAK4H0kw1qB+Qm3D4mpK+K
 s2Fvy6yZWNMFHOEq5mNROKO9fkeodNJV4FKoe1UaLnQ+QBGRsxpRRPA5Yq46DtvxD4lDVQvgq0l
 dB7eKyxRE60dHffWj7iEJukakwmsPjpHASaVtzBjBH4ySYvwRBRys9dXvGgpbo5zfaZ7TAE0/jk
 WHHazi/o+0MxPaAUBK8z5ZIswLz+pQJoIlvJQgkewy2vsU6JHgHGT8ZKlaxEG/Ds+Ubvk/cTJ/f
 11oWSw8M9RCMcjTfucTL4LBrRjeRZw==
X-Proofpoint-ORIG-GUID: xTxLBqfUOZJjy4fHXoSA2HoJ6sBdThqc
X-Authority-Analysis: v=2.4 cv=UatciaSN c=1 sm=1 tr=0 ts=6902f45b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=QthPNiG_7xnQtsAgc3IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xTxLBqfUOZJjy4fHXoSA2HoJ6sBdThqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121188

Use gcc to compile failed for 32 bit arm target

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
 meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
index 0cba529673..ca4001a04c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
@@ -48,6 +48,10 @@ CVE_PRODUCT += "node.js"
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
+# Use '-flax-vector-conversions' to permit conversions between vectors
+# with differing element types or numbers of subparts
+CFLAGS:append:toolchain-gcc:arm = " -flax-vector-conversions"
+
 def map_nodejs_arch(a, d):
     import re
 
-- 
2.34.1


