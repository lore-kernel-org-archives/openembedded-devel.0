Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6A8CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 08:12:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26861.1761552747617129519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gF5GOFA/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=239549c8ef=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R5Nd60015400
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 01:12:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zx0gAHtadCZTCmXzelU7
	MQlc1tisghuBqdC90EJXiCU=; b=gF5GOFA/nA1h6OZK41gVn6idYzPoiqfVb2qr
	U4UD/Dio5U/smQLPgZib16aFqDpYoFqHaMayZb48zVIfwjAUKXeMS2s5/ujpIzER
	W13kNwZZpfKRo7OnFYchejNp+mSlxq7YUf9L50OoOYk5RQd7azg/A3lpM0vl7ZSA
	tC1Jgqgtf7rEpwIyLoI5nrYo6xhuNWrjyE9qcwG0/T9ebqrTWrv/kOYBvAI0cDO1
	Ykp/Tbe0wXObMfX7xL8b9qWy07G9nw9KZIRnCgL7JWf2nGU+Ro5tk0LiqP5gByve
	P2DhBfg9Gk69CgCuLVxS+cZXH9dOKk+tZ23NbxY80KoJNMEg2w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e19pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 01:12:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 01:12:26 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 01:12:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] layer.conf: add bpftool into NON_MULTILIB_RECIPES
Date: Mon, 27 Oct 2025 16:12:25 +0800
Message-ID: <20251027081225.717064-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NX272VG43foYQf2ZyALOtPL3eC350e-Q
X-Proofpoint-GUID: NX272VG43foYQf2ZyALOtPL3eC350e-Q
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=68ff296a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=dVEjPHIlO9m6FEYvwfgA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA3NCBTYWx0ZWRfX5o+zv6SfX2N1
 GIo+EwzQ10UhMLt2XFNvsRBe2SMemwf+ghZYdkuk1lMCeTBjAbMlMVBBmHn6BYnbLqRQG0rN8yy
 88zgKImNusyQU3GxVfQGzo8S1FFzYXK2Uvehy6gyI745z517XNbPCY9NhKgR+hDVma73fGRGGxQ
 hO86bxSXl6LLcfftKJlFJBfDq40YlMv6uTtl4kq1QKuPV2YhaSG1kAQvty7rZ++JQerA6EZnbXV
 h4HYjvcCVD23M8vngdBVSISqpNwTStusIEa+Ybjnh2EEvtPD01OMepMOBjA1qMGkdKHZnT41P5P
 0G+CFc4fRGQMQ1Qstgcf94UnWA1SW3uVuXY60YL8HnXqdhwkDANLnWLgIuR8pxHNUi44vQX2f/C
 nmBpchg4EUuNO9LlwrJ4L+6VfoSd2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 08:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121025

From: Changqing Li <changqing.li@windriver.com>

Here is the setting in bpftool recipe:
COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"

bpftool only support 64 bit arch, so add it into NON_MULTILIB_RECIPES
to avoid expanding lib32- variant

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 56aea73b15..851219765e 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -118,7 +118,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace"
+NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace bpftool"
 
 NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
 NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
-- 
2.34.1


