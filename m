Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF9CC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 06:52:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28901.1691391167636402478
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Aug 2023 23:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hmdMWERa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7583208e38=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37760P01027130
	for <openembedded-devel@lists.openembedded.org>; Sun, 6 Aug 2023 23:52:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=azLKF
	UW3YrIu5KEsGV9NDbnFOkUG1l/flbcblngr9W0=; b=hmdMWERar8hjank4mEkDN
	K+h2MSbGw6+3Hqa2faPSwzq73yPzrEjL+4rixfAxVGr0G9TmbUwsvWgo77Hw1btv
	CWdc5OCHM8db3v55Uh8UGshyIVDxxYx3F0ht/4glNHHepqZxBDhfpaCuuQ8imEoJ
	AN+hu+rDOImq0w897u/jspHh9NNA+AVzIUngpRINjVrtOJGYyQacNBM/rjLnZ67c
	PhIzMemt/SUVwyTF3Ybv75nRI+tHkxN0RIyc4I4KNt079Fg70eYJzQ3ubN2+CFNI
	5X2p4nw619yBLrXNvZuL+95iDnEPj+8CoE4L+JbuYu9e0iCJjAlU+XpIX6WZGG2X
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9hq0980b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 06 Aug 2023 23:52:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 23:52:46 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 23:52:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][meta-oe][PATCH 1/2] redis: upgrade 7.0.11 -> 7.0.12
Date: Mon, 7 Aug 2023 14:52:43 +0800
Message-ID: <20230807065244.2825586-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wLaorav12KKM9h47N373FW0PWGU5uJxT
X-Proofpoint-GUID: wLaorav12KKM9h47N373FW0PWGU5uJxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_05,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308070063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 06:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104298

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://github.com/redis/redis/releases/tag/7.0.12

Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
2.25.1


