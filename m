Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6309FEE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 09:07:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.54450.1694423234432107632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Sep 2023 02:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="131118606"
X-IronPort-AV: E=Sophos;i="6.02,243,1688396400"; 
   d="scan'208";a="131118606"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 18:07:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 43FEFC68E2
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 18:07:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EB56D3F10
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 18:07:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id ECE706BF4B;
	Mon, 11 Sep 2023 18:07:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v3] freerdp: upgrade 2.10.0 -> 2.11.0
Date: Mon, 11 Sep 2023 17:07:03 +0800
Message-Id: <1694423223-4258-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27868.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27868.006
X-TMASE-Result: 10--2.715900-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhL+I
	hmgj6NxWSUQWNWP9oCxU1CACweeL4Mhblrt58TvtatGCGdi/nWrAQzqh8D4IY1SOymiJfTYXuCe
	I1XiMk/C7EluFw7wmCRK4lG1JTzijWjws5pdLmBb8dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bjSAa8O4E9d0L/8yUNGojyb1Ht3BefL9t203YawHJvPC8bHRUazq99QR34ro7k23nbqSN
	KTkl986XPeMuP6emxmGjW1HmbIRAfKZUMHzJkSUngIgpj8eDcCbifj2/J/1cUp0ODI8GjvXKrau
	Xd3MZDVepfvh/AFWPanFLc9TUZaMQesN9CY7bz2AsHZlIuMxzeb8j5+Dg8iozX4LPwAWMq5dfJB
	6VP2fNpWSSMHqWZBO3+ZIUgG/AvoyoB4P7dCh9lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 09:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104836

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-const-qualifier-error.patch
added to fix error with clang

Changelog:
===========
Noteworthy changes:
* Various input validation fixes
* Added various CMake options #9317
* LibreSSL build fixes #8709

Fixed issues:
* Backported #9233: Big endian support
* Backported #9099: Mouse grabbing support
* Backported #6851: wayland scrolling fix
* Backported #8690: Update h264 to use new FFMPEG API
* Backported #7306: early bail from update_read_window_state_order breaks protocol
* Backported #8903: rdpecam/server: Remove wrong assertion
* Backported #8994: bounds checks for gdi/gfx rectangles
* Backported #9023: enforce rdpdr client side state checks
* Backported #6331: deactivate mouse grabbing by default
* Cherry-pick out of #9172: channels/cliprdr: Fix writing incorrect PDU type for unlock PDUs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-const-qualifier-error.patch      | 57 +++++++++++++++++++
 .../{freerdp_2.10.0.bb => freerdp_2.11.0.bb}  |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.10.0.bb => freerdp_2.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
new file mode 100644
index 0000000000..87a456d16d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
@@ -0,0 +1,57 @@
+From 761b4df04a141cc8c9507c741e4046c6c6b00491 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Mon, 11 Sep 2023 09:00:39 +0000
+Subject: [PATCH] Fix const qualifier error
+
+Fixes clang error
+error: incompatible function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(void *)') from 'void *(const void *)' [-Wincompatible-function-pointer-types]
+|         obj->fnObjectNew = uwac_event_clone;
+|                          ^ ~~~~~~~~~~~~~~~~
+
+https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430eceddebd9dee8
+Upstream-Status: Backport
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ libfreerdp/codec/rfx.c            | 4 ++--
+ winpr/include/winpr/collections.h | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
+index ccbc5af..eec7365 100644
+--- a/libfreerdp/codec/rfx.c
++++ b/libfreerdp/codec/rfx.c
+@@ -153,7 +153,7 @@ static void rfx_tile_init(void* obj)
+ 	}
+ }
+ 
+-static void* rfx_decoder_tile_new(void* val)
++static void* rfx_decoder_tile_new(const void* val)
+ {
+ 	RFX_TILE* tile = NULL;
+ 	WINPR_UNUSED(val);
+@@ -184,7 +184,7 @@ static void rfx_decoder_tile_free(void* obj)
+ 	}
+ }
+ 
+-static void* rfx_encoder_tile_new(void* val)
++static void* rfx_encoder_tile_new(const void* val)
+ {
+ 	WINPR_UNUSED(val);
+ 	return calloc(1, sizeof(RFX_TILE));
+diff --git a/winpr/include/winpr/collections.h b/winpr/include/winpr/collections.h
+index 807f011..b8c8d9d 100644
+--- a/winpr/include/winpr/collections.h
++++ b/winpr/include/winpr/collections.h
+@@ -36,7 +36,7 @@ extern "C"
+ {
+ #endif
+ 
+-	typedef void* (*OBJECT_NEW_FN)(void* val);
++	typedef void* (*OBJECT_NEW_FN)(const void* val);
+ 	typedef void (*OBJECT_INIT_FN)(void* obj);
+ 	typedef void (*OBJECT_UNINIT_FN)(void* obj);
+ 	typedef void (*OBJECT_FREE_FN)(void* obj);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
similarity index 96%
rename from meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
index 4cb452608e..4a5a763c8e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
@@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "7471ae383e7b7a613f275e19f7b54958a193c891"
+SRCREV = "1384b3c33b9bd7599633cc54bf20cf20ec6be83c"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
+           file://0001-Fix-const-qualifier-error.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


