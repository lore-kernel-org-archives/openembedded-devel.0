Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88224C54753
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8723.1724833547871109374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fz95XOQq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833548; x=1756369548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oAFO32Yetf+Wir/wgGm01LFuXiiE87kKmWVvmk7mTuA=;
  b=fz95XOQqNbs6FVPK7jTmAHEGXq0BJH/XaL3fYVOkm2G4Pt+ytysNB7V8
   cM7oIzDnBxck1EJ5yDG3O0R9o5sAmTm7+eIxCNTUp2lfJhDcsSmmumr3g
   zQk27AKfTZNjBLvbrcidHXQIm9hd5Sx4cj7MN8VHbd1mShP0vEvquCotS
   3182Y5Ug1NCAeFd3YM5wKiQaOZbEuWFaGC6VjjXYh8LZsJ/SU9qn4KuAJ
   HZI+cvFEpk8jfZ5pTMT5LgOkRkGm/8Jk4hiy0Gwdd1KLba942sjaKJHhV
   PbY1oh5prUzK2fWuAzCJEmbuRnsHYBrOIu5VqTLKrKRMkemv5x+/PeFp9
   w==;
X-CSE-ConnectionGUID: m7pmf9eDQv6gO1E7loBdBg==
X-CSE-MsgGUID: FdAc3eOrREOQHxLFI3CFNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913186"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913186"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:46 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D70E3C932B
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20FEED3F14
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE0496BD4A
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 595431A0002;
	Wed, 28 Aug 2024 16:25:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/46] python3-cachetools: upgrade 5.4.0 -> 5.5.0
Date: Wed, 28 Aug 2024 16:24:59 +0800
Message-Id: <1724833525-2162-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.079200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrFNcW5Y2zGvmU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNPKN38CLPK0F9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4Mv3FLeZXNZS4PExmMzPfDZvzjxmqcYpgmk1PU42YcH0iJxXbuAxpdINdjjJjm+fGqHpPE
	DNJO+ZYOmF1uwL6IoTmKRgXjvyTd6y/j0UndW6v9m0/qDki/YlS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- TTLCache.expire() returns iterable of expired (key, value) pairs.
- TLRUCache.expire() returns iterable of expired (key, value) pairs.
- Documentation improvements.
- Update CI environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_5.4.0.bb => python3-cachetools_5.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.4.0.bb => python3-cachetools_5.5.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.4.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.5.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.5.0.bb
index 94d899db1..00e208f9c 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.5.0.bb
@@ -28,6 +28,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "b8adc2e7c07f105ced7bc56dbb6dfbe7c4a00acce20e2227b3f355be89bc6827"
+SRC_URI[sha256sum] = "2cc24fb4cbe39633fb7badd9db9ca6295d766d9c2995f245725a46715d050f2a"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


