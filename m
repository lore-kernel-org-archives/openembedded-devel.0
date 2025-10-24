Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A7ECCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 03:27:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1469.1761276429510097700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 20:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F+a4kGyV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23920ed3f1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O3R9rf1203066;
	Thu, 23 Oct 2025 20:27:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=VeXzH8E3JDR/uNe04+Ip
	JP4P6owFvFm99HXMng5dyJo=; b=F+a4kGyVfbxuANlHow3UuvMUYjRNXNRldKLt
	3VWOUkOGrFJHQMj7dmzK10TowzdAR+hX8UdkMx5vpW4qwqSFyRg1r5KWBKbScW/g
	9A+/9UlIPm6Px9h+UTsQVAkkJdu6vYnygi8SunmqCeXRMT4BrgqH9YHd9yJUTWSq
	+BwQveoRekMAbBPED36A5T09kIoSkohZgvWF4L3gSjuZ61XbHKmZQM+z0p8lowIh
	AaApfmwn8PBy6PEcye+lrzDQC1fud4xVjQTBqqUi33SbaQQQGKfC8/mge3UtSH3F
	hycdcHDtEV5ikyaCxeF3+W7o22u+S9JUiuEpFZWj4el2Q/jAxA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00gdqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 20:27:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 23 Oct 2025 20:27:08 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 23 Oct 2025 20:27:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-aiohttp: fix compiler failure on 32-bit arm
Date: Fri, 24 Oct 2025 11:27:07 +0800
Message-ID: <20251024032707.1406241-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDAyOCBTYWx0ZWRfX7NBFGHjwRruV
 AOJtkOTM+UfEKA2MvhA6HMLMhZQDp+eYz2gMfEDFvSEkBsCw1iXxZCUNU3NMqxIKUXptxlxa51p
 fUkPr05if3dmTAhfolaTMl3SnW9/GN7ERjbJBO/FuXB7VLn1+/EPb3sGCIbP86MDUAo188K9LUM
 2cswErPM+v1402aGfM3eD10TQOjn3YpiSk3U4/yhsj6uQD53dJqdoCuJwRNcQn2NhuClNq3wjwj
 YkqwN7Yz5MH2rePoqf3ZDfCOkB2IAG5hLfVLr6r+WFdEpbV14Oe8LTEGsDFW2oBwFCztsnC3RLd
 N/S+uiShgzQfQTCT55mqCAd0C4wSPvE43f9rwkz3gYAGsqMQEop0j/FsrmxXbGIKKkQUAXVktoH
 uR8QTEvdjeeIW7qY390yLAU/6xxpmA==
X-Proofpoint-ORIG-GUID: oagaM5J-2DMmlIWX16XdLwKjWCiugQ-q
X-Proofpoint-GUID: oagaM5J-2DMmlIWX16XdLwKjWCiugQ-q
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68faf20d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=a4Z68EzzzmZj8ZJYvSgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510240028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 03:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120943

Build 32bit python3-aiohttp failed on arm
...
vendor/llhttp/build/c/llhttp.c:2643:11: error: incompatible type for argument 1 of 'vandq_u16'
 2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           |
      |           uint8x16_t
...

Refer [1], add -flax-vector-conversions to 32bit arm compiler

[1] https://github.com/xmrig/xmrig/issues/3673

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index cb8aa96d00..6ca05d0596 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -21,3 +21,5 @@ RDEPENDS:${PN} = "\
     python3-yarl \
     python3-aiodns \
 "
+
+CFLAGS:append:arm = " -flax-vector-conversions"
-- 
2.34.1


