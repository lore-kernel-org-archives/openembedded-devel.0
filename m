Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703FCC46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 09:22:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.60079.1672737726351403963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 01:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UST2HUis;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0367bd8ea5=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3039GXo2026296
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Jan 2023 09:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=q4kWxXNz1XgnIHZznfu4KE/My7zfQssGUaVwFgpMBDY=;
 b=UST2HUis3vVf3oCLsCnh2/r6hJPLNWaglWrWDtsNrrHI9VoS1RSI3cTDpKiwe/PWf9yg
 xhBna3AUnN33Ri+MNHizTxl1rLAi4vG3GDBpOF3rxjsDJFrecXgPL0mLj26XKMLRwGaY
 1uy/SJzsJ07Q8Tq4F/eDkhy+ksQCm8FEStEFRrmPhSe+fPfr6tEreP8GvflyMCPdGiZx
 cwvE7kG1Yw5AhIwpF7q+o3RLQUwh8oeV708oE6YxQI3y0NeTuqApOOmsQAxFYvppRazI
 AoAxrhQXPWyJ4UqHB6ZujKafWG9dQRoUTFqAwzUOXViBwDo9SEC+AAFNl2KjnV5mGyxn Dg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtc29shhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 09:22:05 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 01:22:04 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 3 Jan 2023 01:22:03 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] redis: 6.2.7 -> 6.2.8
Date: Tue, 3 Jan 2023 17:22:01 +0800
Message-ID: <20230103092202.2952751-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CzcaVWGtMWw7B_sVAMuKr4613d33txDO
X-Proofpoint-ORIG-GUID: CzcaVWGtMWw7B_sVAMuKr4613d33txDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=857 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301030082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 09:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100360

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0006-Define-correct-gregs-for-RISCV32.patch   | 15 +++++++++------
 .../redis/{redis_6.2.7.bb => redis_6.2.8.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index b2d1a32eda..9d7e502717 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 6134b471c35df826ccb41aab9a47e5c89e15a0c4 Mon Sep 17 00:00:00 2001
+From 26bd72f3b8de22e5036d86e6c79f815853b83473 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -13,10 +13,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index e7fec29..5abb404 100644
+index 5318c14..8c21b47 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1039,7 +1039,9 @@ static void *getMcontextEip(ucontext_t *uc) {
+@@ -1055,7 +1055,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -24,10 +24,10 @@ index e7fec29..5abb404 100644
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
 +    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1206,8 +1208,28 @@ void logRegisters(ucontext_t *uc) {
+     GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
+@@ -1222,8 +1224,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,3 +57,6 @@ index e7fec29..5abb404 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.7.bb b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.7.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.8.bb
index 7f922a4e0f..02ee19fb7d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319"
+SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


