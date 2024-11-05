Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1887D2B95F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.19655.1730817441949600415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OmQHSAYN;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea50585bf2so58096337b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817441; x=1731422241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QChh7IVcnOd88ove+9uDPxh8FC1lOfQm08kA5wX0TfM=;
        b=OmQHSAYNdC0uo53UTROHxcsdvtJMTIxGg9La24560Rp4OhDYrWOGZRJeK3/oYQeqe5
         8yH96BNybUBLknt6FzJiSykeCHDQ0lJtRvz3CX1slM36q73/J6sTGIfgmHMgfJxobGZl
         RtCsl8GPEAde9q7JF+4L8SnwnwZ1V9aDhgLMVdLDVmijQ2GbstONwg0j6vlarFMXfJJj
         v5yWcEIoS7lHZXQMCE3NoBCt4SiiQbXlfA0GLYprkE9eTH+5Pp6A0Ep5xj+ztWFSgsuW
         fsOA1+k4f/NhPFS6FyxA25EPmVj595WjvpPqNRr5xs+8nZzM+oQqWksvE8KTVR8GuB3w
         s/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817441; x=1731422241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QChh7IVcnOd88ove+9uDPxh8FC1lOfQm08kA5wX0TfM=;
        b=vF78TB9kedxyu4ZG1tLCgyCb3nl5g/AMfjAgxiq4bKr09qLvXVp0LXr1MUm6DEfpj+
         pYMbKXaSboaMaZ9U+Cpioq+FK9MYBakS+A82OZnl0itDvLJjXJ15MvM2Eo98AUqqgH1h
         NkU1lyIvYxepoaf6tQgaI2jG5En89KSeE941L1g4yoD/LhVFtU7kP82S+alGPLvVNry0
         AceYg0flk38sPIRnfJ7MvIbJDtfWPoDdcxRb4+0u4R2pqsmnvheEBifhul1s9SmGmXJv
         mVpDT8IHQFSgOP7VpK0WugQd4pbR22qhKbVGJBU4sX3jWRjcBtLMNorXTx3kLXTi3M38
         iYqw==
X-Gm-Message-State: AOJu0YybJnnOOU8muLV+GJyOQWk5LaEG3Mn+vb4DZSJAppsGbyg82FJu
	fWJ5l28z4mu21oALKjle55kGcc/7Kq3WQp3b8LHv7WMoIUXQq4CPcZ4zTw==
X-Google-Smtp-Source: AGHT+IEzB59cf1bMbDgMEzXraLHtu/xrSKB2iWY7n5meEekwo+h5Lwm3Cio55bPdtRYAB0BAy34kFA==
X-Received: by 2002:a05:690c:7013:b0:6e3:34b9:961d with SMTP id 00721157ae682-6ea64c2ed0bmr158469657b3.38.1730817439440;
        Tue, 05 Nov 2024 06:37:19 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 86/90] nmap: Fix off-by-one overflow in the IP protocol table.
Date: Tue,  5 Nov 2024 09:35:51 -0500
Message-ID: <20241105143638.2301245-87-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113508

From: Wang Mingyu <wangmy@fujitsu.com>

Add patch to fix core dumped error when using "nmap -sO"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a5b26d467c692c3537aaebf9bd088736dc93dc4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ne-overflow-in-the-IP-protocol-table.patch | 165 ++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch

diff --git a/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch b/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
new file mode 100644
index 0000000000..bcb04250bb
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
index 79c28e71f0..a319be4fb0 100644
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
2.43.0


