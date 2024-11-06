Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1F8D29F82
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.40121.1730874669922439655
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=duPbFb+1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874672; x=1762410672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gKI3PSk1p/1FHwEuiQiZSnMJSewZ+bQ8j3HqnhTjuHc=;
  b=duPbFb+1u3NBeLlShnzzCD0LMOiewZf1mqLL7oUu3ZvD7Nt1mkz21sXe
   K/aZ5I3Eg30tZs7PZRGKw5CZIrKuQFSnoUoLrkc+xmS1TCVbskk7S7iyk
   W+HWSEcE8UWTnTmT2tORMpC/ofYd9bcATnBfbZepFoG/25JLseFAPf9Jb
   jFySebUWN2/eTEEKtAGCmL7yqKMbpsV9chRGU8bZDPqBnfWiEoiWhcOOb
   5JINbvjwkU5jEi86kDHfN3clG6OAAlSr48c7nLMsaPHG9eXLxPrHggqWq
   KLkWF7963CYvF4iZrkwhRj9+MBUwVsBjQSR1rU3YXl2T4V6sp5lf+kkEV
   A==;
X-CSE-ConnectionGUID: /fZFs/mvSXGXd0qoO+KkZw==
X-CSE-MsgGUID: oTvkT1eQTxKD/AKPjZ44Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="166653917"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="166653917"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ACE20D9237
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E15E9BF3EE
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CA0D6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2AB651A000A;
	Wed,  6 Nov 2024 14:31:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/46] libdaq: upgrade 3.0.16 -> 3.0.17
Date: Wed,  6 Nov 2024 14:30:20 +0800
Message-Id: <1730874660-2364-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.298200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuBAXl9LkPp6d+q
	ejtql8RD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6Zx2
	5js+HUUPi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFCdy3cBgf0OvkYR/1ijAVy1omI
	pfUCwTZpMySUMgN4djPw0XTCXUGuRg8KXvz+fl/Ip35wFwvbnLWkhYHh4S5doPjVX+/w07Bux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113691

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- daq_netmap: Fix build on Linux with non-system headers
- example: support snap encapsulation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.16.bb => libdaq_3.0.17.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.16.bb => libdaq_3.0.17.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.16.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.17.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.16.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.17.bb
index 7834d7555..5ca91ced4 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.16.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.17.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "2ffe084d4d4ccf4ebc5c23ef119aa1ae223ce2ae"
+SRCREV = "4807f58587dee68f402f736b116c2b82a17459f0"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


