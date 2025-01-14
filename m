Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE7DC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.40587.1736843352627310044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OOTTrDXW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843353; x=1768379353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Xj4VYrFk4pcLpm540fHe8gdv2+mkyHpIt9USeFBGXUc=;
  b=OOTTrDXWbd5fqAbqt3rRr32FWtPkcDmAQFDYmSxMKFQ1KWAtMcMFidKx
   VwiSta21L2y+Hewttb9O0QrsaxrGI63sOC1YVfJ14DLxFB5A9ULnMwVD0
   crFX6xtGhg+iL4aAfBPDdGnZFKI0vlDpsDQwbLQy/Lj8njjV6WLUZfrnh
   xrATQ7roHicP8LRg2LdC5wrexZibxRYCp7ORZwlV+zoh8AGEZzr2cicQB
   ecgUpilAa5w5b/J+MTjkfWQYfqqFImwbBU5FhbhnqTV+hDrM2tzT3yxYk
   q9a0Ru9wMoUEvXKLXmldyzxN7OFhoJN7eMS7qKiNpg7TPV2GUCJuW/5Jk
   A==;
X-CSE-ConnectionGUID: mZ3A/lMLROuMMwk3Dqpp/w==
X-CSE-MsgGUID: eXO3HeL5QR22NIGjyKuqZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165408985"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165408985"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69FFCC2262
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41711D4F5F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D72DD20071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 855F51A000B;
	Tue, 14 Jan 2025 16:29:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-dirty-equals: upgrade 0.8.0 -> 0.9.0
Date: Tue, 14 Jan 2025 16:28:36 +0800
Message-Id: <1736843329-4131-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.271300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytopjh6C15/u76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBSOeucWx2O64a+vJMKyYdesnz
	CO0bVOiRUhmA1VoyFmY1Mxif6XG4eCVi5gKAkXsbQtXtvmaE9NxWfb0R6QoKjYTir0CJNn/Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114861

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix problem with functools.singledispatch
- uprev to v0.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-dirty-equals_0.8.0.bb => python3-dirty-equals_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dirty-equals_0.8.0.bb => python3-dirty-equals_0.9.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
index 8be8e5f79e..f944d75e97 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://github.com/samuelcolvin/dirty-equals"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI[sha256sum] = "798db3b9481b9a5024c0e520946507676ed2f0c65317d3e95bdce1a01657cf60"
+SRC_URI[sha256sum] = "17f515970b04ed7900b733c95fd8091f4f85e52f1fb5f268757f25c858eb1f7b"
 
 S = "${WORKDIR}/dirty_equals-${PV}"
 
-- 
2.43.0


