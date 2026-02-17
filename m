Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF969E83854
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 05:11:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6136.1771305062942015835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 21:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WA88hniH;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82311f4070cso2104968b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 21:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771305062; x=1771909862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cVQH5PPrRQwHMq8mB2p9hDF+dS08tc47HtMI/8e6Tw=;
        b=WA88hniHIjGLGStQ87G2P8u+01edZZW6p8hjprMHjy1GZNpByorVFY1H2mtznTewDT
         R7/KjHBvUvgD0wmJkVkpCp6y29MMgjZLB2q9eJYDEl09FyvQd3A+2YCkS0Vq4Hjjl40c
         aaLo66CCw/ST5Gc+dCGL6xd3/9fL6pv/EvrtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771305062; x=1771909862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cVQH5PPrRQwHMq8mB2p9hDF+dS08tc47HtMI/8e6Tw=;
        b=ZKsk+408rLyHKJuqnW7CM7EJyeLUDvHtnMJ0PGtH7Rut5H1n84TdBAVdXRUEuv0Y+o
         Oytw5WawMFBT6LGQ39lpa42ZlRaOavdc+C+Jd1xUT/JxY8tQQxlfJo/XIkhPXIcQnj9N
         JriT72eajnC8Zs8oGIMtLj55Sym0ucaI3Qdo7QA2HD6AlS/He2jonWvjrTS9EyitNGxZ
         TjjYp9pu7m9wXeGnWR10tgHwHd9fLzNMKh2YrNTtyrHj6AsHjuxB89Kr/DGck0Viixdm
         8mqeGxT6AWrQEmKlUWk2KNO4s/AppZ0Ble4byuY0XgVf6EiM1zcmS+UW8+gOdHH5hde+
         Srcg==
X-Gm-Message-State: AOJu0YwN80CqzU6JGJ/pOOaOMeEBsNEQhxqzo7vje/TgbMXtUiMp3Ws9
	LEj0HSnwNsucI7fv3T3fhUS1CXOeLtvAN+Arb6pf9ExRYsHhCuw7jpAjiMTz8tBJIQ1x0yc4qoF
	XShwJmJc=
X-Gm-Gg: AZuq6aKiUK8WdjyXf0LlkI71QhHtA0KBKTsgRtyqQQxeLDgDtXD6eAnH464hoHIcrBB
	JocE3tZa/YMkdpeCy6d0j1/P8bJzhLHRAc4ZcbwDofzSlQ/LTBzy4IKkyr0xRdPPlE2yOqfBzpP
	zGvO1XsRJoB4IGbKbwPYQCQUJEKLF5eeQWP9ILvFle/JtQuPmKfSzGltNq5FbGPT5D5j6fLh6n0
	euyA3x/UFMSywPDC9Zn/s4kAnC4GvkN9j/TZ7SZBwmBUYJtlVfyRto7kUx1w9YWYcihTykh19Do
	qGWcX0ZW9RVRNbAm6jPyQVapTlEchSPM67G2FmRWO1t3+Oxeq9OGSV3hcVy4uMMWtPqvbz6yRTE
	9hvp0HgthpQo6+8AAnhw4zmLY8KpV9Q8fiIfAo/87A9dqSX8b8EgQCSvEKh5ixYmMk7BFrta2KO
	+AmFpRS5YPUZJh0X8DLT75goNZQTCKuYoD7AtK
X-Received: by 2002:a05:6a00:1394:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-824d5c96dc5mr10485008b3a.3.1771305061806;
        Mon, 16 Feb 2026 21:11:01 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a627a5sm14588823b3a.27.2026.02.16.21.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 21:11:01 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: Fix multiple CVEs
Date: Tue, 17 Feb 2026 10:40:29 +0530
Message-ID: <20260217051029.99734-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 05:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124434

Backport fixes for :

* CVE-2024-8645  - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/8e5f8de8836d3a81276ae5b9bf78cbac58bb6108
* CVE-2026-0960  - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/f31123dcdbac37272046b58b2f7941bc7fb42934
* CVE-2025-13945 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/9139917bd8e2c80a5db7079993d5528db74e3519

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2024-8645.patch       |  88 +++++
 .../wireshark/files/CVE-2025-13945.patch      | 339 ++++++++++++++++++
 .../wireshark/files/CVE-2026-0960.patch       |  43 +++
 .../wireshark/wireshark_3.4.16.bb             |   3 +
 4 files changed, 473 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-8645.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13945.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-8645.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-8645.patch
new file mode 100644
index 0000000000..e610133ccf
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2024-8645.patch
@@ -0,0 +1,88 @@
+From 15c4d1f9078b484cb95ef645a7d4dc68212849f7 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Wed, 29 May 2024 14:23:04 +0000
+Subject: SPRT: Fix crash
+
+SDP can setup a RTP conversation with a setup frame before the current
+frame, which changes the dissection on the second pass. If in the period
+in the middle there is a SPRT packet, it can be dissected differently on
+the second pass, and the SPRT conversation data won't be found on the
+second pass.
+
+Fix #19559 (at least prevent the crash. There's some more cleanup that
+should happen.)
+
+(cherry picked from commit 05f6364cbd766e8758f98c5ee2070aef27c1ffef)
+
+CVE: CVE-2024-8645
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/8e5f8de8836d3a81276ae5b9bf78cbac58bb6108]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-rtp.c  |  3 +++
+ epan/dissectors/packet-sprt.c | 29 +++++++++++++++++------------
+ 2 files changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/epan/dissectors/packet-rtp.c b/epan/dissectors/packet-rtp.c
+index e96d994..ed4a78a 100644
+--- a/epan/dissectors/packet-rtp.c
++++ b/epan/dissectors/packet-rtp.c
+@@ -1092,6 +1092,9 @@ srtp_add_address(packet_info *pinfo, const port_type ptype, address *addr, int p
+      * If not, create a new conversation.
+      */
+     if (!p_conv || p_conv->setup_frame != setup_frame_number) {
++        /* XXX - If setup_frame_number < pinfo->num, creating this conversation
++         * can mean that the dissection is different on later passes.
++         */
+         p_conv = conversation_new(setup_frame_number, addr, &null_addr, conversation_pt_to_endpoint_type(ptype),
+                                   (guint32)port, (guint32)other_port,
+                       NO_ADDR2 | (!other_port ? NO_PORT2 : 0));
+diff --git a/epan/dissectors/packet-sprt.c b/epan/dissectors/packet-sprt.c
+index 17bf329..726cbf0 100644
+--- a/epan/dissectors/packet-sprt.c
++++ b/epan/dissectors/packet-sprt.c
+@@ -1341,6 +1341,23 @@ dissect_sprt(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data _U_
+     /*guint16 tcn;*/
+     /*guint16 sqn;*/
+ 
++    /* Get conversation data, or create it if not found */
++    p_conv_data = find_sprt_conversation_data(pinfo);
++    if (!p_conv_data)
++    {
++        sprt_add_address(pinfo,
++            &pinfo->src, pinfo->srcport,
++            0,
++            "SPRT stream",
++            pinfo->num);
++        p_conv_data = find_sprt_conversation_data(pinfo);
++        if (!p_conv_data) {
++            // This shouldn't happen; likely a new RTP conversation was set up
++            // after this frame but with a setup frame before this one.
++            return 0;
++        }
++    }
++
+     /* Make entries in Protocol column and Info column on summary display */
+     col_set_str(pinfo->cinfo, COL_PROTOCOL, "SPRT");
+     col_clear(pinfo->cinfo, COL_INFO);
+@@ -1395,18 +1412,6 @@ dissect_sprt(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data _U_
+ 
+     noa = (tvb_get_ntohs(tvb, offset + 4) & 0xC000) >> 14;
+ 
+-    /* Get conversation data, or create it if not found */
+-    p_conv_data = find_sprt_conversation_data(pinfo);
+-    if (!p_conv_data)
+-    {
+-        sprt_add_address(pinfo,
+-            &pinfo->src, pinfo->srcport,
+-            0,
+-            "SPRT stream",
+-            pinfo->num);
+-        p_conv_data = find_sprt_conversation_data(pinfo);
+-    }
+-
+     proto_tree_add_item(sprt_tree, hf_sprt_header_extension_bit, tvb, offset, 1, ENC_BIG_ENDIAN);
+     proto_tree_add_item(sprt_tree, hf_sprt_subsession_id, tvb, offset, 1, ENC_BIG_ENDIAN);
+     offset++;
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-13945.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-13945.patch
new file mode 100644
index 0000000000..9bdc7ecc54
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-13945.patch
@@ -0,0 +1,339 @@
+From: John Thacker <johnthacker@gmail.com>
+Date: Fri, 14 Nov 2025 20:20:44 -0500
+Subject: epan: Use a GSequence for tvb_composite and make it non-recursive
+
+To speed up tvb_composites consisting of many child tvbuffs,
+use a GSequence. This is a data structure that internally has
+a balanced binary tree. It differs from GTree in that one can
+do initial insertions without sorting. In our case, the ordering
+at the time of tvb_composite_finalize is *the* ordering, and is
+the same ordering that comparing according to the calculated
+end offsets will have, so this is faster on insert than a GTree.
+
+Like a GTree, it is much faster O(log N) vs O(N) on lookup to find
+the location of the TVB with end offset greater than or equal to
+the desired offset than using a GQueue.
+
+Also, make composite_memcpy iterative instead of recursive, which
+removes the current hard limit of 500 without causing stack overflow
+with very large numbers of child TVBs.
+
+The file in #20860 works fine now but there could still be limits
+imposed (at least on the total number of bytes?) for a compression
+bomb more similar to the file found in #12077.
+
+(backported from commit 9139917bd8e2c80a5db7079993d5528db74e3519)
+
+origin: https://gitlab.com/wireshark/wireshark/-/merge_requests/22318
+
+CVE: CVE-2025-13945
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/9139917bd8e2c80a5db7079993d5528db74e3519]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/tvbuff_composite.c | 177 ++++++++++++++++++++++++++--------------
+ 1 file changed, 114 insertions(+), 63 deletions(-)
+
+diff --git a/epan/tvbuff_composite.c b/epan/tvbuff_composite.c
+index 3ba1999..5296fa0 100644
+--- a/epan/tvbuff_composite.c
++++ b/epan/tvbuff_composite.c
+@@ -16,14 +16,49 @@
+ #include "proto.h"	/* XXX - only used for DISSECTOR_ASSERT, probably a new header file? */
+ 
+ typedef struct {
+-	GSList		*tvbs;
+-
++	tvbuff_t *tvb;
+ 	/* Used for quick testing to see if this
+ 	 * is the tvbuff that a COMPOSITE is
+ 	 * interested in. */
+-	guint		*start_offsets;
+-	guint		*end_offsets;
++	unsigned start_offset;
++	unsigned end_offset;
++} tvb_comp_member_t;
++
++static int
++tvb_comp_off_compare(const void *a, const void *b, void *user_data)
++{
++	tvb_comp_member_t* off_a = (tvb_comp_member_t*)a;
++	tvb_comp_member_t* off_b = (tvb_comp_member_t*)b;
++	tvb_comp_member_t* key = (tvb_comp_member_t*)user_data;
++
++	if (off_a->end_offset < off_b->end_offset)
++		return -1;
++	else if (off_a->end_offset > off_b->end_offset)
++		return 1;
++
++	/* This is a hack to ensure that in cases of ties, key is always
++	 * sorted first. This ensures that g_sequence_search returns an
++	 * iterator pointing to the tvb in the sequence with a matching
++	 * offset instead of the node after it. (It would be simpler but
++	 * somewhat slower to have the natural comparison function and
++	 * call g_sequence_lookup followed by g_sequence_search in case
++	 * of failure.)
++	 *
++	 * If we allowed zero length TVBs to be part of the composite,
++	 * we might have to search through all the TVBs with the same
++	 * end_offset to find the right one. (Or maybe we could just
++	 * no-op and not add the zero length TVBs?)
++	 */
++	if (off_a == key) {
++		return -1;
++	} else if (off_b == key) {
++		return 1;
++	}
++	return 0;
++}
+ 
++typedef struct {
++	GSequence	*tvbs;
+ } tvb_comp_t;
+ 
+ struct tvb_composite {
+@@ -38,11 +73,9 @@ composite_free(tvbuff_t *tvb)
+ 	struct tvb_composite *composite_tvb = (struct tvb_composite *) tvb;
+ 	tvb_comp_t *composite = &composite_tvb->composite;
+ 
+-	g_slist_free(composite->tvbs);
++	g_sequence_free(composite->tvbs);
+ 
+-	g_free(composite->start_offsets);
+-	g_free(composite->end_offsets);
+-	g_free((gpointer)tvb->real_data);
++	g_free((void *)tvb->real_data);
+ }
+ 
+ static guint
+@@ -55,8 +88,8 @@ static const guint8*
+ composite_get_ptr(tvbuff_t *tvb, guint abs_offset, guint abs_length)
+ {
+ 	struct tvb_composite *composite_tvb = (struct tvb_composite *) tvb;
+-	guint	    i, num_members;
+ 	tvb_comp_t *composite;
++	tvb_comp_member_t *member = NULL;
+ 	tvbuff_t   *member_tvb = NULL;
+ 	guint	    member_offset;
+ 	GSList	   *slist;
+@@ -66,23 +99,19 @@ composite_get_ptr(tvbuff_t *tvb, guint abs_offset, guint abs_length)
+ 	/* Maybe the range specified by offset/length
+ 	 * is contiguous inside one of the member tvbuffs */
+ 	composite = &composite_tvb->composite;
+-	num_members = g_slist_length(composite->tvbs);
+ 
+-	for (i = 0; i < num_members; i++) {
+-		if (abs_offset <= composite->end_offsets[i]) {
+-			slist = g_slist_nth(composite->tvbs, i);
+-			member_tvb = (tvbuff_t *)slist->data;
+-			break;
+-		}
+-	}
++	tvb_comp_member_t key = { .end_offset = abs_offset };
++	GSequenceIter *iter = g_sequence_search(composite->tvbs, &key, tvb_comp_off_compare, &key);
+ 
+ 	/* special case */
+-	if (!member_tvb) {
++	if (g_sequence_iter_is_end(iter)) {
+ 		DISSECTOR_ASSERT(abs_offset == tvb->length && abs_length == 0);
+ 		return "";
+ 	}
+ 
+-	member_offset = abs_offset - composite->start_offsets[i];
++	member = (tvb_comp_member_t *)g_sequence_get(iter);
++	member_tvb = member->tvb;
++	member_offset = abs_offset - member->start_offset;
+ 
+ 	if (tvb_bytes_exist(member_tvb, member_offset, abs_length)) {
+ 		/*
+@@ -108,8 +137,8 @@ composite_memcpy(tvbuff_t *tvb, void* _target, guint abs_offset, guint abs_lengt
+ 	struct tvb_composite *composite_tvb = (struct tvb_composite *) tvb;
+ 	guint8 *target = (guint8 *) _target;
+ 
+-	guint	    i, num_members;
+ 	tvb_comp_t *composite;
++	tvb_comp_member_t *member = NULL;
+ 	tvbuff_t   *member_tvb = NULL;
+ 	guint	    member_offset, member_length;
+ 	GSList	   *slist;
+@@ -119,23 +148,18 @@ composite_memcpy(tvbuff_t *tvb, void* _target, guint abs_offset, guint abs_lengt
+ 	/* Maybe the range specified by offset/length
+ 	 * is contiguous inside one of the member tvbuffs */
+ 	composite   = &composite_tvb->composite;
+-	num_members = g_slist_length(composite->tvbs);
+-
+-	for (i = 0; i < num_members; i++) {
+-		if (abs_offset <= composite->end_offsets[i]) {
+-			slist = g_slist_nth(composite->tvbs, i);
+-			member_tvb = (tvbuff_t *)slist->data;
+-			break;
+-		}
+-	}
++	tvb_comp_member_t key = { .end_offset = abs_offset };
++	GSequenceIter *iter = g_sequence_search(composite->tvbs, &key, tvb_comp_off_compare, &key);
+ 
+ 	/* special case */
+-	if (!member_tvb) {
++	if (g_sequence_iter_is_end(iter)) {
+ 		DISSECTOR_ASSERT(abs_offset == tvb->length && abs_length == 0);
+ 		return target;
+ 	}
+ 
+-	member_offset = abs_offset - composite->start_offsets[i];
++	member = (tvb_comp_member_t *)g_sequence_get(iter);
++	member_tvb = member->tvb;
++	member_offset = abs_offset - member->start_offset;
+ 
+ 	if (tvb_bytes_exist(member_tvb, member_offset, abs_length)) {
+ 		DISSECTOR_ASSERT(!tvb->real_data);
+@@ -147,18 +171,32 @@ composite_memcpy(tvbuff_t *tvb, void* _target, guint abs_offset, guint abs_lengt
+ 		 * then iterate across the other member tvb's, copying their portions
+ 		 * until we have copied all data.
+ 		 */
+-		member_length = tvb_captured_length_remaining(member_tvb, member_offset);
+ 
+-		/* composite_memcpy() can't handle a member_length of zero. */
+-		DISSECTOR_ASSERT(member_length > 0);
++		unsigned target_offset = 0;
++		while (abs_length) {
+ 
+-		tvb_memcpy(member_tvb, target, member_offset, member_length);
+-		abs_offset	+= member_length;
+-		abs_length	-= member_length;
++			member_length = tvb_captured_length_remaining(member_tvb, member_offset);
+ 
+-		/* Recurse */
+-		if (abs_length > 0) {
+-			composite_memcpy(tvb, target + member_length, abs_offset, abs_length);
++			/* composite_memcpy() can't handle a member_length of zero. */
++			DISSECTOR_ASSERT(member_length > 0);
++
++			member_length = MIN(member_length, abs_length);
++
++			tvb_memcpy(member_tvb, target + target_offset, member_offset, member_length);
++			target_offset   += member_length;
++			abs_offset	+= member_length;
++			abs_length	-= member_length;
++
++			if (!abs_length)
++				break;
++			iter = g_sequence_iter_next(iter);
++			/* tvb_memcpy calls check_offset_length and so there
++			 * should be enough captured length to copy. */
++			DISSECTOR_ASSERT(!g_sequence_iter_is_end(iter));
++
++			member = (tvb_comp_member_t *)g_sequence_get(iter);
++			member_tvb = member->tvb;
++			member_offset = 0;
+ 		}
+ 
+ 		return target;
+@@ -198,9 +236,7 @@ tvb_new_composite(void)
+ 	struct tvb_composite *composite_tvb = (struct tvb_composite *) tvb;
+ 	tvb_comp_t *composite = &composite_tvb->composite;
+ 
+-	composite->tvbs		 = NULL;
+-	composite->start_offsets = NULL;
+-	composite->end_offsets	 = NULL;
++	composite->tvbs		 = g_sequence_new(g_free);
+ 
+ 	return tvb;
+ }
+@@ -220,12 +256,15 @@ tvb_composite_append(tvbuff_t *tvb, tvbuff_t *member)
+ 	DISSECTOR_ASSERT(member->length);
+ 
+ 	composite       = &composite_tvb->composite;
+-	composite->tvbs = g_slist_append(composite->tvbs, member);
+-
+ 	/* Attach the composite TVB to the first TVB only. */
+-	if (!composite->tvbs->next) {
+-		tvb_add_to_chain((tvbuff_t *)composite->tvbs->data, tvb);
++	if (g_sequence_is_empty(composite->tvbs)) {
++		tvb_add_to_chain(member, tvb);
+ 	}
++	tvb_comp_member_t *new_member = g_new(tvb_comp_member_t, 1);
++	new_member->tvb = member;
++	new_member->start_offset = 0;
++	new_member->end_offset = 0;
++	g_sequence_append(composite->tvbs, new_member);
+ }
+ 
+ void
+@@ -243,20 +282,24 @@ tvb_composite_prepend(tvbuff_t *tvb, tvbuff_t *member)
+ 	DISSECTOR_ASSERT(member->length);
+ 
+ 	composite       = &composite_tvb->composite;
+-	composite->tvbs = g_slist_prepend(composite->tvbs, member);
+-
+ 	/* Attach the composite TVB to the first TVB only. */
+-	if (!composite->tvbs->next) {
+-		tvb_add_to_chain((tvbuff_t *)composite->tvbs->data, tvb);
++	if (g_sequence_is_empty(composite->tvbs)) {
++		tvb_add_to_chain(member, tvb);
+ 	}
++	tvb_comp_member_t *new_member = g_new(tvb_comp_member_t, 1);
++	new_member->tvb = member;
++	new_member->start_offset = 0;
++	new_member->end_offset = 0;
++	g_sequence_prepend(composite->tvbs, new_member);
+ }
+ 
+ void
+ tvb_composite_finalize(tvbuff_t *tvb)
+ {
+ 	struct tvb_composite *composite_tvb = (struct tvb_composite *) tvb;
+-	GSList	   *slist;
+-	guint	    num_members;
++
++	unsigned	num_members;
++	tvb_comp_member_t *member;
+ 	tvbuff_t   *member_tvb;
+ 	tvb_comp_t *composite;
+ 	int	    i = 0;
+@@ -268,26 +311,34 @@ tvb_composite_finalize(tvbuff_t *tvb)
+ 	DISSECTOR_ASSERT(tvb->contained_length == 0);
+ 
+ 	composite   = &composite_tvb->composite;
+-	num_members = g_slist_length(composite->tvbs);
++
++	num_members = g_sequence_get_length(composite->tvbs);
+ 
+ 	/* Dissectors should not create composite TVBs if they're not going to
+ 	 * put at least one TVB in them.
+ 	 * (Without this check--or something similar--we'll seg-fault below.)
++	 * (XXX - Now with a GSequence we shouldn't segfault, we'll get the
++	 * end iterator and it should work, so we could remove this and some
++	 * checks in dissectors to simplify their code.)
+ 	 */
+ 	DISSECTOR_ASSERT(num_members);
+ 
+-	composite->start_offsets = g_new(guint, num_members);
+-	composite->end_offsets = g_new(guint, num_members);
+-
+-	for (slist = composite->tvbs; slist != NULL; slist = slist->next) {
+-		DISSECTOR_ASSERT((guint) i < num_members);
+-		member_tvb = (tvbuff_t *)slist->data;
+-		composite->start_offsets[i] = tvb->length;
++	/* Record the offsets - we have to do that now because it's possible
++	 * to prepend TVBs. Note that the GSequence is already sorted according
++	 * to these offsets, we're just noting them, so we don't need to sort.
++	 */
++	GSequenceIter *iter = g_sequence_get_begin_iter(composite->tvbs);
++	for (i=0; i < num_members; i++, iter=g_sequence_iter_next(iter)) {
++		member = (tvb_comp_member_t *)g_sequence_get(iter);
++		member_tvb = member->tvb;
++		member->start_offset = tvb->length;
+ 		tvb->length += member_tvb->length;
++		/* XXX - What does it mean to make a composite TVB out of
++		 * TVBs with length shorter than their reported length?
++		 */
+ 		tvb->reported_length += member_tvb->reported_length;
+ 		tvb->contained_length += member_tvb->contained_length;
+-		composite->end_offsets[i] = tvb->length - 1;
+-		i++;
++		member->end_offset = tvb->length - 1;
+ 	}
+ 
+ 	tvb->initialized = TRUE;
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch b/meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
new file mode 100644
index 0000000000..d3048e9d4b
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
@@ -0,0 +1,43 @@
+From: John Thacker <johnthacker@gmail.com>
+Date: Mon, 12 Jan 2026 15:28:22 +0000
+Subject: QUIC: Update reassembly ID for a new MSP
+
+When a QUIC frame has more than one MSP, the reassembly id for the
+second MSP has to be used when adding or looking it up, instead of
+the original reassembly id of the first MSP.
+
+Fixes reassembly of the file in #20944 in most cases, outside of issues
+with out of order UDP packets / QUIC packets.
+
+(cherry picked from commit 562c3c070c6f58d01904d42338489b1a64ad7655)
+
+Co-authored-by: John Thacker <johnthacker@gmail.com>
+origin: https://gitlab.com/wireshark/wireshark/-/merge_requests/23175
+
+CVE: CVE-2026-0960
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/f31123dcdbac37272046b58b2f7941bc7fb42934]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-quic.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-quic.c b/epan/dissectors/packet-quic.c
+index 53f5e1c..83ba9c3 100644
+--- a/epan/dissectors/packet-quic.c
++++ b/epan/dissectors/packet-quic.c
+@@ -1472,9 +1472,10 @@ again:
+                     deseg_seq, nxtseq+pinfo->desegment_len, stream->multisegment_pdus);
+             }
+ 
+-            /* add this segment as the first one for this new pdu */
++            /* add this segment as the first one for this new pdu
++             * Use the the new MSP's reassembly ID (its first frame). */
+             fragment_add(&quic_reassembly_table, tvb, deseg_offset,
+-                         pinfo, reassembly_id, NULL,
++                         pinfo, msp->first_frame, stream_info,
+                          0, nxtseq - deseg_seq,
+                          nxtseq < msp->nxtpdu);
+         }
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
index a8eafe4a05..7502234d47 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
@@ -32,6 +32,9 @@ SRC_URI += " \
     file://CVE-2024-2955.patch \
     file://CVE-2025-13499.patch \
     file://CVE-2025-11626.patch \
+    file://CVE-2024-8645.patch \
+    file://CVE-2026-0960.patch \
+    file://CVE-2025-13945.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.50.1


