Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FF6D167E8
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:26 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6766.1767950961036642695
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lGMvJadz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so2711687a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950960; x=1768555760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dFltR3G6lI7p9HE1U2xtPtXJ4ZQlhX+ekVUBDFnFto=;
        b=lGMvJadzlUoAXImxXI82lzZ2U37JcC1UJsBvWB+1tQJ5dxIYIhfUlze+nn7fB3hofX
         d/N9MJ0HvWR+g7f9ANnxWElkj078hntvkKCddSz9udnQiGBFsxL9bLpLN1pFIRBeX5Of
         Qj2Lhp7TpcYC9lALfn+DS44H/bDfxBp+cNKj5bsfekFYnSxVMXECBbUboMGeO9c7kND3
         E7W2gqquRMXcqNy3QY4QIKqfAv8vT7e6EXFOYGOI1i4ELDMppw5RHUgzfBk1x3ZCZe0o
         1DYVGkv+1UNW/S7cZkwx0YUFgNU63Q4VrM9ehw/uFjF5QQGQVCWWgtz9Xtrlr5hJhCjS
         jQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950960; x=1768555760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0dFltR3G6lI7p9HE1U2xtPtXJ4ZQlhX+ekVUBDFnFto=;
        b=k0ZMEYfA4/vk7rSDGUVF/2KFDVLNhRkAH7ClGGom6yeTimPPjt/QZRWGbVwaXRVmiy
         WEI7GLwIwcmQPwYZukdjH+bYvhHeyP9LohuPJiGlZz9ImKiOcCZWiZs5APl5qlW/Pd2o
         3nCgFx8klUwr2nJbW6uGHfFSeN5d5GtPCK+VcZtzHA8+WRxzLw9eHWBsRMWXqd18DHpf
         uhxxrXUJ9G5/Mf8TeUz36EK7Xg0u3k2VjFKZbnoFDde1ulx4KF6s+oDoKyFMsDkRkk1v
         Lbnhhmuf5g23j2FYWSTZIcujMfhp3NHfiJNAxWTGFsZba4ts6c12gfjMpRvtjyPHHh2n
         c8Pg==
X-Gm-Message-State: AOJu0YxuxCaHoXtMA0Q7iGs/XS+PpkvgcrYJpXaUGzfvWBCIIlWItEFR
	gyI1ULqPgQuNLGjNu1I+6hE09RHJATM2FrauUiKZWjEzmB/xdHSt1AhzMfmEQw==
X-Gm-Gg: AY/fxX5bPhq4rI5KodFXDvp3cyAMfQmZns1N1h45BQ07V4HAYRzqlL8KoCC9hSJ4T3T
	+FixkfOAMufevOQLOtNEN4l3uXm9160gps2unAybxfKOHSJjCvbNz/hyQT1FXp1rf+Jw9qxgzGe
	XUittdiMgstPEzcWmN8b522edbv7uZIgrNSIewF/Xd063N4SAlVAWKAc7Ozrg86l5KL1ES1yA1W
	ix/Dt76oGeYI1GAPKiG0jX7rBN3+3QiftlpU1vpGMP5ATLwA9NepRlcMGImK52giizgMK6Eeqdu
	GWxZXJClgmkqAUCYYuwMSaM39xF9wH8drtn9qgGx4/D7rj4wbpknhM4ySWJ1igu1/QveYLhqSNa
	VFubqUDBSJku2q6n5u7qxPv67clBGSrcLdX4uRFdyXOpyapZ/yn6cmD5t5qU53ptqlpYVui4o4z
	4BB0FTtVAyqdmSu4M6/q667WY=
X-Google-Smtp-Source: AGHT+IF71Txsq/igO+FdMkre3nJn+W/FhN898C1oZebx1TiiePjH4MaUpIrQoqbafI+bSY0rFKN2dg==
X-Received: by 2002:a05:6a20:7348:b0:366:14ac:e1e7 with SMTP id adf61e73a8af0-3898fa060b3mr8733499637.77.1767950960185;
        Fri, 09 Jan 2026 01:29:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 12/12] unbound: patch CVE-2025-5994
Date: Fri,  9 Jan 2026 22:28:42 +1300
Message-ID: <20260109092843.1924568-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123290

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-5994

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2025-5994.patch       | 276 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
new file mode 100644
index 0000000000..3056fe3683
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
@@ -0,0 +1,276 @@
+From 380b53b92a6824a581f3f6079dfddd73631933fa Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 16 Jul 2025 10:02:01 +0200
+Subject: [PATCH] - Fix RebirthDay Attack CVE-2025-5994, reported by Xiang Li
+ from AOSP   Lab Nankai University.
+
+CVE: CVE-2025-5994
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/5bf82f246481098a6473f296b21fc1229d276c0f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ edns-subnet/subnetmod.c | 152 ++++++++++++++++++++++++++++++++++++----
+ edns-subnet/subnetmod.h |   4 ++
+ 2 files changed, 142 insertions(+), 14 deletions(-)
+
+diff --git a/edns-subnet/subnetmod.c b/edns-subnet/subnetmod.c
+index cefde84e..9c0c914b 100644
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
+@@ -152,7 +153,8 @@ int ecs_whitelist_check(struct query_info* qinfo,
+ 
+ 	/* Cache by default, might be disabled after parsing EDNS option
+ 	 * received from nameserver. */
+-	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)) {
++	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)
++		&& sq->ecs_client_in.subnet_validdata) {
+ 		qstate->no_cache_store = 0;
+ 	}
+ 
+@@ -504,6 +506,69 @@ common_prefix(uint8_t *a, uint8_t *b, uint8_t net)
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
+@@ -539,14 +604,7 @@ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
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
+@@ -571,14 +629,14 @@ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
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
+@@ -763,6 +821,9 @@ ecs_edns_back_parsed(struct module_qstate* qstate, int id,
+ 	} else if(sq->subnet_sent_no_subnet) {
+ 		/* The answer can be stored as scope 0, not in global cache. */
+ 		qstate->no_cache_store = 1;
++	} else if(sq->subnet_sent) {
++		/* Need another query to be able to store in global cache. */
++		qstate->no_cache_store = 1;
+ 	}
+ 
+ 	return 1;
+@@ -780,6 +841,32 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
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
+@@ -790,6 +877,8 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 		}
+ 
+ 		sq = (struct subnet_qstate*)qstate->minfo[id];
++		if(sq->wait_subquery)
++			return; /* Wait for that subquery to return */
+ 
+ 		if((ecs_opt = edns_opt_list_find(
+ 			qstate->edns_opts_front_in,
+@@ -819,6 +908,14 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
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
+@@ -859,6 +956,14 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
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
+@@ -895,6 +1000,8 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
+ 		qstate->ext_state[id] = module_wait_module;
+ 		return;
+ 	}
++	if(sq && sq->wait_subquery)
++		return; /* Wait for that subquery to return */
+ 	/* Query handed back by next module, we have a 'final' answer */
+ 	if(sq && event == module_event_moddone) {
+ 		qstate->ext_state[id] = eval_response(qstate, id, sq);
+@@ -943,10 +1050,27 @@ subnetmod_clear(struct module_qstate *ATTR_UNUSED(qstate),
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
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 076f03f2ae..7e3e37406f 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
            file://CVE-2024-43167.patch \
            file://CVE-2024-43168_1.patch \
            file://CVE-2024-43168_2.patch \
+           file://CVE-2025-5994.patch \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 

