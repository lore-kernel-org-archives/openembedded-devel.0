Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78FEC2BB9A
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2482.1718161116950932583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qn2Jsn5Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161120; x=1749697120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mlOyv3cvU/WE8Rd7TiBNO4N40rPlx/KoiqJCWIPyn88=;
  b=qn2Jsn5QmR3PkFVg/x39ougJglmIGDi/CXXMX8Ok8l1Uo2CGIRnQxgK3
   fQvWm4t1z6A6ilChbAo/DP9hI6bTOW2KJ5cEThxYX6x+jbTPgaE70TmIX
   SBmoNKqV1fUeB2t1Y3Zzu19wzfv84XMKvugZmVWV7yLmDY8sLNii+mdaB
   sIZxuv2uVTM7d/xFnJVf2MjAEd8MDFSxHpJeE3KVO4bm0B1hqMwyRfp5y
   NfVjUYsXP4FEcD5vQ9Vg51m3ai4gk/u59syQk0zZXEcHh59tYtPWJ8Cwc
   09Pt5Pyop8EFyxgaFif+e7zYJVKlsO0EYkt/z8r5udl4DttHZE7s04JeH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141806713"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141806713"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D3BFD5A48
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B92F7EB3F
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A577401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E59121A0002;
	Wed, 12 Jun 2024 10:58:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/43] python3-eth-hash: upgrade 0.6.0 -> 0.7.0
Date: Wed, 12 Jun 2024 10:57:40 +0800
Message-Id: <1718161096-29710-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-2.859400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7SirNx8CjnS2izy
	bVqWyY2N6P4GrT4auqoF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzGRVW8Et3Dn3TOV
	6L9DRtL1AC702H/PUJT+B6sggxUxe1WYzldqaYmnMGWDbQcbAP/PDCQNBX/1FjvY8tvTrIDpDIU
	5UXNJ2QiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110842

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Merge template updates, notably adding py312 support and testing docs build for all formats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-hash_0.6.0.bb => python3-eth-hash_0.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.6.0.bb => python3-eth-hash_0.7.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
index 8464dbe40..0f548cf86 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "ae72889e60db6acbb3872c288cfa02ed157f4c27630fcd7f9c8442302c31e478"
+SRC_URI[sha256sum] = "bacdc705bfd85dadd055ecd35fd1b4f846b671add101427e089a4ca2e8db310a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


