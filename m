Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9ACEDE999
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.18599.1725959017727755256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b4ZC0hf9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959018; x=1757495018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hlkudH9cOKMYs2NUnda2NbOcluLjj0U26ctJkSci/is=;
  b=b4ZC0hf9owWe1hl9Be334Btm1Q0cYPFOqKqlmxo+FCiK2VfU1Pc9sux5
   6Rr4xgui78oTLauQ/4QL1A8quFwZH1sftJWL8MSiXxM3K608q3Go6jOAv
   n4KQBO/z/tF2/5PxTvouSxJafyZEV7zCcF4F45jCc76Qnj9X9ogPvoyzv
   3PnQIKN9m4ZSmUiYn7whitIAywRyVMQdzRTc3jTKQAhBy3oFGiW0VDyi1
   mcq6gb9ZsgOMLo3eZHROmBUmw3djHPZWKHo4Pud6wvLMpXgEKWKDnKYjX
   FLKs+rUO9gbjZ/6Tv82Nn0fnuGzGzQw+GKqo2UubnFSLg1QhJw9PGB9oW
   Q==;
X-CSE-ConnectionGUID: X3O0ScHwSd6yyUuRPv7Edw==
X-CSE-MsgGUID: CQHEeqatQBSj1l/pTGPRIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173293571"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173293571"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F3DB216B904
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3940DD50EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C0EAC411B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 74D201A000B;
	Tue, 10 Sep 2024 17:03:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/42] python3-watchdog: upgrade 4.0.2 -> 5.0.2
Date: Tue, 10 Sep 2024 17:03:04 +0800
Message-Id: <1725958990-5719-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--9.232500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTerTOLiQei0gYz
	GYtVtarBDQxPsr1VIV1YcvIrizzr5S/q42wCanHeLcuLm/SQnrV6AgcdfYvhjJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2DIpcBQ49iRBCE2NlBjIjcB1VGYAjOG0CjxY
	yRBa/qJRhfO/HHiLpy5MIx11wv+CM7AFczfjr/7ALGi3IKc3MaOeY+NojKP1dwa0aRvo3PC4RmG
	a3TZr2m1p4vMrp8YmY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112225

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Enable OS specific Mypy checks
- [watchmedo] Fix tricks argument type of schedule_tricks()
- [kqueue] Fix TypeError: kqueue.control() only accepts positional parameters
- Drop support for Python 3.8
- [core] Enforced usage of proper keyword-arguments
- [core] Renamed the BaseObserverSubclassCallable class to ObserverType
- [inotify] Renamed the inotify_event_struct class to InotifyEventStruct
- [inotify] Renamed the UnsupportedLibc exception to UnsupportedLibcError
- [inotify] Removed the InotifyConstants.IN_CLOSE constant
- [watchmedo] Renamed the LogLevelException exception to LogLevelError
- [watchmedo] Renamed the WatchdogShutdown exception to WatchdogShutdownError
- [windows] Renamed the FILE_NOTIFY_INFORMATION class to FileNotifyInformation
- [windows] Removed the unused WATCHDOG_TRAVERSE_MOVED_DIR_DELAY constant
- [core] Enable disallow_untyped_calls Mypy rule
- [core] Enable disallow_untyped_defs Mypy rule
- [core] Improve typing references for events
- [inotify] Add support for IN_CLOSE_NOWRITE events.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_4.0.2.bb => python3-watchdog_5.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_4.0.2.bb => python3-watchdog_5.0.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_4.0.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_5.0.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-watchdog_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_5.0.2.bb
index ffe5cfad1..ad66523de 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_5.0.2.bb
@@ -4,7 +4,7 @@ DEPENDS = "python3-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "b4dfbb6c49221be4535623ea4474a4d6ee0a9cef4a80b20c28db4d858b64e270"
+SRC_URI[sha256sum] = "dcebf7e475001d2cdeb020be630dc5b687e9acdd60d16fea6bb4508e7b94cf76"
 
 inherit pypi setuptools3
 
-- 
2.34.1


