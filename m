Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29BEEE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 06:59:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.53049.1694415581448425803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 23:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="131616185"
X-IronPort-AV: E=Sophos;i="6.02,243,1688396400"; 
   d="scan'208";a="131616185"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 15:59:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E74DA9FD82
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 15:59:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33831D9691
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 15:59:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0F9C6BF44;
	Mon, 11 Sep 2023 15:59:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] freerdp: upgrade 2.10.0 -> 2.11.0
Date: Mon, 11 Sep 2023 14:59:31 +0800
Message-Id: <1694415571-3429-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27868.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27868.005
X-TMASE-Result: 10-0.807800-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhL+I
	hmgj6NxWSUQWNWP9oCxU1CACweeL4Mhblrt58TvtatGCGdi/nWrAQzqh8D4IY1SOymiJfTYXuCe
	I1XiMk/C7EluFw7wmCRK4lG1JTzijWjws5pdLmBb8dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bjSAa8O4E9d0L/8yUNGojyb1Ht3BefL9t203YawHJvPC8bHRUazq99RTqGRAXj8KbTuHX
	SK1vckVfyv3Al3oq/d5OPD8XJFfpB8TzIzimOwPbdTuPa9VRGvEQdG7H66TyHEqm8QYBtMOMH+2
	eKp4Fep+IOX0CP0Xl3OsevbeH1ibi7UX97Un0gFjTjmjxn1yZzQWxAsWoa00D+JL9kVi7iykPLf
	2MPw9arZk4rv23hyygr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 06:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104835

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
 .../0001-Fix-const-qualifier-error.patch      | 30 +++++++++++++++++++
 .../{freerdp_2.10.0.bb => freerdp_2.11.0.bb}  |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.10.0.bb => freerdp_2.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
new file mode 100644
index 0000000000..39c97baab4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
@@ -0,0 +1,30 @@
+Subject: [PATCH] Fix const qualifier error
+
+Fixes clang error
+error: incompatible function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(void *)') from 'void *(const void *)' [-Wincompatible-function-pointer-types]
+|         obj->fnObjectNew = uwac_event_clone;
+|                          ^ ~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ client/Wayland/wlfreerdp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/Wayland/wlfreerdp.c b/client/Wayland/wlfreerdp.c
+index 65e29bc..5988aed 100644
+--- a/client/Wayland/wlfreerdp.c
++++ b/client/Wayland/wlfreerdp.c
+@@ -587,7 +587,7 @@ static void wlf_client_free(freerdp* instance, rdpContext* context)
+ 	DeleteCriticalSection(&wlf->critical);
+ }
+ 
+-static void* uwac_event_clone(const void* val)
++static void* uwac_event_clone(void* val)
+ {
+ 	UwacEvent* copy;
+ 	UwacEvent* ev = (UwacEvent*)val;
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


