Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA5AC3DA42
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:23 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.13839.1719816257193245370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TfJ38TKi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816260; x=1751352260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zJ0iAe2GdymO3tyF/AYLcIUmgHuuyP7UdWmfippKLXo=;
  b=TfJ38TKigtoO/FRt9K9wvtIUWlnpWZZo5FKvVqtSDintLw3jHB6SA8Rj
   pmqCFB6bR9nGIH60EAJ19FC7A2GQysRAlFbJ1qcnOC8TwsAY69RQi5s9+
   tRQtcKwKBrW35KY0ZbQ/DO4jP4zEMKgUx1CGzvXEAwrTWgLwsN01f3J27
   IjoznCrK006qwjL16oolMmG+QEMEKBDsFWUCAu656nCJ9I7yKHKz+nAxG
   WHnz4V2hKo0QY+/ve/5sNMvjkU8JxePPlAS8P4C9IyyVaLXYKmtcYuSRU
   a/5BjORsH0tBQNtSBoh+PhhERflCXasSAhMb79yPY6oge2XRGeGcB9oc+
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165457074"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165457074"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 85D8CCC152
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98FDAD7487
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3998420071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DDCF01A000C;
	Mon,  1 Jul 2024 14:44:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/25] python3-googleapis-common-protos: upgrade 1.63.1 -> 1.63.2
Date: Mon,  1 Jul 2024 14:43:52 +0800
Message-Id: <1719816242-11839-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--1.645600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrEITY2UGMiNyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNgyKXAUOPYkSYkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SGfoMnPhJ/JP6BxBFD5M/6p9dF6uVEJBrmUhzgcCKsAmoht
	C858/Y1nTC+kv+grcZ+frm2aRhJny78yUUb11VkTGTnC6NfDmhS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111182

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- deps: Require protobuf>=3.20.2
- Regenerate pb2 files for compatibility with protobuf 5.x

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.63.1.bb => python3-googleapis-common-protos_1.63.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.63.1.bb => python3-googleapis-common-protos_1.63.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.1.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.1.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
index 7d8af9899..83e0a33c0 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.1.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c6442f7a0a6b2a80369457d79e6672bb7dcbaab88e0848302497e3ec80780a6a"
+SRC_URI[sha256sum] = "27c5abdffc4911f28101e635de1533fb4cfd2c37fbaa9174587c799fac90aa87"
 
 RDEPENDS:${PN} += "\
     python3-grpcio \
-- 
2.34.1


