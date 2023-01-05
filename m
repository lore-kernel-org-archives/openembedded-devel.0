Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DE0C54E76
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 00:52:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2019.1672879942162462327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 16:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BBUNnQP2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=036985b30f=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3050T5Vg007819
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Jan 2023 00:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=wHIRx98gtfy5W6VEsOJ22oGPzsoto+SZ1v5uImK4g2Q=;
 b=BBUNnQP28vM/yCt/dkczogvde+eaqItyVsA2T7uqU2E/3fnPGBzwnEOYSP+vaqRvw8l8
 Tz0MQd+zqExJKt5A+K3SWp+irdoXeVfNWcRfb4EnEQisdSYfGp22BZ7D2+n9o3n4M1Qa
 HI5lssCmfbV1Udfr+xxfdSOf64drDdtLJnmzc9u5nbi369P7S3HRTqlQQuxmr+r1bWnw
 dDyuyuHenJPDmEAc+JKRGh8FSxiMT8C41QlSSfRlc4azf1ea9IFH2W6eJtkpqPqUu1MY
 L5Dv8tSAToiTwAbhNCDZI8SP8X/Mw4RbkGFpWvTMD8SH9Q2494gGXPCTafP0sCvO3aEC 2g== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2ju4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 00:52:21 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 16:52:19 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 16:52:19 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][kirkstone][meta-oe][PATCH V2 2/2] redis: 7.0.5 -> 7.0.7
Date: Thu, 5 Jan 2023 08:52:17 +0800
Message-ID: <20230105005217.1185503-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105005217.1185503-1-changqing.li@windriver.com>
References: <20230105005217.1185503-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Kp-yVIK-AxOJuK5E9ut4MXXpJzx37L1e
X-Proofpoint-GUID: Kp-yVIK-AxOJuK5E9ut4MXXpJzx37L1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=968 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 00:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100405

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...006-Define-correct-gregs-for-RISCV32.patch | 20 ++++++++++---------
 .../redis/{redis_7.0.5.bb => redis_7.0.7.bb}  |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.5.bb => redis_7.0.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
index 01f8421811..385b0aeed0 100644
--- a/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From f26a978c638bcbc621669dce0ab89e43af42af98 Mon Sep 17 00:00:00 2001
+From b6b2c652abfa98093401b232baca8719c50cadf4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -6,18 +6,17 @@ Subject: [PATCH] Define correct gregs for RISCV32
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Updated patch for 6.2.1
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
+Updated patch for 6.2.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index 2da2c5d..1d778fa 100644
+index ebda858..90bc450 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1116,7 +1116,9 @@ static void *getMcontextEip(ucontext_t *uc) {
+@@ -1168,7 +1168,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -25,10 +24,10 @@ index 2da2c5d..1d778fa 100644
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
 +    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1298,8 +1300,28 @@ void logRegisters(ucontext_t *uc) {
+     GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
+@@ -1350,8 +1352,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -58,3 +57,6 @@ index 2da2c5d..1d778fa 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.5.bb b/meta-oe/recipes-extended/redis/redis_7.0.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.5.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.7.bb
index 7ed1519224..58055166cc 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.7.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3"
+SRC_URI[sha256sum] = "8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


