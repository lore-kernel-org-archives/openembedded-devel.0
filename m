Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D75C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.9338.1708419303916546474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MfhX3jLa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419303; x=1739955303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Q98IOEN/6jr0CPpwIvDynQVjf7ONaRSUNX4/X6XBPzw=;
  b=MfhX3jLaj/Bfr4tjQjDABhZpZBq+7vjfgOj40FDxwZGsrZQos1QuyGfe
   8ZSHY4EwLTGP8dwgPBiGQwsUh7hgujnyv8UuYn2SKtvyVWTVGEO+ctXlI
   YoTXEedY6FJqhAtHR32iIAYPr5G9bbSW/pZzIGCfwF3AkidmeN7WNHdLV
   CHfihZFsBbrgpZnWEn57OgWMJSHZENdxhBdnkHlt/t1l514NDlH74dM75
   614DzI2u6TDgjDvvFQO1husLPMIdUhAcPbqYbWvLYyUdeqoklVcM+DIYT
   9hvTWeAEcnI6+f36GfZDiRWFBVXcwHJmWLER4oYoS5S6bUS78Gdt9ENc1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="137889031"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="137889031"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CEF4714273D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F525F314C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F13A2009954D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 503841A00A0;
	Tue, 20 Feb 2024 16:54:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/26] python3-watchdog: upgrade 3.0.0 -> 4.0.0
Date: Tue, 20 Feb 2024 16:54:37 +0800
Message-Id: <1708419281-26047-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--6.030400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwK5I+5JVbn7pFz
	JQEhbMPx1wqbhqaYpjgo6ikEEzC7AY8iv1am7RhcA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYhLcV7UK0NRt3PhwfmFb3pg7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2Szkm660H93kIrn4XdcwazSlRg+Vo1WdTNH/wf9jIjkVFr0
	YrVvQUa
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108942

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Drop support for Python 3.7.
-Add support for Python 3.12.
-Add typing to dirsnapshot (#1012)
-Added DirectorySnapshotDiff.ContextManager (#1011)
-FileSystemEvent, and subclasses, are now dataclass"es, and their "repr() has changed
-WinAPINativeEvent is now a dataclass, and its repr() has changed
-Log FileOpenedEvent, and FileClosedEvent, events in LoggingEventHandler
-Improve FileSystemEvent coverage
-Log all events in LoggerTrick
-The observers.read_directory_changes.WATCHDOG_TRAVERSE_MOVED_DIR_DELAY hack was removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_3.0.0.bb => python3-watchdog_4.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_3.0.0.bb => python3-watchdog_4.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
index bcd64892a..dacf4e234 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "4d98a320595da7a7c5a18fc48cb633c2e73cda78f93cac2ef42d42bf609a33f9"
+SRC_URI[sha256sum] = "e3e7065cbdabe6183ab82199d7a4f6b3ba0a438c5a512a68559846ccb76a78ec"
 
 inherit pypi setuptools3
 
-- 
2.34.1


