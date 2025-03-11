Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30664C35FF1
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4161.1741683323029923077
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zbm63cep;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683323; x=1773219323;
  h=from:to:cc:subject:date:message-id;
  bh=ASxolgnXanq2fr+WNlBSI5X2o1Mc+YnIac/vfvpgbYU=;
  b=Zbm63cepeX18XAxFW11Ue/LgjzyYhnP/+PhGQbgoQMiLzyZ3wlmVf/rZ
   zCZPgTamPucaWjWdo8jCOTzu/MdGUoogFjqwG5GqC9iW2Go6RJmRSMs4S
   D/ZFHvJ1Ns3ypTyNksQqTWmEfK/NoYl3VSGF2+Ys6gGFRS43+h9qNqb5v
   6sH6Vgg5ARPUrC9QaJd1loMDnnQvmDv0Iay7u9CR2IJT+6nqqj1Q6z55h
   5y5/u6OHk/jQZklOKuQuHNUTc/5j5UI+OWe2VPewml1Po+/lY6QgYXssL
   YcEYetBtmlLp3KA9PgwCn2TUK3BjmBRvISU+CldnmeyJv7dWqWRc0497B
   Q==;
X-CSE-ConnectionGUID: 7JtHxnFjT4mISQACVyT9Ww==
X-CSE-MsgGUID: 9s5JSnDuR8ud5lEO+PXVFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171602356"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171602356"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 54914E0765
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1ABD8CF7E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9DAD1A0071;
	Tue, 11 Mar 2025 16:55:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/36] asyncmqtt: upgrade 10.0.0 -> 10.1.0
Date: Tue, 11 Mar 2025 16:54:35 +0800
Message-Id: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115852

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Added C++20 coroutine version of broker (experimental).
* Fixed connection status updating timing.
* Refined CI.
* Refined log level.
* Refined documentr. Added coding rule to navigation bar.
* Refined broker.
* Changed the broker auth JSON file comment syntax.
* Fixed broker websocket connection.
* Refined documents.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_10.0.0.bb => asyncmqtt_10.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.0.0.bb => asyncmqtt_10.1.0.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.0.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.0.0.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
index e44ddc58f9..3a02c714c1 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.0.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https"
-SRCREV = "d802dc5491bfb17ea88c04bf9187a62252d64ddc"
+SRCREV = "21046ebc4a5475c14cea446715734c88fe33d276"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


