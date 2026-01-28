Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C069D3568D
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 08:06:31 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6913.1769579163941785833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1mn8N+o;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-501502318b1so64062801cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 21:46:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769579163; cv=none;
        d=google.com; s=arc-20240605;
        b=ESioQujyPZe83S44e52haICV2BBfLnYoFk95uU+b2ha1kUearoMfkwAnk3ONIRvxlq
         8Gox7sHYjh0elBzE4zgpDbTR9vom26XgHBX+lR/uq1qVXy9Ih776ybywtHMq5Tr3E+Kp
         CTVKb9ZsfXqej7tybfK5MIf3JKz1XwcCrgM/FUuSyVgXrwwHQCZ2/BUhf2OdVS0Q/2/o
         NZwR29333cNd1zw6AbEI814fCqXYHkSoGGkrv6PN4H8sXMopS439sdUq0MMkjndIOsQq
         xYp+y7el1d0UpgpmKVIEhce6iE1uG9/Duxp/MttoH+TJOG4zTrj/nw7mF4PLd9bw97SW
         8yZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=McKadRGQDdzJhieTqMlIvREoaFeXsqpoo01mCBkD5RI=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=HOSKhuv6fpu9wVyjne5y65yDWNixO9MfxcsQnO3A+bGwoOG7Qm+a/6UuzN+WzRV9vw
         0t6cjgbg4NUrEDI7itKpK/fJKMtIzEGO8sxbB0//nE9z2cA8edOm79mHEW0bTR0F+wFj
         iS7fAtaePC40yXyEuZjV+eA314Jh1MvNHN/xs7wipVnEAnx05KCL0K7SDY3YfEyNCJM7
         6nlupEx7R0LmjqSqtnV1VjtlZfTFA8CMEnC5hYUNvNrGy6NwDtig1oNNg8oDcURn0mPP
         4lXrndhjABqeokpA3yzXOE+XhVBJ7R8BDPHEt3OGknKL547nUp0fM7uJ8csyFctPi+pu
         N7Ug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769579163; x=1770183963; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=McKadRGQDdzJhieTqMlIvREoaFeXsqpoo01mCBkD5RI=;
        b=Z1mn8N+oGaKpfHKvj+zlt9caAroA6cwPkOhrteuouSU8iV1zLSO2P4ZmTBQvLX/6he
         87r2/4m9/4asWwFZXyhPAyL3sQ1wjiZy8NbRsP3kXz635OTlzsCEVj7DqAcodejRXESS
         LirXI2bCFxONUYJ99n4+tXpVB8rIuaFKmB/0G0x/mi5uhCuHXO/0yHVHFuN+eFN4RAnO
         BztD9jC20xgIGCPBiNLNNYwTuOv/LwB5KqzVvoMgdExVSa8lb/f96Qac6NNXwka7+gcO
         XKIW1Po6CO+d9Ql6xEiffrMpSvD2pSAbD2vhYK8t/8HoXuV7sRGLyQgSFi1lx0L8+dXT
         nY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579163; x=1770183963;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McKadRGQDdzJhieTqMlIvREoaFeXsqpoo01mCBkD5RI=;
        b=L5dOS5Wz1+bwQwfdfmQ3Nb0dPyXDrLrSmdIpfJdEa4UwjMSLZ+mP+88aT9vuvmUuKm
         EgIIDZsEf01NZRiJyBCz1L7S6Ah+5fV2DlUf0CwrvzqGpFKdGAJhMfjnP8EZ4B9NJu1j
         7qzQeaMyi1TYjQgruKcHSwRqfNh3Mb8JZR12msGIEXC0tKpr/oflKzlY308co2gVg2uA
         H8HpZeIMph2gxe8I4BdgqoWZ3sC1jU0s6/Fh+X9TnLREiLjXKDoTYmFQ2RwLBBa3ZFP6
         d0TY3jbPGuSKvIviBf6dzzxtVf4NN0EtU/PWFBcdFSXo67J9qWdq71/E5qNLW4RKul1C
         lpSg==
X-Gm-Message-State: AOJu0YwfJptwgTbd3WCbVZBalO1gVtGq3e+JQGUib+n2eezTb7BSEJ4y
	iE3GIlaxAulN2GGlkkwHq0Kfcie+S2XNB6ugomM9/rqizDicQjdTScBXGOZeczFb/zkGWq6VZDV
	3/eVVUEGHOtliQlMou2a2wfei7rweVGh8Og==
X-Gm-Gg: AZuq6aJzBxZERELCM835cHfvh4M8mU7cDITtbgvzgadZw0xxj9JSR237avocj2RaHJl
	llLYveJGYaAsOMbUA2A2YlCzb4ECI/pRXO5chLdqyo2sTte2FjnXh/N24CZBvJbNz6pUD9JRuIp
	Uhv2f5HXFQp15Nnn7MeQgshhorxPFWi1MAw4w2cKZ8tbZUYbysEhYRCLL2BXqS1ePNphF8tiiVm
	VQiADdP7a73XAMz2bqgwTBYUsc7UKslX/HltBI67k/2yi58SDZacypXShuAQ1owdgb3zPB5LIsJ
	xiyj5C5oxWFc
X-Received: by 2002:a05:622a:241:b0:502:9ffa:1ae6 with SMTP id
 d75a77b69052e-5032fe16f14mr52408511cf.82.1769579162527; Tue, 27 Jan 2026
 21:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20251104095004.3402081-1-namanj1@kpit.com>
In-Reply-To: <20251104095004.3402081-1-namanj1@kpit.com>
From: "Naman Jain" <nmjain23@gmail.com>
Date: Wed, 28 Jan 2026 11:15:49 +0530
X-Gm-Features: AZwV_QgfiLBoklPo57giWUwAGPaM57QREYOab53HpZPy2cuos_6r_VfpCZWM5dg
Message-ID: <CALCkg5aWd19q7G9kC5+4wKsMC2cOHeur-hQiUXOrpx--4tkBpg@mail.gmail.com>
Subject: [meta][master][PATCH] unbound: Fix CVE-2025-5994
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006270fb06496c41d1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 08:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123970

--0000000000006270fb06496c41d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Naman Jain <nmjain23@gmail.com>
Date: Tue, 4 Nov, 2025, 3:20=E2=80=AFpm
Subject: [meta][master][PATCH] unbound: Fix CVE-2025-5994
To: <nmjain23@gmail.com>


A multi-vendor cache poisoning vulnerability named 'Rebirthday Attack' has
been
discovered in caching resolvers that support EDNS Client Subnet (ECS).
Unbound is
also vulnerable when compiled with ECS support, i.e., '--enable-subnet', AN=
D
configured to send ECS information along with queries to upstream name
servers

CVE: CVE-2025-5994

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../unbound/unbound/CVE-2025-5994.patch       | 275 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
 2 files changed, 276 insertions(+)
 create mode 100644
meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch

diff --git
a/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
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
+Subject: [PATCH] - Fix RebirthDay Attack CVE-2025-5994, reported by Xiang
Li
+ from AOSP   Lab Nankai University.
+
+CVE: CVE-2025-5994
+Upstream-Status: Backport [
https://github.com/NLnetLabs/unbound/commit/5bf82f246481098a6473f296b21fc12=
29d276c0f
]
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
+       /* Cache by default, might be disabled after parsing EDNS option
+        * received from nameserver. */
+-      if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)) {
++      if(!iter_stub_fwd_no_cache(qstate, &qstate->qinfo, NULL, NULL)
++              && sq->ecs_client_in.subnet_validdata) {
+               qstate->no_cache_store =3D 0;
+       }
+
+@@ -504,6 +506,69 @@ common_prefix(uint8_t *a, uint8_t *b, ui
+       return !memcmp(a, b, n) && ((net % 8) =3D=3D 0 || a[n] =3D=3D b[n])=
;
+ }
+
++/**
++ * Create sub request that looks up the query.
++ * @param qstate: query state
++ * @param sq: subnet qstate
++ * @return false on failure.
++ */
++static int
++generate_sub_request(struct module_qstate *qstate, struct subnet_qstate*
sq)
++{
++      struct module_qstate* subq =3D NULL;
++      uint16_t qflags =3D 0; /* OPCODE QUERY, no flags */
++      int prime =3D 0;
++      int valrec =3D 0;
++      struct query_info qinf;
++      qinf.qname =3D qstate->qinfo.qname;
++      qinf.qname_len =3D qstate->qinfo.qname_len;
++      qinf.qtype =3D qstate->qinfo.qtype;
++      qinf.qclass =3D qstate->qinfo.qclass;
++      qinf.local_alias =3D NULL;
++
++      qflags |=3D BIT_RD;
++      if((qstate->query_flags & BIT_CD)!=3D0) {
++              qflags |=3D BIT_CD;
++              valrec =3D 1;
++      }
++
++      fptr_ok(fptr_whitelist_modenv_attach_sub(qstate->env->attach_sub));
++      if(!(*qstate->env->attach_sub)(qstate, &qinf, qflags, prime, valrec=
,
++              &subq)) {
++              return 0;
++      }
++      if(subq) {
++              /* It is possible to access the subquery module state. */
++              if(sq->ecs_client_in.subnet_source_mask =3D=3D 0 &&
++                      edns_opt_list_find(qstate->edns_opts_front_in,
++                              qstate->env->cfg->client_subnet_opcode)) {
++                      subq->no_cache_store =3D 1;
++              }
++      }
++      return 1;
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
++      struct subnet_qstate* sq)
++{
++      verbose(VERB_ALGO, "subnetcache: make subquery to look up without
subnet");
++      if(!generate_sub_request(qstate, sq)) {
++              verbose(VERB_ALGO, "Could not generate sub query");
++              qstate->return_rcode =3D LDNS_RCODE_FORMERR;
++              qstate->return_msg =3D NULL;
++              return module_finished;
++      }
++      sq->wait_subquery =3D 1;
++      return module_wait_subquery;
++}
++
+ static enum module_ext_state
+ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate
*sq)
+ {
+@@ -539,14 +604,7 @@ eval_response(struct module_qstate *qsta
+                * is still useful to put it in the edns subnet cache for
+                * when a client explicitly asks for subnet specific
answer. */
+               verbose(VERB_QUERY, "subnetcache: Authority indicates no
support");
+-              if(!sq->started_no_cache_store) {
+-                      lock_rw_wrlock(&sne->biglock);
+-                      update_cache(qstate, id);
+-                      lock_rw_unlock(&sne->biglock);
+-              }
+-              if (sq->subnet_downstream)
+-                      cp_edns_bad_response(c_out, c_in);
+-              return module_finished;
++              return generate_lookup_without_subnet(qstate, sq);
+       }
+
+       /* Purposefully there was no sent subnet, and there is consequently
+@@ -571,14 +629,14 @@ eval_response(struct module_qstate *qsta
+               !common_prefix(s_out->subnet_addr, s_in->subnet_addr,
+                       s_out->subnet_source_mask))
+       {
+-              /* we can not accept, restart query without option */
++              /* we can not accept, perform query without option */
+               verbose(VERB_QUERY, "subnetcache: forged data");
+               s_out->subnet_validdata =3D 0;
+               (void)edns_opt_list_remove(&qstate->edns_opts_back_out,
+                       qstate->env->cfg->client_subnet_opcode);
+               sq->subnet_sent =3D 0;
+               sq->subnet_sent_no_subnet =3D 0;
+-              return module_restart_next;
++              return generate_lookup_without_subnet(qstate, sq);
+       }
+
+       lock_rw_wrlock(&sne->biglock);
+@@ -763,6 +821,9 @@ ecs_edns_back_parsed(struct module_qstat
+       } else if(sq->subnet_sent_no_subnet) {
+               /* The answer can be stored as scope 0, not in global
cache. */
+               qstate->no_cache_store =3D 1;
++      } else if(sq->subnet_sent) {
++              /* Need another query to be able to store in global cache.
*/
++              qstate->no_cache_store =3D 1;
+       }
+
+       return 1;
+@@ -780,6 +841,32 @@ subnetmod_operate(struct module_qstate *
+               strmodulevent(event));
+       log_query_info(VERB_QUERY, "subnetcache operate: query",
&qstate->qinfo);
+
++      if(sq && sq->wait_subquery_done) {
++              /* The subquery lookup returned. */
++              if(sq->ecs_client_in.subnet_source_mask =3D=3D 0 &&
++                      edns_opt_list_find(qstate->edns_opts_front_in,
++                              qstate->env->cfg->client_subnet_opcode)) {
++                      if(!sq->started_no_cache_store &&
++                              qstate->return_msg) {
++                              lock_rw_wrlock(&sne->biglock);
++                              update_cache(qstate, id);
++                              lock_rw_unlock(&sne->biglock);
++                      }
++                      if (sq->subnet_downstream)
++                              cp_edns_bad_response(&sq->ecs_client_out,
++                                      &sq->ecs_client_in);
++                      /* It is a scope zero lookup, append edns subnet
++                       * option to the querier. */
++                      subnet_ecs_opt_list_append(&sq->ecs_client_out,
++                              &qstate->edns_opts_front_out, qstate,
++                              qstate->region);
++              }
++              sq->wait_subquery_done =3D 0;
++              qstate->ext_state[id] =3D module_finished;
++              qstate->no_cache_store =3D sq->started_no_cache_store;
++              qstate->no_cache_lookup =3D sq->started_no_cache_lookup;
++              return;
++      }
+       if((event =3D=3D module_event_new || event =3D=3D module_event_pass=
) &&
+               sq =3D=3D NULL) {
+               struct edns_option* ecs_opt;
+@@ -790,6 +877,8 @@ subnetmod_operate(struct module_qstate *
+               }
+
+               sq =3D (struct subnet_qstate*)qstate->minfo[id];
++              if(sq->wait_subquery)
++                      return; /* Wait for that subquery to return */
+
+               if((ecs_opt =3D edns_opt_list_find(
+                       qstate->edns_opts_front_in,
+@@ -819,6 +908,14 @@ subnetmod_operate(struct module_qstate *
+                       /* No clients are interested in result or we could
not
+                        * parse it, we don't do client subnet */
+                       sq->ecs_server_out.subnet_validdata =3D 0;
++                      if(edns_opt_list_find(qstate->edns_opts_front_in,
++                              qstate->env->cfg->client_subnet_opcode)) {
++                              /* aggregated this deaggregated state */
++                              qstate->ext_state[id] =3D
++                                      generate_lookup_without_subnet(
++                                      qstate, sq);
++                              return;
++                      }
+                       verbose(VERB_ALGO, "subnetcache: pass to next
module");
+                       qstate->ext_state[id] =3D module_wait_module;
+                       return;
+@@ -859,6 +956,14 @@ subnetmod_operate(struct module_qstate *
+                       }
+                       lock_rw_unlock(&sne->biglock);
+               }
++              if(sq->ecs_client_in.subnet_source_mask =3D=3D 0 &&
++                      edns_opt_list_find(qstate->edns_opts_front_in,
++                              qstate->env->cfg->client_subnet_opcode)) {
++                      /* client asked for resolution without edns subnet
*/
++                      qstate->ext_state[id] =3D
generate_lookup_without_subnet(
++                              qstate, sq);
++                      return;
++              }
+
+               sq->ecs_server_out.subnet_addr_fam =3D
+                       sq->ecs_client_in.subnet_addr_fam;
+@@ -895,6 +1000,8 @@ subnetmod_operate(struct module_qstate *
+               qstate->ext_state[id] =3D module_wait_module;
+               return;
+       }
++      if(sq && sq->wait_subquery)
++              return; /* Wait for that subquery to return */
+       /* Query handed back by next module, we have a 'final' answer */
+       if(sq && event =3D=3D module_event_moddone) {
+               qstate->ext_state[id] =3D eval_response(qstate, id, sq);
+@@ -943,10 +1050,27 @@ subnetmod_clear(struct module_qstate *AT
+ }
+
+ void
+-subnetmod_inform_super(struct module_qstate *ATTR_UNUSED(qstate),
+-      int ATTR_UNUSED(id), struct module_qstate *ATTR_UNUSED(super))
++subnetmod_inform_super(struct module_qstate *qstate, int id,
++      struct module_qstate *super)
+ {
+-      /* Not used */
++      struct subnet_qstate* super_sq =3D
++              (struct subnet_qstate*)super->minfo[id];
++      log_query_info(VERB_ALGO, "subnetcache inform_super: query",
++              &super->qinfo);
++      super_sq->wait_subquery =3D 0;
++      super_sq->wait_subquery_done =3D 1;
++      if(qstate->return_rcode !=3D LDNS_RCODE_NOERROR ||
++              !qstate->return_msg) {
++              super->return_msg =3D NULL;
++              super->return_rcode =3D LDNS_RCODE_SERVFAIL;
++              return;
++      }
++      super->return_rcode =3D LDNS_RCODE_NOERROR;
++      super->return_msg =3D dns_copy_msg(qstate->return_msg, super->regio=
n);
++      if(!super->return_msg) {
++              log_err("subnetcache: copy response, out of memory");
++              super->return_rcode =3D LDNS_RCODE_SERVFAIL;
++      }
+ }
+
+ size_t
+--- a/edns-subnet/subnetmod.h
++++ b/edns-subnet/subnetmod.h
+@@ -102,6 +102,10 @@ struct subnet_qstate {
+       int started_no_cache_store;
+       /** has the subnet module been started with no_cache_lookup? */
+       int started_no_cache_lookup;
++      /** Wait for subquery that has been started for nonsubnet lookup. *=
/
++      int wait_subquery;
++      /** The subquery waited for is done. */
++      int wait_subquery_done;
+ };
+
+ void subnet_data_delete(void* d, void* ATTR_UNUSED(arg));
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 6f54038c6c..6c04ed5840 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D
"file://LICENSE;md5=3D5308494bc0590c0cb036afd781d78f06"

 SRC_URI =3D "git://
github.com/NLnetLabs/unbound.git;protocol=3Dhttps;branch=3Dbranch-1.19.3 \
            file://CVE-2024-8508.patch \
+           file://CVE-2025-5994.patch \
            "
 SRCREV =3D "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"

--=20
2.34.1

--0000000000006270fb06496c41d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ------=
---<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Naman Jain</st=
rong> <span dir=3D"auto">&lt;<a href=3D"mailto:nmjain23@gmail.com">nmjain23=
@gmail.com</a>&gt;</span><br>Date: Tue, 4 Nov, 2025, 3:20=E2=80=AFpm<br>Sub=
ject: [meta][master][PATCH] unbound: Fix CVE-2025-5994<br>To:  &lt;<a href=
=3D"mailto:nmjain23@gmail.com">nmjain23@gmail.com</a>&gt;<br></div><br><br>=
A multi-vendor cache poisoning vulnerability named &#39;Rebirthday Attack&#=
39; has been<br>
discovered in caching resolvers that support EDNS Client Subnet (ECS). Unbo=
und is<br>
also vulnerable when compiled with ECS support, i.e., &#39;--enable-subnet&=
#39;, AND<br>
configured to send ECS information along with queries to upstream name serv=
ers<br>
<br>
CVE: CVE-2025-5994<br>
<br>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D=
"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../unbound/unbound/CVE-2025-5994.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
75 ++++++++++++++++++<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.19.3.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">unbound_1.19.3.bb</a> |=C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 276 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2025-5994.patch<br>
<br>
diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.=
patch b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch=
<br>
new file mode 100644<br>
index 0000000000..b6c0e37e43<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch<b=
r>
@@ -0,0 +1,275 @@<br>
+Backport of:<br>
+<br>
+From 5bf82f246481098a6473f296b21fc1229d276c0f Mon Sep 17 00:00:00 2001<br>
+From: &quot;W.C.A. Wijngaards&quot; &lt;<a href=3D"mailto:wouter@nlnetlabs=
.nl" target=3D"_blank" rel=3D"noreferrer">wouter@nlnetlabs.nl</a>&gt;<br>
+Date: Wed, 16 Jul 2025 10:02:01 +0200<br>
+Subject: [PATCH] - Fix RebirthDay Attack CVE-2025-5994, reported by Xiang =
Li<br>
+ from AOSP=C2=A0 =C2=A0Lab Nankai University.<br>
+<br>
+CVE: CVE-2025-5994<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/NLnetLabs/unbound=
/commit/5bf82f246481098a6473f296b21fc1229d276c0f" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://github.com/NLnetLabs/unbound/commit/5bf82f24=
6481098a6473f296b21fc1229d276c0f</a>]<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt; <br>
+<br>
+---<br>
+ edns-subnet/subnetmod.c | 152 ++++++++++++++++++++++++++++++++++++----<br=
>
+ edns-subnet/subnetmod.h |=C2=A0 =C2=A04 ++<br>
+ 2 files changed, 142 insertions(+), 14 deletions(-)<br>
+<br>
+--- a/edns-subnet/subnetmod.c<br>
++++ b/edns-subnet/subnetmod.c<br>
+@@ -51,6 +51,7 @@<br>
+ #include &quot;services/cache/dns.h&quot;<br>
+ #include &quot;util/module.h&quot;<br>
+ #include &quot;util/regional.h&quot;<br>
++#include &quot;util/fptr_wlist.h&quot;<br>
+ #include &quot;util/storage/slabhash.h&quot;<br>
+ #include &quot;util/config_file.h&quot;<br>
+ #include &quot;util/data/msgreply.h&quot;<br>
+@@ -152,7 +153,8 @@ int ecs_whitelist_check(struct query_inf<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cache by default, might be disabled after pa=
rsing EDNS option<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * received from nameserver. */<br>
+-=C2=A0 =C2=A0 =C2=A0 if(!iter_stub_fwd_no_cache(qstate, &amp;qstate-&gt;q=
info, NULL, NULL)) {<br>
++=C2=A0 =C2=A0 =C2=A0 if(!iter_stub_fwd_no_cache(qstate, &amp;qstate-&gt;q=
info, NULL, NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; sq-&gt;ecs_cl=
ient_in.subnet_validdata) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qstate-&gt;no_cache=
_store =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -504,6 +506,69 @@ common_prefix(uint8_t *a, uint8_t *b, ui<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !memcmp(a, b, n) &amp;&amp; ((net % 8) =
=3D=3D 0 || a[n] =3D=3D b[n]);<br>
+ }<br>
+ <br>
++/**<br>
++ * Create sub request that looks up the query.<br>
++ * @param qstate: query state<br>
++ * @param sq: subnet qstate<br>
++ * @return false on failure.<br>
++ */<br>
++static int<br>
++generate_sub_request(struct module_qstate *qstate, struct subnet_qstate* =
sq)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_qstate* subq =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 uint16_t qflags =3D 0; /* OPCODE QUERY, no flags */<=
br>
++=C2=A0 =C2=A0 =C2=A0 int prime =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 int valrec =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 struct query_info qinf;<br>
++=C2=A0 =C2=A0 =C2=A0 qinf.qname =3D qstate-&gt;qinfo.qname;<br>
++=C2=A0 =C2=A0 =C2=A0 qinf.qname_len =3D qstate-&gt;qinfo.qname_len;<br>
++=C2=A0 =C2=A0 =C2=A0 qinf.qtype =3D qstate-&gt;qinfo.qtype;<br>
++=C2=A0 =C2=A0 =C2=A0 qinf.qclass =3D qstate-&gt;qinfo.qclass;<br>
++=C2=A0 =C2=A0 =C2=A0 qinf.local_alias =3D NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 qflags |=3D BIT_RD;<br>
++=C2=A0 =C2=A0 =C2=A0 if((qstate-&gt;query_flags &amp; BIT_CD)!=3D0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qflags |=3D BIT_CD;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valrec =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 fptr_ok(fptr_whitelist_modenv_attach_sub(qstate-&gt;=
env-&gt;attach_sub));<br>
++=C2=A0 =C2=A0 =C2=A0 if(!(*qstate-&gt;env-&gt;attach_sub)(qstate, &amp;qi=
nf, qflags, prime, valrec,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;subq)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if(subq) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* It is possible to acc=
ess the subquery module state. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sq-&gt;ecs_client_in.=
subnet_source_mask =3D=3D 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 edns_opt_list_find(qstate-&gt;edns_opts_front_in,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;env-&gt;cfg-&gt;client_subnet_op=
code)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 subq-&gt;no_cache_store =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 1;<br>
++}<br>
++<br>
++/**<br>
++ * Perform the query without subnet<br>
++ * @param qstate: query state<br>
++ * @param sq: subnet qstate<br>
++ * @return module state<br>
++ */<br>
++static enum module_ext_state<br>
++generate_lookup_without_subnet(struct module_qstate *qstate,<br>
++=C2=A0 =C2=A0 =C2=A0 struct subnet_qstate* sq)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 verbose(VERB_ALGO, &quot;subnetcache: make subquery =
to look up without subnet&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if(!generate_sub_request(qstate, sq)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verbose(VERB_ALGO, &quot=
;Could not generate sub query&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;return_rcode =
=3D LDNS_RCODE_FORMERR;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;return_msg =
=3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return module_finished;<=
br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 sq-&gt;wait_subquery =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 return module_wait_subquery;<br>
++}<br>
++<br>
+ static enum module_ext_state<br>
+ eval_response(struct module_qstate *qstate, int id, struct subnet_qstate =
*sq)<br>
+ {<br>
+@@ -539,14 +604,7 @@ eval_response(struct module_qstate *qsta<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is still useful =
to put it in the edns subnet cache for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * when a client ex=
plicitly asks for subnet specific answer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0verbose(VERB_QUERY,=
 &quot;subnetcache: Authority indicates no support&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!sq-&gt;started_no_ca=
che_store) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lock_rw_wrlock(&amp;sne-&gt;biglock);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 update_cache(qstate, id);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lock_rw_unlock(&amp;sne-&gt;biglock);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sq-&gt;subnet_downst=
ream)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cp_edns_bad_response(c_out, c_in);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return module_finished;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return generate_lookup_w=
ithout_subnet(qstate, sq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Purposefully there was no sent subnet, and t=
here is consequently<br>
+@@ -571,14 +629,14 @@ eval_response(struct module_qstate *qsta<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!common_prefix(s_ou=
t-&gt;subnet_addr, s_in-&gt;subnet_addr, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s_out-&gt;subnet_source_mask))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we can not accept, re=
start query without option */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we can not accept, pe=
rform query without option */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0verbose(VERB_QUERY,=
 &quot;subnetcache: forged data&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s_out-&gt;subnet_va=
liddata =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)edns_opt_list=
_remove(&amp;qstate-&gt;edns_opts_back_out,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qstate-&gt;env-&gt;cfg-&gt;client_subnet_opcode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sq-&gt;subnet_sent =
=3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sq-&gt;subnet_sent_=
no_subnet =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return module_restart_ne=
xt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return generate_lookup_w=
ithout_subnet(qstate, sq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lock_rw_wrlock(&amp;sne-&gt;biglock);<br>
+@@ -763,6 +821,9 @@ ecs_edns_back_parsed(struct module_qstat<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if(sq-&gt;subnet_sent_no_subnet) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The answer can b=
e stored as scope 0, not in global cache. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qstate-&gt;no_cache=
_store =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if(sq-&gt;subnet_sent) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Need another query to=
 be able to store in global cache. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;no_cache_stor=
e =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+@@ -780,6 +841,32 @@ subnetmod_operate(struct module_qstate *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strmodulevent(event=
));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0log_query_info(VERB_QUERY, &quot;subnetcache op=
erate: query&quot;, &amp;qstate-&gt;qinfo);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if(sq &amp;&amp; sq-&gt;wait_subquery_done) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The subquery lookup r=
eturned. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sq-&gt;ecs_client_in.=
subnet_source_mask =3D=3D 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 edns_opt_list_find(qstate-&gt;edns_opts_front_in,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;env-&gt;cfg-&gt;client_subnet_op=
code)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if(!sq-&gt;started_no_cache_store &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;return_msg) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock_rw_wrlock(&amp;sne-&gt;biglock);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_cache(qstate, id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock_rw_unlock(&amp;sne-&gt;biglock);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (sq-&gt;subnet_downstream)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp_edns_bad_response(&amp;sq-&gt;ecs_client=
_out,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sq-&gt;ecs=
_client_in);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* It is a scope zero lookup, append edns subnet<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* option to the querier. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 subnet_ecs_opt_list_append(&amp;sq-&gt;ecs_client_out,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;qstate-&gt;edns_opts_front_out, qstate=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;region);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sq-&gt;wait_subquery_don=
e =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;ext_state[id]=
 =3D module_finished;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;no_cache_stor=
e =3D sq-&gt;started_no_cache_store;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;no_cache_look=
up =3D sq-&gt;started_no_cache_lookup;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if((event =3D=3D module_event_new || event =3D=
=3D module_event_pass) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sq =3D=3D NULL) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct edns_option*=
 ecs_opt;<br>
+@@ -790,6 +877,8 @@ subnetmod_operate(struct module_qstate *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sq =3D (struct subn=
et_qstate*)qstate-&gt;minfo[id];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sq-&gt;wait_subquery)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return; /* Wait for that subquery to return */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if((ecs_opt =3D edn=
s_opt_list_find(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qstate-&gt;edns_opts_front_in,<br>
+@@ -819,6 +908,14 @@ subnetmod_operate(struct module_qstate *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* No clients are interested in result or we could not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * parse it, we don&#39;t do client subnet */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sq-&gt;ecs_server_out.subnet_validdata =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if(edns_opt_list_find(qstate-&gt;edns_opts_front_in,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;env-&gt;cfg-&gt;client_subnet_op=
code)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* aggregated this deaggregated state */<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;ext_state[id] =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 generate_lookup=
_without_subnet(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate, sq);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0verbose(VERB_ALGO, &quot;subnetcache: pass to next module&quot;);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qstate-&gt;ext_state[id] =3D module_wait_module;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+@@ -859,6 +956,14 @@ subnetmod_operate(struct module_qstate *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lock_rw_unlock(&amp;sne-&gt;biglock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(sq-&gt;ecs_client_in.=
subnet_source_mask =3D=3D 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 edns_opt_list_find(qstate-&gt;edns_opts_front_in,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate-&gt;env-&gt;cfg-&gt;client_subnet_op=
code)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* client asked for resolution without edns subnet */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 qstate-&gt;ext_state[id] =3D generate_lookup_without_subnet(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qstate, sq);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sq-&gt;ecs_server_o=
ut.subnet_addr_fam =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sq-&gt;ecs_client_in.subnet_addr_fam;<br>
+@@ -895,6 +1000,8 @@ subnetmod_operate(struct module_qstate *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qstate-&gt;ext_stat=
e[id] =3D module_wait_module;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 if(sq &amp;&amp; sq-&gt;wait_subquery)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return; /* Wait for that=
 subquery to return */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Query handed back by next module, we have a =
&#39;final&#39; answer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(sq &amp;&amp; event =3D=3D module_event_modd=
one) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qstate-&gt;ext_stat=
e[id] =3D eval_response(qstate, id, sq);<br>
+@@ -943,10 +1050,27 @@ subnetmod_clear(struct module_qstate *AT<br>
+ }<br>
+ <br>
+ void<br>
+-subnetmod_inform_super(struct module_qstate *ATTR_UNUSED(qstate),<br>
+-=C2=A0 =C2=A0 =C2=A0 int ATTR_UNUSED(id), struct module_qstate *ATTR_UNUS=
ED(super))<br>
++subnetmod_inform_super(struct module_qstate *qstate, int id,<br>
++=C2=A0 =C2=A0 =C2=A0 struct module_qstate *super)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Not used */<br>
++=C2=A0 =C2=A0 =C2=A0 struct subnet_qstate* super_sq =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct subnet_qstate*)s=
uper-&gt;minfo[id];<br>
++=C2=A0 =C2=A0 =C2=A0 log_query_info(VERB_ALGO, &quot;subnetcache inform_s=
uper: query&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;super-&gt;qinfo);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 super_sq-&gt;wait_subquery =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 super_sq-&gt;wait_subquery_done =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 if(qstate-&gt;return_rcode !=3D LDNS_RCODE_NOERROR |=
|<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !qstate-&gt;return_msg) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super-&gt;return_msg =3D=
 NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super-&gt;return_rcode =
=3D LDNS_RCODE_SERVFAIL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 super-&gt;return_rcode =3D LDNS_RCODE_NOERROR;<br>
++=C2=A0 =C2=A0 =C2=A0 super-&gt;return_msg =3D dns_copy_msg(qstate-&gt;ret=
urn_msg, super-&gt;region);<br>
++=C2=A0 =C2=A0 =C2=A0 if(!super-&gt;return_msg) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_err(&quot;subnetcach=
e: copy response, out of memory&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super-&gt;return_rcode =
=3D LDNS_RCODE_SERVFAIL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+ <br>
+ size_t<br>
+--- a/edns-subnet/subnetmod.h<br>
++++ b/edns-subnet/subnetmod.h<br>
+@@ -102,6 +102,10 @@ struct subnet_qstate {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int started_no_cache_store;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** has the subnet module been started with no_=
cache_lookup? */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int started_no_cache_lookup;<br>
++=C2=A0 =C2=A0 =C2=A0 /** Wait for subquery that has been started for nons=
ubnet lookup. */<br>
++=C2=A0 =C2=A0 =C2=A0 int wait_subquery;<br>
++=C2=A0 =C2=A0 =C2=A0 /** The subquery waited for is done. */<br>
++=C2=A0 =C2=A0 =C2=A0 int wait_subquery_done;<br>
+ };<br>
+ <br>
+ void subnet_data_delete(void* d, void* ATTR_UNUSED(arg));<br>
diff --git a/meta-networking/recipes-support/unbound/<a href=3D"http://unbo=
und_1.19.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_1.19=
.3.bb</a> b/meta-networking/recipes-support/unbound/<a href=3D"http://unbou=
nd_1.19.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_1.19.=
3.bb</a><br>
index 6f54038c6c..6c04ed5840 100644<br>
--- a/meta-networking/recipes-support/unbound/<a href=3D"http://unbound_1.1=
9.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_1.19.3.bb</=
a><br>
+++ b/meta-networking/recipes-support/unbound/<a href=3D"http://unbound_1.1=
9.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_1.19.3.bb</=
a><br>
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5308494bc=
0590c0cb036afd781d78f06&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/NLnetLabs/unboun=
d.git;protocol=3Dhttps;branch=3Dbranch-1.19.3" rel=3D"noreferrer noreferrer=
" target=3D"_blank">github.com/NLnetLabs/unbound.git;protocol=3Dhttps;branc=
h=3Dbranch-1.19.3</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-8508.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-5994.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
</div>

--0000000000006270fb06496c41d1--

