Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5975D7C34B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 19:14:57 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i12so6175893pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 11:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YieiKq8k3u8r70oflEMtrTVzm6QACtCbxwxNS4xekeU=;
	b=mBnxNVJeL4vwp1VUhPsOOBc4wNB9sV5+oyn9KTHK2ILIZXpFEbDHrf79C1wwFYEfz+
	LChzZmge37jim0VaON7wUElW6J2zHnYqEElmabegl4QclbYLyFxNdNOPIC0liaomz7pJ
	xr9oHFvtn7zDoSyv1QCLyEMIslBO+D1Ae45xSghTXNoYyLTlznyTrpUm9/EWUXDdwfPg
	ttQvgxqhw/N72jk6DUY0yrGr+fzNALOU8htNEwORxfocWUOVJELMiyrbH+fhG05tP0NW
	9sNs9ANjq8KVDVBKuCY0KrDgw4KlvenPt3yf6IcAtGOwyWTUtdq8rDRvG7DE4ASsQdUc
	slGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YieiKq8k3u8r70oflEMtrTVzm6QACtCbxwxNS4xekeU=;
	b=bFUlHTx+keF2/EtikN5SgwxjFXveTQL+EPCEFiH+9TTvkV2/hA+CTuBXMYzmmkJ7Ik
	1UefQHPKcVpa7HJIH/1JPI9I4rRzAW2USMPzh8Ia7HFUYp0YkuaS0N0pzllg9747ICAb
	alsKeW/wuTxRufEJMc2uzvex6MF1Qr087QUgYsKeOCibHoDZOTLskcyxJUcNGk8ZxAw0
	MnSEvZb+Vew9ls/aFntFZcgEuu4cQRLHv3ZlHVPWGzz4FbQF+8lwU4QvlRHvYQRoGS/C
	vw5DMNOLjmTGRGHlWCMiTpdhqhrNQ17ZIS09Qt7mH6Bv+wuiiCIIL8/DytBFtF9R8Il0
	3vMA==
X-Gm-Message-State: AJcUukeLG/t4Kv04AD9MdOmY/4K+7ueV8dtjzNdFg86EbVi3J+PG11Js
	7/1Bcz0NqbJl2eNWkSQlVor9/4DLVEY=
X-Google-Smtp-Source: ALg8bN7whx+pgCd/errAhj1OUZPkIEqQKWX6Uq0Us0bUoU6tI12ExPywU2EPabPS8tWNWOG+QPJQPw==
X-Received: by 2002:a63:a002:: with SMTP id r2mr14126520pge.212.1548530097482; 
	Sat, 26 Jan 2019 11:14:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	n7sm37620082pff.36.2019.01.26.11.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Jan 2019 11:14:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Jan 2019 11:14:46 -0800
Message-Id: <20190126191446.36176-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nmap: Fix build with clang8/musl/libc++
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
X-List-Received-Date: Sat, 26 Jan 2019 19:14:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...time.h-for-time-structure-definition.patch | 78 +++++++++++++++++++
 .../files/0002-Fix-building-with-libc.patch   | 76 ++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.70.bb    |  4 +-
 3 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch

diff --git a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch b/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
new file mode 100644
index 0000000000..561c8c82cf
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
@@ -0,0 +1,78 @@
+From c774f2b129fd5acd5647d92c57a2079ae638a62b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jan 2019 23:07:39 -0800
+Subject: [PATCH] include time.h for time structure definition
+
+Exposed by musl/clang
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nmap_error.cc       | 1 +
+ nping/EchoServer.cc | 1 +
+ osscan.cc           | 1 +
+ osscan2.cc          | 1 +
+ service_scan.cc     | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/nmap_error.cc b/nmap_error.cc
+index 19beafb..ea14e08 100644
+--- a/nmap_error.cc
++++ b/nmap_error.cc
+@@ -135,6 +135,7 @@
+ #include "xml.h"
+ 
+ #include <errno.h>
++#include <time.h>
+ 
+ extern NmapOps o;
+ 
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index 70f39b0..40cd4d6 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -137,6 +137,7 @@
+ #include "NpingOps.h"
+ #include "ProbeMode.h"
+ #include <signal.h>
++#include <time.h>
+ 
+ extern NpingOps o;
+ extern EchoServer es;
+diff --git a/osscan.cc b/osscan.cc
+index f851f60..6ae0c83 100644
+--- a/osscan.cc
++++ b/osscan.cc
+@@ -149,6 +149,7 @@
+ #  include <time.h>
+ # endif
+ #endif
++#include <time.h>
+ 
+ #include <algorithm>
+ #include <list>
+diff --git a/osscan2.cc b/osscan2.cc
+index e341947..887fbd2 100644
+--- a/osscan2.cc
++++ b/osscan2.cc
+@@ -147,6 +147,7 @@
+ 
+ #include <list>
+ #include <math.h>
++#include <time.h>
+ 
+ extern NmapOps o;
+ #ifdef WIN32
+diff --git a/service_scan.cc b/service_scan.cc
+index 9780ae3..e07b940 100644
+--- a/service_scan.cc
++++ b/service_scan.cc
+@@ -145,6 +145,7 @@
+ #include "nmap_tty.h"
+ 
+ #include <errno.h>
++#include <time.h>
+ 
+ #if HAVE_OPENSSL
+ /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
diff --git a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
new file mode 100644
index 0000000000..064be8ff85
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
@@ -0,0 +1,76 @@
+From 2a361989b5f84ec23ba7ccb6e527a5590ff55deb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jan 2019 23:11:56 -0800
+Subject: [PATCH] Fix building with libc++
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nping/EchoServer.cc | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index 40cd4d6..04433e1 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -282,14 +282,14 @@ int EchoServer::nep_listen_socket(){
+         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
+     #endif
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr6.sin6_addr = in6addr_any;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+-            }else{ 
++            }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+             }
+         }
+@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){
+ #endif
+ 
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr4.sin_addr.s_addr=INADDR_ANY;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+             }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+@@ -561,7 +561,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+                             nping_print(DBG_3, ";");
+                             /* The payload magic may affect the score only between
+                              * zero and 4 bytes. This is done to prevent long
+-                             * common strings like "GET / HTTP/1.1\r\n" 
++                             * common strings like "GET / HTTP/1.1\r\n"
+                              * increasing the score a lot and cause problems for
+                              * the matching logic. */
+                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
+@@ -571,7 +571,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+                     default:
+                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
+                     break;
+-                }           
++                }
+             } /* End of field specifiers loop */
+ 
+             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
+@@ -650,7 +650,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
+                 }else{
+                     if( (tcplen=tcp.validate())==OP_FAILURE){
+                         return CLIENT_NOT_FOUND;
+-                    }else{                        
++                    }else{
+                         if( (int)pktlen > (iplen+tcplen) ){
+                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
+                                payload_included=true;
diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.70.bb
index 01be1515b7..b28b6a2528 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.70.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=1489288f46af415fad
 SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://nmap-redefine-the-python-library-dir.patch \
            file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
-"
+           file://0001-include-time.h-for-time-structure-definition.patch \
+           file://0002-Fix-building-with-libc.patch \
+           "
 
 SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
 SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
-- 
2.20.1


