Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E490C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:15:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.18173.1741079744553752179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aitJ8CJt;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2feb96064e4so8529175a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 01:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741079743; x=1741684543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwuLfgjpMK0maxmzOKWsCjGFlK07cPnFkAnzodd+1jk=;
        b=aitJ8CJtOgk6iGqSWP/YMt1vntdadPWVAh3Js8AAAG3JrPBCwuOOXeGnhyai3ZuErk
         1UCpe31C9cy77rxT6M9fA5cC+muJI2Z964G395Q0XWfYAFKf844U0qjmiRF2sGXwXkv/
         LY9PESOHh0jy1BVkYCefOfK3NpBcq3ve5p8czcNwKCrG5Rfu4k/2jcGPFKFvJKcZsRNz
         h63nwdsMhPl2NOJswwTTAKIpHpuiOHuehtIiChU/pxPOsJADeMjf/4//GRo52rCjr/3E
         KcV/niAiIO2FnHnCRkVZrrNZDbM0i3T8uR29Zm5Gax3aFf6p8g7IK56X4i/Snly/zzxP
         Vfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741079743; x=1741684543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwuLfgjpMK0maxmzOKWsCjGFlK07cPnFkAnzodd+1jk=;
        b=dFnuRvWKLLj5HcYqvMFcaxmzH9DlJQDIwp+IVvV0IedgtGlt0jzuQB2ibYfN3rMz1n
         61PeXnOTCtDECdjjyuAk8qvydOVkbSGEnpdyancEjvvUQS+Hy8oAUvbSnQxJRn3I5ohu
         VRVg0ijEZPBjzWROlgfS7GotV/vSh8jflBHswU2zKfuMUhMfxm2ed5KTo8lQkuPzTCAs
         4AfqDJimhaAfU8ceDAv21O4DvdtO3fQGGBxema2+HOhQERiDvGInFuwbeRfPU0FnEnP9
         EPXc6zSkulqkr3Y2gcHvDQK3dfdi2xex0/4P+vmlQ4ZGrKCmLsAhCzV42eYeSeK1VIM6
         30Yg==
X-Gm-Message-State: AOJu0YwC1C0OeVLXDA5PbBY6hcxPUAPaJDhQglHsBFJZzAVZr29c0iKm
	BgBQVtTkRG3dn2qs+mJSOq5IL46xCTnL79jCXK6JVZGVbAkGbaCAK1xtgQ==
X-Gm-Gg: ASbGncs/UWziWcVLMLXgKfER6yVzZIr5pL4Sv995Z6ODOCGxWuSBGzDahzPkW/DKRvV
	3sY4+fG4tapQMFW7/6ChxGFGPd6MdQ3V4AQvT7V78wOXEMbSYz27HE2fxo/RIyub8nZnghlFujB
	12H4XeB0fno7sF5xV6ElGkXnFlaREFb1vjJGt849Rkl74Oth9tPviFHzTo2ZAAbdOHpmr19mIAl
	lmJ9uHPb5M6m6qpN1mBaP7QRl3lyEkE4yXEVyPg+95oBmXs/CE3MpLZ24BHYxoreMCe+ilnyIwm
	1Rm+xuddLlM5itLDDgPHbN1AGwJraNTzefxCm1MqEhlhsNLZmhNMTs/QA2A7iJeySHTG
X-Google-Smtp-Source: AGHT+IE6S1W3W2tKEXAMcQM5u7A+p9OQt5DLd88iJMqkPgmcRI5JkFNBkaUWMWmo4RYNY6ed/IiFEA==
X-Received: by 2002:a17:90b:3890:b0:2f9:9e64:37b1 with SMTP id 98e67ed59e1d1-2febabeddf9mr24358482a91.28.1741079743330;
        Tue, 04 Mar 2025 01:15:43 -0800 (PST)
Received: from LL-3020L.kpit.com ([2401:4900:1c44:a7eb:92ca:2a09:77c3:8aa9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2bd6sm13984167a91.21.2025.03.04.01.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 01:15:42 -0800 (PST)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [meta-networking][scarthgap][PATCH] unbound: Fix CVE-2024-8508
Date: Tue,  4 Mar 2025 14:42:08 +0530
Message-Id: <20250304091208.1249791-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 09:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115738

From: Virendra Thakur <virendrak@kpit.com>

Malicious upstreams responses with very large RRsets can cause Unbound
to spend a considerable time applying name compression to downstream
replies. This can lead to degraded performance and eventually denial of
service in well orchestrated attacks.

Reference: https://nvd.nist.gov/vuln/detail/cve-2024-8508

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../unbound/unbound/CVE-2024-8508.patch       | 247 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   4 +-
 2 files changed, 250 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch
new file mode 100644
index 0000000000..65219fc98c
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch
@@ -0,0 +1,247 @@
+Description: Limit name compression calculations to avoid DoS
+ Introduces a hard limit on the number of name compression calculations
+ per packet to prevent CPU lockup from maliciously crafted large RRsets.
+ This mitigates potential denial of service attacks.
+Author: Yorgos Thessalonikefs <yorgos@nlnetlabs.nl>
+Fixes: CVE-2024-8508
+CVE: CVE-2024-8508
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/b7c61d7cc256d6a174e6179622c7fa968272c259]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+
+Index: unbound-1.19.3/util/data/msgencode.c
+===================================================================
+--- unbound-1.19.3.orig/util/data/msgencode.c
++++ unbound-1.19.3/util/data/msgencode.c
+@@ -62,6 +62,10 @@
+ #define RETVAL_TRUNC	-4
+ /** return code that means all is peachy keen. Equal to DNS rcode NOERROR */
+ #define RETVAL_OK	0
++/** Max compressions we are willing to perform; more than that will result
++ *  in semi-compressed messages, or truncated even on TCP for huge messages, to
++ *  avoid locking the CPU for long */
++#define MAX_COMPRESSION_PER_MESSAGE 120
+ 
+ /**
+  * Data structure to help domain name compression in outgoing messages.
+@@ -284,15 +288,17 @@ write_compressed_dname(sldns_buffer* pkt
+ 
+ /** compress owner name of RR, return RETVAL_OUTMEM RETVAL_TRUNC */
+ static int
+-compress_owner(struct ub_packed_rrset_key* key, sldns_buffer* pkt, 
+-	struct regional* region, struct compress_tree_node** tree, 
+-	size_t owner_pos, uint16_t* owner_ptr, int owner_labs)
++compress_owner(struct ub_packed_rrset_key* key, sldns_buffer* pkt,
++	struct regional* region, struct compress_tree_node** tree,
++	size_t owner_pos, uint16_t* owner_ptr, int owner_labs,
++	size_t* compress_count)
+ {
+ 	struct compress_tree_node* p;
+ 	struct compress_tree_node** insertpt = NULL;
+ 	if(!*owner_ptr) {
+ 		/* compress first time dname */
+-		if((p = compress_tree_lookup(tree, key->rk.dname, 
++		if(*compress_count < MAX_COMPRESSION_PER_MESSAGE &&
++			(p = compress_tree_lookup(tree, key->rk.dname,
+ 			owner_labs, &insertpt))) {
+ 			if(p->labs == owner_labs) 
+ 				/* avoid ptr chains, since some software is
+@@ -301,6 +307,7 @@ compress_owner(struct ub_packed_rrset_ke
+ 			if(!write_compressed_dname(pkt, key->rk.dname, 
+ 				owner_labs, p))
+ 				return RETVAL_TRUNC;
++			(*compress_count)++;
+ 			/* check if typeclass+4 ttl + rdatalen is available */
+ 			if(sldns_buffer_remaining(pkt) < 4+4+2)
+ 				return RETVAL_TRUNC;
+@@ -313,7 +320,8 @@ compress_owner(struct ub_packed_rrset_ke
+ 			if(owner_pos <= PTR_MAX_OFFSET)
+ 				*owner_ptr = htons(PTR_CREATE(owner_pos));
+ 		}
+-		if(!compress_tree_store(key->rk.dname, owner_labs, 
++		if(*compress_count < MAX_COMPRESSION_PER_MESSAGE &&
++			!compress_tree_store(key->rk.dname, owner_labs,
+ 			owner_pos, region, p, insertpt))
+ 			return RETVAL_OUTMEM;
+ 	} else {
+@@ -333,20 +341,24 @@ compress_owner(struct ub_packed_rrset_ke
+ 
+ /** compress any domain name to the packet, return RETVAL_* */
+ static int
+-compress_any_dname(uint8_t* dname, sldns_buffer* pkt, int labs, 
+-	struct regional* region, struct compress_tree_node** tree)
++compress_any_dname(uint8_t* dname, sldns_buffer* pkt, int labs,
++	struct regional* region, struct compress_tree_node** tree,
++	size_t* compress_count)
+ {
+ 	struct compress_tree_node* p;
+ 	struct compress_tree_node** insertpt = NULL;
+ 	size_t pos = sldns_buffer_position(pkt);
+-	if((p = compress_tree_lookup(tree, dname, labs, &insertpt))) {
++	if(*compress_count < MAX_COMPRESSION_PER_MESSAGE &&
++		(p = compress_tree_lookup(tree, dname, labs, &insertpt))) {
+ 		if(!write_compressed_dname(pkt, dname, labs, p))
+ 			return RETVAL_TRUNC;
++		(*compress_count)++;
+ 	} else {
+ 		if(!dname_buffer_write(pkt, dname))
+ 			return RETVAL_TRUNC;
+ 	}
+-	if(!compress_tree_store(dname, labs, pos, region, p, insertpt))
++	if(*compress_count < MAX_COMPRESSION_PER_MESSAGE &&
++		!compress_tree_store(dname, labs, pos, region, p, insertpt))
+ 		return RETVAL_OUTMEM;
+ 	return RETVAL_OK;
+ }
+@@ -364,9 +376,9 @@ type_rdata_compressable(struct ub_packed
+ 
+ /** compress domain names in rdata, return RETVAL_* */
+ static int
+-compress_rdata(sldns_buffer* pkt, uint8_t* rdata, size_t todolen, 
+-	struct regional* region, struct compress_tree_node** tree, 
+-	const sldns_rr_descriptor* desc)
++compress_rdata(sldns_buffer* pkt, uint8_t* rdata, size_t todolen,
++	struct regional* region, struct compress_tree_node** tree,
++	const sldns_rr_descriptor* desc, size_t* compress_count)
+ {
+ 	int labs, r, rdf = 0;
+ 	size_t dname_len, len, pos = sldns_buffer_position(pkt);
+@@ -380,8 +392,8 @@ compress_rdata(sldns_buffer* pkt, uint8_
+ 		switch(desc->_wireformat[rdf]) {
+ 		case LDNS_RDF_TYPE_DNAME:
+ 			labs = dname_count_size_labels(rdata, &dname_len);
+-			if((r=compress_any_dname(rdata, pkt, labs, region, 
+-				tree)) != RETVAL_OK)
++			if((r=compress_any_dname(rdata, pkt, labs, region,
++				tree, compress_count)) != RETVAL_OK)
+ 				return r;
+ 			rdata += dname_len;
+ 			todolen -= dname_len;
+@@ -449,7 +461,8 @@ static int
+ packed_rrset_encode(struct ub_packed_rrset_key* key, sldns_buffer* pkt, 
+ 	uint16_t* num_rrs, time_t timenow, struct regional* region,
+ 	int do_data, int do_sig, struct compress_tree_node** tree,
+-	sldns_pkt_section s, uint16_t qtype, int dnssec, size_t rr_offset)
++	sldns_pkt_section s, uint16_t qtype, int dnssec, size_t rr_offset,
++	size_t* compress_count)
+ {
+ 	size_t i, j, owner_pos;
+ 	int r, owner_labs;
+@@ -477,9 +490,9 @@ packed_rrset_encode(struct ub_packed_rrs
+ 		for(i=0; i<data->count; i++) {
+ 			/* rrset roundrobin */
+ 			j = (i + rr_offset) % data->count;
+-			if((r=compress_owner(key, pkt, region, tree, 
+-				owner_pos, &owner_ptr, owner_labs))
+-				!= RETVAL_OK)
++			if((r=compress_owner(key, pkt, region, tree,
++				owner_pos, &owner_ptr, owner_labs,
++				compress_count)) != RETVAL_OK)
+ 				return r;
+ 			sldns_buffer_write(pkt, &key->rk.type, 2);
+ 			sldns_buffer_write(pkt, &key->rk.rrset_class, 2);
+@@ -489,8 +502,8 @@ packed_rrset_encode(struct ub_packed_rrs
+ 			else	sldns_buffer_write_u32(pkt, data->rr_ttl[j]-adjust);
+ 			if(c) {
+ 				if((r=compress_rdata(pkt, data->rr_data[j],
+-					data->rr_len[j], region, tree, c))
+-					!= RETVAL_OK)
++					data->rr_len[j], region, tree, c,
++					compress_count)) != RETVAL_OK)
+ 					return r;
+ 			} else {
+ 				if(sldns_buffer_remaining(pkt) < data->rr_len[j])
+@@ -510,9 +523,9 @@ packed_rrset_encode(struct ub_packed_rrs
+ 					return RETVAL_TRUNC;
+ 				sldns_buffer_write(pkt, &owner_ptr, 2);
+ 			} else {
+-				if((r=compress_any_dname(key->rk.dname, 
+-					pkt, owner_labs, region, tree))
+-					!= RETVAL_OK)
++				if((r=compress_any_dname(key->rk.dname,
++					pkt, owner_labs, region, tree,
++					compress_count)) != RETVAL_OK)
+ 					return r;
+ 				if(sldns_buffer_remaining(pkt) < 
+ 					4+4+data->rr_len[i])
+@@ -544,7 +557,8 @@ static int
+ insert_section(struct reply_info* rep, size_t num_rrsets, uint16_t* num_rrs,
+ 	sldns_buffer* pkt, size_t rrsets_before, time_t timenow, 
+ 	struct regional* region, struct compress_tree_node** tree,
+-	sldns_pkt_section s, uint16_t qtype, int dnssec, size_t rr_offset)
++	sldns_pkt_section s, uint16_t qtype, int dnssec, size_t rr_offset,
++	size_t* compress_count)
+ {
+ 	int r;
+ 	size_t i, setstart;
+@@ -560,7 +574,7 @@ insert_section(struct reply_info* rep, s
+ 			setstart = sldns_buffer_position(pkt);
+ 			if((r=packed_rrset_encode(rep->rrsets[rrsets_before+i], 
+ 				pkt, num_rrs, timenow, region, 1, 1, tree,
+-				s, qtype, dnssec, rr_offset))
++				s, qtype, dnssec, rr_offset, compress_count))
+ 				!= RETVAL_OK) {
+ 				/* Bad, but if due to size must set TC bit */
+ 				/* trim off the rrset neatly. */
+@@ -573,7 +587,7 @@ insert_section(struct reply_info* rep, s
+ 			setstart = sldns_buffer_position(pkt);
+ 			if((r=packed_rrset_encode(rep->rrsets[rrsets_before+i], 
+ 				pkt, num_rrs, timenow, region, 1, 0, tree,
+-				s, qtype, dnssec, rr_offset))
++				s, qtype, dnssec, rr_offset, compress_count))
+ 				!= RETVAL_OK) {
+ 				sldns_buffer_set_position(pkt, setstart);
+ 				return r;
+@@ -584,7 +598,7 @@ insert_section(struct reply_info* rep, s
+ 			setstart = sldns_buffer_position(pkt);
+ 			if((r=packed_rrset_encode(rep->rrsets[rrsets_before+i], 
+ 				pkt, num_rrs, timenow, region, 0, 1, tree,
+-				s, qtype, dnssec, rr_offset))
++				s, qtype, dnssec, rr_offset, compress_count))
+ 				!= RETVAL_OK) {
+ 				sldns_buffer_set_position(pkt, setstart);
+ 				return r;
+@@ -677,6 +691,7 @@ reply_info_encode(struct query_info* qin
+ 	struct compress_tree_node* tree = 0;
+ 	int r;
+ 	size_t rr_offset;
++	size_t compress_count=0;
+ 
+ 	sldns_buffer_clear(buffer);
+ 	if(udpsize < sldns_buffer_limit(buffer))
+@@ -723,7 +738,7 @@ reply_info_encode(struct query_info* qin
+ 		arep.rrsets = &qinfo->local_alias->rrset;
+ 		if((r=insert_section(&arep, 1, &ancount, buffer, 0,
+ 			timezero, region, &tree, LDNS_SECTION_ANSWER,
+-			qinfo->qtype, dnssec, rr_offset)) != RETVAL_OK) {
++			qinfo->qtype, dnssec, rr_offset, &compress_count)) != RETVAL_OK) {
+ 			if(r == RETVAL_TRUNC) {
+ 				/* create truncated message */
+ 				sldns_buffer_write_u16_at(buffer, 6, ancount);
+@@ -738,7 +753,7 @@ reply_info_encode(struct query_info* qin
+ 	/* insert answer section */
+ 	if((r=insert_section(rep, rep->an_numrrsets, &ancount, buffer,
+ 		0, timenow, region, &tree, LDNS_SECTION_ANSWER, qinfo->qtype,
+-		dnssec, rr_offset)) != RETVAL_OK) {
++		dnssec, rr_offset, &compress_count)) != RETVAL_OK) {
+ 		if(r == RETVAL_TRUNC) {
+ 			/* create truncated message */
+ 			sldns_buffer_write_u16_at(buffer, 6, ancount);
+@@ -756,7 +771,7 @@ reply_info_encode(struct query_info* qin
+ 		if((r=insert_section(rep, rep->ns_numrrsets, &nscount, buffer,
+ 			rep->an_numrrsets, timenow, region, &tree,
+ 			LDNS_SECTION_AUTHORITY, qinfo->qtype,
+-			dnssec, rr_offset)) != RETVAL_OK) {
++			dnssec, rr_offset, &compress_count)) != RETVAL_OK) {
+ 			if(r == RETVAL_TRUNC) {
+ 				/* create truncated message */
+ 				sldns_buffer_write_u16_at(buffer, 8, nscount);
+@@ -773,7 +788,7 @@ reply_info_encode(struct query_info* qin
+ 			if((r=insert_section(rep, rep->ar_numrrsets, &arcount, buffer,
+ 				rep->an_numrrsets + rep->ns_numrrsets, timenow, region,
+ 				&tree, LDNS_SECTION_ADDITIONAL, qinfo->qtype,
+-				dnssec, rr_offset)) != RETVAL_OK) {
++				dnssec, rr_offset, &compress_count)) != RETVAL_OK) {
+ 				if(r == RETVAL_TRUNC) {
+ 					/* no need to set TC bit, this is the additional */
+ 					sldns_buffer_write_u16_at(buffer, 10, arcount);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index ffdc78e9d6..6f54038c6c 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -9,7 +9,9 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3 \
+           file://CVE-2024-8508.patch \
+           "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 
 inherit autotools pkgconfig systemd update-rc.d
-- 
2.34.1


