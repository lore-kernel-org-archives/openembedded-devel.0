Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD2C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:03:34 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.493.1705971804133746384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="125710587"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="125710587"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:03:21 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FD9AD9DA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:03:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EF80D3F29
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:03:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 073DC2007B700
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:03:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3A431A006A;
	Tue, 23 Jan 2024 09:03:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.17 -> 1.0.18
Date: Tue, 23 Jan 2024 09:02:57 +0800
Message-Id: <1705971777-24661-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--4.615800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO5pj
	+XNqU6N7+7A6XsaKe8QiVbm6zbW2wPc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQD5+
	EY120A3rYh+yPjXckVoDYPhAGqvQ55UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HG6k1TlxNcga0PP3yiVsbHKlc9/5tpkWEBM/ZSL/DWTf3H2L9ZuXUvge3meqRRAaKEzfI
	3ag+LoMvHECMbKZKvPQmicPx9g3GvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108386

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix memory leaks in EDP/FDP decoding when receiving some TLVs twice.
- Do not set interface description continuously.
- Use a different Netlink socket for changes and queries.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.17.bb => lldpd_1.0.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.17.bb => lldpd_1.0.18.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
index aa29f4158..370465e14 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9d08268efdc6127ce"
+SRC_URI[sha256sum] = "4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.34.1


