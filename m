Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BD8C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:11:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27860.1789081859310553655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XGnHM+GH;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398e9698a70so339210a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081859; x=1789686659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfKIElfFsZhBLTrJZ6w2QI4ahE39JaOWrIBVGSHA7A4=;
        b=XGnHM+GHozonvVvrbUcoDMMTMd+eaC2hwX0Yb08/0Q/SQjAztAgiPwyzencD9APg6l
         TvbfEKCuF1wBFZhh0WU0tSY0BncTEEPUYRDKz6V4r5BQ6A8vl60V1m1u3wikBECvky4H
         S1m7pd4JVB49Inbu12c3ADheMKf+dLbouOOKscfwKDe/bBs81ZREnFkCRucxMJDZJKRp
         sAVIakxuV83Wwhcn63YY8C3/KE9bTgGw2brwg2MZdA/5zqLREoOusjYm7yjDnW6Z1C0D
         mY1w3+qqUEzbRDJ2x/QBppKpnTyOk/8msc4sXHZU5UI0nNOqQuxStifDJ3eJhUFWq39H
         OdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081859; x=1789686659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfKIElfFsZhBLTrJZ6w2QI4ahE39JaOWrIBVGSHA7A4=;
        b=D4JYowcA4kqTuB1ER+Cray0INfaxr9xqyaZy1xBLJZHMoDdVaa/dprhRY+A5a5EPz4
         Ie5lOUMW570atktIbuUINvRVyakOZUHw8w5LxQpYD0EZq7zdXbNmPU7BLgXhV8n0mGLj
         H2jeAIgUQlQccL367jYxr2ge0ZGmSzXtw72SJRwHMGshORhz+O7dMNPMJQIcgdlArFJR
         7J4VcqwPyuRNCK5eKYwxaVUlp+JeUbXt5kD4GTIK7XMfau8cwDchMXevGIwygJSr5Z8w
         2Y2cviWAinqsFTX9+oV/DpI/VLUy+YpQgmx0ZZmoSLSOtXraI6zDb34+WBWC3vUbwfKs
         fXGA==
X-Gm-Message-State: AFuF++lv0JbEwhGStaO9PiC5+V3L2chjHg/cmF3EEu3noctKjyOGoLAK
	kgybBTiDVOsZieJFkI+N2dYsezGN6iHeoTf8/asWoCC6FPZRsS8O36IUqNWu/Q==
X-Gm-Gg: AYBFou0M1BOwQzLui5apegwUyaKEnFlCLjYy6NHl+7PMlCaEmkI8ZykVujL0hmXv2bB
	iWqUndDdO+ciBjIqJ6ZrTvjpf6WRXs4zMHaURq4tFfqjKfCqprDLhZlOiZash9pgUny28Xr3v5q
	XOT/vEcSy9GmB2Tte/8QVM48r9td2D+luyRPUtXnYccacct4zlb1U+S8t0kJK2Jx66WLsD8N0ey
	AnvgKPJ/XEkjDiyxP66YiZ5Q5mEFwcV6POYYAFjDTlHfZIRBS74hKUW/R1VhpwBFDaMSNyevLlt
	oOViPoRNCTfoZxWMICUf+8hUD0qQBWKQeXLDU35lJRof9sJuErAhq2xyHSYd+miEKtPVcDId8fb
	UvFxYQE3M6s5cPuJPCO1XNCSl1jBMGyiZ61zrykvaPNP2VTbMhTVHNNcoqghOfM3D+hd5G83odD
	Y63geQcn57BD1+1/xRgEitRFlDGvU7gz40zgzuCj0pp1uQS7/zmb+GqMffLyojVzREjnMbf5OJA
	QtvP3ks8sbN6ok6+xYEFI1wJnQcXhlLLQ==
X-Received: by 2002:a17:90a:d64c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39d9c1d260amr1591719a91.13.1789081858508;
        Thu, 10 Sep 2026 16:10:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 27/32] unbound: patch CVE-2026-55717
Date: Fri, 11 Sep 2026 11:09:26 +1200
Message-ID: <20260910230932.173913-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129945

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55717

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-55717.patch      | 90 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55717.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-55717.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55717.patch
new file mode 100644
index 0000000000..fcb223029d
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55717.patch
@@ -0,0 +1,90 @@
+From ff034061b24642e15340b0696e5c9a0aa8410fab Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:17:32 +0200
+Subject: [PATCH] - Fix CVE-2026-55717, 'serve-expired-client-timeout' and
+ 'response-ip'   CNAME redirect could lead to a crash. Thanks to Qifan Zhang,
+ Palo   Alto Networks, for the report. In addition, thanks to Xin Wang,  
+ Jiapeng Li, and Jiajia Liu, Northwestern Polytechnical University,   for also
+ reporting this issue.
+
+(cherry picked from commit 2ce2ca36912644d2dbf97249a41494a9e2500fc3)
+
+CVE: CVE-2026-55717
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/2ce2ca36912644d2dbf97249a41494a9e2500fc3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/localzone.h     |  2 +-
+ services/mesh.c          | 15 ++++++++++-----
+ util/data/packed_rrset.c |  1 +
+ 3 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/services/localzone.h b/services/localzone.h
+index 66102fd98..9ec57e2a1 100644
+--- a/services/localzone.h
++++ b/services/localzone.h
+@@ -565,7 +565,7 @@ enum respip_action {
+ 	respip_always_nxdomain = local_zone_always_nxdomain,
+         /** answer with nodata response */
+ 	respip_always_nodata = local_zone_always_nodata,
+-        /** answer with nodata response */
++        /** drop query */
+ 	respip_always_deny = local_zone_always_deny,
+ 	/** RPZ: truncate answer in order to force switch to tcp */
+ 	respip_truncate = local_zone_truncate,
+diff --git a/services/mesh.c b/services/mesh.c
+index 6a04bc838..191b1d488 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -2391,9 +2391,10 @@ apply_respip_action(struct module_qstate* qstate,
+ 
+ 	/* xxx_deny actions mean dropping the reply, unless the original reply
+ 	 * was redirected to response-ip data. */
+-	if((actinfo->action == respip_deny ||
++	if(actinfo->action == respip_always_deny ||
++		((actinfo->action == respip_deny ||
+ 		actinfo->action == respip_inform_deny) &&
+-		*encode_repp == rep)
++		*encode_repp == rep))
+ 		*encode_repp = NULL;
+ 
+ 	return 1;
+@@ -2458,12 +2459,15 @@ mesh_serve_expired_callback(void* arg)
+ 			qstate->client_info, &actinfo, msg->rep, &alias_rrset, &encode_rep,
+ 			qstate->env->auth_zones)) {
+ 			return;
+-		} else if(partial_rep &&
+-			!respip_merge_cname(partial_rep, &qstate->qinfo, msg->rep,
++		} else if(partial_rep) {
++			if(!respip_merge_cname(partial_rep, &qstate->qinfo, msg->rep,
+ 			qstate->client_info, must_validate, &encode_rep, qstate->region,
+ 			qstate->env->auth_zones, qstate->env->views,
+ 			qstate->env->respip_set)) {
+-			return;
++				return;
++			}
++			/* merge succeeded; final reply, no further alias pass */
++			partial_rep = NULL;
+ 		}
+ 		if(!encode_rep || alias_rrset) {
+ 			if(!encode_rep) {
+@@ -2474,6 +2478,7 @@ mesh_serve_expired_callback(void* arg)
+ 				partial_rep = encode_rep;
+ 			}
+ 		}
++		msg->rep = encode_rep;
+ 		/* We've found a partial reply ending with an
+ 		* alias.  Replace the lookup qinfo for the
+ 		* alias target and lookup the cache again to
+diff --git a/util/data/packed_rrset.c b/util/data/packed_rrset.c
+index d18486cc5..720c56ac3 100644
+--- a/util/data/packed_rrset.c
++++ b/util/data/packed_rrset.c
+@@ -198,6 +198,7 @@ get_cname_target(struct ub_packed_rrset_key* rrset, uint8_t** dname,
+ {
+ 	struct packed_rrset_data* d;
+ 	size_t len;
++	if(!rrset) return;
+ 	if(ntohs(rrset->rk.type) != LDNS_RR_TYPE_CNAME && 
+ 		ntohs(rrset->rk.type) != LDNS_RR_TYPE_DNAME)
+ 		return;
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index a04080c751..0af51973cd 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-52863.patch \
            file://CVE-2026-54478.patch \
            file://CVE-2026-55708.patch \
+           file://CVE-2026-55717.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

