Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BC9D715C1
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14201.1769236210661296648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LkteCGtI;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48058548779so259275e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236209; x=1769841009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdUIkoIpGpnT6CzjVT9dgH0Y5NhaXu/o3hkSsA7dRRU=;
        b=LkteCGtIJO//Ef2hrb1uWttSpjmrLl1K9R2vpfxna7GMGUbkpDvwqoHfuTto/pbpH8
         3gZCeGwdoDAj1OheNx7JNMDBQx2dLiQgKacngcCTR5Xvd7m7PCGh2Nibs8IBPsCCPtZ1
         o5rTPvnOtHAOI0CEjCIcFusJ9OuuM4ULj4q4qOtmR43UgkrS2fTCS3t6z2sKwOEnqAUj
         9l2xX9/wNY5KfSyZUIhpZgBXJ1MeVtB2Kd2MSPBnfs3CCeD27JSId+Q0rkfGL5CNadkJ
         kXtV56DVTVIl3pXpKMnGrYHLbkoEJUd0xoWKr9tWPRNtLClYQWlou9PYgfH2TLdYyVvr
         K7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236209; x=1769841009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdUIkoIpGpnT6CzjVT9dgH0Y5NhaXu/o3hkSsA7dRRU=;
        b=YGvXgXwbsloMk6HJJsPK1sUkMGrdGoRZy+4Uk85Atv1Mc1eE7rHPabVva48hx2Lh09
         /CiiimLoCGYasaEnGveYDGK7Qq2QwOkxfk7bPKMKr/GAf6eTbaSOvzeuYjV01j8SbxAm
         wDvEINMcYPOq4vLDcGLFOG375xU9PhUfQqkIl+bb2NmpS+qgaenka3LbwD7LlLFVzjP2
         5DVYHmRfvsww8VSjvn9hWdFh6OrhE5PZHtX1sgvBWVTUOspumHglUsSj6giwrv6ATSFd
         s7mjCmhaO2APhLtL3KwT5BD1FOkbCIPLFvhwBvz1o8Cjxp3KPf8e9fjH0aH12eS2y6vz
         W7jQ==
X-Gm-Message-State: AOJu0YyxJAZWTdrTU9YK3j/rV91e4w4wCNVJ578DbXSMlu82jIrML5Ty
	+lgKhmLflteHTCDQ5JEKUSgjHkX+NzEac2QFVGiTYZ4qs5eayufqVlLrZjWoYg==
X-Gm-Gg: AZuq6aJkU+klL5DxSc9Kb68dxUARgRrkw4C5OOWBy4bnULZM2PHqol8NiAZAnvF3CP3
	dbNHMTA6+XK2CFyemufji7O+Cs2s6nYH4xnLGfEbdVvReluMjaF3asm2mg3CEZaYAdWXADqJI6t
	QNiIcKQLy1RGkjzSpejlWDO0f0Jg/jAatTTBTJ0xnJVfhOnNOfx11NNYNtTnetE0W9gDuCB4aGz
	bg1jyb2LBJETX1eaZeOOvQ/dH4rvVXBq4TMQsHbOWZSNwPCuh1+pju6UnkCmwaBl/Aq+9t6NwiA
	qILs8X/oyUGDDOUx21ErhAFGqv8qa6XqZPr2/dUGyW+0fgMTI/2ydDRnuA6Ay73xprKpWtATIkS
	/URnALiFJ+3nqK3cJ9+K6M48eLCU0VwDawJSpCWfMxr/i8f2A75cApFu8ArYvDIo3WZEzTb0C08
	Zm6sVIvUj6bGeuGcBEXmQ=
X-Received: by 2002:a05:600c:6095:b0:480:39ad:3b7c with SMTP id 5b1f17b1804b1-4804c9624f5mr97136535e9.16.1769236208409;
        Fri, 23 Jan 2026 22:30:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 01/13] frr: patch CVE-2025-61099..61107
Date: Sat, 24 Jan 2026 07:29:55 +0100
Message-ID: <20260124063007.28313-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123808

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

The NVD advisory refernces a PR[1] that contains only an unfinished, and
ultimately unmerged attempt at the fixes. The actual solution comes from
a different PR[2]. These patches are 3 commits from that PR. The last
commit wasn't backported, because it is just code formatting.

[1]: https://github.com/FRRouting/frr/pull/19480
[2]: https://github.com/FRRouting/frr/pull/19983

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3cd47f72ad8d3889e2ef44c63ce6414cb1a9964d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../frr/frr/CVE-2025-61099-61107-1.patch      |  40 +++
 .../frr/frr/CVE-2025-61099-61107-2.patch      |  80 +++++
 .../frr/frr/CVE-2025-61099-61107-3.patch      | 293 ++++++++++++++++++
 .../recipes-protocols/frr/frr_10.4.2.bb       |   3 +
 4 files changed, 416 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
new file mode 100644
index 0000000000..a1e1246cce
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
@@ -0,0 +1,40 @@
+From e21276d430663fd8312940bb3b0ce081957e3d85 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 24 Aug 2025 21:17:55 +0800
+Subject: [PATCH] ospfd: Add null check for vty_out in check_tlv_size
+
+From: s1awwhy <seawwhy@163.com>
+
+Add security check for vty_out. Specifically,  Check NULL for vty. If vty is not available, dump info via zlog.
+
+Signed-off-by: s1awwhy <seawwhy@163.com>
+
+CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7d9b7aa47627b31e4b50795284408ab6de98660]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ospfd/ospf_ext.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index df0b3b9081..8ca0df3200 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1705,11 +1705,15 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
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
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
new file mode 100644
index 0000000000..eacada0ec4
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
@@ -0,0 +1,80 @@
+From d9ed123b814dad7cf4b069de5601c9f279596191 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 6 Jan 2026 15:32:32 +0100
+Subject: [PATCH] ospfd: skip subsequent tlvs after invalid length
+
+From: Louis Scalbert <louis.scalbert@6wind.com>
+
+Do not attempt to read subsequent TLVs after an TLV invalid length is
+detected.
+
+Signed-off-by: Louis Scalbert <louis.scalbert@6wind.com>
+
+CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/33dfc7e7be1ac8b66abbf47c30a709215fbc1926]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ospfd/ospf_ext.c | 6 +++---
+ ospfd/ospf_ri.c  | 6 +++---
+ ospfd/ospf_te.c  | 6 +++---
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index 8ca0df3200..62b0020148 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1710,11 +1710,11 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
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
+index 76e6efeb83..7934b25451 100644
+--- a/ospfd/ospf_ri.c
++++ b/ospfd/ospf_ri.c
+@@ -1208,12 +1208,12 @@ static int ospf_router_info_lsa_update(struct ospf_lsa *lsa)
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
+index d187485b9f..850a7039f1 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -3161,12 +3161,12 @@ static void ospf_te_init_ted(struct ls_ted *ted, struct ospf *ospf)
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
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch
new file mode 100644
index 0000000000..7b983198f5
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch
@@ -0,0 +1,293 @@
+From 2d02bca97251ee53fb10b4c34c8cda0e20ae8b8e Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 24 Aug 2025 21:21:23 +0800
+Subject: [PATCH] ospfd: Fix NULL Pointer Deference when dumping link info
+
+From: s1awwhy <seawwhy@163.com>
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
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ospfd/ospf_ext.c | 200 ++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 138 insertions(+), 62 deletions(-)
+
+diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
+index 62b0020148..c1fcd632e0 100644
+--- a/ospfd/ospf_ext.c
++++ b/ospfd/ospf_ext.c
+@@ -1729,9 +1729,15 @@ static uint16_t show_vty_ext_link_rmt_itf_addr(struct vty *vty,
+ 	check_tlv_size(EXT_SUBTLV_RMT_ITF_ADDR_SIZE, "Remote Itf. Address");
+ 
+ 	if (!json)
+-		vty_out(vty,
+-			"  Remote Interface Address Sub-TLV: Length %u\n	Address: %pI4\n",
+-			ntohs(top->header.length), &top->value);
++		if (vty != NULL) {
++			vty_out(vty,
++				"  Remote Interface Address Sub-TLV: Length %u\n	Address: %pI4\n",
++				ntohs(top->header.length), &top->value);
++		} else {
++			zlog_debug("  Remote Interface Address Sub-TLV: Length %u",
++				   ntohs(top->header.length));
++			zlog_debug("  Address: %pI4", &top->value);
++		}
+ 	else
+ 		json_object_string_addf(json, "remoteInterfaceAddress", "%pI4",
+ 					&top->value);
+@@ -1752,18 +1758,30 @@ static uint16_t show_vty_ext_link_adj_sid(struct vty *vty,
+ 			      : SID_INDEX_SIZE(EXT_SUBTLV_ADJ_SID_SIZE);
+ 	check_tlv_size(tlv_size, "Adjacency SID");
+ 
+-	if (!json)
+-		vty_out(vty,
+-			"  Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\t%s: %u\n",
+-			ntohs(top->header.length), top->flags, top->mtid,
+-			top->weight,
+-			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+-				? "Label"
+-				: "Index",
+-			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+-				? GET_LABEL(ntohl(top->value))
+-				: ntohl(top->value));
+-	else {
++	if (!json) {
++		/* Add security check for vty_out. If vty is not available, dump info via zlog.*/
++		if (vty != NULL)
++			vty_out(vty,
++				"  Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\t%s: %u\n",
++				ntohs(top->header.length), top->flags, top->mtid, top->weight,
++				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++										     : "Index",
++				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++					? GET_LABEL(ntohl(top->value))
++					: ntohl(top->value));
++		else {
++			zlog_debug("  Adj-SID Sub-TLV: Length %u", ntohs(top->header.length));
++			zlog_debug("    Flags: 0x%x", top->flags);
++			zlog_debug("    MT-ID:0x%x", top->mtid);
++			zlog_debug("    Weight: 0x%x", top->weight);
++			zlog_debug("    %s: %u",
++				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++											: "Index",
++				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++					   ? GET_LABEL(ntohl(top->value))
++					   : ntohl(top->value));
++		}
++	} else {
+ 		json_object_string_addf(json, "flags", "0x%x", top->flags);
+ 		json_object_string_addf(json, "mtID", "0x%x", top->mtid);
+ 		json_object_string_addf(json, "weight", "0x%x", top->weight);
+@@ -1791,18 +1809,32 @@ static uint16_t show_vty_ext_link_lan_adj_sid(struct vty *vty,
+ 			      : SID_INDEX_SIZE(EXT_SUBTLV_LAN_ADJ_SID_SIZE);
+ 	check_tlv_size(tlv_size, "LAN-Adjacency SID");
+ 
+-	if (!json)
+-		vty_out(vty,
+-			"  LAN-Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\tNeighbor ID: %pI4\n\t%s: %u\n",
+-			ntohs(top->header.length), top->flags, top->mtid,
+-			top->weight, &top->neighbor_id,
+-			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+-				? "Label"
+-				: "Index",
+-			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+-				? GET_LABEL(ntohl(top->value))
+-				: ntohl(top->value));
+-	else {
++	if (!json) {
++		/* Add security check for vty_out. If vty is not available, dump info via zlog. */
++		if (vty != NULL) {
++			vty_out(vty,
++				"  LAN-Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\tNeighbor ID: %pI4\n\t%s: %u\n",
++				ntohs(top->header.length), top->flags, top->mtid, top->weight,
++				&top->neighbor_id,
++				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++										     : "Index",
++				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++					? GET_LABEL(ntohl(top->value))
++					: ntohl(top->value));
++		} else {
++			zlog_debug("  LAN-Adj-SID Sub-TLV: Length %u", ntohs(top->header.length));
++			zlog_debug("    Flags: 0x%x", top->flags);
++			zlog_debug("    MT-ID:0x%x", top->mtid);
++			zlog_debug("    Weight: 0x%x", top->weight);
++			zlog_debug("    Neighbor ID: %pI4", &top->neighbor_id);
++			zlog_debug("    %s: %u",
++				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
++											: "Index",
++				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
++					   ? GET_LABEL(ntohl(top->value))
++					   : ntohl(top->value));
++		}
++	} else {
+ 		json_object_string_addf(json, "flags", "0x%x", top->flags);
+ 		json_object_string_addf(json, "mtID", "0x%x", top->mtid);
+ 		json_object_string_addf(json, "weight", "0x%x", top->weight);
+@@ -1823,14 +1855,23 @@ static uint16_t show_vty_unknown_tlv(struct vty *vty, struct tlv_header *tlvh,
+ {
+ 	json_object *obj;
+ 
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
+ 	if (!json)
+-		vty_out(vty, "    Unknown TLV: [type(0x%x), length(0x%x)]\n",
+-			ntohs(tlvh->type), ntohs(tlvh->length));
++		if (vty != NULL) {
++			vty_out(vty, "    Unknown TLV: [type(0x%x), length(0x%x)]\n",
++				ntohs(tlvh->type), ntohs(tlvh->length));
++		} else {
++			zlog_debug("    Unknown TLV: [type(0x%x), length(0x%x)]",
++				   ntohs(tlvh->type), ntohs(tlvh->length));
++		}
+ 	else {
+ 		obj = json_object_new_object();
+ 		json_object_string_addf(obj, "type", "0x%x",
+@@ -1855,19 +1896,31 @@ static uint16_t show_vty_link_info(struct vty *vty, struct tlv_header *ext,
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
+ 	if (!json) {
+-		vty_out(vty,
+-			"  Extended Link TLV: Length %u\n	Link Type: 0x%x\n"
+-			"	Link ID: %pI4\n",
+-			ntohs(top->header.length), top->link_type,
+-			&top->link_id);
+-		vty_out(vty, "	Link data: %pI4\n", &top->link_data);
++		/* Add security check for vty_out. If vty is not available, dump info via zlog. */
++		if (vty != NULL) {
++			vty_out(vty,
++				"  Extended Link TLV: Length %u\n	Link Type: 0x%x\n"
++				"	Link ID: %pI4\n",
++				ntohs(top->header.length), top->link_type, &top->link_id);
++			vty_out(vty, "	Link data: %pI4\n", &top->link_data);
++		} else {
++			zlog_debug("  Extended Link TLV: Length %u", ntohs(top->header.length));
++			zlog_debug("    Link Type: 0x%x", top->link_type);
++			zlog_debug("    Link ID: %pI4", &top->link_id);
++			zlog_debug("    Link data: %pI4", &top->link_data);
++		}
+ 	} else {
+ 		json_object_string_addf(json, "linkType", "0x%x",
+ 					top->link_type);
+@@ -1959,18 +2012,29 @@ static uint16_t show_vty_ext_pref_pref_sid(struct vty *vty,
+ 			      : SID_INDEX_SIZE(EXT_SUBTLV_PREFIX_SID_SIZE);
+ 	check_tlv_size(tlv_size, "Prefix SID");
+ 
+-	if (!json)
+-		vty_out(vty,
+-			"  Prefix SID Sub-TLV: Length %u\n\tAlgorithm: %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\t%s: %u\n",
+-			ntohs(top->header.length), top->algorithm, top->flags,
+-			top->mtid,
+-			CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
+-				? "Label"
+-				: "Index",
+-			CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
+-				? GET_LABEL(ntohl(top->value))
+-				: ntohl(top->value));
+-	else {
++	if (!json) {
++		if (vty != NULL) {
++			vty_out(vty,
++				"  Prefix SID Sub-TLV: Length %u\n\tAlgorithm: %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\t%s: %u\n",
++				ntohs(top->header.length), top->algorithm, top->flags, top->mtid,
++				CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
++										   : "Index",
++				CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
++					? GET_LABEL(ntohl(top->value))
++					: ntohl(top->value));
++		} else {
++			zlog_debug("  Prefix SID Sub-TLV: Length %u", ntohs(top->header.length));
++			zlog_debug("    Algorithm: %u", top->algorithm);
++			zlog_debug("    Flags: 0x%x", top->flags);
++			zlog_debug("    MT-ID:0x%x", top->mtid);
++			zlog_debug("    %s: %u",
++				   CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
++										      : "Index",
++				   CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
++					   ? GET_LABEL(ntohl(top->value))
++					   : ntohl(top->value));
++		}
++	} else {
+ 		json_object_int_add(json, "algorithm", top->algorithm);
+ 		json_object_string_addf(json, "flags", "0x%x", top->flags);
+ 		json_object_string_addf(json, "mtID", "0x%x", top->mtid);
+@@ -1995,19 +2059,31 @@ static uint16_t show_vty_pref_info(struct vty *vty, struct tlv_header *ext,
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
+-	if (!json)
+-		vty_out(vty,
+-			"  Extended Prefix TLV: Length %u\n\tRoute Type: %u\n"
+-			"\tAddress Family: 0x%x\n\tFlags: 0x%x\n\tAddress: %pI4/%u\n",
+-			ntohs(top->header.length), top->route_type, top->af,
+-			top->flags, &top->address, top->pref_length);
+-	else {
++	if (!json) {
++		if (vty != NULL) {
++			vty_out(vty,
++				"  Extended Prefix TLV: Length %u\n\tRoute Type: %u\n"
++				"\tAddress Family: 0x%x\n\tFlags: 0x%x\n\tAddress: %pI4/%u\n",
++				ntohs(top->header.length), top->route_type, top->af, top->flags,
++				&top->address, top->pref_length);
++		} else {
++			zlog_debug("  Extended Prefix TLV: Length %u", ntohs(top->header.length));
++			zlog_debug("    Route Type: %u", top->route_type);
++			zlog_debug("    Address Family: 0x%x", top->af);
++			zlog_debug("    Flags: 0x%x", top->flags);
++			zlog_debug("    Address: %pI4/%u", &top->address, top->pref_length);
++		}
++	} else {
+ 		json_object_int_add(json, "routeType", top->route_type);
+ 		json_object_string_addf(json, "addressFamily", "0x%x", top->af);
+ 		json_object_string_addf(json, "flags", "0x%x", top->flags);
diff --git a/meta-networking/recipes-protocols/frr/frr_10.4.2.bb b/meta-networking/recipes-protocols/frr/frr_10.4.2.bb
index a0a42859f7..a246b3459f 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.4.2.bb
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.4;tag=frr-${PV} \
            file://frr.pam \
+           file://CVE-2025-61099-61107-1.patch \
+           file://CVE-2025-61099-61107-2.patch \
+           file://CVE-2025-61099-61107-3.patch \
            "
 
 SRCREV = "642f65b9e5853c7207982a9cf8275732737d4e44"

