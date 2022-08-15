Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A36C25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 02:12:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12026.1660529528426040715
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k3PZH1KZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52262cb0b1=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27F26WDL021370
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:12:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=b0/EAjkj7ALaMHhyH7vcPC1gcfOEszK/D21ZK8JpSNE=;
 b=k3PZH1KZSg7pZCvrHhcgHQaSyijQb7CSHS+BQAK2IyYCeF50hTaFj32CUmtVjTYCVKV7
 VNgTKfu1kBV3cClyZJUNbqrEgH0TFZAcypGiGfR046BMs/2Eo2qBswjdEKrewN9v4JmK
 jkk+Qa/P7GX44Wn6enr62dh0QjLRazK7COL44K0XJkR/+Q9X+6ULIDU5rvvIy0F5+cZY
 BweM08YvsLrcdg/zAa/DsEV3x07JjgGjqItdEWI+8n9dGeNje2bgvK9Qlnijyc21bzpI
 UCrLaMzzGlKjlNpQSV4GHWWK766qCdj3NQLSZh7FmsVM3YsKo8IxlxV6kqrMks3+5KcA GQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx78395ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:12:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 14 Aug 2022 19:12:07 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 14 Aug 2022 19:12:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirtstone][master][meta-oe][PATCH V2] redis: fix do_patch fuzz
 warning
Date: Mon, 15 Aug 2022 10:12:05 +0800
Message-ID: <20220815021205.4118260-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: 
 <CAMKF1sphy2-znVeZBB6tE2x7w=nPXgOeZr7jx4p4AbuO7P2DQw@mail.gmail.com>
References: 
 <CAMKF1sphy2-znVeZBB6tE2x7w=nPXgOeZr7jx4p4AbuO7P2DQw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YgaVQ4AMC_Ue8pBj3ar61v6TB7JcSmpy
X-Proofpoint-GUID: YgaVQ4AMC_Ue8pBj3ar61v6TB7JcSmpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_01,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 02:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98233

From: Changqing Li <changqing.li@windriver.com>

Fix:
WARNING: lib32-redis-7.0.4-r0 do_patch: Fuzz detected:
Applying patch GNU_SOURCE.patch
patching file src/zmalloc.c
Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).

There are two version of redis, and need different GNU_SOURCE.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch}    | 0
 meta-oe/recipes-extended/redis/redis_7.0.4.bb                 | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch} (100%)

diff --git a/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch
rename to meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
index 993ff34b10..cde32e4147 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ffdd6c926faaece928cf9d9640132d2"
 DEPENDS = "readline lua ncurses"
 
-FILESPATH =. "${FILE_DIRNAME}/${PN}-7:"
+FILESPATH =. "${FILE_DIRNAME}/${BPN}-7:"
 
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE.patch \
+           file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
 SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
-- 
2.25.1


