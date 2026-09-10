Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B60C88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:27 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27844.1789081821023226794
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QE6k0QdJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39682983a0fso329939a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081820; x=1789686620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2CZ4HPs52l9WPIkZPxtZjrAvihirNH6WSSxp7P7lOY=;
        b=QE6k0QdJBJmWtn7XuHjMoqB1Y4V6Med5QeFP+beajVxkLJRvEMaaSjFgRoxbDLZkyH
         WtrEUmWFdUwaYH4jnIyO/TQp7tvdZAVtIrrtGn6oQKA8UKFBuvRXq6egADzGVXcslDav
         R+fpm7TypDDUml760UavzAUZ83k9bU7bAvJinDQDDN6HyD7BqAuHE/UT4NS5fWcbi3br
         t/zAyHITAnzqadl709CpKvAB7xL/YtxUxA+0oaYMQ0fq7HOAe/GYEwhXM8sWYEHW4Gex
         kPKjYx4I4YFOLNG5xaY+BW8HrDyMxIMY88S/5k7Aqz6I9+e0PyyzhPKhtGvuLCG5+a0V
         utoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081820; x=1789686620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2CZ4HPs52l9WPIkZPxtZjrAvihirNH6WSSxp7P7lOY=;
        b=Vc3bR266ewWwoFA1s8I3mPE1SbdgaaCkYWR+KSilDYG0Qq8S2FhSgrxto5fVMkxYHp
         qm1TJAL0iRWkkn8lj5/+rbt+NDWT/q//tiRM4YEe2dVdGkFMj7o6fjJ0eTo2NXoI/T80
         hskydl8pfHdrF7YxMrIBcq/3L2Rf6RDpU2gmD7XFZMzR2iNUAwS/YuvOrVkWi10Zpj9a
         n6Dza+E8AhC5bYB238K3+czzEg77oI/jzTahBSWGbFEfmrgU1rG804AxzHt9gJx68ANc
         MyJHp6K3nJbm4+S9vJVBTvkotT7Ih/zyDDG+jC8YT6Mec61UjpsM8uG96ki0FIe4/DpN
         n7ZQ==
X-Gm-Message-State: AFuF++kY9FI3jdHiYS/YFN4OMTuaWzJMUxTln0oX4Q8xyuPzaaosZnAN
	41kNWAU1ARm529ufwPgS2d8qFfR5YiFObhLSWPkrtegFJgaLnm37GJqh7l1koA==
X-Gm-Gg: AYBFou1x8Tlj/s3iGxMc3v/CkQcjDTD3ElI18uAitYZFwLiEaottV69/Pr9QuNq031c
	E1OQKMUbPcdS+XOkJmbwLGRgJoG01EFmgiSe7aVCmxCk23TljWc3boPGDXiHmkKwmEi12yC/JQn
	3vGGtjglsLnJBNb9Mk6GYv5D2yKNLonbWRR1slIDPAYQuC5tsncnoI+BXjZWcZUmNmfuw+UIgo4
	7fDrO24S889ep0nM/EAK4a4//JXhoZ/K5RmzHpB6lIxpHVBMKVLD4W0n50dK/rJAn7Fk9rRLLdF
	xRN/I/2SFC9qmbAaFI9Lyv4toijrT5N6j4kJ6iy/0/OJ5UMIiUe73pJUiAzSTk59QDcuZRLdqEN
	dlVWU+gurzhDfWoZSx6s/zivcQpbK68qNGOq6uCdBOtjE7uJSSngheWkPoAfP7B8FuIizfwz7Jh
	bpbWOT87Qy/uFbrEVxbnQJmp7d1uj6FZhOrc7dczWkP64KR8eDVbnEeArZWXBbJ4YK8Kp73dox6
	uUfdvN9GIMEqTqdNb38aq5oBEtXWWYVPQ==
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39d9c2276fdmr1973159a91.19.1789081820377;
        Thu, 10 Sep 2026 16:10:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 13/32] unbound: patch CVE-2026-46582
Date: Fri, 11 Sep 2026 11:09:12 +1200
Message-ID: <20260910230932.173913-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129931

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-46582

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-46582.patch      | 151 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-46582.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-46582.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-46582.patch
new file mode 100644
index 0000000000..2091e1622a
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-46582.patch
@@ -0,0 +1,151 @@
+From 97245ce2852162fbf19cc23b016ee73fe2aec63c Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:07:52 +0200
+Subject: [PATCH] - Fix CVE-2026-46582, A wildcard replay, as another piece of
+ data,   triggers poisoning in the serve expired reply path. Thanks to   Qifan
+ Zhang, Palo Alto Networks, for the report.
+
+(cherry picked from commit fea0ff550bb6193417c9b17ffff409eb6736f90d)
+
+CVE: CVE-2026-46582
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/fea0ff550bb6193417c9b17ffff409eb6736f90d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ validator/val_utils.c | 15 ++++++++++++---
+ validator/validator.c | 31 ++++++++++++++++++++++++++++++-
+ 2 files changed, 42 insertions(+), 4 deletions(-)
+
+diff --git a/validator/val_utils.c b/validator/val_utils.c
+index 4495695ac..87c5a034a 100644
+--- a/validator/val_utils.c
++++ b/validator/val_utils.c
+@@ -439,10 +439,15 @@ val_verify_rrset(struct module_env* env, struct val_env* ve,
+ 	 * only improves security status 
+ 	 * and bogus is set only once, even if we rechecked the status */
+ 	if(sec > d->security) {
++		int wc_expanded = 0;
+ 		d->security = sec;
+-		if(sec == sec_status_secure)
++		if(sec == sec_status_secure) {
++			uint8_t* wc = NULL;
++			size_t wclen = 0;
+ 			d->trust = rrset_trust_validated;
+-		else if(sec == sec_status_bogus) {
++			if(val_rrset_wildcard(rrset, &wc, &wclen) && wc)
++				wc_expanded = 1;
++		} else if(sec == sec_status_bogus) {
+ 			size_t i;
+ 			/* update ttl for rrset to fixed value. */
+ 			d->ttl = ve->bogus_ttl;
+@@ -455,7 +460,11 @@ val_verify_rrset(struct module_env* env, struct val_env* ve,
+ 			lock_basic_unlock(&ve->bogus_lock);
+ 		}
+ 		/* if status updated - store in cache for reuse */
+-		rrset_update_sec_status(env->rrset_cache, rrset, *env->now);
++		/* For a wildcard rrset, that is secure, do not store this
++		 * into the cache, because it changes proofs around the
++		 * item. */
++		if(!wc_expanded)
++			rrset_update_sec_status(env->rrset_cache, rrset, *env->now);
+ 	}
+ 
+ 	return sec;
+diff --git a/validator/validator.c b/validator/validator.c
+index 5817fc808..68c4bf643 100644
+--- a/validator/validator.c
++++ b/validator/validator.c
+@@ -1013,6 +1013,9 @@ validate_positive_response(struct module_env* env, struct val_env* ve,
+ 	size_t wl;
+ 	int wc_cached = 0;
+ 	int wc_NSEC_ok = 0;
++	/* This is used to update the RRset cache, with the combination
++	 * of the dname expansion and this wildcard, for security status. */
++	struct ub_packed_rrset_key* wc_rrset = NULL;
+ 	int nsec3s_seen = 0;
+ 	size_t i;
+ 	struct ub_packed_rrset_key* s;
+@@ -1031,6 +1034,9 @@ validate_positive_response(struct module_env* env, struct val_env* ve,
+ 				ntohs(s->rk.type), ntohs(s->rk.rrset_class));
+ 			chase_reply->security = sec_status_bogus;
+ 			update_reason_bogus(chase_reply, LDNS_EDE_DNSSEC_BOGUS);
++			if(wc_rrset)
++				((struct packed_rrset_data*)wc_rrset->
++				entry.data)->security = sec_status_bogus;
+ 			return;
+ 		}
+ 		if(wc && !wc_cached && env->cfg->aggressive_nsec) {
+@@ -1038,7 +1044,7 @@ validate_positive_response(struct module_env* env, struct val_env* ve,
+ 				env->alloc, *env->now);
+ 			wc_cached = 1;
+ 		}
+-
++		if(wc) wc_rrset = s;
+ 	}
+ 
+ 	/* validate the AUTHORITY section as well - this will generally be 
+@@ -1095,6 +1101,9 @@ validate_positive_response(struct module_env* env, struct val_env* ve,
+ 			"did not exist");
+ 		chase_reply->security = sec_status_bogus;
+ 		update_reason_bogus(chase_reply, LDNS_EDE_DNSSEC_BOGUS);
++		if(wc_rrset)
++			((struct packed_rrset_data*)wc_rrset->
++			entry.data)->security = sec_status_bogus;
+ 		return;
+ 	}
+ 
+@@ -1496,6 +1505,16 @@ validate_any_response(struct module_env* env, struct val_env* ve,
+ 			"did not exist");
+ 		chase_reply->security = sec_status_bogus;
+ 		update_reason_bogus(chase_reply, LDNS_EDE_DNSSEC_BOGUS);
++		/* Make the expanded name and wildcard RRSIG rrsets bogus */
++		for(i=0; i<chase_reply->an_numrrsets; i++) {
++			uint8_t* cwc = NULL;
++			size_t cwl = 0;
++			s = chase_reply->rrsets[i];
++			if(val_rrset_wildcard(s, &cwc, &cwl) && cwc) {
++				((struct packed_rrset_data*)s->
++				entry.data)->security = sec_status_bogus;
++			}
++		}
+ 		return;
+ 	}
+ 
+@@ -1533,6 +1552,9 @@ validate_cname_response(struct module_env* env, struct val_env* ve,
+ 	uint8_t* wc = NULL;
+ 	size_t wl;
+ 	int wc_NSEC_ok = 0;
++	/* This is used to update the RRset cache, with the combination
++	 * of the dname expansion and this wildcard, for security status. */
++	struct ub_packed_rrset_key* wc_rrset = NULL;
+ 	int nsec3s_seen = 0;
+ 	size_t i;
+ 	struct ub_packed_rrset_key* s;
+@@ -1553,6 +1575,7 @@ validate_cname_response(struct module_env* env, struct val_env* ve,
+ 			update_reason_bogus(chase_reply, LDNS_EDE_DNSSEC_BOGUS);
+ 			return;
+ 		}
++		if(wc) wc_rrset = s;
+ 		
+ 		/* Refuse wildcarded DNAMEs rfc 4597. 
+ 		 * Do not follow a wildcarded DNAME because 
+@@ -1564,6 +1587,9 @@ validate_cname_response(struct module_env* env, struct val_env* ve,
+ 				ntohs(s->rk.type), ntohs(s->rk.rrset_class));
+ 			chase_reply->security = sec_status_bogus;
+ 			update_reason_bogus(chase_reply, LDNS_EDE_DNSSEC_BOGUS);
++			if(wc_rrset)
++				((struct packed_rrset_data*)wc_rrset->
++				entry.data)->security = sec_status_bogus;
+ 			return;
+ 		}
+ 
+@@ -1628,6 +1654,9 @@ validate_cname_response(struct module_env* env, struct val_env* ve,
+ 			"did not exist");
+ 		chase_reply->security = sec_status_bogus;
+ 		update_reason_bogus(chase_reply, LDNS_EDE_DNSSEC_BOGUS);
++		if(wc_rrset)
++			((struct packed_rrset_data*)wc_rrset->
++			entry.data)->security = sec_status_bogus;
+ 		return;
+ 	}
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 8bd8732fe4..bf17c30572 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42960.patch \
            file://CVE-2026-44390.patch \
            file://CVE-2026-44608.patch \
+           file://CVE-2026-46582.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

