Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9347C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:21:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10672.1707268910238193207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QD9rLYCY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268911; x=1738804911;
  h=from:to:cc:subject:date:message-id;
  bh=/KsQg/XQs0jJCQVTFhdrwLuvnvVs66rRhq9aMreo5no=;
  b=QD9rLYCYtQqgJaX6fJhf6HEiPZdIP/nZ4clRkp32D/1AmboioA5AxEnY
   wt/3MM84As+HjHwIMKuSGbQeKvw2fJEEAenvqbzBmmdDAj9+isBCNYnpi
   lVl3auCf4zO1Nz7EbqKXifoM61XL8KD0cvmkf9rPLhpGFp38+zUqs0FiO
   2iLyR3ROvaNzEOoxnbcWu+of8G7KD/sjOF5f/ayF5cZ7WVPL0vvZAIv88
   fyBQkeJIVo/oyOl8mYX4TDtTsEQe5KU3RdhBJ0fmtwn07Ou+YlrFxDCOe
   42d0bBVj+jt6hJW6uSnw/BHNipxW1GLff1izWq9DWtxnNnAO4nWt/0AHU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="148085520"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="148085520"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:21:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03981D64A7
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:21:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29275D41E4
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:21:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF60F200932D1
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:21:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6053B1A006B;
	Wed,  7 Feb 2024 09:21:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] span-lite: upgrade 0.10.3 -> 0.11.0
Date: Wed,  7 Feb 2024 09:21:34 +0800
Message-Id: <1707268894-12033-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10--1.001700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah/tAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzMmolor0DyLr6NN
	0WrXM99Ww+zQfzKdHMP/aKmmdo9TqKYGH8mZUBn/EBLzJTL0gFlD8UuVl2qCTQ45RMtcyGCkLee
	MKOsFsGiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108645

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/martinmoene/span-lite/releases/tag/v0.11.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../span-lite/{span-lite_0.10.3.bb => span-lite_0.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.10.3.bb => span-lite_0.11.0.bb} (87%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
similarity index 87%
rename from meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
index 15380f5d7..9dc393fd0 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite;branch=master;protocol=https"
-SRCREV = "cbb9c3c5162a0d7018c7b3e053153a04d4fbbbb9"
+SRCREV = "50f55c59d1b66910837313c40d11328d03447a41"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


