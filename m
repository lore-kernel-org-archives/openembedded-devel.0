Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45772C02189
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.40586.1736843351518583402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IFBHK5zw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843357; x=1768379357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zvaOzq+amNxNpnUPdi9pWCZ2SSdeLUplFhQXq2bOH3k=;
  b=IFBHK5zwvHxGYcWfOoSc0bXGyxcMjU+/BwmaLvh11q7f8ttkYMCkypPQ
   x+EjxKbtygEb8uOAdsc7wwVWV2HjpXN8IVKFKQ03rRRjjpwJJ/rsUXpYM
   p5aY3qzNho63BU8ZO4pJpcQqC//Jd0UibLZr5Vv4nElqkVhXhoOm22r3O
   jOntRKZdgTZECnXID51sFZLFl5LE762SyDYnGJ7z/YaAWGUqFqJs60+Uq
   7734ZNqkXgiuBem4ZzK1SnsIYzDG/LnpGatOZGsoFbnqqpTq3xAztsDFk
   kXhHbmB/gT5U90BRnK2klzepzppAmJXxx8gDKVsnE6diPvDyrq+EQs8KL
   A==;
X-CSE-ConnectionGUID: Si/ReaO3R4+uTFztPH9b/w==
X-CSE-MsgGUID: VVh7UrtPTi2NH57QJIVmww==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165354764"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165354764"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C291DE67C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 049F2D4C39
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9736B20071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 451511A000B;
	Tue, 14 Jan 2025 16:29:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/30] python3-zeroconf: upgrade 0.136.2 -> 0.139.0
Date: Tue, 14 Jan 2025 16:28:45 +0800
Message-Id: <1736843329-4131-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-4.485400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrHcwhKp47FguPaLJ/Ca3ST3w6
	H06bMgivmPP6d6eQokN7nZmSglxg9u1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AsSh9atRkcwf0iF5TZPPO8HwHAtR9BitH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07Rf2ukFm4ENtzxVrff1RkD/uJWBKDPoU72/qLe0eOTGchfMB6FZswWwiHXddVv08sQo/T
	PNFexfBcOz2A0TI4NRKje662LAol84KCSgymNMI8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114868

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- feat: implement heapq for tracking cache expire times
- fix: ensure cache does not return stale created and ttl values
- feat: improve performance of processing incoming records
- fix: split wheel builds to avoid timeout
- fix: move wheel builds to macos-13
- feat: speed up parsing incoming records

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.136.2.bb => python3-zeroconf_0.139.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.136.2.bb => python3-zeroconf_0.139.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.136.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.139.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.136.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.139.0.bb
index 43c3276e70..3a45061da8 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.136.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.139.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "37d223febad4569f0d14563eb8e80a9742be35d0419847b45d84c37fc4224bb4"
+SRC_URI[sha256sum] = "2cfb4ef130aac602c9ed428a52243597ed248cf0d22ac4e2b21d90541de90684"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


