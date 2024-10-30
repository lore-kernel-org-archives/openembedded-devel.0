Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C41BD5B85F
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 09:33:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10995.1730280812074495016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 02:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A20Ld/NH;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so61410495e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730280810; x=1730885610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag4svjhxMWdnalwCFl+3Hj8U6E3NYfUNg4hHYTo7OKw=;
        b=A20Ld/NHCf8P/xmEa6ILTegYr8h4082XAkBILs8r6Stb8D6x/C4bYNL6dEb6SOGdOG
         oqTWAAuS1UEDn3vsO2tghLjE4lMdkxBk+l8MdX+0BMbj/YVsTbRS11hF3ZNUnkI5AoTP
         6FP/9NjhJsniwK97PoEcj/WiBkVDq2+6pooECQNN98RJHaC1qEwSXCqPjFKQURvIJrD2
         180GnLYg7ClKmactEW0A//m86bzxUd4RXsjmvGQUH4IAGpQvfAPzz7OJ8/0cb6PmDM91
         fV7nwgcLydlnRp4YiNYH8+B75QZUiWpJ+csvjRjowL8zmYvSwWA45//DQ47fFqo5q0IK
         2Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730280810; x=1730885610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag4svjhxMWdnalwCFl+3Hj8U6E3NYfUNg4hHYTo7OKw=;
        b=ucfYvs+/5zJDOjRxpuSDwZJvsLarJQdwf4m26NfzsYwZyCsUcT02EolXtMlbDT5R5P
         EC1N5ZZU0dmTAg0yUt2tbH1FilxocvlFmW47H5sT1r5gEdC+yvoCxHd2eONLL8YgAgxa
         pYnAXoJ7tfbkWhJfNIfs28z+cgRy+vzuXRYKpMIxzzbpFI7s5YZsI6tWpVyDD6lvc+NB
         ov3H/TApRXEpYv3ZhsJyaVM2VW0TpZVh4kt2RhGP15pe2B0M+4ULI1NtLrm9TnepWDjm
         Cr5o0tN6VsYMNlaaysIKePzu+RjMA9wlZhqZ53pO+jlSchcdJKo3ocmk/uc+1TqkC4aE
         eKWA==
X-Gm-Message-State: AOJu0Yw6aLGfrHNLZD3VCvDttclbdGLyeWepffoUrtz0tFiQPRP1hyRH
	Oupl3haEEt8t3U6gJrPCD3cUcUbvgD4l1seEVvKdTVceZaDlgnQjUkdaZllh
X-Google-Smtp-Source: AGHT+IE//PTG9x6Xb9qedpXoVVlgbJu3KC+kR5OC210Fl8Nq3dnqg+YtoFqE1RclqRZmY2UoVcNlxw==
X-Received: by 2002:a05:600c:5253:b0:431:6153:a246 with SMTP id 5b1f17b1804b1-4319aca3919mr130705395e9.13.1730280809838;
        Wed, 30 Oct 2024 02:33:29 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b13223sm14883807f8f.1.2024.10.30.02.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 02:33:29 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2200.140.11 -> 2559.1.1
Date: Wed, 30 Oct 2024 09:32:54 +0000
Message-Id: <20241030093253.1852142-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 09:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113342

Add local fixes for:

* definition for MAX()
* missing `limit` declarations

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...0001-Fix-SIGSEGV-during-DumpStateLog.patch |  6 +--
 ...01-Handle-interface-without-ifa_addr.patch |  8 +--
 .../mdns/0004-Add-definition-for-MAX.patch    | 24 +++++++++
 .../0005-Fix-missing-limit-declarations.patch | 49 +++++++++++++++++++
 .../mdns/0009-remove-unneeded-headers.patch   |  5 +-
 .../{mdns_2200.140.11.bb => mdns_2559.1.1.bb} |  7 ++-
 6 files changed, 87 insertions(+), 12 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.140.11.bb => mdns_2559.1.1.bb} (95%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
index abf82b1e02f7..d74c031ab370 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
@@ -1,4 +1,4 @@
-From 2db1f5bc941e4b4cd1721e361a47cfe288b07a76 Mon Sep 17 00:00:00 2001
+From 3138d70ce8f521d03120e7789e93ebe290ece101 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Thu, 1 Feb 2024 14:07:03 +0000
 Subject: [PATCH] Fix SIGSEGV during DumpStateLog()
@@ -13,10 +13,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSShared/mDNSDebug.c b/mDNSShared/mDNSDebug.c
-index 7a4ca19eff6d..d449dde320f6 100644
+index b531fcea2bb9..1e8d9b10afbc 100644
 --- a/mDNSShared/mDNSDebug.c
 +++ b/mDNSShared/mDNSDebug.c
-@@ -71,7 +71,7 @@ mDNSlocal void LogMsgWithLevelv(os_log_t category, os_log_type_t level, const ch
+@@ -72,7 +72,7 @@ mDNSlocal void LogMsgWithLevelv(os_log_t category, os_log_type_t level, const ch
  mDNSlocal void LogMsgWithLevelv(const char *category, mDNSLogLevel_t level, const char *format, va_list args)
  {
      // Do not print the logs if the log category is MDNS_LOG_CATEGORY_DISABLED.
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
index 7ec5996013f3..a531884afcf4 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
@@ -1,4 +1,4 @@
-From c67102307f25c5f4d238c736e90519e56a76ae79 Mon Sep 17 00:00:00 2001
+From 199b376e585d5362a1f51ea20e45dcc3bdb7d6aa Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan@agner.ch>
 Date: Fri, 23 Jun 2023 10:10:00 +0200
 Subject: [PATCH] Handle interface without `ifa_addr`
@@ -15,10 +15,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 0c9dd2582660..c3ead26799e6 100644
+index 4c835a8c253c..e1e27b1de3b2 100644
 --- a/mDNSPosix/mDNSPosix.c
 +++ b/mDNSPosix/mDNSPosix.c
-@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1927,6 +1927,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
  	    continue;
  
          if ((ifa_loop4 == NULL) &&
@@ -26,7 +26,7 @@ index 0c9dd2582660..c3ead26799e6 100644
              ((*ifi)->ifa_addr->sa_family == AF_INET) &&
              ((*ifi)->ifa_flags & IFF_UP) &&
              ((*ifi)->ifa_flags & IFF_LOOPBACK))
-@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1935,7 +1936,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
              continue;
          }
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch
new file mode 100644
index 000000000000..82d7ceca300f
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-Add-definition-for-MAX.patch
@@ -0,0 +1,24 @@
+From f0adca77472c9c1df6db14f2b03e66d78a577649 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 26 Oct 2024 13:24:45 +0000
+Subject: [PATCH] Add definition for MAX()
+
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/uds_daemon.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mDNSShared/uds_daemon.c b/mDNSShared/uds_daemon.c
+index e73bc1181b73..1d590a6a3580 100644
+--- a/mDNSShared/uds_daemon.c
++++ b/mDNSShared/uds_daemon.c
+@@ -89,6 +89,8 @@
+ 
+ #include "mdns_strict.h"
+ 
++#define MAX(A, B) (((A) > (B)) ? (A) : (B))
++
+ // User IDs 0-500 are system-wide processes, not actual users in the usual sense
+ // User IDs for real user accounts start at 501 and count up from there
+ #define SystemUID(X) ((X) <= 500)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
new file mode 100644
index 000000000000..4d4a8cf9b7f3
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
@@ -0,0 +1,49 @@
+From cf216a6872139e435d5712787359b03022b51d2b Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Sat, 26 Oct 2024 13:26:09 +0000
+Subject: [PATCH] Fix missing `limit` declarations
+
+`put_attribute_tlvs` needs a limit setting which is missing, add it in.
+
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/dnssd_clientstub.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mDNSShared/dnssd_clientstub.c b/mDNSShared/dnssd_clientstub.c
+index fc93d162446a..a6cf45fa9856 100644
+--- a/mDNSShared/dnssd_clientstub.c
++++ b/mDNSShared/dnssd_clientstub.c
+@@ -2022,6 +2022,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
+     ipc_msg_hdr *hdr;
+     DNSServiceErrorType err;
+     union { uint16_t s; u_char b[2]; } port = { portInNetworkByteOrder };
++    const uint8_t *limit;
+     (void)attr;
+ 
+     if (!sdRef || !regtype) return kDNSServiceErr_BadParam;
+@@ -2054,6 +2055,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
+     if (!hdr) { DNSServiceRefDeallocate(*sdRef); *sdRef = NULL; return kDNSServiceErr_NoMemory; }
+     if (!callBack) hdr->ipc_flags |= IPC_FLAGS_NOREPLY;
+ 
++    limit = ptr + len;
+     put_flags(flags, &ptr);
+     put_uint32(interfaceIndex, &ptr);
+     put_string(name, &ptr);
+@@ -2334,6 +2336,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
+     ipc_msg_hdr *hdr = NULL;
+     DNSRecordRef rref = NULL;
+     DNSRecord **p;
++    const uint8_t *limit;
+     (void)attr;
+ 
+     // Verify that only one of the following flags is set.
+@@ -2389,6 +2392,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
+     hdr = create_hdr(reg_record_request, &len, &ptr, !(flags & kDNSServiceFlagsQueueRequest), sdRef);
+     if (!hdr) return kDNSServiceErr_NoMemory;
+ 
++    limit = ptr + len;
+     put_flags(flags, &ptr);
+     put_uint32(interfaceIndex, &ptr);
+     put_string(fullname, &ptr);
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
index 818017037cd9..3784e3be8189 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
@@ -1,4 +1,4 @@
-From 05cb409ce213f35798c02faf2032d4846a84b48e Mon Sep 17 00:00:00 2001
+From d15ee692af42163846be7517372f3ee098cdaf18 Mon Sep 17 00:00:00 2001
 From: Beniamin Sandu <beniaminsandu@gmail.com>
 Date: Thu, 15 Jun 2023 17:02:58 +0000
 Subject: [PATCH] remove unneeded headers
@@ -7,8 +7,7 @@ From a quick look, these seem to not be needed and having them
 breaks the build with mbedtls 3.x. Without them it builds fine
 on both 2.x and 3.x versions.
 
-Upstream-Status: Pending
-
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
 Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
 ---
  mDNSPosix/mbedtls.c | 2 --
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.140.11.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.1.1.bb
similarity index 95%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.140.11.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2559.1.1.bb
index e6ea707197d9..212fd0eab5e3 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.140.11.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
-SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=rel/mDNSResponder-2200 \
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=${BRANCH} \
            file://0001-dns-sd-Include-missing-headers.patch \
            file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
            file://0004-make-Separate-TLS-targets-from-libraries.patch \
@@ -24,8 +24,11 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://mdns.service \
            file://0001-Handle-interface-without-ifa_addr.patch \
            file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
+           file://0005-Fix-missing-limit-declarations.patch \
+           file://0004-Add-definition-for-MAX.patch \
            "
-SRCREV = "12e84b9089e577e0c0a9f48c4b922d7349fcc5a4"
+BRANCH = "main"
+SRCREV = "71e6611203d57c78b26fd505d98cb57a33d00880"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.25.1


