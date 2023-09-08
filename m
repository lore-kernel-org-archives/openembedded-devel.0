Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37508EE57D2
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 06:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33957.1694154878287198137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 23:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jZJf+JHM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7615bc2663=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3885dfYf019287
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Sep 2023 23:34:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=99LCH
	DDUr7TB4T5lvJt+B6G7yNqcNbIXnA900Xkis1I=; b=jZJf+JHMClVfCeW4nGlkp
	W5naiSOLtWtv2nT9nEywltFgfmBjUP8pYuOlfuc7gmhhbmr9bUX0dq7CfGB+41YI
	yli337TjeKtvBQ4h8CI2GyqY5vpux+DSPTteqJc75Urzhpr8VU6A8V2QMsCN1+02
	qzuuPBI0Vq68NEQEiaykNTJ0d2w9SqH6zziFJEDU1nxrUgRldnLEQvGW8rSce52+
	X+WE1sYM8SLrzM8GA4iSAQy6JkULG8LzemOiirldNY5NfDkJhl1hJK3BGbDh+kZG
	eplzrNVa6YozJGfhvBbS4pkO0vagDVj0f8RhBp8GQ5zL+drZkNa93w9h0hkNR+ES
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b05806-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 23:34:37 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 23:34:32 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] redis: upgrade 7.0.12 -> 7.0.13
Date: Fri, 8 Sep 2023 06:34:24 +0000
Message-ID: <20230908063424.2058100-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: TmBvub-n4ws_RwSKhlUTbJxor9RQAwcK
X-Proofpoint-GUID: TmBvub-n4ws_RwSKhlUTbJxor9RQAwcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 06:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104797

This release has only security and bug fixes.

ChangeLog:
https://github.com/redis/redis/releases/tag/7.0.13

Security Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-41053

$ git log --oneline 7.0.12..7.0.13
49dbedb1d (tag: 7.0.13, origin/7.0) Redis 7.0.13
0f14d3279 Fix sort_ro get-keys function return wrong key number (#12522)
4d67bb6af do not call handleClientsBlockedOnKeys inside yielding command (#12459)
37599fe75 Ensure that the function load timeout is disabled during loading from RDB/AOF and on replicas. (#12451)
ea1bc6f62 Process loss of slot ownership in cluster bus (#12344)
646069a90 Skip test for sdsRemoveFreeSpace when mem_allocator is not jemalloc (#11878)

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.0.12 => redis-7.0.13}/GNU_SOURCE-7.patch     | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.0.12 => redis-7.0.13}/init-redis-server      | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../{redis-7.0.12 => redis-7.0.13}/oe-use-libc-malloc.patch     | 0
 .../redis/{redis-7.0.12 => redis-7.0.13}/redis.conf             | 0
 .../redis/{redis-7.0.12 => redis-7.0.13}/redis.service          | 0
 .../recipes-extended/redis/{redis_7.0.12.bb => redis_7.0.13.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.0.13}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.12.bb => redis_7.0.13.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.13/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.13/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.13/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.13/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.0.13/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.0.13/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.13/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.13/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf b/meta-oe/recipes-extended/redis/redis-7.0.13/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.0.13/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/redis.service b/meta-oe/recipes-extended/redis/redis-7.0.13/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.0.13/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.12.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.12.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 321b90dad..e88ab4ddf 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "9dd83d5b278bb2bf0e39bfeb75c3e8170024edbaf11ba13b7037b2945cf48ab7"
+SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.40.0


