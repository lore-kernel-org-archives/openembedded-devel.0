Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC84C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:37 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27776.1789081834842101892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J+Z753D0;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so348023a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081834; x=1789686634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlYoj5vNmoQSYQNpQ54F3i+Us5K+qjI3WRzjVCbJUnI=;
        b=J+Z753D0E41zLwdhkfld4vsz6j01/P1HiyudSdAIHMGn1a/8UBlSP7Z8yIfzfVNZwz
         G8WTAPkIEaUg45wJDS0Iq+iK9sUxx9umEnZjC1IZeQ/J3UHzXi0cTu4rl9y4/REtBcB8
         SIgIrp6v8bKnpJfcMdjMFw5BHUy0PeUT1s1BNbXHQ09TkELnM0Ac/l5LluD+cdac6RL0
         UkQ+tIPBDzbO4W3mirAin12PcI7+ko3VuPMiAYO30SRtY9cVT7DfsXe7D8RTTtRjrSxp
         Ek1tcOd0RRpM1wvq0jEK/lQRGxosuaCqqIPg7d87dfn40mykUxZ7ML0kKRcCxlAYA6kd
         hQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081834; x=1789686634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlYoj5vNmoQSYQNpQ54F3i+Us5K+qjI3WRzjVCbJUnI=;
        b=I+XfNxFuJIomTmSlJxgVI/ffSJ8L9cfp6kabTC++z8fElSUnnyP/GzU0x25PikyzkO
         KwqnnILEi/FSOvl/bJRIcLRwrHFWu9IbTrDOZjN3taU5VpR6x4kNT5TYwfReh/wtfYSA
         AIOOlFiqteOcZfNodOueMaN84AU7OQGhcWeus5Me2eIMYflcjvd/A8pUmz+U2N/ghuId
         KlR5XmqW+xrC+fr/3+TcjeipqmmQRfdrVpQy9INsuQul+VEvKkwabjyeKJZzK7j0NCWa
         vUX7HBZiwPB4/igBju/Iqj+g0HExUXrY+lLr+50nHqUI/KRkArpTKEROnHe3NMSxnYJQ
         7LyA==
X-Gm-Message-State: AFuF++lvYU1/w9nP+rIjNS5AYz/3SXO5161zk9W6SxD5iwQY2HAU/10x
	AUIWtmHqT4k7EGYJmSwsZZ/K+WipZ3am6B50bIk4OCyWNCsUOaOslEv6OAmIFQ==
X-Gm-Gg: AYBFou3mykpeHqKk8JY3/p0zV0Ld3QAfKfIAuMEOsovwar1VFMB6TTAjw8kFmzzJECv
	imDdxntKEMcreTq9msxW39N8Ty+VPocGQAeQzaOUEDUrYWeeGaZJ28m0wk877a+DbQLFtRfCEUX
	+crFP6SFwaRR6X9+Y6JsADz5TxoiemE3SpcgIXFt9xw5WKjz4Hc5XU9AFG1y0tJ0p1L3wwoZTMh
	lOjju1k3wOGqJjIdIf4BNmQ4zlJRp1XU8d0/fir/yB2UllBTvvJYrmQUS3i45CkGu+0g9ITbnwH
	lDKUGF7do4Broweh4RSttx7hKMPSdMLTiIlRmIF7g8v8A01wstzVXT2ESXL5tiCP4sbed8lec4z
	2oekaIhLgps64Ij1JCGxwOVNnT2Am6zws2GSWVZ19qKOL2u3ettsuiijyO0qvcDGCD8PcSqpJem
	OVECF9HRZ0z6OzqW2iQFXyI25L7gKhplfhrhe90gBVHDGLNPaDEETgHizVOrWSEZ8SbfyLsxUCo
	QJkGewZKUPLhVH5JgzujsE=
X-Received: by 2002:a17:90b:4cce:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39d9bbe1915mr2029672a91.2.1789081834018;
        Thu, 10 Sep 2026 16:10:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 18/32] unbound: patch CVE-2026-50045
Date: Fri, 11 Sep 2026 11:09:17 +1200
Message-ID: <20260910230932.173913-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129936

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50045

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-50045.patch      | 278 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 279 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50045.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-50045.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50045.patch
new file mode 100644
index 0000000000..39c786e9a1
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50045.patch
@@ -0,0 +1,278 @@
+From ceadb55a62fb7f503b13e238043a68573890db97 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:13:14 +0200
+Subject: [PATCH] - Fix CVE-2026-50045, 'max-global-quota' reset by DNSSEC
+ validation   restarts. Thanks to Kunjie Shang, University of Science and  
+ Technology of China, for the report.
+
+(cherry picked from commit 364ac737f713b2a606f0fddecddb675d72a6a991)
+
+CVE: CVE-2026-50045
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/364ac737f713b2a606f0fddecddb675d72a6a991]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ iterator/iterator.c   | 67 ++++++++++++++++++++++++++++++-------------
+ util/module.h         |  6 ++++
+ validator/validator.c | 13 +++++++++
+ 3 files changed, 66 insertions(+), 20 deletions(-)
+
+diff --git a/iterator/iterator.c b/iterator/iterator.c
+index 71e64655f..16dbc19de 100644
+--- a/iterator/iterator.c
++++ b/iterator/iterator.c
+@@ -81,7 +81,8 @@ int BLACKLIST_PENALTY = (120000*4);
+ /** Timeout when only a single probe query per IP is allowed. */
+ int PROBE_MAXRTO = PROBE_MAXRTO_DEFAULT; /* in msec */
+ 
+-static void target_count_increase_nx(struct iter_qstate* iq, int num);
++static void target_count_increase_nx(struct module_qstate* qstate,
++	struct iter_qstate* iq, int num);
+ 
+ int 
+ iter_init(struct module_env* env, int id)
+@@ -250,7 +251,7 @@ error_supers(struct module_qstate* qstate, int id, struct module_qstate* super)
+ 		if((dpns->got4 == 2 || (!ie->supports_ipv4 && !ie->nat64.use_nat64)) &&
+ 			(dpns->got6 == 2 || !ie->supports_ipv6)) {
+ 			dpns->resolved = 1; /* mark as failed */
+-			target_count_increase_nx(super_iq, 1);
++			target_count_increase_nx(super, super_iq, 1);
+ 		}
+ 	}
+ 	if(qstate->qinfo.qtype == LDNS_RR_TYPE_NS) {
+@@ -733,7 +734,7 @@ is_caps_whitelisted(struct iter_env* ie, struct iter_qstate* iq)
+  * created for the parent query.
+  */
+ static void
+-target_count_create(struct iter_qstate* iq)
++target_count_create(struct module_qstate* qstate, struct iter_qstate* iq)
+ {
+ 	if(!iq->target_count) {
+ 		iq->target_count = (int*)calloc(TARGET_COUNT_MAX, sizeof(int));
+@@ -741,33 +742,57 @@ target_count_create(struct iter_qstate* iq)
+ 		if(iq->target_count) {
+ 			iq->target_count[TARGET_COUNT_REF] = 1;
+ 			iq->nxns_dp = (uint8_t**)calloc(1, sizeof(uint8_t*));
++			/* continue global quota from where it was. */
++			if(qstate->global_quota_reached >
++				iq->target_count[TARGET_COUNT_GLOBAL_QUOTA])
++				iq->target_count[TARGET_COUNT_GLOBAL_QUOTA] =
++					qstate->global_quota_reached;
+ 		}
+ 	}
+ }
+ 
+ static void
+-target_count_increase(struct iter_qstate* iq, int num)
++target_count_store(struct module_qstate* qstate, struct iter_qstate* iq)
+ {
+-	target_count_create(iq);
++	if(iq->target_count) {
++		/* By storing the global quota counter, it stays
++		 * there to be picked up if the module is restarted,
++		 * eg. due to a validator retry, and then the
++		 * target_count_create routine picks it up. */
++		if(iq->target_count[TARGET_COUNT_GLOBAL_QUOTA] >
++			qstate->global_quota_reached)
++			qstate->global_quota_reached =
++			  iq->target_count[TARGET_COUNT_GLOBAL_QUOTA];
++	}
++}
++
++static void
++target_count_increase(struct module_qstate* qstate,
++	struct iter_qstate* iq, int num)
++{
++	target_count_create(qstate, iq);
+ 	if(iq->target_count)
+ 		iq->target_count[TARGET_COUNT_QUERIES] += num;
+ 	iq->dp_target_count++;
+ }
+ 
+ static void
+-target_count_increase_nx(struct iter_qstate* iq, int num)
++target_count_increase_nx(struct module_qstate* qstate,
++	struct iter_qstate* iq, int num)
+ {
+-	target_count_create(iq);
++	target_count_create(qstate, iq);
+ 	if(iq->target_count)
+ 		iq->target_count[TARGET_COUNT_NX] += num;
+ }
+ 
+ static void
+-target_count_increase_global_quota(struct iter_qstate* iq, int num)
++target_count_increase_global_quota(struct module_qstate* qstate,
++	struct iter_qstate* iq, int num)
+ {
+-	target_count_create(iq);
++	target_count_create(qstate, iq);
+ 	if(iq->target_count)
+ 		iq->target_count[TARGET_COUNT_GLOBAL_QUOTA] += num;
++	target_count_store(qstate, iq);
+ }
+ 
+ /**
+@@ -860,7 +885,7 @@ generate_sub_request(uint8_t* qname, size_t qnamelen, uint16_t qtype,
+ 		subiq = (struct iter_qstate*)subq->minfo[id];
+ 		memset(subiq, 0, sizeof(*subiq));
+ 		subiq->num_target_queries = 0;
+-		target_count_create(iq);
++		target_count_create(qstate, iq);
+ 		subiq->target_count = iq->target_count;
+ 		if(iq->target_count) {
+ 			iq->target_count[TARGET_COUNT_REF] ++; /* extra reference */
+@@ -2233,7 +2258,7 @@ processLastResort(struct module_qstate* qstate, struct iter_qstate* iq,
+ 			return error_response_cache(qstate, id, LDNS_RCODE_SERVFAIL);
+ 		}
+ 		iq->num_target_queries += qs;
+-		target_count_increase(iq, qs);
++		target_count_increase(qstate, iq, qs);
+ 		if(qs != 0) {
+ 			qstate->ext_state[id] = module_wait_subquery;
+ 			return 0; /* and wait for them */
+@@ -2289,7 +2314,7 @@ processLastResort(struct module_qstate* qstate, struct iter_qstate* iq,
+ 				 * lookups at a time. */
+ 				verbose(VERB_ALGO, "try parent-side glue lookup");
+ 				iq->num_target_queries += query_count;
+-				target_count_increase(iq, query_count);
++				target_count_increase(qstate, iq, query_count);
+ 				qstate->ext_state[id] = module_wait_subquery;
+ 				return 0;
+ 			}
+@@ -2309,7 +2334,7 @@ processLastResort(struct module_qstate* qstate, struct iter_qstate* iq,
+ 		if(query_count != 0) { /* suspend to await results */
+ 			verbose(VERB_ALGO, "try parent-side glue lookup");
+ 			iq->num_target_queries += query_count;
+-			target_count_increase(iq, query_count);
++			target_count_increase(qstate, iq, query_count);
+ 			qstate->ext_state[id] = module_wait_subquery;
+ 			return 0;
+ 		}
+@@ -2789,7 +2814,7 @@ processQueryTargets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 			return error_response_cache(qstate, id, LDNS_RCODE_SERVFAIL);
+ 		}
+ 		iq->num_target_queries += extra;
+-		target_count_increase(iq, extra);
++		target_count_increase(qstate, iq, extra);
+ 		if(iq->num_target_queries > 0) {
+ 			/* wait to get all targets, we want to try em */
+ 			verbose(VERB_ALGO, "wait for all targets for fallback");
+@@ -2840,7 +2865,7 @@ processQueryTargets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 		/* errors ignored, these targets are not strictly necessary for
+ 		 * this result, we do not have to reply with SERVFAIL */
+ 		iq->num_target_queries += extra;
+-		target_count_increase(iq, extra);
++		target_count_increase(qstate, iq, extra);
+ 	}
+ 
+ 	/* Add the current set of unused targets to our queue. */
+@@ -2963,7 +2988,7 @@ processQueryTargets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 						LDNS_RCODE_SERVFAIL);
+ 				}
+ 				iq->num_target_queries += qs;
+-				target_count_increase(iq, qs);
++				target_count_increase(qstate, iq, qs);
+ 			}
+ 			/* Since a target query might have been made, we 
+ 			 * need to check again. */
+@@ -3023,7 +3048,7 @@ processQueryTargets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 		* this result, we do not have to reply with SERVFAIL */
+ 		if(extra > 0) {
+ 			iq->num_target_queries += extra;
+-			target_count_increase(iq, extra);
++			target_count_increase(qstate, iq, extra);
+ 			check_waiting_queries(iq, qstate, id);
+ 			/* undo qname minimise step because we'll get back here
+ 			 * to do it again */
+@@ -3036,7 +3061,7 @@ processQueryTargets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 		}
+ 	}
+ 
+-	target_count_increase_global_quota(iq, 1);
++	target_count_increase_global_quota(qstate, iq, 1);
+ 	if(iq->target_count && iq->target_count[TARGET_COUNT_GLOBAL_QUOTA]
+ 		> MAX_GLOBAL_QUOTA) {
+ 		char s[LDNS_MAX_DOMAINLEN];
+@@ -3880,7 +3905,7 @@ processTargetResponse(struct module_qstate* qstate, int id,
+ 			/* no new addresses, increase the nxns counter, like
+ 			 * this could be a list of wildcards with no new
+ 			 * addresses */
+-			target_count_increase_nx(foriq, 1);
++			target_count_increase_nx(qstate, foriq, 1);
+ 		}
+ 		verbose(VERB_ALGO, "added target response");
+ 		delegpt_log(VERB_ALGO, foriq->dp);
+@@ -3892,7 +3917,7 @@ processTargetResponse(struct module_qstate* qstate, int id,
+ 			dpns->resolved = 1; /* fail the target */
+ 			/* do not count cached answers */
+ 			if(qstate->reply_origin && qstate->reply_origin->len != 0) {
+-				target_count_increase_nx(foriq, 1);
++				target_count_increase_nx(qstate, foriq, 1);
+ 			}
+ 		}
+ 	}
+@@ -4117,6 +4142,7 @@ processFinished(struct module_qstate* qstate, struct iter_qstate* iq,
+ 			iter_store_parentside_neg(qstate->env, &qstate->qinfo,
+ 				iq->deleg_msg?iq->deleg_msg->rep:
+ 				(iq->response?iq->response->rep:NULL));
++	target_count_store(qstate, iq);
+ 	if(!iq->response) {
+ 		verbose(VERB_ALGO, "No response is set, servfail");
+ 		errinf(qstate, "(no response found at query finish)");
+@@ -4532,6 +4558,7 @@ iter_clear(struct module_qstate* qstate, int id)
+ 	iq = (struct iter_qstate*)qstate->minfo[id];
+ 	if(iq) {
+ 		outbound_list_clear(&iq->outlist);
++		target_count_store(qstate, iq);
+ 		if(iq->target_count && --iq->target_count[TARGET_COUNT_REF] == 0) {
+ 			free(iq->target_count);
+ 			if(*iq->nxns_dp) free(*iq->nxns_dp);
+diff --git a/util/module.h b/util/module.h
+index edce4a523..b13b8de2f 100644
+--- a/util/module.h
++++ b/util/module.h
+@@ -712,6 +712,12 @@ struct module_qstate {
+ 
+ 	/** whether the reply should be dropped */
+ 	int is_drop;
++	/** the global quota that was reached, by one of the modules.
++	 * So that continued counting can go on from that point. */
++	int global_quota_reached;
++	/** the global quota that a query started with, it is a subquery,
++	 * so that calling mesh states can see the increase. */
++	int global_quota_started;
+ };
+ 
+ /** 
+diff --git a/validator/validator.c b/validator/validator.c
+index 68c4bf643..c9896e4fb 100644
+--- a/validator/validator.c
++++ b/validator/validator.c
+@@ -517,6 +517,14 @@ generate_request(struct module_qstate* qstate, int id, uint8_t* name,
+ 		/* add our blacklist to the query blacklist */
+ 		sock_list_merge(&(*newq)->blacklist, (*newq)->region,
+ 			vq->chain_blacklist);
++		/* start its global quota counter where this one is. */
++		if(qstate->global_quota_reached >
++			(*newq)->global_quota_reached) {
++			(*newq)->global_quota_started =
++				qstate->global_quota_reached;
++			(*newq)->global_quota_reached =
++				qstate->global_quota_reached;
++		}
+ 	}
+ 	qstate->ext_state[id] = module_wait_subquery;
+ 	return 1;
+@@ -3476,6 +3484,11 @@ val_inform_super(struct module_qstate* qstate, int id,
+ 		verbose(VERB_ALGO, "super: has no validator state");
+ 		return;
+ 	}
++	/* Pick up the global quota limit from the subquery. */
++	if(qstate->global_quota_reached > qstate->global_quota_started) {
++		super->global_quota_reached += qstate->global_quota_reached -
++			qstate->global_quota_started;
++	}
+ 	if(vq->wait_prime_ta) {
+ 		vq->wait_prime_ta = 0;
+ 		process_prime_response(super, vq, id, qstate->return_rcode,
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 6cae8632ae..28214dea19 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42955.patch \
            file://CVE-2026-44621.patch \
            file://CVE-2026-44687.patch \
+           file://CVE-2026-50045.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

