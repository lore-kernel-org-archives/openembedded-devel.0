Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69B9C2BB85
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2482.1718161116950932583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zu3OL4pR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161124; x=1749697124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=veyAJHI/E4+zLW5lwTEF05jKt0UFXslRigdh0UKbBGI=;
  b=Zu3OL4pRK4nSJCd0xvsbyNzORqIjkEWVJhmoYyqKzeRplwm93PTjKeCH
   THaePNvL+gB0Y9IfpQ6FrOnhxWZJIdLB88XcHFjoknyO/3B8vRaymlQGb
   5LA3miMj+lsqEMomaeR9n1sv+qQeRCptt9WTgLakey6iay+gn+lhVMVHX
   StrO4T4I/aG1nJFjR1kWiGQbs7LeKGtIlBoIVRUoGnyrHfSGUEG4ambaz
   CnY3glmgABRYxciF89U393093xX/cK2lfjNSlDKDsJlOAm6aWacqbWeYQ
   cjEEhnCTEhUHyV7csRD3kX1LJC83r56XzFZyMEISamXgKulPUqycy58Si
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141806717"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141806717"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E078C68ED
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F944D50E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F3C91401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A13BB1A0002;
	Wed, 12 Jun 2024 10:58:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/43] python3-msgpack: upgrade 1.0.7 -> 1.0.8
Date: Wed, 12 Jun 2024 10:57:48 +0800
Message-Id: <1718161096-29710-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--0.316600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrEITY2UGMiNyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNOwpfLMeBwRubOwnwKxlhTpsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SvQhX3oUR4JXKNPG/evVvxQse1xhfAuAdj6hZtW+7LAWN1V
	KTOa4u/IEwb/vWYNLfI+98kla4BRfMwlw/x3nXQitYtPM4EonoS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110851

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- exclude C/Cython files from wheel
- Build pure Python wheel for minor architectures.
- update Cython to 3.0.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.0.7.bb => python3-msgpack_1.0.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.7.bb => python3-msgpack_1.0.8.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb
index 5180301f7..a000737f4 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "572efc93db7a4d27e404501975ca6d2d9775705c2d922390d878fcf768d92c87"
+SRC_URI[sha256sum] = "95c02b0e27e706e48d0e5426d1710ca78e0f0628d6e89d5b5a5b91a5f12274f3"
 
 RDEPENDS:${PN}:class-target += "\
     python3-io \
-- 
2.34.1


