Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EBBC54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:16 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8147.1710827172363736307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nRw9QUpy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827173; x=1742363173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1uCqoy8rwsW23/phVbezoanKKXaJxZTqcJWXeoh4YSI=;
  b=nRw9QUpy849mC58BaxyNhxiV0eyLCzL3JS7mgDkjlpfJvmRuSXHPaXK6
   7RvE/f1zoJywL5bV7eL3zxteqiQazdAovgXLytL9rkTnE+/noezXv7uxP
   FrlCeDzOn0wYPzNMAQXq2KyO1ZnW+zhYZrt9oZizSYgoruxccjEXwMRZF
   9YvS7xWB/l4aGn/8m+cM3uDG8i81Nenw0pyneexF7r7+ZohfVv31/kiJo
   GFaTqUQUuY3sHNzt+blUqRtXQV5H4MYJ0KtL5n70PkGNbtobBf29gGm+d
   1NnV9X7gFRTrcdrsP615KRevi11WlgYNSh/QD6SumJkB8sEUyDTvggPt2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="132057833"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="132057833"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14E37D3EB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 516D72014B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D776721BD6E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 801FF1A006B;
	Tue, 19 Mar 2024 13:46:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/50] hwdata: upgrade 0.379 -> 0.380
Date: Tue, 19 Mar 2024 13:44:55 +0800
Message-Id: <1710827139-30056-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.353800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkwcMedHxxRAtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJon585nKQczq746cXaPycFZvzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46jKHYLsR4q0LHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4QrJ
	OOelRk89p/G7+sgVVMijDQxZOIIXDdoJixjAsWN0g+hcXZmEIymZvNUHwGsmoyq7pL8P969DPUG
	pVvy+IfA7spGZm9lzOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109423

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update pci and vendor ids

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.379.bb => hwdata_0.380.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.379.bb => hwdata_0.380.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.379.bb b/meta-oe/recipes-support/hwdata/hwdata_0.380.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.379.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.380.bb
index 50d449ee5..e9b5afe47 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.379.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.380.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "87db4fd0620270614f5079c5f73b1fb6000ca081"
+SRCREV = "d0cbfddb1fec4bb1a395373396c972e5f210bcf8"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


