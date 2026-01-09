Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AC6D16818
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:42:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8267.1767958972062671258
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 03:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9/QMkj3;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2239514f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 03:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767958970; x=1768563770; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dk4wHfugM/LN38Ik++nTgBuY5lOh/atPRoBh7eXSMoo=;
        b=V9/QMkj3Aaj/yUTGzgyASBMVzGYdAdK6wGgCN5eQh0gVoEnaLiQSmkSXhU/25fNqRx
         8EphX0BClkXPWfFy9S7YDXcFDi9jSfrCxBAOjpuEfNchgjc7Hq2MCIHz+O0pl27AUgP+
         yIld2jNpYdZCuYcq+3EONcOPFhnm6Y8n3CH1ATBkHHc63Ma+4st8Su+wFFIqR8o9SDS5
         mKxU9ay5nM6RnqudEzxh7zWeb8ItZzTHsJopPNZsjDy/Io0UXYZ5WVUEhkGBuhubElCF
         6VZUtjqVs6y1PFjMFtVwDOumvT+79kLQB/phB4rW+nyR2gKA//F6ZbrPOtdcaE7s9l68
         8h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958970; x=1768563770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dk4wHfugM/LN38Ik++nTgBuY5lOh/atPRoBh7eXSMoo=;
        b=PbGQgOdXtv8KL8TgkkWSmxBCsf5NspLUxG3EN5dOTKWGLWLcAC3nXmjUW57vlb7rRS
         FUvdxwg1QzXsUTl4eDBHe3aC8lXCaHdCbrUfYDiwVXUjVLRFxekNHx7t/oRjr/Lid+ZE
         cxHlpdWduToSr0Qs6qxI3LXrD51AKVjZyXVa7l3ybFV9sH+PElU7xoXeIjwixCAdbVWS
         dfYdo61sSNWY9+QJ4GaoqPZ3UpEr3WfzS9bMxkaxzWXFovTXgTF3XMzrDtWGSsWwtkmz
         Pe11IGSq/Ua6G2eSIhMnPz8ipVXbw7yv9Ckchjr62HKN5HL8p8nF80cdrsnE0RIRefWl
         EP9A==
X-Forwarded-Encrypted: i=1; AJvYcCVdiissZa69VOGRU/1Kz0ABQTePm4vqc8gajsV4Dk1O5/UIVA2NV7Mb7vwMF0h188C5odVrt0RXkzRwdvilfZol5fQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKCZB1OOGDyTnVfJbYlkm8k41P73GZTMiNd1OQeB3ryH0p6cFN
	AYj5hmx5A8oYcXfPq6GmhSJ90rYMnrflfcatu+X5nLYE+ZfiUhivJyoz
X-Gm-Gg: AY/fxX60S3rAox1I4Oxukeu7Zx+hA3yxFma7EK7S3BqESS9RYzPvYJXSLa9L/6SYagZ
	bAbuBWexRmh0auryT4T/8aoMJTBjVlq/Z22DJaTf309BA634YhsQP+ZxWbITrl2w1iwtngl/ga8
	REm83c/iu1sukGFrLs0conz5q7khZhJvDPQ/3o0FhIJMa5zO/GCaK+yeCtrPZ+p76KCcKVwCsvb
	5HAxzEWqJ9C3uzNnBNmDChJdUy98i87RHsPbntPHoz2PKirMKe7+4jCLV17Bebr2oyzSNiZJkmU
	vO0F5HiAQ7tJRUHV2E6eBMwXDG+G3TwOuy1qZxJiRxFHztI1GmIVAonLdMLpE0HoxSVbDaQ/qaz
	RyHoRMTXXKe9ua9NlsQyGH3PskHSWqVjpzX+m/94h7mwkv7SopI69WpVOP5F7MLjP6IQkPzet0Q
	R2PMosrFug7Bcc/8RtcHuhZQKi0i+DKw==
X-Google-Smtp-Source: AGHT+IE2eabPUi6Pa21FjrtzkUbL8CZCsFio0DZZVVCcJjvXkwg/dHOn+7DB0TYDsczYJTpu7Y4w/g==
X-Received: by 2002:a05:6000:2689:b0:42f:bab5:9533 with SMTP id ffacd0b85a97d-432c3632b4amr11832454f8f.17.1767958970245;
        Fri, 09 Jan 2026 03:42:50 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df939sm21615236f8f.21.2026.01.09.03.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:42:49 -0800 (PST)
Message-ID: <7fa88f7a-3414-460a-a351-25c951ffddb3@gmail.com>
Date: Fri, 9 Jan 2026 12:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][scarthgap][PATCH 12/12] unbound: patch
 CVE-2025-5994
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
 <20260109092843.1924568-12-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260109092843.1924568-12-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 11:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123295

Looking at this, it has been submitted by another contributor some time
ago[1], but it seems it wasn't applied. Was this missed accidentally, or
are there some issues with it?

[1]: https://lists.openembedded.org/g/openembedded-devel/message/121294

On 1/9/26 10:28, Ankur Tyagi via lists.openembedded.org wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../unbound/unbound/CVE-2025-5994.patch       | 276 ++++++++++++++++++
>  .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
>  2 files changed, 277 insertions(+)
>  create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
>
> diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
> new file mode 100644
> index 0000000000..3056fe3683
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
> @@ -0,0 +1,276 @@
> +From 380b53b92a6824a581f3f6079dfddd73631933fa Mon Sep 17 00:00:00 2001
> +From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
> +Date: Wed, 16 Jul 2025 10:02:01 +0200
> +Subject: [PATCH] - Fix RebirthDay Attack CVE-2025-5994, reported by Xiang Li
> + from AOSP   Lab Nankai University.
> +
> +CVE: CVE-2025-5994
> +Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/5bf82f246481098a6473f296b21fc1229d276c0f]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + edns-subnet/subnetmod.c | 152 ++++++++++++++++++++++++++++++++++++----
> + edns-subnet/subnetmod.h |   4 ++
> + 2 files changed, 142 insertions(+), 14 deletions(-)
> +
> +diff --git a/edns-subnet/subnetmod.c b/edns-subnet/subnetmod.c
> +index cefde84e..9c0c914b 100644
> +--- a/edns-subnet/subnetmod.c
> ++++ b/edns-subnet/subnetmod.c
> +@@ -51,6 +51,7 @@
> + #include "services/cache/dns.h"
> + #include "util/module.h"
> + #include "util/regional.h"
> ++#include "util/fptr_wlist.h"
> + #include "util/storage/slabhash.h"
> + #include "util/config_file.h"
> + #include "util/data/msgreply.h"
> +@@ -152,7 +153,8 @@ int ecs_whitelist_check(struct query_info* qinfo,
> + 
> + 	/* Cache by default, might be disabled after parsing EDNS option
> + 	 * received from nameserver. */
> +-	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)) {
> ++	if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)
> ++		&& sq->ecs_client_in.subnet_validdata) {
> + 		qstate->no_cache_store = 0;
> + 	}
> + 
> +@@ -504,6 +506,69 @@ common_prefix(uint8_t *a, uint8_t *b, uint8_t net)
> + 	return !memcmp(a, b, n) && ((net % 8) == 0 || a[n] == b[n]);
> + }
> + 
> ++/**
> ++ * Create sub request that looks up the query.
> ++ * @param qstate: query state
> ++ * @param sq: subnet qstate
> ++ * @return false on failure.
> ++ */
> ++static int
> ++generate_sub_request(struct module_qstate *qstate, struct subnet_qstate* sq)
> ++{
> ++	struct module_qstate* subq = NULL;
> ++	uint16_t qflags = 0; /* OPCODE QUERY, no flags */
> ++	int prime = 0;
> ++	int valrec = 0;
> ++	struct query_info qinf;
> ++	qinf.qname = qstate->qinfo.qname;
> ++	qinf.qname_len = qstate->qinfo.qname_len;
> ++	qinf.qtype = qstate->qinfo.qtype;
> ++	qinf.qclass = qstate->qinfo.qclass;
> ++	qinf.local_alias = NULL;
> ++
> ++	qflags |= BIT_RD;
> ++	if((qstate->query_flags & BIT_CD)!=0) {
> ++		qflags |= BIT_CD;
> ++		valrec = 1;
> ++	}
> ++
> ++	fptr_ok(fptr_whitelist_modenv_attach_sub(qstate->env->attach_sub));
> ++	if(!(*qstate->env->attach_sub)(qstate, &qinf, qflags, prime, valrec,
> ++		&subq)) {
> ++		return 0;
> ++	}
> ++	if(subq) {
> ++		/* It is possible to access the subquery module state. */
> ++		if(sq->ecs_client_in.subnet_source_mask == 0 &&
> ++			edns_opt_list_find(qstate->edns_opts_front_in,
> ++				qstate->env->cfg->client_subnet_opcode)) {
> ++			subq->no_cache_store = 1;
> ++		}
> ++	}
> ++	return 1;
> ++}
> ++
> ++/**
> ++ * Perform the query without subnet
> ++ * @param qstate: query state
> ++ * @param sq: subnet qstate
> ++ * @return module state
> ++ */
> ++static enum module_ext_state
> ++generate_lookup_without_subnet(struct module_qstate *qstate,
> ++	struct subnet_qstate* sq)
> ++{
> ++	verbose(VERB_ALGO, "subnetcache: make subquery to look up without subnet");
> ++	if(!generate_sub_request(qstate, sq)) {
> ++		verbose(VERB_ALGO, "Could not generate sub query");
> ++		qstate->return_rcode = LDNS_RCODE_FORMERR;
> ++		qstate->return_msg = NULL;
> ++		return module_finished;
> ++	}
> ++	sq->wait_subquery = 1;
> ++	return module_wait_subquery;
> ++}
> ++
> + static enum module_ext_state
> + eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
> + {
> +@@ -539,14 +604,7 @@ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
> + 		 * is still useful to put it in the edns subnet cache for
> + 		 * when a client explicitly asks for subnet specific answer. */
> + 		verbose(VERB_QUERY, "subnetcache: Authority indicates no support");
> +-		if(!sq->started_no_cache_store) {
> +-			lock_rw_wrlock(&sne->biglock);
> +-			update_cache(qstate, id);
> +-			lock_rw_unlock(&sne->biglock);
> +-		}
> +-		if (sq->subnet_downstream)
> +-			cp_edns_bad_response(c_out, c_in);
> +-		return module_finished;
> ++		return generate_lookup_without_subnet(qstate, sq);
> + 	}
> + 
> + 	/* Purposefully there was no sent subnet, and there is consequently
> +@@ -571,14 +629,14 @@ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate *sq)
> + 		!common_prefix(s_out->subnet_addr, s_in->subnet_addr, 
> + 			s_out->subnet_source_mask))
> + 	{
> +-		/* we can not accept, restart query without option */
> ++		/* we can not accept, perform query without option */
> + 		verbose(VERB_QUERY, "subnetcache: forged data");
> + 		s_out->subnet_validdata = 0;
> + 		(void)edns_opt_list_remove(&qstate->edns_opts_back_out,
> + 			qstate->env->cfg->client_subnet_opcode);
> + 		sq->subnet_sent = 0;
> + 		sq->subnet_sent_no_subnet = 0;
> +-		return module_restart_next;
> ++		return generate_lookup_without_subnet(qstate, sq);
> + 	}
> + 
> + 	lock_rw_wrlock(&sne->biglock);
> +@@ -763,6 +821,9 @@ ecs_edns_back_parsed(struct module_qstate* qstate, int id,
> + 	} else if(sq->subnet_sent_no_subnet) {
> + 		/* The answer can be stored as scope 0, not in global cache. */
> + 		qstate->no_cache_store = 1;
> ++	} else if(sq->subnet_sent) {
> ++		/* Need another query to be able to store in global cache. */
> ++		qstate->no_cache_store = 1;
> + 	}
> + 
> + 	return 1;
> +@@ -780,6 +841,32 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
> + 		strmodulevent(event));
> + 	log_query_info(VERB_QUERY, "subnetcache operate: query", &qstate->qinfo);
> + 
> ++	if(sq && sq->wait_subquery_done) {
> ++		/* The subquery lookup returned. */
> ++		if(sq->ecs_client_in.subnet_source_mask == 0 &&
> ++			edns_opt_list_find(qstate->edns_opts_front_in,
> ++				qstate->env->cfg->client_subnet_opcode)) {
> ++			if(!sq->started_no_cache_store &&
> ++				qstate->return_msg) {
> ++				lock_rw_wrlock(&sne->biglock);
> ++				update_cache(qstate, id);
> ++				lock_rw_unlock(&sne->biglock);
> ++			}
> ++			if (sq->subnet_downstream)
> ++				cp_edns_bad_response(&sq->ecs_client_out,
> ++					&sq->ecs_client_in);
> ++			/* It is a scope zero lookup, append edns subnet
> ++			 * option to the querier. */
> ++			subnet_ecs_opt_list_append(&sq->ecs_client_out,
> ++				&qstate->edns_opts_front_out, qstate,
> ++				qstate->region);
> ++		}
> ++		sq->wait_subquery_done = 0;
> ++		qstate->ext_state[id] = module_finished;
> ++		qstate->no_cache_store = sq->started_no_cache_store;
> ++		qstate->no_cache_lookup = sq->started_no_cache_lookup;
> ++		return;
> ++	}
> + 	if((event == module_event_new || event == module_event_pass) &&
> + 		sq == NULL) {
> + 		struct edns_option* ecs_opt;
> +@@ -790,6 +877,8 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
> + 		}
> + 
> + 		sq = (struct subnet_qstate*)qstate->minfo[id];
> ++		if(sq->wait_subquery)
> ++			return; /* Wait for that subquery to return */
> + 
> + 		if((ecs_opt = edns_opt_list_find(
> + 			qstate->edns_opts_front_in,
> +@@ -819,6 +908,14 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
> + 			/* No clients are interested in result or we could not
> + 			 * parse it, we don't do client subnet */
> + 			sq->ecs_server_out.subnet_validdata = 0;
> ++			if(edns_opt_list_find(qstate->edns_opts_front_in,
> ++				qstate->env->cfg->client_subnet_opcode)) {
> ++				/* aggregated this deaggregated state */
> ++				qstate->ext_state[id] =
> ++					generate_lookup_without_subnet(
> ++					qstate, sq);
> ++				return;
> ++			}
> + 			verbose(VERB_ALGO, "subnetcache: pass to next module");
> + 			qstate->ext_state[id] = module_wait_module;
> + 			return;
> +@@ -859,6 +956,14 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
> + 			}
> + 			lock_rw_unlock(&sne->biglock);
> + 		}
> ++		if(sq->ecs_client_in.subnet_source_mask == 0 &&
> ++			edns_opt_list_find(qstate->edns_opts_front_in,
> ++				qstate->env->cfg->client_subnet_opcode)) {
> ++			/* client asked for resolution without edns subnet */
> ++			qstate->ext_state[id] = generate_lookup_without_subnet(
> ++				qstate, sq);
> ++			return;
> ++		}
> + 		
> + 		sq->ecs_server_out.subnet_addr_fam =
> + 			sq->ecs_client_in.subnet_addr_fam;
> +@@ -895,6 +1000,8 @@ subnetmod_operate(struct module_qstate *qstate, enum module_ev event,
> + 		qstate->ext_state[id] = module_wait_module;
> + 		return;
> + 	}
> ++	if(sq && sq->wait_subquery)
> ++		return; /* Wait for that subquery to return */
> + 	/* Query handed back by next module, we have a 'final' answer */
> + 	if(sq && event == module_event_moddone) {
> + 		qstate->ext_state[id] = eval_response(qstate, id, sq);
> +@@ -943,10 +1050,27 @@ subnetmod_clear(struct module_qstate *ATTR_UNUSED(qstate),
> + }
> + 
> + void
> +-subnetmod_inform_super(struct module_qstate *ATTR_UNUSED(qstate),
> +-	int ATTR_UNUSED(id), struct module_qstate *ATTR_UNUSED(super))
> ++subnetmod_inform_super(struct module_qstate *qstate, int id,
> ++	struct module_qstate *super)
> + {
> +-	/* Not used */
> ++	struct subnet_qstate* super_sq =
> ++		(struct subnet_qstate*)super->minfo[id];
> ++	log_query_info(VERB_ALGO, "subnetcache inform_super: query",
> ++		&super->qinfo);
> ++	super_sq->wait_subquery = 0;
> ++	super_sq->wait_subquery_done = 1;
> ++	if(qstate->return_rcode != LDNS_RCODE_NOERROR ||
> ++		!qstate->return_msg) {
> ++		super->return_msg = NULL;
> ++		super->return_rcode = LDNS_RCODE_SERVFAIL;
> ++		return;
> ++	}
> ++	super->return_rcode = LDNS_RCODE_NOERROR;
> ++	super->return_msg = dns_copy_msg(qstate->return_msg, super->region);
> ++	if(!super->return_msg) {
> ++		log_err("subnetcache: copy response, out of memory");
> ++		super->return_rcode = LDNS_RCODE_SERVFAIL;
> ++	}
> + }
> + 
> + size_t
> +diff --git a/edns-subnet/subnetmod.h b/edns-subnet/subnetmod.h
> +index 1ff8a23e..3893820f 100644
> +--- a/edns-subnet/subnetmod.h
> ++++ b/edns-subnet/subnetmod.h
> +@@ -102,6 +102,10 @@ struct subnet_qstate {
> + 	int started_no_cache_store;
> + 	/** has the subnet module been started with no_cache_lookup? */
> + 	int started_no_cache_lookup;
> ++	/** Wait for subquery that has been started for nonsubnet lookup. */
> ++	int wait_subquery;
> ++	/** The subquery waited for is done. */
> ++	int wait_subquery_done;
> + };
> + 
> + void subnet_data_delete(void* d, void* ATTR_UNUSED(arg));
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
> index 076f03f2ae..7e3e37406f 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
> @@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
>             file://CVE-2024-43167.patch \
>             file://CVE-2024-43168_1.patch \
>             file://CVE-2024-43168_2.patch \
> +           file://CVE-2025-5994.patch \
>             "
>  SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123290): https://lists.openembedded.org/g/openembedded-devel/message/123290
> Mute This Topic: https://lists.openembedded.org/mt/117172375/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


