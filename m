Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57554CCFA08
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 11:24:22 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14223.1762250353934610870
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 01:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhvqQSxT;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: nmjain23@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso1652499137.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 01:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762250353; x=1762855153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TuV7aLiOpi0WfTS05DKEo6Y2tp4D1Xr5/UNrhCbrcLs=;
        b=KhvqQSxTwwKcWARIijKlaMXtMlQSI4rRD3N6U+J9I7LWGPy06Q38buspSS2erLBi0B
         DMNsyQxtTZZ5f8t4SmppK21sSs5FwdNlki2AJ8D1k7ptyMoglXPCvVZ7A+P4TmNq8SHR
         umPzB+8t5SWgyoBMNM9OhTSN+7nWMgmsgdYrgAturFlrfSvMmooKuEToigVrBymnAZWm
         /P+n3yHo5zRJrL+FZHxpVNLUE/DcB9rfy4ycOKEzcY51jiEqWsm36G++hu+4PcmRUplp
         MDgQ9z829d3w/0nQ4CjRHu4jc0qbtLex3qdg0x++leWJMwQSDrpoyEg5bdOGYrVdyJie
         wBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762250353; x=1762855153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuV7aLiOpi0WfTS05DKEo6Y2tp4D1Xr5/UNrhCbrcLs=;
        b=PB2pqai2gO3nNPKH96zDzB5VJxnHnTGfjRGhrAHeJDgGInZaB4UteVgOhcfVxkIPgj
         QlWsNmSH+NsRiHzck5MuYP9ihfSFNjfKH0O3+H5B2UPWi+H00fUgx3LYnMtPYJt4M4da
         9e/apzG+siMvrEafYerCOF8LDQ9p0KPOdI7P6WsSnYYISQy6vcPlOjHSPDpgFSAOGvbt
         Xn8zpZhfAKPRGHH7gfmaxwB/WdCVRawI1/nIn4hVphufvsF9qv5BfYCA2Ykj75w6Lo9x
         BwPyhKzwaRYNb4kwYpnZCvL5CZaezoUcmVnv+uGITEA9IyTpANaywJO69F80wjtJGc/6
         kT5Q==
X-Gm-Message-State: AOJu0YyBHe0mRr6DnsWiPzxfrSnmfvQiig+3Glk7WcseGgPM1gYLGnNM
	JRIFxXDA+uhO6FMpDbcFdppk4Cn/aZ06bBTwfSahPXFE3DSUxID4axvJfpMb5Q==
X-Gm-Gg: ASbGncvBUJzWXaGOeR0FZ5R+ikEjARp5vAtY3UiZi45Va5PqEUFVINMZEteZX64A/zL
	/MbajPSuuQBGidgM/10qKvGAbwlRyEacbNox9DxYr9jeyJfgMDvvA/qPhQy3yf1yPF+k8OZgr7Y
	fx3Ip8jEe8/LGnG7RaPmeRHUnVsCc5SjFUHKKvA8Qg96PPfbispD6kOOMoXVn6HdJfy3prvy3+A
	R423GIBw0SKZ8RpWHKRArdima9c+7IuNEUZSfYWRCSuCezw+ewX1Nt/WDS5gR6btWL5qMpgpFqR
	O4blCJXMGj1AX7oJCcgGDnPBIp44J1MFXlSvBJ2jEABvittMPTTplD1wu6/gZARzhokCTFUbY/W
	kSxatpJsCRBI20mGApI/2SH9kkskR41obXscP07r3Oqpyw34Q43M8qVtYJaFwFbFgPlQsGCEFxM
	Fm8hMNzS11f/8kyegD27A=
X-Google-Smtp-Source: AGHT+IEE+nvVVjk5jXYtlkFZPGskKNzRcjAzf7eWFkBGGfhEu3EdAobfIHBO5Gg+UkSz5zKYpF/vtQ==
X-Received: by 2002:a05:6a20:6a06:b0:32d:a91a:7713 with SMTP id adf61e73a8af0-348cc2cf3fbmr22175980637.40.1762250005142;
        Tue, 04 Nov 2025 01:53:25 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([2409:40c2:102b:1278:80a8:d029:241:1657])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341599f14bbsm4027938a91.13.2025.11.04.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 01:53:24 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra.Thakur@kpit.com
Subject: [meta-oe][scarthgap][PATCH] unbound: Fix CVE-2025-5994
Date: Tue,  4 Nov 2025 15:22:56 +0530
Message-Id: <20251104095256.3402683-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121294

A multi-vendor cache poisoning vulnerability named 'Rebirthday Attack' has been
discovered in caching resolvers that support EDNS Client Subnet (ECS). Unbound is
also vulnerable when compiled with ECS support, i.e., '--enable-subnet', AND
configured to send ECS information along with queries to upstream name servers

CVE: CVE-2025-5994

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../unbound/unbound/CVE-2025-5994.patch       | 275 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
 2 files changed, 276 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
new file mode 100644
index 0000000000..b6c0e37e43
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
@@ -0,0 +1,275 @@
+Backport of:
+
+From 5bf82f246481098a6473f296b21fc1229d276c0f Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 16 Jul 2025 10:02:01 +0200
+Subject: [PATCH] - Fix RebirthDay Attack CVE-2025-5994, reported by Xiang Li
+ from AOSP   Lab Nankai University.
+
+CVE: CVE-2025-5994
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/5bf82f246481098a6473f296b21fc1229d276c0f]
+Signed-off-by: Naman Jain <namanj1@kpit.com> 
+
+---
+ edns-subnet/subnetmod.c | 152 ++++++++++++++++++++++++++++++++++++----
+ edns-subnet/subnetmod.h |   4 ++
+ 2 files changed, 142 insertions(+), 14 deletions(-)
+
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
+@@ -152,7 +153,8 @@ int ecs_whitelist_check(struct query_inf
+ 
+ 	/* Cache by default, might be disabled after parsing EDNS option
+ 	 * received from nameserver. */
+-	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)) {
++	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)
++		&& sq->ecs_client_in.subnet_validdata) {
+ 		qstate->no_cache_store = 0;
+ 	}
+ 
+@@ -504,6 +506,69 @@ common_prefix(uint8_t *a, uint8_t *b, ui
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
+@@ -539,14 +604,7 @@ eval_response(struct module_qstate *qsta
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
+@@ -571,14 +629,14 @@ eval_response(struct module_qstate *qsta
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
+@@ -763,6 +821,9 @@ ecs_edns_back_parsed(struct module_qstat
+ 	} else if(sq->subnet_sent_no_subnet) {
+ 		/* The answer can be stored as scope 0, not in global cache. */
+ 		qstate->no_cache_store = 1;
++	} else if(sq->subnet_sent) {
++		/* Need another query to be able to store in global cache. */
++		qstate->no_cache_store = 1;
+ 	}
+ 
+ 	return 1;
+@@ -780,6 +841,32 @@ subnetmod_operate(struct module_qstate *
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
+@@ -790,6 +877,8 @@ subnetmod_operate(struct module_qstate *
+ 		}
+ 
+ 		sq = (struct subnet_qstate*)qstate->minfo[id];
++		if(sq->wait_subquery)
++			return; /* Wait for that subquery to return */
+ 
+ 		if((ecs_opt = edns_opt_list_find(
+ 			qstate->edns_opts_front_in,
+@@ -819,6 +908,14 @@ subnetmod_operate(struct module_qstate *
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
+@@ -859,6 +956,14 @@ subnetmod_operate(struct module_qstate *
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
+@@ -895,6 +1000,8 @@ subnetmod_operate(struct module_qstate *
+ 		qstate->ext_state[id] = module_wait_module;
+ 		return;
+ 	}
++	if(sq && sq->wait_subquery)
++		return; /* Wait for that subquery to return */
+ 	/* Query handed back by next module, we have a 'final' answer */
+ 	if(sq && event == module_event_moddone) {
+ 		qstate->ext_state[id] = eval_response(qstate, id, sq);
+@@ -943,10 +1050,27 @@ subnetmod_clear(struct module_qstate *AT
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
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 6f54038c6c..6c04ed5840 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3 \
            file://CVE-2024-8508.patch \
+           file://CVE-2025-5994.patch \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 
-- 
2.34.1


