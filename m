Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3187CC27C43
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.12718.1716861051485200167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B7ebI8mM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861052; x=1748397052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vfq+jpQLdndZSpbdiupTeZ85Ghdv82I3RWvP1oR0NA4=;
  b=B7ebI8mMoWiiWRP1bwOdrqSqS3A1ml/2XK8yVQ3YS0Bvo23YTertKJYZ
   AgMTRVWkr4kVcD/9O2sFwo1DqNPuNmk0k7R4lftgIc74j7NrXqz88vYh3
   +ZBT5GBk9ZekS0iIShT54XbGEbmlcLBkB20WLJyUKkrZPEk5EwEBs7kpr
   DdGn7XIEM5+OXyA9aRDuGrjkY8V8mJub6EZOneivhUMhuDE8T2ahBqhax
   RrGtMEByOj2lYET+FK3p5OPkNiuMH+bhzePLscGvkuLZ4cotDEG1FqKMW
   Pzu1NxqOs4xx2m1CuN8dYiQnO4R+NHM8IjoC0Z7P69l8HNTmGY0y7KS74
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139925832"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139925832"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DEC0DB3AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F32ED5928
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2618141063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C88EE1A000A;
	Tue, 28 May 2024 09:50:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/40] python3-watchdog: upgrade 4.0.0 -> 4.0.1
Date: Tue, 28 May 2024 09:48:15 +0800
Message-Id: <1716860901-863-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--5.503600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv6DF8MLFEOtdnf
	JrUSEbFDOGy0C8YG8wYF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2emHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO35N/
	S1zEq4upDEg3BiZpWU3yVrSLLHTBEnayNgyBDqQhL606FvwEps
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110568

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix missing event_filter for the full emitter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_4.0.0.bb => python3-watchdog_4.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_4.0.0.bb => python3-watchdog_4.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_4.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_4.0.1.bb
index 9e36264d6..4d0a626c4 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_4.0.1.bb
@@ -4,7 +4,7 @@ DEPENDS = "python3-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "e3e7065cbdabe6183ab82199d7a4f6b3ba0a438c5a512a68559846ccb76a78ec"
+SRC_URI[sha256sum] = "eebaacf674fa25511e8867028d281e602ee6500045b57f43b08778082f7f8b44"
 
 inherit pypi setuptools3
 
-- 
2.34.1


