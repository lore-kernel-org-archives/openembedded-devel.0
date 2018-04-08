Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCE37558F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:25 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id x4-v6so3202453pln.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7ZzmyNt+nOSgggYkbLRtPACAQIPOWgGBw+I4DV/FcDY=;
	b=X2FVhBv+4lPgmJXbD/I1waaz7nrlksDWVDriLxHQGLPDrQVD0L8u2oYM6DIZmHeY8K
	WXpLzFCV9/FAqc/pXjZ3UPT7XcA9IHwl60Jgf49gjhmeede1LTF11Q8/2y2l4pKBcJrQ
	Fzb4P35PQfvDj6UgrmDYJ7jitRZZs4M8zpEjfJ+XgtheMQP4/bUycBpka3DJbvTilrHB
	Eka+DZKc0OZGYJKYrZ7gRCo6qrCe2+r3MYg16caYpTELY2YJqvK0Pejsg7drA01axeRA
	c0LQZT2aHgtHyKtCzvaGuMcO0o4o2ceTqKEyY2jv16BqXaTCceRXcLU35uTlpDbNRT5H
	Hs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7ZzmyNt+nOSgggYkbLRtPACAQIPOWgGBw+I4DV/FcDY=;
	b=sKy16m04QrnPFAs+RZfEqmW0BoDrPwd3rCx9YOZVRKi5dOPoUTxNEFDZ48T7g/4y6C
	MnuUrnZXVuGvCZVFJyME4thKab+MzkP1hxtc35bHyM4yFRaYcoajtVnviHyCyfirKuNG
	oIYSEqaW4nr2sKqUnV8l+aFaRvYeDZcqF0gIs0Dm7n6fzH/XzQGOdC1jssx4O7KYKtWs
	e4zwGMvm/89yA8EcP+iRJUgy2bw0HsEcfLIBR1wsIkThzQkwWDoaRJI9IPvG/b+fsOUn
	l2LFxCT1nlIJk7bwR/PpTxVi9yeApFmrAeH0YEhyiPGhgJh/d+va0zk33xhuHbFc1+JY
	Cihw==
X-Gm-Message-State: AElRT7F14OHOLi5oVOHf2E8fkiNdboabeULbl3nBvFaujiiGcMWwQHbL
	LtGXBeoweDwjpDviy7kIpEE=
X-Google-Smtp-Source: AIpwx4+QX7kelNVzXSWR+J+ieKZqC0qQILgaaUTp61Nh2aNmc/acs73WOV1/weYHY5YNc76Bmz5gzg==
X-Received: by 2002:a17:902:684d:: with SMTP id
	f13-v6mr33190053pln.230.1523170766073; 
	Sat, 07 Apr 2018 23:59:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:46 -0700
Message-Id: <1523170729-26321-34-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 34/37] net-snmp: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:25 -0000

WARNING: net-snmp-5.7.3-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
patching file snmplib/transports/snmpUDPIPv6Domain.c
Hunk #1 succeeded at 286 with fuzz 2 (offset 30 lines).

Now at patch 0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ix-snmptrap-to-use-clientaddr-from-snmp.c.patch |  17 +-
 .../net-snmp/0001-Remove-U64-typedef.patch         | 289 ++++++++++-----------
 .../0001-config_os_headers-Error-Fix.patch         |  13 +-
 ...IPv6-transport-Add-a-missing-return-state.patch |  13 +-
 .../net-snmp/net-snmp/fix-libtool-finish.patch     |  10 +-
 ...nmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch |  23 +-
 ...p-testing-add-the-output-format-for-ptest.patch |  13 +-
 7 files changed, 180 insertions(+), 198 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
index b05eea5..b14b761 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
@@ -11,13 +11,13 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  snmplib/transports/snmpUDPIPv6Domain.c | 21 +++++++++++++++++++++
  1 file changed, 21 insertions(+)
 
-diff --git a/snmplib/transports/snmpUDPIPv6Domain.c b/snmplib/transports/snmpUDPIPv6Domain.c
-index 55e3610..aca69ae 100644
---- a/snmplib/transports/snmpUDPIPv6Domain.c
-+++ b/snmplib/transports/snmpUDPIPv6Domain.c
-@@ -256,6 +256,27 @@ netsnmp_udp6_transport(struct sockaddr_in6 *addr, int local)
-         t->data = NULL;
-         t->data_length = 0;
+Index: net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/transports/snmpUDPIPv6Domain.c
++++ net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
+@@ -286,6 +286,27 @@ netsnmp_udp6_transport(struct sockaddr_i
+         return NULL;
+ #endif /* NETSNMP_NO_LISTEN_SUPPORT */
      } else {
 +        char           *client_socket = NULL;
 +        /*
@@ -43,6 +43,3 @@ index 55e3610..aca69ae 100644
          /*
           * This is a client session.  Save the address in the
           * transport-specific data pointer for later use by netsnmp_udp6_send.
--- 
-2.9.3
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch
index 209a93c..7314ab1 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Remove-U64-typedef.patch
@@ -32,11 +32,11 @@ not modify the Net-SNMP ABI.
  testing/fulltests/unit-tests/T015int64_clib.c      |  10 +-
  15 files changed, 274 insertions(+), 1071 deletions(-)
 
-diff --git a/agent/mibgroup/if-mib/ifXTable/ifXTable.c b/agent/mibgroup/if-mib/ifXTable/ifXTable.c
-index bb3e736..0c952ba 100644
---- a/agent/mibgroup/if-mib/ifXTable/ifXTable.c
-+++ b/agent/mibgroup/if-mib/ifXTable/ifXTable.c
-@@ -722,7 +722,7 @@ The total number of octets received on the interface,
+Index: net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/if-mib/ifXTable/ifXTable.c
++++ net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.c
+@@ -722,7 +722,7 @@ The total number of octets received on t
   */
  int
  ifHCInOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -45,7 +45,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCInOctets_val_ptr);
-@@ -779,7 +779,7 @@ The number of packets, delivered by this sub-layer to a
+@@ -779,7 +779,7 @@ The number of packets, delivered by this
   */
  int
  ifHCInUcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -54,7 +54,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCInUcastPkts_val_ptr);
-@@ -838,7 +838,7 @@ The number of packets, delivered by this sub-layer to a
+@@ -838,7 +838,7 @@ The number of packets, delivered by this
   */
  int
  ifHCInMulticastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -63,7 +63,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCInMulticastPkts_val_ptr);
-@@ -897,7 +897,7 @@ The number of packets, delivered by this sub-layer to a
+@@ -897,7 +897,7 @@ The number of packets, delivered by this
   */
  int
  ifHCInBroadcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -72,7 +72,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCInBroadcastPkts_val_ptr);
-@@ -955,7 +955,7 @@ The total number of octets transmitted out of the
+@@ -955,7 +955,7 @@ The total number of octets transmitted o
   */
  int
  ifHCOutOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -81,7 +81,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCOutOctets_val_ptr);
-@@ -1013,7 +1013,7 @@ The total number of packets that higher-level protocols
+@@ -1013,7 +1013,7 @@ The total number of packets that higher-
   */
  int
  ifHCOutUcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -90,7 +90,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCOutUcastPkts_val_ptr);
-@@ -1074,7 +1074,7 @@ The total number of packets that higher-level protocols
+@@ -1074,7 +1074,7 @@ The total number of packets that higher-
   */
  int
  ifHCOutMulticastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -99,7 +99,7 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCOutMulticastPkts_val_ptr);
-@@ -1134,7 +1134,7 @@ The total number of packets that higher-level protocols
+@@ -1134,7 +1134,7 @@ The total number of packets that higher-
   */
  int
  ifHCOutBroadcastPkts_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -108,11 +108,11 @@ index bb3e736..0c952ba 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ifHCOutBroadcastPkts_val_ptr);
-diff --git a/agent/mibgroup/if-mib/ifXTable/ifXTable.h b/agent/mibgroup/if-mib/ifXTable/ifXTable.h
-index ba22f97..925af13 100644
---- a/agent/mibgroup/if-mib/ifXTable/ifXTable.h
-+++ b/agent/mibgroup/if-mib/ifXTable/ifXTable.h
-@@ -143,28 +143,28 @@ config_require(if-mib/ifXTable/ifXTable_data_access)
+Index: net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.h
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/if-mib/ifXTable/ifXTable.h
++++ net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable.h
+@@ -143,28 +143,28 @@ config_require(if-mib/ifXTable/ifXTable_
                                             u_long *
                                             ifOutBroadcastPkts_val_ptr);
      int             ifHCInOctets_get(ifXTable_rowreq_ctx * rowreq_ctx,
@@ -149,7 +149,7 @@ index ba22f97..925af13 100644
                                               ifHCOutBroadcastPkts_val_ptr);
      int             ifLinkUpDownTrapEnable_get(ifXTable_rowreq_ctx *
                                                 rowreq_ctx,
-@@ -284,86 +284,86 @@ config_require(if-mib/ifXTable/ifXTable_data_access)
+@@ -284,86 +284,86 @@ config_require(if-mib/ifXTable/ifXTable_
  
      int             ifHCInOctets_check_value(ifXTable_rowreq_ctx *
                                               rowreq_ctx,
@@ -252,11 +252,11 @@ index ba22f97..925af13 100644
      int             ifHCOutBroadcastPkts_undo(ifXTable_rowreq_ctx *
                                                rowreq_ctx);
  
-diff --git a/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c b/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
-index 23b50d0..e561842 100644
---- a/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
-+++ b/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
-@@ -729,72 +729,72 @@ _ifXTable_get_column(ifXTable_rowreq_ctx * rowreq_ctx,
+Index: net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
++++ net-snmp-5.7.3/agent/mibgroup/if-mib/ifXTable/ifXTable_interface.c
+@@ -729,72 +729,72 @@ _ifXTable_get_column(ifXTable_rowreq_ctx
           * ifHCInOctets(6)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IFHCINOCTETS:
@@ -345,11 +345,11 @@ index 23b50d0..e561842 100644
          break;
  
          /*
-diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_common.c b/agent/mibgroup/ip-mib/data_access/systemstats_common.c
-index 29109bd..7434b3a 100644
---- a/agent/mibgroup/ip-mib/data_access/systemstats_common.c
-+++ b/agent/mibgroup/ip-mib/data_access/systemstats_common.c
-@@ -264,7 +264,7 @@ _calculate_entries(netsnmp_systemstats_entry * entry)
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/data_access/systemstats_common.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/data_access/systemstats_common.c
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/data_access/systemstats_common.c
+@@ -264,7 +264,7 @@ _calculate_entries(netsnmp_systemstats_e
             && entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCOUTFRAGCREATES]
          && entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCOUTDISCARDS]) {
  
@@ -358,11 +358,11 @@ index 29109bd..7434b3a 100644
          tmp = entry->stats.HCOutRequests;
          u64Incr(&tmp, &entry->stats.HCOutForwDatagrams);
          u64Incr(&tmp, &entry->stats.HCOutFragCreates);
-diff --git a/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c b/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
-index db673dc..fec36b2 100644
---- a/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
-+++ b/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
-@@ -270,7 +270,7 @@ The total number of input IP datagrams received, including
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
+@@ -270,7 +270,7 @@ The total number of input IP datagrams r
   */
  int
  ipIfStatsHCInReceives_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -371,7 +371,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInReceives_val_ptr);
-@@ -395,7 +395,7 @@ The total number of octets received in input IP datagrams,
+@@ -395,7 +395,7 @@ The total number of octets received in i
   */
  int
  ipIfStatsHCInOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -380,7 +380,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInOctets_val_ptr);
-@@ -862,7 +862,7 @@ The number of input datagrams for which this entity was not
+@@ -862,7 +862,7 @@ The number of input datagrams for which
   */
  int
  ipIfStatsHCInForwDatagrams_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -389,7 +389,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInForwDatagrams_val_ptr);
-@@ -1267,7 +1267,7 @@ The total number of datagrams successfully delivered to IP
+@@ -1267,7 +1267,7 @@ The total number of datagrams successful
   */
  int
  ipIfStatsHCInDelivers_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -398,7 +398,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInDelivers_val_ptr);
-@@ -1396,7 +1396,7 @@ The total number of IP datagrams that local IP user-
+@@ -1396,7 +1396,7 @@ The total number of IP datagrams that lo
   */
  int
  ipIfStatsHCOutRequests_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -407,7 +407,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutRequests_val_ptr);
-@@ -1532,7 +1532,7 @@ The number of datagrams for which this entity was not their
+@@ -1532,7 +1532,7 @@ The number of datagrams for which this e
   */
  int
  ipIfStatsHCOutForwDatagrams_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -416,7 +416,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutForwDatagrams_val_ptr);
-@@ -1999,7 +1999,7 @@ The total number of IP datagrams that this entity supplied
+@@ -1999,7 +1999,7 @@ The total number of IP datagrams that th
   */
  int
  ipIfStatsHCOutTransmits_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -425,7 +425,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutTransmits_val_ptr);
-@@ -2123,7 +2123,7 @@ The total number of octets in IP datagrams delivered to the
+@@ -2123,7 +2123,7 @@ The total number of octets in IP datagra
   */
  int
  ipIfStatsHCOutOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -434,7 +434,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutOctets_val_ptr);
-@@ -2245,7 +2245,7 @@ The number of IP multicast datagrams received.  This object
+@@ -2245,7 +2245,7 @@ The number of IP multicast datagrams rec
   */
  int
  ipIfStatsHCInMcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -443,7 +443,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInMcastPkts_val_ptr);
-@@ -2372,7 +2372,7 @@ The total number of octets received in IP multicast
+@@ -2372,7 +2372,7 @@ The total number of octets received in I
   */
  int
  ipIfStatsHCInMcastOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -452,7 +452,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInMcastOctets_val_ptr);
-@@ -2497,7 +2497,7 @@ The number of IP multicast datagrams transmitted.  This
+@@ -2497,7 +2497,7 @@ The number of IP multicast datagrams tra
   */
  int
  ipIfStatsHCOutMcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -461,7 +461,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutMcastPkts_val_ptr);
-@@ -2621,7 +2621,7 @@ The total number of octets transmitted in IP multicast
+@@ -2621,7 +2621,7 @@ The total number of octets transmitted i
   */
  int
  ipIfStatsHCOutMcastOctets_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -470,7 +470,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutMcastOctets_val_ptr);
-@@ -2743,7 +2743,7 @@ The number of IP broadcast datagrams received.  This object
+@@ -2743,7 +2743,7 @@ The number of IP broadcast datagrams rec
   */
  int
  ipIfStatsHCInBcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -479,7 +479,7 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCInBcastPkts_val_ptr);
-@@ -2865,7 +2865,7 @@ The number of IP broadcast datagrams transmitted.  This
+@@ -2865,7 +2865,7 @@ The number of IP broadcast datagrams tra
   */
  int
  ipIfStatsHCOutBcastPkts_get(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
@@ -488,10 +488,10 @@ index db673dc..fec36b2 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipIfStatsHCOutBcastPkts_val_ptr);
-diff --git a/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h b/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
-index 0cc7e47..ad5d8a0 100644
---- a/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
-+++ b/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.h
 @@ -50,7 +50,7 @@ extern          "C" {
                                              ipIfStatsInReceives_val_ptr);
      int             ipIfStatsHCInReceives_get(ipIfStatsTable_rowreq_ctx *
@@ -618,11 +618,11 @@ index 0cc7e47..ad5d8a0 100644
                                                  ipIfStatsHCOutBcastPkts_val_ptr);
      int            
          ipIfStatsDiscontinuityTime_get(ipIfStatsTable_rowreq_ctx *
-diff --git a/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c b/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
-index 559d1c1..4955a8b 100644
---- a/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
-+++ b/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
-@@ -722,10 +722,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
+@@ -722,10 +722,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInReceives(4)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINRECEIVES:
@@ -635,7 +635,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -741,9 +741,9 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -741,9 +741,9 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInOctets(6)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINOCTETS:
@@ -647,7 +647,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -810,10 +810,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -810,10 +810,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInForwDatagrams(13)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINFORWDATAGRAMS:
@@ -660,7 +660,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -869,10 +869,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -869,10 +869,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInDelivers(19)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINDELIVERS:
@@ -673,7 +673,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -889,10 +889,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -889,10 +889,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutRequests(21)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTREQUESTS:
@@ -686,7 +686,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -909,10 +909,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -909,10 +909,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutForwDatagrams(24)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTFORWDATAGRAMS:
@@ -699,7 +699,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -979,10 +979,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -979,10 +979,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutTransmits(31)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTTRANSMITS:
@@ -712,7 +712,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -999,9 +999,9 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -999,9 +999,9 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutOctets(33)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTOCTETS:
@@ -724,7 +724,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -1018,10 +1018,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1018,10 +1018,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInMcastPkts(35)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINMCASTPKTS:
@@ -737,7 +737,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -1038,10 +1038,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1038,10 +1038,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInMcastOctets(37)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINMCASTOCTETS:
@@ -750,7 +750,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -1058,10 +1058,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1058,10 +1058,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutMcastPkts(39)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTMCASTPKTS:
@@ -763,7 +763,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -1078,10 +1078,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1078,10 +1078,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutMcastOctets(41)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTMCASTOCTETS:
@@ -776,7 +776,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -1098,10 +1098,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1098,10 +1098,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCInBcastPkts(43)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCINBCASTPKTS:
@@ -789,7 +789,7 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-@@ -1118,10 +1118,10 @@ _ipIfStatsTable_get_column(ipIfStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1118,10 +1118,10 @@ _ipIfStatsTable_get_column(ipIfStatsTabl
           * ipIfStatsHCOutBcastPkts(45)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPIFSTATSHCOUTBCASTPKTS:
@@ -802,11 +802,11 @@ index 559d1c1..4955a8b 100644
          break;
  
          /*
-diff --git a/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c b/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
-index 10587e2..5a9323f 100644
---- a/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
-+++ b/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
-@@ -452,7 +452,7 @@ The total number of input IP datagrams received, including
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
+@@ -452,7 +452,7 @@ The total number of input IP datagrams r
   */
  int
  ipSystemStatsHCInReceives_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -815,7 +815,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCInReceives_val_ptr);
-@@ -579,7 +579,7 @@ The total number of octets received in input IP datagrams,
+@@ -579,7 +579,7 @@ The total number of octets received in i
   */
  int
  ipSystemStatsHCInOctets_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -824,7 +824,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCInOctets_val_ptr);
-@@ -1058,7 +1058,7 @@ The number of input datagrams for which this entity was not
+@@ -1058,7 +1058,7 @@ The number of input datagrams for which
  int
  ipSystemStatsHCInForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
                                     rowreq_ctx,
@@ -833,7 +833,7 @@ index 10587e2..5a9323f 100644
                                     ipSystemStatsHCInForwDatagrams_val_ptr)
  {
     /** we should have a non-NULL pointer */
-@@ -1474,7 +1474,7 @@ The total number of datagrams successfully delivered to IP
+@@ -1474,7 +1474,7 @@ The total number of datagrams successful
   */
  int
  ipSystemStatsHCInDelivers_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -842,7 +842,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCInDelivers_val_ptr);
-@@ -1602,7 +1602,7 @@ The total number of IP datagrams which local IP user-
+@@ -1602,7 +1602,7 @@ The total number of IP datagrams which l
   */
  int
  ipSystemStatsHCOutRequests_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -851,7 +851,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCOutRequests_val_ptr);
-@@ -1809,7 +1809,7 @@ The number of datagrams for which this entity was not their
+@@ -1809,7 +1809,7 @@ The number of datagrams for which this e
  int
  ipSystemStatsHCOutForwDatagrams_get(ipSystemStatsTable_rowreq_ctx *
                                      rowreq_ctx,
@@ -860,7 +860,7 @@ index 10587e2..5a9323f 100644
                                      ipSystemStatsHCOutForwDatagrams_val_ptr)
  {
     /** we should have a non-NULL pointer */
-@@ -2288,7 +2288,7 @@ The total number of IP datagrams that this entity supplied
+@@ -2288,7 +2288,7 @@ The total number of IP datagrams that th
   */
  int
  ipSystemStatsHCOutTransmits_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -869,7 +869,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCOutTransmits_val_ptr);
-@@ -2415,7 +2415,7 @@ The total number of octets in IP datagrams delivered to the
+@@ -2415,7 +2415,7 @@ The total number of octets in IP datagra
   */
  int
  ipSystemStatsHCOutOctets_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -878,7 +878,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCOutOctets_val_ptr);
-@@ -2539,7 +2539,7 @@ The number of IP multicast datagrams received.  This object
+@@ -2539,7 +2539,7 @@ The number of IP multicast datagrams rec
   */
  int
  ipSystemStatsHCInMcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -887,7 +887,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCInMcastPkts_val_ptr);
-@@ -2665,7 +2665,7 @@ The total number of octets received in IP multicast
+@@ -2665,7 +2665,7 @@ The total number of octets received in I
  int
  ipSystemStatsHCInMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
                                   rowreq_ctx,
@@ -896,7 +896,7 @@ index 10587e2..5a9323f 100644
                                   ipSystemStatsHCInMcastOctets_val_ptr)
  {
     /** we should have a non-NULL pointer */
-@@ -2790,7 +2790,7 @@ The number of IP multicast datagrams transmitted.  This
+@@ -2790,7 +2790,7 @@ The number of IP multicast datagrams tra
   */
  int
  ipSystemStatsHCOutMcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -905,7 +905,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCOutMcastPkts_val_ptr);
-@@ -2921,7 +2921,7 @@ The total number of octets transmitted in IP multicast
+@@ -2921,7 +2921,7 @@ The total number of octets transmitted i
  int
  ipSystemStatsHCOutMcastOctets_get(ipSystemStatsTable_rowreq_ctx *
                                    rowreq_ctx,
@@ -914,7 +914,7 @@ index 10587e2..5a9323f 100644
                                    ipSystemStatsHCOutMcastOctets_val_ptr)
  {
     /** we should have a non-NULL pointer */
-@@ -3046,7 +3046,7 @@ The number of IP broadcast datagrams received.  This object
+@@ -3046,7 +3046,7 @@ The number of IP broadcast datagrams rec
   */
  int
  ipSystemStatsHCInBcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -923,7 +923,7 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCInBcastPkts_val_ptr);
-@@ -3170,7 +3170,7 @@ The number of IP broadcast datagrams transmitted.  This
+@@ -3170,7 +3170,7 @@ The number of IP broadcast datagrams tra
   */
  int
  ipSystemStatsHCOutBcastPkts_get(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
@@ -932,11 +932,11 @@ index 10587e2..5a9323f 100644
  {
     /** we should have a non-NULL pointer */
      netsnmp_assert(NULL != ipSystemStatsHCOutBcastPkts_val_ptr);
-diff --git a/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h b/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
-index ca1e1f3..5c3823e 100644
---- a/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
-+++ b/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
-@@ -144,93 +144,22 @@ config_require(ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_access)
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable.h
+@@ -144,93 +144,22 @@ config_require(ip-mib/ipSystemStatsTable
       *********************************************************************
       * function prototypes
       */
@@ -1034,7 +1034,7 @@ index ca1e1f3..5c3823e 100644
          * ipSystemStatsTable_row_find_by_mib_index
          (ipSystemStatsTable_mib_index * mib_idx);
  
-@@ -265,226 +194,50 @@ config_require(ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_access)
+@@ -265,226 +194,50 @@ config_require(ip-mib/ipSystemStatsTable
       * indexes
       */
  
@@ -1275,7 +1275,7 @@ index ca1e1f3..5c3823e 100644
                                      rowreq_ctx,
                                      u_long *
                                      ipSystemStatsReasmReqds_val_ptr);
-@@ -492,690 +245,142 @@ config_require(ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_access)
+@@ -492,690 +245,142 @@ config_require(ip-mib/ipSystemStatsTable
                                                * rowreq_ctx,
                                                u_long *
                                                ipSystemStatsReasmOKs_val_ptr);
@@ -2011,11 +2011,11 @@ index ca1e1f3..5c3823e 100644
      /*
       *********************************************************************
       * SET function declarations
-diff --git a/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c b/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
-index e1ca2cb..09c061f 100644
---- a/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
-+++ b/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
-@@ -674,10 +674,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+Index: net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
++++ net-snmp-5.7.3/agent/mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.c
+@@ -674,10 +674,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInReceives(4)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINRECEIVES:
@@ -2028,7 +2028,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -694,10 +694,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -694,10 +694,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInOctets(6)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINOCTETS:
@@ -2041,7 +2041,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -764,10 +764,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -764,10 +764,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInForwDatagrams(13)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINFORWDATAGRAMS:
@@ -2054,7 +2054,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -824,10 +824,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -824,10 +824,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInDelivers(19)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINDELIVERS:
@@ -2067,7 +2067,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -844,10 +844,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -844,10 +844,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutRequests(21)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTREQUESTS:
@@ -2080,7 +2080,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -874,10 +874,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -874,10 +874,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutForwDatagrams(24)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTFORWDATAGRAMS:
@@ -2093,7 +2093,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -944,10 +944,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -944,10 +944,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutTransmits(31)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTTRANSMITS:
@@ -2106,7 +2106,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -964,10 +964,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -964,10 +964,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutOctets(33)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTOCTETS:
@@ -2119,7 +2119,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -984,10 +984,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -984,10 +984,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInMcastPkts(35)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINMCASTPKTS:
@@ -2132,7 +2132,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -1004,10 +1004,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1004,10 +1004,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInMcastOctets(37)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINMCASTOCTETS:
@@ -2145,7 +2145,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -1024,10 +1024,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1024,10 +1024,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutMcastPkts(39)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTMCASTPKTS:
@@ -2158,7 +2158,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -1044,10 +1044,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1044,10 +1044,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutMcastOctets(41)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTMCASTOCTETS:
@@ -2171,7 +2171,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -1064,10 +1064,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1064,10 +1064,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCInBcastPkts(43)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCINBCASTPKTS:
@@ -2184,7 +2184,7 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-@@ -1084,10 +1084,10 @@ _ipSystemStatsTable_get_column(ipSystemStatsTable_rowreq_ctx * rowreq_ctx,
+@@ -1084,10 +1084,10 @@ _ipSystemStatsTable_get_column(ipSystemS
           * ipSystemStatsHCOutBcastPkts(45)/COUNTER64/ASN_COUNTER64/U64(U64)//l/A/w/e/r/d/h 
           */
      case COLUMN_IPSYSTEMSTATSHCOUTBCASTPKTS:
@@ -2197,10 +2197,10 @@ index e1ca2cb..09c061f 100644
          break;
  
          /*
-diff --git a/include/net-snmp/data_access/ipstats.h b/include/net-snmp/data_access/ipstats.h
-index f782459..f0df46b 100644
---- a/include/net-snmp/data_access/ipstats.h
-+++ b/include/net-snmp/data_access/ipstats.h
+Index: net-snmp-5.7.3/include/net-snmp/data_access/ipstats.h
+===================================================================
+--- net-snmp-5.7.3.orig/include/net-snmp/data_access/ipstats.h
++++ net-snmp-5.7.3/include/net-snmp/data_access/ipstats.h
 @@ -58,45 +58,45 @@ typedef struct netsnmp_ipstats_s {
      * other columns, when underlying OS does not provide them.
      * Always fill at least 32 bits, the table is periodically polled -> 32 bit
@@ -2268,10 +2268,10 @@ index f782459..f0df46b 100644
  
     /* Array of available columns.*/
     int             columnAvail[IPSYSTEMSTATSTABLE_LAST+1];
-diff --git a/include/net-snmp/library/int64.h b/include/net-snmp/library/int64.h
-index 9c7c894..3a85213 100644
---- a/include/net-snmp/library/int64.h
-+++ b/include/net-snmp/library/int64.h
+Index: net-snmp-5.7.3/include/net-snmp/library/int64.h
+===================================================================
+--- net-snmp-5.7.3.orig/include/net-snmp/library/int64.h
++++ net-snmp-5.7.3/include/net-snmp/library/int64.h
 @@ -5,31 +5,29 @@
  extern          "C" {
  #endif
@@ -2320,10 +2320,10 @@ index 9c7c894..3a85213 100644
                                                       int adjust);
      NETSNMP_IMPORT
      int             netsnmp_c64_check32_and_update(struct counter64 *prev_val,
-diff --git a/snmplib/int64.c b/snmplib/int64.c
-index 51f1f32..951f813 100644
---- a/snmplib/int64.c
-+++ b/snmplib/int64.c
+Index: net-snmp-5.7.3/snmplib/int64.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/int64.c
++++ net-snmp-5.7.3/snmplib/int64.c
 @@ -33,7 +33,7 @@
   * @param[out] puR   Remainder.
   */
@@ -2333,7 +2333,7 @@ index 51f1f32..951f813 100644
  {
      unsigned long   ulT;
      unsigned long   ulQ;
-@@ -83,7 +83,7 @@ divBy10(U64 u64, U64 * pu64Q, unsigned int *puR)
+@@ -83,7 +83,7 @@ divBy10(U64 u64, U64 * pu64Q, unsigned i
   * @param[out] pu64P Product.
   */
  void
@@ -2369,7 +2369,7 @@ index 51f1f32..951f813 100644
  {
      int carry;
  
-@@ -177,7 +177,7 @@ u64Subtract(const U64 * pu64one, const U64 * pu64two, U64 * pu64out)
+@@ -177,7 +177,7 @@ u64Subtract(const U64 * pu64one, const U
   * @param[in,out] pu64out pu64out += pu64one.
   */
  void
@@ -2378,7 +2378,7 @@ index 51f1f32..951f813 100644
  {
      pu64out->high = (uint32_t)(pu64out->high + pu64one->high);
      incrByU32(pu64out, pu64one->low);
-@@ -191,9 +191,9 @@ u64Incr(U64 * pu64out, const U64 * pu64one)
+@@ -191,9 +191,9 @@ u64Incr(U64 * pu64out, const U64 * pu64o
   * @param[out] pu64out pu64out += (pu64one - pu64two)
   */
  void
@@ -2390,7 +2390,7 @@ index 51f1f32..951f813 100644
  
      u64Subtract(pu64one, pu64two, &tmp);
      u64Incr(pu64out, &tmp);
-@@ -208,7 +208,7 @@ netsnmp_feature_child_of(u64copy, netsnmp_unused)
+@@ -208,7 +208,7 @@ netsnmp_feature_child_of(u64copy, netsnm
   * @param[out] pu64one Where to store the copy - *pu64one = *pu64two.
   */
  void
@@ -2399,7 +2399,7 @@ index 51f1f32..951f813 100644
  {
      *pu64one = *pu64two;
  }
-@@ -220,7 +220,7 @@ u64Copy(U64 * pu64one, const U64 * pu64two)
+@@ -220,7 +220,7 @@ u64Copy(U64 * pu64one, const U64 * pu64t
   * @param[in] pu64 Number to be zeroed.
   */
  void
@@ -2417,7 +2417,7 @@ index 51f1f32..951f813 100644
  {
      return pu64->low == 0 && pu64->high == 0;
  }
-@@ -390,10 +390,10 @@ netsnmp_c64_check32_and_update(struct counter64 *prev_val, struct counter64 *new
+@@ -390,10 +390,10 @@ netsnmp_c64_check32_and_update(struct co
  /** Convert an unsigned 64-bit number to ASCII. */
  void
  printU64(char *buf, /* char [I64CHARSZ+1]; */
@@ -2431,7 +2431,7 @@ index 51f1f32..951f813 100644
  
      char            aRes[I64CHARSZ + 1];
      unsigned int    u;
-@@ -414,9 +414,9 @@ printU64(char *buf, /* char [I64CHARSZ+1]; */
+@@ -414,9 +414,9 @@ printU64(char *buf, /* char [I64CHARSZ+1
  /** Convert a signed 64-bit number to ASCII. */
  void
  printI64(char *buf, /* char [I64CHARSZ+1]; */
@@ -2443,7 +2443,7 @@ index 51f1f32..951f813 100644
  
      if (pu64->high & 0x80000000) {
          u64a.high = (uint32_t) ~pu64->high;
-@@ -429,11 +429,11 @@ printI64(char *buf, /* char [I64CHARSZ+1]; */
+@@ -429,11 +429,11 @@ printI64(char *buf, /* char [I64CHARSZ+1
      }
  }
  
@@ -2458,11 +2458,11 @@ index 51f1f32..951f813 100644
      unsigned int    u;
      int             sign = 0;
      int             ok = 0;
-diff --git a/snmplib/read_config.c b/snmplib/read_config.c
-index e159c27..ab5b6a3 100644
---- a/snmplib/read_config.c
-+++ b/snmplib/read_config.c
-@@ -2279,10 +2279,10 @@ read_config_read_memory(int type, char *readfrom,
+Index: net-snmp-5.7.3/snmplib/read_config.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/read_config.c
++++ net-snmp-5.7.3/snmplib/read_config.c
+@@ -2270,10 +2270,10 @@ read_config_read_memory(int type, char *
          return readfrom;
  
      case ASN_COUNTER64:
@@ -2476,10 +2476,10 @@ index e159c27..ab5b6a3 100644
          readfrom = skip_token(readfrom);
          return readfrom;
      }
-diff --git a/testing/fulltests/unit-tests/T015int64_clib.c b/testing/fulltests/unit-tests/T015int64_clib.c
-index 5f5f4b6..66f66b7 100644
---- a/testing/fulltests/unit-tests/T015int64_clib.c
-+++ b/testing/fulltests/unit-tests/T015int64_clib.c
+Index: net-snmp-5.7.3/testing/fulltests/unit-tests/T015int64_clib.c
+===================================================================
+--- net-snmp-5.7.3.orig/testing/fulltests/unit-tests/T015int64_clib.c
++++ net-snmp-5.7.3/testing/fulltests/unit-tests/T015int64_clib.c
 @@ -1,4 +1,4 @@
 -/* HEADER Testing 64-bit integer operations (U64). */
 +/* HEADER Testing 64-bit integer operations (struct counter64). */
@@ -2495,7 +2495,7 @@ index 5f5f4b6..66f66b7 100644
      a.low = (uint32_t)intval[i];
      a.high = (uint32_t)(intval[i] >> 32);
      printI64(buf, &a);
-@@ -27,7 +27,7 @@ for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
+@@ -27,7 +27,7 @@ for (i = 0; i < sizeof(intval)/sizeof(in
  
  for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
      for (j = i; j < sizeof(intval)/sizeof(intval[0]); ++j) {
@@ -2504,7 +2504,7 @@ index 5f5f4b6..66f66b7 100644
          uint64_t d;
          a.low = (uint32_t)intval[i];
          a.high = (uint32_t)(intval[i] >> 32);
-@@ -43,7 +43,7 @@ for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
+@@ -43,7 +43,7 @@ for (i = 0; i < sizeof(intval)/sizeof(in
          
  for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
      for (j = i; j < sizeof(intval)/sizeof(intval[0]); ++j) {
@@ -2513,7 +2513,7 @@ index 5f5f4b6..66f66b7 100644
          uint64_t d;
          a.low = (uint32_t)intval[i];
          a.high = (uint32_t)(intval[i] >> 32);
-@@ -58,7 +58,7 @@ for (i = 0; i < sizeof(intval)/sizeof(intval[0]); ++i) {
+@@ -58,7 +58,7 @@ for (i = 0; i < sizeof(intval)/sizeof(in
  }
          
  {
@@ -2522,6 +2522,3 @@ index 5f5f4b6..66f66b7 100644
      old_val.low = 7;
      old_val.high = 0;
      new_val = old_val;
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
index c6401fe..44359be 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -17,11 +17,11 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
  configure.d/config_os_headers | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index 708aa09..0df32ca 100644
---- a/configure.d/config_os_headers
-+++ b/configure.d/config_os_headers
-@@ -482,8 +482,8 @@ then
+Index: net-snmp-5.7.3/configure.d/config_os_headers
+===================================================================
+--- net-snmp-5.7.3.orig/configure.d/config_os_headers
++++ net-snmp-5.7.3/configure.d/config_os_headers
+@@ -484,8 +484,8 @@ then
      unset ac_cv_header_pkg_h
      netsnmp_save_CPPFLAGS="$CPPFLAGS"
      netsnmp_save_LDFLAGS="$LDFLAGS"
@@ -32,6 +32,3 @@ index 708aa09..0df32ca 100644
      AC_CHECK_HEADERS(pkg.h,
          NETSNMP_SEARCH_LIBS(pkg_init, pkg,
  	    AC_DEFINE(HAVE_LIBPKG, 1, [define if you have BSD pkg-ng])))
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
index 6255f7c..527aa39 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
@@ -12,11 +12,11 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  snmplib/transports/snmpUDPIPv6Domain.c | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/snmplib/transports/snmpUDPIPv6Domain.c b/snmplib/transports/snmpUDPIPv6Domain.c
-index 029b164..11c39bb 100644
---- a/snmplib/transports/snmpUDPIPv6Domain.c
-+++ b/snmplib/transports/snmpUDPIPv6Domain.c
-@@ -285,6 +285,7 @@ netsnmp_udp6_transport(struct sockaddr_in6 *addr, int local)
+Index: net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/transports/snmpUDPIPv6Domain.c
++++ net-snmp-5.7.3/snmplib/transports/snmpUDPIPv6Domain.c
+@@ -305,6 +305,7 @@ netsnmp_udp6_transport(struct sockaddr_i
                                   errno, strerror(errno)));
                  netsnmp_socketbase_close(t);
                  netsnmp_transport_free(t);
@@ -24,6 +24,3 @@ index 029b164..11c39bb 100644
              }
          }
          /*
--- 
-2.9.3
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
index a360c3a..d29be33 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
@@ -10,11 +10,11 @@ Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
-diff --git a/Makefile.top b/Makefile.top
-index 862fb94..ed7dcfc 100644
---- a/Makefile.top
-+++ b/Makefile.top
-@@ -86,7 +86,7 @@ LIBREVISION = 2
+Index: net-snmp-5.7.3/Makefile.top
+===================================================================
+--- net-snmp-5.7.3.orig/Makefile.top
++++ net-snmp-5.7.3/Makefile.top
+@@ -87,7 +87,7 @@ LIBREVISION = 3
  LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) -o
  LIB_EXTENSION   = la
  LIB_VERSION     =
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
index efe8038..fbd274b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -12,11 +12,11 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  snmplib/snmpv3.c | 4 ++--
  2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/agent/snmpd.c b/agent/snmpd.c
-index 056048a..12a7ea1 100644
---- a/agent/snmpd.c
-+++ b/agent/snmpd.c
-@@ -1246,6 +1246,7 @@ receive(void)
+Index: net-snmp-5.7.3/agent/snmpd.c
+===================================================================
+--- net-snmp-5.7.3.orig/agent/snmpd.c
++++ net-snmp-5.7.3/agent/snmpd.c
+@@ -1253,6 +1253,7 @@ receive(void)
  	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
  		     netsnmp_get_version());
              update_config();
@@ -24,11 +24,11 @@ index 056048a..12a7ea1 100644
              send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
  #if HAVE_SIGHOLD
              sigrelse(SIGHUP);
-diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
-index 435cafd..6ad8208 100644
---- a/snmplib/snmpv3.c
-+++ b/snmplib/snmpv3.c
-@@ -984,9 +984,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
+Index: net-snmp-5.7.3/snmplib/snmpv3.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/snmpv3.c
++++ net-snmp-5.7.3/snmplib/snmpv3.c
+@@ -984,9 +984,9 @@ init_snmpv3_post_config(int majorid, int
      /*
       * if our engineID has changed at all, the boots record must be set to 1 
       */
@@ -40,6 +40,3 @@ index 435cafd..6ad8208 100644
          engineBoots = 1;
      }
  
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
index 9fb19b3..8f8336a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
@@ -10,11 +10,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  testing/RUNTESTS |    4 ++++
  1 files changed, 4 insertions(+), 0 deletions(-)
 
-diff --git a/testing/RUNTESTS b/testing/RUNTESTS
-index e11c969..fb90f76 100755
---- a/testing/RUNTESTS
-+++ b/testing/RUNTESTS
-@@ -25,13 +25,17 @@ failed_count=0
+Index: net-snmp-5.7.3/testing/RUNTESTS
+===================================================================
+--- net-snmp-5.7.3.orig/testing/RUNTESTS
++++ net-snmp-5.7.3/testing/RUNTESTS
+@@ -29,13 +29,17 @@ failed_count=0
  rm -f failed_tests
  for i in "${srcdir}"/testing/fulltests/default/T*$1*; do
      echo "RUNNING $i"
@@ -32,6 +32,3 @@ index e11c969..fb90f76 100755
  done
  
  if [ -f failed_tests ]; then
--- 
-1.7.1
-
-- 
2.7.4


