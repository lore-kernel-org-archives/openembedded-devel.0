Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8C8C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3853.1686620453483838737
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="99076289"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="99076289"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64656C3F81
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3B7AF807
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 333E120074724;
	Tue, 13 Jun 2023 10:40:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.6 -> 8.2.7
Date: Tue, 13 Jun 2023 09:40:07 +0800
Message-Id: <1686620422-29962-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-1.330100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiYDNRBXXki2hpl
	bnRIZ6aEC3iF555BAHVGGVzLUTsJxgYkjjpQqZL98t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQfiq
	1gj2xET9fll+ZbVibhaMwOPR/1lFKrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVbrT+ifGfdt6GQqYyxroHmOvHqg4CrFjsBxseBDN6tC9BjYqvYi/ATuHQ27eDZHmfMjp
	m4+MBkkXxEd2EzZC9wo6iSjllsFcI4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103236

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  . Fixed bug GH-11152 (Unable to alias namespaces containing reserved class
    names).
  . Fixed bug GH-9068 (Conditional jump or move depends on uninitialised
    value(s)).
  . Fixed bug GH-11189 (Exceeding memory limit in zend_hash_do_resize leaves
    the array in an invalid state).
  . Fixed bug GH-11063 (Compilation error on old GCC versions).
  . Fixed bug GH-11222 (foreach by-ref may jump over keys during a rehash).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.7.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb b/meta-oe/recipes-devtools/php/php_8.2.7.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.6.bb
rename to meta-oe/recipes-devtools/php/php_8.2.7.bb
index dad955452..43607f65e 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.7.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "44a70c52f537662c10d91eedbf51fd765c9961be6ba2508ed63bf7a26cdd3100"
+SRC_URI[sha256sum] = "5bfb2a35c67921bdcadd5c90cb290ad7537d24da113a5e8bc2d646b02de7488f"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


