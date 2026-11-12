Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8156.1794465927164605873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Gavaieor;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4049229c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465926; x=1795070726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6db1X614IUEZE9bGVC+Ehlx+GELw8WLO0u4R5jHmlfU=;
        b=GavaieorUlbqq7CZLaK+cKdkPO6Ch0VCjf1RjNCbZuq0vk1+UD1KtWNleHCl8Nv0Az
         wZcmdJvSUiKM1+xLu2qTQo9qvztjODddcExyPOC7YkPnLoId/RyiIC20D01oIbrdzZR9
         TMbaIiEvZQyOi02/tBwj4HQ4V9mfw1z4NyV3QUgQncNMObiMeARFk39hgzwSxOXfwsUS
         it+Q6X7LUUusFuWx4Q6DxB9M4YO8Bz6DGaMIYNYG+V/vmL8Ryvhmxy+wv99VkHWFEJ3w
         eLoKiLjNRydKZI7NShjvLOUFy4Zc5+LqZCdtQMzqgxfTrGjnBdB8vrxDlxSo4cTIByJO
         5cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465926; x=1795070726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6db1X614IUEZE9bGVC+Ehlx+GELw8WLO0u4R5jHmlfU=;
        b=sYYi37MDeSWJTi5hUj+4c5NXhkUE/ToLm5vkUGifEeDUQU8U/BykmzOcG9Ph+J1jRm
         Z5jgVf5PQxPW1z4qMvTWAQgfXLSFICOAlK99msUTuNf+YxVLPQlHBmXNbBvyNtr5lku0
         DxJi1TSR2hhNI2kthmoPFkzSh4p1yWdX6hNS2uS9L4ZH/HpWB2Y9uHtcLfQ2l66j09ng
         k1UAsaan9G+q+vdflkLKxLJ4JQpFami8EtZS6y6fWcBimSz7hX6faLyPAxzg6mc/rO1H
         TgPKB1ahCXDrtQcDQ5O5qfyNvYG1MqQ5IcHMBgRmmtF8LoqF4Go25u5uArkFQy1wi5ue
         48FA==
X-Gm-Message-State: APuU4Z/XP+eKbbbsoX3QrgJGkN9008aH9YeZi6xczrykRvhxWNG0UV0K
	kiyFQK7NAd7u08RfzMjDJBImZKJ3b+F6wU4gXeREPOzDAwYV04fi6bBnjj6qGN0cskk=
X-Gm-Gg: AYBFou2DCc5qoK89p+em0LrU5iHdWFzEFDki6p/+gs6bNcriaKZOYWF+MSqpZ371Jy8
	daBdGkyF7ah9e+jLbdIlTSiasgihfVc2lr2/oyZcLWssNDQhAx3t86mMxcJpW9Wp68sHiE4pjv9
	2x5HHiHtan54jUkVNuwgzPKt1YpWM1wFwsUBrUkXY1FtU3MGXi1SB3qQ8yfOSpK070brXVBNymv
	GoLeqcVWPbQVO/Il9+blaARlpt9iM3unxqJyFQ50S8f249x3lBWuEp0uu5yidYvnaUZjGNCZ9dH
	0aGq1L9+tjt6ECVmxAxI87CNLwirQ+z1MwYmvgpZPvpszk1IV9zic8kmQ0bNIo2vTkBEBHuN1JK
	DJa2IWf47HoN+hijnG675paDvU4ypjIvRwSVCZf2rtFdwt756R6rSKxlqsP9D3e2sG9aPXlqr5D
	K0ZG9GbYC2CWLOu9/kzXogk+CvbVw6Mhq5NGdo+GgFwXPJMNJCmP7ilQGydPDvf9B/7wRZr7ifa
	vAv1+eC/HmbseGc2MLrdmzwBUVK9Bz5bPeV4Aaw6QMVbNYFRsSbUiP0AqcCxkb+1T4HL3exBpIL
	X0ZCeobNFnffl1Je9uXmoloJ0lJQhFzYkSyCNN5glnQoG46enhqPzjvRUC1jWBM+TatT8CWCEBW
	qxnIAHKN/1G7SJSIqF+9c6kgnDFsxtU80qbYMJSAFi8N78DpqSPBQOddJIrqwbfAHH0yb2hHtkW
	xLHqPlakwu9BBugtfklImciqeNUcTeVvaI5kh/GaTkCwNqmJot2lMYe+OjWlXRZ3cKrdyPRqaoF
	EbYPxF9B57mFq4dzPm6FYVEqG1LIW35ZLuuOt4xnj0pR86nGRluccR3xU3PyEXk48nXXNZODkoe
	BZPw
X-Received: by 2002:a05:7301:5f87:b0:377:678:2309 with SMTP id 5a478bee46e88-37706782738mr3569928eec.15.1794465926094;
        Wed, 11 Nov 2026 22:45:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm21055001eec.3.2026.11.11.22.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:45:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/5] nmap: Remove unused patches
Date: Wed, 11 Nov 2026 22:45:14 -0800
Message-ID: <20261112064515.2411568-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
References: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132197
Content-Type: text/plain; charset="utf-8"

These were dropped from SRC_URI in 13bafd2753 (nmap: upgrade 7.92 -> 7.99) but the files were left behind:

  0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
  nmap-redefine-the-python-library-dir.patch

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ne-overflow-in-the-IP-protocol-table.patch | 165 ------------------
 ...nmap-redefine-the-python-library-dir.patch |  23 ---
 2 files changed, 188 deletions(-)
 delete mode 100644 meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
 delete mode 100644 meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch

diff --git a/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch b/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
deleted file mode 100644
index bcb04250bb..0000000000
--- a/meta-oe/recipes-security/nmap/files/0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From 364d089250d1acf459e9e8580161e7bb06268106 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Tue, 15 Oct 2024 02:47:38 +0000
-Subject: [PATCH] Fix off-by-one overflow in the IP protocol table.
-
-Fixes #2896, closes #2897, closes #2900
-
-Upstream-Status: Backport [https://github.com/nmap/nmap/commit/efa0dc36f2ecade6ba8d2ed25dd4d5fbffdea308]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- CHANGELOG     |  3 +++
- portlist.cc   |  8 ++++----
- protocols.cc  |  6 +++---
- protocols.h   |  2 ++
- scan_lists.cc | 10 +++++-----
- 5 files changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index f01262c..5b204bd 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,5 +1,8 @@
- #Nmap Changelog ($Id: CHANGELOG 38849 2024-04-18 17:16:42Z dmiller $); -*-text-*-
-
-+o [GH#2900, GH#2896, GH#2897] Nmap is now able to scan IP protocol 255.
-+  [nnposter]
-+
- Nmap 7.95 [2024-04-19]
-
- o [Windows] Upgraded Npcap (our Windows raw packet capturing and
-diff --git a/portlist.cc b/portlist.cc
-index 8258853..cd08437 100644
---- a/portlist.cc
-+++ b/portlist.cc
-@@ -480,7 +480,7 @@ void PortList::setPortState(u16 portno, u8 protocol, int state, int *oldstate) {
-       state != PORT_CLOSEDFILTERED)
-     fatal("%s: attempt to add port number %d with illegal state %d\n", __func__, portno, state);
-
--  assert(protocol!=IPPROTO_IP || portno<256);
-+  assert(protocol!=IPPROTO_IP || portno<=MAX_IPPROTONUM);
-
-   bool created = false;
-   current = createPort(portno, protocol, &created);
-@@ -566,7 +566,7 @@ Port *PortList::nextPort(const Port *cur, Port *next,
-   if (cur) {
-     proto = INPROTO2PORTLISTPROTO(cur->proto);
-     assert(port_map[proto]!=NULL); // Hmm, it's not possible to handle port that doesn't have anything in map
--    assert(cur->proto!=IPPROTO_IP || cur->portno<256);
-+    assert(cur->proto!=IPPROTO_IP || cur->portno<=MAX_IPPROTONUM);
-     mapped_pno = port_map[proto][cur->portno];
-     mapped_pno++; //  we're interested in next port after current
-   } else { // running for the first time
-@@ -615,7 +615,7 @@ void PortList::mapPort(u16 *portno, u8 *protocol) const {
-   mapped_protocol = INPROTO2PORTLISTPROTO(*protocol);
-
-   if (*protocol == IPPROTO_IP)
--    assert(*portno < 256);
-+    assert(*portno <= MAX_IPPROTONUM);
-   if(port_map[mapped_protocol]==NULL || port_list[mapped_protocol]==NULL) {
-     fatal("%s(%i,%i): you're trying to access uninitialized protocol", __func__, *portno, *protocol);
-   }
-@@ -713,7 +713,7 @@ int PortList::port_list_count[PORTLIST_PROTO_MAX];
-  * should be sorted. */
- void PortList::initializePortMap(int protocol, u16 *ports, int portcount) {
-   int i;
--  int ports_max = (protocol == IPPROTO_IP) ? 256 : 65536;
-+  int ports_max = (protocol == IPPROTO_IP) ? MAX_IPPROTONUM + 1 : 65536;
-   int proto = INPROTO2PORTLISTPROTO(protocol);
-
-   if (port_map[proto] != NULL || port_map_rev[proto] != NULL)
-diff --git a/protocols.cc b/protocols.cc
-index 76e42c7..85e55e4 100644
---- a/protocols.cc
-+++ b/protocols.cc
-@@ -79,7 +79,7 @@ struct strcmp_comparator {
-
- // IP Protocol number is 8 bits wide
- // protocol_table[IPPROTO_TCP] == {"tcp", 6}
--static struct nprotoent *protocol_table[UCHAR_MAX];
-+static struct nprotoent *protocol_table[MAX_IPPROTONUM + 1];
- // proto_map["tcp"] = {"tcp", 6}
- typedef std::map<const char *, struct nprotoent, strcmp_comparator> ProtoMap;
- static ProtoMap proto_map;
-@@ -119,7 +119,7 @@ static int nmap_protocols_init() {
-     if (*p == '#' || *p == '\0')
-       continue;
-     res = sscanf(line, "%127s %hu", protocolname, &protno);
--    if (res !=2 || protno > UCHAR_MAX) {
-+    if (res !=2 || protno > MAX_IPPROTONUM) {
-       error("Parse error in protocols file %s line %d", filename, lineno);
-       continue;
-     }
-@@ -191,7 +191,7 @@ const struct nprotoent *nmap_getprotbynum(int num) {
-   if (nmap_protocols_init() == -1)
-     return NULL;
-
--  assert(num >= 0 && num < UCHAR_MAX);
-+  assert(num >= 0 && num <= MAX_IPPROTONUM);
-   return protocol_table[num];
- }
-
-diff --git a/protocols.h b/protocols.h
-index 8934284..2de0aa4 100644
---- a/protocols.h
-+++ b/protocols.h
-@@ -79,6 +79,8 @@ int addprotocolsfromservmask(char *mask, u8 *porttbl);
- const struct nprotoent *nmap_getprotbynum(int num);
- const struct nprotoent *nmap_getprotbyname(const char *name);
-
-+#define MAX_IPPROTONUM 255
-+
- #define MAX_IPPROTOSTRLEN 4
- #define IPPROTO2STR(p)		\
-   ((p)==IPPROTO_TCP ? "tcp" :	\
-diff --git a/scan_lists.cc b/scan_lists.cc
-index f02e279..ebe1357 100644
---- a/scan_lists.cc
-+++ b/scan_lists.cc
-@@ -165,7 +165,7 @@ void getpts(const char *origexpr, struct scan_lists *ports) {
-       ports->udp_count++;
-     if (porttbl[i] & SCAN_SCTP_PORT)
-       ports->sctp_count++;
--    if (porttbl[i] & SCAN_PROTOCOLS && i < 256)
-+    if (porttbl[i] & SCAN_PROTOCOLS && i <= MAX_IPPROTONUM)
-       ports->prot_count++;
-   }
-
-@@ -192,7 +192,7 @@ void getpts(const char *origexpr, struct scan_lists *ports) {
-       ports->udp_ports[udpi++] = i;
-     if (porttbl[i] & SCAN_SCTP_PORT)
-       ports->sctp_ports[sctpi++] = i;
--    if (porttbl[i] & SCAN_PROTOCOLS && i < 256)
-+    if (porttbl[i] & SCAN_PROTOCOLS && i <= MAX_IPPROTONUM)
-       ports->prots[proti++] = i;
-   }
-
-@@ -388,7 +388,7 @@ static void getpts_aux(const char *origexpr, int nested, u8 *porttbl, int range_
-     } else if (isdigit((int) (unsigned char) *current_range)) {
-       rangestart = strtol(current_range, &endptr, 10);
-       if (range_type & SCAN_PROTOCOLS) {
--        if (rangestart < 0 || rangestart > 255)
-+        if (rangestart < 0 || rangestart > MAX_IPPROTONUM)
-           fatal("Protocols specified must be between 0 and 255 inclusive");
-       } else {
-         if (rangestart < 0 || rangestart > 65535)
-@@ -429,13 +429,13 @@ static void getpts_aux(const char *origexpr, int nested, u8 *porttbl, int range_
-       if (!*current_range || *current_range == ',' || *current_range == ']') {
-         /* Ended with a -, meaning up until the last possible port */
-         if (range_type & SCAN_PROTOCOLS)
--          rangeend = 255;
-+          rangeend = MAX_IPPROTONUM;
-         else
-           rangeend = 65535;
-       } else if (isdigit((int) (unsigned char) *current_range)) {
-         rangeend = strtol(current_range, &endptr, 10);
-         if (range_type & SCAN_PROTOCOLS) {
--          if (rangeend < 0 || rangeend > 255)
-+          if (rangeend < 0 || rangeend > MAX_IPPROTONUM)
-             fatal("Protocols specified must be between 0 and 255 inclusive");
-         } else {
-           if (rangeend < 0 || rangeend > 65535)
---
-2.34.1
-
diff --git a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
deleted file mode 100644
index 5669ccdf6a..0000000000
--- a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[PATCH] redefine the python library install dir
-
-Upstream-Status: Pending
-
-If install-lib is not defined, it is always /usr/lib/, but it
-maybe /usr/lib64 for multilib
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -383,7 +383,7 @@ build-nping: $(NPINGDIR)/Makefile build-
- 	@cd $(NPINGDIR) && $(MAKE)
-
- install-ndiff:
--	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
-+	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
-
- NSE_FILES = scripts/script.db scripts/*.nse
- NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
