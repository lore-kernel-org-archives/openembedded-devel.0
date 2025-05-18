Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF33C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 10:50:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.28273.1747565434841026185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 03:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dNnjNDic;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441ab63a415so38502105e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565433; x=1748170233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmhA8tWPdJLnqDwMek9YhgQLreS7pOgk4laPnKqAXYY=;
        b=dNnjNDicIhGD/Yru+WjFRKlmfba5ddewVjDbzKdJ8mMjViHwHQQhJPupf1nMUSJrl6
         haAHTlL7y66GJJ6ri0x3aP46Lod+4Sc9WSqWS6+bwpyhg0r4W2MRPBMg+s0waVgdUPhn
         KY5SrtLtFXxtHFqLhisUKEqBKYyytExJT2dqLWE/8PFlLH9lCYxk/X8DZ8zAfOb1lpkU
         BJQJG6ZKiYXM3EbiskVLz2Ls8FsuUJu8fR/Ltvm7j7LCv8y9vLklhAl5zcU+TZgLGvIi
         /7+ZYMWbthlFDBn3Q0XsjfWbUxIOMICmPUr3xXg+lln3sZuHgOvA6UbPMDd1Its0T+nw
         eJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565433; x=1748170233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmhA8tWPdJLnqDwMek9YhgQLreS7pOgk4laPnKqAXYY=;
        b=tBE+rSP6xwj70B5csMussefLX4RcL1y454itm0TtyPUkJTBhd9APu4dKmOneiVJiqy
         XrasQFc7563KJlh0jIIZHLaor2ayP9FuLWylOvSkScAvXiT/+gOxptOdR1SCJHoew+w6
         no3uwqJ6GeZWJy1DElq9BIRxw1Sog7MC30uOXr6L2OBNWeeNPhwBODY3w91ZWGMUhwvd
         z3u65J6uRUyLQL5tz+9EQdRHcUSTSy0YD+UFOtgZQuhGBlaJBrNx5qLkcEXoglyPTdka
         0Z3W4y//RIAMMw7ijWAQGqZwtUTVekwPRqBecSCrdNjIBfmowGb3n/AT/7llafGkCt+X
         8EYg==
X-Gm-Message-State: AOJu0YwYDyZyNFMDc2/qQvvPvvu53gj2AuzaajSFHjjVED+I1sl97e7g
	UTPNZ+q3ueoZbxWpLOuzXd6EULDrlV8ne7LRy5uGhwo8cnge+WJVU9GHBhJJIQC5
X-Gm-Gg: ASbGncvyPFmNrb8iSNwbyd1/AY7E3TK0/vBWeE7G1/quAXF5EXI6DMFhnCdk+If+8Ao
	w3hOSCfNa8/BlCjM0qa0XNu/Z/1vO1rlwIRkzqlQEHTb/fkK6kmIjqQO/DsjgzC5/nTc8X0Et0k
	q6BbhIjE7qCYKOCXW7iXFFZ1bPylLpPUGTVmOOovVSzi72ZreV5TrhKdC6CdQvY4AC4MpyNW/4x
	SevtzsOE2xr2A0ZUyVLwsw9nGzsTSynEdaT/NlpBusSzddP3Bh81eWwXi33CIJSCjR2sCzsyVKs
	sWjbJ395cLQOhEo8XUUYg9tu8DyTRH+Wqk2obgXwigDDR6kg7SFc46L++D7XjcI3NwDb0LXPl2E
	OLJ2DzLIawIA766dONDU=
X-Google-Smtp-Source: AGHT+IG+dbxCJVZE3rhze23WP5ZFGXHzjLyDaSsKOrl5teEG6WnEWO/zzZh1kEhgTB1hAt3HRXOAAg==
X-Received: by 2002:a05:600d:19:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-442fd6313f4mr66072395e9.18.1747565432303;
        Sun, 18 May 2025 03:50:32 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef87asm169552435e9.36.2025.05.18.03.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:50:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2559.80.8 -> 2600.100.147
Date: Sun, 18 May 2025 10:49:53 +0000
Message-ID: <20250518104952.2679-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 10:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117451

Drop fixes which are upstream (fixed differently):

* 0001-Fix-SIGSEGV-during-DumpStateLog.patch
* 0004-Add-definition-for-MAX.patch

Upstream has significantly reworked the netlink handling, this breaks the
existing patches which:

* Rework the interface handling from a bitbmap into a list
* Include checks for significant changes to interfaces before discarding the
  entire set and restarting
* A fix for deleting interfaces

The upstream code appears to handle the latter two cases, the former was
noted as a problem on Android in 2017.

Drop all these changes and hope that they are indeed resolved; the upstream
changes appear to be based on code from the matter-openwrt tree (authored by
Apple):

https://github.com/project-chip/matter-openwrt/tree/main/third_party/mdnsresponder/patches

Refresh all other patches.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...utine-for-cleaning-recent-interfaces.patch |  58 ----
 ...0001-Fix-SIGSEGV-during-DumpStateLog.patch |  27 --
 .../mdns/0001-Fix-build-with-gcc-15.patch     |   7 +-
 ...01-Handle-interface-without-ifa_addr.patch |  38 ---
 .../0001-dns-sd-Include-missing-headers.patch |   2 +-
 ...outine-for-tearing-down-an-interface.patch |  56 ----
 ...ke-Set-libdns_sd.so-soname-correctly.patch |   6 +-
 .../0003-Track-interface-socket-family.patch  |  48 ----
 .../mdns/0004-Add-definition-for-MAX.patch    |  24 --
 ...cate-loopback-interface-to-mDNS-core.patch |  55 ----
 ...-Separate-TLS-targets-from-libraries.patch |   4 +-
 .../0005-Fix-missing-limit-declarations.patch |  12 +-
 ...0005-Use-list-for-changed-interfaces.patch | 166 ------------
 ...-mDNSCore-Fix-broken-debug-parameter.patch |   6 +-
 .../0006-Handle-noisy-netlink-sockets.patch   | 249 ------------------
 .../0006-make-Add-top-level-Makefile.patch    |   2 +-
 ...-deleted-interfaces-as-being-changed.patch |  37 ---
 ...0008-Handle-errors-from-socket-calls.patch |  60 -----
 .../mdns/0009-remove-unneeded-headers.patch   |   2 +-
 ...mdns_2559.80.8.bb => mdns_2600.100.147.bb} |  19 +-
 20 files changed, 23 insertions(+), 855 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_2559.80.8.bb => mdns_2600.100.147.bb} (85%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
deleted file mode 100644
index 68a395d69eef..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 1fefe289d0c907392382eb2fa2f1f0ecac02f85d Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH] Create subroutine for cleaning recent interfaces
-
-Moves functionality for cleaning the list of recent
-interfaces into its own subroutine.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
- 1 file changed, 14 insertions(+), 10 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 3b761d04e3c4..5aa220cf694e 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
-     return err;
- }
- 
-+// Clean up any interfaces that have been hanging around on the RecentInterfaces list for more than a minute
-+mDNSlocal void CleanRecentInterfaces(void)
-+{
-+    PosixNetworkInterface **ri = &gRecentInterfaces;
-+    const mDNSs32 utc = mDNSPlatformUTC();
-+    while (*ri)
-+    {
-+        PosixNetworkInterface *pi = *ri;
-+        if (utc - pi->LastSeen < 60) ri = (PosixNetworkInterface **)&pi->coreIntf.next;
-+        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; mdns_free(pi); }
-+    }
-+}
-+
- // Creates a PosixNetworkInterface for the interface whose IP address is
- // intfAddr and whose name is intfName and registers it with mDNS core.
- mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
-@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
- 
-     // Clean up.
-     if (intfList != NULL) freeifaddrs(intfList);
--
--    // Clean up any interfaces that have been hanging around on the RecentInterfaces list for more than a minute
--    PosixNetworkInterface **ri = &gRecentInterfaces;
--    const mDNSs32 utc = mDNSPlatformUTC();
--    while (*ri)
--    {
--        PosixNetworkInterface *pi = *ri;
--        if (utc - pi->LastSeen < 60) ri = (PosixNetworkInterface **)&pi->coreIntf.next;
--        else { *ri = (PosixNetworkInterface *)pi->coreIntf.next; mdns_free(pi); }
--    }
-+    CleanRecentInterfaces();
- 
-     return err;
- }
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
deleted file mode 100644
index d74c031ab370..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3138d70ce8f521d03120e7789e93ebe290ece101 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Thu, 1 Feb 2024 14:07:03 +0000
-Subject: [PATCH] Fix SIGSEGV during DumpStateLog()
-
-DumpStateLog() calls LogMsgWithLevelv() with category == NULL, avoid
-crashing in this case.
-
-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSShared/mDNSDebug.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mDNSShared/mDNSDebug.c b/mDNSShared/mDNSDebug.c
-index b531fcea2bb9..1e8d9b10afbc 100644
---- a/mDNSShared/mDNSDebug.c
-+++ b/mDNSShared/mDNSDebug.c
-@@ -72,7 +72,7 @@ mDNSlocal void LogMsgWithLevelv(os_log_t category, os_log_type_t level, const ch
- mDNSlocal void LogMsgWithLevelv(const char *category, mDNSLogLevel_t level, const char *format, va_list args)
- {
-     // Do not print the logs if the log category is MDNS_LOG_CATEGORY_DISABLED.
--    if (strcmp(category, MDNS_LOG_CATEGORY_DISABLED) == 0)
-+    if (category && strcmp(category, MDNS_LOG_CATEGORY_DISABLED) == 0)
-     {
-         return;
-     }
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
index 22a9c27aad66..af33d5444cca 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
@@ -1,4 +1,4 @@
-From 189f0d8e9913f4eaca9189f710155ffba9035f7e Mon Sep 17 00:00:00 2001
+From c84f185f29d0839b97177aecb0a78b9717947973 Mon Sep 17 00:00:00 2001
 From: Nguyen Dat Tho <tho3.nguyen@lge.com>
 Date: Wed, 9 Apr 2025 13:05:24 +0900
 Subject: [PATCH] Fix build with gcc-15
@@ -19,7 +19,7 @@ Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/mDNSShared/CommonServices.h b/mDNSShared/CommonServices.h
-index 7efb077..f0f3a8b 100644
+index 7efb077f3b04..f0f3a8b3157e 100644
 --- a/mDNSShared/CommonServices.h
 +++ b/mDNSShared/CommonServices.h
 @@ -192,6 +192,9 @@ extern "C" {
@@ -32,6 +32,3 @@ index 7efb077..f0f3a8b 100644
  
  #elif ( TARGET_OS_SOLARIS )
  
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
deleted file mode 100644
index a531884afcf4..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 199b376e585d5362a1f51ea20e45dcc3bdb7d6aa Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan@agner.ch>
-Date: Fri, 23 Jun 2023 10:10:00 +0200
-Subject: [PATCH] Handle interface without `ifa_addr`
-
-It seems that certain interface types may have `ifa_addr` set to null.
-Handle this case gracefully.
-
-Upstream-Status: Submitted [https://github.com/apple-oss-distributions/mDNSResponder/pull/2/commits/11b410d4d683c90e693c40315997bb3e8ec90e9a]
-
-Signed-off-by: Stefan Agner <stefan@agner.ch>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 4c835a8c253c..e1e27b1de3b2 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1927,6 +1927,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
- 	    continue;
- 
-         if ((ifa_loop4 == NULL) &&
-+            ((*ifi)->ifa_addr != NULL) &&
-             ((*ifi)->ifa_addr->sa_family == AF_INET) &&
-             ((*ifi)->ifa_flags & IFF_UP) &&
-             ((*ifi)->ifa_flags & IFF_LOOPBACK))
-@@ -1935,7 +1936,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
-             continue;
-         }
- 
--        if (     (((*ifi)->ifa_addr->sa_family == AF_INET)
-+        if (     ((*ifi)->ifa_addr != NULL) &&
-+                 (((*ifi)->ifa_addr->sa_family == AF_INET)
- #if HAVE_IPV6
-                   || ((*ifi)->ifa_addr->sa_family == AF_INET6)
- #endif
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index 0dc36ae1d44a..651879ea8695 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -1,4 +1,4 @@
-From a5fe20fa00088683136a09a4da3c36d9b20fe1b9 Mon Sep 17 00:00:00 2001
+From cdbc28c668dd627906f833f9a8e32ac53b0b0139 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 4 Nov 2021 07:31:32 -0700
 Subject: [PATCH] dns-sd: Include missing headers
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
deleted file mode 100644
index 5ce7eb101534..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d265ac9346d3dcbcf1187134318baafcfa75c054 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH] Create subroutine for tearing down an interface
-
-Creates a subroutine for tearing down an interface.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 5aa220cf694e..a6041b04a21e 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixNetworkInterface *intf)
-     gRecentInterfaces = intf;
- }
- 
-+mDNSlocal void TearDownInterface(mDNS *const m, PosixNetworkInterface *intf)
-+{
-+    mDNS_DeregisterInterface(m, &intf->coreIntf, NormalActivation);
-+    if (gMDNSPlatformPosixVerboseLevel > 0) fprintf(stderr, "Deregistered interface %s\n", intf->intfName);
-+    FreePosixNetworkInterface(intf);
-+
-+    num_registered_interfaces--;
-+    if (num_registered_interfaces == 0) {
-+        num_pkts_accepted = 0;
-+        num_pkts_rejected = 0;
-+    }
-+}
-+
- // Grab the first interface, deregister it, free it, and repeat until done.
- mDNSlocal void ClearInterfaceList(mDNS *const m)
- {
-@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const m)
-     while (m->HostInterfaces)
-     {
-         PosixNetworkInterface *intf = (PosixNetworkInterface*)(m->HostInterfaces);
--        mDNS_DeregisterInterface(m, &intf->coreIntf, NormalActivation);
--        if (gMDNSPlatformPosixVerboseLevel > 0) fprintf(stderr, "Deregistered interface %s\n", intf->intfName);
--        FreePosixNetworkInterface(intf);
-+        TearDownInterface(m, intf);
-     }
--    num_registered_interfaces = 0;
--    num_pkts_accepted = 0;
--    num_pkts_rejected = 0;
-+
-+    assert(num_registered_interfaces == 0);
- }
- 
- mDNSlocal int SetupIPv6Socket(int fd)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index 86b659f8a12c..abe8178f6320 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -1,4 +1,4 @@
-From dfa9e2c494d1a834f5bdfe4dc24e8329dd8720eb Mon Sep 17 00:00:00 2001
+From dcc1f39a0918cdebf53ac7c105b3d33df960ed14 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:12 +0000
 Subject: [PATCH] make: Set libdns_sd.so soname correctly
@@ -10,7 +10,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index 041706523139..c877c8bb19e6 100755
+index e05ba10b4340..7c510317f1b6 100755
 --- a/mDNSPosix/Makefile
 +++ b/mDNSPosix/Makefile
 @@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
@@ -21,4 +21,4 @@ index 041706523139..c877c8bb19e6 100755
 +	$(LD) $(SOOPTS) $(LINKOPTS) -Wl,-soname,libdns_sd.$(LDSUFFIX).1 -o $@ $+
  	$(STRIP) $@
  
- Clients: setup libdns_sd ../Clients/build/dns-sd
+ Clients: setup ../Clients/build/dns-sd
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
deleted file mode 100644
index 59871eb66ac6..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 5f58e5671cd6dbd4cb49bd30fb606d430b626361 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH] Track interface socket family
-
-Tracks the socket family associated with the interface.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 1 +
- mDNSPosix/mDNSPosix.h | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index a6041b04a21e..15bbecee04a4 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
-         // Set up the extra fields in PosixNetworkInterface.
-         assert(intf->intfName != NULL);         // intf->intfName already set up above
-         intf->index                = intfIndex;
-+        intf->sa_family            = intfAddr->sa_family;
-         intf->multicastSocket4     = -1;
- #if HAVE_IPV6
-         intf->multicastSocket6     = -1;
-diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
-index 9675591b0434..dd7864cd0d5e 100644
---- a/mDNSPosix/mDNSPosix.h
-+++ b/mDNSPosix/mDNSPosix.h
-@@ -19,6 +19,7 @@
- #define __mDNSPlatformPosix_h
- 
- #include <signal.h>
-+#include <sys/socket.h>
- #include <sys/time.h>
- 
- #ifdef  __cplusplus
-@@ -40,6 +41,7 @@ struct PosixNetworkInterface
-     char *                  intfName;
-     PosixNetworkInterface * aliasIntf;
-     int index;
-+    sa_family_t sa_family;
-     int multicastSocket4;
- #if HAVE_IPV6
-     int multicastSocket6;
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch
deleted file mode 100644
index 82d7ceca300f..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From f0adca77472c9c1df6db14f2b03e66d78a577649 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Sat, 26 Oct 2024 13:24:45 +0000
-Subject: [PATCH] Add definition for MAX()
-
-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSShared/uds_daemon.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/mDNSShared/uds_daemon.c b/mDNSShared/uds_daemon.c
-index e73bc1181b73..1d590a6a3580 100644
---- a/mDNSShared/uds_daemon.c
-+++ b/mDNSShared/uds_daemon.c
-@@ -89,6 +89,8 @@
- 
- #include "mdns_strict.h"
- 
-+#define MAX(A, B) (((A) > (B)) ? (A) : (B))
-+
- // User IDs 0-500 are system-wide processes, not actual users in the usual sense
- // User IDs for real user accounts start at 501 and count up from there
- #define SystemUID(X) ((X) <= 500)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
deleted file mode 100644
index bf2b85c2ab32..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 935033dd40772240c9bcc6b9610d78eb3753bfaf Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Tue, 1 Aug 2017 17:06:01 -0500
-Subject: [PATCH] Indicate loopback interface to mDNS core
-
-Tells the mDNS core if an interface is a loopback interface,
-similar to AddInterfaceToList() in the MacOS implementation.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 15bbecee04a4..f4c31a07d587 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(void)
- // Creates a PosixNetworkInterface for the interface whose IP address is
- // intfAddr and whose name is intfName and registers it with mDNS core.
- mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
--    const mDNSu8 *intfHaddr, mDNSu16 intfHlen, const char *intfName, int intfIndex)
-+    const mDNSu8 *intfHaddr, mDNSu16 intfHlen, const char *intfName, int intfIndex, int intfFlags)
- {
-     int err = 0;
-     PosixNetworkInterface *intf;
-@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
- 
-         intf->coreIntf.Advertise = m->AdvertiseLocalAddresses;
-         intf->coreIntf.McastTxRx = mDNStrue;
-+        intf->coreIntf.Loopback = ((intfFlags & IFF_LOOPBACK) != 0) ? mDNStrue : mDNSfalse;
- 
-         // Set up the extra fields in PosixNetworkInterface.
-         assert(intf->intfName != NULL);         // intf->intfName already set up above
-@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
-                     }
- #endif
-                     if (SetupOneInterface(m, i->ifa_addr, i->ifa_netmask,
--                                          hwaddr, hwaddr_len, i->ifa_name, ifIndex) == 0)
-+                                          hwaddr, hwaddr_len, i->ifa_name, ifIndex, i->ifa_flags) == 0)
-                     {
-                         if (i->ifa_addr->sa_family == AF_INET)
-                             foundav4 = mDNStrue;
-@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
-         // if ((m->HostInterfaces == NULL) && (firstLoopback != NULL))
-         if (!foundav4 && firstLoopback)
-             (void) SetupOneInterface(m, firstLoopback->ifa_addr, firstLoopback->ifa_netmask,
--                NULL, 0, firstLoopback->ifa_name, firstLoopbackIndex);
-+                NULL, 0, firstLoopback->ifa_name, firstLoopbackIndex, firstLoopback->ifa_flags);
-     }
- 
-     // Clean up.
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index 8d1915de8cfb..af27a89f4c67 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -1,4 +1,4 @@
-From f871ac42165c29f763785aa0199dfc76f1731f4d Mon Sep 17 00:00:00 2001
+From f7ee12c1f8e85b9d2fe4023b6539c8051dc710c3 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:26 +0000
 Subject: [PATCH] make: Separate TLS targets from libraries
@@ -13,7 +13,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index c877c8bb19e6..3a5897c4dbee 100755
+index 7c510317f1b6..8dd5984020ee 100755
 --- a/mDNSPosix/Makefile
 +++ b/mDNSPosix/Makefile
 @@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
index 4d4a8cf9b7f3..41b8985e27fb 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
@@ -1,4 +1,4 @@
-From cf216a6872139e435d5712787359b03022b51d2b Mon Sep 17 00:00:00 2001
+From 34285024531adbbc7b67506c9fc2e60f3b36b73b Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Sat, 26 Oct 2024 13:26:09 +0000
 Subject: [PATCH] Fix missing `limit` declarations
@@ -12,10 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/mDNSShared/dnssd_clientstub.c b/mDNSShared/dnssd_clientstub.c
-index fc93d162446a..a6cf45fa9856 100644
+index 89cb90d947c7..316fc49ab078 100644
 --- a/mDNSShared/dnssd_clientstub.c
 +++ b/mDNSShared/dnssd_clientstub.c
-@@ -2022,6 +2022,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
+@@ -2026,6 +2026,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
      ipc_msg_hdr *hdr;
      DNSServiceErrorType err;
      union { uint16_t s; u_char b[2]; } port = { portInNetworkByteOrder };
@@ -23,7 +23,7 @@ index fc93d162446a..a6cf45fa9856 100644
      (void)attr;
  
      if (!sdRef || !regtype) return kDNSServiceErr_BadParam;
-@@ -2054,6 +2055,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
+@@ -2050,6 +2051,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
      if (!hdr) { DNSServiceRefDeallocate(*sdRef); *sdRef = NULL; return kDNSServiceErr_NoMemory; }
      if (!callBack) hdr->ipc_flags |= IPC_FLAGS_NOREPLY;
  
@@ -31,7 +31,7 @@ index fc93d162446a..a6cf45fa9856 100644
      put_flags(flags, &ptr);
      put_uint32(interfaceIndex, &ptr);
      put_string(name, &ptr);
-@@ -2334,6 +2336,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
+@@ -2326,6 +2328,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
      ipc_msg_hdr *hdr = NULL;
      DNSRecordRef rref = NULL;
      DNSRecord **p;
@@ -39,7 +39,7 @@ index fc93d162446a..a6cf45fa9856 100644
      (void)attr;
  
      // Verify that only one of the following flags is set.
-@@ -2389,6 +2392,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
+@@ -2375,6 +2378,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
      hdr = create_hdr(reg_record_request, &len, &ptr, !(flags & kDNSServiceFlagsQueueRequest), sdRef);
      if (!hdr) return kDNSServiceErr_NoMemory;
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
deleted file mode 100644
index ebdfe8c783ac..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 47118760466b74939cec9f5233062236a12bb3f4 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Thu, 13 Jul 2017 09:00:00 -0500
-Subject: [PATCH] Use list for changed interfaces
-
-Uses a linked list to store the index of changed network interfaces
-instead of a bitfield. This allows for network interfaces with an
-index greater than 31 (an index of 36 was seen on Android).
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 58 ++++++++++++++++++++++++++++++++-----------
- 1 file changed, 43 insertions(+), 15 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index f4c31a07d587..6b2fe76d4b66 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -74,6 +74,14 @@ struct IfChangeRec
- };
- typedef struct IfChangeRec IfChangeRec;
- 
-+// Used to build a list of network interface indices
-+struct NetworkInterfaceIndex
-+{
-+    int if_index;
-+    struct NetworkInterfaceIndex *Next;
-+};
-+typedef struct NetworkInterfaceIndex NetworkInterfaceIndex;
-+
- // Note that static data is initialized to zero in (modern) C.
- static PosixEventSource *gEventSources;             // linked list of PosixEventSource's
- static sigset_t gEventSignalSet;                // Signals which event loop listens for
-@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
-     return err;
- }
- 
-+mDNSlocal void AddInterfaceIndexToList(GenLinkedList *list, int if_index)
-+{
-+    NetworkInterfaceIndex *item;
-+
-+    for (item = (NetworkInterfaceIndex*)list->Head; item != NULL; item = item->Next)
-+    {
-+        if (if_index == item->if_index) return;
-+    }
-+
-+    item = mdns_malloc(sizeof *item);
-+    if (item == NULL) return;
-+
-+    item->if_index = if_index;
-+    item->Next = NULL;
-+    AddToTail(list, item);
-+}
-+
- #if MDNS_DEBUGMSGS
- mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
- {
-@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
- }
- #endif
- 
--mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
-+mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *changedInterfaces)
- // Read through the messages on sd and if any indicate that any interface records should
- // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
- {
-     ssize_t readCount;
-     char buff[4096];
-     struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
--    mDNSu32 result = 0;
- 
-     // The structure here is more complex than it really ought to be because,
-     // unfortunately, there's no good way to size a buffer in advance large
-@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
- 
-         // Process the NetLink message
-         if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
--            result |= 1 << ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index;
-+            AddInterfaceIndexToList(changedInterfaces, ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
-         else if (pNLMsg->nlmsg_type == RTM_DELADDR || pNLMsg->nlmsg_type == RTM_NEWADDR)
--            result |= 1 << ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index;
-+            AddInterfaceIndexToList(changedInterfaces, ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
- 
-         // Advance pNLMsg to the next message in the buffer
-         if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) != 0 && pNLMsg->nlmsg_type != NLMSG_DONE)
-@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
-         else
-             break;  // all done!
-     }
--
--    return result;
- }
- 
- #else // USES_NETLINK
-@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
- }
- #endif
- 
--mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
-+mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *changedInterfaces)
- // Read through the messages on sd and if any indicate that any interface records should
- // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
- {
-     ssize_t readCount;
-     char buff[4096];
-     struct ifa_msghdr       *pRSMsg = (struct ifa_msghdr*) buff;
--    mDNSu32 result = 0;
- 
-     readCount = read(sd, buff, sizeof buff);
-     if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
-@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
-         pRSMsg->ifam_type == RTM_IFINFO)
-     {
-         if (pRSMsg->ifam_type == RTM_IFINFO)
--            result |= 1 << ((struct if_msghdr*) pRSMsg)->ifm_index;
-+            AddInterfaceIndexToList(changedInterfaces, ((struct if_msghdr*) pRSMsg)->ifm_index);
-         else
--            result |= 1 << pRSMsg->ifam_index;
-+            AddInterfaceIndexToList(changedInterfaces, pRSMsg->ifam_index);
-     }
--
--    return result;
- }
- 
- #endif // USES_NETLINK
-@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
- {
-     IfChangeRec     *pChgRec = (IfChangeRec*) context;
-     fd_set readFDs;
--    mDNSu32 changedInterfaces = 0;
-+    GenLinkedList changedInterfaces;
-+    NetworkInterfaceIndex *changedInterface;
-     struct timeval zeroTimeout = { 0, 0 };
- 
-     (void)fd; // Unused
-@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
-     FD_ZERO(&readFDs);
-     FD_SET(pChgRec->NotifySD, &readFDs);
- 
-+    InitLinkedList(&changedInterfaces, offsetof(NetworkInterfaceIndex, Next));
-+
-     do
-     {
--        changedInterfaces |= ProcessRoutingNotification(pChgRec->NotifySD);
-+        ProcessRoutingNotification(pChgRec->NotifySD, &changedInterfaces);
-     }
-     while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
- 
-     // Currently we rebuild the entire interface list whenever any interface change is
-     // detected. If this ever proves to be a performance issue in a multi-homed
-     // configuration, more care should be paid to changedInterfaces.
--    if (changedInterfaces)
-+    if (changedInterfaces.Head != NULL)
-         mDNSPlatformPosixRefreshInterfaceList(pChgRec->mDNS);
-+
-+    while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
-+    {
-+        RemoveFromList(&changedInterfaces, changedInterface);
-+        mdns_free(changedInterface);
-+    }
- }
- 
- // Register with either a Routing Socket or RtNetLink to listen for interface changes.
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 3c46d599c1ff..7d8f04c9027e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -1,4 +1,4 @@
-From 0b3953dfdeef8dc9b8a23820659feee9e15b5bad Mon Sep 17 00:00:00 2001
+From e79f75487e32f87677519ec40c021b1623395bde Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
 Subject: [PATCH] mDNSCore: Fix broken debug parameter
@@ -10,10 +10,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
-index d4519a7f62aa..3090edb2ac5d 100644
+index ad9eaa37a82a..fc51e1ad9bd4 100644
 --- a/mDNSCore/mDNS.c
 +++ b/mDNSCore/mDNS.c
-@@ -10253,7 +10253,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
+@@ -11046,7 +11046,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
  #else
                              const DNSServRef dnsserv = qptr->qDNSServer;
  #endif
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
deleted file mode 100644
index be63471e642e..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-From 105514b75df6d7abd052ec64d8106f5c07cc4782 Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Mon, 24 Jul 2017 09:38:55 -0500
-Subject: [PATCH] Handle noisy netlink sockets
-
-The POSIX implementation currently clears all network interfaces
-when netlink indicates that there has been a change. This causes
-the following problems:
-
-  1) Applications are informed that all of the services they are
-     tracking have been removed.
-  2) Increases network load because the client must re-query for
-     all records it is interested in.
-
-This changes netlink notification handling by:
-
-  1) Always comparing with the latest interface list returned
-     by the OS.
-  2) Confirming that the interface has been changed in a way
-     that we care about.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 182 +++++++++++++++++++++++++++++++++++++++---
- 1 file changed, 172 insertions(+), 10 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 6b2fe76d4b66..ecd5741d038d 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
- 
- #endif // USES_NETLINK
- 
-+// Test whether the given PosixNetworkInterface matches the given struct ifaddrs
-+mDNSlocal mDNSBool InterfacesMatch(PosixNetworkInterface *intf, struct ifaddrs *ifi)
-+{
-+    mDNSBool match = mDNSfalse;
-+    mDNSAddr ip, mask;
-+    unsigned int if_index;
-+
-+    if_index = if_nametoindex(ifi->ifa_name);
-+    if (if_index == 0)
-+        return mDNSfalse;
-+
-+    if((intf->index == if_index) &&
-+       (intf->sa_family == ifi->ifa_addr->sa_family) &&
-+       (strcmp(intf->coreIntf.ifname, ifi->ifa_name) == 0))
-+        {
-+        SockAddrTomDNSAddr(ifi->ifa_addr,    &ip,   NULL);
-+        SockAddrTomDNSAddr(ifi->ifa_netmask, &mask, NULL);
-+
-+        match = mDNSSameAddress(&intf->coreIntf.ip, &ip) &&
-+                mDNSSameAddress(&intf->coreIntf.mask, &mask);
-+        }
-+
-+    return match;
-+}
-+
- // Called when data appears on interface change notification socket
- mDNSlocal void InterfaceChangeCallback(int fd, void *context)
- {
-     IfChangeRec     *pChgRec = (IfChangeRec*) context;
-+    mDNS            *m = pChgRec->mDNS;
-     fd_set readFDs;
-     GenLinkedList changedInterfaces;
-     NetworkInterfaceIndex *changedInterface;
-     struct timeval zeroTimeout = { 0, 0 };
-+    struct ifaddrs *ifa_list, **ifi, *ifa_loop4 = NULL;
-+    PosixNetworkInterface *intf, *intfNext;
-+    mDNSBool found, foundav4;
- 
-     (void)fd; // Unused
- 
-@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
-     }
-     while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
- 
--    // Currently we rebuild the entire interface list whenever any interface change is
--    // detected. If this ever proves to be a performance issue in a multi-homed
--    // configuration, more care should be paid to changedInterfaces.
--    if (changedInterfaces.Head != NULL)
--        mDNSPlatformPosixRefreshInterfaceList(pChgRec->mDNS);
-+    CleanRecentInterfaces();
-+
-+    if (changedInterfaces.Head == NULL) goto cleanup;
-+
-+    if (getifaddrs(&ifa_list) < 0) goto cleanup;
-+
-+    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
-+    {
-+        intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
-+
-+        // Loopback interface(s) are handled later
-+        if (intf->coreIntf.Loopback) continue;
-+
-+        found = mDNSfalse;
-+        for (ifi = &ifa_list; *ifi != NULL; ifi = &(*ifi)->ifa_next)
-+        {
-+            if (InterfacesMatch(intf, *ifi))
-+            {
-+                found = mDNStrue;
-+                break;
-+            }
-+        }
-+
-+        // Removes changed and old interfaces from m->HostInterfaces
-+        if (!found) TearDownInterface(m, intf);
-+    }
-+
-+    // Add new and changed interfaces in ifa_list
-+    // Save off loopback interface in case it is needed later
-+    for (ifi = &ifa_list; *ifi != NULL; ifi = &(*ifi)->ifa_next)
-+    {
-+        found = mDNSfalse;
-+        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
-+        {
-+            intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
-+
-+            // Loopback interface(s) are handled later
-+            if (intf->coreIntf.Loopback) continue;
-+
-+            if (InterfacesMatch(intf, *ifi))
-+            {
-+                found = mDNStrue;
-+                break;
-+            }
-+
-+            // Removes changed and old interfaces from m->HostInterfaces
-+        }
-+        if (found)
-+	    continue;
-+
-+        if ((ifa_loop4 == NULL) &&
-+            ((*ifi)->ifa_addr->sa_family == AF_INET) &&
-+            ((*ifi)->ifa_flags & IFF_UP) &&
-+            ((*ifi)->ifa_flags & IFF_LOOPBACK))
-+        {
-+            ifa_loop4 = *ifi;
-+            continue;
-+        }
-+
-+        if (     (((*ifi)->ifa_addr->sa_family == AF_INET)
-+#if HAVE_IPV6
-+                  || ((*ifi)->ifa_addr->sa_family == AF_INET6)
-+#endif
-+                  ) && ((*ifi)->ifa_flags & IFF_UP)
-+                    && !((*ifi)->ifa_flags & IFF_POINTOPOINT)
-+                    && !((*ifi)->ifa_flags & IFF_LOOPBACK))
-+        {
-+            struct ifaddrs *i = *ifi;
-+
-+#define ethernet_addr_len 6
-+            uint8_t hwaddr[ethernet_addr_len];
-+            int hwaddr_len = 0;
-+
-+#if defined(TARGET_OS_LINUX) && TARGET_OS_LINUX
-+            struct ifreq ifr;
-+            int sockfd = socket(AF_INET6, SOCK_DGRAM, 0);
-+            if (sockfd >= 0)
-+            {
-+                /* Add hardware address */
-+                memcpy(ifr.ifr_name, i->ifa_name, IFNAMSIZ);
-+                if (ioctl(sockfd, SIOCGIFHWADDR, &ifr) != -1)
-+                {
-+                    if (ifr.ifr_hwaddr.sa_family == ARPHRD_ETHER)
-+                    {
-+                        memcpy(hwaddr, ifr.ifr_hwaddr.sa_data, ethernet_addr_len);
-+                        hwaddr_len = ethernet_addr_len;
-+                    }
-+                }
-+                close(sockfd);
-+            }
-+            else
-+            {
-+                memset(hwaddr, 0, sizeof(hwaddr));
-+            }
-+#endif // TARGET_OS_LINUX
-+            SetupOneInterface(m, i->ifa_addr, i->ifa_netmask,
-+                              hwaddr, hwaddr_len, i->ifa_name, if_nametoindex(i->ifa_name), i->ifa_flags);
-+        }
-+    }
-+
-+    // Determine if there is at least one non-loopback IPv4 interface. This is to work around issues
-+    // with multicast loopback on IPv6 interfaces -- see corresponding logic in SetupInterfaceList().
-+    foundav4 = mDNSfalse;
-+    for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = (PosixNetworkInterface*)(intf->coreIntf.next))
-+    {
-+        if (intf->sa_family == AF_INET && !intf->coreIntf.Loopback)
-+        {
-+            foundav4 = mDNStrue;
-+            break;
-+        }
-+    }
-+
-+    if (foundav4)
-+    {
-+        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = intfNext)
-+        {
-+            intfNext = (PosixNetworkInterface*)(intf->coreIntf.next);
-+            if (intf->coreIntf.Loopback) TearDownInterface(m, intf);
-+        }
-+    }
-+    else
-+    {
-+        found = mDNSfalse;
-+
-+        for (intf = (PosixNetworkInterface*)(m->HostInterfaces); intf != NULL; intf = (PosixNetworkInterface*)(intf->coreIntf.next))
-+        {
-+            if (intf->coreIntf.Loopback)
-+            {
-+                found = mDNStrue;
-+                break;
-+            }
-+        }
-+
-+        if (!found && (ifa_loop4 != NULL))
-+        {
-+            SetupOneInterface(m, ifa_loop4->ifa_addr, ifa_loop4->ifa_netmask,
-+                              NULL, 0, ifa_loop4->ifa_name, if_nametoindex(ifa_loop4->ifa_name), ifa_loop4->ifa_flags);
-+        }
-+    }
-+
-+    if (ifa_list != NULL) freeifaddrs(ifa_list);
- 
-+cleanup:
-     while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
-     {
-         RemoveFromList(&changedInterfaces, changedInterface);
-@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const m)
- #endif
- }
- 
--// This is used internally by InterfaceChangeCallback.
--// It's also exported so that the Standalone Responder (mDNSResponderPosix)
-+// This is exported so that the Standalone Responder (mDNSResponderPosix)
- // can call it in response to a SIGHUP (mainly for debugging purposes).
- mDNSexport mStatus mDNSPlatformPosixRefreshInterfaceList(mDNS *const m)
- {
-     int err;
--    // This is a pretty heavyweight way to process interface changes --
--    // destroying the entire interface list and then making fresh one from scratch.
--    // We should make it like the OS X version, which leaves unchanged interfaces alone.
-     ClearInterfaceList(m);
-     err = SetupInterfaceList(m);
-     return PosixErrorToStatus(err);
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
index ffa3fa38279d..5f8f428302da 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -1,4 +1,4 @@
-From 626ccae85aab5b0902a8e3c05d9f0e3fbbe4fcd2 Mon Sep 17 00:00:00 2001
+From a1c982808ebfb71ba7e0f16040013b7127a6e2ab Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 6 Dec 2022 13:28:31 +0000
 Subject: [PATCH] make: Add top-level Makefile
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
deleted file mode 100644
index 276f879df201..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3715b3f4a0ba2d2cb05e5ba617b523c759c88d4b Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Wed, 9 Aug 2017 09:16:58 -0500
-Subject: [PATCH] Mark deleted interfaces as being changed
-
-Netlink notification handling ignores messages for deleted links,
-RTM_DELLINK. It does handle RTM_GETLINK. According to libnl docu-
-mentation (http://www.infradead.org/~tgr/libnl/doc/route.html)
-RTM_DELLINK can be sent by the kernel, but RTM_GETLINK cannot.
-There was likely a mixup in the original implementation, so this
-change replaces handling for RTM_GETLINK with RTM_DELLINK.
-
-Testing and Verification Instructions:
-  1. Use ip-link to add and remove a VLAN interface and verify
-     that mDNSResponder handles the deleted link.
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index ecd5741d038d..776531dbc8e8 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
- #endif
- 
-         // Process the NetLink message
--        if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
-+        if (pNLMsg->nlmsg_type == RTM_DELLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
-             AddInterfaceIndexToList(changedInterfaces, ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
-         else if (pNLMsg->nlmsg_type == RTM_DELADDR || pNLMsg->nlmsg_type == RTM_NEWADDR)
-             AddInterfaceIndexToList(changedInterfaces, ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
deleted file mode 100644
index f3c7f62d3f2d..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4e6621eee389e1cbb558fe268e02d5153a1d8f2d Mon Sep 17 00:00:00 2001
-From: Nate Karstens <nate.karstens@garmin.com>
-Date: Thu, 10 Aug 2017 08:27:32 -0500
-Subject: [PATCH] Handle errors from socket calls
-
-Adds handling for socket() or read() returning a
-negative value (indicating an error has occurred).
-
-Upstream-Status: Submitted [dts@apple.com]
-
-Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSPosix/mDNSPosix.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 776531dbc8e8..0c9dd2582660 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
- // Read through the messages on sd and if any indicate that any interface records should
- // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
- {
--    ssize_t readCount;
-+    ssize_t readVal, readCount;
-     char buff[4096];
-     struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
- 
-@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
-     // enough to hold all pending data and so avoid message fragmentation.
-     // (Note that FIONREAD is not supported on AF_NETLINK.)
- 
--    readCount = read(sd, buff, sizeof buff);
-+    readVal = read(sd, buff, sizeof buff);
-+    if (readVal < 0) return;
-+    readCount = readVal;
-+
-     while (1)
-     {
-         // Make sure we've got an entire nlmsghdr in the buffer, and payload, too.
-@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
-                 pNLMsg = (struct nlmsghdr*) buff;
- 
-                 // read more data
--                readCount += read(sd, buff + readCount, sizeof buff - readCount);
-+                readVal = read(sd, buff + readCount, sizeof buff - readCount);
-+                if (readVal < 0) return;
-+                readCount += readVal;
-                 continue;                   // spin around and revalidate with new readCount
-             }
-             else
-@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUnicast(void)
-     int err;
-     int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
-     struct sockaddr_in s5353;
-+    if (s < 0) return mDNSfalse;
-     s5353.sin_family      = AF_INET;
-     s5353.sin_port        = MulticastDNSPort.NotAnInteger;
-     s5353.sin_addr.s_addr = 0;
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
index 3784e3be8189..e8785b1aa7ed 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
@@ -1,4 +1,4 @@
-From d15ee692af42163846be7517372f3ee098cdaf18 Mon Sep 17 00:00:00 2001
+From 8e32fb0876a073c23ab73047a2e0f6d011b3660c Mon Sep 17 00:00:00 2001
 From: Beniamin Sandu <beniaminsandu@gmail.com>
 Date: Thu, 15 Jun 2023 17:02:58 +0000
 Subject: [PATCH] remove unneeded headers
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb b/meta-networking/recipes-protocols/mdns/mdns_2600.100.147.bb
similarity index 85%
rename from meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2600.100.147.bb
index fc5add6c12d3..af1400ca6e00 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2600.100.147.bb
@@ -6,30 +6,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
-SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=${BRANCH} \
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=${BRANCH};tag=mDNSResponder-${PV} \
            file://0001-dns-sd-Include-missing-headers.patch \
            file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
            file://0004-make-Separate-TLS-targets-from-libraries.patch \
            file://0005-mDNSCore-Fix-broken-debug-parameter.patch \
            file://0006-make-Add-top-level-Makefile.patch \
-           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch \
-           file://0002-Create-subroutine-for-tearing-down-an-interface.patch \
-           file://0003-Track-interface-socket-family.patch \
-           file://0004-Indicate-loopback-interface-to-mDNS-core.patch \
-           file://0005-Use-list-for-changed-interfaces.patch \
-           file://0006-Handle-noisy-netlink-sockets.patch \
-           file://0007-Mark-deleted-interfaces-as-being-changed.patch \
-           file://0008-Handle-errors-from-socket-calls.patch \
            file://0009-remove-unneeded-headers.patch \
-           file://mdns.service \
-           file://0001-Handle-interface-without-ifa_addr.patch \
-           file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            file://0005-Fix-missing-limit-declarations.patch \
-           file://0004-Add-definition-for-MAX.patch \
            file://0001-Fix-build-with-gcc-15.patch \
+           file://mdns.service \
            "
-BRANCH = "rel/mDNSResponder-2559"
-SRCREV = "ecc02274878b0a70dba229de642b081cd1c30927"
+BRANCH = "main"
+SRCREV = "d89f8d1d0e001b810d6c055aa2a57b768bcf9aa2"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst

