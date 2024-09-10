Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73080EDE9A9
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.18329.1725959003028888389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TqlJViNc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959011; x=1757495011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=61iuPfGUz9d/GwGcqkTz3Xj8lyY2a2MKBQKmds7AnmQ=;
  b=TqlJViNcRn3P8PmzbjYCU9q4mWfMXrBOQskNSJ7F0fSqGXxUuWf09lbN
   nNGluEDhaqJctw6y9DxAjyCCwu9DQA5bl6iAzLXy1XBMzyODF/8+loev3
   CdjmWV9QaRX/xCKsNSd9wqI+4wCJ3ECtyqvdw+jid011RI3UsZfU2Uavg
   iY4usfcL5GAArhmOzFFg/g5X8xnKxDeiwTvzFrsCbbFhL7ghL5ZcsZVxl
   E6rH+gPUjAW8E6oVy7SZtYVB2b1D9Erxen2ictPfjEP771MiCnQDUYbPB
   GF7qm8X/j6TfwruEhwGH0rj8trU7prZSMiLKG7Q5BMlCvYjznHrtRMczD
   w==;
X-CSE-ConnectionGUID: lCHwMe7+TUqXL3+CpGIwng==
X-CSE-MsgGUID: ipzMLgoHQA+LJaQvTQHIww==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="172474632"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="172474632"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C3AAD8008
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CC95D4C01
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 080C46BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ADE821A000B;
	Tue, 10 Sep 2024 17:03:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/42] python3-kiwisolver: upgrade 1.4.5 -> 1.4.7
Date: Tue, 10 Sep 2024 17:02:50 +0800
Message-Id: <1725958990-5719-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-1.540700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysoKIVMJA1GKXMW
	fmr8UEU8a9r8chJWVC9xLAyM+BP7txLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZBzlxgC34VKGemzGG4qDPam5x7uAXGEprZiQDIJsDspXmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1Htn+UXW7eu8S4+cnv4NQUtHEtEh4U82bnUBzfT8ngwozGNfghqm5IhyQg
	zBPzmbWD7iSJtBQ5K6HdMlUYHzZ7v3mUaCLhZRWmW1z9vWl8eZTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112206

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix the build infrastructure
- drop support for Python 3.7
- add support for Python 3.13
- update linking strategy on Windows when building wheels

License-Update: Copyright year updated to 1.4.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-kiwisolver_1.4.5.bb => python3-kiwisolver_1.4.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.5.bb => python3-kiwisolver_1.4.7.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.7.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.7.bb
index a1949b113..9c422490e 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.7.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A fast implementation of the Cassowary constraint solver"
 HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5f7ce5ba663b186ce35b78df96a2eb0a"
 
-SRC_URI[sha256sum] = "e57e563a57fb22a142da34f38acc2fc1a5c864bc29ca1517a88abc963e60d6ec"
+SRC_URI[sha256sum] = "9893ff81bd7107f7b685d3017cc6583daadb4fc26e4a888350df530e41980a60"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


