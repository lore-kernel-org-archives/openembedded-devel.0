Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457D0C7EE45
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6188.1684997789312798032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105954849"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105954849"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C0BDDD66A0
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05C87D3F37
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 830382007CA9E;
	Thu, 25 May 2023 15:56:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.16 -> 1.0.17
Date: Thu, 25 May 2023 14:56:14 +0800
Message-Id: <1684997777-2061-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--2.525400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/ySrLqyE6Ur/jc7WhpDnUK40UQrxvuyT2MG2N
	lYzGZgQkwJpduEGhwZWysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2ZGW
	8RjUnk4gKZgIdNrUtgHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6zIa
	WivzoMV0jSLDy9xjWFSVbPwoX+0CKHoi6aKbhQrJHDFSORvG9Q3w/CG4DITLkjfu2ojmoY8Xi/2
	5ufYnnQP76fHCFqbKiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102809

From: Wang Mingyu <wangmy@fujitsu.com>

* Fix:
    Read overflow when parsing CDP addresses.
    Don't output empty lines on configure commands.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.16.bb => lldpd_1.0.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.16.bb => lldpd_1.0.17.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
index 799270510..aa29f4158 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb984711df8465a9"
+SRC_URI[sha256sum] = "9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9d08268efdc6127ce"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.34.1


