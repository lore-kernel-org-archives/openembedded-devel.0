Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C92AC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 19:33:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4471.1700249583336489671
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 11:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPvjGhXs;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso20604945e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700249581; x=1700854381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cOgeEyOHJ9Xqaiz4C+Igx8kfPgPAA54Y9SYXNfG51/0=;
        b=mPvjGhXsDPaxThLZsemb4KtrnzZzm2PunRy0n6OqcgChEVZRrqJms80eirJ7wyKcsZ
         BiKDVxbfzz+sSBbXJT/xBaKRmZdoBtVF6EU0e4DoTgCYs9gHliIdlK2k7/P14l73/G8G
         Y/Dowg26HDWLOMqdVnSy3Cw+t4f3y4PSZLOIMo1LKUQfLUnvHMRRX0BoTBtz79a0TSJ4
         pIWET+FDaJd1WI2T428zh/7JbwUEqGrOMZJlH1exiFhwfcvHO3W+CLtjY+0eOqMuH5If
         aQ1DWTw6YG+hck1UfVc7RKHAxCFAjF75zb+cAH4UlhdKqDdd+9uhJCwgoQJaVa+pTX/G
         KMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700249581; x=1700854381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOgeEyOHJ9Xqaiz4C+Igx8kfPgPAA54Y9SYXNfG51/0=;
        b=cqr4wZVaIDSesZBPyZJcqvQr9LRCQUtQb6kG7Ad1rzxQAIZ4j8JEnXPJhUi1SVAmUY
         c03270bbRoMU9lkvdmQcVWTnfkNTK4TTYhHtl97GfGema6DVLyGoCvAOTrE6ZGi1p3WY
         SUMKayHjklsQ+/wNkzjS9zMnacUP3gRnnJR0kWdJn/MyqoPc4KNAc+3YeFOXLqHEzgZG
         tmcXgokXk/5C85lksVqRxse/Zm/D9DjHCMBiooBjBBeTp5pYqV46MjYHAT6zONe91X2o
         3a7k+E6xFTfI4V7nCxfYKGJGWbcJndBC/KvEzSG7TR7gFog8ugXOTAHCcOMy/PKuea1s
         ggig==
X-Gm-Message-State: AOJu0YxbKO2rpv2Bv2YVENNslGHXwtKm2u0phTUbeJjvUUaSodxeO0Vx
	AHx362Ek+esXYWX37W396JMHY8ozIC8=
X-Google-Smtp-Source: AGHT+IHsL305TgSiymwcDJjQDZDC/aYKKffjRNbJt8RucGBzD6mH0Jw2P4mo/mI61/RvSAcwD7Y5/A==
X-Received: by 2002:a5d:688e:0:b0:324:8239:2873 with SMTP id h14-20020a5d688e000000b0032482392873mr16800wru.37.1700249580707;
        Fri, 17 Nov 2023 11:33:00 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:1896:6635:7459:2f8d])
        by smtp.gmail.com with ESMTPSA id v8-20020adff688000000b0032daf848f68sm3191812wrp.59.2023.11.17.11.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:33:00 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2200.0.8 -> 2200.40.37.0.1
Date: Fri, 17 Nov 2023 19:32:23 +0000
Message-Id: <20231117193223.7359-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 19:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106875

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...utine-for-cleaning-recent-interfaces.patch | 15 +++++------
 ...01-Handle-interface-without-ifa_addr.patch | 12 ++++-----
 .../0001-dns-sd-Include-missing-headers.patch | 11 +++-----
 ...outine-for-tearing-down-an-interface.patch | 15 +++++------
 ...ke-Set-libdns_sd.so-soname-correctly.patch | 13 ++++-----
 .../0003-Track-interface-socket-family.patch  | 21 +++++++--------
 ...cate-loopback-interface-to-mDNS-core.patch | 19 ++++++-------
 ...-Separate-TLS-targets-from-libraries.patch | 11 +++-----
 ...0005-Use-list-for-changed-interfaces.patch | 27 +++++++++----------
 ...-mDNSCore-Fix-broken-debug-parameter.patch | 10 +++----
 .../0006-Handle-noisy-netlink-sockets.patch   | 17 +++++-------
 .../0006-make-Add-top-level-Makefile.patch    | 10 +++----
 ...-deleted-interfaces-as-being-changed.patch | 13 ++++-----
 ...0008-Handle-errors-from-socket-calls.patch | 19 ++++++-------
 .../mdns/0009-remove-unneeded-headers.patch   | 14 +++++-----
 .../mdns/mdns/0015-Add-missing-limits.h.patch |  8 +++---
 ...dns_2200.0.8.bb => mdns_2200.40.37.0.1.bb} |  4 +--
 17 files changed, 100 insertions(+), 139 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.0.8.bb => mdns_2200.40.37.0.1.bb} (98%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
index 91198dea733c..f5d424d58f4e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
  1 file changed, 14 insertions(+), 10 deletions(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 0a7c3dfa2475..fe7242d83599 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intfAddr, mDNSIPPort port, int interf
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockadd
      return err;
  }
  
@@ -38,7 +38,7 @@ index 0a7c3dfa2475..fe7242d83599 100644
  // Creates a PosixNetworkInterface for the interface whose IP address is
  // intfAddr and whose name is intfName and registers it with mDNS core.
  mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
-@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
  
      // Clean up.
      if (intfList != NULL) freeifaddrs(intfList);
@@ -56,6 +56,3 @@ index 0a7c3dfa2475..fe7242d83599 100644
  
      return err;
  }
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
index daee318ae4a3..7e76f07c0eb3 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface-without-ifa_addr.patch
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index d7f31cc4d5cf..f10301253f58 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(i
  	    continue;
  
          if ((ifa_loop4 == NULL) &&
@@ -26,7 +26,7 @@ index d7f31cc4d5cf..f10301253f58 100644
              ((*ifi)->ifa_addr->sa_family == AF_INET) &&
              ((*ifi)->ifa_flags & IFF_UP) &&
              ((*ifi)->ifa_flags & IFF_LOOPBACK))
-@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(i
              continue;
          }
  
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index 4a60a9572896..82825b294de0 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mDNSPosix/nss_mdns.c | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
-index afadb3c6c33b..84c312759463 100644
---- a/mDNSPosix/nss_mdns.c
-+++ b/mDNSPosix/nss_mdns.c
+Index: mDNSResponder/mDNSPosix/nss_mdns.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/nss_mdns.c
++++ mDNSResponder/mDNSPosix/nss_mdns.c
 @@ -89,6 +89,9 @@
  
  #include <dns_sd.h>
@@ -25,6 +25,3 @@ index afadb3c6c33b..84c312759463 100644
  
  //----------
  // Public functions
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
index aa3dda8d55b7..867db88a5027 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
@@ -13,11 +13,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
  1 file changed, 16 insertions(+), 6 deletions(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index fe7242d83599..a32a880c0ce5 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixNetworkInterface *intf)
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface
      gRecentInterfaces = intf;
  }
  
@@ -37,7 +37,7 @@ index fe7242d83599..a32a880c0ce5 100644
  // Grab the first interface, deregister it, free it, and repeat until done.
  mDNSlocal void ClearInterfaceList(mDNS *const m)
  {
-@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const m)
+@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *
      while (m->HostInterfaces)
      {
          PosixNetworkInterface *intf = (PosixNetworkInterface*)(m->HostInterfaces);
@@ -54,6 +54,3 @@ index fe7242d83599..a32a880c0ce5 100644
  }
  
  mDNSlocal int SetupIPv6Socket(int fd)
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index 7f660396b4e3..03fb1bc0d7d7 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -9,11 +9,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index 802a13dd70b6..5e74193c0e89 100755
---- a/mDNSPosix/Makefile
-+++ b/mDNSPosix/Makefile
-@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
+Index: mDNSResponder/mDNSPosix/Makefile
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/Makefile
++++ mDNSResponder/mDNSPosix/Makefile
+@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$
  CLIENTLIBOBJS = $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o $(OBJDIR)/dnssd_errstring.c.so.o
  
  $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
@@ -22,6 +22,3 @@ index 802a13dd70b6..5e74193c0e89 100755
  	$(STRIP) $@
  
  Clients: setup libdns_sd ../Clients/build/dns-sd
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
index d2a9995ffa43..f1cda2b895bb 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.h | 2 ++
  2 files changed, 3 insertions(+)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index a32a880c0ce5..9a5b4d7ea4cb 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
          // Set up the extra fields in PosixNetworkInterface.
          assert(intf->intfName != NULL);         // intf->intfName already set up above
          intf->index                = intfIndex;
@@ -26,10 +26,10 @@ index a32a880c0ce5..9a5b4d7ea4cb 100644
          intf->multicastSocket4     = -1;
  #if HAVE_IPV6
          intf->multicastSocket6     = -1;
-diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
-index 9675591b0434..dd7864cd0d5e 100644
---- a/mDNSPosix/mDNSPosix.h
-+++ b/mDNSPosix/mDNSPosix.h
+Index: mDNSResponder/mDNSPosix/mDNSPosix.h
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.h
++++ mDNSResponder/mDNSPosix/mDNSPosix.h
 @@ -19,6 +19,7 @@
  #define __mDNSPlatformPosix_h
  
@@ -46,6 +46,3 @@ index 9675591b0434..dd7864cd0d5e 100644
      int multicastSocket4;
  #if HAVE_IPV6
      int multicastSocket6;
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
index a5f7f0136bba..6bc36456f682 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 7 ++++---
  1 file changed, 4 insertions(+), 3 deletions(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 9a5b4d7ea4cb..02a19b438e03 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(void)
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(voi
  // Creates a PosixNetworkInterface for the interface whose IP address is
  // intfAddr and whose name is intfName and registers it with mDNS core.
  mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct sockaddr *intfMask,
@@ -27,7 +27,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
  {
      int err = 0;
      PosixNetworkInterface *intf;
-@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intfAddr, struct
+@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
  
          intf->coreIntf.Advertise = m->AdvertiseLocalAddresses;
          intf->coreIntf.McastTxRx = mDNStrue;
@@ -35,7 +35,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
  
          // Set up the extra fields in PosixNetworkInterface.
          assert(intf->intfName != NULL);         // intf->intfName already set up above
-@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
                      }
  #endif
                      if (SetupOneInterface(m, i->ifa_addr, i->ifa_netmask,
@@ -44,7 +44,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
                      {
                          if (i->ifa_addr->sa_family == AF_INET)
                              foundav4 = mDNStrue;
-@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
+@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
          // if ((m->HostInterfaces == NULL) && (firstLoopback != NULL))
          if (!foundav4 && firstLoopback)
              (void) SetupOneInterface(m, firstLoopback->ifa_addr, firstLoopback->ifa_netmask,
@@ -53,6 +53,3 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
      }
  
      // Clean up.
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index a8e8dae60a20..837580ac368a 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -12,10 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/Makefile | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
-diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
-index 5e74193c0e89..b4313c36b035 100755
---- a/mDNSPosix/Makefile
-+++ b/mDNSPosix/Makefile
+Index: mDNSResponder/mDNSPosix/Makefile
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/Makefile
++++ mDNSResponder/mDNSPosix/Makefile
 @@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
  ifeq ($(tls), no)
  CFLAGS_OS = -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=4 -Wno-expansion-to-defined
@@ -59,6 +59,3 @@ index 5e74193c0e89..b4313c36b035 100755
  
  $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: NetMonitor.c textually imports mDNS.c
  
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
index 1aec34f24300..f00116c61741 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-changed-interfaces.patch
@@ -15,10 +15,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 58 ++++++++++++++++++++++++++++++++-----------
  1 file changed, 43 insertions(+), 15 deletions(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 02a19b438e03..e20adda92229 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
 @@ -74,6 +74,14 @@ struct IfChangeRec
  };
  typedef struct IfChangeRec IfChangeRec;
@@ -34,7 +34,7 @@ index 02a19b438e03..e20adda92229 100644
  // Note that static data is initialized to zero in (modern) C.
  static PosixEventSource *gEventSources;             // linked list of PosixEventSource's
  static sigset_t gEventSignalSet;                // Signals which event loop listens for
-@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
+@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int
      return err;
  }
  
@@ -58,7 +58,7 @@ index 02a19b438e03..e20adda92229 100644
  #if MDNS_DEBUGMSGS
  mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
  {
-@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
+@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(cons
  }
  #endif
  
@@ -74,7 +74,7 @@ index 02a19b438e03..e20adda92229 100644
  
      // The structure here is more complex than it really ought to be because,
      // unfortunately, there's no good way to size a buffer in advance large
-@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNo
  
          // Process the NetLink message
          if (pNLMsg->nlmsg_type == RTM_GETLINK || pNLMsg->nlmsg_type == RTM_NEWLINK)
@@ -86,7 +86,7 @@ index 02a19b438e03..e20adda92229 100644
  
          // Advance pNLMsg to the next message in the buffer
          if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) != 0 && pNLMsg->nlmsg_type != NLMSG_DONE)
-@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNo
          else
              break;  // all done!
      }
@@ -95,7 +95,7 @@ index 02a19b438e03..e20adda92229 100644
  }
  
  #else // USES_NETLINK
-@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMsg(const struct ifa_msghdr *pRSMsg)
+@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMs
  }
  #endif
  
@@ -111,7 +111,7 @@ index 02a19b438e03..e20adda92229 100644
  
      readCount = read(sd, buff, sizeof buff);
      if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
-@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotification(int sd)
+@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNo
          pRSMsg->ifam_type == RTM_IFINFO)
      {
          if (pRSMsg->ifam_type == RTM_IFINFO)
@@ -126,7 +126,7 @@ index 02a19b438e03..e20adda92229 100644
  }
  
  #endif // USES_NETLINK
-@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(i
  {
      IfChangeRec     *pChgRec = (IfChangeRec*) context;
      fd_set readFDs;
@@ -136,7 +136,7 @@ index 02a19b438e03..e20adda92229 100644
      struct timeval zeroTimeout = { 0, 0 };
  
      (void)fd; // Unused
-@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(i
      FD_ZERO(&readFDs);
      FD_SET(pChgRec->NotifySD, &readFDs);
  
@@ -164,6 +164,3 @@ index 02a19b438e03..e20adda92229 100644
  }
  
  // Register with either a Routing Socket or RtNetLink to listen for interface changes.
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 4cda71bdb1bc..fd2f2f117887 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -10,11 +10,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSCore/mDNS.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
-index eecd7daa724e..1e843c081938 100644
---- a/mDNSCore/mDNS.c
-+++ b/mDNSCore/mDNS.c
-@@ -10210,7 +10210,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
+Index: mDNSResponder/mDNSCore/mDNS.c
+===================================================================
+--- mDNSResponder.orig/mDNSCore/mDNS.c
++++ mDNSResponder/mDNSCore/mDNS.c
+@@ -10231,7 +10231,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastA
  #else
                              const DNSServRef dnsserv = qptr->qDNSServer;
  #endif
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
index 882d08e6c63d..80cdbca50013 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-netlink-sockets.patch
@@ -27,11 +27,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 182 +++++++++++++++++++++++++++++++++++++++---
  1 file changed, 172 insertions(+), 10 deletions(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index e20adda92229..5d52de31f79b 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNo
  
  #endif // USES_NETLINK
  
@@ -75,7 +75,7 @@ index e20adda92229..5d52de31f79b 100644
  
      (void)fd; // Unused
  
-@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(int fd, void *context)
+@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(i
      }
      while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NULL, (fd_set*) NULL, &zeroTimeout));
  
@@ -230,7 +230,7 @@ index e20adda92229..5d52de31f79b 100644
      while ((changedInterface = (NetworkInterfaceIndex*)changedInterfaces.Head) != NULL)
      {
          RemoveFromList(&changedInterfaces, changedInterface);
-@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const m)
+@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *
  #endif
  }
  
@@ -247,6 +247,3 @@ index e20adda92229..5d52de31f79b 100644
      ClearInterfaceList(m);
      err = SetupInterfaceList(m);
      return PosixErrorToStatus(err);
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
index 268e574c5090..c12a02fcdd8c 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -12,14 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 2 insertions(+)
  create mode 100644 Makefile
 
-diff --git a/Makefile b/Makefile
-new file mode 100644
-index 000000000000..feb6ac67ef47
+Index: mDNSResponder/Makefile
+===================================================================
 --- /dev/null
-+++ b/Makefile
++++ mDNSResponder/Makefile
 @@ -0,0 +1,2 @@
 +all clean:
 +	cd mDNSPosix && $(MAKE) $@
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
index e53b0fd3ae7a..dae1ac7ea01f 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
@@ -22,11 +22,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 5d52de31f79b..77d982f4c50b 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNo
  #endif
  
          // Process the NetLink message
@@ -35,6 +35,3 @@ index 5d52de31f79b..77d982f4c50b 100644
              AddInterfaceIndexToList(changedInterfaces, ((struct ifinfomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
          else if (pNLMsg->nlmsg_type == RTM_DELADDR || pNLMsg->nlmsg_type == RTM_NEWADDR)
              AddInterfaceIndexToList(changedInterfaces, ((struct ifaddrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
index e689f8c2675c..1789001e14e2 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-from-socket-calls.patch
@@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSPosix/mDNSPosix.c | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
-index 77d982f4c50b..cab512160afb 100644
---- a/mDNSPosix/mDNSPosix.c
-+++ b/mDNSPosix/mDNSPosix.c
-@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+Index: mDNSResponder/mDNSPosix/mDNSPosix.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
++++ mDNSResponder/mDNSPosix/mDNSPosix.c
+@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNo
  // Read through the messages on sd and if any indicate that any interface records should
  // be torn down and rebuilt, return affected indices as a bitmask. Otherwise return 0.
  {
@@ -27,7 +27,7 @@ index 77d982f4c50b..cab512160afb 100644
      char buff[4096];
      struct nlmsghdr         *pNLMsg = (struct nlmsghdr*) buff;
  
-@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNo
      // enough to hold all pending data and so avoid message fragmentation.
      // (Note that FIONREAD is not supported on AF_NETLINK.)
  
@@ -39,7 +39,7 @@ index 77d982f4c50b..cab512160afb 100644
      while (1)
      {
          // Make sure we've got an entire nlmsghdr in the buffer, and payload, too.
-@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNotification(int sd, GenLinkedList *change
+@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNo
                  pNLMsg = (struct nlmsghdr*) buff;
  
                  // read more data
@@ -50,7 +50,7 @@ index 77d982f4c50b..cab512160afb 100644
                  continue;                   // spin around and revalidate with new readCount
              }
              else
-@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUnicast(void)
+@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanR
      int err;
      int s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
      struct sockaddr_in s5353;
@@ -58,6 +58,3 @@ index 77d982f4c50b..cab512160afb 100644
      s5353.sin_family      = AF_INET;
      s5353.sin_port        = MulticastDNSPort.NotAnInteger;
      s5353.sin_addr.s_addr = 0;
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
index 74d387368c43..d443bc97b2a8 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
@@ -14,20 +14,18 @@ Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
  mDNSPosix/mbedtls.c | 2 --
  1 file changed, 2 deletions(-)
 
-diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
-index a73681b..ab8f8c7 100644
---- a/mDNSPosix/mbedtls.c
-+++ b/mDNSPosix/mbedtls.c
+Index: mDNSResponder/mDNSPosix/mbedtls.c
+===================================================================
+--- mDNSResponder.orig/mDNSPosix/mbedtls.c
++++ mDNSResponder/mDNSPosix/mbedtls.c
 @@ -38,10 +38,8 @@
  #include <mbedtls/sha256.h>
  #include <mbedtls/base64.h>
-
+ 
 -#include <mbedtls/certs.h>
  #include <mbedtls/x509.h>
  #include <mbedtls/ssl.h>
 -#include <mbedtls/config.h>
-
+ 
  // Posix TLS server context
  struct TLSContext_struct {
---
-2.34.1
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
index 9fe721ff0759..511a6fdc1873 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limits.h.patch
@@ -9,10 +9,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  mDNSShared/PlatformCommon.c | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/mDNSShared/PlatformCommon.c b/mDNSShared/PlatformCommon.c
-index 9ce15468e217..c308af3e8b0e 100644
---- a/mDNSShared/PlatformCommon.c
-+++ b/mDNSShared/PlatformCommon.c
+Index: mDNSResponder/mDNSShared/PlatformCommon.c
+===================================================================
+--- mDNSResponder.orig/mDNSShared/PlatformCommon.c
++++ mDNSResponder/mDNSShared/PlatformCommon.c
 @@ -32,6 +32,7 @@
  #include <time.h>
  #include <sys/time.h>           // Needed for #include <sys/time.h>().
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
similarity index 98%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
index 8370ed50c08c..af2b337172a1 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
-SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=main \
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=rel/mDNSResponder-2200 \
            file://0001-dns-sd-Include-missing-headers.patch \
            file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
            file://0004-make-Separate-TLS-targets-from-libraries.patch \
@@ -25,7 +25,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0015-Add-missing-limits.h.patch \
            file://0001-Handle-interface-without-ifa_addr.patch \
            "
-SRCREV = "d5029b5dff8aa59d1fc07ed796e994106ef58dee"
+SRCREV = "a9f4049ab772ca57b5afc9804ae5004beb711d6e"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.39.0


