Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50B4CFC270
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 06:19:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7032.1728973170265139027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 23:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k40Di3hR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728973170; x=1760509170;
  h=from:to:cc:subject:date:message-id;
  bh=UMzL3UXwJdVLzovH+iYraJltQaNt0jQb/RHVlsvnTP0=;
  b=k40Di3hREGoGxMo6D5Z9+LkMiDDzwQHYhYBXQoGTg2saorPoJlI7AH1K
   R0KWjJKB2TCgdlQcKXKnBy1GJTUq9YgoPP419+ST6pyBEYYSnutzcZbU7
   83GJ/Y+5FbvLU3KxoG9Ry+7+hctlqgYbUlfydMJFj97wqF55D6Y3EEE/U
   K9JpRRe3SNP3gy/eBweEmAMp7B4YT6cnjtb7e2KOf8KohNadtwQibEPYL
   1M3bYlsQpkD+pFp2jLcYBfrw8kWlraPqoFoxIBrL8AmjcRhbSFjnxTK6Q
   CvH4Rd9GaAKSKvYiFjx/D+uN8VlkXCtde9bPUBUDJO9B00ousCMZDzJAx
   g==;
X-CSE-ConnectionGUID: +paCFdX0R/iVukAFQQKN9w==
X-CSE-MsgGUID: Xw5i2uPgRFS9hRZ6Aow6QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="178966207"
X-IronPort-AV: E=Sophos;i="6.11,204,1725289200"; 
   d="scan'208";a="178966207"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 15:19:27 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 87CBEDB3C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 15:19:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C6FE7EA0B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 15:19:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 53AA66B4D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 15:19:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C8BE31A000B;
	Tue, 15 Oct 2024 14:19:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] nmap: Fix off-by-one overflow in the IP protocol table.
Date: Tue, 15 Oct 2024 14:19:08 +0800
Message-Id: <1728973148-7723-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28732.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28732.005
X-TMASE-Result: 10--9.564500-10.000000
X-TMASE-MatchedRID: /vIzZewJd/yHfxuc8sSk8SrLqyE6Ur/jJ4cwIYL6KueU8ftiyKjZrTmE
	2dO3RvyrscxkTquRmCrGKIf6hBf7VVNeezijLomWuce7gFxhKa0/xRB6OGnb2ryPR5D4hQAdBIM
	JR2TXxaI0gGvDuBPXdC//MlDRqI8m9R7dwXny/beC+Y2uxPjocvioIsi7Sa0gkMd5ahmle3Wk86
	uMB98iNhS5v/tkHPZH4o9nK8FCVMX1FDOkHjeV479A3Bl1/DcVZMbHJbcLQlgkt9BigJAcVvkf3
	+mJChR/FmiE3UNCwGjLZU6rgyjg0UalMYM3ymn5rltvlARhKR1IBt8FVKrwCTP3WYNhkszli3DJ
	C3gsjO7BGBivVrAn4IAy6p60ZV62v2ThXg3lx4CtIWznhjjBtfoLR4+zsDTthUfR2rvBju5kXjG
	djiZJN/FA2Wu6AemCqtgUQ/jDvRmbk5EGXNApFQFffeKwkyhd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 06:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112923

From: Wang Mingyu <wangmy@fujitsu.com>

Add patch to fix core dumped error when using "nmap -sO"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ne-overflow-in-the-IP-protocol-table.patch | 165 ++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch

diff --git a/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch b/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
new file mode 100644
index 000000000..bcb04250b
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
@@ -0,0 +1,165 @@
+From 364d089250d1acf459e9e8580161e7bb06268106 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Tue, 15 Oct 2024 02:47:38 +0000
+Subject: [PATCH] Fix off-by-one overflow in the IP protocol table.
+
+Fixes #2896, closes #2897, closes #2900
+
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/efa0dc36f2ecade6ba8d2ed25dd4d5fbffdea308]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ CHANGELOG     |  3 +++
+ portlist.cc   |  8 ++++----
+ protocols.cc  |  6 +++---
+ protocols.h   |  2 ++
+ scan_lists.cc | 10 +++++-----
+ 5 files changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index f01262c..5b204bd 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,5 +1,8 @@
+ #Nmap Changelog ($Id: CHANGELOG 38849 2024-04-18 17:16:42Z dmiller $); -*-text-*-
+ 
++o [GH#2900, GH#2896, GH#2897] Nmap is now able to scan IP protocol 255.
++  [nnposter]
++
+ Nmap 7.95 [2024-04-19]
+ 
+ o [Windows] Upgraded Npcap (our Windows raw packet capturing and
+diff --git a/portlist.cc b/portlist.cc
+index 8258853..cd08437 100644
+--- a/portlist.cc
++++ b/portlist.cc
+@@ -480,7 +480,7 @@ void PortList::setPortState(u16 portno, u8 protocol, int state, int *oldstate) {
+       state != PORT_CLOSEDFILTERED)
+     fatal("%s: attempt to add port number %d with illegal state %d\n", __func__, portno, state);
+ 
+-  assert(protocol!=IPPROTO_IP || portno<256);
++  assert(protocol!=IPPROTO_IP || portno<=MAX_IPPROTONUM);
+ 
+   bool created = false;
+   current = createPort(portno, protocol, &created);
+@@ -566,7 +566,7 @@ Port *PortList::nextPort(const Port *cur, Port *next,
+   if (cur) {
+     proto = INPROTO2PORTLISTPROTO(cur->proto);
+     assert(port_map[proto]!=NULL); // Hmm, it's not possible to handle port that doesn't have anything in map
+-    assert(cur->proto!=IPPROTO_IP || cur->portno<256);
++    assert(cur->proto!=IPPROTO_IP || cur->portno<=MAX_IPPROTONUM);
+     mapped_pno = port_map[proto][cur->portno];
+     mapped_pno++; //  we're interested in next port after current
+   } else { // running for the first time
+@@ -615,7 +615,7 @@ void PortList::mapPort(u16 *portno, u8 *protocol) const {
+   mapped_protocol = INPROTO2PORTLISTPROTO(*protocol);
+ 
+   if (*protocol == IPPROTO_IP)
+-    assert(*portno < 256);
++    assert(*portno <= MAX_IPPROTONUM);
+   if(port_map[mapped_protocol]==NULL || port_list[mapped_protocol]==NULL) {
+     fatal("%s(%i,%i): you're trying to access uninitialized protocol", __func__, *portno, *protocol);
+   }
+@@ -713,7 +713,7 @@ int PortList::port_list_count[PORTLIST_PROTO_MAX];
+  * should be sorted. */
+ void PortList::initializePortMap(int protocol, u16 *ports, int portcount) {
+   int i;
+-  int ports_max = (protocol == IPPROTO_IP) ? 256 : 65536;
++  int ports_max = (protocol == IPPROTO_IP) ? MAX_IPPROTONUM + 1 : 65536;
+   int proto = INPROTO2PORTLISTPROTO(protocol);
+ 
+   if (port_map[proto] != NULL || port_map_rev[proto] != NULL)
+diff --git a/protocols.cc b/protocols.cc
+index 76e42c7..85e55e4 100644
+--- a/protocols.cc
++++ b/protocols.cc
+@@ -79,7 +79,7 @@ struct strcmp_comparator {
+ 
+ // IP Protocol number is 8 bits wide
+ // protocol_table[IPPROTO_TCP] == {"tcp", 6}
+-static struct nprotoent *protocol_table[UCHAR_MAX];
++static struct nprotoent *protocol_table[MAX_IPPROTONUM + 1];
+ // proto_map["tcp"] = {"tcp", 6}
+ typedef std::map<const char *, struct nprotoent, strcmp_comparator> ProtoMap;
+ static ProtoMap proto_map;
+@@ -119,7 +119,7 @@ static int nmap_protocols_init() {
+     if (*p == '#' || *p == '\0')
+       continue;
+     res = sscanf(line, "%127s %hu", protocolname, &protno);
+-    if (res !=2 || protno > UCHAR_MAX) {
++    if (res !=2 || protno > MAX_IPPROTONUM) {
+       error("Parse error in protocols file %s line %d", filename, lineno);
+       continue;
+     }
+@@ -191,7 +191,7 @@ const struct nprotoent *nmap_getprotbynum(int num) {
+   if (nmap_protocols_init() == -1)
+     return NULL;
+ 
+-  assert(num >= 0 && num < UCHAR_MAX);
++  assert(num >= 0 && num <= MAX_IPPROTONUM);
+   return protocol_table[num];
+ }
+ 
+diff --git a/protocols.h b/protocols.h
+index 8934284..2de0aa4 100644
+--- a/protocols.h
++++ b/protocols.h
+@@ -79,6 +79,8 @@ int addprotocolsfromservmask(char *mask, u8 *porttbl);
+ const struct nprotoent *nmap_getprotbynum(int num);
+ const struct nprotoent *nmap_getprotbyname(const char *name);
+ 
++#define MAX_IPPROTONUM 255
++
+ #define MAX_IPPROTOSTRLEN 4
+ #define IPPROTO2STR(p)		\
+   ((p)==IPPROTO_TCP ? "tcp" :	\
+diff --git a/scan_lists.cc b/scan_lists.cc
+index f02e279..ebe1357 100644
+--- a/scan_lists.cc
++++ b/scan_lists.cc
+@@ -165,7 +165,7 @@ void getpts(const char *origexpr, struct scan_lists *ports) {
+       ports->udp_count++;
+     if (porttbl[i] & SCAN_SCTP_PORT)
+       ports->sctp_count++;
+-    if (porttbl[i] & SCAN_PROTOCOLS && i < 256)
++    if (porttbl[i] & SCAN_PROTOCOLS && i <= MAX_IPPROTONUM)
+       ports->prot_count++;
+   }
+ 
+@@ -192,7 +192,7 @@ void getpts(const char *origexpr, struct scan_lists *ports) {
+       ports->udp_ports[udpi++] = i;
+     if (porttbl[i] & SCAN_SCTP_PORT)
+       ports->sctp_ports[sctpi++] = i;
+-    if (porttbl[i] & SCAN_PROTOCOLS && i < 256)
++    if (porttbl[i] & SCAN_PROTOCOLS && i <= MAX_IPPROTONUM)
+       ports->prots[proti++] = i;
+   }
+ 
+@@ -388,7 +388,7 @@ static void getpts_aux(const char *origexpr, int nested, u8 *porttbl, int range_
+     } else if (isdigit((int) (unsigned char) *current_range)) {
+       rangestart = strtol(current_range, &endptr, 10);
+       if (range_type & SCAN_PROTOCOLS) {
+-        if (rangestart < 0 || rangestart > 255)
++        if (rangestart < 0 || rangestart > MAX_IPPROTONUM)
+           fatal("Protocols specified must be between 0 and 255 inclusive");
+       } else {
+         if (rangestart < 0 || rangestart > 65535)
+@@ -429,13 +429,13 @@ static void getpts_aux(const char *origexpr, int nested, u8 *porttbl, int range_
+       if (!*current_range || *current_range == ',' || *current_range == ']') {
+         /* Ended with a -, meaning up until the last possible port */
+         if (range_type & SCAN_PROTOCOLS)
+-          rangeend = 255;
++          rangeend = MAX_IPPROTONUM;
+         else
+           rangeend = 65535;
+       } else if (isdigit((int) (unsigned char) *current_range)) {
+         rangeend = strtol(current_range, &endptr, 10);
+         if (range_type & SCAN_PROTOCOLS) {
+-          if (rangeend < 0 || rangeend > 255)
++          if (rangeend < 0 || rangeend > MAX_IPPROTONUM)
+             fatal("Protocols specified must be between 0 and 255 inclusive");
+         } else {
+           if (rangeend < 0 || rangeend > 65535)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index 79c28e71f..a319be4fb 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
            file://0001-Include-time.h-header-to-pass-clang-compilation.patch \
            file://0002-Fix-building-with-libc.patch \
+           file://0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch \
            "
 SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
 inherit autotools-brokensep pkgconfig python3native
-- 
2.34.1


