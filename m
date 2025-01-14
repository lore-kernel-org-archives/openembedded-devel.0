Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C591EC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.40585.1736843349905349176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IT9XTZWb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843350; x=1768379350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ox/elqO8/Ljxq+LgWshx85mKhnsUjxXAfSG1zmeNbQg=;
  b=IT9XTZWbh8nCTYnfKf/UrXKyNxST8RGZ3/SJeO7RaYgLjo8GERjJKxYH
   Edx2mj7Fd1te8lfQGZc4zn2I0mgjxRtHj/FbHphcNJjY18kIZbPPOcNkd
   Q6uNwey1dKApNeF7jIWcr8n2xw9otw/KCw/TegifYdhOlZ/Djpr+kpNIO
   2Y8uPQvjpyjEQuga5RcD9D1yzAeneJSt9uLKANvTbFALfSOArryHAG+WH
   5u8vBhJm+L53+YXoGGsEZ86GBCa4Ll8RN4O8aM3GBkigz4gLLwx55/5nS
   eJf+MbnmF0yBUsjUT7hHgolMX48anPl/dhdGZBaie6Vr0SxYzZF69keWD
   A==;
X-CSE-ConnectionGUID: H4AgdVvRQwqvNo7lAP6fXA==
X-CSE-MsgGUID: K1mjpHPfSAmmu3ZrThBUvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="185663962"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="185663962"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68994DE67B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41C9ED747B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C90756B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 778EB1A000B;
	Tue, 14 Jan 2025 16:29:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/30] monit: upgrade 5.34.3 -> 5.34.4
Date: Tue, 14 Jan 2025 16:28:31 +0800
Message-Id: <1736843329-4131-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--7.376300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrg55m5RSwLMIJxk2B32iUYTwc
	zpIGNrAIvd5MFbeW3aiQ6ZTiri0LKXeeA+rySyNtEGOqXTRZcB/eGeDcpMd5NtcUntbeUinjmEO
	Yj3OX+feN/ziTW5bneOpe9co8GDkGbRev5+PfDD9O5y1KmK5bJRSLgSFq3Tnj8kikYojlmo2jxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2g/866Jx+VPcPOY0F+T5KbXQP4s9pEPK0SiTYPneplKL8Wz
	WkNeiAS
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114856

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- If the Monit configuration file contains a string with unbalanced escape
  sequences, Monit may crash upon startup.
- If the password in the set mmonit URL contains only binary characters,
  syntax check passed (-t), but Monit aborts after start and reports error
- If the every <cron> statement contained a syntax error, syntax check
  passed (-t), but Monit aborts after start and reports error
- If the timeout option value was set to 0, the syntax check was
  successful (-t), but Monit aborts after starting and reports error
- The set syslog statement's facility option did not permit the specification
  of the log_user.
- Double interpretation of format strings during RETHROW

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.34.3.bb => monit_5.34.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.34.3.bb => monit_5.34.4.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.34.3.bb b/meta-oe/recipes-support/monit/monit_5.34.4.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.34.3.bb
rename to meta-oe/recipes-support/monit/monit_5.34.4.bb
index 42ef8594f4..349548e31e 100644
--- a/meta-oe/recipes-support/monit/monit_5.34.3.bb
+++ b/meta-oe/recipes-support/monit/monit_5.34.4.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "669d8b95ddec124d1444ba5264f67fdeae8e90e53b2929719f4750fc5ff3ba60"
+SRC_URI[sha256sum] = "ef607cfaabfd3767d40b9b9e32032f748beebc4d686831f6111e0e68fbd1b469"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.43.0


