Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40984FCC062
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1731.1772822033975103928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SkuUSmux;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso80274565e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772822032; x=1773426832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfE9ubFPhOc7HW3gUXcNT6CanaYuk+6dfad6l/tZKzQ=;
        b=SkuUSmux1/xy/riOiU9yMO4Ip1Ovw+Peh/5v6rS3cM+4y5ENUaLpeWwjPPnh85Lqhd
         nyjmeZ1iWvykG/VT5Z1KG1TBTBpalp4ubQxdYVDC/horenAhRtJdcAD/p+SNORtjoapL
         OaUM8+oArbtZNIT9u7mOKLmkDY1rrxHcKBPA4JEMnWq4lpu1wZfzmCoMwJrdI8MxsMQW
         z+fYLcYZkpyFFRq4wgZuR3BmXkpH7YobqZ2p8KGES+2SKikbTcz9ni6qACkzhGxD+Vvg
         xQ4n9I12TZE0M2S7/K6b6+5fHWkV+N7sMOupYZcAvddrExQiCQgYjskSi9me/zxTrOeG
         q8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822032; x=1773426832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AfE9ubFPhOc7HW3gUXcNT6CanaYuk+6dfad6l/tZKzQ=;
        b=Mq8UKA1NWBK1+atStGNNXmqvf2GbURtfYOYSXD5XGwrnYywMMZmgdcI766py+UFZfy
         gQg/DPt8iqjZuOgLG1cRA9RKlMXq2wqlSe5758H04pHJReoGy8oa83hF7uEZ1sjzhXRz
         k7qYFl8M5ePxP9UftwOGO4a3Rxi6Ha15UEvsKuYybSuQogOkzRsmp5tfD35erJWOtq+d
         eKvl7xtqHJzu7ol5pwtzbHj3O2vuIxYUa24ns93C9FmDNzQJ/LIJyBYuFmGsLp/tWYZ5
         05uH4EU4vpd/qbkFkGtBGfgCWHB8d2JUezFImKO14cCbXa2dmGfzmbW/ZPDtHQTn4a6W
         CcMA==
X-Gm-Message-State: AOJu0Yyn3P8uEV3MBKNDsEkP3nCOOMHsvfydT+x8UIsGGH3ieo+Y942l
	Tp25qRnTvVkuAeKi5lcQGsMqyvLdS0To5GeHGER/HcweioRk9E/S1ydFuymtTg==
X-Gm-Gg: ATEYQzwcwa+m/OD+DZSk/HjuN1+a++biHbVNFLaWXaGR2JCtBoZOiLG9DGl8R+kqrev
	OYKU3DTdzR1DOnNmX3S3Z7dZiMlDGbstE+E2GmEi8vgDKnCpGX7MWWvHZbHjhCG4vqagFoaDJof
	LZngNcGeyPp03r3PMqMC1xOUXJHOhwoK4yI8poBtnk9ShSNJWcJ/qCyCPfe80t4l7d5UWjmnkEm
	4Ykf8SXgSsMXNaa3OcqJi7nCzR1IloxqWtNtow6BFNDq2l2lwP7kgV6vy2ibqQu65UaCD/Rzl0R
	/cdlqlFF6N1xJ34ES+lgwavhA6WkxAbzp9lT8JQheBk9d8G+v336NQC7eEPj1RzBTIPuPJtgKq3
	SEF0yDKfk+fMCpDaBAQBuDqwpP1LcHx246GEZRy893EYOpBou74UzbOSv5g+kp2chCzjIpQT/ug
	xcskHb1VibC4ASINNzi4+i
X-Received: by 2002:a05:600c:198f:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-485268b8dbemr52008235e9.0.1772822032051;
        Fri, 06 Mar 2026 10:33:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm5846929f8f.36.2026.03.06.10.33.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 6/6] unbound: patch CVE-2025-5994
Date: Fri,  6 Mar 2026 19:33:47 +0100
Message-ID: <20260306183347.1014705-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306183347.1014705-1-skandigraun@gmail.com>
References: <20260306183347.1014705-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 18:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124922

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-5994

Backport the patch[1] provided by upstream, which is linked in
the upstream advisory[2] referenced by the NVD report.

Tests passed successfully in a locally prepared ptest image.

[1]: https://nlnetlabs.nl/downloads/unbound/patch_CVE-2025-5994_2.diff
[1]: https://nlnetlabs.nl/downloads/unbound/CVE-2025-5994.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../unbound/unbound/CVE-2025-5994.patch       | 279 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.22.0.bb |   1 +
 2 files changed, 280 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
new file mode 100644
index 0000000000..84a5a4d37e
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
@@ -0,0 +1,279 @@
+From d2d6b068e26ddb213b5e339b31609c89ae634c54 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 6 Mar 2026 19:09:55 +0100
+Subject: [PATCH] Fix RebirthDay Attack CVE-2025-5994, reported by Xiang Li 
+ from AOSP   Lab Nankai University.
+
+This patch was taken from https://nlnetlabs.nl/downloads/unbound/CVE-2025-5994.txt,
+but it is identical to the one mentioned in the Upstream-Status.
+
+CVE: CVE-2025-5994
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/5bf82f246481098a6473f296b21fc1229d276c0f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ edns-subnet/subnetmod.c | 152 ++++++++++++++++++++++++++++++++++++----
+ edns-subnet/subnetmod.h |   4 ++
+ 2 files changed, 142 insertions(+), 14 deletions(-)
+
+diff --git a/edns-subnet/subnetmod.c b/edns-subnet/subnetmod.c
+index ead720f3..c5e215b8 100644
+--- a/edns-subnet/subnetmod.c
++++ b/edns-subnet/subnetmod.c
+@@ -51,6 +51,7 @@
+ #include "services/cache/dns.h"
+ #include "util/module.h"
+ #include "util/regional.h"
++#include "util/fptr_wlist.h"
+ #include "util/storage/slabhash.h"
+ #include "util/config_file.h"
+ #include "util/data/msgreply.h"
+@@ -155,7 +156,8 @@ int ecs_whitelist_check(struct query_info* qinfo,
+ 
+ 	/* Cache by default, might be disabled after parsing EDNS option
+ 	 * received from nameserver. */
+-	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL, NULL, 0)) {
++	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL, NULL, 0)
++		&& sq->ecs_client_in.subnet_validdata) {
+ 		qstate->no_cache_store = 0;
+ 	}
+ 
+@@ -522,6 +524,69 @@ common_prefix(uint8_t *a, uint8_t *b, uint8_t net)
+ 	return !memcmp(a, b, n) && ((net % 8) == 0 || a[n] == b[n]);
+ }
+ 
++/**
++ * Create sub request that looks up the query.
++ * @param qstate: query state
++ * @param sq: subnet qstate
++ * @return false on failure.
++ */
++static int
++generate_sub_request(struct module_qstate *qstate, struct subnet_qstate* sq)
++{
++	struct module_qstate* subq = NULL;
++	uint16_t qflags = 0; /* OPCODE QUERY, no flags */
++	int prime = 0;
++	int valrec = 0;
++	struct query_info qinf;
++	qinf.qname = qstate->qinfo.qname;
++	qinf.qname_len = qstate->qinfo.qname_len;
++	qinf.qtype = qstate->qinfo.qtype;
++	qinf.qclass = qstate->qinfo.qclass;
++	qinf.local_alias = NULL;
++
++	qflags |= BIT_RD;
++	if((qstate->query_flags & BIT_CD)!=0) {
++		qflags |= BIT_CD;
++		valrec = 1;
++	}
++
++	fptr_ok(fptr_whitelist_modenv_attach_sub(qstate->env->attach_sub));
++	if(!(*qstate->env->attach_sub)(qstate, &qinf, qflags, prime, valrec,
++		&subq)) {
++		return 0;
++	}
++	if(subq) {
++		/* It is possible to access the subquery module state. */
++		if(sq->ecs_client_in.subnet_source_mask == 0 &&
++			edns_opt_list_find(qstate->edns_opts_front_in,
++				qstate->env->cfg->client_subnet_opcode)) {
++			subq->no_cache_store = 1;
++		}
++	}
++	return 1;
++}
++
++/**
++ * Perform the query without subnet
++ * @param qstate: query state
++ * @param sq: subnet qstate
++ * @return module state
++ */
++static enum module_ext_state
++generate_lookup_without_subnet(struct module_qstate *qstate,
++	struct subnet_qstate* sq)
++{
++	verbose(VERB_ALGO, "subnetcache: make subquery to look up without subnet");
++	if(!generate_sub_request(qstate, sq)) {
++		verbose(VERB_ALGO, "Could not generate sub query");
++		qstate->return_rcode = LDNS_RCODE_FORMERR;
++		qstate->return_msg = NULL;
++		return module_finished;
++	}
++	sq->wait_subquery = 1;
++	return module_wait_subquery;
++}
++
+ static enum module_ext_state
+ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
+ {
+@@ -557,14 +622,7 @@ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
+ 		 * is still useful to put it in the edns subnet cache for
+ 		 * when a client explicitly asks for subnet specific answer. */
+ 		verbose(VERB_QUERY, "subnetcache: Authority indicates no support");
+-		if(!sq->started_no_cache_store) {
+-			lock_rw_wrlock(&sne->biglock);
+-			update_cache(qstate, id);
+-			lock_rw_unlock(&sne->biglock);
+-		}
+-		if (sq->subnet_downstream)
+-			cp_edns_bad_response(c_out, c_in);
+-		return module_finished;
++		return generate_lookup_without_subnet(qstate, sq);
+ 	}
+ 
+ 	/* Purposefully there was no sent subnet, and there is consequently
+@@ -589,14 +647,14 @@ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
+ 		!common_prefix(s_out->subnet_addr, s_in->subnet_addr, 
+ 			s_out->subnet_source_mask))
+ 	{
+-		/* we can not accept, restart query without option */
++		/* we can not accept, perform query without option */
+ 		verbose(VERB_QUERY, "subnetcache: forged data");
+ 		s_out->subnet_validdata = 0;
+ 		(void)edns_opt_list_remove(&qstate->edns_opts_back_out,
+ 			qstate->env->cfg->client_subnet_opcode);
+ 		sq->subnet_sent = 0;
+ 		sq->subnet_sent_no_subnet = 0;
+-		return module_restart_next;
++		return generate_lookup_without_subnet(qstate, sq);
+ 	}
+ 
+ 	lock_rw_wrlock(&sne->biglock);
+@@ -795,6 +853,9 @@ ecs_edns_back_parsed(struct module_qstate* qstate, int id,
+ 	} else if(sq->subnet_sent_no_subnet) {
+ 		/* The answer can be stored as scope 0, not in global cache. */
+ 		qstate->no_cache_store = 1;
++	} else if(sq->subnet_sent) {
++		/* Need another query to be able to store in global cache. */
++		qstate->no_cache_store = 1;
+ 	}
+ 
+ 	return 1;
+@@ -812,6 +873,32 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 		strmodulevent(event));
+ 	log_query_info(VERB_QUERY, "subnetcache operate: query", &qstate->qinfo);
+ 
++	if(sq && sq->wait_subquery_done) {
++		/* The subquery lookup returned. */
++		if(sq->ecs_client_in.subnet_source_mask == 0 &&
++			edns_opt_list_find(qstate->edns_opts_front_in,
++				qstate->env->cfg->client_subnet_opcode)) {
++			if(!sq->started_no_cache_store &&
++				qstate->return_msg) {
++				lock_rw_wrlock(&sne->biglock);
++				update_cache(qstate, id);
++				lock_rw_unlock(&sne->biglock);
++			}
++			if (sq->subnet_downstream)
++				cp_edns_bad_response(&sq->ecs_client_out,
++					&sq->ecs_client_in);
++			/* It is a scope zero lookup, append edns subnet
++			 * option to the querier. */
++			subnet_ecs_opt_list_append(&sq->ecs_client_out,
++				&qstate->edns_opts_front_out, qstate,
++				qstate->region);
++		}
++		sq->wait_subquery_done = 0;
++		qstate->ext_state[id] = module_finished;
++		qstate->no_cache_store = sq->started_no_cache_store;
++		qstate->no_cache_lookup = sq->started_no_cache_lookup;
++		return;
++	}
+ 	if((event == module_event_new || event == module_event_pass) &&
+ 		sq == NULL) {
+ 		struct edns_option* ecs_opt;
+@@ -822,6 +909,8 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 		}
+ 
+ 		sq = (struct subnet_qstate*)qstate->minfo[id];
++		if(sq->wait_subquery)
++			return; /* Wait for that subquery to return */
+ 
+ 		if((ecs_opt = edns_opt_list_find(
+ 			qstate->edns_opts_front_in,
+@@ -851,6 +940,14 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 			/* No clients are interested in result or we could not
+ 			 * parse it, we don't do client subnet */
+ 			sq->ecs_server_out.subnet_validdata = 0;
++			if(edns_opt_list_find(qstate->edns_opts_front_in,
++				qstate->env->cfg->client_subnet_opcode)) {
++				/* aggregated this deaggregated state */
++				qstate->ext_state[id] =
++					generate_lookup_without_subnet(
++					qstate, sq);
++				return;
++			}
+ 			verbose(VERB_ALGO, "subnetcache: pass to next module");
+ 			qstate->ext_state[id] = module_wait_module;
+ 			return;
+@@ -891,6 +988,14 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 			}
+ 			lock_rw_unlock(&sne->biglock);
+ 		}
++		if(sq->ecs_client_in.subnet_source_mask == 0 &&
++			edns_opt_list_find(qstate->edns_opts_front_in,
++				qstate->env->cfg->client_subnet_opcode)) {
++			/* client asked for resolution without edns subnet */
++			qstate->ext_state[id] = generate_lookup_without_subnet(
++				qstate, sq);
++			return;
++		}
+ 		
+ 		sq->ecs_server_out.subnet_addr_fam =
+ 			sq->ecs_client_in.subnet_addr_fam;
+@@ -927,6 +1032,8 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 		qstate->ext_state[id] = module_wait_module;
+ 		return;
+ 	}
++	if(sq && sq->wait_subquery)
++		return; /* Wait for that subquery to return */
+ 	/* Query handed back by next module, we have a 'final' answer */
+ 	if(sq && event == module_event_moddone) {
+ 		qstate->ext_state[id] = eval_response(qstate, id, sq);
+@@ -975,10 +1082,27 @@ subnetmod_clear(struct module_qstate *ATTR_UNUSED(qstate),
+ }
+ 
+ void
+-subnetmod_inform_super(struct module_qstate *ATTR_UNUSED(qstate),
+-	int ATTR_UNUSED(id), struct module_qstate *ATTR_UNUSED(super))
++subnetmod_inform_super(struct module_qstate *qstate, int id,
++	struct module_qstate *super)
+ {
+-	/* Not used */
++	struct subnet_qstate* super_sq =
++		(struct subnet_qstate*)super->minfo[id];
++	log_query_info(VERB_ALGO, "subnetcache inform_super: query",
++		&super->qinfo);
++	super_sq->wait_subquery = 0;
++	super_sq->wait_subquery_done = 1;
++	if(qstate->return_rcode != LDNS_RCODE_NOERROR ||
++		!qstate->return_msg) {
++		super->return_msg = NULL;
++		super->return_rcode = LDNS_RCODE_SERVFAIL;
++		return;
++	}
++	super->return_rcode = LDNS_RCODE_NOERROR;
++	super->return_msg = dns_copy_msg(qstate->return_msg, super->region);
++	if(!super->return_msg) {
++		log_err("subnetcache: copy response, out of memory");
++		super->return_rcode = LDNS_RCODE_SERVFAIL;
++	}
+ }
+ 
+ size_t
+diff --git a/edns-subnet/subnetmod.h b/edns-subnet/subnetmod.h
+index 1ff8a23e..3893820f 100644
+--- a/edns-subnet/subnetmod.h
++++ b/edns-subnet/subnetmod.h
+@@ -102,6 +102,10 @@ struct subnet_qstate {
+ 	int started_no_cache_store;
+ 	/** has the subnet module been started with no_cache_lookup? */
+ 	int started_no_cache_lookup;
++	/** Wait for subquery that has been started for nonsubnet lookup. */
++	int wait_subquery;
++	/** The subquery waited for is done. */
++	int wait_subquery_done;
+ };
+ 
+ void subnet_data_delete(void* d, void* ATTR_UNUSED(arg));
diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
index c35148b77e..4903371f1e 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
            file://run-ptest \
            file://0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch \
+           file://CVE-2025-5994.patch \
            "
 
 # 17 commits after 1.22.0 tag:

