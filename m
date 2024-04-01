Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AEFCD129B
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.39357.1711983100517075574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VI8uIPkx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983109; x=1743519109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XoeXt9Ahjcedqy4+GnFR/zP+84/u8qtsacv1tuG5c58=;
  b=VI8uIPkxoTtjlMc9DNmvX08bnYi7cszawFuRrs64n+A+DTTjAHQtVtJ/
   V6jf+qSoWALXRuusGmb5a1bFzdYssXARPK71MAoUgFA6Fan1itAvlFjxn
   WR3IpfrRIbQ+/zP1QdiroNBoYtj5fA7DBQnwF+CY8pchkAU5e3EvYRc6k
   ZoTdfALIp6qQn0sGQe1Ojm55/Pvs/ukvK4qumsIH8KHQaseQru45ZHi/B
   Kcha1F0VNzuOBzw3LOWbcC2vhSGWUU3EhO2widfMGHXlVh3BcDu7TsrsZ
   jE1Jg0Ol2lm/Yi9o0FzUHahw+BnqDYHv24sdeAKMhFO+ARhojwO4FkwPU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133627009"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133627009"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:48 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D00ADC36E3
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 094C8D620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91BC620093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 486C91A000A;
	Mon,  1 Apr 2024 22:51:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 43/47] thrift: upgrade 0.19.0 -> 0.20.0
Date: Mon,  1 Apr 2024 22:51:15 +0800
Message-Id: <1711983079-16849-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--6.136900-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrfrTt+hmA5bIvfU/riSJXkWdr
	jZkJClxevBAd3dE9o6Ol9RgYzX4UHh2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW76cPlvDR88KY1tYtwPvjHZ7Gx7+qQ8+rWDIpcBQ49iRJSlv/9klkDigW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TiRhduhvElsvJT+hf62k2Y+gsSeW2jNCdzeAB8AlzYkgCjS
	1hlPx3A6CEiH3+jwQ/3/KjOzra/iuulxyHOcPoH
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109757

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-C++ library don't work with HTTP (csharp server, cpp client; need cross test enhancement)
-Swift service generator doesn't support oneway
-LNK4042 and LNK2019 in go_validator_generator.cc

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../thrift/{thrift_0.19.0.bb => thrift_0.20.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.19.0.bb => thrift_0.20.0.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.19.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.19.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
index 70c9a7a08..23db052b9 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.19.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch"
-SRC_URI[sha256sum] = "d49c896c2724a78701e05cfccf6cf70b5db312d82a17efe951b441d300ccf275"
+SRC_URI[sha256sum] = "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd2163fa935ff2d6"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


