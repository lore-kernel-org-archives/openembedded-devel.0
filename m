Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B640C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 01:22:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.22999.1722993744936503445
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 18:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U7uD1wCg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722993745; x=1754529745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=P19bvuN/fTTBHqO7vUWPvq83ANAQ8h8M4ziVEo9pG7M=;
  b=U7uD1wCg3syL8EJsnAovDkdFqmg1oumct0r5huaky/ba/+b7ZLgmtSth
   Bdt5P1kkzvY2uettonyszHHPDIyhxkz79LStWlAG+XXx8XPHStpamUPFm
   Ae2/aXeSnMyzqfCh/+BH02KkZFX7aovKy5jMBMVIm+7y1csWFyfdz2scm
   rFwEALJqAyCFli7AYiut7i7sb2big0k065BA2dBqe+D4kxlZOGiA7nSF5
   +YDp8cWszCUU3jqMSFsbn41CjDBoJlS1KxXrMuTKMcYb3TPwgc4F1I+Ij
   tsmbOtIX/NQ/7HDziJ/lvtEF8D0ucYT6M6Kquy8opVjoIcCQcqS2sGxaI
   w==;
X-CSE-ConnectionGUID: hs4J692YTr+Neg/jQI5pDA==
X-CSE-MsgGUID: vJ+2qfqeQDyRWWNCEpLWyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="169973946"
X-IronPort-AV: E=Sophos;i="6.09,268,1716217200"; 
   d="scan'208";a="169973946"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 10:22:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 95373C68E1
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Aug 2024 10:22:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5C2BCFBD2
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Aug 2024 10:22:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EB181EBBDF
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Aug 2024 10:22:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED8731A0002;
	Wed,  7 Aug 2024 09:22:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] picocom: upgrade 2023-04 -> 2024
Date: Wed,  7 Aug 2024 09:22:05 +0800
Message-Id: <1722993725-6061-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722993725-6061-1-git-send-email-wangmy@fujitsu.com>
References: <1722993725-6061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28580.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28580.004
X-TMASE-Result: 10-1.219500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLP85tlrdTfE+wAaNLqXHEquce7gFxhKa2YkAyCbA7KV7KeTtOdjMy6s0B
	voFssJgU6ipv+KnW5/IAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzlbNeZcRpFCmC7Q
	AvjMKrMQo3HFNzlFhTrerZ1DMq0GoyCzVmm06mliE/oXfDUwN3QDcg3kI0hKcyI40SpihxJzPUP
	lhwcc4AiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 01:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111601

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../picocom/{picocom_git.bb => picocom_2024.bb}            | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/picocom/{picocom_git.bb => picocom_2024.bb} (77%)

diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_2024.bb
similarity index 77%
rename from meta-oe/recipes-support/picocom/picocom_git.bb
rename to meta-oe/recipes-support/picocom/picocom_2024.bb
index cc0d88fac..c0c3e25de 100644
--- a/meta-oe/recipes-support/picocom/picocom_git.bb
+++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
@@ -4,17 +4,14 @@ LICENSE = "GPL-2.0-or-later"
 HOMEPAGE = "https://gitlab.com/wsakernel/picocom"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
 
-BASEPV = "2023-04"
-PV = "${BASEPV}+git"
-
-SRCREV = "12537df0314767d5af35bddddbbca3694e6a0342"
+SRCREV = "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
 
 SRC_URI = "git://gitlab.com/wsakernel/picocom;branch=master;protocol=https \
            "
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'LD=${CC}' 'VERSION=${BASEPV}' \
+EXTRA_OEMAKE = "'CC=${CC}' 'LD=${CC}' 'VERSION=${PV}' \
 		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
 
 do_install () {
-- 
2.34.1


