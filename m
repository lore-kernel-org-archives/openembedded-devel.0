Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E2ECCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 08:59:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.15743.1761209979600743503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 01:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j8HhGjMp;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27eceb38eb1so6197835ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761209978; x=1761814778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEY5BaFuchQShbAMclP9OgWeozJrjdbntD1/vDp5cpo=;
        b=j8HhGjMpZgidRtVuZarjH49CyfbUcmOWdCe7UJRWa0PxABBTwr1mdlDy+A/8QQok6M
         nyvfv1DR41q6zbquzEDdNDk5B5UFr6kPrdPbI6enVUIaZ8EG9tTsDCi/Zpu1AyP5Ugu8
         2c7reYBBJ/Wc/p17okzgbgpRMHANtISxKVPzjDUEz5+YD4wDZPbLTOTgo8xDDMoYP5aZ
         5mT31BBZT13PtuZ1fa5iuJgMdoIUtLmu4lS0E8y3Xl+1gD1OL9D9m94N2sVJgAMBhUCI
         2IXJ+U5Y97gvYwHPYo9gs2N4UsbVS/ueR+6X/CLSd979OLMw2hW6Q//LTmG0cDdXoS1T
         qbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209978; x=1761814778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEY5BaFuchQShbAMclP9OgWeozJrjdbntD1/vDp5cpo=;
        b=TqsjRYTfe7/tpRWL+c6OElYG1uEOCIwIHWrPr75PsuDyELLQja3Jgc6540nk/HWQ2V
         r8CSOhS5OlS1wdHz5bJuHTngGHqxkS4RxjUh/pHFrv7P+jV15W9nX1QK2lX+3joUimx2
         P8nEHya6lNri/gHrTftWu92fGCm4Ym3z00jkYrg1PYE7d2vmEkPmx9D5khYXHofVnYnX
         my47SXMIcfmKbH6GZ4JEKcfSdjQUj4PJhObhsjTRPhCvDhB3DGVOX3SP8MeVz0zA2EyL
         l0Mk4JKJ0lHc526Wl+sktLaPZXSqFBU3XZsrJun228peGngAowhdc9OkfuKKdB0Byb52
         ci9A==
X-Gm-Message-State: AOJu0YyePxjACZbEAt5Nerhd1jxuMsQ39sL4npGByvh/D5f1lDgLs5Pl
	32SzxliSUCD5siTUL/p2PEvaUmE6j5vd2bEZsjfhmuQXaCGUhvR9BvjBxOl9vQ==
X-Gm-Gg: ASbGncsKJcZi7uXUmQiuBcMr6T6DkSnBfaRgT7AyB+EmeXw3G75PSCMp9qNIaAxYd1n
	fois+wxAWk4PSeJkhOS9SYipZi+FNfL0iV/wpwhIHcvzp3TijNNYjPXqZ8SkF2IKgIi9Ea7AB3Z
	rjv0F0gVzVomq+FxqiXjBzVWhRBU/4FOCRM6cf0P8End1hjFXSvhOMErVAd/jGnNhioYDvQArxc
	28VyZfjz400QzCKkOZcokX6vc4VI4FGvMuY0ER171lkJrcPQ3v42soh3jvjca+l/o4PaaYbE1gG
	Lbbko/bbYNc4A86ilJ4QHM+dxsJIUxI06nVpgW+mJlXOB8vg9iILrO52rLVl9cgugQJkhRI9ARt
	oiTUexdHOb1NlOi5EnexooLwHeJHfyWI9oJt1rfw7jZhkaYLtKubBXQ3PraLtYjluNPzX11Xu7b
	e1NP/IAeQqUNmvuA==
X-Google-Smtp-Source: AGHT+IHHilK7f0mhq429/4ijk5iD+C/Y7j5LVxRvkbpC9mSEK17a+Y8vrTzPjeugTUlMjtILR+6kbQ==
X-Received: by 2002:a17:902:d50a:b0:27d:339c:4b0 with SMTP id d9443c01a7336-290cba4efb1mr313034805ad.35.1761209978201;
        Thu, 23 Oct 2025 01:59:38 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2405:201:a438:60:7f43:36dd:a0e2:5aed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfc1314sm16102665ad.58.2025.10.23.01.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:59:37 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Subject: [oe][meta-oe][scarthgap][PATCH] unbound: Fix for the DNSBomb vulnerability CVE-2024-33655
Date: Thu, 23 Oct 2025 14:29:32 +0530
Message-Id: <20251023085932.246696-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 08:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120917

Unbound could be used to take part in a DoS attack.The DNS protocol
in RFC 1035 and updates allows remote attackers to cause a denial of
service (resource consumption) by arranging for DNS queries to be
accumulated for seconds, such that responses are later sent in a
pulsing burst (which can be considered traffic amplification in
some cases), aka the “DNSBomb” issue.

Signed-off-by: Naman Jain <namanj1@kpit.com>
Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../unbound/unbound/CVE-2024-33655.patch      | 769 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
 2 files changed, 770 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-33655.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2024-33655.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2024-33655.patch
new file mode 100644
index 0000000000..ea63a7bbf9
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2024-33655.patch
@@ -0,0 +1,769 @@
+From c3206f4568f60c486be6d165b1f2b5b254fea3de Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 1 May 2024 10:10:58 +0200
+Subject: [PATCH] - Fix for the DNSBomb vulnerability CVE-2024-33655. Thanks to
+ Xiang Li   from the Network and Information Security Lab of Tsinghua
+ University   for reporting it.
+
+CVE: CVE-2025-33655
+Upstream-Status: Backport [https://nlnetlabs.nl/downloads/unbound/patch_CVE-2024-33655.diff]
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+diff --git a/doc/example.conf.in b/doc/example.conf.in
+index 1ac155b7c..670479808 100644
+--- a/doc/example.conf.in
++++ b/doc/example.conf.in
+@@ -191,6 +191,21 @@ server:
+ 	# are behind a slow satellite link, to eg. 1128.
+ 	# unknown-server-time-limit: 376
+ 
++	# msec before recursion replies are dropped. The work item continues.
++	# discard-timeout: 1900
++
++	# Max number of replies waiting for recursion per IP address.
++	# wait-limit: 1000
++
++	# Max replies waiting for recursion for IP address with cookie.
++	# wait-limit-cookie: 10000
++
++	# Apart from the default, the wait limit can be set for a netblock.
++	# wait-limit-netblock: 192.0.2.0/24 50000
++
++	# Apart from the default, the wait limit with cookie can be adjusted.
++	# wait-limit-cookie-netblock: 192.0.2.0/24 50000
++
+ 	# the amount of memory to use for the RRset cache.
+ 	# plain value in bytes or you can append k, m or G. default is "4Mb".
+ 	# rrset-cache-size: 4m
+diff --git a/doc/unbound.conf.5.in b/doc/unbound.conf.5.in
+index 84eddd941..cc5fd64d9 100644
+--- a/doc/unbound.conf.5.in
++++ b/doc/unbound.conf.5.in
+@@ -302,6 +302,36 @@ Increase this if you are behind a slow satellite link, to eg. 1128.
+ That would then avoid re\-querying every initial query because it times out.
+ Default is 376 msec.
+ .TP
++.B discard\-timeout: \fI<msec>
++The wait time in msec where recursion requests are dropped. This is
++to stop a large number of replies from accumulating. They receive
++no reply, the work item continues to recurse. It is nice to be a bit
++larger than serve\-expired\-client\-timeout if that is enabled.
++A value of 1900 msec is suggested. The value 0 disables it.
++Default 1900 msec.
++.TP
++.B wait\-limit: \fI<number>
++The number of replies that can wait for recursion, for an IP address.
++This makes a ratelimit per IP address of waiting replies for recursion.
++It stops very large amounts of queries waiting to be returned to one
++destination. The value 0 disables wait limits. Default is 1000.
++.TP
++.B wait\-limit\-cookie: \fI<number>
++The number of replies that can wait for recursion, for an IP address
++that sent the query with a valid DNS cookie. Since the cookie validates
++the client address, the limit can be higher. Default is 10000.
++.TP
++.B wait\-limit\-netblock: \fI<netblock> <number>
++The wait limit for the netblock. If not given the wait\-limit value is
++used. The most specific netblock is used to determine the limit. Useful for
++overriding the default for a specific, group or individual, server.
++The value -1 disables wait limits for the netblock.
++.TP
++.B wait\-limit\-cookie\-netblock: \fI<netblock> <number>
++The wait limit for the netblock, when the query has a DNS cookie.
++If not given, the wait\-limit\-cookie value is used.
++The value -1 disables wait limits for the netblock.
++.TP
+ .B so\-rcvbuf: \fI<number>
+ If not 0, then set the SO_RCVBUF socket option to get more buffer
+ space on UDP port 53 incoming queries.  So that short spikes on busy
+diff --git a/services/cache/infra.c b/services/cache/infra.c
+index 31462d13a..457685ab5 100644
+--- a/services/cache/infra.c
++++ b/services/cache/infra.c
+@@ -234,6 +234,81 @@ setup_domain_limits(struct infra_cache* infra, struct config_file* cfg)
+ 	return 1;
+ }
+ 
++/** find or create element in wait limit netblock tree */
++static struct wait_limit_netblock_info*
++wait_limit_netblock_findcreate(struct infra_cache* infra, char* str,
++	int cookie)
++{
++	rbtree_type* tree;
++	struct sockaddr_storage addr;
++	int net;
++	socklen_t addrlen;
++	struct wait_limit_netblock_info* d;
++
++	if(!netblockstrtoaddr(str, 0, &addr, &addrlen, &net)) {
++		log_err("cannot parse wait limit netblock '%s'", str);
++		return 0;
++	}
++
++	/* can we find it? */
++	if(cookie)
++		tree = &infra->wait_limits_cookie_netblock;
++	else
++		tree = &infra->wait_limits_netblock;
++	d = (struct wait_limit_netblock_info*)addr_tree_find(tree, &addr,
++		addrlen, net);
++	if(d)
++		return d;
++
++	/* create it */
++	d = (struct wait_limit_netblock_info*)calloc(1, sizeof(*d));
++	if(!d)
++		return NULL;
++	d->limit = -1;
++	if(!addr_tree_insert(tree, &d->node, &addr, addrlen, net)) {
++		log_err("duplicate element in domainlimit tree");
++		free(d);
++		return NULL;
++	}
++	return d;
++}
++
++
++/** insert wait limit information into lookup tree */
++static int
++infra_wait_limit_netblock_insert(struct infra_cache* infra,
++	struct config_file* cfg)
++{
++	struct config_str2list* p;
++	struct wait_limit_netblock_info* d;
++	for(p = cfg->wait_limit_netblock; p; p = p->next) {
++		d = wait_limit_netblock_findcreate(infra, p->str, 0);
++		if(!d)
++			return 0;
++		d->limit = atoi(p->str2);
++	}
++	for(p = cfg->wait_limit_cookie_netblock; p; p = p->next) {
++		d = wait_limit_netblock_findcreate(infra, p->str, 1);
++		if(!d)
++			return 0;
++		d->limit = atoi(p->str2);
++	}
++	return 1;
++}
++
++/** setup wait limits tree (0 on failure) */
++static int
++setup_wait_limits(struct infra_cache* infra, struct config_file* cfg)
++{
++	addr_tree_init(&infra->wait_limits_netblock);
++	addr_tree_init(&infra->wait_limits_cookie_netblock);
++	if(!infra_wait_limit_netblock_insert(infra, cfg))
++		return 0;
++	addr_tree_init_parents(&infra->wait_limits_netblock);
++	addr_tree_init_parents(&infra->wait_limits_cookie_netblock);
++	return 1;
++}
++
+ struct infra_cache* 
+ infra_create(struct config_file* cfg)
+ {
+@@ -267,6 +342,10 @@ infra_create(struct config_file* cfg)
+ 		infra_delete(infra);
+ 		return NULL;
+ 	}
++	if(!setup_wait_limits(infra, cfg)) {
++		infra_delete(infra);
++		return NULL;
++	}
+ 	infra_ip_ratelimit = cfg->ip_ratelimit;
+ 	infra->client_ip_rates = slabhash_create(cfg->ip_ratelimit_slabs,
+ 	    INFRA_HOST_STARTSIZE, cfg->ip_ratelimit_size, &ip_rate_sizefunc,
+@@ -287,6 +366,12 @@ static void domain_limit_free(rbnode_type* n, void* ATTR_UNUSED(arg))
+ 	}
+ }
+ 
++/** delete wait_limit_netblock_info entries */
++static void wait_limit_netblock_del(rbnode_type* n, void* ATTR_UNUSED(arg))
++{
++	free(n);
++}
++
+ void 
+ infra_delete(struct infra_cache* infra)
+ {
+@@ -296,6 +381,10 @@ infra_delete(struct infra_cache* infra)
+ 	slabhash_delete(infra->domain_rates);
+ 	traverse_postorder(&infra->domain_limits, domain_limit_free, NULL);
+ 	slabhash_delete(infra->client_ip_rates);
++	traverse_postorder(&infra->wait_limits_netblock,
++		wait_limit_netblock_del, NULL);
++	traverse_postorder(&infra->wait_limits_cookie_netblock,
++		wait_limit_netblock_del, NULL);
+ 	free(infra);
+ }
+ 
+@@ -880,7 +969,8 @@ static void infra_create_ratedata(struct infra_cache* infra,
+ 
+ /** create rate data item for ip address */
+ static void infra_ip_create_ratedata(struct infra_cache* infra,
+-	struct sockaddr_storage* addr, socklen_t addrlen, time_t timenow)
++	struct sockaddr_storage* addr, socklen_t addrlen, time_t timenow,
++	int mesh_wait)
+ {
+ 	hashvalue_type h = hash_addr(addr, addrlen, 0);
+ 	struct ip_rate_key* k = (struct ip_rate_key*)calloc(1, sizeof(*k));
+@@ -898,6 +988,7 @@ static void infra_ip_create_ratedata(struct infra_cache* infra,
+ 	k->entry.data = d;
+ 	d->qps[0] = 1;
+ 	d->timestamp[0] = timenow;
++	d->mesh_wait = mesh_wait;
+ 	slabhash_insert(infra->client_ip_rates, h, &k->entry, d, NULL);
+ }
+ 
+@@ -1121,6 +1212,81 @@ int infra_ip_ratelimit_inc(struct infra_cache* infra,
+ 	}
+ 
+ 	/* create */
+-	infra_ip_create_ratedata(infra, addr, addrlen, timenow);
++	infra_ip_create_ratedata(infra, addr, addrlen, timenow, 0);
+ 	return 1;
+ }
++
++int infra_wait_limit_allowed(struct infra_cache* infra, struct comm_reply* rep,
++	int cookie_valid, struct config_file* cfg)
++{
++	struct lruhash_entry* entry;
++	if(cfg->wait_limit == 0)
++		return 1;
++
++	entry = infra_find_ip_ratedata(infra, &rep->client_addr,
++		rep->client_addrlen, 0);
++	if(entry) {
++		rbtree_type* tree;
++		struct wait_limit_netblock_info* w;
++		struct rate_data* d = (struct rate_data*)entry->data;
++		int mesh_wait = d->mesh_wait;
++		lock_rw_unlock(&entry->lock);
++
++		/* have the wait amount, check how much is allowed */
++		if(cookie_valid)
++			tree = &infra->wait_limits_cookie_netblock;
++		else	tree = &infra->wait_limits_netblock;
++		w = (struct wait_limit_netblock_info*)addr_tree_lookup(tree,
++			&rep->client_addr, rep->client_addrlen);
++		if(w) {
++			if(w->limit != -1 && mesh_wait > w->limit)
++				return 0;
++		} else {
++			/* if there is no IP netblock specific information,
++			 * use the configured value. */
++			if(mesh_wait > (cookie_valid?cfg->wait_limit_cookie:
++				cfg->wait_limit))
++				return 0;
++		}
++	}
++	return 1;
++}
++
++void infra_wait_limit_inc(struct infra_cache* infra, struct comm_reply* rep,
++	time_t timenow, struct config_file* cfg)
++{
++	struct lruhash_entry* entry;
++	if(cfg->wait_limit == 0)
++		return;
++
++	/* Find it */
++	entry = infra_find_ip_ratedata(infra, &rep->client_addr,
++		rep->client_addrlen, 1);
++	if(entry) {
++		struct rate_data* d = (struct rate_data*)entry->data;
++		d->mesh_wait++;
++		lock_rw_unlock(&entry->lock);
++		return;
++	}
++
++	/* Create it */
++	infra_ip_create_ratedata(infra, &rep->client_addr,
++		rep->client_addrlen, timenow, 1);
++}
++
++void infra_wait_limit_dec(struct infra_cache* infra, struct comm_reply* rep,
++	struct config_file* cfg)
++{
++	struct lruhash_entry* entry;
++	if(cfg->wait_limit == 0)
++		return;
++
++	entry = infra_find_ip_ratedata(infra, &rep->client_addr,
++		rep->client_addrlen, 1);
++	if(entry) {
++		struct rate_data* d = (struct rate_data*)entry->data;
++		if(d->mesh_wait > 0)
++			d->mesh_wait--;
++		lock_rw_unlock(&entry->lock);
++	}
++}
+diff --git a/services/cache/infra.h b/services/cache/infra.h
+index 525073bf3..ee6f384de 100644
+--- a/services/cache/infra.h
++++ b/services/cache/infra.h
+@@ -122,6 +122,10 @@ struct infra_cache {
+ 	rbtree_type domain_limits;
+ 	/** hash table with query rates per client ip: ip_rate_key, ip_rate_data */
+ 	struct slabhash* client_ip_rates;
++	/** tree of addr_tree_node, with wait_limit_netblock_info information */
++	rbtree_type wait_limits_netblock;
++	/** tree of addr_tree_node, with wait_limit_netblock_info information */
++	rbtree_type wait_limits_cookie_netblock;
+ };
+ 
+ /** ratelimit, unless overridden by domain_limits, 0 is off */
+@@ -184,10 +188,22 @@ struct rate_data {
+ 	/** what the timestamp is of the qps array members, counter is
+ 	 * valid for that timestamp.  Usually now and now-1. */
+ 	time_t timestamp[RATE_WINDOW];
++	/** the number of queries waiting in the mesh */
++	int mesh_wait;
+ };
+ 
+ #define ip_rate_data rate_data
+ 
++/**
++ * Data to store the configuration per netblock for the wait limit
++ */
++struct wait_limit_netblock_info {
++	/** The addr tree node, this must be first. */
++	struct addr_tree_node node;
++	/** the limit on the amount */
++	int limit;
++};
++
+ /** infra host cache default hash lookup size */
+ #define INFRA_HOST_STARTSIZE 32
+ /** bytes per zonename reserved in the hostcache, dnamelen(zonename.com.) */
+@@ -474,4 +490,16 @@ void ip_rate_delkeyfunc(void* d, void* arg);
+ /* delete data */
+ #define ip_rate_deldatafunc rate_deldatafunc
+ 
++/** See if the IP address can have another reply in the wait limit */
++int infra_wait_limit_allowed(struct infra_cache* infra, struct comm_reply* rep,
++	int cookie_valid, struct config_file* cfg);
++
++/** Increment number of waiting replies for IP */
++void infra_wait_limit_inc(struct infra_cache* infra, struct comm_reply* rep,
++	time_t timenow, struct config_file* cfg);
++
++/** Decrement number of waiting replies for IP */
++void infra_wait_limit_dec(struct infra_cache* infra, struct comm_reply* rep,
++	struct config_file* cfg);
++
+ #endif /* SERVICES_CACHE_INFRA_H */
+diff --git a/services/mesh.c b/services/mesh.c
+index 47cfb0424..2b06957de 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -47,6 +47,7 @@
+ #include "services/outbound_list.h"
+ #include "services/cache/dns.h"
+ #include "services/cache/rrset.h"
++#include "services/cache/infra.h"
+ #include "util/log.h"
+ #include "util/net_help.h"
+ #include "util/module.h"
+@@ -415,6 +416,14 @@ void mesh_new_client(struct mesh_area* mesh, struct query_info* qinfo,
+ 	if(rep->c->tcp_req_info) {
+ 		r_buffer = rep->c->tcp_req_info->spool_buffer;
+ 	}
++	if(!infra_wait_limit_allowed(mesh->env->infra_cache, rep,
++		edns->cookie_valid, mesh->env->cfg)) {
++		verbose(VERB_ALGO, "Too many queries waiting from the IP. "
++			"dropping incoming query.");
++		comm_point_drop_reply(rep);
++		mesh->stats_dropped++;
++		return;
++	}
+ 	if(!unique)
+ 		s = mesh_area_find(mesh, cinfo, qinfo, qflags&(BIT_RD|BIT_CD), 0, 0);
+ 	/* does this create a new reply state? */
+@@ -511,6 +520,8 @@ void mesh_new_client(struct mesh_area* mesh, struct query_info* qinfo,
+ 		log_err("mesh_new_client: out of memory initializing serve expired");
+ 		goto servfail_mem;
+ 	}
++	infra_wait_limit_inc(mesh->env->infra_cache, rep, *mesh->env->now,
++		mesh->env->cfg);
+ 	/* update statistics */
+ 	if(was_detached) {
+ 		log_assert(mesh->num_detached_states > 0);
+@@ -930,6 +941,8 @@ mesh_state_cleanup(struct mesh_state* mstate)
+ 		 * takes no time and also it does not do the mesh accounting */
+ 		mstate->reply_list = NULL;
+ 		for(; rep; rep=rep->next) {
++			infra_wait_limit_dec(mesh->env->infra_cache,
++				&rep->query_reply, mesh->env->cfg);
+ 			comm_point_drop_reply(&rep->query_reply);
+ 			log_assert(mesh->num_reply_addrs > 0);
+ 			mesh->num_reply_addrs--;
+@@ -1413,6 +1426,8 @@ mesh_send_reply(struct mesh_state* m, int rcode, struct reply_info* rep,
+ 		comm_point_send_reply(&r->query_reply);
+ 		m->reply_list = rlist;
+ 	}
++	infra_wait_limit_dec(m->s.env->infra_cache, &r->query_reply,
++		m->s.env->cfg);
+ 	/* account */
+ 	log_assert(m->s.env->mesh->num_reply_addrs > 0);
+ 	m->s.env->mesh->num_reply_addrs--;
+@@ -1470,6 +1485,28 @@ void mesh_query_done(struct mesh_state* mstate)
+ 		}
+ 	}
+ 	for(r = mstate->reply_list; r; r = r->next) {
++		struct timeval old;
++		timeval_subtract(&old, mstate->s.env->now_tv, &r->start_time);
++		if(mstate->s.env->cfg->discard_timeout != 0 &&
++			((int)old.tv_sec)*1000+((int)old.tv_usec)/1000 >
++			mstate->s.env->cfg->discard_timeout) {
++			/* Drop the reply, it is too old */
++			/* briefly set the reply_list to NULL, so that the
++			 * tcp req info cleanup routine that calls the mesh
++			 * to deregister the meshstate for it is not done
++			 * because the list is NULL and also accounting is not
++			 * done there, but instead we do that here. */
++			struct mesh_reply* reply_list = mstate->reply_list;
++			verbose(VERB_ALGO, "drop reply, it is older than discard-timeout");
++			infra_wait_limit_dec(mstate->s.env->infra_cache,
++				&r->query_reply, mstate->s.env->cfg);
++			mstate->reply_list = NULL;
++			comm_point_drop_reply(&r->query_reply);
++			mstate->reply_list = reply_list;
++			mstate->s.env->mesh->stats_dropped++;
++			continue;
++		}
++
+ 		i++;
+ 		tv = r->start_time;
+ 
+@@ -1493,6 +1530,8 @@ void mesh_query_done(struct mesh_state* mstate)
+ 			 * because the list is NULL and also accounting is not
+ 			 * done there, but instead we do that here. */
+ 			struct mesh_reply* reply_list = mstate->reply_list;
++			infra_wait_limit_dec(mstate->s.env->infra_cache,
++				&r->query_reply, mstate->s.env->cfg);
+ 			mstate->reply_list = NULL;
+ 			comm_point_drop_reply(&r->query_reply);
+ 			mstate->reply_list = reply_list;
+@@ -2025,6 +2064,8 @@ void mesh_state_remove_reply(struct mesh_area* mesh, struct mesh_state* m,
+ 			/* delete it, but allocated in m region */
+ 			log_assert(mesh->num_reply_addrs > 0);
+ 			mesh->num_reply_addrs--;
++			infra_wait_limit_dec(mesh->env->infra_cache,
++				&n->query_reply, mesh->env->cfg);
+ 
+ 			/* prev = prev; */
+ 			n = n->next;
+@@ -2165,6 +2206,28 @@ mesh_serve_expired_callback(void* arg)
+ 		log_dns_msg("Serve expired lookup", &qstate->qinfo, msg->rep);
+ 
+ 	for(r = mstate->reply_list; r; r = r->next) {
++		struct timeval old;
++		timeval_subtract(&old, mstate->s.env->now_tv, &r->start_time);
++		if(mstate->s.env->cfg->discard_timeout != 0 &&
++			((int)old.tv_sec)*1000+((int)old.tv_usec)/1000 >
++			mstate->s.env->cfg->discard_timeout) {
++			/* Drop the reply, it is too old */
++			/* briefly set the reply_list to NULL, so that the
++			 * tcp req info cleanup routine that calls the mesh
++			 * to deregister the meshstate for it is not done
++			 * because the list is NULL and also accounting is not
++			 * done there, but instead we do that here. */
++			struct mesh_reply* reply_list = mstate->reply_list;
++			verbose(VERB_ALGO, "drop reply, it is older than discard-timeout");
++			infra_wait_limit_dec(mstate->s.env->infra_cache,
++				&r->query_reply, mstate->s.env->cfg);
++			mstate->reply_list = NULL;
++			comm_point_drop_reply(&r->query_reply);
++			mstate->reply_list = reply_list;
++			mstate->s.env->mesh->stats_dropped++;
++			continue;
++		}
++
+ 		i++;
+ 		tv = r->start_time;
+ 
+@@ -2192,6 +2255,8 @@ mesh_serve_expired_callback(void* arg)
+ 			r, r_buffer, prev, prev_buffer);
+ 		if(r->query_reply.c->tcp_req_info)
+ 			tcp_req_info_remove_mesh_state(r->query_reply.c->tcp_req_info, mstate);
++		infra_wait_limit_dec(mstate->s.env->infra_cache,
++			&r->query_reply, mstate->s.env->cfg);
+ 		prev = r;
+ 		prev_buffer = r_buffer;
+ 	}
+diff --git a/testdata/doh_downstream.tdir/doh_downstream.conf b/testdata/doh_downstream.tdir/doh_downstream.conf
+index f0857bb58..222c2159d 100644
+--- a/testdata/doh_downstream.tdir/doh_downstream.conf
++++ b/testdata/doh_downstream.tdir/doh_downstream.conf
+@@ -11,6 +11,7 @@ server:
+ 	chroot: ""
+ 	username: ""
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ 	http-query-buffer-size: 1G
+ 	http-response-buffer-size: 1G
+ 	http-max-streams: 200
+diff --git a/testdata/doh_downstream_notls.tdir/doh_downstream_notls.conf b/testdata/doh_downstream_notls.tdir/doh_downstream_notls.conf
+index bdca45645..161c35559 100644
+--- a/testdata/doh_downstream_notls.tdir/doh_downstream_notls.conf
++++ b/testdata/doh_downstream_notls.tdir/doh_downstream_notls.conf
+@@ -11,6 +11,7 @@ server:
+ 	chroot: ""
+ 	username: ""
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ 	http-query-buffer-size: 1G
+ 	http-response-buffer-size: 1G
+ 	http-max-streams: 200
+diff --git a/testdata/doh_downstream_post.tdir/doh_downstream_post.conf b/testdata/doh_downstream_post.tdir/doh_downstream_post.conf
+index f0857bb58..222c2159d 100644
+--- a/testdata/doh_downstream_post.tdir/doh_downstream_post.conf
++++ b/testdata/doh_downstream_post.tdir/doh_downstream_post.conf
+@@ -11,6 +11,7 @@ server:
+ 	chroot: ""
+ 	username: ""
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ 	http-query-buffer-size: 1G
+ 	http-response-buffer-size: 1G
+ 	http-max-streams: 200
+diff --git a/testdata/fwd_three_service.tdir/fwd_three_service.conf b/testdata/fwd_three_service.tdir/fwd_three_service.conf
+index 05fafe015..d6c9a205f 100644
+--- a/testdata/fwd_three_service.tdir/fwd_three_service.conf
++++ b/testdata/fwd_three_service.tdir/fwd_three_service.conf
+@@ -11,6 +11,7 @@ server:
+ 	num-queries-per-thread: 1024
+ 	use-syslog: no
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ forward-zone:
+ 	name: "."
+ 	forward-addr: "127.0.0.1@@TOPORT@"
+diff --git a/testdata/iter_ghost_timewindow.rpl b/testdata/iter_ghost_timewindow.rpl
+index 566be82a9..9e304628c 100644
+--- a/testdata/iter_ghost_timewindow.rpl
++++ b/testdata/iter_ghost_timewindow.rpl
+@@ -3,6 +3,7 @@ server:
+ 	target-fetch-policy: "0 0 0 0 0"
+ 	qname-minimisation: "no"
+ 	minimal-responses: no
++	discard-timeout: 86400
+ 
+ stub-zone:
+ 	name: "."
+diff --git a/testdata/ssl_req_order.tdir/ssl_req_order.conf b/testdata/ssl_req_order.tdir/ssl_req_order.conf
+index 3b2e2b1b4..ec39d3ab2 100644
+--- a/testdata/ssl_req_order.tdir/ssl_req_order.conf
++++ b/testdata/ssl_req_order.tdir/ssl_req_order.conf
+@@ -9,6 +9,7 @@ server:
+ 	chroot: ""
+ 	username: ""
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ 	ssl-port: @PORT@
+ 	ssl-service-key: "unbound_server.key"
+ 	ssl-service-pem: "unbound_server.pem"
+diff --git a/testdata/tcp_req_order.tdir/tcp_req_order.conf b/testdata/tcp_req_order.tdir/tcp_req_order.conf
+index 40d6f55c8..b2804e8e2 100644
+--- a/testdata/tcp_req_order.tdir/tcp_req_order.conf
++++ b/testdata/tcp_req_order.tdir/tcp_req_order.conf
+@@ -9,6 +9,7 @@ server:
+ 	chroot: ""
+ 	username: ""
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ 
+ 	local-zone: "example.net" static
+ 	local-data: "www1.example.net. IN A 1.2.3.1"
+diff --git a/testdata/tcp_sigpipe.tdir/tcp_sigpipe.conf b/testdata/tcp_sigpipe.tdir/tcp_sigpipe.conf
+index 384f16b07..4f1ff9b08 100644
+--- a/testdata/tcp_sigpipe.tdir/tcp_sigpipe.conf
++++ b/testdata/tcp_sigpipe.tdir/tcp_sigpipe.conf
+@@ -1,5 +1,5 @@
+ server:
+-	verbosity: 2
++	verbosity: 4
+ 	# num-threads: 1
+ 	interface: 127.0.0.1
+ 	port: @PORT@
+@@ -9,6 +9,7 @@ server:
+ 	chroot: ""
+ 	username: ""
+ 	do-not-query-localhost: no
++	discard-timeout: 3000  # testns uses sleep=2
+ 
+ forward-zone:
+ 	name: "."
+diff --git a/util/config_file.c b/util/config_file.c
+index 26185da02..147f41e85 100644
+--- a/util/config_file.c
++++ b/util/config_file.c
+@@ -308,6 +308,11 @@ config_create(void)
+ 	cfg->minimal_responses = 1;
+ 	cfg->rrset_roundrobin = 1;
+ 	cfg->unknown_server_time_limit = 376;
++	cfg->discard_timeout = 1900; /* msec */
++	cfg->wait_limit = 1000;
++	cfg->wait_limit_cookie = 10000;
++	cfg->wait_limit_netblock = NULL;
++	cfg->wait_limit_cookie_netblock = NULL;
+ 	cfg->max_udp_size = 1232; /* value taken from edns_buffer_size */
+ 	if(!(cfg->server_key_file = strdup(RUN_DIR"/unbound_server.key")))
+ 		goto error_exit;
+@@ -722,6 +727,9 @@ int config_set_option(struct config_file* cfg, const char* opt,
+ 	else S_YNO("minimal-responses:", minimal_responses)
+ 	else S_YNO("rrset-roundrobin:", rrset_roundrobin)
+ 	else S_NUMBER_OR_ZERO("unknown-server-time-limit:", unknown_server_time_limit)
++	else S_NUMBER_OR_ZERO("discard-timeout:", discard_timeout)
++	else S_NUMBER_OR_ZERO("wait-limit:", wait_limit)
++	else S_NUMBER_OR_ZERO("wait-limit-cookie:", wait_limit_cookie)
+ 	else S_STRLIST("local-data:", local_data)
+ 	else S_YNO("unblock-lan-zones:", unblock_lan_zones)
+ 	else S_YNO("insecure-lan-zones:", insecure_lan_zones)
+@@ -1201,6 +1209,11 @@ config_get_option(struct config_file* cfg, const char* opt,
+ 	else O_YNO(opt, "minimal-responses", minimal_responses)
+ 	else O_YNO(opt, "rrset-roundrobin", rrset_roundrobin)
+ 	else O_DEC(opt, "unknown-server-time-limit", unknown_server_time_limit)
++	else O_DEC(opt, "discard-timeout", discard_timeout)
++	else O_DEC(opt, "wait-limit", wait_limit)
++	else O_DEC(opt, "wait-limit-cookie", wait_limit_cookie)
++	else O_LS2(opt, "wait-limit-netblock", wait_limit_netblock)
++	else O_LS2(opt, "wait-limit-cookie-netblock", wait_limit_cookie_netblock)
+ #ifdef CLIENT_SUBNET
+ 	else O_LST(opt, "send-client-subnet", client_subnet)
+ 	else O_LST(opt, "client-subnet-zone", client_subnet_zone)
+@@ -1671,6 +1684,8 @@ config_delete(struct config_file* cfg)
+ 	config_deltrplstrlist(cfg->interface_tag_actions);
+ 	config_deltrplstrlist(cfg->interface_tag_datas);
+ 	config_delstrlist(cfg->control_ifs.first);
++	config_deldblstrlist(cfg->wait_limit_netblock);
++	config_deldblstrlist(cfg->wait_limit_cookie_netblock);
+ 	free(cfg->server_key_file);
+ 	free(cfg->server_cert_file);
+ 	free(cfg->control_key_file);
+diff --git a/util/config_file.h b/util/config_file.h
+index 491109833..7ded3c245 100644
+--- a/util/config_file.h
++++ b/util/config_file.h
+@@ -535,6 +535,21 @@ struct config_file {
+ 	/* wait time for unknown server in msec */
+ 	int unknown_server_time_limit;
+ 
++	/** Wait time to drop recursion replies */
++	int discard_timeout;
++
++	/** Wait limit for number of replies per IP address */
++	int wait_limit;
++
++	/** Wait limit for number of replies per IP address with cookie */
++	int wait_limit_cookie;
++
++	/** wait limit per netblock */
++	struct config_str2list* wait_limit_netblock;
++
++	/** wait limit with cookie per netblock */
++	struct config_str2list* wait_limit_cookie_netblock;
++
+ 	/* maximum UDP response size */
+ 	size_t max_udp_size;
+ 
+diff --git a/util/configlexer.lex b/util/configlexer.lex
+index e1ab76e25..7455f50c0 100644
+--- a/util/configlexer.lex
++++ b/util/configlexer.lex
+@@ -463,6 +463,11 @@ domain-insecure{COLON}		{ YDVAR(1, VAR_DOMAIN_INSECURE) }
+ minimal-responses{COLON}	{ YDVAR(1, VAR_MINIMAL_RESPONSES) }
+ rrset-roundrobin{COLON}		{ YDVAR(1, VAR_RRSET_ROUNDROBIN) }
+ unknown-server-time-limit{COLON} { YDVAR(1, VAR_UNKNOWN_SERVER_TIME_LIMIT) }
++discard-timeout{COLON}		{ YDVAR(1, VAR_DISCARD_TIMEOUT) }
++wait-limit{COLON}		{ YDVAR(1, VAR_WAIT_LIMIT) }
++wait-limit-cookie{COLON}	{ YDVAR(1, VAR_WAIT_LIMIT_COOKIE) }
++wait-limit-netblock{COLON}	{ YDVAR(1, VAR_WAIT_LIMIT_NETBLOCK) }
++wait-limit-cookie-netblock{COLON} { YDVAR(1, VAR_WAIT_LIMIT_COOKIE_NETBLOCK) }
+ max-udp-size{COLON}		{ YDVAR(1, VAR_MAX_UDP_SIZE) }
+ dns64-prefix{COLON}		{ YDVAR(1, VAR_DNS64_PREFIX) }
+ dns64-synthall{COLON}		{ YDVAR(1, VAR_DNS64_SYNTHALL) }
+diff --git a/util/configparser.y b/util/configparser.y
+index 0e4cd5960..7d95690ee 100644
+--- a/util/configparser.y
++++ b/util/configparser.y
+@@ -188,6 +188,8 @@ extern struct config_parser_state* cfg_parser;
+ %token VAR_ANSWER_COOKIE VAR_COOKIE_SECRET VAR_IP_RATELIMIT_COOKIE
+ %token VAR_FORWARD_NO_CACHE VAR_STUB_NO_CACHE VAR_LOG_SERVFAIL VAR_DENY_ANY
+ %token VAR_UNKNOWN_SERVER_TIME_LIMIT VAR_LOG_TAG_QUERYREPLY
++%token VAR_DISCARD_TIMEOUT VAR_WAIT_LIMIT VAR_WAIT_LIMIT_COOKIE
++%token VAR_WAIT_LIMIT_NETBLOCK VAR_WAIT_LIMIT_COOKIE_NETBLOCK
+ %token VAR_STREAM_WAIT_SIZE VAR_TLS_CIPHERS VAR_TLS_CIPHERSUITES VAR_TLS_USE_SNI
+ %token VAR_IPSET VAR_IPSET_NAME_V4 VAR_IPSET_NAME_V6
+ %token VAR_TLS_SESSION_TICKET_KEYS VAR_RPZ VAR_TAGS VAR_RPZ_ACTION_OVERRIDE
+@@ -325,6 +327,8 @@ content_server: server_num_threads | server_verbosity | server_port |
+ 	server_fast_server_permil | server_fast_server_num  | server_tls_win_cert |
+ 	server_tcp_connection_limit | server_log_servfail | server_deny_any |
+ 	server_unknown_server_time_limit | server_log_tag_queryreply |
++	server_discard_timeout | server_wait_limit | server_wait_limit_cookie |
++	server_wait_limit_netblock | server_wait_limit_cookie_netblock |
+ 	server_stream_wait_size | server_tls_ciphers |
+ 	server_tls_ciphersuites | server_tls_session_ticket_keys |
+ 	server_answer_cookie | server_cookie_secret | server_ip_ratelimit_cookie |
+@@ -2366,6 +2370,57 @@ server_unknown_server_time_limit: VAR_UNKNOWN_SERVER_TIME_LIMIT STRING_ARG
+ 		free($2);
+ 	}
+ 	;
++server_discard_timeout: VAR_DISCARD_TIMEOUT STRING_ARG
++	{
++		OUTYY(("P(server_discard_timeout:%s)\n", $2));
++		cfg_parser->cfg->discard_timeout = atoi($2);
++		free($2);
++	}
++	;
++server_wait_limit: VAR_WAIT_LIMIT STRING_ARG
++	{
++		OUTYY(("P(server_wait_limit:%s)\n", $2));
++		cfg_parser->cfg->wait_limit = atoi($2);
++		free($2);
++	}
++	;
++server_wait_limit_cookie: VAR_WAIT_LIMIT_COOKIE STRING_ARG
++	{
++		OUTYY(("P(server_wait_limit_cookie:%s)\n", $2));
++		cfg_parser->cfg->wait_limit_cookie = atoi($2);
++		free($2);
++	}
++	;
++server_wait_limit_netblock: VAR_WAIT_LIMIT_NETBLOCK STRING_ARG STRING_ARG
++	{
++		OUTYY(("P(server_wait_limit_netblock:%s %s)\n", $2, $3));
++		if(atoi($3) == 0 && strcmp($3, "0") != 0) {
++			yyerror("number expected");
++			free($2);
++			free($3);
++		} else {
++			if(!cfg_str2list_insert(&cfg_parser->cfg->
++				wait_limit_netblock, $2, $3))
++				fatal_exit("out of memory adding "
++					"wait-limit-netblock");
++		}
++	}
++	;
++server_wait_limit_cookie_netblock: VAR_WAIT_LIMIT_COOKIE_NETBLOCK STRING_ARG STRING_ARG
++	{
++		OUTYY(("P(server_wait_limit_cookie_netblock:%s %s)\n", $2, $3));
++		if(atoi($3) == 0 && strcmp($3, "0") != 0) {
++			yyerror("number expected");
++			free($2);
++			free($3);
++		} else {
++			if(!cfg_str2list_insert(&cfg_parser->cfg->
++				wait_limit_cookie_netblock, $2, $3))
++				fatal_exit("out of memory adding "
++					"wait-limit-cookie-netblock");
++		}
++	}
++	;
+ server_max_udp_size: VAR_MAX_UDP_SIZE STRING_ARG
+ 	{
+ 		OUTYY(("P(server_max_udp_size:%s)\n", $2));
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 6f54038c6c..63c1d06a27 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3 \
            file://CVE-2024-8508.patch \
+           file://CVE-2024-33655.patch \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 
-- 
2.34.1


