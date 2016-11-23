Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C27B719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:31 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so668384pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0OA5E7R3DTIkWArlG8tWqQ0gSUfRxyoZmBQmxEcnvqM=;
	b=JWh0sLlYZLBJ1PnXDRL0/QsOfm1Q+4n/tfwWgEwIsR1xv0BKzOLNhuGxz0JlePHPo9
	EK+mDJL/lHG+FvURo+6UBT5wihKgH4j4QgVCg5FUt2Ic0bL8KqAGONMsnmsO4BMK5vpI
	e4R9RcP5bw76wljrOk19XQsGzhc72GoQ7eXPFfgAX919Ohs9Ba2ELPXR9MLuIEpOeRND
	KiCX4pzjdOVTF4uFHZ31lYZPHCBUZf8aynIRGztMPdDvoSDZNAiTZqwJ0rbXL5TcjseO
	4QnRmYFV0rNyQ326ZBwMFjALc2PxUpl9oDu6O+FScA3iHzk9eaVW4G8I7qTzUiGSW5ba
	lblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0OA5E7R3DTIkWArlG8tWqQ0gSUfRxyoZmBQmxEcnvqM=;
	b=c59X42BHjMfbbFj1lJV4DODuXz3T+8akSADdqfMXmrhEcvYLJ7xVJUi2ipI/brZ3GY
	bjibOdWo1/+u5BQLrF5osQmzCji6UxhcdIG+zsXtYrOzh6LHL24SK6ok8kRSOEPxU71o
	Ji2Lb8Qyg9MdUDz8Uw8FcTGUo6xLqqrvw8ZYmNQE9DVKv4A1g427aDn3dknKy2y8MyXr
	e+BkTK/k0Ez4v0FtGfi13KXL43uRk+WTmeg3OpmvCuGc5h50NwKXUSSjIpKJaoz8Ondu
	A5MDv0eex40jC5lbn9ytv08VTB3JYBM2Pu8Kx+TSxGkPL1wMyVfYr6bBgmneED8ZrDLE
	CicQ==
X-Gm-Message-State: AKaTC02vZ+/KWrWFFEIPDHfBifuiwM6gKStcNBlKoSV51Py9YSuGf1jpPWThMsbBhpgJxg==
X-Received: by 10.84.192.131 with SMTP id c3mr4617161pld.149.1479892952944;
	Wed, 23 Nov 2016 01:22:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:41 -0800
Message-Id: <20161123092209.23699-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 21/49] dibbler: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:31 -0000

dibbler is a light weight DHCPv6 implementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dibbler/dibbler_fix_getSize_crash.patch        | 72 ++++++++++++++++
 .../dibbler/dibbler/types.patch                    | 96 ++++++++++++++++++++++
 .../recipes-connectivity/dibbler/dibbler_1.0.1.bb  | 37 +++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/types.patch
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
new file mode 100644
index 0000000..adb249f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
@@ -0,0 +1,72 @@
+diff --git a/ClntMessages/ClntMsg.cpp b/ClntMessages/ClntMsg.cpp
+index eeaadd0..0cf5dce 100644
+--- a/ClntMessages/ClntMsg.cpp
++++ b/ClntMessages/ClntMsg.cpp
+@@ -346,7 +346,9 @@ unsigned long TClntMsg::getTimeout()
+ 
+ void TClntMsg::send()
+ {
+-    char* pkt = new char[getSize()];
++    size_t size = getSize();
++    char* pkt = new char[size];
++    memset(pkt, 0, size);
+ 
+     srand((uint32_t)time(NULL));
+     if (!RC)
+@@ -364,7 +366,7 @@ void TClntMsg::send()
+ 
+     RC++;
+ 
+-    this->storeSelf(pkt);
++    storeSelf(pkt);
+ 
+     SPtr<TIfaceIface> ptrIface = ClntIfaceMgr().getIfaceByID(Iface);
+     if (!ptrIface) {
+diff --git a/ClntMessages/ClntMsgRequest.cpp b/ClntMessages/ClntMsgRequest.cpp
+index 4a7b5da..f3e40fd 100644
+--- a/ClntMessages/ClntMsgRequest.cpp
++++ b/ClntMessages/ClntMsgRequest.cpp
+@@ -143,7 +143,10 @@ TClntMsgRequest::TClntMsgRequest(List(TAddrIA) IAs,
+     IsDone=false;
+     SPtr<TOpt> ptr;
+     ptr = new TOptDUID(OPTION_CLIENTID, ClntCfgMgr().getDUID(), this );
+-    Options.push_back( ptr );
++
++    if ( ptr ) { 
++        Options.push_back( ptr );
++    }
+ 
+     if (!srvDUID) {
+ 	Log(Error) << "Unable to send REQUEST: ServerId not specified.\n" << LogEnd;
+@@ -154,7 +157,9 @@ TClntMsgRequest::TClntMsgRequest(List(TAddrIA) IAs,
+     ptr = (Ptr*) new TOptDUID(OPTION_SERVERID, srvDUID,this);
+     // all IAs provided by checkSolicit
+     SPtr<TAddrIA> ClntAddrIA;
+-    Options.push_back( ptr );
++    if ( ptr ) {
++        Options.push_back( ptr );
++    }
+ 	
+     IAs.first();
+     while (ClntAddrIA = IAs.get()) 
+diff --git a/Messages/Msg.cpp b/Messages/Msg.cpp
+index baa6c86..6eef6c7 100644
+--- a/Messages/Msg.cpp
++++ b/Messages/Msg.cpp
+@@ -66,10 +66,15 @@ int TMsg::getSize()
+ {
+     int pktsize=0;
+     TOptList::iterator opt;
++    int optionCount = 0;  
+     for (opt = Options.begin(); opt!=Options.end(); ++opt)
+     {
+-	pktsize += (*opt)->getSize();
++        Log(Info) << "### CPE Debug - Option with index  " << optionCount++ << LogEnd ;
++        Log(Info) << "### CPE Debug - Option with type " << (*opt)->getOptType() << LogEnd ;
++        pktsize += (*opt)->getSize();
+     }
++    Log(Info) << "### CPE Debug - Packet size of option (Add 4) " << pktsize << LogEnd ;
++
+     return pktsize + 4;
+ }
+ 
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/types.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/types.patch
new file mode 100644
index 0000000..28f18ef
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/types.patch
@@ -0,0 +1,96 @@
+Apply fixes to build on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: dibbler-1.0.1/IfaceMgr/IfaceMgr.cpp
+===================================================================
+--- dibbler-1.0.1.orig/IfaceMgr/IfaceMgr.cpp
++++ dibbler-1.0.1/IfaceMgr/IfaceMgr.cpp
+@@ -16,6 +16,7 @@
+ #include <string>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <sys/select.h>
+ #include "Portable.h"
+ #include "IfaceMgr.h"
+ #include "Iface.h"
+Index: dibbler-1.0.1/IfaceMgr/SocketIPv6.h
+===================================================================
+--- dibbler-1.0.1.orig/IfaceMgr/SocketIPv6.h
++++ dibbler-1.0.1/IfaceMgr/SocketIPv6.h
+@@ -18,6 +18,7 @@ class TIfaceSocket;
+ 
+ #include <iostream>
+ #include <string>
++#include <sys/select.h>
+ 
+ #include "Portable.h"
+ #include "DHCPConst.h"
+Index: dibbler-1.0.1/Port-linux/ethtool-local.h
+===================================================================
+--- dibbler-1.0.1.orig/Port-linux/ethtool-local.h
++++ dibbler-1.0.1/Port-linux/ethtool-local.h
+@@ -22,9 +22,9 @@
+  */
+ 
+ typedef unsigned long long u64;
+-typedef __uint32_t u32;        
+-typedef __uint16_t u16;        
+-typedef __uint8_t u8;          
++typedef uint32_t u32;
++typedef uint16_t u16;
++typedef uint8_t u8;
+ 
+ #include "ethtool-kernel.h"
+ 
+Index: dibbler-1.0.1/Port-linux/interface.c
+===================================================================
+--- dibbler-1.0.1.orig/Port-linux/interface.c
++++ dibbler-1.0.1/Port-linux/interface.c
+@@ -26,6 +26,7 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <linux/if.h>
++#include <linux/sockios.h>
+ #include <syslog.h>
+ #include <string.h>
+ #include <errno.h>
+@@ -35,13 +36,10 @@
+ #include <stdlib.h>
+ #include <assert.h>
+ 
+-#include <net/if.h>
+ 
+ #include "ethtool-local.h"
+ #include "interface.h"
+ #include <stdarg.h>
+-#include <linux/sockios.h>
+-#include <linux/if_ether.h>
+ 
+ void daemon_log(int loglevel, const char *fmt,...)
+ {
+Index: dibbler-1.0.1/Port-linux/lowlevel-linux-link-state.c
+===================================================================
+--- dibbler-1.0.1.orig/Port-linux/lowlevel-linux-link-state.c
++++ dibbler-1.0.1/Port-linux/lowlevel-linux-link-state.c
+@@ -18,7 +18,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <bits/sigthread.h>
+ #include "Portable.h"
+ #include "interface.h"
+ 
+Index: dibbler-1.0.1/Port-linux/utils.h
+===================================================================
+--- dibbler-1.0.1.orig/Port-linux/utils.h
++++ dibbler-1.0.1/Port-linux/utils.h
+@@ -4,6 +4,7 @@
+ #include <asm/types.h>
+ //#include <resolv.h>
+ #include <linux/types.h>
++#include <sys/types.h>
+ 
+ #include "libnetlink.h"
+ #include "ll_map.h"
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
new file mode 100644
index 0000000..a2d46db
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Dibbler DHCPv6 client"
+DESCRIPTION = "Dibbler is a portable DHCPv6 implementation. It supports stateful as well as stateless autoconfiguration for IPv6."
+HOMEPAGE = "http://klub.com.pl/dhcpv6"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3"
+
+SRC_URI = "http://klub.com.pl/dhcpv6/${BPN}/${P}.tar.gz \
+        file://dibbler_fix_getSize_crash.patch \
+        file://types.patch \
+"
+SRC_URI[md5sum] = "93357bea3ec35b0c1d11242055361409"
+SRC_URI[sha256sum] = "27869877e060c039cbc24a5f6a9dd69006bf67de0ffdf29a645a80aef6e476a1"
+
+PACKAGECONFIG ??= "debug bind-reuse resolvconf dns-update"
+
+PACKAGECONFIG[debug] = "--enable-debug,,,"
+PACKAGECONFIG[efence] = "--enable-efence,,,"
+PACKAGECONFIG[bind-reuse] = "--enable-bind-reuse,,,"
+PACKAGECONFIG[dst-addr-filter] = "--enable-dst-addr-check,,,"
+PACKAGECONFIG[resolvconf] = "--enable-resolvconf,,,"
+PACKAGECONFIG[dns-update] = "--enable-dns-update,,,"
+PACKAGECONFIG[auth] = "--enable-auth,,,"
+PACKAGECONFIG[gtest] = "--enable-gtest-static,,,"
+
+inherit autotools
+
+DEPENDS += "flex-native"
+
+CFLAGS += "-D_GNU_SOURCE"
+
+PACKAGES =+ "${PN}-requestor ${PN}-client ${PN}-relay ${PN}-server"
+
+FILES_${PN}-client = "${sbindir}/${PN}-client"
+FILES_${PN}-relay = "${sbindir}/${PN}-relay"
+FILES_${PN}-requestor = "${sbindir}/${PN}-requestor"
+FILES_${PN}-server = "${sbindir}/${PN}-server"
-- 
2.10.2


