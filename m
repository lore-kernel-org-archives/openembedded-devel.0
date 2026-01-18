Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1B3CA5FEC
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 00:24:00 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6805.1768695838816173795
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 16:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3Rbo/eq;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d5c365ceso24698695ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 16:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768695838; x=1769300638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYaPHIaCu7FRKqgRruSoY1Tt3QoVsARQV9NyTV2rloI=;
        b=S3Rbo/eqBbZ1fGfZRJeiq3JZnbeMkl2q1NnxUABy7GPSH0ZfiFcAT5V4lwjVs7E7z6
         8ZHWcxW0WQo99GbEd+x1IiRc8MrbdNKs25cqzIRJod4O2wWgYgBbJcz2xFIp05RtO6cX
         xy6GOwtYTufH5hDCzXVgMqyQWhq5RQxHmre+QvBpN0lT/4/SXnYTVeEgwGDtOFFWmXWs
         ZyjcbOr4HbHOyLvMr01+NpYIW4TqZCKM10+xSxJXoM+fSiiM55TxmRMcosRaM5WwddWF
         B9ZGvIhENEYM+6Oe4eLKkPoh9qKrZ2fvFzLNxqVqyADhDk29I+kQvKPC9b2W87tIcfzV
         +a6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768695838; x=1769300638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYaPHIaCu7FRKqgRruSoY1Tt3QoVsARQV9NyTV2rloI=;
        b=nGi+FXGJZYUHXZj1X+NgODF0OUdBQsTT8jFOQN4PRKqTz1c1TjZXIw/XNtCfIYxbe6
         IhawV900xhUqGa8RtfN3pRWLngoQUu3WTUBrcvW/0xtf1gsbLNSj+S7WC7e2/pRn0bwJ
         ZfPRRVWwpiHNz0O0WxyXLyp5WwS6NvPzgLSq2locCLvexYbysJImHOUVO7KRRk2vfyVW
         V2diScpAZUDpaUY7X8ozZ2mQrvrJpg6igdeBba+expkXlM6VRcjOCXTH4YCrM7NXiQVa
         LuInHroW0RvRYrRQImHfq9GzN6v7BS7ANk+NsIF8fGF9r2/5d+YkwmazthkUqWvBn7zL
         fTFQ==
X-Gm-Message-State: AOJu0YwcoirXcPY3FEPEMJBFhwFUpdWUpp7mNyW2Zmq9W2MekrPA3z5c
	WR6k3X+yLZekv12o4S5qxW6zCVh8bytfXwODURVcF+eddbcK8+taAePL/IRJiurC
X-Gm-Gg: AY/fxX505zLr93L2gf3sK+ub5vS/W8R05aL3reUZLIG2vzAIEnSY/Ts8r1gsmRsMEVV
	J/8x8rBN7BEpniz4KhboZEfVf+2z2qKaJCurT07R/Eqg/CIu5qnSzH0R52v+s2wGLB9BCf39Owr
	vp40aPH6reDkR5pCXikniJQK6ZuCApN1yls3yiKel0imRE6La3GACrgylXlIK2ZpOd/imRoA24m
	WcRa4ztNIliquqpA30abqKFi1vMRVh1zAm4K8vxbg83tyBP5TzaDFdIKhbsCsWvOXvQv4OBCuFp
	8A3Ulhd31TGYdehwG6WlwenqosciDJg+K4aJGArvnI/x/07WS7Nt6vT7T9ulqsn9DUtVeSOixeC
	vFoJTGzUkauhZWFFn4gmnVGZ4RhXmKKrPuiNL56xlH+q0RImt5V5dDbg2+cgDT5phzHuNRPx3/Q
	0Sy/FUC5vjMpj0aYKpjp5BxA8=
X-Received: by 2002:a17:903:1967:b0:2a0:ccdb:218d with SMTP id d9443c01a7336-2a7188a976bmr75566785ad.17.1768695837648;
        Sat, 17 Jan 2026 16:23:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193da7cfsm55781455ad.61.2026.01.17.16.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 16:23:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/2] frr: patch multiple CVEs
Date: Sun, 18 Jan 2026 13:23:41 +1300
Message-ID: <20260118002341.960289-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118002341.960289-1-ankur.tyagi85@gmail.com>
References: <20260118002341.960289-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 00:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123564

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/CVE-2025-61099
https://nvd.nist.gov/vuln/detail/CVE-2025-61100
https://nvd.nist.gov/vuln/detail/CVE-2025-61101
https://nvd.nist.gov/vuln/detail/CVE-2025-61102
https://nvd.nist.gov/vuln/detail/CVE-2025-61103
https://nvd.nist.gov/vuln/detail/CVE-2025-61104
https://nvd.nist.gov/vuln/detail/CVE-2025-61105
https://nvd.nist.gov/vuln/detail/CVE-2025-61106
https://nvd.nist.gov/vuln/detail/CVE-2025-61107

The PR[1] mentioned in nvd got closed without merge due to unresolved
code review comments but another PR[2] fixed them and changes were merged.

[1] https://github.com/FRRouting/frr/pull/19480
[2] https://github.com/FRRouting/frr/pull/19983

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...1102-61103-61104-61105-61106-61107_1.patch |  37 +++
 ...1102-61103-61104-61105-61106-61107_2.patch | 273 ++++++++++++++++++
 ...1102-61103-61104-61105-61106-61107_3.patch |  78 +++++
 ...1102-61103-61104-61105-61106-61107_4.patch | 119 ++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   4 +
 5 files changed, 511 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch
new file mode 100644
index 0000000000..c51d29058e
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch
@@ -0,0 +1,37 @@
+From c686fcae29ea1ae9ba4ebfa792db79100948eb79 Mon Sep 17 00:00:00 2001
+From: s1awwhy <seawwhy@163.com>
+Date: Sun, 24 Aug 2025 21:17:55 +0800
+Subject: [PATCH] ospfd: Add null check for vty_out in check_tlv_size
+
+Add security check for vty_out. Specifically,  Check NULL for vty. If vty is not available, dump info via zlog.
+
+Signed-off-by: s1awwhy <seawwhy@163.com>
+CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7d9b7aa47627b31e4b50795284408ab6de98660]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ospfd/ospf_ext.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index d82c2146c7..456f163ffa 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1704,11 +1704,15 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
+  * ------------------------------------
+  */
+ 
++/* Check NULL for vty. If vty is not available, dump info via zlog */
+ #define check_tlv_size(size, msg)                                              \
+ 	do {                                                                   \
+ 		if (ntohs(tlvh->length) != size) {                             \
+-			vty_out(vty, "  Wrong %s TLV size: %d(%d). Abort!\n",  \
+-				msg, ntohs(tlvh->length), size);               \
++			if (vty != NULL)                         \
++				vty_out(vty, "  Wrong %s TLV size: %d(%d). Abort!\n",  \
++					msg, ntohs(tlvh->length), size);               \
++			else                                              \
++				zlog_debug("    Wrong %s TLV size: %d(%d). Abort!", msg, ntohs(tlvh->length), size);    \
+ 			return size + TLV_HDR_SIZE;                            \
+ 		}                                                              \
+ 	} while (0)
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch
new file mode 100644
index 0000000000..616dff29c3
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch
@@ -0,0 +1,273 @@
+From e99ada4aca49f34040747c7253e4b2fcd441da8a Mon Sep 17 00:00:00 2001
+From: s1awwhy <seawwhy@163.com>
+Date: Sun, 24 Aug 2025 21:21:23 +0800
+Subject: [PATCH] ospfd: Fix NULL Pointer Deference when dumping link info
+
+When the command debug ospf packet all send/recv detail is enabled in the OSPF
+configuration,  ospfd will dump detailed information of any received or sent
+OSPF packets, either via VTY or through the zlog. However, the original Opaque
+LSA handling code failed to check whether the VTY context and show_opaque_info
+were available, resulting in NULL pointer dereference and crashes in ospfd.
+The patch fixes the Null Pointer Deference Vulnerability in
+show_vty_ext_link_rmt_itf_addr, show_vty_ext_link_adj_sid,
+show_vty_ext_link_lan_adj_sid, show_vty_unknown_tlv,
+show_vty_link_info, show_vty_ext_pref_pref_sid, show_vtY_pref_info.
+Specifically, add NULL check for vty. If vty is not available, dump details
+via zlog.
+
+Signed-off-by: s1awwhy <seawwhy@163.com>
+Signed-off-by: Louis Scalbert <louis.scalbert@6wind.com>
+
+CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/034e6fe67078810b952630055614ee5710d1196e]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ospfd/ospf_ext.c | 184 +++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 130 insertions(+), 54 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index 456f163ffa..4fa9c82c34 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1726,10 +1726,15 @@ static uint16_t show_vty_ext_link_rmt_itf_addr(struct vty *vty,
+ 
+ 	check_tlv_size(EXT_SUBTLV_RMT_ITF_ADDR_SIZE, "Remote Itf. Address");
+ 
+-	vty_out(vty,
+-		"  Remote Interface Address Sub-TLV: Length %u\n	Address: %pI4\n",
+-		ntohs(top->header.length), &top->value);
+-
++	if (vty != NULL) {
++		vty_out(vty,
++			"  Remote Interface Address Sub-TLV: Length %u\n	Address: %pI4\n",
++			ntohs(top->header.length), &top->value);
++	} else {
++		zlog_debug("  Remote Interface Address Sub-TLV: Length %u",
++			   ntohs(top->header.length));
++		zlog_debug("  Address: %pI4", &top->value);
++	}
+ 	return TLV_SIZE(tlvh);
+ }
+ 
+@@ -1745,15 +1750,28 @@ static uint16_t show_vty_ext_link_adj_sid(struct vty *vty,
+ 			      : SID_INDEX_SIZE(EXT_SUBTLV_ADJ_SID_SIZE);
+ 	check_tlv_size(tlv_size, "Adjacency SID");
+ 
+-	vty_out(vty,
+-		"  Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\t%s: %u\n",
+-		ntohs(top->header.length), top->flags, top->mtid, top->weight,
+-		CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
+-								     : "Index",
+-		CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+-			? GET_LABEL(ntohl(top->value))
+-			: ntohl(top->value));
+-
++	/* Add security check for vty_out. If vty is not available, dump info via zlog.*/
++	if (vty != NULL) {
++		vty_out(vty,
++			"  Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\t%s: %u\n",
++			ntohs(top->header.length), top->flags, top->mtid, top->weight,
++			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++									     : "Index",
++			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++				? GET_LABEL(ntohl(top->value))
++				: ntohl(top->value));
++	} else {
++		zlog_debug("  Adj-SID Sub-TLV: Length %u", ntohs(top->header.length));
++		zlog_debug("    Flags: 0x%x", top->flags);
++		zlog_debug("    MT-ID:0x%x", top->mtid);
++		zlog_debug("    Weight: 0x%x", top->weight);
++		zlog_debug("    %s: %u",
++			   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++										: "Index",
++			   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++				   ? GET_LABEL(ntohl(top->value))
++				   : ntohl(top->value));
++	}
+ 	return TLV_SIZE(tlvh);
+ }
+ 
+@@ -1770,31 +1788,53 @@ static uint16_t show_vty_ext_link_lan_adj_sid(struct vty *vty,
+ 			      : SID_INDEX_SIZE(EXT_SUBTLV_LAN_ADJ_SID_SIZE);
+ 	check_tlv_size(tlv_size, "LAN-Adjacency SID");
+ 
+-	vty_out(vty,
+-		"  LAN-Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\tNeighbor ID: %pI4\n\t%s: %u\n",
+-		ntohs(top->header.length), top->flags, top->mtid, top->weight,
+-		&top->neighbor_id,
+-		CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
+-								     : "Index",
+-		CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+-			? GET_LABEL(ntohl(top->value))
+-			: ntohl(top->value));
+-
++	/* Add security check for vty_out. If vty is not available, dump info via zlog. */
++	if (vty != NULL) {
++		vty_out(vty,
++			"  LAN-Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\tNeighbor ID: %pI4\n\t%s: %u\n",
++			ntohs(top->header.length), top->flags, top->mtid, top->weight,
++			&top->neighbor_id,
++			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++											: "Index",
++			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++				? GET_LABEL(ntohl(top->value))
++				: ntohl(top->value));
++	} else {
++		zlog_debug("  LAN-Adj-SID Sub-TLV: Length %u", ntohs(top->header.length));
++		zlog_debug("    Flags: 0x%x", top->flags);
++		zlog_debug("    MT-ID:0x%x", top->mtid);
++		zlog_debug("    Weight: 0x%x", top->weight);
++		zlog_debug("    Neighbor ID: %pI4", &top->neighbor_id);
++		zlog_debug("    %s: %u",
++				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++										: "Index",
++				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++					? GET_LABEL(ntohl(top->value))
++					: ntohl(top->value));
++	}
+ 	return TLV_SIZE(tlvh);
+ }
+ 
+ static uint16_t show_vty_unknown_tlv(struct vty *vty, struct tlv_header *tlvh,
+ 				     size_t buf_size)
+ {
++	/* Add security check for vty_out. If vty is not available, dump info via zlog. */
+ 	if (TLV_SIZE(tlvh) > buf_size) {
+-		vty_out(vty, "    TLV size %d exceeds buffer size. Abort!",
+-			TLV_SIZE(tlvh));
++		if (vty != NULL)
++			vty_out(vty, "    TLV size %d exceeds buffer size. Abort!", TLV_SIZE(tlvh));
++		else
++			zlog_debug("    TLV size %d exceeds buffer size. Abort!", TLV_SIZE(tlvh));
++
+ 		return buf_size;
+ 	}
+ 
+-	vty_out(vty, "    Unknown TLV: [type(0x%x), length(0x%x)]\n",
+-		ntohs(tlvh->type), ntohs(tlvh->length));
+-
++	if (vty != NULL) {
++		vty_out(vty, "    Unknown TLV: [type(0x%x), length(0x%x)]\n",
++			ntohs(tlvh->type), ntohs(tlvh->length));
++	} else {
++		zlog_debug("    Unknown TLV: [type(0x%x), length(0x%x)]",
++				ntohs(tlvh->type), ntohs(tlvh->length));
++	}
+ 	return TLV_SIZE(tlvh);
+ }
+ 
+@@ -1809,18 +1849,30 @@ static uint16_t show_vty_link_info(struct vty *vty, struct tlv_header *ext,
+ 
+ 	/* Verify that TLV length is valid against remaining buffer size */
+ 	if (length > buf_size) {
+-		vty_out(vty,
+-			"  Extended Link TLV size %d exceeds buffer size. Abort!\n",
+-			length);
++		/* Add security check for vty_out. If vty is not available, dump info via zlog. */
++		if (vty != NULL) {
++			vty_out(vty, "  Extended Link TLV size %d exceeds buffer size. Abort!\n",
++				length);
++		} else {
++			zlog_debug("  Extended Link TLV size %d exceeds buffer size. Abort!",
++				   length);
++		}
+ 		return buf_size;
+ 	}
+ 
+-	vty_out(vty,
+-		"  Extended Link TLV: Length %u\n	Link Type: 0x%x\n"
+-		"	Link ID: %pI4\n",
+-		ntohs(top->header.length), top->link_type,
+-		&top->link_id);
+-	vty_out(vty, "	Link data: %pI4\n", &top->link_data);
++	/* Add security check for vty_out. If vty is not available, dump info via zlog. */
++	if (vty != NULL) {
++		vty_out(vty,
++			"  Extended Link TLV: Length %u\n	Link Type: 0x%x\n"
++			"	Link ID: %pI4\n",
++			ntohs(top->header.length), top->link_type, &top->link_id);
++		vty_out(vty, "	Link data: %pI4\n", &top->link_data);
++	} else {
++		zlog_debug("  Extended Link TLV: Length %u", ntohs(top->header.length));
++		zlog_debug("    Link Type: 0x%x", top->link_type);
++		zlog_debug("    Link ID: %pI4", &top->link_id);
++		zlog_debug("    Link data: %pI4", &top->link_data);
++	}
+ 
+ 	/* Skip Extended TLV and parse sub-TLVs */
+ 	length -= EXT_TLV_LINK_SIZE;
+@@ -1886,15 +1938,27 @@ static uint16_t show_vty_ext_pref_pref_sid(struct vty *vty,
+ 			      : SID_INDEX_SIZE(EXT_SUBTLV_PREFIX_SID_SIZE);
+ 	check_tlv_size(tlv_size, "Prefix SID");
+ 
+-	vty_out(vty,
+-		"  Prefix SID Sub-TLV: Length %u\n\tAlgorithm: %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\t%s: %u\n",
+-		ntohs(top->header.length), top->algorithm, top->flags,
+-		top->mtid,
+-		CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
+-								   : "Index",
+-		CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
+-			? GET_LABEL(ntohl(top->value))
+-			: ntohl(top->value));
++	if (vty != NULL) {
++		vty_out(vty,
++			"  Prefix SID Sub-TLV: Length %u\n\tAlgorithm: %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\t%s: %u\n",
++			ntohs(top->header.length), top->algorithm, top->flags, top->mtid,
++			CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
++									   : "Index",
++			CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
++				? GET_LABEL(ntohl(top->value))
++				: ntohl(top->value));
++	} else {
++		zlog_debug("  Prefix SID Sub-TLV: Length %u", ntohs(top->header.length));
++		zlog_debug("    Algorithm: %u", top->algorithm);
++		zlog_debug("    Flags: 0x%x", top->flags);
++		zlog_debug("    MT-ID:0x%x", top->mtid);
++		zlog_debug("    %s: %u",
++			   CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
++										  : "Index",
++			   CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
++				   ? GET_LABEL(ntohl(top->value))
++				   : ntohl(top->value));
++	}
+ 
+ 	return TLV_SIZE(tlvh);
+ }
+@@ -1910,17 +1974,29 @@ static uint16_t show_vty_pref_info(struct vty *vty, struct tlv_header *ext,
+ 
+ 	/* Verify that TLV length is valid against remaining buffer size */
+ 	if (length > buf_size) {
+-		vty_out(vty,
+-			"  Extended Link TLV size %d exceeds buffer size. Abort!\n",
+-			length);
++		if (vty != NULL) {
++			vty_out(vty, "  Extended Link TLV size %d exceeds buffer size. Abort!\n",
++				length);
++		} else {
++			zlog_debug("  Extended Link TLV size %d exceeds buffer size. Abort!",
++				   length);
++		}
+ 		return buf_size;
+ 	}
+ 
+-	vty_out(vty,
+-		"  Extended Prefix TLV: Length %u\n\tRoute Type: %u\n"
+-		"\tAddress Family: 0x%x\n\tFlags: 0x%x\n\tAddress: %pI4/%u\n",
+-		ntohs(top->header.length), top->route_type, top->af, top->flags,
+-		&top->address, top->pref_length);
++	if (vty != NULL) {
++		vty_out(vty,
++			"  Extended Prefix TLV: Length %u\n\tRoute Type: %u\n"
++			"\tAddress Family: 0x%x\n\tFlags: 0x%x\n\tAddress: %pI4/%u\n",
++			ntohs(top->header.length), top->route_type, top->af, top->flags,
++			&top->address, top->pref_length);
++	} else {
++		zlog_debug("  Extended Prefix TLV: Length %u", ntohs(top->header.length));
++		zlog_debug("    Route Type: %u", top->route_type);
++		zlog_debug("    Address Family: 0x%x", top->af);
++		zlog_debug("    Flags: 0x%x", top->flags);
++		zlog_debug("    Address: %pI4/%u", &top->address, top->pref_length);
++	}
+ 
+ 	/* Skip Extended Prefix TLV and parse sub-TLVs */
+ 	length -= EXT_TLV_PREFIX_SIZE;
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch
new file mode 100644
index 0000000000..c184ac2059
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch
@@ -0,0 +1,78 @@
+From 3b643cde27e33b98037e97a76c0f80447d2a9110 Mon Sep 17 00:00:00 2001
+From: Louis Scalbert <louis.scalbert@6wind.com>
+Date: Tue, 6 Jan 2026 15:32:32 +0100
+Subject: [PATCH] ospfd: skip subsequent tlvs after invalid length
+
+Do not attempt to read subsequent TLVs after an TLV invalid length is
+detected.
+
+Signed-off-by: Louis Scalbert <louis.scalbert@6wind.com>
+
+CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/33dfc7e7be1ac8b66abbf47c30a709215fbc1926]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ospfd/ospf_ext.c | 6 +++---
+ ospfd/ospf_ri.c  | 6 +++---
+ ospfd/ospf_te.c  | 6 +++---
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index 4fa9c82c34..1aa4f579e4 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1709,11 +1709,11 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
+ 	do {                                                                   \
+ 		if (ntohs(tlvh->length) != size) {                             \
+ 			if (vty != NULL)                         \
+-				vty_out(vty, "  Wrong %s TLV size: %d(%d). Abort!\n",  \
++				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
+ 					msg, ntohs(tlvh->length), size);               \
+ 			else                                              \
+-				zlog_debug("    Wrong %s TLV size: %d(%d). Abort!", msg, ntohs(tlvh->length), size);    \
+-			return size + TLV_HDR_SIZE;                            \
++				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!", msg, ntohs(tlvh->length), size);    \
++			return OSPF_MAX_LSA_SIZE + 1;                            \
+ 		}                                                              \
+ 	} while (0)
+ 
+diff --git a/ospfd/ospf_ri.c b/ospfd/ospf_ri.c
+index 80e7f59312..ec9c55645e 100644
+--- a/ospfd/ospf_ri.c
++++ b/ospfd/ospf_ri.c
+@@ -1206,12 +1206,12 @@ static int ospf_router_info_lsa_update(struct ospf_lsa *lsa)
+ 	do {                                                                   \
+ 		if (ntohs(tlvh->length) > size) {                              \
+ 			if (vty != NULL)                                       \
+-				vty_out(vty, "  Wrong %s TLV size: %d(%d)\n",  \
++				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
+ 					msg, ntohs(tlvh->length), size);       \
+ 			else                                                   \
+-				zlog_debug("    Wrong %s TLV size: %d(%d)",    \
++				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!",    \
+ 					   msg, ntohs(tlvh->length), size);    \
+-			return size + TLV_HDR_SIZE;                            \
++			return OSPF_MAX_LSA_SIZE + 1;                            \
+ 		}                                                              \
+ 	} while (0)
+ 
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 844b28d264..d354015914 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -3189,12 +3189,12 @@ static void ospf_te_init_ted(struct ls_ted *ted, struct ospf *ospf)
+ 	do {                                                                   \
+ 		if (ntohs(tlvh->length) > size) {                              \
+ 			if (vty != NULL)                                       \
+-				vty_out(vty, "  Wrong %s TLV size: %d(%d)\n",  \
++				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
+ 					msg, ntohs(tlvh->length), size);       \
+ 			else                                                   \
+-				zlog_debug("    Wrong %s TLV size: %d(%d)",    \
++				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!",    \
+ 					   msg, ntohs(tlvh->length), size);    \
+-			return size + TLV_HDR_SIZE;                            \
++			return OSPF_MAX_LSA_SIZE + 1;                            \
+ 		}                                                              \
+ 	} while (0)
+ 
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch
new file mode 100644
index 0000000000..cdd167af0d
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch
@@ -0,0 +1,119 @@
+From 50de73f57e84007fd01517b414d0987c84d132bb Mon Sep 17 00:00:00 2001
+From: Louis Scalbert <louis.scalbert@6wind.com>
+Date: Tue, 6 Jan 2026 15:39:37 +0100
+Subject: [PATCH] ospfd: reformat check_tlv_size macro
+
+to make frr-bot happy
+
+Signed-off-by: Louis Scalbert <louis.scalbert@6wind.com>
+
+CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/4e59658233746215a16358603ab0d98b589ba16b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ospfd/ospf_ext.c | 22 ++++++++++++----------
+ ospfd/ospf_ri.c  | 23 ++++++++++++-----------
+ ospfd/ospf_te.c  | 23 ++++++++++++-----------
+ 3 files changed, 36 insertions(+), 32 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index 1aa4f579e4..0ab5cc527d 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1705,16 +1705,18 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
+  */
+ 
+ /* Check NULL for vty. If vty is not available, dump info via zlog */
+-#define check_tlv_size(size, msg)                                              \
+-	do {                                                                   \
+-		if (ntohs(tlvh->length) != size) {                             \
+-			if (vty != NULL)                         \
+-				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
+-					msg, ntohs(tlvh->length), size);               \
+-			else                                              \
+-				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!", msg, ntohs(tlvh->length), size);    \
+-			return OSPF_MAX_LSA_SIZE + 1;                            \
+-		}                                                              \
++#define check_tlv_size(size, msg)                                                                           \
++	do {                                                                                                \
++		if (ntohs(tlvh->length) != size) {                                                          \
++			if (vty != NULL)                                                                    \
++				vty_out(vty,                                                                \
++					"  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",    \
++					msg, ntohs(tlvh->length), size);                                    \
++			else                                                                                \
++				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!", \
++					   msg, ntohs(tlvh->length), size);                                 \
++			return OSPF_MAX_LSA_SIZE + 1;                                                       \
++		}                                                                                           \
+ 	} while (0)
+ 
+ /* Cisco experimental SubTLV */
+diff --git a/ospfd/ospf_ri.c b/ospfd/ospf_ri.c
+index ec9c55645e..c9c3c251f5 100644
+--- a/ospfd/ospf_ri.c
++++ b/ospfd/ospf_ri.c
+@@ -1202,17 +1202,18 @@ static int ospf_router_info_lsa_update(struct ospf_lsa *lsa)
+  * Following are vty session control functions.
+  *------------------------------------------------------------------------*/
+ 
+-#define check_tlv_size(size, msg)                                              \
+-	do {                                                                   \
+-		if (ntohs(tlvh->length) > size) {                              \
+-			if (vty != NULL)                                       \
+-				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
+-					msg, ntohs(tlvh->length), size);       \
+-			else                                                   \
+-				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!",    \
+-					   msg, ntohs(tlvh->length), size);    \
+-			return OSPF_MAX_LSA_SIZE + 1;                            \
+-		}                                                              \
++#define check_tlv_size(size, msg)                                                                           \
++	do {                                                                                                \
++		if (ntohs(tlvh->length) > size) {                                                           \
++			if (vty != NULL)                                                                    \
++				vty_out(vty,                                                                \
++					"  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",    \
++					msg, ntohs(tlvh->length), size);                                    \
++			else                                                                                \
++				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!", \
++					   msg, ntohs(tlvh->length), size);                                 \
++			return OSPF_MAX_LSA_SIZE + 1;                                                       \
++		}                                                                                           \
+ 	} while (0)
+ 
+ static uint16_t show_vty_router_cap(struct vty *vty, struct tlv_header *tlvh)
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index d354015914..1bddf97bde 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -3185,17 +3185,18 @@ static void ospf_te_init_ted(struct ls_ted *ted, struct ospf *ospf)
+ /*------------------------------------------------------------------------*
+  * Following are vty session control functions.
+  *------------------------------------------------------------------------*/
+-#define check_tlv_size(size, msg)                                              \
+-	do {                                                                   \
+-		if (ntohs(tlvh->length) > size) {                              \
+-			if (vty != NULL)                                       \
+-				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
+-					msg, ntohs(tlvh->length), size);       \
+-			else                                                   \
+-				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!",    \
+-					   msg, ntohs(tlvh->length), size);    \
+-			return OSPF_MAX_LSA_SIZE + 1;                            \
+-		}                                                              \
++#define check_tlv_size(size, msg)                                                                           \
++	do {                                                                                                \
++		if (ntohs(tlvh->length) > size) {                                                           \
++			if (vty != NULL)                                                                    \
++				vty_out(vty,                                                                \
++					"  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",    \
++					msg, ntohs(tlvh->length), size);                                    \
++			else                                                                                \
++				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!", \
++					   msg, ntohs(tlvh->length), size);                                 \
++			return OSPF_MAX_LSA_SIZE + 1;                                                       \
++		}                                                                                           \
+ 	} while (0)
+ 
+ static uint16_t show_vty_router_addr(struct vty *vty, struct tlv_header *tlvh)
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
index f75ce20ab3..0287a6fb69 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
@@ -14,6 +14,10 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
            file://CVE-2024-55553.patch \
+           file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch \
+           file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch \
+           file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch \
+           file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch \
            "
 
 SRCREV = "ad1766d17be022587fe05ebe1a7bf10e1b7dce19"

