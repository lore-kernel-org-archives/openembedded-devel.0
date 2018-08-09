Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FDF378E42
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 05:16:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w795GwY3002855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2018 22:16:58 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 8 Aug 2018 22:16:57 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Aug 2018 13:16:46 +0800
Message-ID: <1533791809-371521-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
References: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] net-snmp: upgrade 5.7.3 -> 5.8
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
X-List-Received-Date: Thu, 09 Aug 2018 05:16:57 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-snmptrap-to-use-clientaddr-from-snmp.c.patch |   45 -
 .../net-snmp/0001-Remove-U64-typedef.patch         | 2524 --------------------
 .../0001-config_os_headers-Error-Fix.patch         |   13 +-
 .../net-snmp/0001-config_os_libs2-Error-Fix.patch  |   31 -
 ...igure-fix-check-for-enable-perl-cc-checks.patch |   31 -
 .../0001-get_pid_from_inode-Include-limit.h.patch  |   14 +-
 ...IPv6-transport-Add-a-missing-return-state.patch |   26 -
 ...tools.c-Don-t-check-for-return-from-EVP_M.patch |   16 +-
 .../0002-configure-fix-a-cc-check-issue.patch      |    6 +-
 ...NGES-BUG-2712-Fix-Perl-module-compilation.patch |  186 --
 .../0004-configure-fix-incorrect-variable.patch    |   10 +-
 .../dont-return-incompletely-parsed-varbinds.patch |  131 -
 .../net-snmp/net-snmp/fix-libtool-finish.patch     |   19 +-
 .../net-snmp/fix-openssl-build-errors.patch        |  181 --
 ...nmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch |   23 +-
 .../net-snmp/net-snmp/net-snmp-agentx-crash.patch  |   75 -
 .../net-snmp/net-snmp-fix-for-disable-des.patch    |   10 +-
 ...p-testing-add-the-output-format-for-ptest.patch |   17 +-
 .../{net-snmp_5.7.3.bb => net-snmp_5.8.bb}         |   14 +-
 19 files changed, 67 insertions(+), 3305 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.7.3.bb => net-snmp_5.8.bb} (92%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
deleted file mode 100644
index b14b761..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a92628a163ebf1ea62220684736300461c003875 Mon Sep 17 00:00:00 2001
-From: Niels Baggesen <nba@users.sourceforge.net>
-Date: Mon, 26 Jan 2015 20:26:06 +0100
-Subject: [PATCH] BUG#a2584: Fix snmptrap to use clientaddr from snmp.conf.
- Thanks to rizwan
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- snmplib/transports/snmpUDPIPv6Domain.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-Index: net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/transports/snmpUDPIPv6Domain.c
-+++ net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
-@@ -286,6 +286,27 @@ netsnmp_udp6_transport(struct sockaddr_i
-         return NULL;
- #endif /* NETSNMP_NO_LISTEN_SUPPORT */
-     } else {
-+        char           *client_socket = NULL;
-+        /*
-+         * This is a client session.  If we've been given a
-+         * client address to send from, then bind to that.
-+         * Otherwise the send will use "something sensible".
-+         */
-+
-+        client_socket = netsnmp_ds_get_string(NETSNMP_DS_LIBRARY_ID,
-+                                    NETSNMP_DS_LIB_CLIENT_ADDR);
-+        if (client_socket) {
-+            struct sockaddr_in6 client_addr;
-+            netsnmp_sockaddr_in6_2(&client_addr, client_socket, NULL);
-+            rc = bind(t->sock, (struct sockaddr *)&client_addr,
-+                              sizeof(struct sockaddr_in6));
-+            if ( rc != 0 ) {
-+                DEBUGMSGTL(("netsnmp_udp6", "failed to bind for clientaddr: %d %s\n",
-+                                 errno, strerror(errno)));
-+                netsnmp_socketbase_close(t);
-+                netsnmp_transport_free(t);
-+            }
-+        }
-         /*
-          * This is a client session.  Save the address in the
-          * transport-specific data pointer for later use by netsnmp_udp6_send.
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch
deleted file mode 100644
index 7314ab1..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch
+++ /dev/null
@@ -1,2524 +0,0 @@
-net-snmp: remove U64 typedef
-
-From git://git.code.sf.net/p/net-snmp/code
-
-Upstream-Status: Backport (unmodified)
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-From 477b4307ef12ddce3b6a9205e0bdddbfb2e0e9b6 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sat, 20 Feb 2016 18:58:18 -0800
-Subject: [PATCH 1/1] Remove U64 typedef
-
-The U64 typedef conflicts with a typedef in a Perl header file. Hence
-remove the U64 typedef from the Net-SNMP header files. This patch does
-not modify the Net-SNMP ABI.
----
- agent/mibgroup/if-mib/ifXTable/ifXTable.c          |  16 +-
- agent/mibgroup/if-mib/ifXTable/ifXTable.h          |  48 +-
- .../mibgroup/if-mib/ifXTable/ifXTable_interface.c  |  32 +-
- .../ip-mib/data_access/systemstats_common.c        |   2 +-
- .../ipIfStatsTable/ipIfStatsTable_data_get.c       |  28 +-
- .../ipIfStatsTable/ipIfStatsTable_data_get.h       |  28 +-
- .../ipIfStatsTable/ipIfStatsTable_interface.c      |  56 +-
- .../ip-mib/ipSystemStatsTable/ipSystemStatsTable.c |  28 +-
- .../ip-mib/ipSystemStatsTable/ipSystemStatsTable.h | 921 ++-------------------
- .../ipSystemStatsTable_interface.c                 |  56 +-
- include/net-snmp/data_access/ipstats.h             |  42 +-
- include/net-snmp/library/int64.h                   |  34 +-
- snmplib/int64.c                                    |  38 +-
- snmplib/read_config.c                              |   6 +-
- testing/fulltests/unit-tests/T015int64_clib.c      |  10 +-
- 15 files changed, 274 insertions(+), 1071 deletions(-)
-
-Index: net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/if-mib/ifXTable/ifXTable.c
-+++ net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.c
-@@ -722,7 +722,7 @@ The total number of octets received on t
-  */
- int
- ifHCInOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                 U64 * ifHCInOctets_val_ptr)
-+                 struct counter64 *ifHCInOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCInOctets_val_ptr);
-@@ -779,7 +779,7 @@ The number of packets, delivered by this
-  */
- int
- ifHCInUcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                    U64 * ifHCInUcastPkts_val_ptr)
-+                    struct counter64 *ifHCInUcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCInUcastPkts_val_ptr);
-@@ -838,7 +838,7 @@ The number of packets, delivered by this
-  */
- int
- ifHCInMulticastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                        U64 * ifHCInMulticastPkts_val_ptr)
-+                        struct counter64 *ifHCInMulticastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCInMulticastPkts_val_ptr);
-@@ -897,7 +897,7 @@ The number of packets, delivered by this
-  */
- int
- ifHCInBroadcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                        U64 * ifHCInBroadcastPkts_val_ptr)
-+                        struct counter64 *ifHCInBroadcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCInBroadcastPkts_val_ptr);
-@@ -955,7 +955,7 @@ The total number of octets transmitted o
-  */
- int
- ifHCOutOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                  U64 * ifHCOutOctets_val_ptr)
-+                  struct counter64 *ifHCOutOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCOutOctets_val_ptr);
-@@ -1013,7 +1013,7 @@ The total number of packets that higher-
-  */
- int
- ifHCOutUcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                     U64 * ifHCOutUcastPkts_val_ptr)
-+                     struct counter64 *ifHCOutUcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCOutUcastPkts_val_ptr);
-@@ -1074,7 +1074,7 @@ The total number of packets that higher-
-  */
- int
- ifHCOutMulticastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                         U64 * ifHCOutMulticastPkts_val_ptr)
-+                         struct counter64 *ifHCOutMulticastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCOutMulticastPkts_val_ptr);
-@@ -1134,7 +1134,7 @@ The total number of packets that higher-
-  */
- int
- ifHCOutBroadcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                         U64 * ifHCOutBroadcastPkts_val_ptr)
-+                         struct counter64 *ifHCOutBroadcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ifHCOutBroadcastPkts_val_ptr);
-Index: net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.h
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/if-mib/ifXTable/ifXTable.h
-+++ net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.h
-@@ -143,28 +143,28 @@ config_require(if-mib/ifXTable/ifXTable_
-                                            u_long *
-                                            ifOutBroadcastPkts_val_ptr);
-     int             ifHCInOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                                     U64 * ifHCInOctets_val_ptr);
-+                                     struct counter64 *ifHCInOctets_val_ptr);
-     int             ifHCInUcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                                        U64 * ifHCInUcastPkts_val_ptr);
-+                                        struct counter64 *ifHCInUcastPkts_val_ptr);
-     int             ifHCInMulticastPkts_get(ifXTable_rowreq_ctx *
-                                             rowreq_ctx,
--                                            U64 *
-+                                            struct counter64 *
-                                             ifHCInMulticastPkts_val_ptr);
-     int             ifHCInBroadcastPkts_get(ifXTable_rowreq_ctx *
-                                             rowreq_ctx,
--                                            U64 *
-+                                            struct counter64 *
-                                             ifHCInBroadcastPkts_val_ptr);
-     int             ifHCOutOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                                      U64 * ifHCOutOctets_val_ptr);
-+                                      struct counter64 *ifHCOutOctets_val_ptr);
-     int             ifHCOutUcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
--                                         U64 * ifHCOutUcastPkts_val_ptr);
-+                                         struct counter64 *ifHCOutUcastPkts_val_ptr);
-     int             ifHCOutMulticastPkts_get(ifXTable_rowreq_ctx *
-                                              rowreq_ctx,
--                                             U64 *
-+                                             struct counter64 *
-                                              ifHCOutMulticastPkts_val_ptr);
-     int             ifHCOutBroadcastPkts_get(ifXTable_rowreq_ctx *
-                                              rowreq_ctx,
--                                             U64 *
-+                                             struct counter64 *
-                                              ifHCOutBroadcastPkts_val_ptr);
-     int             ifLinkUpDownTrapEnable_get(ifXTable_rowreq_ctx *
-                                                rowreq_ctx,
-@@ -284,86 +284,86 @@ config_require(if-mib/ifXTable/ifXTable_
- 
-     int             ifHCInOctets_check_value(ifXTable_rowreq_ctx *
-                                              rowreq_ctx,
--                                             U64 ifHCInOctets_val);
-+                                             struct counter64 ifHCInOctets_val);
-     int             ifHCInOctets_undo_setup(ifXTable_rowreq_ctx *
-                                             rowreq_ctx);
-     int             ifHCInOctets_set(ifXTable_rowreq_ctx * rowreq_ctx,
--                                     U64 ifHCInOctets_val);
-+                                     struct counter64 ifHCInOctets_val);
-     int             ifHCInOctets_undo(ifXTable_rowreq_ctx * rowreq_ctx);
- 
-     int             ifHCInUcastPkts_check_value(ifXTable_rowreq_ctx *
-                                                 rowreq_ctx,
--                                                U64 ifHCInUcastPkts_val);
-+                                                struct counter64 ifHCInUcastPkts_val);
-     int             ifHCInUcastPkts_undo_setup(ifXTable_rowreq_ctx *
-                                                rowreq_ctx);
-     int             ifHCInUcastPkts_set(ifXTable_rowreq_ctx * rowreq_ctx,
--                                        U64 ifHCInUcastPkts_val);
-+                                        struct counter64 ifHCInUcastPkts_val);
-     int             ifHCInUcastPkts_undo(ifXTable_rowreq_ctx * rowreq_ctx);
- 
-     int             ifHCInMulticastPkts_check_value(ifXTable_rowreq_ctx *
-                                                     rowreq_ctx,
--                                                    U64
-+                                                    struct counter64
-                                                     ifHCInMulticastPkts_val);
-     int             ifHCInMulticastPkts_undo_setup(ifXTable_rowreq_ctx *
-                                                    rowreq_ctx);
-     int             ifHCInMulticastPkts_set(ifXTable_rowreq_ctx *
-                                             rowreq_ctx,
--                                            U64 ifHCInMulticastPkts_val);
-+                                            struct counter64 ifHCInMulticastPkts_val);
-     int             ifHCInMulticastPkts_undo(ifXTable_rowreq_ctx *
-                                              rowreq_ctx);
- 
-     int             ifHCInBroadcastPkts_check_value(ifXTable_rowreq_ctx *
-                                                     rowreq_ctx,
--                                                    U64
-+                                                    struct counter64
-                                                     ifHCInBroadcastPkts_val);
-     int             ifHCInBroadcastPkts_undo_setup(ifXTable_rowreq_ctx *
-                                                    rowreq_ctx);
-     int             ifHCInBroadcastPkts_set(ifXTable_rowreq_ctx *
-                                             rowreq_ctx,
--                                            U64 ifHCInBroadcastPkts_val);
-+                                            struct counter64 ifHCInBroadcastPkts_val);
-     int             ifHCInBroadcastPkts_undo(ifXTable_rowreq_ctx *
-                                              rowreq_ctx);
- 
-     int             ifHCOutOctets_check_value(ifXTable_rowreq_ctx *
-                                               rowreq_ctx,
--                                              U64 ifHCOutOctets_val);
-+                                              struct counter64 ifHCOutOctets_val);
-     int             ifHCOutOctets_undo_setup(ifXTable_rowreq_ctx *
-                                              rowreq_ctx);
-     int             ifHCOutOctets_set(ifXTable_rowreq_ctx * rowreq_ctx,
--                                      U64 ifHCOutOctets_val);
-+                                      struct counter64 ifHCOutOctets_val);
-     int             ifHCOutOctets_undo(ifXTable_rowreq_ctx * rowreq_ctx);
- 
-     int             ifHCOutUcastPkts_check_value(ifXTable_rowreq_ctx *
-                                                  rowreq_ctx,
--                                                 U64 ifHCOutUcastPkts_val);
-+                                                 struct counter64 ifHCOutUcastPkts_val);
-     int             ifHCOutUcastPkts_undo_setup(ifXTable_rowreq_ctx *
-                                                 rowreq_ctx);
-     int             ifHCOutUcastPkts_set(ifXTable_rowreq_ctx * rowreq_ctx,
--                                         U64 ifHCOutUcastPkts_val);
-+                                         struct counter64 ifHCOutUcastPkts_val);
-     int             ifHCOutUcastPkts_undo(ifXTable_rowreq_ctx *
-                                           rowreq_ctx);
- 
-     int             ifHCOutMulticastPkts_check_value(ifXTable_rowreq_ctx *
-                                                      rowreq_ctx,
--                                                     U64
-+                                                     struct counter64
-                                                      ifHCOutMulticastPkts_val);
-     int             ifHCOutMulticastPkts_undo_setup(ifXTable_rowreq_ctx *
-                                                     rowreq_ctx);
-     int             ifHCOutMulticastPkts_set(ifXTable_rowreq_ctx *
-                                              rowreq_ctx,
--                                             U64 ifHCOutMulticastPkts_val);
-+                                             struct counter64 ifHCOutMulticastPkts_val);
-     int             ifHCOutMulticastPkts_undo(ifXTable_rowreq_ctx *
-                                               rowreq_ctx);
- 
-     int             ifHCOutBroadcastPkts_check_value(ifXTable_rowreq_ctx *
-                                                      rowreq_ctx,
--                                                     U64
-+                                                     struct counter64
-                                                      ifHCOutBroadcastPkts_val);
-     int             ifHCOutBroadcastPkts_undo_setup(ifXTable_rowreq_ctx *
-                                                     rowreq_ctx);
-     int             ifHCOutBroadcastPkts_set(ifXTable_rowreq_ctx *
-                                              rowreq_ctx,
--                                             U64 ifHCOutBroadcastPkts_val);
-+                                             struct counter64 ifHCOutBroadcastPkts_val);
-     int             ifHCOutBroadcastPkts_undo(ifXTable_rowreq_ctx *
-                                               rowreq_ctx);
- 
-Index: net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
-+++ net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
-@@ -729,72 +729,72 @@ _ifXTable_get_column(ifXTable_rowreq_ctx
-          * ifHCInOctets(6)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCINOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCInOctets_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCInOctets_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCInUcastPkts(7)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCINUCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCInUcastPkts_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCInUcastPkts_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCInMulticastPkts(8)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCINMULTICASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCInMulticastPkts_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCInMulticastPkts_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCInBroadcastPkts(9)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCINBROADCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCInBroadcastPkts_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCInBroadcastPkts_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCOutOctets(10)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCOUTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCOutOctets_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCOutOctets_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCOutUcastPkts(11)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCOUTUCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCOutUcastPkts_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCOutUcastPkts_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCOutMulticastPkts(12)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCOUTMULTICASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCOutMulticastPkts_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCOutMulticastPkts_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-          * ifHCOutBroadcastPkts(13)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IFHCOUTBROADCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ifHCOutBroadcastPkts_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ifHCOutBroadcastPkts_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/data_access/systemstats_common.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/data_access/systemstats_common.c
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/data_access/systemstats_common.c
-@@ -264,7 +264,7 @@ _calculate_entries(netsnmp_systemstats_e
-            && entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCOUTFRAGCREATES]
-         && entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCOUTDISCARDS]) {
- 
--        U64 tmp, tmp2, tmp3;
-+        struct counter64 tmp, tmp2, tmp3;
-         tmp = entry->stats.HCOutRequests;
-         u64Incr(&tmp, &entry->stats.HCOutForwDatagrams);
-         u64Incr(&tmp, &entry->stats.HCOutFragCreates);
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
-@@ -270,7 +270,7 @@ The total number of input IP datagrams r
-  */
- int
- ipIfStatsHCInReceives_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                          U64 * ipIfStatsHCInReceives_val_ptr)
-+                          struct counter64 *ipIfStatsHCInReceives_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInReceives_val_ptr);
-@@ -395,7 +395,7 @@ The total number of octets received in i
-  */
- int
- ipIfStatsHCInOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                        U64 * ipIfStatsHCInOctets_val_ptr)
-+                        struct counter64 *ipIfStatsHCInOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInOctets_val_ptr);
-@@ -862,7 +862,7 @@ The number of input datagrams for which
-  */
- int
- ipIfStatsHCInForwDatagrams_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                               U64 * ipIfStatsHCInForwDatagrams_val_ptr)
-+                               struct counter64 *ipIfStatsHCInForwDatagrams_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInForwDatagrams_val_ptr);
-@@ -1267,7 +1267,7 @@ The total number of datagrams successful
-  */
- int
- ipIfStatsHCInDelivers_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                          U64 * ipIfStatsHCInDelivers_val_ptr)
-+                          struct counter64 *ipIfStatsHCInDelivers_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInDelivers_val_ptr);
-@@ -1396,7 +1396,7 @@ The total number of IP datagrams that lo
-  */
- int
- ipIfStatsHCOutRequests_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                           U64 * ipIfStatsHCOutRequests_val_ptr)
-+                           struct counter64 *ipIfStatsHCOutRequests_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutRequests_val_ptr);
-@@ -1532,7 +1532,7 @@ The number of datagrams for which this e
-  */
- int
- ipIfStatsHCOutForwDatagrams_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                                U64 * ipIfStatsHCOutForwDatagrams_val_ptr)
-+                                struct counter64 *ipIfStatsHCOutForwDatagrams_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutForwDatagrams_val_ptr);
-@@ -1999,7 +1999,7 @@ The total number of IP datagrams that th
-  */
- int
- ipIfStatsHCOutTransmits_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                            U64 * ipIfStatsHCOutTransmits_val_ptr)
-+                            struct counter64 *ipIfStatsHCOutTransmits_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutTransmits_val_ptr);
-@@ -2123,7 +2123,7 @@ The total number of octets in IP datagra
-  */
- int
- ipIfStatsHCOutOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                         U64 * ipIfStatsHCOutOctets_val_ptr)
-+                         struct counter64 *ipIfStatsHCOutOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutOctets_val_ptr);
-@@ -2245,7 +2245,7 @@ The number of IP multicast datagrams rec
-  */
- int
- ipIfStatsHCInMcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                           U64 * ipIfStatsHCInMcastPkts_val_ptr)
-+                           struct counter64 *ipIfStatsHCInMcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInMcastPkts_val_ptr);
-@@ -2372,7 +2372,7 @@ The total number of octets received in I
-  */
- int
- ipIfStatsHCInMcastOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                             U64 * ipIfStatsHCInMcastOctets_val_ptr)
-+                             struct counter64 *ipIfStatsHCInMcastOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInMcastOctets_val_ptr);
-@@ -2497,7 +2497,7 @@ The number of IP multicast datagrams tra
-  */
- int
- ipIfStatsHCOutMcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                            U64 * ipIfStatsHCOutMcastPkts_val_ptr)
-+                            struct counter64 *ipIfStatsHCOutMcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutMcastPkts_val_ptr);
-@@ -2621,7 +2621,7 @@ The total number of octets transmitted i
-  */
- int
- ipIfStatsHCOutMcastOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                              U64 * ipIfStatsHCOutMcastOctets_val_ptr)
-+                              struct counter64 *ipIfStatsHCOutMcastOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutMcastOctets_val_ptr);
-@@ -2743,7 +2743,7 @@ The number of IP broadcast datagrams rec
-  */
- int
- ipIfStatsHCInBcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                           U64 * ipIfStatsHCInBcastPkts_val_ptr)
-+                           struct counter64 *ipIfStatsHCInBcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCInBcastPkts_val_ptr);
-@@ -2865,7 +2865,7 @@ The number of IP broadcast datagrams tra
-  */
- int
- ipIfStatsHCOutBcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
--                            U64 * ipIfStatsHCOutBcastPkts_val_ptr)
-+                            struct counter64 *ipIfStatsHCOutBcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipIfStatsHCOutBcastPkts_val_ptr);
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
-@@ -50,7 +50,7 @@ extern          "C" {
-                                             ipIfStatsInReceives_val_ptr);
-     int             ipIfStatsHCInReceives_get(ipIfStatsTable_rowreq_ctx *
-                                               rowreq_ctx,
--                                              U64 *
-+                                              struct counter64 *
-                                               ipIfStatsHCInReceives_val_ptr);
-     int             ipIfStatsInOctets_get(ipIfStatsTable_rowreq_ctx *
-                                           rowreq_ctx,
-@@ -58,7 +58,7 @@ extern          "C" {
-                                           ipIfStatsInOctets_val_ptr);
-     int             ipIfStatsHCInOctets_get(ipIfStatsTable_rowreq_ctx *
-                                             rowreq_ctx,
--                                            U64 *
-+                                            struct counter64 *
-                                             ipIfStatsHCInOctets_val_ptr);
-     int             ipIfStatsInHdrErrors_get(ipIfStatsTable_rowreq_ctx *
-                                              rowreq_ctx,
-@@ -87,7 +87,7 @@ extern          "C" {
-     int            
-         ipIfStatsHCInForwDatagrams_get(ipIfStatsTable_rowreq_ctx *
-                                        rowreq_ctx,
--                                       U64 *
-+                                       struct counter64 *
-                                        ipIfStatsHCInForwDatagrams_val_ptr);
-     int             ipIfStatsReasmReqds_get(ipIfStatsTable_rowreq_ctx *
-                                             rowreq_ctx,
-@@ -111,7 +111,7 @@ extern          "C" {
-                                             ipIfStatsInDelivers_val_ptr);
-     int             ipIfStatsHCInDelivers_get(ipIfStatsTable_rowreq_ctx *
-                                               rowreq_ctx,
--                                              U64 *
-+                                              struct counter64 *
-                                               ipIfStatsHCInDelivers_val_ptr);
-     int             ipIfStatsOutRequests_get(ipIfStatsTable_rowreq_ctx *
-                                              rowreq_ctx,
-@@ -119,7 +119,7 @@ extern          "C" {
-                                              ipIfStatsOutRequests_val_ptr);
-     int             ipIfStatsHCOutRequests_get(ipIfStatsTable_rowreq_ctx *
-                                                rowreq_ctx,
--                                               U64 *
-+                                               struct counter64 *
-                                                ipIfStatsHCOutRequests_val_ptr);
-     int             ipIfStatsOutForwDatagrams_get(ipIfStatsTable_rowreq_ctx
-                                                   * rowreq_ctx,
-@@ -128,7 +128,7 @@ extern          "C" {
-     int            
-         ipIfStatsHCOutForwDatagrams_get(ipIfStatsTable_rowreq_ctx *
-                                         rowreq_ctx,
--                                        U64 *
-+                                        struct counter64 *
-                                         ipIfStatsHCOutForwDatagrams_val_ptr);
-     int             ipIfStatsOutDiscards_get(ipIfStatsTable_rowreq_ctx *
-                                              rowreq_ctx,
-@@ -156,7 +156,7 @@ extern          "C" {
-                                               ipIfStatsOutTransmits_val_ptr);
-     int             ipIfStatsHCOutTransmits_get(ipIfStatsTable_rowreq_ctx *
-                                                 rowreq_ctx,
--                                                U64 *
-+                                                struct counter64 *
-                                                 ipIfStatsHCOutTransmits_val_ptr);
-     int             ipIfStatsOutOctets_get(ipIfStatsTable_rowreq_ctx *
-                                            rowreq_ctx,
-@@ -164,7 +164,7 @@ extern          "C" {
-                                            ipIfStatsOutOctets_val_ptr);
-     int             ipIfStatsHCOutOctets_get(ipIfStatsTable_rowreq_ctx *
-                                              rowreq_ctx,
--                                             U64 *
-+                                             struct counter64 *
-                                              ipIfStatsHCOutOctets_val_ptr);
-     int             ipIfStatsInMcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                              rowreq_ctx,
-@@ -172,7 +172,7 @@ extern          "C" {
-                                              ipIfStatsInMcastPkts_val_ptr);
-     int             ipIfStatsHCInMcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                                rowreq_ctx,
--                                               U64 *
-+                                               struct counter64 *
-                                                ipIfStatsHCInMcastPkts_val_ptr);
-     int             ipIfStatsInMcastOctets_get(ipIfStatsTable_rowreq_ctx *
-                                                rowreq_ctx,
-@@ -180,7 +180,7 @@ extern          "C" {
-                                                ipIfStatsInMcastOctets_val_ptr);
-     int             ipIfStatsHCInMcastOctets_get(ipIfStatsTable_rowreq_ctx
-                                                  * rowreq_ctx,
--                                                 U64 *
-+                                                 struct counter64 *
-                                                  ipIfStatsHCInMcastOctets_val_ptr);
-     int             ipIfStatsOutMcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                               rowreq_ctx,
-@@ -188,7 +188,7 @@ extern          "C" {
-                                               ipIfStatsOutMcastPkts_val_ptr);
-     int             ipIfStatsHCOutMcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                                 rowreq_ctx,
--                                                U64 *
-+                                                struct counter64 *
-                                                 ipIfStatsHCOutMcastPkts_val_ptr);
-     int             ipIfStatsOutMcastOctets_get(ipIfStatsTable_rowreq_ctx *
-                                                 rowreq_ctx,
-@@ -196,7 +196,7 @@ extern          "C" {
-                                                 ipIfStatsOutMcastOctets_val_ptr);
-     int             ipIfStatsHCOutMcastOctets_get(ipIfStatsTable_rowreq_ctx
-                                                   * rowreq_ctx,
--                                                  U64 *
-+                                                  struct counter64 *
-                                                   ipIfStatsHCOutMcastOctets_val_ptr);
-     int             ipIfStatsInBcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                              rowreq_ctx,
-@@ -204,7 +204,7 @@ extern          "C" {
-                                              ipIfStatsInBcastPkts_val_ptr);
-     int             ipIfStatsHCInBcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                                rowreq_ctx,
--                                               U64 *
-+                                               struct counter64 *
-                                                ipIfStatsHCInBcastPkts_val_ptr);
-     int             ipIfStatsOutBcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                               rowreq_ctx,
-@@ -212,7 +212,7 @@ extern          "C" {
-                                               ipIfStatsOutBcastPkts_val_ptr);
-     int             ipIfStatsHCOutBcastPkts_get(ipIfStatsTable_rowreq_ctx *
-                                                 rowreq_ctx,
--                                                U64 *
-+                                                struct counter64 *
-                                                 ipIfStatsHCOutBcastPkts_val_ptr);
-     int            
-         ipIfStatsDiscontinuityTime_get(ipIfStatsTable_rowreq_ctx *
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
-@@ -722,10 +722,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInReceives(4)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINRECEIVES:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCInReceives_get(rowreq_ctx,
--                                       (U64 *) var->val.string);
-+                                       (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -741,9 +741,9 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInOctets(6)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ipIfStatsHCInOctets_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ipIfStatsHCInOctets_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -810,10 +810,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInForwDatagrams(13)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINFORWDATAGRAMS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCInForwDatagrams_get(rowreq_ctx,
--                                            (U64 *) var->val.string);
-+                                            (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -869,10 +869,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInDelivers(19)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINDELIVERS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCInDelivers_get(rowreq_ctx,
--                                       (U64 *) var->val.string);
-+                                       (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -889,10 +889,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutRequests(21)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTREQUESTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCOutRequests_get(rowreq_ctx,
--                                        (U64 *) var->val.string);
-+                                        (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -909,10 +909,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutForwDatagrams(24)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTFORWDATAGRAMS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCOutForwDatagrams_get(rowreq_ctx,
--                                             (U64 *) var->val.string);
-+                                             (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -979,10 +979,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutTransmits(31)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTTRANSMITS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCOutTransmits_get(rowreq_ctx,
--                                         (U64 *) var->val.string);
-+                                         (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -999,9 +999,9 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutOctets(33)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
--        rc = ipIfStatsHCOutOctets_get(rowreq_ctx, (U64 *) var->val.string);
-+        rc = ipIfStatsHCOutOctets_get(rowreq_ctx, (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1018,10 +1018,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInMcastPkts(35)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINMCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCInMcastPkts_get(rowreq_ctx,
--                                        (U64 *) var->val.string);
-+                                        (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1038,10 +1038,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInMcastOctets(37)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINMCASTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCInMcastOctets_get(rowreq_ctx,
--                                          (U64 *) var->val.string);
-+                                          (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1058,10 +1058,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutMcastPkts(39)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTMCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCOutMcastPkts_get(rowreq_ctx,
--                                         (U64 *) var->val.string);
-+                                         (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1078,10 +1078,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutMcastOctets(41)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTMCASTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCOutMcastOctets_get(rowreq_ctx,
--                                           (U64 *) var->val.string);
-+                                           (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1098,10 +1098,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCInBcastPkts(43)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCINBCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCInBcastPkts_get(rowreq_ctx,
--                                        (U64 *) var->val.string);
-+                                        (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1118,10 +1118,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
-          * ipIfStatsHCOutBcastPkts(45)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPIFSTATSHCOUTBCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipIfStatsHCOutBcastPkts_get(rowreq_ctx,
--                                         (U64 *) var->val.string);
-+                                         (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
-@@ -452,7 +452,7 @@ The total number of input IP datagrams r
-  */
- int
- ipSystemStatsHCInReceives_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                              U64 * ipSystemStatsHCInReceives_val_ptr)
-+                              struct counter64 *ipSystemStatsHCInReceives_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCInReceives_val_ptr);
-@@ -579,7 +579,7 @@ The total number of octets received in i
-  */
- int
- ipSystemStatsHCInOctets_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                            U64 * ipSystemStatsHCInOctets_val_ptr)
-+                            struct counter64 *ipSystemStatsHCInOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCInOctets_val_ptr);
-@@ -1058,7 +1058,7 @@ The number of input datagrams for which
- int
- ipSystemStatsHCInForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-                                    rowreq_ctx,
--                                   U64 *
-+                                   struct counter64 *
-                                    ipSystemStatsHCInForwDatagrams_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-@@ -1474,7 +1474,7 @@ The total number of datagrams successful
-  */
- int
- ipSystemStatsHCInDelivers_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                              U64 * ipSystemStatsHCInDelivers_val_ptr)
-+                              struct counter64 *ipSystemStatsHCInDelivers_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCInDelivers_val_ptr);
-@@ -1602,7 +1602,7 @@ The total number of IP datagrams which l
-  */
- int
- ipSystemStatsHCOutRequests_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                               U64 * ipSystemStatsHCOutRequests_val_ptr)
-+                               struct counter64 *ipSystemStatsHCOutRequests_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCOutRequests_val_ptr);
-@@ -1809,7 +1809,7 @@ The number of datagrams for which this e
- int
- ipSystemStatsHCOutForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
--                                    U64 *
-+                                    struct counter64 *
-                                     ipSystemStatsHCOutForwDatagrams_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-@@ -2288,7 +2288,7 @@ The total number of IP datagrams that th
-  */
- int
- ipSystemStatsHCOutTransmits_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                                U64 * ipSystemStatsHCOutTransmits_val_ptr)
-+                                struct counter64 *ipSystemStatsHCOutTransmits_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCOutTransmits_val_ptr);
-@@ -2415,7 +2415,7 @@ The total number of octets in IP datagra
-  */
- int
- ipSystemStatsHCOutOctets_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                             U64 * ipSystemStatsHCOutOctets_val_ptr)
-+                             struct counter64 *ipSystemStatsHCOutOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCOutOctets_val_ptr);
-@@ -2539,7 +2539,7 @@ The number of IP multicast datagrams rec
-  */
- int
- ipSystemStatsHCInMcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                               U64 * ipSystemStatsHCInMcastPkts_val_ptr)
-+                               struct counter64 *ipSystemStatsHCInMcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCInMcastPkts_val_ptr);
-@@ -2665,7 +2665,7 @@ The total number of octets received in I
- int
- ipSystemStatsHCInMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                  rowreq_ctx,
--                                 U64 *
-+                                 struct counter64 *
-                                  ipSystemStatsHCInMcastOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-@@ -2790,7 +2790,7 @@ The number of IP multicast datagrams tra
-  */
- int
- ipSystemStatsHCOutMcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                                U64 * ipSystemStatsHCOutMcastPkts_val_ptr)
-+                                struct counter64 *ipSystemStatsHCOutMcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCOutMcastPkts_val_ptr);
-@@ -2921,7 +2921,7 @@ The total number of octets transmitted i
- int
- ipSystemStatsHCOutMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                   rowreq_ctx,
--                                  U64 *
-+                                  struct counter64 *
-                                   ipSystemStatsHCOutMcastOctets_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-@@ -3046,7 +3046,7 @@ The number of IP broadcast datagrams rec
-  */
- int
- ipSystemStatsHCInBcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                               U64 * ipSystemStatsHCInBcastPkts_val_ptr)
-+                               struct counter64 *ipSystemStatsHCInBcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCInBcastPkts_val_ptr);
-@@ -3170,7 +3170,7 @@ The number of IP broadcast datagrams tra
-  */
- int
- ipSystemStatsHCOutBcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
--                                U64 * ipSystemStatsHCOutBcastPkts_val_ptr)
-+                                struct counter64 *ipSystemStatsHCOutBcastPkts_val_ptr)
- {
-    /** we should have a non-NULL pointer */
-     netsnmp_assert(NULL != ipSystemStatsHCOutBcastPkts_val_ptr);
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
-@@ -144,93 +144,22 @@ config_require(ip-mib/ipSystemStatsTable
-      *********************************************************************
-      * function prototypes
-      */
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsTable_pre_request(ipSystemStatsTable_registration *
-+    int ipSystemStatsTable_pre_request(ipSystemStatsTable_registration *
-                                        user_context);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsTable_post_request(ipSystemStatsTable_registration *
-+    int ipSystemStatsTable_post_request(ipSystemStatsTable_registration *
-                                         user_context, int rc);
- 
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsTable_rowreq_ctx_init(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsTable_rowreq_ctx_init(ipSystemStatsTable_rowreq_ctx *
-                                            rowreq_ctx,
-                                            void *user_init_ctx);
-     void
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
-         ipSystemStatsTable_rowreq_ctx_cleanup(ipSystemStatsTable_rowreq_ctx
-                                               * rowreq_ctx);
- 
-     ipSystemStatsTable_data *ipSystemStatsTable_allocate_data(void);
-     void            ipSystemStatsTable_release_data(ipSystemStatsTable_data
-                                                     * data);
--
--
--         
--         
--         
--         
--         
--         
--        ipSystemStatsTable_rowreq_ctx
-+    ipSystemStatsTable_rowreq_ctx
-         * ipSystemStatsTable_row_find_by_mib_index
-         (ipSystemStatsTable_mib_index * mib_idx);
- 
-@@ -265,226 +194,50 @@ config_require(ip-mib/ipSystemStatsTable
-      * indexes
-      */
- 
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInReceives_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInReceives_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsInReceives_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInReceives_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInReceives_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
--                                      U64 *
-+                                      struct counter64 *
-                                       ipSystemStatsHCInReceives_val_ptr);
-     int             ipSystemStatsInOctets_get(ipSystemStatsTable_rowreq_ctx
-                                               * rowreq_ctx,
-                                               u_long *
-                                               ipSystemStatsInOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
--                                    U64 * ipSystemStatsHCInOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInHdrErrors_get(ipSystemStatsTable_rowreq_ctx *
-+                                    struct counter64 *ipSystemStatsHCInOctets_val_ptr);
-+    int ipSystemStatsInHdrErrors_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsInHdrErrors_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInNoRoutes_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInNoRoutes_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsInNoRoutes_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInAddrErrors_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInAddrErrors_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
-                                       u_long *
-                                       ipSystemStatsInAddrErrors_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInUnknownProtos_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInUnknownProtos_get(ipSystemStatsTable_rowreq_ctx *
-                                          rowreq_ctx,
-                                          u_long *
-                                          ipSystemStatsInUnknownProtos_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInTruncatedPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInTruncatedPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                          rowreq_ctx,
-                                          u_long *
-                                          ipSystemStatsInTruncatedPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-                                          rowreq_ctx,
-                                          u_long *
-                                          ipSystemStatsInForwDatagrams_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-                                            rowreq_ctx,
--                                           U64 *
-+                                           struct counter64 *
-                                            ipSystemStatsHCInForwDatagrams_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsReasmReqds_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsReasmReqds_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsReasmReqds_val_ptr);
-@@ -492,690 +245,142 @@ config_require(ip-mib/ipSystemStatsTable
-                                               * rowreq_ctx,
-                                               u_long *
-                                               ipSystemStatsReasmOKs_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsReasmFails_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsReasmFails_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsReasmFails_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInDiscards_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInDiscards_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsInDiscards_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInDelivers_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInDelivers_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsInDelivers_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInDelivers_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInDelivers_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
--                                      U64 *
-+                                      struct counter64 *
-                                       ipSystemStatsHCInDelivers_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutRequests_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutRequests_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsOutRequests_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutRequests_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutRequests_get(ipSystemStatsTable_rowreq_ctx *
-                                        rowreq_ctx,
--                                       U64 *
-+                                       struct counter64 *
-                                        ipSystemStatsHCOutRequests_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutNoRoutes_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutNoRoutes_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsOutNoRoutes_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-                                           rowreq_ctx,
-                                           u_long *
-                                           ipSystemStatsOutForwDatagrams_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
-                                             rowreq_ctx,
--                                            U64 *
-+                                            struct counter64 *
-                                             ipSystemStatsHCOutForwDatagrams_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutDiscards_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutDiscards_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsOutDiscards_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutFragReqds_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutFragReqds_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
-                                       u_long *
-                                       ipSystemStatsOutFragReqds_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutFragOKs_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutFragOKs_get(ipSystemStatsTable_rowreq_ctx *
-                                     rowreq_ctx,
-                                     u_long *
-                                     ipSystemStatsOutFragOKs_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutFragFails_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutFragFails_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
-                                       u_long *
-                                       ipSystemStatsOutFragFails_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutFragCreates_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutFragCreates_get(ipSystemStatsTable_rowreq_ctx *
-                                         rowreq_ctx,
-                                         u_long *
-                                         ipSystemStatsOutFragCreates_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutTransmits_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutTransmits_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
-                                       u_long *
-                                       ipSystemStatsOutTransmits_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutTransmits_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutTransmits_get(ipSystemStatsTable_rowreq_ctx *
-                                         rowreq_ctx,
--                                        U64 *
-+                                        struct counter64 *
-                                         ipSystemStatsHCOutTransmits_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                    rowreq_ctx,
-                                    u_long *
-                                    ipSystemStatsOutOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
--                                     U64 *
-+                                     struct counter64 *
-                                      ipSystemStatsHCOutOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsInMcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                        rowreq_ctx,
--                                       U64 *
-+                                       struct counter64 *
-                                        ipSystemStatsHCInMcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                        rowreq_ctx,
-                                        u_long *
-                                        ipSystemStatsInMcastOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                          rowreq_ctx,
--                                         U64 *
-+                                         struct counter64 *
-                                          ipSystemStatsHCInMcastOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
-                                       u_long *
-                                       ipSystemStatsOutMcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutMcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                         rowreq_ctx,
--                                        U64 *
-+                                        struct counter64 *
-                                         ipSystemStatsHCOutMcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                         rowreq_ctx,
-                                         u_long *
-                                         ipSystemStatsOutMcastOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
-                                           rowreq_ctx,
--                                          U64 *
-+                                          struct counter64 *
-                                           ipSystemStatsHCOutMcastOctets_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsInBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsInBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsInBcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCInBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCInBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                        rowreq_ctx,
--                                       U64 *
-+                                       struct counter64 *
-                                        ipSystemStatsHCInBcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsOutBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsOutBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                       rowreq_ctx,
-                                       u_long *
-                                       ipSystemStatsOutBcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsHCOutBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsHCOutBcastPkts_get(ipSystemStatsTable_rowreq_ctx *
-                                         rowreq_ctx,
--                                        U64 *
-+                                        struct counter64 *
-                                         ipSystemStatsHCOutBcastPkts_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsDiscontinuityTime_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsDiscontinuityTime_get(ipSystemStatsTable_rowreq_ctx *
-                                            rowreq_ctx,
-                                            u_long *
-                                            ipSystemStatsDiscontinuityTime_val_ptr);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsRefreshRate_get(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsRefreshRate_get(ipSystemStatsTable_rowreq_ctx *
-                                      rowreq_ctx,
-                                      u_long *
-                                      ipSystemStatsRefreshRate_val_ptr);
--
--
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsTable_indexes_set_tbl_idx(ipSystemStatsTable_mib_index
-+    int ipSystemStatsTable_indexes_set_tbl_idx(ipSystemStatsTable_mib_index
-                                                * tbl_idx,
-                                                u_long
-                                                ipSystemStatsIPVersion_val);
--    int
--     
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        
--        ipSystemStatsTable_indexes_set(ipSystemStatsTable_rowreq_ctx *
-+    int ipSystemStatsTable_indexes_set(ipSystemStatsTable_rowreq_ctx *
-                                        rowreq_ctx,
-                                        u_long ipSystemStatsIPVersion_val);
- 
--
--
-     /*
-      *********************************************************************
-      * SET function declarations
-Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
-+++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
-@@ -674,10 +674,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInReceives(4)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINRECEIVES:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInReceives_get(rowreq_ctx,
--                                           (U64 *) var->val.string);
-+                                           (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -694,10 +694,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInOctets(6)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInOctets_get(rowreq_ctx,
--                                         (U64 *) var->val.string);
-+                                         (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -764,10 +764,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInForwDatagrams(13)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINFORWDATAGRAMS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInForwDatagrams_get(rowreq_ctx,
--                                                (U64 *) var->val.string);
-+                                                (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -824,10 +824,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInDelivers(19)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINDELIVERS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInDelivers_get(rowreq_ctx,
--                                           (U64 *) var->val.string);
-+                                           (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -844,10 +844,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutRequests(21)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTREQUESTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutRequests_get(rowreq_ctx,
--                                            (U64 *) var->val.string);
-+                                            (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -874,10 +874,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutForwDatagrams(24)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTFORWDATAGRAMS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutForwDatagrams_get(rowreq_ctx,
--                                                 (U64 *) var->val.string);
-+                                                 (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -944,10 +944,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutTransmits(31)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTTRANSMITS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutTransmits_get(rowreq_ctx,
--                                             (U64 *) var->val.string);
-+                                             (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -964,10 +964,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutOctets(33)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutOctets_get(rowreq_ctx,
--                                          (U64 *) var->val.string);
-+                                          (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -984,10 +984,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInMcastPkts(35)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINMCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInMcastPkts_get(rowreq_ctx,
--                                            (U64 *) var->val.string);
-+                                            (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1004,10 +1004,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInMcastOctets(37)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINMCASTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInMcastOctets_get(rowreq_ctx,
--                                              (U64 *) var->val.string);
-+                                              (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1024,10 +1024,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutMcastPkts(39)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTMCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutMcastPkts_get(rowreq_ctx,
--                                             (U64 *) var->val.string);
-+                                             (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1044,10 +1044,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutMcastOctets(41)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTMCASTOCTETS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutMcastOctets_get(rowreq_ctx,
--                                               (U64 *) var->val.string);
-+                                               (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1064,10 +1064,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCInBcastPkts(43)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCINBCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCInBcastPkts_get(rowreq_ctx,
--                                            (U64 *) var->val.string);
-+                                            (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-@@ -1084,10 +1084,10 @@ _ipSystemStatsTable_get_column(ipSystemS
-          * ipSystemStatsHCOutBcastPkts(45)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
-          */
-     case COLUMN_IPSYSTEMSTATSHCOUTBCASTPKTS:
--        var->val_len = sizeof(U64);
-+        var->val_len = sizeof(struct counter64);
-         var->type = ASN_COUNTER64;
-         rc = ipSystemStatsHCOutBcastPkts_get(rowreq_ctx,
--                                             (U64 *) var->val.string);
-+                                             (struct counter64 *) var->val.string);
-         break;
- 
-         /*
-Index: net-snmp-5.7.3/include/net-snmp/data_access/ipstats.h
-===================================================================
---- net-snmp-5.7.3.orig/include/net-snmp/data_access/ipstats.h
-+++ net-snmp-5.7.3/include/net-snmp/data_access/ipstats.h
-@@ -58,45 +58,45 @@ typedef struct netsnmp_ipstats_s {
-     * other columns, when underlying OS does not provide them.
-     * Always fill at least 32 bits, the table is periodically polled -> 32 bit
-     * overflow shall be detected and 64 bit value should be computed automatically. */
--   U64             HCInReceives;
--   U64             HCInOctets;
-+   struct counter64 HCInReceives;
-+   struct counter64 HCInOctets;
-    u_long          InHdrErrors;
--   U64             HCInNoRoutes; 
-+   struct counter64 HCInNoRoutes; 
-    u_long          InAddrErrors;
-    u_long          InUnknownProtos;
-    u_long          InTruncatedPkts;
-    
-    /* optional, can be computed from HCInNoRoutes and HCOutForwDatagrams */
--   U64             HCInForwDatagrams; 
-+   struct counter64 HCInForwDatagrams; 
-    
-    u_long          ReasmReqds;
-    u_long          ReasmOKs;
-    u_long          ReasmFails;
-    u_long          InDiscards;
--   U64             HCInDelivers;
--   U64             HCOutRequests;
--   U64             HCOutNoRoutes;
--   U64             HCOutForwDatagrams;
--   U64             HCOutDiscards;
-+   struct counter64 HCInDelivers;
-+   struct counter64 HCOutRequests;
-+   struct counter64 HCOutNoRoutes;
-+   struct counter64 HCOutForwDatagrams;
-+   struct counter64 HCOutDiscards;
-    
-    /* optional, can be computed from HCOutFragOKs + HCOutFragFails*/
--   U64             HCOutFragReqds;
--   U64             HCOutFragOKs;
--   U64             HCOutFragFails;
--   U64             HCOutFragCreates;
-+   struct counter64 HCOutFragReqds;
-+   struct counter64 HCOutFragOKs;
-+   struct counter64 HCOutFragFails;
-+   struct counter64 HCOutFragCreates;
-    
-    /* optional, can be computed from 
-     * HCOutRequests +HCOutForwDatagrams + HCOutFragCreates
-     * - HCOutFragReqds - HCOutNoRoutes  - HCOutDiscards */
--   U64             HCOutTransmits;
-+   struct counter64 HCOutTransmits;
-    
--   U64             HCOutOctets;
--   U64             HCInMcastPkts;
--   U64             HCInMcastOctets;
--   U64             HCOutMcastPkts;
--   U64             HCOutMcastOctets;
--   U64             HCInBcastPkts;
--   U64             HCOutBcastPkts;
-+   struct counter64 HCOutOctets;
-+   struct counter64 HCInMcastPkts;
-+   struct counter64 HCInMcastOctets;
-+   struct counter64 HCOutMcastPkts;
-+   struct counter64 HCOutMcastOctets;
-+   struct counter64 HCInBcastPkts;
-+   struct counter64 HCOutBcastPkts;
- 
-    /* Array of available columns.*/
-    int             columnAvail[IPSYSTEMSTATSTABLE_LAST+1];
-Index: net-snmp-5.7.3/include/net-snmp/library/int64.h
-===================================================================
---- net-snmp-5.7.3.orig/include/net-snmp/library/int64.h
-+++ net-snmp-5.7.3/include/net-snmp/library/int64.h
-@@ -5,31 +5,29 @@
- extern          "C" {
- #endif
- 
--    typedef struct counter64 U64;
--
- #define I64CHARSZ 21
- 
--    void            divBy10(U64, U64 *, unsigned int *);
--    void            multBy10(U64, U64 *);
--    void            incrByU16(U64 *, unsigned int);
--    void            incrByU32(U64 *, unsigned int);
-+    void            divBy10(struct counter64, struct counter64 *, unsigned int *);
-+    void            multBy10(struct counter64, struct counter64 *);
-+    void            incrByU16(struct counter64 *, unsigned int);
-+    void            incrByU32(struct counter64 *, unsigned int);
-     NETSNMP_IMPORT
--    void            zeroU64(U64 *);
--    int             isZeroU64(const U64 *);
-+    void            zeroU64(struct counter64 *);
-+    int             isZeroU64(const struct counter64 *);
-     NETSNMP_IMPORT
--    void            printU64(char *, const U64 *);
-+    void            printU64(char *, const struct counter64 *);
-     NETSNMP_IMPORT
--    void            printI64(char *, const U64 *);
--    int             read64(U64 *, const char *);
-+    void            printI64(char *, const struct counter64 *);
-+    int             read64(struct counter64 *, const char *);
-     NETSNMP_IMPORT
--    void            u64Subtract(const U64 * pu64one, const U64 * pu64two,
--                                U64 * pu64out);
--    void            u64Incr(U64 * pu64out, const U64 * pu64one);
--    void            u64UpdateCounter(U64 * pu64out, const U64 * pu64one,
--                                     const U64 * pu64two);
--    void            u64Copy(U64 * pu64one, const U64 * pu64two);
-+    void            u64Subtract(const struct counter64 *pu64one, const struct counter64 *pu64two,
-+                                struct counter64 *pu64out);
-+    void            u64Incr(struct counter64 *pu64out, const struct counter64 *pu64one);
-+    void            u64UpdateCounter(struct counter64 *pu64out, const struct counter64 *pu64one,
-+                                     const struct counter64 *pu64two);
-+    void            u64Copy(struct counter64 *pu64one, const struct counter64 *pu64two);
- 
--    int             netsnmp_c64_check_for_32bit_wrap(U64 *old_val, U64 *new_val,
-+    int             netsnmp_c64_check_for_32bit_wrap(struct counter64 *old_val, struct counter64 *new_val,
-                                                      int adjust);
-     NETSNMP_IMPORT
-     int             netsnmp_c64_check32_and_update(struct counter64 *prev_val,
-Index: net-snmp-5.7.3/snmplib/int64.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/int64.c
-+++ net-snmp-5.7.3/snmplib/int64.c
-@@ -33,7 +33,7 @@
-  * @param[out] puR   Remainder.
-  */
- void
--divBy10(U64 u64, U64 * pu64Q, unsigned int *puR)
-+divBy10(struct counter64 u64, struct counter64 *pu64Q, unsigned int *puR)
- {
-     unsigned long   ulT;
-     unsigned long   ulQ;
-@@ -83,7 +83,7 @@ divBy10(U64 u64, U64 * pu64Q, unsigned i
-  * @param[out] pu64P Product.
-  */
- void
--multBy10(U64 u64, U64 * pu64P)
-+multBy10(struct counter64 u64, struct counter64 *pu64P)
- {
-     unsigned long   ulT;
-     unsigned long   ulP;
-@@ -130,7 +130,7 @@ multBy10(U64 u64, U64 * pu64P)
-  *
-  */
- void
--incrByU16(U64 * pu64, unsigned int u16)
-+incrByU16(struct counter64 *pu64, unsigned int u16)
- {
-     incrByU32(pu64, u16);
- }
-@@ -143,7 +143,7 @@ incrByU16(U64 * pu64, unsigned int u16)
-  *
-  */
- void
--incrByU32(U64 * pu64, unsigned int u32)
-+incrByU32(struct counter64 *pu64, unsigned int u32)
- {
-     uint32_t tmp;
- 
-@@ -161,7 +161,7 @@ incrByU32(U64 * pu64, unsigned int u32)
-  * @param[out] pu64out pu64one - pu64two.
-  */
- void
--u64Subtract(const U64 * pu64one, const U64 * pu64two, U64 * pu64out)
-+u64Subtract(const struct counter64 *pu64one, const struct counter64 *pu64two, struct counter64 *pu64out)
- {
-     int carry;
- 
-@@ -177,7 +177,7 @@ u64Subtract(const U64 * pu64one, const U
-  * @param[in,out] pu64out pu64out += pu64one.
-  */
- void
--u64Incr(U64 * pu64out, const U64 * pu64one)
-+u64Incr(struct counter64 *pu64out, const struct counter64 *pu64one)
- {
-     pu64out->high = (uint32_t)(pu64out->high + pu64one->high);
-     incrByU32(pu64out, pu64one->low);
-@@ -191,9 +191,9 @@ u64Incr(U64 * pu64out, const U64 * pu64o
-  * @param[out] pu64out pu64out += (pu64one - pu64two)
-  */
- void
--u64UpdateCounter(U64 * pu64out, const U64 * pu64one, const U64 * pu64two)
-+u64UpdateCounter(struct counter64 *pu64out, const struct counter64 *pu64one, const struct counter64 *pu64two)
- {
--    U64 tmp;
-+    struct counter64 tmp;
- 
-     u64Subtract(pu64one, pu64two, &tmp);
-     u64Incr(pu64out, &tmp);
-@@ -208,7 +208,7 @@ netsnmp_feature_child_of(u64copy, netsnm
-  * @param[out] pu64one Where to store the copy - *pu64one = *pu64two.
-  */
- void
--u64Copy(U64 * pu64one, const U64 * pu64two)
-+u64Copy(struct counter64 *pu64one, const struct counter64 *pu64two)
- {
-     *pu64one = *pu64two;
- }
-@@ -220,7 +220,7 @@ u64Copy(U64 * pu64one, const U64 * pu64t
-  * @param[in] pu64 Number to be zeroed.
-  */
- void
--zeroU64(U64 * pu64)
-+zeroU64(struct counter64 *pu64)
- {
-     pu64->low = 0;
-     pu64->high = 0;
-@@ -232,7 +232,7 @@ zeroU64(U64 * pu64)
-  * @param[in] pu64 Number to be checked.
-  */
- int
--isZeroU64(const U64 * pu64)
-+isZeroU64(const struct counter64 *pu64)
- {
-     return pu64->low == 0 && pu64->high == 0;
- }
-@@ -390,10 +390,10 @@ netsnmp_c64_check32_and_update(struct co
- /** Convert an unsigned 64-bit number to ASCII. */
- void
- printU64(char *buf, /* char [I64CHARSZ+1]; */
--         const U64 * pu64)
-+         const struct counter64 *pu64)
- {
--    U64             u64a;
--    U64             u64b;
-+    struct counter64 u64a;
-+    struct counter64 u64b;
- 
-     char            aRes[I64CHARSZ + 1];
-     unsigned int    u;
-@@ -414,9 +414,9 @@ printU64(char *buf, /* char [I64CHARSZ+1
- /** Convert a signed 64-bit number to ASCII. */
- void
- printI64(char *buf, /* char [I64CHARSZ+1]; */
--         const U64 * pu64)
-+         const struct counter64 *pu64)
- {
--    U64             u64a;
-+    struct counter64 u64a;
- 
-     if (pu64->high & 0x80000000) {
-         u64a.high = (uint32_t) ~pu64->high;
-@@ -429,11 +429,11 @@ printI64(char *buf, /* char [I64CHARSZ+1
-     }
- }
- 
--/** Convert a signed 64-bit integer from ASCII to U64. */
-+/** Convert a signed 64-bit integer from ASCII to struct counter64. */
- int
--read64(U64 * i64, const char *str)
-+read64(struct counter64 *i64, const char *str)
- {
--    U64             i64p;
-+    struct counter64 i64p;
-     unsigned int    u;
-     int             sign = 0;
-     int             ok = 0;
-Index: net-snmp-5.7.3/snmplib/read_config.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/read_config.c
-+++ net-snmp-5.7.3/snmplib/read_config.c
-@@ -2270,10 +2270,10 @@ read_config_read_memory(int type, char *
-         return readfrom;
- 
-     case ASN_COUNTER64:
--        if (*len < sizeof(U64))
-+        if (*len < sizeof(struct counter64))
-             return NULL;
--        *len = sizeof(U64);
--        read64((U64 *) dataptr, readfrom);
-+        *len = sizeof(struct counter64);
-+        read64((struct counter64 *) dataptr, readfrom);
-         readfrom = skip_token(readfrom);
-         return readfrom;
-     }
-Index: net-snmp-5.7.3/testing/fulltests/unit-tests/T015int64_clib.c
-===================================================================
---- net-snmp-5.7.3.orig/testing/fulltests/unit-tests/T015int64_clib.c
-+++ net-snmp-5.7.3/testing/fulltests/unit-tests/T015int64_clib.c
-@@ -1,4 +1,4 @@
--/* HEADER Testing 64-bit integer operations (U64). */
-+/* HEADER Testing 64-bit integer operations (struct counter64). */
- 
- int i, j;
- char buf[22];
-@@ -15,7 +15,7 @@ static const int64_t intval[] = {
- };
- 
- for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
--    U64 a, b;
-+    struct counter64 a, b;
-     a.low = (uint32_t)intval[i];
-     a.high = (uint32_t)(intval[i] >> 32);
-     printI64(buf, &a);
-@@ -27,7 +27,7 @@ for (i = 0; i < sizeof(intval)/sizeof(in
- 
- for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
-     for (j = i; j < sizeof(intval)/sizeof(intval[0]); ++j) {
--        U64 a, b;
-+        struct counter64 a, b;
-         uint64_t d;
-         a.low = (uint32_t)intval[i];
-         a.high = (uint32_t)(intval[i] >> 32);
-@@ -43,7 +43,7 @@ for (i = 0; i < sizeof(intval)/sizeof(in
-         
- for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
-     for (j = i; j < sizeof(intval)/sizeof(intval[0]); ++j) {
--        U64 a, b, c;
-+        struct counter64 a, b, c;
-         uint64_t d;
-         a.low = (uint32_t)intval[i];
-         a.high = (uint32_t)(intval[i] >> 32);
-@@ -58,7 +58,7 @@ for (i = 0; i < sizeof(intval)/sizeof(in
- }
-         
- {
--    U64 old_val, new_val;
-+    struct counter64 old_val, new_val;
-     old_val.low = 7;
-     old_val.high = 0;
-     new_val = old_val;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
index 44359be..bfc55a0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -1,4 +1,4 @@
-From 261a22096c79f8e6ef7b387514a74d208e4e5945 Mon Sep 17 00:00:00 2001
+From 7ae2ce8dbf1c54d4e2db4a5f49397a239baadc49 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 21 Aug 2015 18:23:13 +0900
 Subject: [PATCH] config_os_headers: Error Fix
@@ -13,15 +13,16 @@ conftest.c:168:17: fatal error: pkg.h: No such file or directory
 Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
 ---
  configure.d/config_os_headers | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: net-snmp-5.7.3/configure.d/config_os_headers
-===================================================================
---- net-snmp-5.7.3.orig/configure.d/config_os_headers
-+++ net-snmp-5.7.3/configure.d/config_os_headers
-@@ -484,8 +484,8 @@ then
+diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
+index af99746..83b2e31 100644
+--- a/configure.d/config_os_headers
++++ b/configure.d/config_os_headers
+@@ -489,8 +489,8 @@ then
      unset ac_cv_header_pkg_h
      netsnmp_save_CPPFLAGS="$CPPFLAGS"
      netsnmp_save_LDFLAGS="$LDFLAGS"
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch
deleted file mode 100644
index 5866a95..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e24fcd140f3f6dd18fd836b197c6d4bb773e50e7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
-Date: Wed, 4 Nov 2015 16:49:30 +0100
-Subject: [PATCH] config_os_libs2: Error Fix
-
-ERROR: This autoconf log indicates errors, it looked at host include
-and/or library paths while determining system capabilities.
----
- configure.d/config_os_libs2 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 47491e2..e3647f9 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -226,10 +226,10 @@ if test "x$with_nl" != "xno"; then
-     case $target_os in
-     linux*) # Check for libnl (linux)
-         netsnmp_save_CPPFLAGS="$CPPFLAGS"
--        CPPFLAGS="-I/usr/include/libnl3 $CPPFLAGS"
-+        CPPFLAGS="$CPPFLAGS"
-         NETSNMP_SEARCH_LIBS(nl_connect, nl-3,
-             [AC_CHECK_HEADERS(netlink/netlink.h)
--            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES -I/usr/include/libnl3"],
-+            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES"],
-             [CPPFLAGS="$netsnmp_save_CPPFLAGS"], [], [], [LMIBLIBS])
-         if test "x$ac_cv_header_netlink_netlink_h" != xyes; then
-             NETSNMP_SEARCH_LIBS(nl_connect, nl, [
--- 
-2.5.0
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
deleted file mode 100644
index b87e9ee..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c6304a3e4b8441ff0a6464c0f1f6c5229092fa32 Mon Sep 17 00:00:00 2001
-From: Niels Baggesen <nba@users.sourceforge.net>
-Date: Wed, 24 May 2017 16:40:03 +0800
-Subject: [PATCH 1/4] configure: fix check for --enable-perl-cc-checks
-
-This patch comes from git://git.code.sf.net/p/net-snmp/code,
-the commit is 8f431d410b803603dc809d82e0893509615d9a11.
-
-Upstream-Status: Backport
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- configure.d/config_project_perl_python | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.d/config_project_perl_python b/configure.d/config_project_perl_python
-index 23f8c7e..475c843 100644
---- a/configure.d/config_project_perl_python
-+++ b/configure.d/config_project_perl_python
-@@ -84,7 +84,7 @@ if test "x$install_perl" != "xno" ; then
- 
-     #       What compiler was used to build the perl binary?
-     #
--    if test "xenable_perl_cc_checks" != "xno" ; then
-+    if test "x$enable_perl_cc_checks" != "xno" ; then
-         AC_MSG_CHECKING([for Perl cc])
-         changequote(, )
-         PERLCC=`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'`
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
index 60ce809..bf133b3 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
@@ -1,22 +1,23 @@
-From 7136d593ba96b64537069637c328bc65e1b66b2d Mon Sep 17 00:00:00 2001
+From 98c6edba4835b515d933542411d80879327eee16 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 22 Jul 2016 18:34:39 +0000
 Subject: [PATCH] get_pid_from_inode: Include limit.h
 
 PATH_MAX and NAME_MAX are required by this file
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
  agent/mibgroup/util_funcs/get_pid_from_inode.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c b/agent/mibgroup/util_funcs/get_pid_from_inode.c
-index 8e157ae..a494ec7 100644
+index aee907d..7abaec2 100644
 --- a/agent/mibgroup/util_funcs/get_pid_from_inode.c
 +++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c
-@@ -5,6 +5,7 @@
+@@ -6,6 +6,7 @@
  #include <net-snmp/output_api.h>
  
  #include <ctype.h>
@@ -24,6 +25,3 @@ index 8e157ae..a494ec7 100644
  #include <stdio.h>
  #if HAVE_STDLIB_H
  #include <stdlib.h>
--- 
-1.8.3.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
deleted file mode 100644
index 527aa39..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 1ee72102fbe722d232d74abc4660a8b134cec8d6 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sat, 23 May 2015 07:32:53 +0200
-Subject: [PATCH] snmplib, UDPIPv6 transport: Add a missing return statement
-
-Detected by Coverity.
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- snmplib/transports/snmpUDPIPv6Domain.c | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/transports/snmpUDPIPv6Domain.c
-+++ net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
-@@ -305,6 +305,7 @@ netsnmp_udp6_transport(struct sockaddr_i
-                                  errno, strerror(errno)));
-                 netsnmp_socketbase_close(t);
-                 netsnmp_transport_free(t);
-+                return NULL;
-             }
-         }
-         /*
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
index af242fa..778b401 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
@@ -1,7 +1,8 @@
-From d3027a227bc0f603a5b650d01f97ee1dec515be5 Mon Sep 17 00:00:00 2001
+From 89538a973119f1bf976b3a6df157ea940cf32eb5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 18 Sep 2015 00:28:45 -0400
 Subject: [PATCH] snmplib/keytools.c: Don't check for return from
+
  EVP_MD_CTX_init()
 
 EVP_MD_CTX_init() API returns void, it fixes errors with new compilers
@@ -9,16 +10,16 @@ EVP_MD_CTX_init() API returns void, it fixes errors with new compilers
 snmplib/keytools.c: In function 'generate_Ku': error: invalid use of void expression
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
-Upstream-Status: Submitted [https://sourceforge.net/p/net-snmp/patches/1317/]
  snmplib/keytools.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/snmplib/keytools.c b/snmplib/keytools.c
-index 0ccb3a6..880fc14 100644
+index 2cf0240..50fd3ea 100644
 --- a/snmplib/keytools.c
 +++ b/snmplib/keytools.c
-@@ -153,8 +153,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
+@@ -186,8 +186,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
      ctx = EVP_MD_CTX_create();
  #else
      ctx = malloc(sizeof(*ctx));
@@ -26,8 +27,5 @@ index 0ccb3a6..880fc14 100644
 -        return SNMPERR_GENERR;
 +    EVP_MD_CTX_init(ctx);
  #endif
- #ifndef NETSNMP_DISABLE_MD5
-     if (ISTRANSFORM(hashtype, HMACMD5Auth)) {
--- 
-2.5.2
-
+     if (!EVP_DigestInit(ctx, hashfn))
+         return SNMPERR_GENERR;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
index 999976d..4782714 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
@@ -1,4 +1,4 @@
-From 94e7e4969bc84c945dfea12d67a1e10f61973948 Mon Sep 17 00:00:00 2001
+From a3631df3d6743113e1cd63579925e15bcce85868 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Wed, 24 May 2017 16:45:34 +0800
 Subject: [PATCH 2/4] configure: fix a cc check issue.
@@ -8,6 +8,7 @@ $myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'
 can't get corretly the cc's value.
 
 Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+
 ---
  configure.d/config_project_perl_python | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -25,6 +26,3 @@ index 475c843..22d2ad3 100644
          changequote([, ])
          if test "x$PERLCC" != "x" ; then
              AC_MSG_RESULT([$PERLCC])
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
deleted file mode 100644
index 7951234..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From e57fc809ad6ae522670f3dc157aadde20d968ca7 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Wed, 24 May 2017 17:05:03 +0800
-Subject: [PATCH 3/4] CHANGES: BUG: 2712: Fix Perl module compilation
-
-Avoid that building the Net-SNMP Perl modules fails as follows:
-
-ERROR from evaluation of /sources/net-snmp-5.7.3/perl/ASN/Makefile.PL: Bizarre \ copy of HASH in list assignment at /usr/lib/perl5/site_perl/5.24.0/Carp.pm line\ 229.
-
-See also https://sourceforge.net/p/net-snmp/bugs/2712/.
-
-This patch comes from git://git.code.sf.net/p/net-snmp/code,
-the commit is 4e793461e96a2b4fd81142ab312d074d5c8841fa.
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- perl/ASN/Makefile.PL                 | 4 +---
- perl/Makefile.PL                     | 4 +---
- perl/OID/Makefile.PL                 | 5 +----
- perl/SNMP/Makefile.PL                | 5 +----
- perl/TrapReceiver/Makefile.PL        | 5 +----
- perl/agent/Makefile.PL               | 5 +----
- perl/agent/Support/Makefile.PL       | 5 +----
- perl/agent/default_store/Makefile.PL | 5 +----
- perl/default_store/Makefile.PL       | 5 +----
- 9 files changed, 9 insertions(+), 34 deletions(-)
-
-diff --git a/perl/ASN/Makefile.PL b/perl/ASN/Makefile.PL
-index 4576781..c33d8ba 100644
---- a/perl/ASN/Makefile.PL
-+++ b/perl/ASN/Makefile.PL
-@@ -7,9 +7,7 @@ my $lib_version;
- # See lib/ExtUtils/MakeMaker.pm for details of how to influence
- # the contents of the Makefile that is written.
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/Makefile.PL b/perl/Makefile.PL
-index 31fdc40..48aba2a 100644
---- a/perl/Makefile.PL
-+++ b/perl/Makefile.PL
-@@ -3,9 +3,7 @@ use Config;
- use Getopt::Long;
- require 5;
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- sub InitMakeParams {
-     $nsconfig="net-snmp-config"; # in path by default
-diff --git a/perl/OID/Makefile.PL b/perl/OID/Makefile.PL
-index 6bb1616..2589985 100644
---- a/perl/OID/Makefile.PL
-+++ b/perl/OID/Makefile.PL
-@@ -6,11 +6,8 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/SNMP/Makefile.PL b/perl/SNMP/Makefile.PL
-index e617cb7..8aab9a9 100644
---- a/perl/SNMP/Makefile.PL
-+++ b/perl/SNMP/Makefile.PL
-@@ -3,15 +3,12 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- my $opts;
- 
- # See lib/ExtUtils/MakeMaker.pm for details of how to influence
- # the contents of the Makefile that is written.
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/TrapReceiver/Makefile.PL b/perl/TrapReceiver/Makefile.PL
-index 874ee21..7e9e58e 100644
---- a/perl/TrapReceiver/Makefile.PL
-+++ b/perl/TrapReceiver/Makefile.PL
-@@ -3,11 +3,8 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/agent/Makefile.PL b/perl/agent/Makefile.PL
-index 4f7bee3..003c0d1 100644
---- a/perl/agent/Makefile.PL
-+++ b/perl/agent/Makefile.PL
-@@ -3,11 +3,8 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/agent/Support/Makefile.PL b/perl/agent/Support/Makefile.PL
-index 48815b6..2325e10 100644
---- a/perl/agent/Support/Makefile.PL
-+++ b/perl/agent/Support/Makefile.PL
-@@ -3,14 +3,11 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- 
- # See lib/ExtUtils/MakeMaker.pm for details of how to influence
- # the contents of the Makefile that is written.
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/agent/default_store/Makefile.PL b/perl/agent/default_store/Makefile.PL
-index ed6483a..31cfbee 100644
---- a/perl/agent/default_store/Makefile.PL
-+++ b/perl/agent/default_store/Makefile.PL
-@@ -3,11 +3,8 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- Check_Version();
- 
-diff --git a/perl/default_store/Makefile.PL b/perl/default_store/Makefile.PL
-index 7c671b8..01c8dd0 100644
---- a/perl/default_store/Makefile.PL
-+++ b/perl/default_store/Makefile.PL
-@@ -3,11 +3,8 @@ require 5;
- use Config;
- use Getopt::Long;
- my $lib_version;
--my %MakeParams = ();
- 
--%MakeParams = InitMakeParams();
--
--WriteMakefile(%MakeParams);
-+WriteMakefile(InitMakeParams());
- 
- 
- sub InitMakeParams {
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
index 2b03f9e..a3d84b2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
@@ -1,4 +1,4 @@
-From 4ad98ef125eb4e7d7a1a93146042002f78254d36 Mon Sep 17 00:00:00 2001
+From f3c5cd4df7ce8e5639c99b7b918e41fb89e969e3 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Wed, 24 May 2017 17:10:20 +0800
 Subject: [PATCH 4/4] configure: fix incorrect variable
@@ -8,15 +8,16 @@ For cross compile platform, this variable will not be correct, so fix it.
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+
 ---
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index cfcdf73..164df05 100644
+index 9dbdde1..5fdc760 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -171,7 +171,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
+@@ -173,7 +173,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
  #
  # override LD_RUN_PATH to avoid dependencies on the build directory
  perlmodules: perlmakefiles subdirs
@@ -25,6 +26,3 @@ index cfcdf73..164df05 100644
          if test $$? != 0 ; then \
             exit 1 ; \
          fi
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch
deleted file mode 100644
index 6bd0f93..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 6b93e686bdb6a908d00595608646a05527a5326b Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Fri, 21 Aug 2015 12:39:12 +0900
-Subject: [PATCH] the snmp_pdu_parse() function could leave incompletely parsed
- varBind variables in the list of variables in case the parsing of the SNMP
- PDU failed. If later processing tries to operate on the stale and
- incompletely processed varBind (e.g. when printing the variables), this can
- lead to e.g. crashes or, possibly, execution of arbitrary code
-
-Upstream-Status: Backport [net-snmp]
-
-Written-by: Robert Story
----
- snmplib/snmp_api.c | 53 ++++++++++++++++++++++++++++-------------------------
- 1 file changed, 28 insertions(+), 25 deletions(-)
-
-diff --git a/snmplib/snmp_api.c b/snmplib/snmp_api.c
-index 191debf..15a2d39 100644
---- a/snmplib/snmp_api.c
-+++ b/snmplib/snmp_api.c
-@@ -4350,10 +4350,9 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
-     u_char          type;
-     u_char          msg_type;
-     u_char         *var_val;
--    int             badtype = 0;
-     size_t          len;
-     size_t          four;
--    netsnmp_variable_list *vp = NULL;
-+    netsnmp_variable_list *vp = NULL, *vplast = NULL;
-     oid             objid[MAX_OID_LEN];
-     u_char         *p;
- 
-@@ -4493,31 +4492,17 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
-                               (ASN_SEQUENCE | ASN_CONSTRUCTOR),
-                               "varbinds");
-     if (data == NULL)
--        return -1;
-+        goto fail;
- 
-     /*
-      * get each varBind sequence 
-      */
-     while ((int) *length > 0) {
--        netsnmp_variable_list *vptemp;
--        vptemp = (netsnmp_variable_list *) malloc(sizeof(*vptemp));
--        if (NULL == vptemp) {
--            return -1;
--        }
--        if (NULL == vp) {
--            pdu->variables = vptemp;
--        } else {
--            vp->next_variable = vptemp;
--        }
--        vp = vptemp;
-+        vp = SNMP_MALLOC_TYPEDEF(netsnmp_variable_list);
-+        if (NULL == vp)
-+            goto fail;
- 
--        vp->next_variable = NULL;
--        vp->val.string = NULL;
-         vp->name_length = MAX_OID_LEN;
--        vp->name = NULL;
--        vp->index = 0;
--        vp->data = NULL;
--        vp->dataFreeHook = NULL;
-         DEBUGDUMPSECTION("recv", "VarBind");
-         data = snmp_parse_var_op(data, objid, &vp->name_length, &vp->type,
-                                  &vp->val_len, &var_val, length);
-@@ -4604,7 +4589,7 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
-                 vp->val.string = (u_char *) malloc(vp->val_len);
-             }
-             if (vp->val.string == NULL) {
--                return -1;
-+                goto fail;
-             }
-             p = asn_parse_string(var_val, &len, &vp->type, vp->val.string,
-                              &vp->val_len);
-@@ -4619,7 +4604,7 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
-             vp->val_len *= sizeof(oid);
-             vp->val.objid = (oid *) malloc(vp->val_len);
-             if (vp->val.objid == NULL) {
--                return -1;
-+                goto fail;
-             }
-             memmove(vp->val.objid, objid, vp->val_len);
-             break;
-@@ -4631,7 +4616,7 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
-         case ASN_BIT_STR:
-             vp->val.bitstring = (u_char *) malloc(vp->val_len);
-             if (vp->val.bitstring == NULL) {
--                return -1;
-+                goto fail;
-             }
-             p = asn_parse_bitstring(var_val, &len, &vp->type,
-                                 vp->val.bitstring, &vp->val_len);
-@@ -4640,12 +4625,30 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
-             break;
-         default:
-             snmp_log(LOG_ERR, "bad type returned (%x)\n", vp->type);
--            badtype = -1;
-+            goto fail;
-             break;
-         }
-         DEBUGINDENTADD(-4);
-+
-+        if (NULL == vplast) {
-+            pdu->variables = vp;
-+        } else {
-+            vplast->next_variable = vp;
-+        }
-+        vplast = vp;
-+        vp = NULL;
-+
-     }
--    return badtype;
-+    return 0;
-+
-+  fail:
-+    DEBUGMSGTL(("recv", "error while parsing VarBindList\n"));
-+    /** if we were parsing a var, remove it from the pdu and free it */
-+    if (vp)
-+        snmp_free_var(vp);
-+
-+    return -1;
-+
- }
- 
- /*
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
index d29be33..fc3ac2a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
@@ -1,3 +1,8 @@
+From 0becb4843a40910d5ec9aa11969d4905a22037cf Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Fri, 16 Jan 2015 14:14:01 +0800
+Subject: [PATCH] net-snmp: fix "libtool --finish"
+
 LIB_LDCONFIG_CMD failed since it is using a host dir $(libdir)
 which is /usr/lib64 does not exist on host when compile 64bit
 image.
@@ -9,12 +14,16 @@ rpm-postinst for each recipe while do_package, in package.bbclass.
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
 ---
-Index: net-snmp-5.7.3/Makefile.top
-===================================================================
---- net-snmp-5.7.3.orig/Makefile.top
-+++ net-snmp-5.7.3/Makefile.top
-@@ -87,7 +87,7 @@ LIBREVISION = 3
+ Makefile.top | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.top b/Makefile.top
+index 5d4f9bc..d0ed31c 100644
+--- a/Makefile.top
++++ b/Makefile.top
+@@ -89,7 +89,7 @@ LIBREVISION = 0
  LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) -o
  LIB_EXTENSION   = la
  LIB_VERSION     =
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
deleted file mode 100644
index 5c6436c..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-net-snmp build fails on Debian 9 with OpenSSL 1.1.0
-
-With these changes, net-snmp builds with both
-OpenSSL 1.0.x and 1.1.x.
-
-Author: Sharmila Podury <sharmila.podury@brocade.com>
-
-Index: net-snmp-5.7.3/apps/snmpusm.c
-===================================================================
---- net-snmp-5.7.3.orig/apps/snmpusm.c
-+++ net-snmp-5.7.3/apps/snmpusm.c
-@@ -125,6 +125,32 @@ char           *usmUserPublic_val = NULL
- int             docreateandwait = 0;
- 
- 
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+
-+#include <string.h>
-+#include <openssl/engine.h>
-+
-+void DH_get0_pqg(const DH *dh,
-+                const BIGNUM **p, const BIGNUM **q, const BIGNUM **g)
-+{
-+   if (p != NULL)
-+       *p = dh->p;
-+   if (q != NULL)
-+       *q = dh->q;
-+   if (g != NULL)
-+       *g = dh->g;
-+}
-+
-+void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv_key)
-+{
-+   if (pub_key != NULL)
-+       *pub_key = dh->pub_key;
-+   if (priv_key != NULL)
-+       *priv_key = dh->priv_key;
-+}
-+
-+#endif
-+
- void
- usage(void)
- {
-@@ -190,7 +216,7 @@ get_USM_DH_key(netsnmp_variable_list *va
-                oid *keyoid, size_t keyoid_len) {
-     u_char *dhkeychange;
-     DH *dh;
--    BIGNUM *other_pub;
-+    BIGNUM *p, *g, *pub_key, *other_pub;
-     u_char *key;
-     size_t key_len;
-             
-@@ -205,25 +231,29 @@ get_USM_DH_key(netsnmp_variable_list *va
-         dh = d2i_DHparams(NULL, &cp, dhvar->val_len);
-     }
- 
--    if (!dh || !dh->g || !dh->p) {
-+    if (dh)
-+        DH_get0_pqg(dh, &p, NULL, &g);
-+
-+    if (!dh || !g || !p) {
-         SNMP_FREE(dhkeychange);
-         return SNMPERR_GENERR;
-     }
- 
--    DH_generate_key(dh);
--    if (!dh->pub_key) {
-+    if (!DH_generate_key(dh)) {
-         SNMP_FREE(dhkeychange);
-         return SNMPERR_GENERR;
-     }
-             
--    if (vars->val_len != (unsigned int)BN_num_bytes(dh->pub_key)) {
-+    DH_get0_key(dh, &pub_key, NULL);
-+
-+    if (vars->val_len != (unsigned int)BN_num_bytes(pub_key)) {
-         SNMP_FREE(dhkeychange);
-         fprintf(stderr,"incorrect diffie-helman lengths (%lu != %d)\n",
--                (unsigned long)vars->val_len, BN_num_bytes(dh->pub_key));
-+                (unsigned long)vars->val_len, BN_num_bytes(pub_key));
-         return SNMPERR_GENERR;
-     }
- 
--    BN_bn2bin(dh->pub_key, dhkeychange + vars->val_len);
-+    BN_bn2bin(pub_key, dhkeychange + vars->val_len);
- 
-     key_len = DH_size(dh);
-     if (!key_len) {
-Index: net-snmp-5.7.3/configure.d/config_os_libs2
-===================================================================
---- net-snmp-5.7.3.orig/configure.d/config_os_libs2
-+++ net-snmp-5.7.3/configure.d/config_os_libs2
-@@ -293,10 +293,16 @@ if test "x$tryopenssl" != "xno" -a "x$tr
-                     [Define to 1 if you have the `AES_cfb128_encrypt' function.]))
- 
-             AC_CHECK_LIB(${CRYPTO}, EVP_MD_CTX_create,
--                AC_DEFINE([HAVE_EVP_MD_CTX_CREATE], [],
-+                AC_DEFINE([HAVE_EVP_MD_CTX_CREATE], [1],
-                     [Define to 1 if you have the `EVP_MD_CTX_create' function.])
--                AC_DEFINE([HAVE_EVP_MD_CTX_DESTROY], [],
-+                AC_DEFINE([HAVE_EVP_MD_CTX_DESTROY], [1],
-                     [Define to 1 if you have the `EVP_MD_CTX_destroy' function.]))
-+
-+            AC_CHECK_LIB(${CRYPTO}, EVP_MD_CTX_new,
-+                AC_DEFINE([HAVE_EVP_MD_CTX_NEW], [1],
-+                    [Define to 1 if you have the `EVP_MD_CTX_new' function.])
-+                AC_DEFINE([HAVE_EVP_MD_CTX_FREE], [1],
-+                    [Define to 1 if you have the `EVP_MD_CTX_free' function.]))
-         fi
-         if echo " $transport_result_list " | $GREP "DTLS" > /dev/null; then
- 	    AC_CHECK_LIB(ssl, DTLSv1_method,
-Index: net-snmp-5.7.3/include/net-snmp/net-snmp-config.h.in
-===================================================================
---- net-snmp-5.7.3.orig/include/net-snmp/net-snmp-config.h.in
-+++ net-snmp-5.7.3/include/net-snmp/net-snmp-config.h.in
-@@ -155,6 +155,12 @@
- /* Define to 1 if you have the `EVP_MD_CTX_destroy' function. */
- #undef HAVE_EVP_MD_CTX_DESTROY
- 
-+/* Define to 1 if you have the `EVP_MD_CTX_free' function. */
-+#undef HAVE_EVP_MD_CTX_FREE
-+
-+/* Define to 1 if you have the `EVP_MD_CTX_new' function. */
-+#undef HAVE_EVP_MD_CTX_NEW
-+
- /* Define if you have EVP_sha224/256 in openssl */
- #undef HAVE_EVP_SHA224
- 
-Index: net-snmp-5.7.3/snmplib/keytools.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/keytools.c
-+++ net-snmp-5.7.3/snmplib/keytools.c
-@@ -149,7 +149,9 @@ generate_Ku(const oid * hashtype, u_int
-      */
- #ifdef NETSNMP_USE_OPENSSL
- 
--#ifdef HAVE_EVP_MD_CTX_CREATE
-+#ifdef HAVE_EVP_MD_CTX_NEW
-+    ctx = EVP_MD_CTX_new();
-+#elif HAVE_EVP_MD_CTX_CREATE
-     ctx = EVP_MD_CTX_create();
- #else
-     ctx = malloc(sizeof(*ctx));
-@@ -258,7 +260,9 @@ generate_Ku(const oid * hashtype, u_int
-     memset(buf, 0, sizeof(buf));
- #ifdef NETSNMP_USE_OPENSSL
-     if (ctx) {
--#ifdef HAVE_EVP_MD_CTX_DESTROY
-+#ifdef HAVE_EVP_MD_CTX_FREE
-+        EVP_MD_CTX_free(ctx);
-+#elif HAVE_EVP_MD_CTX_DESTROY
-         EVP_MD_CTX_destroy(ctx);
- #else
-         EVP_MD_CTX_cleanup(ctx);
-Index: net-snmp-5.7.3/snmplib/scapi.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/scapi.c
-+++ net-snmp-5.7.3/snmplib/scapi.c
-@@ -488,7 +488,9 @@ sc_hash(const oid * hashtype, size_t has
-     }
- 
- /** initialize the pointer */
--#ifdef HAVE_EVP_MD_CTX_CREATE
-+#ifdef HAVE_EVP_MD_CTX_NEW
-+    cptr = EVP_MD_CTX_new();
-+#elif HAVE_EVP_MD_CTX_CREATE
-     cptr = EVP_MD_CTX_create();
- #else
-     cptr = malloc(sizeof(*cptr));
-@@ -509,7 +511,9 @@ sc_hash(const oid * hashtype, size_t has
- /** do the final pass */
-     EVP_DigestFinal(cptr, MAC, &tmp_len);
-     *MAC_len = tmp_len;
--#ifdef HAVE_EVP_MD_CTX_DESTROY
-+#ifdef HAVE_EVP_MD_CTX_FREE
-+    EVP_MD_CTX_free(cptr);
-+#elif HAVE_EVP_MD_CTX_DESTROY
-     EVP_MD_CTX_destroy(cptr);
- #else
- #if !defined(OLD_DES)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
index fbd274b..5cbb60d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -1,4 +1,4 @@
-From e47c60dc7f649959f63e56bc62355de4bdfd73f4 Mon Sep 17 00:00:00 2001
+From d619cd9fc01f336ff0ff55b18f9112789eb4d84c Mon Sep 17 00:00:00 2001
 From: Marian Florea <marian.florea@windriver.com>
 Date: Thu, 20 Jul 2017 16:55:24 +0800
 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
@@ -7,16 +7,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Marian Florea <marian.florea@windriver.com>
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
+
 ---
  agent/snmpd.c    | 1 +
  snmplib/snmpv3.c | 4 ++--
  2 files changed, 3 insertions(+), 2 deletions(-)
 
-Index: net-snmp-5.7.3/agent/snmpd.c
-===================================================================
---- net-snmp-5.7.3.orig/agent/snmpd.c
-+++ net-snmp-5.7.3/agent/snmpd.c
-@@ -1253,6 +1253,7 @@ receive(void)
+diff --git a/agent/snmpd.c b/agent/snmpd.c
+index 6566354..eb0d4b4 100644
+--- a/agent/snmpd.c
++++ b/agent/snmpd.c
+@@ -1239,6 +1239,7 @@ receive(void)
  	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
  		     netsnmp_get_version());
              update_config();
@@ -24,11 +25,11 @@ Index: net-snmp-5.7.3/agent/snmpd.c
              send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
  #if HAVE_SIGHOLD
              sigrelse(SIGHUP);
-Index: net-snmp-5.7.3/snmplib/snmpv3.c
-===================================================================
---- net-snmp-5.7.3.orig/snmplib/snmpv3.c
-+++ net-snmp-5.7.3/snmplib/snmpv3.c
-@@ -984,9 +984,9 @@ init_snmpv3_post_config(int majorid, int
+diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
+index 771ba3b..5de05e7 100644
+--- a/snmplib/snmpv3.c
++++ b/snmplib/snmpv3.c
+@@ -1060,9 +1060,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
      /*
       * if our engineID has changed at all, the boots record must be set to 1 
       */
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch
deleted file mode 100644
index 5eed893..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Description: fix snmpd crash via AgentX connection
-
- taken from Fedora, net-snmp-5.7-agentx-crash.patch
-
-bz729738 - net-snmp dumps core in netsnmp_oid_find_prefix
-bz1038011 - net-snmp: snmpd crashes/hangs when AgentX subagent times-out
-
-commit f9304c83f76202db0e684269ca1af32e43cd9db4
-Author: Jan Safranek <jsafranek@users.sourceforge.net>
-Date:   Tue Feb 7 14:53:44 2012 +0100
-
-    CHANGES: PATCH 1633670: fixed snmpd crashing when an AgentX subagent
-    disconnect in the middle of processing of a request.
-
-    I fixed also the memory leak reported in the tracker comments.
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
----
- agent/mibgroup/agentx/master.c       | 5 +++++
- agent/mibgroup/agentx/master_admin.c | 9 +++++++--
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/agent/mibgroup/agentx/master.c b/agent/mibgroup/agentx/master.c
-index c42a42a..baeebaf 100644
---- a/agent/mibgroup/agentx/master.c
-+++ b/agent/mibgroup/agentx/master.c
-@@ -219,6 +219,9 @@ agentx_got_response(int operation,
-     if (!cache) {
-         DEBUGMSGTL(("agentx/master", "response too late on session %8p\n",
-                     session));
-+        /* response is too late, free the cache */
-+        if (magic)
-+            netsnmp_free_delegated_cache((netsnmp_delegated_cache*) magic);
-         return 0;
-     }
-     requests = cache->requests;
-@@ -606,6 +609,8 @@ agentx_master_handler(netsnmp_mib_handler *handler,
-     result = snmp_async_send(ax_session, pdu, agentx_got_response, cb_data);
-     if (result == 0) {
-         snmp_free_pdu(pdu);
-+        if (cb_data)
-+            netsnmp_free_delegated_cache((netsnmp_delegated_cache*) cb_data);
-     }
- 
-     return SNMP_ERR_NOERROR;
-diff --git a/agent/mibgroup/agentx/master_admin.c b/agent/mibgroup/agentx/master_admin.c
-index f16f392..b84b85e 100644
---- a/agent/mibgroup/agentx/master_admin.c
-+++ b/agent/mibgroup/agentx/master_admin.c
-@@ -133,11 +133,16 @@ close_agentx_session(netsnmp_session * session, int sessid)
-          * requests, so that the delegated request will be completed and
-          * further requests can be processed
-          */
--        netsnmp_remove_delegated_requests_for_session(session);
-+	while (netsnmp_remove_delegated_requests_for_session(session)) {
-+		DEBUGMSGTL(("agentx/master", "Continue removing delegated reqests\n"));
-+	}
-+
-         if (session->subsession != NULL) {
-             netsnmp_session *subsession = session->subsession;
-             for(; subsession; subsession = subsession->next) {
--                netsnmp_remove_delegated_requests_for_session(subsession);
-+                while (netsnmp_remove_delegated_requests_for_session(subsession)) {
-+			DEBUGMSGTL(("agentx/master", "Continue removing delegated subsession reqests\n"));
-+		}
-             }
-         }
-                 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
index 25eb9c9..4cd8fd1 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
@@ -1,4 +1,4 @@
-From 270e952f58a7e5ddeabe5a15e3ddaaadf40017d0 Mon Sep 17 00:00:00 2001
+From 068952c0e0cdda5a91250b91c5fcc9b85b43daab Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 22 Jun 2017 10:25:08 +0800
 Subject: [PATCH] net-snmp: fix for --disable-des
@@ -9,15 +9,16 @@ the --disable-des works correctly.
 Upstream-Status: Submitted [net-snmp-coders@lists.sourceforge.net]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  snmplib/scapi.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/snmplib/scapi.c b/snmplib/scapi.c
-index 16ac829..271684b 100644
+index 8ad1d70..43caddf 100644
 --- a/snmplib/scapi.c
 +++ b/snmplib/scapi.c
-@@ -79,7 +79,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support)
+@@ -84,7 +84,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support)
  #include <openssl/hmac.h>
  #include <openssl/evp.h>
  #include <openssl/rand.h>
@@ -27,6 +28,3 @@ index 16ac829..271684b 100644
  #ifdef HAVE_AES
  #include <openssl/aes.h>
  #endif
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
index 8f8336a..7cbaf0b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
@@ -1,4 +1,4 @@
-From 4bb4024b395f19d36ab3569e2773ea80d8cc5261 Mon Sep 17 00:00:00 2001
+From 827fe3b0253aab33472828f40ad05934cc0261b8 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 14 Jan 2015 15:10:06 +0800
 Subject: [PATCH] testing: add the output format for ptest
@@ -6,15 +6,16 @@ Subject: [PATCH] testing: add the output format for ptest
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
- testing/RUNTESTS |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
+ testing/RUNTESTS | 4 ++++
+ 1 file changed, 4 insertions(+)
 
-Index: net-snmp-5.7.3/testing/RUNTESTS
-===================================================================
---- net-snmp-5.7.3.orig/testing/RUNTESTS
-+++ net-snmp-5.7.3/testing/RUNTESTS
-@@ -29,13 +29,17 @@ failed_count=0
+diff --git a/testing/RUNTESTS b/testing/RUNTESTS
+index 6715831..a2b6fb8 100755
+--- a/testing/RUNTESTS
++++ b/testing/RUNTESTS
+@@ -17,13 +17,17 @@ failed_count=0
  rm -f failed_tests
  for i in "${srcdir}"/testing/fulltests/default/T*$1*; do
      echo "RUNNING $i"
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
similarity index 92%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 5c827bb..413f033 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -11,32 +11,22 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://init \
            file://snmpd.conf \
            file://snmptrapd.conf \
-           file://systemd-support.patch \
            file://snmpd.service \
            file://snmptrapd.service \
            file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
            file://fix-libtool-finish.patch \
            file://net-snmp-testing-add-the-output-format-for-ptest.patch \
            file://run-ptest \
-           file://dont-return-incompletely-parsed-varbinds.patch \
            file://0001-config_os_headers-Error-Fix.patch \
-           file://0001-config_os_libs2-Error-Fix.patch \
            file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
-           file://net-snmp-agentx-crash.patch \
            file://0001-get_pid_from_inode-Include-limit.h.patch \
-           file://0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch \
-           file://0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch \
-           file://0001-configure-fix-check-for-enable-perl-cc-checks.patch \
            file://0002-configure-fix-a-cc-check-issue.patch \
-           file://0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
-           file://0001-Remove-U64-typedef.patch \
-           file://fix-openssl-build-errors.patch \
            "
-SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
-SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
+SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
+SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.7.4


