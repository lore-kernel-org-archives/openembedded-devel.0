Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C53F277E5C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:33 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 79so18586715pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lGAxOj0FxjlLigX/nosW8W/zPaHDe57Bbhhnxt/11V4=;
	b=l9WJBsCQVUWPUNcD2Mm0XJBdtKn4TadVn4AB6WSKU51oJFH8V/NtJqKy3SzEHaklBT
	dflKOUaYesF+dc7sVgIqLrO3P0TQkusr9YPxBZbLogwgAxRavgy/eOrHHvYPjk8vQIK0
	D5rbfEofeB0LW3V7aC52sbBtas2OIS/inNjkrL3EcpLzgktAcdWDDvQB+wKs77A0UtQh
	8PLOl4GkioPer41tktI505sqCxsNTr+s710QkEj5coZn3W3d0cPrfQz2a0G6+5sCXClO
	TiESXLLydSSLnVPM9W3lm74JOGS08ZM8Eaj0ROIyPeF1zg94lcfVeZ/NCwe15Q57XeXY
	EMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lGAxOj0FxjlLigX/nosW8W/zPaHDe57Bbhhnxt/11V4=;
	b=gENzjO5nYRaz16zBb6rfM+iGv2ovftrk8K7lXg9/rG9nx8mEt2XXw/n+hj1L+fDuWn
	jTyIf3FG+uyPWX6O2LFh8zz1ilzTZSqcxnzYrdwj+oecx+tqj3ehuYz9TZztx9twZeWB
	Dp78rtFi+kZfcnqrwQxwxDe0ANskAOCoe0bL0lTRflC9goJuU1R/lPpYOI1p58IdM6z3
	qhhiHd85cLOy9AihAh/zZ/R9eBZ+4yMx22CBXMid0xtVAY3LuVnc/axVjwuW+7TAahVw
	LiWXVGRqEz5Kk10WuPTNVMnu7dD4pB0rliXprC8bNWaJI2p91Jjbx+nxjYE03XeUnRYX
	ED+Q==
X-Gm-Message-State: AFeK/H0QmR8WmsV1CTukzE3PMd0ipCNOAPLojqZAcg5/zD21RqGnYN97JPubKLXNZM7jWA==
X-Received: by 10.98.144.69 with SMTP id a66mr3707432pfe.30.1490978614956;
	Fri, 31 Mar 2017 09:43:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:31 -0700
Message-Id: <20170331164247.5052-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 27/43] dibbler: Upgrade to 1.0.2RC1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Mar 2017 16:43:34 -0000

Delete dibbler from meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dibbler/dibbler_fix_getSize_crash.patch        | 56 ++++---------
 .../dibbler/dibbler/types.patch                    | 96 ----------------------
 .../dibbler/{dibbler_1.0.1.bb => dibbler_git.bb}   | 16 ++--
 .../recipes-connectivity/dibbler/dibbler_1.0.1.bb  | 40 ---------
 4 files changed, 24 insertions(+), 184 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/types.patch
 rename meta-networking/recipes-connectivity/dibbler/{dibbler_1.0.1.bb => dibbler_git.bb} (77%)
 delete mode 100644 meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
index adb249fde..42d2627a1 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
@@ -1,32 +1,8 @@
-diff --git a/ClntMessages/ClntMsg.cpp b/ClntMessages/ClntMsg.cpp
-index eeaadd0..0cf5dce 100644
---- a/ClntMessages/ClntMsg.cpp
-+++ b/ClntMessages/ClntMsg.cpp
-@@ -346,7 +346,9 @@ unsigned long TClntMsg::getTimeout()
- 
- void TClntMsg::send()
- {
--    char* pkt = new char[getSize()];
-+    size_t size = getSize();
-+    char* pkt = new char[size];
-+    memset(pkt, 0, size);
- 
-     srand((uint32_t)time(NULL));
-     if (!RC)
-@@ -364,7 +366,7 @@ void TClntMsg::send()
- 
-     RC++;
- 
--    this->storeSelf(pkt);
-+    storeSelf(pkt);
- 
-     SPtr<TIfaceIface> ptrIface = ClntIfaceMgr().getIfaceByID(Iface);
-     if (!ptrIface) {
-diff --git a/ClntMessages/ClntMsgRequest.cpp b/ClntMessages/ClntMsgRequest.cpp
-index 4a7b5da..f3e40fd 100644
---- a/ClntMessages/ClntMsgRequest.cpp
-+++ b/ClntMessages/ClntMsgRequest.cpp
-@@ -143,7 +143,10 @@ TClntMsgRequest::TClntMsgRequest(List(TAddrIA) IAs,
+Index: git/ClntMessages/ClntMsgRequest.cpp
+===================================================================
+--- git.orig/ClntMessages/ClntMsgRequest.cpp
++++ git/ClntMessages/ClntMsgRequest.cpp
+@@ -142,7 +142,10 @@ TClntMsgRequest::TClntMsgRequest(List(TA
      IsDone=false;
      SPtr<TOpt> ptr;
      ptr = new TOptDUID(OPTION_CLIENTID, ClntCfgMgr().getDUID(), this );
@@ -38,8 +14,8 @@ index 4a7b5da..f3e40fd 100644
  
      if (!srvDUID) {
  	Log(Error) << "Unable to send REQUEST: ServerId not specified.\n" << LogEnd;
-@@ -154,7 +157,9 @@ TClntMsgRequest::TClntMsgRequest(List(TAddrIA) IAs,
-     ptr = (Ptr*) new TOptDUID(OPTION_SERVERID, srvDUID,this);
+@@ -153,7 +156,9 @@ TClntMsgRequest::TClntMsgRequest(List(TA
+     ptr = new TOptDUID(OPTION_SERVERID, srvDUID,this);
      // all IAs provided by checkSolicit
      SPtr<TAddrIA> ClntAddrIA;
 -    Options.push_back( ptr );
@@ -49,21 +25,21 @@ index 4a7b5da..f3e40fd 100644
  	
      IAs.first();
      while (ClntAddrIA = IAs.get()) 
-diff --git a/Messages/Msg.cpp b/Messages/Msg.cpp
-index baa6c86..6eef6c7 100644
---- a/Messages/Msg.cpp
-+++ b/Messages/Msg.cpp
-@@ -66,10 +66,15 @@ int TMsg::getSize()
+Index: git/Messages/Msg.cpp
+===================================================================
+--- git.orig/Messages/Msg.cpp
++++ git/Messages/Msg.cpp
+@@ -69,10 +69,15 @@ int TMsg::getSize()
  {
      int pktsize=0;
      TOptList::iterator opt;
-+    int optionCount = 0;  
++    int optionCount = 0;
      for (opt = Options.begin(); opt!=Options.end(); ++opt)
      {
 -	pktsize += (*opt)->getSize();
-+        Log(Info) << "### CPE Debug - Option with index  " << optionCount++ << LogEnd ;
-+        Log(Info) << "### CPE Debug - Option with type " << (*opt)->getOptType() << LogEnd ;
-+        pktsize += (*opt)->getSize();
++       Log(Info) << "### CPE Debug - Option with index  " << optionCount++ << LogEnd ;
++       Log(Info) << "### CPE Debug - Option with type " << (*opt)->getOptType() << LogEnd ;
++       pktsize += (*opt)->getSize();
      }
 +    Log(Info) << "### CPE Debug - Packet size of option (Add 4) " << pktsize << LogEnd ;
 +
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/types.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/types.patch
deleted file mode 100644
index 28f18ef42..000000000
--- a/meta-networking/recipes-connectivity/dibbler/dibbler/types.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-Apply fixes to build on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-
-Index: dibbler-1.0.1/IfaceMgr/IfaceMgr.cpp
-===================================================================
---- dibbler-1.0.1.orig/IfaceMgr/IfaceMgr.cpp
-+++ dibbler-1.0.1/IfaceMgr/IfaceMgr.cpp
-@@ -16,6 +16,7 @@
- #include <string>
- #include <stdlib.h>
- #include <errno.h>
-+#include <sys/select.h>
- #include "Portable.h"
- #include "IfaceMgr.h"
- #include "Iface.h"
-Index: dibbler-1.0.1/IfaceMgr/SocketIPv6.h
-===================================================================
---- dibbler-1.0.1.orig/IfaceMgr/SocketIPv6.h
-+++ dibbler-1.0.1/IfaceMgr/SocketIPv6.h
-@@ -18,6 +18,7 @@ class TIfaceSocket;
- 
- #include <iostream>
- #include <string>
-+#include <sys/select.h>
- 
- #include "Portable.h"
- #include "DHCPConst.h"
-Index: dibbler-1.0.1/Port-linux/ethtool-local.h
-===================================================================
---- dibbler-1.0.1.orig/Port-linux/ethtool-local.h
-+++ dibbler-1.0.1/Port-linux/ethtool-local.h
-@@ -22,9 +22,9 @@
-  */
- 
- typedef unsigned long long u64;
--typedef __uint32_t u32;        
--typedef __uint16_t u16;        
--typedef __uint8_t u8;          
-+typedef uint32_t u32;
-+typedef uint16_t u16;
-+typedef uint8_t u8;
- 
- #include "ethtool-kernel.h"
- 
-Index: dibbler-1.0.1/Port-linux/interface.c
-===================================================================
---- dibbler-1.0.1.orig/Port-linux/interface.c
-+++ dibbler-1.0.1/Port-linux/interface.c
-@@ -26,6 +26,7 @@
- #include <sys/socket.h>
- #include <sys/ioctl.h>
- #include <linux/if.h>
-+#include <linux/sockios.h>
- #include <syslog.h>
- #include <string.h>
- #include <errno.h>
-@@ -35,13 +36,10 @@
- #include <stdlib.h>
- #include <assert.h>
- 
--#include <net/if.h>
- 
- #include "ethtool-local.h"
- #include "interface.h"
- #include <stdarg.h>
--#include <linux/sockios.h>
--#include <linux/if_ether.h>
- 
- void daemon_log(int loglevel, const char *fmt,...)
- {
-Index: dibbler-1.0.1/Port-linux/lowlevel-linux-link-state.c
-===================================================================
---- dibbler-1.0.1.orig/Port-linux/lowlevel-linux-link-state.c
-+++ dibbler-1.0.1/Port-linux/lowlevel-linux-link-state.c
-@@ -18,7 +18,6 @@
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
--#include <bits/sigthread.h>
- #include "Portable.h"
- #include "interface.h"
- 
-Index: dibbler-1.0.1/Port-linux/utils.h
-===================================================================
---- dibbler-1.0.1.orig/Port-linux/utils.h
-+++ dibbler-1.0.1/Port-linux/utils.h
-@@ -4,6 +4,7 @@
- #include <asm/types.h>
- //#include <resolv.h>
- #include <linux/types.h>
-+#include <sys/types.h>
- 
- #include "libnetlink.h"
- #include "ll_map.h"
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
rename to meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index 1913d3a60..8890e1431 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -5,12 +5,14 @@ HOMEPAGE = "http://klub.com.pl/dhcpv6"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3"
 
-SRC_URI = "http://klub.com.pl/dhcpv6/${BPN}/${BP}.tar.gz \
-        file://dibbler_fix_getSize_crash.patch \
-        file://types.patch \
-"
-SRC_URI[md5sum] = "93357bea3ec35b0c1d11242055361409"
-SRC_URI[sha256sum] = "27869877e060c039cbc24a5f6a9dd69006bf67de0ffdf29a645a80aef6e476a1"
+SRCREV = "c4b0ed52e751da7823dd9a36e91f93a6310e5525"
+
+SRC_URI = "git://github.com/tomaszmrugalski/dibbler \
+           file://dibbler_fix_getSize_crash.patch \
+          "
+PV = "1.0.1+1.0.2RC1+git${SRCREV}"
+
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "debug bind-reuse resolvconf dns-update"
 
@@ -27,8 +29,6 @@ inherit autotools
 
 DEPENDS += "flex-native"
 
-CFLAGS += "-D_GNU_SOURCE"
-
 PACKAGES =+ "${PN}-requestor ${PN}-client ${PN}-relay ${PN}-server"
 
 FILES_${PN}-client = "${sbindir}/${PN}-client"
diff --git a/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb b/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
deleted file mode 100644
index 41bb78fff..000000000
--- a/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "A portable DHCPv6 implementation"
-DESCRIPTION = "Dibbler is a portable DHCPv6 implementation. It supports stateful \
-(i.e. IPv6 address granting and IPv6 prefix delegation) as well as stateless (i.e. \
-option granting) autoconfiguration for IPv6."
-HOMEPAGE = "http://klub.com.pl/dhcpv6"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3 \
-                    file://bison++/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "http://klub.com.pl/dhcpv6/dibbler/dibbler-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "93357bea3ec35b0c1d11242055361409"
-SRC_URI[sha256sum] = "27869877e060c039cbc24a5f6a9dd69006bf67de0ffdf29a645a80aef6e476a1"
-
-inherit autotools
-
-PACKAGECONFIG ?= "auth bind-reuse dns-update dst-addr-filter link-state"
-
-PACKAGECONFIG[auth] = "--enable-auth,--disable-auth"
-PACKAGECONFIG[bind-reuse] = "--enable-bind-reuse,--disable-bind-reuse"
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-PACKAGECONFIG[dns-update] = "--enable-dns-update,--disable-dns-update"
-PACKAGECONFIG[dst-addr-filter] = "--enable-dst-addr-filter,--disable-dst-addr-filter"
-PACKAGECONFIG[link-state] = "--enable-link-state,--disable-link-state"
-PACKAGECONFIG[remote-autoconf] = "--enable-remote-autoconf,--disable-remote-autoconf"
-PACKAGECONFIG[resolvconf] = "--enable-resolvconf,--disable-resolvconf"
-
-EXTRA_OECONF += " \
-    --disable-efence \
-    --with-gtest=no \
-"
-
-PACKAGES =+ "${PN}-client ${PN}-relay ${PN}-requestor ${PN}-server"
-
-FILES_${PN}-client = "${sbindir}/${PN}-client"
-FILES_${PN}-relay = "${sbindir}/${PN}-relay"
-FILES_${PN}-requestor = "${sbindir}/${PN}-requestor"
-FILES_${PN}-server = "${sbindir}/${PN}-server"
-- 
2.12.1


