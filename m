Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6494EC02182
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 02:51:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3398.1737687092496426101
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 18:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311926d4d5=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O1flnm029894
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 18:51:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqg0teg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 18:51:31 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 23 Jan 2025 18:51:29 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] redis: upgrade 7.2.6 -> 7.2.7
Date: Fri, 24 Jan 2025 02:51:08 +0000
Message-ID: <20250124025108.3446552-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 8VazGzbtwoNxxlkuSVAjNpYu_H6x8ysl
X-Authority-Analysis: v=2.4 cv=Kue32XWN c=1 sm=1 tr=0 ts=67930033 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=Mfa7FrdpKmAY6cI46FIA:9
 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8VazGzbtwoNxxlkuSVAjNpYu_H6x8ysl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501240019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115045

From: Divya Chellam <divya.chellam@windriver.com>

ChangeLog:
https://github.com/redis/redis/releases/tag/7.2.7

Upgrade urgency SECURITY: See security fixes below.

Security fixes
====================
* (CVE-2024-46981) Lua script commands may lead to remote code execution
* (CVE-2024-51741) Denial-of-service due to malformed ACL selectors

Bug fixes
====================
* #13380 Possible crash due to OOM panic on invalid command
* #13338 Streams: XINFO lag field is wrong when tombstone is after the last_id of the consume group
* #13473 Streams: XTRIM does not update the maximal tombstone, leading to an incorrect lag
* #13311 Cluster: crash due to unblocking client during slot migration
* #13443 Cluster: crash when loading cluster config
* #13422 Cluster: CLUSTER SHARDS returns empty array
* #13465 Cluster: incompatibility with older node versions

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.6 => redis-7.2.7}/init-redis-server        | 0
 .../redis/{redis-7.2.6 => redis-7.2.7}/redis.conf               | 0
 .../redis/{redis-7.2.6 => redis-7.2.7}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.6.bb => redis_7.2.7.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.6 => redis-7.2.7}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.6.bb => redis_7.2.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.7/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.7/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.7/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.7/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.7/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.7/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.7/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.7/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.7/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.7/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.7/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.7/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.7/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.7/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.7/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.7/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.6/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.7/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.6/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.7/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.6.bb b/meta-oe/recipes-extended/redis/redis_7.2.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.6.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.7.bb
index b52381c7aa..4f768acd1d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "fb10d67a2fe2b4556f6cb840064dd6e6e3175ce8ca035f0726990ec2da9f3d0e"
+SRC_URI[sha256sum] = "72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
-- 
2.40.0


