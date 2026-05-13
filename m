Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A117CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:06:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.723.1778648705174014071
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UgCfF5J9;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-367c26471f5so3001555a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648704; x=1779253504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYb7oOUhp5pdVPzLrI3Wt7BH4MssxcXIRedqxSVD+C4=;
        b=UgCfF5J9BxkJK6Lelvzy1L+XIsetrshdOgiD4qm9imi/f7BZxaKnWyBipVT9OXBUxV
         zW8IGOmslQhTEIF9sVhv1JxV9Wj6ibxi6XS8uJq0rx9bZwxxVmWchrL+WzUQjAFzuzlK
         QW8PVsYNQc1Qd5H/d1HjQRoacETQhjJM9LQyQX2CsOeLZ4m7Ct1rzoFQkC+K6b4D3ji/
         nGEOeCle6XzihRSt8Zf/HESzKicPT3J84/TmsQwN7jQQu1vrXSKSe877q2pjiddY8KL7
         rPciMtwrVihuIE2YwtV+fIKvfyIVWBeHthqIPpzJ192FtmWGV8RfNMyueB8ijrfLL9S3
         ICpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648704; x=1779253504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYb7oOUhp5pdVPzLrI3Wt7BH4MssxcXIRedqxSVD+C4=;
        b=s0Autf4GN3rinL0qO61wyVaNzby05JKIXiL2CcY0fDggCIMqahGgClroDMPaptuXGp
         L5D/9ZB+uTLRez6nPBBI0sjx27Z4C5tUtNCTUyYVsTgmmDstNVXTetIJeqesIVFhefLP
         CgAV4ftKFPg3BoiwFQCFEw8L22v+x92gZ5IIL1QejLD9LEAvxQWL/RKYYDlnKhqtoDia
         GtSny9Pn0bPl7CAN7HYnLq5SJHiTXQSq6BnHLVCPL4QZS98bGCWN2GAGG/3nyoUr5dxJ
         kNOV6QV+Kz7xvKasXnc2IWKggyjPKS7vWpmWI2+D1qv7srD3BiOmIrtQ6qtkDAzvLmo+
         H/ww==
X-Gm-Message-State: AOJu0YwfAoRPZO7IA8m/JPG9lCKu2lcWVSQeHRC9OuYuJziLmkqDvEsr
	Ve90E35RAsUPUZrnXDQbi9YQxNi0TWG65GzTXuIEtnvR8A5gYz0buisDKeDUovc6
X-Gm-Gg: Acq92OEFKfskZQQwgH4r6R8QLRPRpDMrN3Ds4WFYnWxrx1RuTE42bnONt3pDO/f4GXG
	8Tju8g3GGrRDHUOxq83BZvLmHmnnZUF9FnSKqRac6wmdFTu4PoKjFsNSEs9NrUoXaEKRTp0G8Qc
	4vi8OCHEkl749UYze5sFZKHmnYmUX5iEVw6pZ2/DJY2yefWSDhpfcom1KT0zaAhzang1op5hOVE
	/IyLlwEM5e0p3dh3gLCbmjpRbKNG6rcAx2Pdyr+bJNwr89Um5a7B2VFJk+sc0EIznDkq06NAGQf
	m/fIsR79v2AYUtTfMpn1YxcA32/v17MuRZlJQSl9XjFb3JM0hwGRel4JZpaA5KN6qgtN1IiQiKN
	YMp1E+aR1S9ed6WOMlVvocEoZKdv01JA7rYss91hRKjS3piAU/dSKNsNd9aE1Sz23xKaKAwG94K
	0aAlw5ZjOz9sm4wudxCbj4LYB3qG9vg+oY7CQe
X-Received: by 2002:a17:90a:51a1:b0:369:971:4888 with SMTP id 98e67ed59e1d1-36909714b3bmr33119a91.15.1778648704458;
        Tue, 12 May 2026 22:05:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:05:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/8] frr: patch CVE-2026-28532
Date: Wed, 13 May 2026 17:04:45 +1200
Message-ID: <20260513050450.3515182-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126947

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-28532

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../frr/frr/CVE-2026-28532.patch              | 309 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
 2 files changed, 310 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2026-28532.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2026-28532.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2026-28532.patch
new file mode 100644
index 0000000000..39f5f569de
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2026-28532.patch
@@ -0,0 +1,309 @@
+From ea6982fe2ae7db40b0ea0ec42c283eb3b3178798 Mon Sep 17 00:00:00 2001
+From: Jafar Al-Gharaibeh <jafar@atcorp.com>
+Date: Wed, 4 Mar 2026 12:38:46 -0600
+Subject: [PATCH] ospfd: harden TE/SR TLV iteration against malformed lengths
+
+Use 32-bit counters and per-iteration TLV size bounds checks
+in OSPF TE/SR TLV parsers so malformed opaque LSAs cannot wrap
+loop accounting and advance pointers beyond the LSA buffer.
+
+- Change loop accumulators from 16-bit to 32-bit (uint32_t) to
+  prevent wraparound
+- Rework TLV iteration so pointer advancement is controlled in-loop
+- Add per-iteration guard before advancing:
+  - `tlv_size <= (len - sum)` (or `length - sum`)
+- On malformed size, parser now logs and exits/breaks the loop
+  safely instead of stepping past buffer limits
+
+Signed-off-by: Jafar Al-Gharaibeh <jafar@atcorp.com>
+(cherry picked from commit d3e8aedb87671f38db59b0df908e25e1d4af027d)
+
+CVE: CVE-2026-28532
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/d3e8aedb87671f38db59b0df908e25e1d4af027d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ospfd/ospf_sr.c | 50 ++++++++++++++++++++++++++++++--------
+ ospfd/ospf_te.c | 64 +++++++++++++++++++++++++++++++++++++++----------
+ 2 files changed, 91 insertions(+), 23 deletions(-)
+
+diff --git a/ospfd/ospf_sr.c b/ospfd/ospf_sr.c
+index e26fe6f53a..11ca362a1b 100644
+--- a/ospfd/ospf_sr.c
++++ b/ospfd/ospf_sr.c
+@@ -985,7 +985,8 @@ static struct sr_link *get_ext_link_sid(struct tlv_header *tlvh, size_t size)
+ 	struct ext_subtlv_rmt_itf_addr *rmt_itf;
+ 
+ 	struct tlv_header *sub_tlvh;
+-	uint16_t length = 0, sum = 0, i = 0;
++	uint32_t length = 0, sum = 0;
++	uint16_t i = 0;
+ 
+ 	/* Check TLV size */
+ 	if ((ntohs(tlvh->length) > size)
+@@ -1000,7 +1001,15 @@ static struct sr_link *get_ext_link_sid(struct tlv_header *tlvh, size_t size)
+ 	length = ntohs(tlvh->length) - EXT_TLV_LINK_SIZE;
+ 	sub_tlvh = (struct tlv_header *)((char *)(tlvh) + TLV_HDR_SIZE
+ 					 + EXT_TLV_LINK_SIZE);
+-	for (; sum < length && sub_tlvh; sub_tlvh = TLV_HDR_NEXT(sub_tlvh)) {
++	for (; sum < length && sub_tlvh;) {
++		uint32_t tlv_size = TLV_SIZE(sub_tlvh);
++
++		if (tlv_size > length - sum) {
++			zlog_warn("Malformed Extended Link sub-TLV size %u (remaining %u)",
++				  tlv_size, length - sum);
++			break;
++		}
++
+ 		switch (ntohs(sub_tlvh->type)) {
+ 		case EXT_SUBTLV_ADJ_SID:
+ 			adj_sid = (struct ext_subtlv_adj_sid *)sub_tlvh;
+@@ -1041,7 +1050,9 @@ static struct sr_link *get_ext_link_sid(struct tlv_header *tlvh, size_t size)
+ 		default:
+ 			break;
+ 		}
+-		sum += TLV_SIZE(sub_tlvh);
++		sum += tlv_size;
++		if (sum < length)
++			sub_tlvh = TLV_HDR_NEXT(sub_tlvh);
+ 	}
+ 
+ 	IPV4_ADDR_COPY(&srl->itf_addr, &link->link_data);
+@@ -1062,7 +1073,7 @@ static struct sr_prefix *get_ext_prefix_sid(struct tlv_header *tlvh,
+ 	struct ext_subtlv_prefix_sid *psid;
+ 
+ 	struct tlv_header *sub_tlvh;
+-	uint16_t length = 0, sum = 0;
++	uint32_t length = 0, sum = 0;
+ 
+ 	/* Check TLV size */
+ 	if ((ntohs(tlvh->length) > size)
+@@ -1077,7 +1088,15 @@ static struct sr_prefix *get_ext_prefix_sid(struct tlv_header *tlvh,
+ 	length = ntohs(tlvh->length) - EXT_TLV_PREFIX_SIZE;
+ 	sub_tlvh = (struct tlv_header *)((char *)(tlvh) + TLV_HDR_SIZE
+ 					 + EXT_TLV_PREFIX_SIZE);
+-	for (; sum < length && sub_tlvh; sub_tlvh = TLV_HDR_NEXT(sub_tlvh)) {
++	for (; sum < length && sub_tlvh;) {
++		uint32_t tlv_size = TLV_SIZE(sub_tlvh);
++
++		if (tlv_size > length - sum) {
++			zlog_warn("Malformed Extended Prefix sub-TLV size %u (remaining %u)",
++				  tlv_size, length - sum);
++			break;
++		}
++
+ 		switch (ntohs(sub_tlvh->type)) {
+ 		case EXT_SUBTLV_PREFIX_SID:
+ 			psid = (struct ext_subtlv_prefix_sid *)sub_tlvh;
+@@ -1102,7 +1121,9 @@ static struct sr_prefix *get_ext_prefix_sid(struct tlv_header *tlvh,
+ 		default:
+ 			break;
+ 		}
+-		sum += TLV_SIZE(sub_tlvh);
++		sum += tlv_size;
++		if (sum < length)
++			sub_tlvh = TLV_HDR_NEXT(sub_tlvh);
+ 	}
+ 
+ 	osr_debug("  |-  Found SID %u for prefix %pFX", srp->sid,
+@@ -1364,7 +1385,7 @@ void ospf_sr_ri_lsa_update(struct ospf_lsa *lsa)
+ 	struct ri_sr_tlv_sid_label_range *ri_srlb = NULL;
+ 	struct ri_sr_tlv_sr_algorithm *algo = NULL;
+ 	struct sr_block srgb;
+-	uint16_t length = 0, sum = 0;
++	uint32_t length = 0, sum = 0;
+ 	uint8_t msd = 0;
+ 
+ 	osr_debug("SR (%s): Process Router Information LSA 4.0.0.%u from %pI4",
+@@ -1392,8 +1413,15 @@ void ospf_sr_ri_lsa_update(struct ospf_lsa *lsa)
+ 	srgb.range_size = 0;
+ 	srgb.lower_bound = 0;
+ 
+-	for (tlvh = TLV_HDR_TOP(lsah); (sum < length) && (tlvh != NULL);
+-	     tlvh = TLV_HDR_NEXT(tlvh)) {
++	for (tlvh = TLV_HDR_TOP(lsah); (sum < length) && (tlvh != NULL);) {
++		uint32_t tlv_size = TLV_SIZE(tlvh);
++
++		if (tlv_size > length - sum) {
++			zlog_warn("Malformed RI TLV size %u (remaining %u)", tlv_size,
++				  length - sum);
++			break;
++		}
++
+ 		switch (ntohs(tlvh->type)) {
+ 		case RI_SR_TLV_SR_ALGORITHM:
+ 			algo = (struct ri_sr_tlv_sr_algorithm *)tlvh;
+@@ -1410,7 +1438,9 @@ void ospf_sr_ri_lsa_update(struct ospf_lsa *lsa)
+ 		default:
+ 			break;
+ 		}
+-		sum += TLV_SIZE(tlvh);
++		sum += tlv_size;
++		if (sum < length)
++			tlvh = TLV_HDR_NEXT(tlvh);
+ 	}
+ 
+ 	/* Check if Segment Routing Capabilities has been found */
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 1bddf97bde..8d01e4fd1d 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -2121,7 +2121,7 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	struct ls_attributes *old, attr = {};
+ 	struct tlv_header *tlvh;
+ 	void *value;
+-	uint16_t len, sum;
++	uint32_t len, sum;
+ 	uint8_t lsa_id;
+ 
+ 	/* Initialize Attribute */
+@@ -2151,11 +2151,19 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 	sum = sizeof(struct tlv_header);
+ 	/* Browse sub-TLV and fulfill Link State Attributes */
+-	for (tlvh = TLV_DATA(tlvh); sum < len; tlvh = TLV_HDR_NEXT(tlvh)) {
++	tlvh = TLV_DATA(tlvh);
++	while (sum < len) {
++		uint32_t tlv_size = TLV_SIZE(tlvh);
+ 		uint32_t val32, tab32[2];
+ 		float valf, tabf[8];
+ 		struct in_addr addr;
+ 
++		if (tlv_size > len - sum) {
++			zlog_warn("Malformed TE sub-TLV size %u (remaining %u)", tlv_size,
++				  len - sum);
++			break;
++		}
++
+ 		value = TLV_DATA(tlvh);
+ 		switch (ntohs(tlvh->type)) {
+ 		case TE_LINK_SUBTLV_LCLIF_IPADDR:
+@@ -2250,7 +2258,9 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 		default:
+ 			break;
+ 		}
+-		sum += TLV_SIZE(tlvh);
++		sum += tlv_size;
++		if (sum < len)
++			tlvh = TLV_HDR_NEXT(tlvh);
+ 	}
+ 
+ 	/* Get corresponding Edge from Link State Data Base */
+@@ -2350,7 +2360,7 @@ static int ospf_te_delete_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	struct tlv_header *tlvh;
+ 	struct in_addr addr;
+ 	struct ls_edge_key key = {.family = AF_UNSPEC};
+-	uint16_t len, sum;
++	uint32_t len, sum;
+ 	uint8_t lsa_id;
+ 
+ 	/* Initialize TLV browsing */
+@@ -2362,14 +2372,25 @@ static int ospf_te_delete_te(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	sum = sizeof(struct tlv_header);
+ 
+ 	/* Browse sub-TLV to find Link ID */
+-	for (tlvh = TLV_DATA(tlvh); sum < len; tlvh = TLV_HDR_NEXT(tlvh)) {
++	tlvh = TLV_DATA(tlvh);
++	while (sum < len) {
++		uint32_t tlv_size = TLV_SIZE(tlvh);
++
++		if (tlv_size > len - sum) {
++			zlog_warn("Malformed TE sub-TLV size %u (remaining %u)", tlv_size,
++				  len - sum);
++			break;
++		}
++
+ 		if (ntohs(tlvh->type) == TE_LINK_SUBTLV_LCLIF_IPADDR) {
+ 			memcpy(&addr, TLV_DATA(tlvh), TE_LINK_SUBTLV_DEF_SIZE);
+ 			key.family = AF_INET;
+ 			IPV4_ADDR_COPY(&key.k.addr, &addr);
+ 			break;
+ 		}
+-		sum += TLV_SIZE(tlvh);
++		sum += tlv_size;
++		if (sum < len)
++			tlvh = TLV_HDR_NEXT(tlvh);
+ 	}
+ 	if (key.family == AF_UNSPEC)
+ 		return 0;
+@@ -2444,7 +2465,7 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	struct ls_node *node;
+ 	struct lsa_header *lsah = lsa->data;
+ 	struct tlv_header *tlvh;
+-	uint16_t len = 0, sum = 0;
++	uint32_t len = 0, sum = 0;
+ 
+ 	/* Get vertex / Node from LSA Advertised Router ID */
+ 	vertex = get_vertex(ted, lsa);
+@@ -2455,13 +2476,18 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 	/* Initialize TLV browsing */
+ 	len = lsa->size - OSPF_LSA_HEADER_SIZE;
+-	for (tlvh = TLV_HDR_TOP(lsah); sum < len && tlvh;
+-	     tlvh = TLV_HDR_NEXT(tlvh)) {
++	for (tlvh = TLV_HDR_TOP(lsah); sum < len && tlvh;) {
++		uint32_t tlv_size = TLV_SIZE(tlvh);
+ 		struct ri_sr_tlv_sr_algorithm *algo;
+ 		struct ri_sr_tlv_sid_label_range *range;
+ 		struct ri_sr_tlv_node_msd *msd;
+ 		uint32_t size, lower;
+ 
++		if (tlv_size > len - sum) {
++			zlog_warn("Malformed RI TLV size %u (remaining %u)", tlv_size, len - sum);
++			break;
++		}
++
+ 		switch (ntohs(tlvh->type)) {
+ 		case RI_SR_TLV_SR_ALGORITHM:
+ 			if (TLV_BODY_SIZE(tlvh) < 1 ||
+@@ -2546,7 +2572,9 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 		default:
+ 			break;
+ 		}
+-		sum += TLV_SIZE(tlvh);
++		sum += tlv_size;
++		if (sum < len)
++			tlvh = TLV_HDR_NEXT(tlvh);
+ 	}
+ 
+ 	/* Vertex has been created or updated: export it */
+@@ -2758,7 +2786,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	struct ext_tlv_link *ext;
+ 	struct ls_edge *edge;
+ 	struct ls_attributes *atr;
+-	uint16_t len = 0, sum = 0, i;
++	uint32_t len = 0, sum = 0;
++	uint16_t i;
+ 	uint32_t label;
+ 
+ 	/* Get corresponding Edge from Link State Data Base */
+@@ -2792,11 +2821,18 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	len -= EXT_TLV_LINK_SIZE;
+ 	tlvh = (struct tlv_header *)((char *)(ext) + TLV_HDR_SIZE
+ 				     + EXT_TLV_LINK_SIZE);
+-	for (; sum < len; tlvh = TLV_HDR_NEXT(tlvh)) {
++	for (; sum < len;) {
++		uint32_t tlv_size = TLV_SIZE(tlvh);
+ 		struct ext_subtlv_adj_sid *adj;
+ 		struct ext_subtlv_lan_adj_sid *ladj;
+ 		struct ext_subtlv_rmt_itf_addr *rmt;
+ 
++		if (tlv_size > len - sum) {
++			zlog_warn("Malformed Extended Link sub-TLV size %u (remaining %u)",
++				  tlv_size, len - sum);
++			break;
++		}
++
+ 		switch (ntohs(tlvh->type)) {
+ 		case EXT_SUBTLV_ADJ_SID:
+ 			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_ADJ_SID_SIZE)
+@@ -2875,7 +2911,9 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 		default:
+ 			break;
+ 		}
+-		sum += TLV_SIZE(tlvh);
++		sum += tlv_size;
++		if (sum < len)
++			tlvh = TLV_HDR_NEXT(tlvh);
+ 	}
+ 
+ 	/* Export Link State Edge if needed */
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
index 0287a6fb69..20a224b7d7 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch \
            file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch \
            file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch \
+           file://CVE-2026-28532.patch \
            "
 
 SRCREV = "ad1766d17be022587fe05ebe1a7bf10e1b7dce19"

