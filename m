Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190E2C25B75
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10794.1715677849464717020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r9ksCPx6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677849; x=1747213849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pGdMK3QCTjPlpKKIX2Ag76sDTndkJub45YGt/UvGiuE=;
  b=r9ksCPx6KmREKGsCc2sT1BIUbNl6A55SRCw/C5zMGj0kv1jGOeJtTt5M
   o0LBlIErn+oEqpkX2Q/K03r4iGnTS9xd9fOumVNeqwoqmHFShJEZFoZoo
   tEXPTvrzSgPRK60TLp9Gak4IoSYJ1lCdwZpgjvnk6zVZNZjl1YOjGrT8k
   obvQjAvMVT86Q3gXhKnnF4BlbfkUfQbJoxQA/gBvQT4KlSX/okyGthqj+
   +vdlj/dXdy8cnH7skILAbu2MBAgX5vkFaORhZeEfJFry7/fV7yg9FLz+r
   ttGsHQYLhkoRXNEIIuw0SJRYpC0/GInrfyPVgh+RTHb9IAryBT7Gm907m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="145839690"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="145839690"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB7F613EF1
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE15ED3F28
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EA6370BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B72C1A000C;
	Tue, 14 May 2024 17:10:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/44] python3-imgtool: upgrade 2.0.0 -> 2.1.0
Date: Tue, 14 May 2024 17:09:58 +0800
Message-Id: <1715677817-2223-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.570200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBZUipC+zHNir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu+ZyFqtd5FaaYkqKEtUB4RU5
	pDqihcjnss9r//dw7twYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNbkz2oI2hQmsM1ScmfNLfy54plQOiotRb9w8YFnbjJx09ST5jOhlm1dekbU2zN4o1raJt
	ZF3QD4NhbNib9w4DTYm5Bnlf9A0jfK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/mcu-tools/mcuboot/blob/main/docs/release-notes.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imgtool_2.0.0.bb => python3-imgtool_2.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_2.0.0.bb => python3-imgtool_2.1.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_2.1.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_2.1.0.bb
index a25e6a61a..aafcf3827 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_2.1.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=0645fb61e2f961a110302fbfdb227446"
 
-SRC_URI[sha256sum] = "7a541255e69eec1f12aa38dce1f1d4fe20d8212677c68a9b6ec634ca91a06612"
+SRC_URI[sha256sum] = "4f7fbcdf53c44eaaa6226504510ccb52f7ef00c997503cf94934b330c9607b60"
 
 inherit pypi setuptools3
 
-- 
2.34.1


