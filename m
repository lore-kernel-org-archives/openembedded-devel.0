Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7039C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:09:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27765.1789081790522084692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BBSqBbSg;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceab75934dso2501795ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081790; x=1789686590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8mH5jRtdfmGCGt4vFs1VOb0W1NM+62Ty9jk+G53yrA=;
        b=BBSqBbSgqbj5Ab9ufuyL4aVqRg2YFdkbCwANzjkFLyklHRsY6c62mP4gIZN600/X1j
         0b22TbwQTpOpxTJAH2lianTWA3A4xkt6c4BbFo11qsHOIXlgxtFNE/0ey3KNkdyD6wi2
         ugR+pGQE+mKK+T9gt587o1FKSnCtlFnGvPXLZloO1HPYhBHf+i8kKATb1fDUOc5wcdyp
         YZPtuWm8c1X3XXWB2ISyA0mc802cP2wBUUuwnMBbZtEuEjDYStsTvOI2k+nI4udmrIO7
         5pFZ7HzQsfQYkjBTYt8yVt+cSdbAvI/JU0HmuxccfCKlod6qQOKs8FsGwSGy7yeCC+aw
         sGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081790; x=1789686590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8mH5jRtdfmGCGt4vFs1VOb0W1NM+62Ty9jk+G53yrA=;
        b=KzpOWsHqS6vTjMqUPU5EYBhrPNfLit1UcBHBqTdmgC7LuGLu/CXpjD9Aozl0xSw8Qx
         BC+eess0ST8mQPFLm+r+aKahfm+QbkdHyysFcg6rwlIKdlGtJaAR73tirjtGwmZ31THW
         N/qTfKAkElqeWYDfIlhhto7df8GPKIrxIlKoqszS23BjMsakJqrMBDiV6N/ZPJEhWisr
         /KYiY0KpAlORxUJjVZk3CW9JV0fnn9trs3vdy8DnC8WRTg4k4jJbpUlHguEOGxcXJLpl
         4XlqliVXeWSFTDBlRxaF/tDdA53DFqLWjoYzv38OaQivSPzWDNHWKhbRnVks/Yl2Kkua
         aJjQ==
X-Gm-Message-State: AFuF++liocyt/7nyggHfk/4KgQ3zxZEccLC2dMBnDqWk7u3YVTa8aBIT
	bJAcajsjR0c7/tMPCDtRGxSseZC2wi+EHTK6egoSv6JKxeQ0+pAAebufy8IFBQ==
X-Gm-Gg: AYBFou14dGdRDfhAIRadE9d4PBgSBYJ4ltAfRtmyUAl9Vj8BSPGeVQB69AJ9emhRgRO
	xbvHxHr7OsKdm/rmE3d2CmqUjMjTp705gPZwmqVCqVCuTHqXswfDzOqJYcv5WmPuap+9QCq83jA
	KJER01xYYTL0j32nYSqCbgMzKg4ZqGpFj/ZSvB9av6CAJIodPcDiGEGxJcR30rmhK+s2m7jw9RE
	+WekHB9BdO98E1qIscQ2vX7HtfbSiCwJba8BUEcs5ZlE1tYOP7KM9/uf4NVbYb/jglPegKbOrkj
	QdDqvcQU3OFQB9YgBjcY1TcLVmD6YZyL4qhXA626MnqGSAZZSb8kDaHeFccS9O/urSYWOx2Fbwo
	rNDQA2QUMIr2KRLv4uJJZdCFjG7/NVXXzBNXzJS8S1LvAZkT2VkgdBqTpUEz9qxk4/0EH5Y86ie
	op1rpMdSa6Cs2C95iieJ2DxlPjVnL0sYKCkM2Y+AXxtjUUCqoTMPfPTiA7BH4NxFwVBpiOa2g5W
	6NoHWpa1ODV0JfObQBjPeE=
X-Received: by 2002:a17:90b:3c8d:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39d9bbdbac7mr1862047a91.5.1789081789597;
        Thu, 10 Sep 2026 16:09:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:09:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 3/32] unbound: patch CVE-2026-42944
Date: Fri, 11 Sep 2026 11:09:02 +1200
Message-ID: <20260910230932.173913-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129921

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit[1] needed to cherry-pick the fix.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42944

[1]https://github.com/NLnetLabs/unbound/commit/44659cb3bf4601d2daa19a0d51ac5af54bc698bc

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-42944-1.patch    |  61 +++++
 .../unbound/unbound/CVE-2026-42944-2.patch    | 231 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   2 +
 3 files changed, 294 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-1.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-2.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-1.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-1.patch
new file mode 100644
index 0000000000..211a89d31f
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-1.patch
@@ -0,0 +1,61 @@
+From 812df79447b34af62636f65342809027bb6d5b58 Mon Sep 17 00:00:00 2001
+From: Yorgos Thessalonikefs <yorgos@nlnetlabs.nl>
+Date: Wed, 31 Dec 2025 16:22:15 +0100
+Subject: [PATCH] - Use the same EDE removal logic when encoding errors as when
+ encoding   replies.
+
+(cherry picked from commit 44659cb3bf4601d2daa19a0d51ac5af54bc698bc)
+
+CVE: CVE-2026-42944
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/44659cb3bf4601d2daa19a0d51ac5af54bc698bc]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/data/msgencode.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/util/data/msgencode.c b/util/data/msgencode.c
+index 84aa3b9e7..4263aa41e 100644
+--- a/util/data/msgencode.c
++++ b/util/data/msgencode.c
+@@ -1115,22 +1115,30 @@ extended_error_encode(sldns_buffer* buf, uint16_t rcode,
+ 		sldns_buffer_write_u16(buf, qinfo->qclass);
+ 	}
+ 	sldns_buffer_flip(buf);
+-	if(edns) {
++	if(edns && edns->edns_present) {
++		uint16_t edns_field_size, ede_size, ede_txt_size;
+ 		struct edns_data es = *edns;
+ 		es.edns_version = EDNS_ADVERTISED_VERSION;
+ 		es.udp_size = EDNS_ADVERTISED_SIZE;
+ 		es.ext_rcode = (uint8_t)(rcode >> 4);
+ 		es.bits &= EDNS_DO;
+-		if(sldns_buffer_limit(buf) + calc_edns_field_size(&es) >
+-			edns->udp_size) {
++		/* EDEs are optional. If space is a concern try in order:
++		 * - removing any EXTRA-TEXT fields from explicit EDEs, or
++		 * - removing all EDEs,
++		 * to see if EDNS can fit. */
++		edns_field_size = calc_edns_field_size(&es);
++		ede_size = calc_ede_option_size(&es, &ede_txt_size);
++		if(edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size)
++			attach_edns_record_max_msg_sz(buf, &es, edns->udp_size);
++		else if(edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size - ede_txt_size) {
++			ede_trim_text(&es.opt_list_inplace_cb_out);
++			ede_trim_text(&es.opt_list_out);
++			attach_edns_record_max_msg_sz(buf, &es, edns->udp_size);
++		} else if(edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size - ede_size) {
+ 			edns_opt_list_remove(&es.opt_list_inplace_cb_out, LDNS_EDNS_EDE);
+ 			edns_opt_list_remove(&es.opt_list_out, LDNS_EDNS_EDE);
+-			if(sldns_buffer_limit(buf) + calc_edns_field_size(&es) >
+-				edns->udp_size) {
+-				return;
+-			}
++			attach_edns_record_max_msg_sz(buf, &es, edns->udp_size);
+ 		}
+-		attach_edns_record(buf, &es);
+ 	}
+ }
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-2.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-2.patch
new file mode 100644
index 0000000000..707ad9577d
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-2.patch
@@ -0,0 +1,231 @@
+From c4916b3b373b643f7e359de31259785cfc3b95d9 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:13:55 +0200
+Subject: [PATCH] - Fix CVE-2026-42944, Heap overflow and crash with multiple
+ nsid,   cookie, padding EDNS options. Thanks to Qifan Zhang, Palo Alto  
+ Networks, for the report.
+
+(cherry picked from commit fe946ba4e935a1528e6866e108e5bc9e7533ae18)
+
+CVE: CVE-2026-42944
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/fe946ba4e935a1528e6866e108e5bc9e7533ae18]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ testcode/unitmain.c   |  4 ++--
+ util/data/msgencode.c | 36 +++++++++++++++++++++++-------------
+ util/data/msgencode.h |  4 ++--
+ util/data/msgparse.c  | 10 +++++++---
+ 4 files changed, 34 insertions(+), 20 deletions(-)
+
+diff --git a/testcode/unitmain.c b/testcode/unitmain.c
+index 07c016d7b..beb10ba45 100644
+--- a/testcode/unitmain.c
++++ b/testcode/unitmain.c
+@@ -1092,7 +1092,7 @@ static void edns_ede_encode_notxt_fit_test( struct query_info* qinfo,
+ {
+ 	struct edns_data edns;
+ 	sldns_buffer* pkt;
+-	uint16_t edns_field_size, ede_txt_size;
++	size_t edns_field_size, ede_txt_size;
+ 	int found_ede = 0, found_ede_other = 0, found_ede_txt = 0;
+ 	int found_other_edns = 0;
+ 	edns_ede_encode_setup(&edns, region);
+@@ -1123,7 +1123,7 @@ static void edns_ede_encode_no_fit_test( struct query_info* qinfo,
+ {
+ 	struct edns_data edns;
+ 	sldns_buffer* pkt;
+-	uint16_t edns_field_size, ede_size, ede_txt_size;
++	size_t edns_field_size, ede_size, ede_txt_size;
+ 	int found_ede = 0, found_ede_other = 0, found_ede_txt = 0;
+ 	int found_other_edns = 0;
+ 	edns_ede_encode_setup(&edns, region);
+diff --git a/util/data/msgencode.c b/util/data/msgencode.c
+index 4263aa41e..7bc55a54e 100644
+--- a/util/data/msgencode.c
++++ b/util/data/msgencode.c
+@@ -804,7 +804,7 @@ reply_info_encode(struct query_info* qinfo, struct reply_info* rep,
+ 	return 1;
+ }
+ 
+-uint16_t
++size_t
+ calc_edns_field_size(struct edns_data* edns)
+ {
+ 	size_t rdatalen = 0;
+@@ -840,7 +840,7 @@ calc_edns_option_size(struct edns_data* edns, uint16_t code)
+ }
+ 
+ uint16_t
+-calc_ede_option_size(struct edns_data* edns, uint16_t* txt_size)
++calc_ede_option_size(struct edns_data* edns, size_t* txt_size)
+ {
+ 	size_t rdatalen = 0;
+ 	struct edns_option* opt;
+@@ -942,6 +942,10 @@ attach_edns_record_max_msg_sz(sldns_buffer* pkt, struct edns_data* edns,
+ 			padding_option = opt;
+ 			continue;
+ 		}
++		if(sldns_buffer_position(pkt) + opt->opt_len + 4 > max_msg_sz)
++			break; /* no space for it */
++		if(!sldns_buffer_available(pkt, 4 + opt->opt_len))
++			break;
+ 		sldns_buffer_write_u16(pkt, opt->opt_code);
+ 		sldns_buffer_write_u16(pkt, opt->opt_len);
+ 		if(opt->opt_len != 0)
+@@ -952,12 +956,18 @@ attach_edns_record_max_msg_sz(sldns_buffer* pkt, struct edns_data* edns,
+ 			padding_option = opt;
+ 			continue;
+ 		}
++		if(sldns_buffer_position(pkt) + opt->opt_len + 4 > max_msg_sz)
++			break; /* no space for it */
++		if(!sldns_buffer_available(pkt, 4 + opt->opt_len))
++			break;
+ 		sldns_buffer_write_u16(pkt, opt->opt_code);
+ 		sldns_buffer_write_u16(pkt, opt->opt_len);
+ 		if(opt->opt_len != 0)
+ 			sldns_buffer_write(pkt, opt->opt_data, opt->opt_len);
+ 	}
+-	if (padding_option && edns->padding_block_size ) {
++	if (padding_option && edns->padding_block_size &&
++		sldns_buffer_position(pkt)+4 <= max_msg_sz &&
++		sldns_buffer_available(pkt, 4) /* if there is space for it */) {
+ 		size_t pad_pos = sldns_buffer_position(pkt);
+ 		size_t msg_sz = ((pad_pos + 3) / edns->padding_block_size + 1)
+ 		                               * edns->padding_block_size;
+@@ -1001,7 +1011,7 @@ reply_info_answer_encode(struct query_info* qinf, struct reply_info* rep,
+ {
+ 	uint16_t flags;
+ 	unsigned int attach_edns = 0;
+-	uint16_t edns_field_size, ede_size, ede_txt_size;
++	size_t edns_field_size, ede_size, ede_txt_size;
+ 
+ 	if(!cached || rep->authoritative) {
+ 		/* original flags, copy RD and CD bits from query. */
+@@ -1028,12 +1038,12 @@ reply_info_answer_encode(struct query_info* qinf, struct reply_info* rep,
+ 	 * calculate sizes once here */
+ 	edns_field_size = calc_edns_field_size(edns);
+ 	ede_size = calc_ede_option_size(edns, &ede_txt_size);
+-	if(sldns_buffer_capacity(pkt) < udpsize)
++	if(sldns_buffer_capacity(pkt) < (size_t)udpsize)
+ 		udpsize = sldns_buffer_capacity(pkt);
+ 	if(!edns || !edns->edns_present) {
+ 		attach_edns = 0;
+ 	/* EDEs are optional, try to fit anything else before them */
+-	} else if(udpsize < LDNS_HEADER_SIZE + edns_field_size - ede_size) {
++	} else if((size_t)udpsize < (size_t)LDNS_HEADER_SIZE + edns_field_size - ede_size) {
+ 		/* packet too small to contain edns, omit it. */
+ 		attach_edns = 0;
+ 	} else {
+@@ -1047,13 +1057,13 @@ reply_info_answer_encode(struct query_info* qinf, struct reply_info* rep,
+ 		return 0;
+ 	}
+ 	if(attach_edns) {
+-		if(udpsize >= sldns_buffer_limit(pkt) + edns_field_size)
++		if((size_t)udpsize >= sldns_buffer_limit(pkt) + edns_field_size)
+ 			attach_edns_record_max_msg_sz(pkt, edns, udpsize);
+-		else if(udpsize >= sldns_buffer_limit(pkt) + edns_field_size - ede_txt_size) {
++		else if((size_t)udpsize >= sldns_buffer_limit(pkt) + edns_field_size - ede_txt_size) {
+ 			ede_trim_text(&edns->opt_list_inplace_cb_out);
+ 			ede_trim_text(&edns->opt_list_out);
+ 			attach_edns_record_max_msg_sz(pkt, edns, udpsize);
+-		} else if(udpsize >= sldns_buffer_limit(pkt) + edns_field_size - ede_size) {
++		} else if((size_t)udpsize >= sldns_buffer_limit(pkt) + edns_field_size - ede_size) {
+ 			edns_opt_list_remove(&edns->opt_list_inplace_cb_out, LDNS_EDNS_EDE);
+ 			edns_opt_list_remove(&edns->opt_list_out, LDNS_EDNS_EDE);
+ 			attach_edns_record_max_msg_sz(pkt, edns, udpsize);
+@@ -1116,7 +1126,7 @@ extended_error_encode(sldns_buffer* buf, uint16_t rcode,
+ 	}
+ 	sldns_buffer_flip(buf);
+ 	if(edns && edns->edns_present) {
+-		uint16_t edns_field_size, ede_size, ede_txt_size;
++		size_t edns_field_size, ede_size, ede_txt_size;
+ 		struct edns_data es = *edns;
+ 		es.edns_version = EDNS_ADVERTISED_VERSION;
+ 		es.udp_size = EDNS_ADVERTISED_SIZE;
+@@ -1128,13 +1138,13 @@ extended_error_encode(sldns_buffer* buf, uint16_t rcode,
+ 		 * to see if EDNS can fit. */
+ 		edns_field_size = calc_edns_field_size(&es);
+ 		ede_size = calc_ede_option_size(&es, &ede_txt_size);
+-		if(edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size)
++		if((size_t)edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size)
+ 			attach_edns_record_max_msg_sz(buf, &es, edns->udp_size);
+-		else if(edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size - ede_txt_size) {
++		else if((size_t)edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size - ede_txt_size) {
+ 			ede_trim_text(&es.opt_list_inplace_cb_out);
+ 			ede_trim_text(&es.opt_list_out);
+ 			attach_edns_record_max_msg_sz(buf, &es, edns->udp_size);
+-		} else if(edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size - ede_size) {
++		} else if((size_t)edns->udp_size >= sldns_buffer_limit(buf) + edns_field_size - ede_size) {
+ 			edns_opt_list_remove(&es.opt_list_inplace_cb_out, LDNS_EDNS_EDE);
+ 			edns_opt_list_remove(&es.opt_list_out, LDNS_EDNS_EDE);
+ 			attach_edns_record_max_msg_sz(buf, &es, edns->udp_size);
+diff --git a/util/data/msgencode.h b/util/data/msgencode.h
+index 08fcb59b8..64569555d 100644
+--- a/util/data/msgencode.h
++++ b/util/data/msgencode.h
+@@ -106,7 +106,7 @@ void qinfo_query_encode(struct sldns_buffer* pkt, struct query_info* qinfo);
+  * @param edns: edns data or NULL.
+  * @return octets to reserve for EDNS.
+  */
+-uint16_t calc_edns_field_size(struct edns_data* edns);
++size_t calc_edns_field_size(struct edns_data* edns);
+ 
+ /**
+  * Calculate the size of a specific EDNS option in packet.
+@@ -127,7 +127,7 @@ uint16_t calc_edns_option_size(struct edns_data* edns, uint16_t code);
+  *	extra text.
+  * @return octets the option will take up.
+  */
+-uint16_t calc_ede_option_size(struct edns_data* edns, uint16_t* txt_size);
++uint16_t calc_ede_option_size(struct edns_data* edns, size_t* txt_size);
+ 
+ /**
+  * Attach EDNS record to buffer. Buffer has complete packet. There must
+diff --git a/util/data/msgparse.c b/util/data/msgparse.c
+index 6963d8501..2d0955631 100644
+--- a/util/data/msgparse.c
++++ b/util/data/msgparse.c
+@@ -950,6 +950,7 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 	struct comm_reply* repinfo, uint32_t now, struct regional* region,
+ 	struct cookie_secrets* cookie_secrets)
+ {
++	int nsid_seen = 0, cookie_seen = 0, padding_seen = 0;
+ 	/* To respond with a Keepalive option, the client connection must have
+ 	 * received one message with a TCP Keepalive EDNS option, and that
+ 	 * option must have 0 length data. Subsequent messages sent on that
+@@ -984,8 +985,9 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 		/* handle parse time edns options here */
+ 		switch(opt_code) {
+ 		case LDNS_EDNS_NSID:
+-			if (!cfg || !cfg->nsid)
++			if (!cfg || !cfg->nsid || nsid_seen)
+ 				break;
++			nsid_seen = 1;
+ 			if(!edns_opt_list_append(&edns->opt_list_out,
+ 						LDNS_EDNS_NSID, cfg->nsid_len,
+ 						cfg->nsid, region)) {
+@@ -1027,8 +1029,9 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 
+ 		case LDNS_EDNS_PADDING:
+ 			if(!cfg || !cfg->pad_responses ||
+-					!c || c->type != comm_tcp ||!c->ssl)
++					!c || c->type != comm_tcp ||!c->ssl || padding_seen)
+ 				break;
++			padding_seen = 1;
+ 			if(!edns_opt_list_append(&edns->opt_list_out,
+ 						LDNS_EDNS_PADDING,
+ 						0, NULL, region)) {
+@@ -1039,8 +1042,9 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 			break;
+ 
+ 		case LDNS_EDNS_COOKIE:
+-			if(!cfg || !cfg->do_answer_cookie || !repinfo)
++			if(!cfg || !cfg->do_answer_cookie || !repinfo || cookie_seen)
+ 				break;
++			cookie_seen = 1;
+ 			if(opt_len != 8 && (opt_len < 16 || opt_len > 40)) {
+ 				verbose(VERB_ALGO, "worker request: "
+ 					"badly formatted cookie");
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index d703b27506..b8853c9d63 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;tag=release-${PV} \
            file://run-ptest \
            file://CVE-2026-33278.patch \
+           file://CVE-2026-42944-1.patch \
+           file://CVE-2026-42944-2.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

