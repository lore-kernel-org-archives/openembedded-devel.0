Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1CFCDD552
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.11422.1726716751540640504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FL3RyiwS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716752; x=1758252752;
  h=from:to:cc:subject:date:message-id;
  bh=XYoohU/1dP+x27n7yp5meDNNfy6MUcCCpNL4zK+UgiE=;
  b=FL3RyiwSNKNCDHGGwF2tsIbsni3N3qQglsxMxnZXBlt+NqvtXIaUCFxU
   A8R4jleq8ia7lbciZgMq/h1VDKbfjwjuj6l6B99Y6RET3sdg7LNR0Zi9q
   trA2DfSFVgCx/eyTPaI9o+fPrcoH7VTOzHXp0l2mNbTl+my3z9z4O1PyD
   urQmTIw6RAxvkq9BeJIsc/UQf12jS9UDv8UuV5wbTJvzR9kD+OqmnvHfp
   Rnd4Rve7kbZVdg7orFg7k3y/4CCaRERepsaL053Q5YDPuJXrDljwRY7sY
   Ea81Ud+E7OXbT8j2XzWFlZMJhZF7uqDEw20htPsJhvNkX5cbf2aI33Usb
   A==;
X-CSE-ConnectionGUID: 58Ejjk6lRZezUoatWIsGYA==
X-CSE-MsgGUID: MWazzAFMRCeMrBI4WEbJTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="173360347"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="173360347"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70096E428A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B21CD5105
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0661720086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71CFA1A000A;
	Thu, 19 Sep 2024 11:32:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/28] bdwgc: upgrade 8.2.6 -> 8.2.8
Date: Thu, 19 Sep 2024 11:31:46 +0800
Message-Id: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-8.379000-10.000000
X-TMASE-MatchedRID: vQr1bp/0ccWjz0nOeth/yY6MisxJraxHjlRp8uau9obMznuCBypbE1P/
	rSiKhsFsSaS3/1XjNrgH4snLZ5t2ZvNw+jYG2GN3RZfQN+FVqbBiMNd0z/HZU3hh5KUdlgWi6Z4
	+zO31vRf/ixwGSXguAMXRVgeLxYloBhg5qTA0S18Cg1rav4R3DdDEMPvvoocvmbc4hVJ/g/kC7Q
	L/G+H9KA+Quh6LigO3TEE71fB5a1zkX/AQvOtoj1yuZHgmvm5owXotg6ps9+Ef/28+P8WCgBKTG
	NKPwaynF3PYCvZz9oOB88uX8Ttm5bmvMSppeWbNupDIC9422DoYFQt+VRO1dBafr+KSjLTCOEya
	ucyI0CGN/ziTW5bneOpe9co8GDkGbRev5+PfDD9O5y1KmK5bJTZlY6a4lRLZOhR0VsdhRrCkTRR
	+0+D9U2Jdz9+fRP5SxpY5fcXTpeE3KXWd30Ii3RRFJJyf5BJe3QfwsVk0UbuGrPnef/I+es+xDH
	xbeH38o/5MKmWSkcdqJlMDUHXn8/jqMhHPONuKTuOa7oV5hIYa9VC8kon1coEcRpiLXMgRq+gYp
	cOyA9G/FK2IzIxgGw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112363

From: Wang Mingyu <wangmy@fujitsu.com>

Chaneglog:
=========
* Allow GC_size() argument to be null
* Disable backtrace saving at garbage collections if DONT_SAVE_TO_LAST_STACK
* Eliminate 'cast signed to bigger unsigned' CSA warnings in GC_find_limit
* Eliminate 'x might be clobbered by longjmp' gcc warning in setjmp_t.c
* Fix 'un-mprotect vdb failed' abort with out-of-memory reason on Linux
* Fix ADD_CALL_CHAIN() placement to follow GC_store_debug_info_inner call
* Fix GC_debug_realloc to support custom kind
* Fix GC_is_visible for case of arg pointing exactly to object upper bound
* Fix GC_print_trace_inner to print the last element of the circular buffer
* Fix cordtst2.tmp file deletion in cordtest on Windows
* Fix double lock in GC_malloc called from backtrace()
* Fix handling of page-unaligned boundaries in soft_set_grungy_pages
* Fix heap blocks size computation by GC_get_memory_use
* Fix indent of a closing curly braces in GC_apply_to_all_blocks
* Fix infinite resend lost signals if a thread is restarted by SIGQUIT
* Fix null pointer dereference in GC_is_visible if type_descr is null
* Fix per_object_helper() after changing hb_sz units
* Fix pointer relational comparison in GC_do_enumerate_reachable_objects
* Fix poor thread-local allocation performance because of double EXTRA_BYTES
* Fix potential GC_add_roots_inner call with an overflowed pointer (Win32)
* Fix potential address overflow in GC_add_to_heap
* Fix potential buffer overrun during read in GC_text_mapping
* Fix various typos in comments
* Prevent GC_noop_sink from scanning by the collector
* Prevent redirected malloc call from a garbage collection routine
* Redirect malloc_usable_size() in leak_detector.h
* Remove redundant dirty/reachable_here calls in GC_malloc_explicitly_typed
* Update and fix diagrams describing the tree structure for pointer lookups
* Use atomic store to set GC_first_nonempty in GC_do_parallel_mark
* Use atomic store to set entry id and update cache_ptr in slow_getspecific
* Workaround '.obj file not found' error reported by watcom wlib

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/bdwgc/{bdwgc_8.2.6.bb => bdwgc_8.2.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb => bdwgc_8.2.8.bb} (96%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
similarity index 96%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
index a5a7a6365..fe51c1029 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=dd27361ad00943bb27bc3e0589037075"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "e340b2e869e02718de9c9d7fa440ef4b35785388"
+SRCREV = "ee59af3722e56de8404de6cd0c21c2493cc4d855"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


