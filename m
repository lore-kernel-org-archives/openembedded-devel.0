Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B841CE7AF1
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 03:12:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6455.1695870773089910432
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Op0npaAB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=763557797b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38S2PZFt026694
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 03:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=2pCsx
	lb/vhWKdXVqAID8obHYlMvBoHRIyc6neFXRRLE=; b=Op0npaABaMllgXcIUjPUM
	5B3mAKLi0TfgU57EiLLhexqV11IcpFwGacVnmT2Pnbq7Dl97CK/ufyzwOkSx6Wdi
	Gtnm8VsbnSTcMI41wnAOd2t1YtGAV4rrKkybQBQxxPPCO1VzncZbhhtaqEtLgP2z
	Yq+e3SVKQmXUJov2pN15P+myJSe+78+51aH8NsgJdyOsgzHxZFFen9XKzW7mBx8P
	xHWz6v3O+/0UQDeVcDYbI6Azi/ns0DnvwGtg+J5B2i3HQNZzK4Dhrp/GRceVsZp8
	P/uKmwbhN25UZhkUAkpaF45Wl+MMubs/u32GxLFydr6N4ExgpvO2txAktc38MjuG
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x4pbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 03:12:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 20:12:50 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 20:12:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][PATCH] redis: upgrade 7.0.12 -> 7.0.13
Date: Thu, 28 Sep 2023 11:12:49 +0800
Message-ID: <20230928031249.759353-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NyTcwQMGkkVYauVEYY2mXVNRkwXOPumn
X-Proofpoint-GUID: NyTcwQMGkkVYauVEYY2mXVNRkwXOPumn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_17,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309280027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 03:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105214

From: Changqing Li <changqing.li@windriver.com>

Refer [1], include an urgency SECURITY fix and some bug fixes

[1] https://github.com/redis/redis/releases/tag/7.0.13

Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
index 321b90dadf..e88ab4ddf5 100644
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
2.25.1


