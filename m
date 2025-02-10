Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00C7C021B3
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.46462.1739178118915531523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YmyHE/4a;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178123; x=1770714123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YHvyHS6cKS+zM59hzUjXsKQJoVyTW/TgabXEqqqec08=;
  b=YmyHE/4aq8/FtNEj8ttfxHEomXmVNmFzMW90gs8ovkLq99V1+EP9kim6
   ampnAHBJCUvcSACFACj6kZss93/BJOnyPH1Rtc/Iu85uAjlE9bQj+wTkX
   4vaPJOq2wTXDmDKnr7pUtfje8P6gVCRQ662rVJOd2JgdM1oT+2zF585+2
   /ey2xS5Y+qdil8boqlkuwGXQf4vBBjFQ+UJ2VJ92byWhjYoie6TK+nWfo
   CzQK3JFqvO1fDf/pdqUnNjumFXBSAvncm1YnHb4sb7X0CsdgIacuOtdL7
   SHPP1cmDYZksaEhy5E+3ljE6isQohU0B2Z98YGRguMM+9fNUdwiwz20BM
   Q==;
X-CSE-ConnectionGUID: ltScTaYoRP+FY7PsCKUJdA==
X-CSE-MsgGUID: lHSITm10TSCD4BQGQExf2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189493093"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189493093"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70C02D501D
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 310A0D968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C889F1A006C;
	Mon, 10 Feb 2025 17:01:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/66] python3-eventlet: upgrade 0.37.0 -> 0.39.0
Date: Mon, 10 Feb 2025 17:01:04 +0800
Message-Id: <1739178095-26432-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115363

From: Wang Mingyu <wangmy@fujitsu.com>

d19ad6cc086684ee74db250f5fd35227c98e678a.patch
refreshed for 0.39.0

Changelog:
============
* Remove monotonic from requirements
* wsgi: Clean up some override logic
* Correct line lookup from inspect.getsourcelines()
* Drop support of Python 3.7
* Calling eventlet.sleep(0) isn't really blocking, so don't blow up
* fix the monkey patching with the asyncio hub
* introduce the unmonkeypatching feature
* Python 3.13: Use greenthread's dead state where possible
* bump github Actions
* Fix bug where asyncio hub didn't support multiple os threads
* Python 3.13 Support
* wsgi: server MUST NOT send Content-Length/Transfer-Encoding header in response with a status code of 1xx, 204 or (2xx to CONNECT request)
* wsgi: No request Content-Length nor Transfer-Encoding implies no body

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../d19ad6cc086684ee74db250f5fd35227c98e678a.patch  | 13 +++++++++----
 ...ventlet_0.37.0.bb => python3-eventlet_0.39.0.bb} |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.37.0.bb => python3-eventlet_0.39.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch b/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
index f8a268309a..fd0fc91d25 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
+++ b/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
@@ -11,17 +11,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/eventlet/green/thread.py b/eventlet/green/thread.py
-index 053a1c3c6..384b3c290 100644
+index 224cd1c..c70c9e8 100644
 --- a/eventlet/green/thread.py
 +++ b/eventlet/green/thread.py
-@@ -118,3 +118,10 @@ def stack_size(size=None):
- 
+@@ -174,5 +174,12 @@ from eventlet.corolocal import local as _local
  if hasattr(__thread, 'daemon_threads_allowed'):
      daemon_threads_allowed = __thread.daemon_threads_allowed
-+
+ 
 +if hasattr(__thread, 'start_joinable_thread'):
 +    start_joinable_thread = __thread.start_joinable_thread
 +    _shutdown = __thread._shutdown
 +    _make_thread_handle = __thread._make_thread_handle
 +    _ThreadHandle = __thread._ThreadHandle
 +    _get_main_thread_ident = __thread._get_main_thread_ident
++
+ if hasattr(__thread, '_shutdown'):
+     _shutdown = __thread._shutdown
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.39.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.39.0.bb
index df23162e05..99f11b104f 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.39.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "fa49bf5a549cdbaa06919679979ea022ac8f8f3cf0499f26849a1cd8e64c30b1"
+SRC_URI[sha256sum] = "01ba0aa6ee2452690fc02b274a2409598a13b997c7b5af9dc66600fa42015a79"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


