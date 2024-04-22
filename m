Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE43BC10F16
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:10 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13979.1713777368348516345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XYhEkmif;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777368; x=1745313368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=74sdVgFwXRQHFXo0xifff7+bWhVmV9Q73tEQG5DFka0=;
  b=XYhEkmifVxk07H9iAvzL5W+5YceOI/TRzlSoy9+qs1tssDLEz2WjtqO/
   ZdSDBwZZfKojey1P1Ueqy2V3V30FFNlGnDZpOFsrFfi7D3Y1cMbALaEpk
   LRT7ogW4g4VTT9JF7UMGzCoFBKvliB/k4ZUD1wqH2V3B7+ENPc6lIeI+l
   JI92IaEtaOatn3OLV6ztenth61nou2nto/8z6voDUW3XbaBHKWlYPAVrH
   AbY2LyfEKs9+g+VmEipjmZcrHqLLKqUzvOEtD5Ye15OqMR2pm8ygkRv0J
   vQa519Ad+OD6AS44J6iNebW6R1SqT8/EX9AROhRwpUZPIj2LR1RHFXZdy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="135684124"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="135684124"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C5EE8D4C34
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E6B9ED5317
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 824C96BD75
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1AE011A000B;
	Mon, 22 Apr 2024 17:16:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/15] gensio: upgrade 2.8.3 -> 2.8.4
Date: Mon, 22 Apr 2024 17:15:32 +0800
Message-Id: <1713777345-29264-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-1.479600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrgbNN0R684zPLS2zWpoOM2Y2N
	vbXikTrM4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9VJ2cAYvS9yDhodNlg1zakKiejgA0vhOfCuQblyUlYpBJ2Jwp4uanFqsLTu62bg7AW1gU
	4vb8QPN0DgdBe/5R99/vwVeOTRRxfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110085

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-github: Don't run oomtest9 and oomtest11 on windows
-sound: Fix a possible multiply overflow
-gtlsshd: Don't use alloc_sprintf() to duplicate a string

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.8.3.bb => gensio_2.8.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.3.bb => gensio_2.8.4.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.3.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.4.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.3.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.4.bb
index 533b79f47..1f85c46e2 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.3.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "c8e0d722794e35c71bc9bb1d79e98f926aad19e0"
+SRCREV = "300644fc02b7099ca27ca5bac88c47e159ba8a6b"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


