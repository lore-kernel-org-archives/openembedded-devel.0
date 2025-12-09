Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12859D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:21 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4156.1765274238451371134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N4n40YQ+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274239; x=1796810239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2SpaeAhn7YpcZpKIaonHLbcwnWx6PCj3Q4KCxrWlhwU=;
  b=N4n40YQ+CUcgEvDBZKEtHXzDyYEfqDp72rCYzaHdepoXhUPs4MrQtmyO
   KR4CEuJ7JJWVuoa5dDH/FpNJ5FtfWVMz4H6dgT2lwqgGDgbBciIch906B
   8Xp7Jn+5LCPzc3420CxGZ6SxQx11hwYAFrPGrkid/9AtLxf12KIcnTu/2
   FGMtDM1GvaQPvLw0RIUfMmtHdfRspyb/F7/apy5T2BajZC7om/qKXOzY/
   6MHrmkea/8Lo9YiObIv0Jvf+nGCpcaaj2hl+U+91mQZxzKM2YEbGbnZip
   WrZbbE68hGNPVHI6Ha6m0TTYuCeAbCCXPQSzUjRTJi1lY4K5/X++oMU5T
   w==;
X-CSE-ConnectionGUID: 66mWP8vbToSji/Y6IdHM4g==
X-CSE-MsgGUID: yA5erWWGScWM69b8LYnfKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221968215"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221968215"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:17 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D7CB71451
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:16 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9ADCE18019B0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 3729920002AF;
	Tue,  9 Dec 2025 09:57:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/38] usb-modeswitch: upgrade 2.6.1 -> 2.6.2
Date: Tue,  9 Dec 2025 17:55:51 +0800
Message-ID: <20251209095552.690-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122441

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-with-gcc-15.patch
removed since it's included in 2.6.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-build-with-gcc-15.patch          | 51 -------------------
 ...witch_2.6.1.bb => usb-modeswitch_2.6.2.bb} |  6 +--
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb => usb-modeswitch_2.6.2.bb} (86%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
deleted file mode 100644
index eb65beb686..0000000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f497eef1f38bd79a96a13269f251f1413c54b790 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Tue, 25 Mar 2025 12:36:32 +0100
-Subject: [PATCH] Fix build with gcc-15
-
-* fixes:
-  http://errors.yoctoproject.org/Errors/Details/848747/
-
-usb_modeswitch.c: In function 'main':
-usb_modeswitch.c:573:28: error: too many arguments to function 'get_current_config_value'; expected 0, have 1
-  573 |         currentConfigVal = get_current_config_value(dev);
-      |                            ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~
-In file included from usb_modeswitch.c:59:
-usb_modeswitch.h:55:5: note: declared here
-   55 | int get_current_config_value();
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~
-usb_modeswitch.c:775:52: error: too many arguments to function 'get_current_config_value'; expected 0, have 1
-  775 |                                 currentConfigVal = get_current_config_value(dev);
-      |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~
-usb_modeswitch.h:55:5: note: declared here
-   55 | int get_current_config_value();
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?t=3122]
----
- usb_modeswitch.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/usb_modeswitch.c b/usb_modeswitch.c
-index 2d4c0aa..bfbcbfb 100644
---- a/usb_modeswitch.c
-+++ b/usb_modeswitch.c
-@@ -570,7 +570,7 @@ int main(int argc, char **argv)
- 	/* Get current configuration of default device, note value if Configuration
- 	 * parameter is set. Also sets active_config
- 	 */
--	currentConfigVal = get_current_config_value(dev);
-+	currentConfigVal = get_current_config_value();
- 	if (Configuration > -1) {
- 		SHOW_PROGRESS(output,"Current configuration number is %d\n", currentConfigVal);
- 	} else
-@@ -772,7 +772,7 @@ int main(int argc, char **argv)
- 	if (Configuration > 0) {
- 		if (currentConfigVal != Configuration) {
- 			if (switchConfiguration()) {
--				currentConfigVal = get_current_config_value(dev);
-+				currentConfigVal = get_current_config_value();
- 				if (currentConfigVal == Configuration) {
- 					SHOW_PROGRESS(output,"The configuration was set successfully\n");
- 				} else {
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
similarity index 86%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
index b6b720fe1e..af2b5b6491 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 
 DEPENDS = "libusb1"
 
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2 \
-    file://0001-Fix-build-with-gcc-15.patch \
-"
-SRC_URI[sha256sum] = "5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34"
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66"
 
 inherit pkgconfig systemd
 
-- 
2.43.0


