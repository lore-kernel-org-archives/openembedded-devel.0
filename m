Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0AACCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:13:41 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.16724.1761214411725394661
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H882pnDL;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6ceb3b68feso537539a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761214410; x=1761819210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlDG172hBY3dcbZmGOD8oW3YN/ZBEVgsqQjcZdpNki8=;
        b=H882pnDLUMctRFoj/pyrNcURJdJ2mKlXh1VbafbdML7BoiYmuG5Bt+w5wcMfAv7Kxk
         0LXk0MYp46r9yd6BpnYSUhoNjVlY3+WWw9IB0zLGDwVP9hX6IeTxCQT2/BLS4fNOjMFK
         Zg3TYjWMJvGwxE/C1faI0y+jexJPbSXscw7no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214410; x=1761819210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlDG172hBY3dcbZmGOD8oW3YN/ZBEVgsqQjcZdpNki8=;
        b=DCcZKWsETJDheMaLG1C+gzNLfMUP4W5cKpEWj9Ar0dLRpj/s4wA1abBbVT7YEVA6qb
         12fUhFTktyDjJmRwtdMz/kpl3xjgoZodLMtMfecYnp0+auBtCeQCaUlk0WY+JnOKTLoh
         +5yoZGOs+bKVoK4nsWRtS2X547FRRzOC1CjTczlyMieTQR0HnMpR0Xr2JLHBp0axCM0h
         8kHoTUyXUic30N/RIZST+yAovZiyrQh4pHZhGeqM/eqyzSut29/6tkKlPur1UXQpwgV1
         u3OoXMgCAcSk20tQ4QsXOQDB3c/rqRhj6zHV//+H3xKzL54UQOVIPBMuiaFpMgpbAfup
         DpIw==
X-Gm-Message-State: AOJu0YzZhN5xTQZ6FrTld9cWFhxxK6LnxHWj/6cIn5/j5WvJhEFGiWLf
	MyOLNtBQ2IjaUCDWHe41/P2GPE/xM6yMcHdKOytG12ldxTDDRe9+xJ4bmEjuw64kakuOMz0tK03
	RPKup+ow=
X-Gm-Gg: ASbGncsMIZ1CrRXwPbrjZjb7WqHkKKR8boc+Wdu9YY5BdGzbqZEc5YrRkCJsrZjU/60
	n4fPv0NOhBE0iGmSLDRM3PBh+F5YcACF0w4dklG3YTWTD+PF04ZqQPmYvlYBgNJ8VH7a2R+rU6g
	2pVYRtgCenLfsBNAADcI4yBJnODTvp5cQwhn+Jnlw4m8G5McaHv/JXQI2gIQfzF/7JxijMa3K6d
	EkG6wiKv8tqjua8puCYy4YnJlpkN80PFR5EBpoH3RqLqXIwV6V7V678qIak3qwf/RkmDAanXe6h
	ZPfI8a+7LByh3DgU852PYHPQteS/QNEqOpK9PJ1fBPgRCfifOca9giz05FQNFHEBcExcxjyw3aR
	+erZN2pOszFGN6waqPJuYcyuIoFEJRhihcdA3FuOmsFngsC4rKS1GlufTNz8niwkqH//sxOH2Km
	CPZFUENvmHcVFWmQ==
X-Google-Smtp-Source: AGHT+IHShfeQbexz+snYBpUuquvGQRN6RL39iywEGFRJtmy9OTMVayTRAwuXlGj1L3tLJocAOeAj/g==
X-Received: by 2002:a17:902:f54d:b0:290:b10f:9aec with SMTP id d9443c01a7336-2935e126ca4mr58518845ad.26.1761214410431;
        Thu, 23 Oct 2025 03:13:30 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fce:8546:bea:675a:12eb:bfe2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddee569sm18369035ad.31.2025.10.23.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:13:29 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH 2/2] unbound: Fix CVE-2022-3204
Date: Thu, 23 Oct 2025 15:43:17 +0530
Message-Id: <20251023101317.21230-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251023101317.21230-1-vanusuri@mvista.com>
References: <20251023101317.21230-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 10:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120931

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/NLnetLabs/unbound/commit/137719522a8ea5b380fbb6206d2466f402f5b554

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../unbound/unbound/CVE-2022-3204.patch       | 221 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.15.0.bb |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch
new file mode 100644
index 0000000000..fb8fc5c1fe
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2022-3204.patch
@@ -0,0 +1,221 @@
+From 137719522a8ea5b380fbb6206d2466f402f5b554 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 21 Sep 2022 11:10:38 +0200
+Subject: [PATCH] - Patch for CVE-2022-3204 Non-Responsive Delegation Attack.
+
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/137719522a8ea5b380fbb6206d2466f402f5b554]
+CVE: CVE-2022-3204
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ iterator/iter_delegpt.c |  3 +++
+ iterator/iter_delegpt.h |  2 ++
+ iterator/iter_utils.c   |  3 +++
+ iterator/iter_utils.h   |  9 +++++++++
+ iterator/iterator.c     | 36 +++++++++++++++++++++++++++++++++++-
+ services/cache/dns.c    |  3 +++
+ services/mesh.c         |  7 +++++++
+ services/mesh.h         | 11 +++++++++++
+ 8 files changed, 73 insertions(+), 1 deletion(-)
+
+diff --git a/iterator/iter_delegpt.c b/iterator/iter_delegpt.c
+index 80148e810..10e8f5f30 100644
+--- a/iterator/iter_delegpt.c
++++ b/iterator/iter_delegpt.c
+@@ -78,6 +78,7 @@ struct delegpt* delegpt_copy(struct delegpt* dp, struct regional* region)
+ 		if(!delegpt_add_ns(copy, region, ns->name, ns->lame,
+ 			ns->tls_auth_name, ns->port))
+ 			return NULL;
++		copy->nslist->cache_lookup_count = ns->cache_lookup_count;
+ 		copy->nslist->resolved = ns->resolved;
+ 		copy->nslist->got4 = ns->got4;
+ 		copy->nslist->got6 = ns->got6;
+@@ -121,6 +122,7 @@ delegpt_add_ns(struct delegpt* dp, struct regional* region, uint8_t* name,
+ 	ns->namelen = len;
+ 	dp->nslist = ns;
+ 	ns->name = regional_alloc_init(region, name, ns->namelen);
++	ns->cache_lookup_count = 0;
+ 	ns->resolved = 0;
+ 	ns->got4 = 0;
+ 	ns->got6 = 0;
+@@ -613,6 +615,7 @@ int delegpt_add_ns_mlc(struct delegpt* dp, uint8_t* name, uint8_t lame,
+ 	}
+ 	ns->next = dp->nslist;
+ 	dp->nslist = ns;
++	ns->cache_lookup_count = 0;
+ 	ns->resolved = 0;
+ 	ns->got4 = 0;
+ 	ns->got6 = 0;
+diff --git a/iterator/iter_delegpt.h b/iterator/iter_delegpt.h
+index 17db15a23..886c33a8e 100644
+--- a/iterator/iter_delegpt.h
++++ b/iterator/iter_delegpt.h
+@@ -101,6 +101,8 @@ struct delegpt_ns {
+ 	uint8_t* name;
+ 	/** length of name */
+ 	size_t namelen;
++	/** number of cache lookups for the name */
++	int cache_lookup_count;
+ 	/** 
+ 	 * If the name has been resolved. false if not queried for yet.
+ 	 * true if the A, AAAA queries have been generated.
+diff --git a/iterator/iter_utils.c b/iterator/iter_utils.c
+index 8480f41d1..65af304cf 100644
+--- a/iterator/iter_utils.c
++++ b/iterator/iter_utils.c
+@@ -1195,6 +1195,9 @@ int iter_lookup_parent_glue_from_cache(struct module_env* env,
+ 	struct delegpt_ns* ns;
+ 	size_t num = delegpt_count_targets(dp);
+ 	for(ns = dp->nslist; ns; ns = ns->next) {
++		if(ns->cache_lookup_count > ITERATOR_NAME_CACHELOOKUP_MAX_PSIDE)
++			continue;
++		ns->cache_lookup_count++;
+ 		/* get cached parentside A */
+ 		akey = rrset_cache_lookup(env->rrset_cache, ns->name,
+ 			ns->namelen, LDNS_RR_TYPE_A, qinfo->qclass,
+diff --git a/iterator/iter_utils.h b/iterator/iter_utils.h
+index 660d6dc16..75e08d77b 100644
+--- a/iterator/iter_utils.h
++++ b/iterator/iter_utils.h
+@@ -62,6 +62,15 @@ struct ub_packed_rrset_key;
+ struct module_stack;
+ struct outside_network;
+ 
++/* max number of lookups in the cache for target nameserver names.
++ * This stops, for large delegations, N*N lookups in the cache. */
++#define ITERATOR_NAME_CACHELOOKUP_MAX	3
++/* max number of lookups in the cache for parentside glue for nameserver names
++ * This stops, for larger delegations, N*N lookups in the cache.
++ * It is a little larger than the nonpside max, so it allows a couple extra
++ * lookups of parent side glue. */
++#define ITERATOR_NAME_CACHELOOKUP_MAX_PSIDE	5
++
+ /**
+  * Process config options and set iterator module state.
+  * Sets default values if no config is found.
+diff --git a/iterator/iterator.c b/iterator/iterator.c
+index 02741d0b4..66e9c68a0 100644
+--- a/iterator/iterator.c
++++ b/iterator/iterator.c
+@@ -1206,6 +1206,15 @@ generate_dnskey_prefetch(struct module_qstate* qstate,
+ 		(qstate->query_flags&BIT_RD) && !(qstate->query_flags&BIT_CD)){
+ 		return;
+ 	}
++	/* we do not generate this prefetch when the query list is full,
++	 * the query is fetched, if needed, when the validator wants it.
++	 * At that time the validator waits for it, after spawning it.
++	 * This means there is one state that uses cpu and a socket, the
++	 * spawned while this one waits, and not several at the same time,
++	 * if we had created the lookup here. And this helps to keep
++	 * the total load down, but the query still succeeds to resolve. */
++	if(mesh_jostle_exceeded(qstate->env->mesh))
++		return;
+ 
+ 	/* if the DNSKEY is in the cache this lookup will stop quickly */
+ 	log_nametypeclass(VERB_ALGO, "schedule dnskey prefetch", 
+@@ -1893,6 +1902,14 @@ query_for_targets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 				return 0;
+ 			}
+ 			query_count++;
++			/* If the mesh query list is full, exit the loop here.
++			 * This makes the routine spawn one query at a time,
++			 * and this means there is no query state load
++			 * increase, because the spawned state uses cpu and a
++			 * socket while this state waits for that spawned
++			 * state. Next time we can look up further targets */
++			if(mesh_jostle_exceeded(qstate->env->mesh))
++				break;
+ 		}
+ 		/* Send the A request. */
+ 		if(ie->supports_ipv4 && !ns->got4) {
+@@ -1905,6 +1922,9 @@ query_for_targets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 				return 0;
+ 			}
+ 			query_count++;
++			/* If the mesh query list is full, exit the loop. */
++			if(mesh_jostle_exceeded(qstate->env->mesh))
++				break;
+ 		}
+ 
+ 		/* mark this target as in progress. */
+@@ -2064,6 +2084,15 @@ processLastResort(struct module_qstate* qstate, struct iter_qstate* iq,
+ 			}
+ 			ns->done_pside6 = 1;
+ 			query_count++;
++			if(mesh_jostle_exceeded(qstate->env->mesh)) {
++				/* Wait for the lookup; do not spawn multiple
++				 * lookups at a time. */
++				verbose(VERB_ALGO, "try parent-side glue lookup");
++				iq->num_target_queries += query_count;
++				target_count_increase(iq, query_count);
++				qstate->ext_state[id] = module_wait_subquery;
++				return 0;
++			}
+ 		}
+ 		if(ie->supports_ipv4 && !ns->done_pside4) {
+ 			/* Send the A request. */
+@@ -2434,7 +2463,12 @@ processQueryTargets(struct module_qstate* qstate, struct iter_qstate* iq,
+ 	if(iq->depth < ie->max_dependency_depth
+ 		&& iq->num_target_queries == 0
+ 		&& (!iq->target_count || iq->target_count[2]==0)
+-		&& iq->sent_count < TARGET_FETCH_STOP) {
++		&& iq->sent_count < TARGET_FETCH_STOP
++		/* if the mesh query list is full, then do not waste cpu
++		 * and sockets to fetch promiscuous targets. They can be
++		 * looked up when needed. */
++		&& !mesh_jostle_exceeded(qstate->env->mesh)
++		) {
+ 		tf_policy = ie->target_fetch_policy[iq->depth];
+ 	}
+ 
+diff --git a/services/cache/dns.c b/services/cache/dns.c
+index 99faaf678..96a33df7d 100644
+--- a/services/cache/dns.c
++++ b/services/cache/dns.c
+@@ -404,6 +404,9 @@ cache_fill_missing(struct module_env* env, uint16_t qclass,
+ 	struct ub_packed_rrset_key* akey;
+ 	time_t now = *env->now;
+ 	for(ns = dp->nslist; ns; ns = ns->next) {
++		if(ns->cache_lookup_count > ITERATOR_NAME_CACHELOOKUP_MAX)
++			continue;
++		ns->cache_lookup_count++;
+ 		akey = rrset_cache_lookup(env->rrset_cache, ns->name, 
+ 			ns->namelen, LDNS_RR_TYPE_A, qclass, 0, now, 0);
+ 		if(akey) {
+diff --git a/services/mesh.c b/services/mesh.c
+index 544ca0aa1..7a62d47d4 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -2082,3 +2082,10 @@ mesh_serve_expired_callback(void* arg)
+ 		mesh_do_callback(mstate, LDNS_RCODE_NOERROR, msg->rep, c, &tv);
+ 	}
+ }
++
++int mesh_jostle_exceeded(struct mesh_area* mesh)
++{
++	if(mesh->all.count < mesh->max_reply_states)
++		return 0;
++	return 1;
++}
+diff --git a/services/mesh.h b/services/mesh.h
+index d0a4b5fb3..2248178b7 100644
+--- a/services/mesh.h
++++ b/services/mesh.h
+@@ -674,4 +674,15 @@ struct dns_msg*
+ mesh_serve_expired_lookup(struct module_qstate* qstate,
+ 	struct query_info* lookup_qinfo);
+ 
++/**
++ * See if the mesh has space for more queries. You can allocate queries
++ * anyway, but this checks for the allocated space.
++ * @param mesh: mesh area.
++ * @return true if the query list is full.
++ * 	It checks the number of all queries, not just number of reply states,
++ * 	that have a client address. So that spawned queries count too,
++ * 	that were created by the iterator, or other modules.
++ */
++int mesh_jostle_exceeded(struct mesh_area* mesh);
++
+ #endif /* SERVICES_MESH_H */
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/unbound/unbound_1.15.0.bb b/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
index 8e0cefd7b3..d289bd2d46 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 	file://CVE-2022-30698_30699.patch \
+	file://CVE-2022-3204.patch \
 "
 SRCREV = "c29b0e0a96c4d281aef40d69a11c564d6ed1a2c6"
 
-- 
2.25.1


