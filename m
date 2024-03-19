Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9D6C54E72
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8147.1710827172363736307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tV0diHUE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827177; x=1742363177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8h+BmJTDsU6mX8Sqozj5gQmPJ89SbsuvzQYiVABrGZc=;
  b=tV0diHUEXZ44lm3QzvgZBqxSEByz4i7gOzSv7xxMGeT6dHPYc16+Zw65
   iq0vpC9d9/xd55/5YXDU8lzQhB36EigElZwh0trbbZm0CvuarduyaBreT
   2e/Nv+qx8fF6/fwOV2FMmqj6zNLhyhLXTW3G7uxTCR5K/GiYRLQxZlIEP
   Dq45VJ3SX5nx7iO/GQ/hNfN13hwXnrxBWxOhEaotgmeMsy476mLzuvR5M
   Cdcxl4MO5l2oBtgPn2lkCXTePo8jfh2KDttIVeLy1XKcXV2106S8CzsFS
   Zm1VrcicJTllNygXhoqUaj3Bt7vkEq1/+Qla/A/k8iDKTcfOulFDhBNvR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="132057843"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="132057843"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69B7ED3EBD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB722D4188
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3767F2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D3D6F1A006D;
	Tue, 19 Mar 2024 13:46:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/50] mcelog: upgrade 196 -> 197
Date: Tue, 19 Mar 2024 13:45:01 +0800
Message-Id: <1710827139-30056-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--1.411800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrGB9/bxS68hOysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmREzEoOqAAVLPzWEMQjooUzWAN6i+va16uBqd
	FRjHdIbjtAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzJBR81qJBoUr4um
	WCnaocMdgfYucJx8sBVlSUqtelkVbEyEXB0F090hZVuvDreXBHw2fPAw+17tAUl0yaYloeXydhj
	OSi7oPsiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109426

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 assign freed pointers to NULL pointer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_196.bb => mcelog_197.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_196.bb => mcelog_197.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_196.bb b/meta-oe/recipes-support/mcelog/mcelog_197.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_196.bb
rename to meta-oe/recipes-support/mcelog/mcelog_197.bb
index 06aa30df0..51d96b56f 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_196.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_197.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-SRCREV = "edfe78a0dc54a940f4916a9bd681eab7b3f746d1"
+SRCREV = "20dc4373b7e04b00a6bd9f55446486df194b82ef"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.34.1


