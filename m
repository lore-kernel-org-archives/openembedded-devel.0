Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B707C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 16:06:58 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.19714.1717603614836194103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 09:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mw2wD1K9;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaad2c673fso1741981fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717603613; x=1718208413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuyHvj01pDmY6EZjcBlDc+lX8iRZQUNCp8zX81lqIsA=;
        b=mw2wD1K9t+oLiTn7huTSlT2pXiAiWeIjaZmmgKx5Irc79zGVqFcx3V6Q2o8uurmNuv
         mE7HHt+mGp2Lk4AYXHc1/g+nhJ2/v3RsqPCuQ/Pue30HL1Jf0vUghCi45+XKyJjZX+lz
         Q9LRfNXlF/96zf4A4touxJGeg2b0v30FF1s1ct2P52MByVLi49OxAp5KmUovlG3XtM0S
         a2nJ4NbxOUnpC+DuZwaTqkQP5WARFQL1hV3n0ok/AIuMhZGH38YjhqnC41RQIfRUFZrt
         hdIlTQLUythS+8wm94s6h+glDgglC1cEvWkZheMDHBB7l4C7DbUzMLYBbMr01dwsSsMK
         H9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717603613; x=1718208413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuyHvj01pDmY6EZjcBlDc+lX8iRZQUNCp8zX81lqIsA=;
        b=k+8GsAqmKAAAmfab6AGKUi5PuZ/qpVCWJNaXGJeFTIO4LgClz/p1Bv/+yW02mZTL3h
         kX7xnuyODZ6bY2DYWRLCnHDVhyXpLm2lsHmHZrGq5x4xOCfNU5qoIFSEYirkOt8PKF/7
         /APs466BZYklpJO2RvIEwLlZ5+um5DIbz0jABnlB00eoRlocDYgXJMlihPeBrEFnEWdL
         f0dLar/vLZaKoKWPkx1FZZH6sQadVqGROzZPcCBet07SRO+kDSrV0NxnhgdHluoqnG02
         MEinzPeA4rBTiPrtuV9UMllec/ElKSOMtM02PlOL6/6p1jvBlAOtR1Zlmrbuvwk0mHz5
         /FmQ==
X-Gm-Message-State: AOJu0Ywz1k6GOU1dURP9CCN9flLabxKnWQccL2eR8wmcGO2e2udogt1D
	2AmoQ4RDbrJXFcn/STErgQ1fe3KiUpimDNZ9cKSwT4gyxWilZRNFMCPF0g==
X-Google-Smtp-Source: AGHT+IFVl5mTZFYUc5uGbJrNk5P91hEk9QbcPQjdgUTPNOhGf5G2WhSINyj+iWLKi6XM31NW+vjzuw==
X-Received: by 2002:a2e:8814:0:b0:2ea:b908:d82c with SMTP id 38308e7fff4ca-2eac79c7c5fmr23817391fa.22.1717603612243;
        Wed, 05 Jun 2024 09:06:52 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ed8b574e3sm2738572f8f.79.2024.06.05.09.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:06:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2200.100.94.0.2 -> 2200.120.24
Date: Wed,  5 Jun 2024 16:04:00 +0000
Message-Id: <20240605160359.2050-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 16:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110704

Drop 0015-Add-missing-limits.h.patch (equivalent patch merged upstream),
rebase other patches.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...utine-for-cleaning-recent-interfaces.patch | 16 +++++------
 ...0001-Fix-SIGSEGV-during-DumpStateLog.patch |  5 +---
 ...01-Handle-interface-without-ifa_addr.patch | 14 +++++-----
 .../0001-dns-sd-Include-missing-headers.patch | 12 ++++----
 ...outine-for-tearing-down-an-interface.patch | 16 +++++------
 ...ke-Set-libdns_sd.so-soname-correctly.patch | 14 +++++-----
 .../0003-Track-interface-socket-family.patch  | 22 +++++++--------
 ...cate-loopback-interface-to-mDNS-core.patch | 20 ++++++-------
 ...-Separate-TLS-targets-from-libraries.patch | 12 ++++----
 ...0005-Use-list-for-changed-interfaces.patch | 28 +++++++++----------
 ...-mDNSCore-Fix-broken-debug-parameter.patch | 13 ++++-----
 .../0006-Handle-noisy-netlink-sockets.patch   | 18 ++++++------
 .../0006-make-Add-top-level-Makefile.patch    | 11 ++++----
 ...-deleted-interfaces-as-being-changed.patch | 14 +++++-----
 ...0008-Handle-errors-from-socket-calls.patch | 20 ++++++-------
 .../mdns/0009-remove-unneeded-headers.patch   | 10 +++----
 .../mdns/mdns/0015-Add-missing-limits.h.patch | 23 ---------------
 ...2200.100.94.0.2.bb => mdns_2200.120.24.bb} |  3 +-
 18 files changed, 122 insertions(+), 149 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.100.94.0.2.bb => mdns_2200.120.24.bb} (98%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
index f5d424d58f4e..68a395d69eef 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
@@ -1,7 +1,7 @@
-From c1f3e19d3cb0aa948248616eb1684a1e80aa39b4 Mon Sep 17 00:00:00 2001
+From 1fefe289d0c907392382eb2fa2f1f0ecac02f85d Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH 1/8] Create subroutine for cleaning recent interfaces
+Subject: [PATCH] Create subroutine for cleaning recent interfaces
 
 Moves functionality for cleaning the list of recent
 interfaces into its own subroutine.
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
  1 file changed, 14 insertions(+), 10 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockadd
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 3b761d04e3c4..5aa220cf694e 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
      return err;
  }
  
@@ -38,7 +38,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  // Creates a PosixNetworkInterface for the interface whose IP address is
  // intfAddr and whose name is intfName and registers it with mDNS core.
  mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
-@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
+@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
  
      // Clean up.
      if (intfList != NULL) freeifaddrs(intfList);
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
index 4b0227f1dc38..abf82b1e02f7 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
@@ -1,4 +1,4 @@
-From 14cc53bb09a3d8adf301f3842c765598467e63e1 Mon Sep 17 00:00:00 2001
+From 2db1f5bc941e4b4cd1721e361a47cfe288b07a76 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Thu, 1 Feb 2024 14:07:03 +0000
 Subject: [PATCH] Fix SIGSEGV during DumpStateLog()
@@ -25,6 +25,3 @@ index 7a4ca19eff6d..d449dde320f6 100644
      {
          return;
      }
--- 
-2.39.0
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
index 7e76f07c0eb3..7ec5996013f3 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
@@ -1,4 +1,4 @@
-From 1cc54320306e07c1fc0eed98e7fbcbb07a2f3b28 Mon Sep 17 00:00:00 2001
+From c67102307f25c5f4d238c736e90519e56a76ae79 Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan@agner.ch>
 Date: Fri, 23 Jun 2023 10:10:00 +0200
 Subject: [PATCH] Handle interface without `ifa_addr`
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(i
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 0c9dd2582660..c3ead26799e6 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
  	    continue;
  
          if ((ifa_loop4 == NULL) &&
@@ -26,7 +26,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
              ((*ifi)->ifa_addr->sa_family == AF_INET) &&
              ((*ifi)->ifa_flags & IFF_UP) &&
              ((*ifi)->ifa_flags & IFF_LOOPBACK))
-@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(i
+@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
              continue;
          }
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index 82825b294de0..0dc36ae1d44a 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -1,7 +1,7 @@
-From cea342c10731cb1c8c8b52f03d55f9d15fc3b091 Mon Sep 17 00:00:00 2001
+From a5fe20fa00088683136a09a4da3c36d9b20fe1b9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 4 Nov 2021 07:31:32 -0700
-Subject: [PATCH 1/6] dns-sd: Include missing headers
+Subject: [PATCH] dns-sd: Include missing headers
 
 Fixes build on Musl
 
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mDNSPosix/nss_mdns.c | 3 +++
  1 file changed, 3 insertions(+)
 
-Index: mDNSResponder/mDNSPosix/nss_mdns.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/nss_mdns.c
-+++ mDNSResponder/mDNSPosix/nss_mdns.c
+diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
+index afadb3c6c33b..84c312759463 100644
+--- a/mDNSPosix/nss_mdns.c
++++ b/mDNSPosix/nss_mdns.c
 @@ -89,6 +89,9 @@
  
  #include <dns_sd.h>
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
index 867db88a5027..5ce7eb101534 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
@@ -1,7 +1,7 @@
-From 40ef0241afbb49f84e76afd65eb3ee17466bb582 Mon Sep 17 00:00:00 2001
+From d265ac9346d3dcbcf1187134318baafcfa75c054 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH 2/8] Create subroutine for tearing down an interface
+Subject: [PATCH] Create subroutine for tearing down an interface
 
 Creates a subroutine for tearing down an interface.
 
@@ -13,11 +13,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
  1 file changed, 16 insertions(+), 6 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 5aa220cf694e..a6041b04a21e 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixNetworkInterface *intf)
      gRecentInterfaces = intf;
  }
  
@@ -37,7 +37,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  // Grab the first interface, deregister it, free it, and repeat until done.
  mDNSlocal void ClearInterfaceList(mDNS *const m)
  {
-@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *
+@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const m)
      while (m->HostInterfaces)
      {
          PosixNetworkInterface *intf = (PosixNetworkInterface*)(m->HostInterfaces);
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index 03fb1bc0d7d7..86b659f8a12c 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -1,7 +1,7 @@
-From a198bcd457abd04f2e22812ff3a37246aa564614 Mon Sep 17 00:00:00 2001
+From dfa9e2c494d1a834f5bdfe4dc24e8329dd8720eb Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:12 +0000
-Subject: [PATCH 2/6] make: Set libdns_sd.so soname correctly
+Subject: [PATCH] make: Set libdns_sd.so soname correctly
 
 Upstream-Status: Pending
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
@@ -9,11 +9,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: mDNSResponder/mDNSPosix/Makefile
-===================================================================
---- mDNSResponder.orig/mDNSPosix/Makefile
-+++ mDNSResponder/mDNSPosix/Makefile
-@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$
+diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
+index 041706523139..c877c8bb19e6 100755
+--- a/mDNSPosix/Makefile
++++ b/mDNSPosix/Makefile
+@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
  CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o $(OBJDIR)/dnssd_errstring.c.so.o
  
  $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
index f1cda2b895bb..59871eb66ac6 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
@@ -1,7 +1,7 @@
-From deb3a2c51f32e0d2741be11a492e727129f770e2 Mon Sep 17 00:00:00 2001
+From 5f58e5671cd6dbd4cb49bd30fb606d430b626361 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 28 Jun 2017 17:30:00 -0500
-Subject: [PATCH 3/8] Track interface socket family
+Subject: [PATCH] Track interface socket family
 
 Tracks the socket family associated with the interface.
 
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.h | 2 ++
  2 files changed, 3 insertions(+)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index a6041b04a21e..15bbecee04a4 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
          // Set up the extra fields in PosixNetworkInterface.
          assert(intf->intfName != NULL);         // intf->intfName already set up above
          intf->index                = intfIndex;
@@ -26,10 +26,10 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
          intf->multicastSocket4     = -1;
  #if HAVE_IPV6
          intf->multicastSocket6     = -1;
-Index: mDNSResponder/mDNSPosix/mDNSPosix.h
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.h
-+++ mDNSResponder/mDNSPosix/mDNSPosix.h
+diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
+index 9675591b0434..dd7864cd0d5e 100644
+--- a/mDNSPosix/mDNSPosix.h
++++ b/mDNSPosix/mDNSPosix.h
 @@ -19,6 +19,7 @@
  #define __mDNSPlatformPosix_h
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
index 6bc36456f682..bf2b85c2ab32 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
@@ -1,7 +1,7 @@
-From beab76b5708862f44d9acbe7a92db45e2f99259f Mon Sep 17 00:00:00 2001
+From 935033dd40772240c9bcc6b9610d78eb3753bfaf Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Tue, 1 Aug 2017 17:06:01 -0500
-Subject: [PATCH 4/8] Indicate loopback interface to mDNS core
+Subject: [PATCH] Indicate loopback interface to mDNS core
 
 Tells the mDNS core if an interface is a loopback interface,
 similar to AddInterfaceToList() in the MacOS implementation.
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 7 ++++---
  1 file changed, 4 insertions(+), 3 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(voi
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 15bbecee04a4..f4c31a07d587 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(void)
  // Creates a PosixNetworkInterface for the interface whose IP address is
  // intfAddr and whose name is intfName and registers it with mDNS core.
  mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
@@ -27,7 +27,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  {
      int err = 0;
      PosixNetworkInterface *intf;
-@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
+@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
  
          intf->coreIntf.Advertise = m->AdvertiseLocalAddresses;
          intf->coreIntf.McastTxRx = mDNStrue;
@@ -35,7 +35,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  
          // Set up the extra fields in PosixNetworkInterface.
          assert(intf->intfName != NULL);         // intf->intfName already set up above
-@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
+@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
                      }
  #endif
                      if (SetupOneInterface(m, i->ifa_addr, i->ifa_netmask,
@@ -44,7 +44,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
                      {
                          if (i->ifa_addr->sa_family == AF_INET)
                              foundav4 = mDNStrue;
-@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
+@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
          // if ((m->HostInterfaces == NULL) && (firstLoopback != NULL))
          if (!foundav4 && firstLoopback)
              (void) SetupOneInterface(m, firstLoopback->ifa_addr, firstLoopback->ifa_netmask,
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index 837580ac368a..8d1915de8cfb 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -1,7 +1,7 @@
-From 22316f200803225f2d375ae5c36ffead59e2f6b8 Mon Sep 17 00:00:00 2001
+From f871ac42165c29f763785aa0199dfc76f1731f4d Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:26 +0000
-Subject: [PATCH 4/6] make: Separate TLS targets from libraries
+Subject: [PATCH] make: Separate TLS targets from libraries
 
 There are dependencies on TLSOBJS, which fails when `-lmbedtls` is
 listed as a dependency, so separate it out.
@@ -12,10 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/Makefile | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/Makefile
-===================================================================
---- mDNSResponder.orig/mDNSPosix/Makefile
-+++ mDNSResponder/mDNSPosix/Makefile
+diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
+index c877c8bb19e6..3a5897c4dbee 100755
+--- a/mDNSPosix/Makefile
++++ b/mDNSPosix/Makefile
 @@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
  ifeq ($(tls), no)
  CFLAGS_OS = -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=4 -Wno-expansion-to-defined
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
index f00116c61741..ebdfe8c783ac 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
@@ -1,7 +1,7 @@
-From e79f81f5cd626ad77ec64de4325f6645cf253c5e Mon Sep 17 00:00:00 2001
+From 47118760466b74939cec9f5233062236a12bb3f4 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Thu, 13 Jul 2017 09:00:00 -0500
-Subject: [PATCH 5/8] Use list for changed interfaces
+Subject: [PATCH] Use list for changed interfaces
 
 Uses a linked list to store the index of changed network interfaces
 instead of a bitfield. This allows for network interfaces with an
@@ -15,10 +15,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 58 ++++++++++++++++++++++++++++++++-----------
  1 file changed, 43 insertions(+), 15 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index f4c31a07d587..6b2fe76d4b66 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
 @@ -74,6 +74,14 @@ struct IfChangeRec
  };
  typedef struct IfChangeRec IfChangeRec;
@@ -34,7 +34,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  // Note that static data is initialized to zero in (modern) C.
  static PosixEventSource *gEventSources;             // linked list of PosixEventSource's
  static sigset_t gEventSignalSet;                // Signals which event loop listens for
-@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int
+@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
      return err;
  }
  
@@ -58,7 +58,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  #if MDNS_DEBUGMSGS
  mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  {
-@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(cons
+@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  }
  #endif
  
@@ -74,7 +74,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  
      // The structure here is more complex than it really ought to be because,
      // unfortunately, there's no good way to size a buffer in advance large
-@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNo
+@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
  
          // Process the NetLink message
          if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
@@ -86,7 +86,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  
          // Advance pNLMsg to the next message in the buffer
          if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) != 0 && pNLMsg->nlmsg_type != NLMSG_DONE)
-@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNo
+@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
          else
              break;  // all done!
      }
@@ -95,7 +95,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  }
  
  #else // USES_NETLINK
-@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMs
+@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
  }
  #endif
  
@@ -111,7 +111,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  
      readCount = read(sd, buff, sizeof buff);
      if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
-@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNo
+@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
          pRSMsg->ifam_type == RTM_IFINFO)
      {
          if (pRSMsg->ifam_type == RTM_IFINFO)
@@ -126,7 +126,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  }
  
  #endif // USES_NETLINK
-@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(i
+@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
  {
      IfChangeRec     *pChgRec = (IfChangeRec*) context;
      fd_set readFDs;
@@ -136,7 +136,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
      struct timeval zeroTimeout = { 0, 0 };
  
      (void)fd; // Unused
-@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(i
+@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
      FD_ZERO(&readFDs);
      FD_SET(pChgRec->NotifySD, &readFDs);
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index fd2f2f117887..3c46d599c1ff 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -1,20 +1,19 @@
-From 764b6202402e9e5687ff873330e5ad6be6f69df7 Mon Sep 17 00:00:00 2001
+From 0b3953dfdeef8dc9b8a23820659feee9e15b5bad Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
 Subject: [PATCH] mDNSCore: Fix broken debug parameter
 
 Upstream-Status: Pending
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
 ---
  mDNSCore/mDNS.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: mDNSResponder/mDNSCore/mDNS.c
-===================================================================
---- mDNSResponder.orig/mDNSCore/mDNS.c
-+++ mDNSResponder/mDNSCore/mDNS.c
-@@ -10231,7 +10231,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastA
+diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
+index d4519a7f62aa..3090edb2ac5d 100644
+--- a/mDNSCore/mDNS.c
++++ b/mDNSCore/mDNS.c
+@@ -10253,7 +10253,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
  #else
                              const DNSServRef dnsserv = qptr->qDNSServer;
  #endif
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
index 80cdbca50013..be63471e642e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
@@ -1,7 +1,7 @@
-From bfa1d68bed863e22c40a6d9a19ffbcc8694bbff6 Mon Sep 17 00:00:00 2001
+From 105514b75df6d7abd052ec64d8106f5c07cc4782 Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Mon, 24 Jul 2017 09:38:55 -0500
-Subject: [PATCH 6/8] Handle noisy netlink sockets
+Subject: [PATCH] Handle noisy netlink sockets
 
 The POSIX implementation currently clears all network interfaces
 when netlink indicates that there has been a change. This causes
@@ -27,11 +27,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 182 +++++++++++++++++++++++++++++++++++++++---
  1 file changed, 172 insertions(+), 10 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNo
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 6b2fe76d4b66..ecd5741d038d 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
  
  #endif // USES_NETLINK
  
@@ -75,7 +75,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
  
      (void)fd; // Unused
  
-@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(i
+@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
      }
      while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
  
@@ -230,7 +230,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
      while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
      {
          RemoveFromList(&changedInterfaces, changedInterface);
-@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *
+@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const m)
  #endif
  }
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
index c12a02fcdd8c..ffa3fa38279d 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -1,7 +1,7 @@
-From fa9ef50ab4c4225cf3ade4bafc38ddf93e6fe127 Mon Sep 17 00:00:00 2001
+From 626ccae85aab5b0902a8e3c05d9f0e3fbbe4fcd2 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 6 Dec 2022 13:28:31 +0000
-Subject: [PATCH 6/6] make: Add top-level Makefile
+Subject: [PATCH] make: Add top-level Makefile
 
 Simple top level Makefile that just delegates to mDNSPosix.
 
@@ -12,10 +12,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 2 insertions(+)
  create mode 100644 Makefile
 
-Index: mDNSResponder/Makefile
-===================================================================
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 000000000000..feb6ac67ef47
 --- /dev/null
-+++ mDNSResponder/Makefile
++++ b/Makefile
 @@ -0,0 +1,2 @@
 +all clean:
 +	cd mDNSPosix && $(MAKE) $@
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
index dae1ac7ea01f..276f879df201 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
@@ -1,7 +1,7 @@
-From a8accffb95267490b50401c8b65ec18db57b5ef5 Mon Sep 17 00:00:00 2001
+From 3715b3f4a0ba2d2cb05e5ba617b523c759c88d4b Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Wed, 9 Aug 2017 09:16:58 -0500
-Subject: [PATCH 7/8] Mark deleted interfaces as being changed
+Subject: [PATCH] Mark deleted interfaces as being changed
 
 Netlink notification handling ignores messages for deleted links,
 RTM_DELLINK. It does handle RTM_GETLINK. According to libnl docu-
@@ -22,11 +22,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNo
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index ecd5741d038d..776531dbc8e8 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
  #endif
  
          // Process the NetLink message
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
index 1789001e14e2..f3c7f62d3f2d 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
@@ -1,7 +1,7 @@
-From ed58146d3aeecdb9920fdc017f85c18b5b10f2db Mon Sep 17 00:00:00 2001
+From 4e6621eee389e1cbb558fe268e02d5153a1d8f2d Mon Sep 17 00:00:00 2001
 From: Nate Karstens <nate.karstens@garmin.com>
 Date: Thu, 10 Aug 2017 08:27:32 -0500
-Subject: [PATCH 8/8] Handle errors from socket calls
+Subject: [PATCH] Handle errors from socket calls
 
 Adds handling for socket() or read() returning a
 negative value (indicating an error has occurred).
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mDNSPosix.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
-+++ mDNSResponder/mDNSPosix/mDNSPosix.c
-@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNo
+diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
+index 776531dbc8e8..0c9dd2582660 100644
+--- a/mDNSPosix/mDNSPosix.c
++++ b/mDNSPosix/mDNSPosix.c
+@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
  // Read through the messages on sd and if any indicate that any interface records should
  // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
  {
@@ -27,7 +27,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
      char buff[4096];
      struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
  
-@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNo
+@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
      // enough to hold all pending data and so avoid message fragmentation.
      // (Note that FIONREAD is not supported on AF_NETLINK.)
  
@@ -39,7 +39,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
      while (1)
      {
          // Make sure we've got an entire nlmsghdr in the buffer, and payload, too.
-@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNo
+@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
                  pNLMsg = (struct nlmsghdr*) buff;
  
                  // read more data
@@ -50,7 +50,7 @@ Index: mDNSResponder/mDNSPosix/mDNSPosix.c
                  continue;                   // spin around and revalidate with new readCount
              }
              else
-@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanR
+@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUnicast(void)
      int err;
      int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
      struct sockaddr_in s5353;
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
index d443bc97b2a8..818017037cd9 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
@@ -1,4 +1,4 @@
-From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 2001
+From 05cb409ce213f35798c02faf2032d4846a84b48e Mon Sep 17 00:00:00 2001
 From: Beniamin Sandu <beniaminsandu@gmail.com>
 Date: Thu, 15 Jun 2023 17:02:58 +0000
 Subject: [PATCH] remove unneeded headers
@@ -14,10 +14,10 @@ Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
  mDNSPosix/mbedtls.c | 2 --
  1 file changed, 2 deletions(-)
 
-Index: mDNSResponder/mDNSPosix/mbedtls.c
-===================================================================
---- mDNSResponder.orig/mDNSPosix/mbedtls.c
-+++ mDNSResponder/mDNSPosix/mbedtls.c
+diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
+index a73681b6d528..ab8f8c772c00 100644
+--- a/mDNSPosix/mbedtls.c
++++ b/mDNSPosix/mbedtls.c
 @@ -38,10 +38,8 @@
  #include <mbedtls/sha256.h>
  #include <mbedtls/base64.h>
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
deleted file mode 100644
index 511a6fdc1873..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 9fc45a2cf3b78573a568abf538a6e6f4bd30b2d7 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Wed, 27 Sep 2023 11:45:26 +0100
-Subject: [PATCH] Add missing limits.h
-
-Upstream-Status: Pending
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSShared/PlatformCommon.c | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: mDNSResponder/mDNSShared/PlatformCommon.c
-===================================================================
---- mDNSResponder.orig/mDNSShared/PlatformCommon.c
-+++ mDNSResponder/mDNSShared/PlatformCommon.c
-@@ -32,6 +32,7 @@
- #include <time.h>
- #include <sys/time.h>           // Needed for #include <sys/time.h>().
- #include <assert.h>
-+#include <limits.h>
- 
- 
- #include "mDNSEmbeddedAPI.h"    // Defines the interface provided to the client layer above
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.120.24.bb
similarity index 98%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.120.24.bb
index ff7b0447bbfc..9aeda92a4b25 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.120.24.bb
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0008-Handle-errors-from-socket-calls.patch \
            file://0009-remove-unneeded-headers.patch \
            file://mdns.service \
-           file://0015-Add-missing-limits.h.patch \
            file://0001-Handle-interface-without-ifa_addr.patch \
            file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            "
-SRCREV = "8f70f98fc1d0cf439ca3a6470be6ad8ac2bcc019"
+SRCREV = "51a7148a21362285f8013648c4bfa91247ff598a"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.25.1


