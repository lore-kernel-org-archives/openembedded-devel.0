Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D5CE6BF2B
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 16:25:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14536.1769790312548829527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 08:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ElkQA1Db;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1961997f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769790311; x=1770395111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAOfWtgmyZ8+p3KpQub6DBZP5oMPNTvIGg5Sx39lemY=;
        b=ElkQA1DbYGC8ATYfROHdDIdr3W0HvVnTIGCGYT0MGlfxN9CsL6VoW+Nl6W7Nc9V4ME
         5ouRGl8QqMVY1i+k9MRObpVKqBUXGX01CCaNc+T0SxpZpjIPGVjm/E7Mn7/RdRaUuYD7
         4gzh4BVkE8E393TMtmyadArlrQ08p8NFfFAktl0zglBCWL/DB8/AxPvww+h5w9Y9LOI5
         yY3fWBhAseK0kHYP5i2IAAsj1hEdRDHR4ZmkigPXpblvRI5LYr/ij7LSnLET73QwH3Vi
         Zpie8ETw89/I11a9llg+5Rn38aBKj/wrSaBRUH6MhX6Jqvy5qYN2Kg8zXjNcXMqeDo80
         PjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769790311; x=1770395111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAOfWtgmyZ8+p3KpQub6DBZP5oMPNTvIGg5Sx39lemY=;
        b=QSz05Hjhhe3QonMOYemQbuAUxyTXssOPiQaHMXuTcC9THuyMvziT+yZALO9yVvRxAZ
         w771a/Js09QQJFIFnJmwQ++reF/1R1P8Z5HwcoXCZvxBgWQ24vaOyULMWZ7l2CwqIcfI
         KoRc500XvPjhEcw5DIbTtQGyrqtYLReQhXcKKlrx0qfIVlBDQxvlDe5X2xvGtEss1k5D
         zgXgLOFEkOdnFbXsaxKPYX/NJvMpaVOIMvweOcRqR8+PmcaH8OkD4aLkV0wAr/BbfC/0
         UUmKSwwJDGIWu5WDZMQu7KjdtmALsWzntQcXbkMbxBh7wcksBCwExEi93XoHVoFImM4i
         YD3w==
X-Gm-Message-State: AOJu0YwqgkHPmr7IeBTYd0jL/Jrb5Pf7uMCwMIoMV4s2zX1HdYKS1xxy
	UfbOrwrNbQ+WwAFy/vKq2dsZRtUVTT1HxnZm5QGhWaN9pEaSk0zYv0gf/yM51Q==
X-Gm-Gg: AZuq6aLZgmTVKyGKl8usYGI/S7ghGcHoaxYLNtIcrgb4VpL3PfNuv60eBOL9ps+6KGl
	8WFLUlf4q/c3R3MysUyjHdKO87MEWyIds/v2uKhhi/qI4kljKzsCEGyZom7IlHgOHAg9YliL3Sx
	hTTyRQuE5GO8U8SpHWy1XE3DS2XLykkAzJUjDp0ehI8GoPBcpJo/JO6nN4mj55Tujk4jMA8MBKx
	JttCiPOoKy3gSPni8Ggk53aq9IZs52tYcL+bEl29P1EfeVYUu4lriaUX72St72z2sNwa0jxO6pf
	c5ZULugHqt9pwgHQmUOkQoiY1PFrmZ9ILXE0MNdpCqP2ucvnaszrdGK9Vx9SBokv+EoYj/YF4pS
	EyDExGuldT5r3v/B6YvIh278N9lcTxGriO8GKsYEYxBlqNCzlBxiRPxkjrr0vaLHOQNUUSPUeXA
	B7o24f/Cg7
X-Received: by 2002:a05:6000:4023:b0:435:dd87:fc2d with SMTP id ffacd0b85a97d-435f3aac80dmr5070852f8f.45.1769790310704;
        Fri, 30 Jan 2026 08:25:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm23625810f8f.41.2026.01.30.08.25.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:25:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] libimobiledevice: upgrade to 1.4.0
Date: Fri, 30 Jan 2026 17:25:07 +0100
Message-ID: <20260130162508.664574-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130162508.664574-1-skandigraun@gmail.com>
References: <20260130162508.664574-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 16:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124015

Delete patch that's included in this release.

Changelog:
  - Add support for MbedTLS
  - Add Reverse Proxy implementation
  - Add support for wireless pairing (AppleTV)
  - Embed 3rd party libraries for ed25519 and SRP6a
  - Fixes in idevicedebug
  - idevicecrashreport: Allow filtering crash reports by filename
  - Add idevicedevmodectl tool
  - Fixes for idevicebackup2
  - Add property_list_client_get_service_client() and service_get_connection() functions
  - Add idevicebtlogger
  - Add new idevice_events_subscribe/unsubscribe API
  - Move LIBIMOBILEDEVICE_API to public headers
  - Add afc_strerror function
  - Add libimobiledevice_version() function
  - Use libimobiledevice-glue's SHA1 implementation
  - Add support for iOS 17+ Personalized Developer Disk image mounting
  - Fix compilation on MSVC
  - Add idevice_strerror() to interface
  - Add new idevice_get_device_version() to interface
  - Add os_trace_relay service implementation
  - Fixes for idevicesyslog
  - afc: Add afc_get_file_info_plist and afc_get_device_info_plist functions
  ... and several other internal changes

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-include-unistd.h-for-usleep.patch    | 31 -------------------
 ...evice_git.bb => libimobiledevice_1.4.0.bb} |  9 ++----
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch
 rename meta-oe/recipes-connectivity/libimobiledevice/{libimobiledevice_git.bb => libimobiledevice_1.4.0.bb} (73%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch
deleted file mode 100644
index 424a203e56..0000000000
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice/0001-include-unistd.h-for-usleep.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6cb8069cfe08114f1dc7b50a7fcd4dc040cd1bbb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 May 2023 20:19:23 -0700
-Subject: [PATCH] include unistd.h for usleep()
-
-clang16 flags the missing header
-
-Fixes
-../../git/tools/idevicedevmodectl.c:363:2: error: call to undeclared function 'usleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-Upstream-Status: Submitted [https://github.com/libimobiledevice/libimobiledevice/pull/1444]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/idevicedevmodectl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/idevicedevmodectl.c b/tools/idevicedevmodectl.c
-index 739bc13..9fe8d6a 100644
---- a/tools/idevicedevmodectl.c
-+++ b/tools/idevicedevmodectl.c
-@@ -34,6 +34,7 @@
- #ifndef WIN32
- #include <signal.h>
- #endif
-+#include <unistd.h>
- 
- #ifdef WIN32
- #include <windows.h>
--- 
-2.40.1
-
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb
similarity index 73%
rename from meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
rename to meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb
index 3c93c9a37b..eeae93e261 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb
@@ -6,13 +6,10 @@ LIC_FILES_CHKSUM = "\
 "
 HOMEPAGE = "http://www.libimobiledevice.org/"
 
-DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libimobiledevice-glue openssl"
+DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libimobiledevice-glue openssl libtatsu"
 
-PV = "1.3.0+git"
-
-SRCREV = "860ffb707af3af94467d2ece4ad258dda957c6cd"
-SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master \
-           file://0001-include-unistd.h-for-usleep.patch"
+SRCREV = "149f7623c672c1fa73122c7119a12bfc0012f2ac"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master;tag=${PV}"
 
 inherit autotools pkgconfig
 

