Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C469C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:50:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.927.1691085019848236584
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kQyniXfE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7579ef249c=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 373AxOea005206
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Aug 2023 17:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gJeMA
	xiYStEt6hEF8npm+OmTHiBUJIMjdlX2YWCc/WM=; b=kQyniXfE+EO+dgwG7SQBD
	HbinUFqC18Rpl3bGAgAh9jKZNVmqDfm+rX3rY3K1fw+4UTlah0kr/iQ4yv2EqQ9m
	i0YCM8CKrRWY9DOZ8OqWMTjfL2Dw8Zgrme76Ox3EMEdWYmjGH4FG6W72BFMOt2vw
	pDHLTLWbxHwFaZVCSP59FERRBVtEgSbYRX3lLFKPfXOSsDUQUD3ZpfcSRMOI7JlU
	PQ8c7jM0gVZP49rJgf2S93H0zoJI9uQ+LrxULa+9Bld8bYKOlhrkES8qBahKBf8P
	LQJgfatxtQ+D2qat/FdJ6lCNZeI6THdGPm/2CsR46xkAlxKI9ghzolmIHNTNYt1I
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx54ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 17:50:18 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 10:50:16 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] redis: upgrade 7.0.11 -> 7.0.12
Date: Thu, 3 Aug 2023 17:49:59 +0000
Message-ID: <20230803174959.561859-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ubCf_-IRe4r6xq6-3wTT9zWc1-8gYHUX
X-Proofpoint-ORIG-GUID: ubCf_-IRe4r6xq6-3wTT9zWc1-8gYHUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_19,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030160
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 17:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104222

This release has only security and bug fixes.

ChangeLog:
https://github.com/redis/redis/releases/tag/7.0.12

Security Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-36824
https://nvd.nist.gov/vuln/detail/CVE-2022-24834

$ git log --oneline 7.0.11..7.0.12
8e73f9d34 (tag: 7.0.12, origin/7.0) Redis 7.0.12
f90ecfb1f Fix compile errors when building with gcc-12 or clang (partial #12035)
bd1dac0c6 Fix possible crash in command getkeys  (#12380)
25f610fc2 Use Reservoir Sampling for random sampling of dict, and fix hang during fork (#12276)
eb64a97d3 Add missing return on -UNKILLABLE sent by master case (#12277)
2ba8de9d5 Fix WAIT for clients being blocked in a module command (#12220)
1d2839a83 Fix memory leak when RM_Call's RUN_AS_USER fails (#12158)
c340fd5a3 Prevent repetitive backlog trimming (#12155)
88682ca30 Free backlog only if rsi is invalid when master reboot (#12088)
f6a7c9f9e Lua cjson and cmsgpack integer overflow issues (CVE-2022-24834)

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/GNU_SOURCE-7.patch     | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/init-redis-server      | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../{redis-7.0.11 => redis-7.0.12}/oe-use-libc-malloc.patch     | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/redis.conf             | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/redis.service          | 0
 .../recipes-extended/redis/{redis_7.0.11.bb => redis_7.0.12.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.11.bb => redis_7.0.12.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/redis.conf b/meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/redis.service b/meta-oe/recipes-extended/redis/redis-7.0.12/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.0.12/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.11.bb b/meta-oe/recipes-extended/redis/redis_7.0.12.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.11.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.12.bb
index 0fdbfe94bd..321b90dadf 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.12.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3"
+SRC_URI[sha256sum] = "9dd83d5b278bb2bf0e39bfeb75c3e8170024edbaf11ba13b7037b2945cf48ab7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.40.0


