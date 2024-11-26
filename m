Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5DBD5A6FC
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:22:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41300.1732609334332411051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10608d989f=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ6U2I6030784
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 00:22:14 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b79asbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 00:22:13 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 26 Nov 2024 00:22:11 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/2] redis: upgrade 7.2.4 -> 7.2.5
Date: Tue, 26 Nov 2024 08:21:49 +0000
Message-ID: <20241126082150.829120-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=67458535 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VlfZXiiP6vEA:10 a=7UKGVgRVAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=F7pGAyCFXEtAQ7mIUa0A:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GKPrXzj7w1bxa6y5sk7eD9G1e4e4YqXN
X-Proofpoint-ORIG-GUID: GKPrXzj7w1bxa6y5sk7eD9G1e4e4YqXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411260066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114069

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.4 => redis-7.2.5}/GNU_SOURCE-7.patch       | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.2.4 => redis-7.2.5}/init-redis-server        | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../redis/{redis-7.2.4 => redis-7.2.5}/oe-use-libc-malloc.patch | 0
 .../redis/{redis-7.2.4 => redis-7.2.5}/redis.conf               | 0
 .../redis/{redis-7.2.4 => redis-7.2.5}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.4.bb => redis_7.2.5.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.4 => redis-7.2.5}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.4.bb => redis_7.2.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.5/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.4/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.5/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.4.bb b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.4.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.5.bb
index 5d64e9ba78..44fb22bc5e 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59"
+SRC_URI[sha256sum] = "5981179706f8391f03be91d951acafaeda91af7fac56beffb2701963103e423d"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
-- 
2.40.0


