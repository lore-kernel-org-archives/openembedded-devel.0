Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC83BEDE99F
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.18593.1725959007929730214
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tng85Bl/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959008; x=1757495008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lcxjyeVs8BF8GIuD+FeXpjd91muAAI3E+eYgcwGPnJY=;
  b=Tng85Bl/1JaGxL9bZIQ85Y7FgCy3/SHjfzWywYWooapwuB+UbbP++ONa
   0PIEXSi8QWD7ropMW0mmyoHKxhgGrh4uLeC4AKJzL8Witirq8sU8oVJHW
   /vCow+fPjbWEW/0Z3D0uAYSm0BFiwf7J5WIWFvwz/NIvJNmLxc9fL0i/H
   etI+NGH58aXq4dYifzSqI0WnsTA0+bWP7qa0Q0xGL/KuuszhIORlXfcRI
   2txuFTl87Mi615JGMZP7UPi2BJBEPNi+B6hyscB0h4Gtf8620YgGmJJwo
   osdVhfostv1Q83gcMUsMFQPlPY+U36+PDw+Z/8rwm8A/l+73Dt2sMZK1p
   w==;
X-CSE-ConnectionGUID: OP2/zk25Q/+Kzhhy4+D37w==
X-CSE-MsgGUID: lApVHNqsTs6iLEnWHP9UNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152237298"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152237298"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:25 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5296916B907
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 991FAD50F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3744F200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA3281A01EA;
	Tue, 10 Sep 2024 17:03:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/42] libextutils-helpers-perl: upgrade 0.027 -> 0.028
Date: Tue, 10 Sep 2024 17:02:39 +0800
Message-Id: <1725958990-5719-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.237200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNtw+xHnsmQjMQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLxmYvBL4uLhGUF+Jey9bF3mN8+NYlUs41RHX
	nNBNG4IU9Fw+XKSpu5WTZV4mXmgcIQXL3qbDoho6T1p66ON0D+mzoWrnP2P7T+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112197

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Add ext argument to man1_pagename and man3_pagename

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-helpers-perl_0.027.bb => libextutils-helpers-perl_0.028.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-helpers-perl_0.027.bb => libextutils-helpers-perl_0.028.bb} (91%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.027.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
similarity index 91%
rename from meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.027.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
index 69f246b33..3ee9df730 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.027.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
@@ -8,7 +8,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0280160e4f26faafef507664884bf63"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9d592131dc5845a86dc28be9143f764e73cb62db06fedf50a895be1324b6cec5"
+SRC_URI[sha256sum] = "c8574875cce073e7dc5345a7b06d502e52044d68894f9160203fcaab379514fe"
 
 S = "${WORKDIR}/ExtUtils-Helpers-${PV}"
 
-- 
2.34.1


