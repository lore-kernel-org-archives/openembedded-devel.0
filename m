Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89073CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:55:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8646.1761306916219004193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=noiFMfvQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2392a7d4df=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O5DSVl1375357
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:55:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5Yx+Z0UHknk/a+p6MWCn
	zCaA5JsWFJnoA9R2FzHsT3o=; b=noiFMfvQ5y0YvOCcQFalsU71+v1eyUrElAm1
	61RyJBJLEIWNyO3/30TepM94AN+pK+u5lQlWDOz0BUv1iznxTXqxQ1EeGvwC6Zcz
	P2iQZkPjPa9iHmzRdNcRJ8fBVDfJlG/oZ8OKJyKvNX71IJspxWwMYq/7rJICGsHp
	2ToeocwhUZnvKzcStctKaJ8iMPkb6Ti+klLDbz9dN35t7f7Ciok7HozqrOuWVTV+
	wQcqaBa8XVMkMSw/0vciwmvusdzL8k7/33/Wqws7yKJGWEAnMLy6UxPZel4HQnG5
	6P9v2yoTChL+5HmUGM6663GTR8uZ6gp3MoeiZspHRS4KI+8VvA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00gt88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:55:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 04:55:15 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 04:55:13 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] cjson: upgrade 1.7.18 -> 1.7.19
Date: Fri, 24 Oct 2025 17:25:09 +0530
Message-ID: <20251024115509.928018-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDEwNiBTYWx0ZWRfXzpfPXS+3dy1L
 AFz9mK2OEqdsOB2CS+7J1ESgFN6rvb+DtXdBj6Vnm1+ynd+ZW1EagKwbO3aLDGRpYq5dWg8VPCE
 4I5kwtOQfPicMxqLsSx5bsNSWnpDwkrqlyJhQaw43n7thCZgKmDsyPXzqsn5CEIVZDRvrN/QvzD
 i/4o9phypfYe5vxD8bxJOh70bE4gNb3eetco40YTC6YveD7C/O0CKu84r0THj97MQAXb5TLYf/j
 1OI55oLglS4K10NNx9OR/167XSFEn/+2Hj9OqNnI41nahHDtdm7g8i0GaPYmz/GYMUEwMGSdGWV
 n3n0299/1FaSqA2RdsliaRYNT/viWEok+dc1pQC/PQSLx1PUhjfXvmIVhHKiLjdZFWPCCTnt9gK
 1Ih3+Ti+BbCWibuy6JHLO0V0f5jbUg==
X-Proofpoint-ORIG-GUID: P3tY_qV5IZnuetCDsd8HFbTuqEIP4aYl
X-Proofpoint-GUID: P3tY_qV5IZnuetCDsd8HFbTuqEIP4aYl
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fb6923 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=AUd_NHdVAAAA:8 a=i--bMA7scPcvzODhH_cA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510240106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120953

From: Praveen Kumar <praveen.kumar@windriver.com>

This includes CVE-fix for CVE-2023-26819.

Removed CVE-2025-57052, as the issue was already resolved
in v1.7.19.

Changelog:
==========
https://github.com/DaveGamble/cJSON/blob/master/CHANGELOG.md

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../cjson/cjson/CVE-2025-57052.patch          | 33 -------------------
 .../{cjson_1.7.18.bb => cjson_1.7.19.bb}      |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (95%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
deleted file mode 100644
index ed3d4a7eba..0000000000
--- a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
-From: Lee <peteralfredlee@gmail.com>
-Date: Fri, 5 Sep 2025 14:53:20 +0800
-Subject: [PATCH] fix the incorrect check in decode_array_index_from_pointer
- (#957)
-
-this fixes CVE-2025-57052
-
-CVE: CVE-2025-57052
-Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa]
-
-(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
-Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
----
- cJSON_Utils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cJSON_Utils.c b/cJSON_Utils.c
-index 63651df..8fa24f8 100644
---- a/cJSON_Utils.c
-+++ b/cJSON_Utils.c
-@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(const unsigned char * const po
-         return 0;
-     }
- 
--    for (position = 0; (pointer[position] >= '0') && (pointer[0] <= '9'); position++)
-+    for (position = 0; (pointer[position] >= '0') && (pointer[position] <= '9'); position++)
-     {
-         parsed_index = (10 * parsed_index) + (size_t)(pointer[position] - '0');
- 
--- 
-2.44.1
-
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
similarity index 95%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index 67d536cf24..799eb119d6 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
-           file://CVE-2025-57052.patch \
          "
-SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
+SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


