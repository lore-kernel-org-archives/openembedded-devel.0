Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA21DC54E4A
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9259.1708419295294391504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pFnaASfq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419295; x=1739955295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0X8ADoRAZt3ZJym5sz+wVduTRV7Kp5s/NW1x603F68Y=;
  b=pFnaASfq6B/mupdOHh1TnDCJOYs61H+/iFW3UNogZRm/8yAajvCkxlI8
   ppAsUK0+d8gAMIBfW2nAB/r2Xw/UK5j6WJM3+mIDWPu4HhzoThhTVQckd
   DSHqmG9V1gg+AiBn9mCIsSYMBObgpxckSViW2gO620AnAzSme0MFL3BSH
   gnpJ66TJ/qAXZFfJJzlWE4jq+zoI//ujz8dk4AL4JfooM2A03wtDDnSsz
   bn18syLRszg9DMSDEf49M1y9tPAJUS1QiTkuw4DhwdO2fRbvlz5nqoQ5r
   PXVeE2VEkk9QbES4wZ+OSWBU/bactDKd7KbY4+3lzLmmkZtkw8GOyXA0+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="137889022"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="137889022"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BFDC2E8B80
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D05DD4692C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DADD200A7687
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D41DA1A006B;
	Tue, 20 Feb 2024 16:54:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 02/26] wireshark: upgrade 4.2.2 -> 4.2.3
Date: Tue, 20 Feb 2024 16:54:17 +0800
Message-Id: <1708419281-26047-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-1.451800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGJcLewwAa76f3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrR86cdMD/WKJVtZP52H7Cslj0GIyIBCQRraiQ7bCUJw6SH2FKhBXZMghfB
	0kxKFlULjtK7zZfVuwQoTu03NMxqKyOen+hZoWax0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108922

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.2.2.bb => wireshark_4.2.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.2.bb => wireshark_4.2.3.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.3.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.3.bb
index a2ab112e9..28a379445 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "9e3672be8c6caf9279a5a13582d6711ab699ae2a79323e92a99409c1ead98521"
+SRC_URI[sha256sum] = "958bd5996f543d91779b1a4e7e952dcd7b0245fe82194202c3333a8f78795811"
 
 PE = "1"
 
-- 
2.34.1


