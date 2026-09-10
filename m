Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464E3C88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:27 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27842.1789081818168625181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j3LU8WCo;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so321530a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081817; x=1789686617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwV3ZagqPFoz/csPdas3ECH7LV6DAHYVZl4g/DpyLOI=;
        b=j3LU8WCo45/5vHDLi6LFsCO7HTaUcqXEMHmPJAEOc5QMV7+p/HejwscgGEr5zUPuwy
         XSbco0C9pqH8pBXzNDxzCnx1dz8Bf/iDSGhvmXgWPxxi07fikR+hiHY3NLA22H43zi3z
         BV4iXUXYZBr4q1tbOa1rs5IEECXo4XSS506cC6uFfLSoE8MHM0PkWjLA2qOG0FuSaNgK
         gnuLl2lmr3Pl6OgxFSqN3oCOhw1HBxEZxVOne1+xDe6JI0NwZ/1ouswsboVPzpKq84tq
         beZp1Hb/at73j8d9TOUxyKh81OCX8X37DtBdVEQjK+Y3T0Z3hVEIxGMDa7iqGXHB7H5C
         XdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081817; x=1789686617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwV3ZagqPFoz/csPdas3ECH7LV6DAHYVZl4g/DpyLOI=;
        b=B+5PjmjXAWRIpgnE9G0GxbcGl9bv1XXYygIm15klH3CzBYXPmpAMEj0xiNHwiF+l4L
         rqnOK7sPrLsLvEL9XwBSdjHVUb87QdVL/keXUtt0ehiPmWelSJPu6K6vJJVB3LNonf5O
         vV3pgTextm0phQb1gSxTCsHnxxwxFVu/V9p5ib8Pdx7blOHS0Y02DBkPqTb08za33TYr
         r7LVJ8yB2tfi1tElpkQy/X2D3ENhyImulMTrQV4KPeq+/lzAV9t8A7ltI7dT2ZALL1hF
         SO7RrVIpp0gDOOzQuYwjDCgDoIhi51ms8Y17cGMhOz+tio1I5pRCtcHX/h35E3K4RBhn
         6b8A==
X-Gm-Message-State: AFuF++mijCz54bVmC8iBV6SSCweh+aeoTsgh266fX6d/0TrJQDi8856q
	6olM+4RQgg0YVC/v2ekBfyp7qGGBqQjRBKBC6EIjA2drnaB+9/dqP27rSO5y4g==
X-Gm-Gg: AYBFou03MjJrWF5f2ZqmiVXdmk961BCfwryiDuUF0s/stxEmqLOFIlPRp2nueW5xue0
	8a4JBWwJcre59KtD9Y52tZb7E+2qOSodxO2bEAmCstGY26bHu4QzjJ0jynJBGxmf/N3DwTAfE0p
	qDYcMEN1UiDxfG+x4U5j12K2PUajQFru0FeI6MQ9sCpjgeljKOi4cJs4c1Nl94zsu3/EFv372Tc
	q1as1hE4DfAgLRgeLO26R5uM8PMm0E/AuvpQv3gNcGeT6FetN5unW8c+pftjiE3j5//ekQxPVhh
	uJct693WaV/QBXNzfGHSZGqrn5tGIn9kU5MxhrlWbwhWhjD2M9ePu8I2FtB2WSo0KyN0rHL0XjL
	X17T/ssvz8+Tlfv36eI95HEzX1JxZsa02udzm3KhvY4IsvRKgRWXvvgv+kdR+X9U4b6kswd8ktK
	aiOU2bMTmCJsi1YmGK0bPixzPv39zFrxOVxf2Nb5PXaM27fJDFOkF7sNPtp9cuil6GKrbTQXxZx
	S8z4QU4D9RJe657/6Nl7Rw=
X-Received: by 2002:a17:90b:1d0c:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39d9c35972cmr1734220a91.24.1789081817359;
        Thu, 10 Sep 2026 16:10:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 12/32] unbound: patch CVE-2026-44608
Date: Fri, 11 Sep 2026 11:09:11 +1200
Message-ID: <20260910230932.173913-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129930

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44608

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-44608.patch      | 59 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44608.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-44608.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44608.patch
new file mode 100644
index 0000000000..0552804051
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44608.patch
@@ -0,0 +1,59 @@
+From b70913c1208eda8494e2d6dd81910e92b8640dcc Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:22:52 +0200
+Subject: [PATCH] - Fix CVE-2026-44608, Use after free and crash in RPZ code.
+ Thanks   to Qifan Zhang, Palo Alto Networks, for the report.
+
+(cherry picked from commit 75b6dba593d4fff000434cd64807c6ebd50bd244)
+
+CVE: CVE-2026-44608
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/75b6dba593d4fff000434cd64807c6ebd50bd244]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/rpz.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/services/rpz.c b/services/rpz.c
+index f45cf6542..27f7de861 100644
+--- a/services/rpz.c
++++ b/services/rpz.c
+@@ -2468,6 +2468,7 @@ rpz_callback_from_iterator_module(struct module_qstate* ms, struct iter_qstate*
+ {
+ 	struct auth_zones* az;
+ 	struct auth_zone* a;
++	struct dns_msg* ret = NULL;
+ 	struct clientip_synthesized_rr* raddr = NULL;
+ 	struct rpz* r = NULL;
+ 	struct local_zone* z = NULL;
+@@ -2511,13 +2512,11 @@ rpz_callback_from_iterator_module(struct module_qstate* ms, struct iter_qstate*
+ 		z = rpz_delegation_point_zone_lookup(is->dp, r->nsdname_zones,
+ 						     is->qchase.qclass, &match);
+ 		if(z != NULL) {
+-			lock_rw_unlock(&a->lock);
+ 			break;
+ 		}
+ 
+ 		raddr = rpz_delegation_point_ipbased_trigger_lookup(r, is);
+ 		if(raddr != NULL) {
+-			lock_rw_unlock(&a->lock);
+ 			break;
+ 		}
+ 		lock_rw_unlock(&a->lock);
+@@ -2532,9 +2531,12 @@ rpz_callback_from_iterator_module(struct module_qstate* ms, struct iter_qstate*
+ 		if(z) {
+ 			lock_rw_unlock(&z->lock);
+ 		}
+-		return rpz_apply_nsip_trigger(ms, &is->qchase, r, raddr, a);
++		ret = rpz_apply_nsip_trigger(ms, &is->qchase, r, raddr, a);
++	} else {
++		ret = rpz_apply_nsdname_trigger(ms, &is->qchase, r, z, &match, a);
+ 	}
+-	return rpz_apply_nsdname_trigger(ms, &is->qchase, r, z, &match, a);
++	lock_rw_unlock(&a->lock);
++	return ret;
+ }
+ 
+ struct dns_msg* rpz_callback_from_iterator_cname(struct module_qstate* ms,
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 9de6a3c88c..8bd8732fe4 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42923.patch \
            file://CVE-2026-42960.patch \
            file://CVE-2026-44390.patch \
+           file://CVE-2026-44608.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

