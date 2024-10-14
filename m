Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56F0CFC50A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.50341.1728896172565027575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iJfhTvC0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896172; x=1760432172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hqLQCZfHE2ekTgprUqAY3cN+POnifDUEDOIFm4tbBZM=;
  b=iJfhTvC0DuTMFXIkclPb9EWt6TXE1XJ0rKTzzaUpmp/MxnAdY3n0Qw3s
   X1atg8MPNmOxg4kFy+Hl+rHpuPEQdIRW77W+p/mlB/8l/LiWIoI9/nwDv
   fDN27FEsREFeV8uEi4EKRCSfq6HdyEJTFXMQrab1oeAByZizV0inbG2Qz
   Bh170ZiafhgRMIFB25srs32AiCI5lHHaFHcQ2xmnVeTPRAY1zTrfcxc6H
   TFOtnIPMB569qfVLkhCSWipb6uUBEeGjqHkUvqUoPT7NsxfNTpEmiQQcj
   Uho2pO0X18U1gJCoW/x3B6l9Ar3U71L/20Ne9LUb8hqBA6SQ/HcfqCetU
   g==;
X-CSE-ConnectionGUID: UOdI6T3eSr+7IpmiQBth2A==
X-CSE-MsgGUID: sZib4wmbSuO7LdofaSRyFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176874698"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176874698"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61F66D4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A9BC8D5319
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4402D200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E5DF21A000A;
	Mon, 14 Oct 2024 16:56:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/54] python3-gspread: upgrade 6.1.2 -> 6.1.3
Date: Mon, 14 Oct 2024 16:54:47 +0800
Message-Id: <1728896115-2944-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-0.339300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mriWaJVdA1QpxUjspoiX02F6Kw
	aTaBjKMZ/DW1GvHktOjuAEy53Y4tLrBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRkhXJsS++injn0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtt1sktGJhr97Fe5n8/sG4QgYRBcNk4gQ+m4fZnwZiBU/re/GGYTJAZwu7t
	sOE2WjxHB9e7rtH6ccpzDU+ghRXpilu8XiHvMMIHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112876

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- ignore jinja CVE
- Remove passing exception as args to super in APIError
- better handler API error parsing.
- Add test on receiving an invalid JSON in the APIError exception handler.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.1.2.bb => python3-gspread_6.1.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.1.2.bb => python3-gspread_6.1.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.2.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.2.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.3.bb
index 0aae1d0c9..f88c58058 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.2.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "b147688b8c7a18c9835d5f998997ec17c97c0470babcab17f65ac2b3a32402b7"
+SRC_URI[sha256sum] = "cf03627f44e9e03a0a3de241d1748709db22af4fc8c11a13aa389d0bce6053fd"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.34.1


