Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD561C88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:47 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27853.1789081842624382022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NAkYBGjt;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so2690545ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081842; x=1789686642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZTxIUCN+lhsQOWyWTwMQnrMZicP2JWIdDFg/HeoRiE=;
        b=NAkYBGjt6z+fsttRS0adBcNyTuQX6EYWDO245Fq3MXTpNz9tE+SMsnw2sdxeDgT/BR
         I5Lf1dtvdaEImaNjqVnAIq3xI6pZPa0l6L8EH9bpH8WrXUzS5a6Vhn9uLr/jofW7M2gu
         joGXBc/3XPd1iRLUGH8jtcyKjWrg6jFsK1MofYVN16YXCq72ujhYEbrjBeVbDYwKQdiO
         9Zs7ZWVc0v22MPmmhirn+j96zaQMS/MQuglePFBan3pXRJgZCHxAxjlDcjglR7NoqBKM
         0IY+70QXxNcFyMV2xVeiSdwvcUVy5ItM2j6s3Ea3cWKsFesYjKHuPa2NQKmmiMZPyFvy
         3aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081842; x=1789686642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZTxIUCN+lhsQOWyWTwMQnrMZicP2JWIdDFg/HeoRiE=;
        b=qgBbisz7uP0Opca4WIM02Xeldpa0daKRGK7McxIIFLbxNV9jsg2xyQe26+D31LdDpn
         nB9UfjLEr9Qp0zbtnkYrP0nKeSs9Dh4QsAVhsCb6thsf8eTdOVJc0GVYs2R+1gWCDa9B
         8meJg0U0cNA1EHby0cafjs6O2/vMtCvsf4hhzWvLM7XGFnNcshqiI6Y5t2DaNWj92nGJ
         y9q5qK8EH8lQcjvT5OP9Go8jRlVZIkbqCQp0M69b0xt4mYb6dU3kdA8G/VnndqX+3pih
         6Djor33tzTcVokwTfdKnX0V7gmh+MZQYuu67LWVPWRHevwKShtkyyWfWHguDUHROsDcf
         bacg==
X-Gm-Message-State: AFuF++n3JMZwXVg/pkUvCkx5gFqhI3jH/oMd7WIt5UKICMmr6hNIMDuC
	n8GyvSVGhYe4nKu7Mm4NAFerFdVyBvl4Un4QJP0Jzt5hqiUWCIx7T+Se2+M4Yw==
X-Gm-Gg: AYBFou2lJo1quo2PzhIfEYUwvKs7Hem7se3j+mjD6WV0k+/1+6KgW+jhMJq2lc6164J
	NjXGn1rPY/KF7OsglosBy/uWDA+9HuSWPvhXgR9arzT+wCV4F1l1JNI6+W5FI1J7gcSEH8EJ/J6
	NAAlJ6JxCKrGeb0YMa6KUBfhbLRjvifiDC6dlBW0i/CBUxe8z0Uknd6K95De8vRlBALWQjwgp8h
	nrw9APBM0RRqq/xCQgeWTmXguLhRR1LY/rNKhUoZdp2eBWjWcKATZTkNKsMC58jaHCP6HpJiH3t
	g1YucX5bat/T6EEF1Dxu5qA7l/aU6ZfhNdq7Hpjl4rXRQ6sQAYXBoVr53nq4SbIv5dXR/s5O6CQ
	KotIJX9iXtwxYZyi3Km67YxG+w1RWctqCf5gp/euYZpufniF7e3aPxyeIo99aSbxvFH8VWKtIMH
	tyq/SkBhjbfwUFz9tUCdkO4nQVO/8Y05cEtSZnptV0+6mv13iABJZYRpffBYtFJwJKuHU6B2+km
	m4Cq1tcdusKuT/ly6vCoR8=
X-Received: by 2002:a17:90b:274b:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39d9bc6767cmr1770621a91.4.1789081841964;
        Thu, 10 Sep 2026 16:10:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 21/32] unbound: patch CVE-2026-50248
Date: Fri, 11 Sep 2026 11:09:20 +1200
Message-ID: <20260910230932.173913-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129939

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50248

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-50248.patch      | 77 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50248.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-50248.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50248.patch
new file mode 100644
index 0000000000..04a63d4f48
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50248.patch
@@ -0,0 +1,77 @@
+From ad27c1762cd00df8b808925ab240fc4c0766c228 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:14:35 +0200
+Subject: [PATCH] - Fix CVE-2026-50248, BOGUS configured primary hostname
+ accepted for   XFR in auth/rpz zones. Thanks to Qifan Zhang, Palo Alto
+ Networks,   for the report.
+
+(cherry picked from commit 3530c81e29e64ed19c612ae3dea21c8800d882e1)
+
+CVE: CVE-2026-50248
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/3530c81e29e64ed19c612ae3dea21c8800d882e1]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/authzone.c | 28 ++++++++++++++++++++++------
+ 1 file changed, 22 insertions(+), 6 deletions(-)
+
+diff --git a/services/authzone.c b/services/authzone.c
+index 60ccc8698..357c1c590 100644
+--- a/services/authzone.c
++++ b/services/authzone.c
+@@ -5693,8 +5693,7 @@ xfr_master_add_addrs(struct auth_master* m, struct ub_packed_rrset_key* rrset,
+ 
+ /** callback for task_transfer lookup of host name, of A or AAAA */
+ void auth_xfer_transfer_lookup_callback(void* arg, int rcode, sldns_buffer* buf,
+-	enum sec_status ATTR_UNUSED(sec), char* ATTR_UNUSED(why_bogus),
+-	int ATTR_UNUSED(was_ratelimited))
++	enum sec_status sec, char* why_bogus, int ATTR_UNUSED(was_ratelimited))
+ {
+ 	struct auth_xfer* xfr = (struct auth_xfer*)arg;
+ 	struct module_env* env;
+@@ -5707,7 +5706,16 @@ void auth_xfer_transfer_lookup_callback(void* arg, int rcode, sldns_buffer* buf,
+ 	}
+ 
+ 	/* process result */
+-	if(rcode == LDNS_RCODE_NOERROR) {
++	if(sec == sec_status_bogus || sec == sec_status_secure_sentinel_fail) {
++		if(verbosity >= VERB_OPS) {
++			char zname[LDNS_MAX_DOMAINLEN];
++			dname_str(xfr->name, zname);
++			verbose(VERB_OPS, "auth zone %s: primary %s address lookup is DNSSEC bogus: %s",
++				zname, xfr->task_transfer->lookup_target->host,
++				(why_bogus?why_bogus:""));
++		}
++		/* fall through to next-lookup / next-master */
++	} else if(rcode == LDNS_RCODE_NOERROR) {
+ 		uint16_t wanted_qtype = LDNS_RR_TYPE_A;
+ 		struct regional* temp = env->scratch;
+ 		struct query_info rq;
+@@ -6756,8 +6764,7 @@ xfr_probe_send_or_end(struct auth_xfer* xfr, struct module_env* env)
+ 
+ /** callback for task_probe lookup of host name, of A or AAAA */
+ void auth_xfer_probe_lookup_callback(void* arg, int rcode, sldns_buffer* buf,
+-	enum sec_status ATTR_UNUSED(sec), char* ATTR_UNUSED(why_bogus),
+-	int ATTR_UNUSED(was_ratelimited))
++	enum sec_status sec, char* why_bogus, int ATTR_UNUSED(was_ratelimited))
+ {
+ 	struct auth_xfer* xfr = (struct auth_xfer*)arg;
+ 	struct module_env* env;
+@@ -6770,7 +6777,16 @@ void auth_xfer_probe_lookup_callback(void* arg, int rcode, sldns_buffer* buf,
+ 	}
+ 
+ 	/* process result */
+-	if(rcode == LDNS_RCODE_NOERROR) {
++	if(sec == sec_status_bogus || sec == sec_status_secure_sentinel_fail) {
++		if(verbosity >= VERB_OPS) {
++			char zname[LDNS_MAX_DOMAINLEN];
++			dname_str(xfr->name, zname);
++			verbose(VERB_OPS, "auth zone %s: primary %s address probe lookup is DNSSEC bogus: %s",
++				zname, xfr->task_transfer->lookup_target->host,
++				(why_bogus?why_bogus:""));
++		}
++		/* fall through to next-lookup / next-master */
++	} else if(rcode == LDNS_RCODE_NOERROR) {
+ 		uint16_t wanted_qtype = LDNS_RR_TYPE_A;
+ 		struct regional* temp = env->scratch;
+ 		struct query_info rq;
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 68d81fc551..b6b6ecef33 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-50045.patch \
            file://CVE-2026-50046.patch \
            file://CVE-2026-50243.patch \
+           file://CVE-2026-50248.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

