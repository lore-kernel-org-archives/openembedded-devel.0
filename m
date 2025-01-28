Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DD7C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 09:00:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13574.1738054817617781126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 01:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3123582112=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6mCsg004787
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 09:00:16 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny707m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 09:00:01 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 28 Jan 2025 00:59:58 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] redis: upgrade 7.2.6 -> 7.2.7
Date: Tue, 28 Jan 2025 08:59:35 +0000
Message-ID: <20250128085935.1006079-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: rssqo6nwgP2yzoHz1GioOIVYwUD_Cqhv
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=67989c91 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Mfa7FrdpKmAY6cI46FIA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rssqo6nwgP2yzoHz1GioOIVYwUD_Cqhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501280069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 09:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115115

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 6d076e3131..2f5e45ca0c 100644
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


