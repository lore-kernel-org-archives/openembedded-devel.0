Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A020DC79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:47 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27778.1789081839973929897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VAZ5ddef;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso335974a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081839; x=1789686639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My+h0OS3Mr8B4Qo+PFgGDGPcVMEjtm5eelI2KF4NzH0=;
        b=VAZ5ddefk2tDzHU8x7/zMKuNCXLweT3cSogRR3LY9aHu3yrhWfj+sTGAr7BXcbfCGw
         WvBCrFQYTPfkAZjrXMe53FJBNPZCZCJZ9iFanOT4CLiFuWAnB8y3P+JtNkpoTaUdFXOC
         k48UIslVTU31Y8DIlacd736SARjFe6OyA3qdvlDaf4CqLZaB42LFzRWMpd93Hm2h84J6
         ZbICQR2UDW92dbxluWeILvMimewvGL9597m6WFNGvAPmoXD5qOXrEJTv/tcbs4zDKN6q
         j2L1b8nk7VHDN9n/KvSIvkt+Mbv4mxni+5uXuArUS/ZJOfC9ZA0BXP6NFyr/N4dA7LJr
         W+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081839; x=1789686639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=My+h0OS3Mr8B4Qo+PFgGDGPcVMEjtm5eelI2KF4NzH0=;
        b=p9sHvoYvXQoPaS3bp4j/jlT0AN+P913nE+HF5sH3szBdo0bfz1C4y9/5bM7sl0BqWy
         5lalkQFJuf6IgTxPXbimDkdO2WWEyUL70arki9KeKX+5Gr6xzLtDVbXqVDFsIf4dJN5O
         75Q/nnrs2BOTp0BIG3X6mEZ3IHhe02698m0pEJn/p3Gv/zIgHOM3L9WsrVMJXWFG6V17
         W4QkNr47pQUK6XE/ZcxNV/djC7wHJxA45AM4sY2khVwh5WywOP1JJMIRnpPyEmifht42
         xUR53180J4mBTzUIo1Rpv9SPNcpOjRDBQj8AV5Oce0MbK1fZWTBrhQAJZCsHStLZMUXV
         i2jA==
X-Gm-Message-State: AFuF++lgK/ZatRMBRo/p6XoFtrauRaqEY0IJvphEE9DH2C3y4copiV5h
	5WqL+f69tLElD+fvqCLXpOHMZhXrb5TB5Ef5xOzCSikCNs1ZLgL8RMqwnWShpg==
X-Gm-Gg: AYBFou1dW6FF7OL48KOMCMg8MYTnJ3n2wgaAg0AzNnF0GrgLKbyMLeEveqRJ+rf1Nbn
	Oxr48TsJJJrk+bTD+LEhWqYvEisaF1zwCZS+5Xdt0wjoRgGha36ES2tXfWbP2yT6WeROuKc6FDl
	PhOTH4UR+LZ7rgS2YkVYRK34izgYpslq+n6NCvd5NmVY+0ube640Hk1ROmyXaNXC45ILkbzQ9EJ
	vht7oLLyXT3yqqhuyh9YfAYnNAM1g5TKcvvy7sknYlky6cfEO5S0LOTZuIci+d6eDhuCLGVhvmz
	uJSi3XQL5OJ7Ts0BpEkgF4IQEUk5pCEQhRnuJyhojNB8dWvSHlMyjDR2xr48EED3LKzKN79ZQ8E
	/zLKfr4OHaYpLY3TEaNXKtTNaVYrEejQOpHIOoOjlzYpmGEE/tEAcSISlMnlycMbttvW4cdPntw
	+HBVEDYqho3CROjhjLSBSitg8pmlfnP96kECx7KmPaAqOSiwCUYt2TYKDMljttTNPuE4zFlqW8+
	eR3s21v59fVLgZp431qyWQ=
X-Received: by 2002:a17:90b:588d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d9c3771a8mr1662211a91.19.1789081839313;
        Thu, 10 Sep 2026 16:10:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 20/32] unbound: patch CVE-2026-50243
Date: Fri, 11 Sep 2026 11:09:19 +1200
Message-ID: <20260910230932.173913-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129938

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50243

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-50243.patch      | 36 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50243.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-50243.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50243.patch
new file mode 100644
index 0000000000..761bc9687a
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50243.patch
@@ -0,0 +1,36 @@
+From 793f66cb3c63357bd610690151a4859b159f7f5e Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:14:04 +0200
+Subject: [PATCH] - Fix CVE-2026-50243, 'response-ip'/'rpz' can rewrite BOGUS
+ answers   instead of returning SERVFAIL. Thanks to Qifan Zhang, Palo Alto  
+ Networks, for the report.
+
+(cherry picked from commit 02b16de1ae40e43a3e3804e98ab9868da33d72eb)
+
+CVE: CVE-2026-50243
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/02b16de1ae40e43a3e3804e98ab9868da33d72eb]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ respip/respip.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/respip/respip.c b/respip/respip.c
+index 353a0fd78..346f84feb 100644
+--- a/respip/respip.c
++++ b/respip/respip.c
+@@ -1110,7 +1110,13 @@ respip_operate(struct module_qstate* qstate, enum module_ev event, int id,
+ 		if((qstate->qinfo.qtype == LDNS_RR_TYPE_A ||
+ 			qstate->qinfo.qtype == LDNS_RR_TYPE_AAAA ||
+ 			qstate->qinfo.qtype == LDNS_RR_TYPE_ANY) &&
+-			qstate->return_msg && qstate->return_msg->rep) {
++			qstate->return_msg && qstate->return_msg->rep &&
++			!(qstate->env->need_to_validate &&
++			  (!(qstate->query_flags & BIT_CD)
++			    || qstate->env->cfg->ignore_cd) &&
++			  (qstate->return_msg->rep->security <= sec_status_bogus
++			    || qstate->return_msg->rep->security ==
++			    sec_status_secure_sentinel_fail))) {
+ 			struct reply_info* new_rep = qstate->return_msg->rep;
+ 			struct ub_packed_rrset_key* alias_rrset = NULL;
+ 			struct respip_action_info actinfo = {0, 0, 0, 0, NULL, 0, NULL};
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index cc380f6ae0..68d81fc551 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-44687.patch \
            file://CVE-2026-50045.patch \
            file://CVE-2026-50046.patch \
+           file://CVE-2026-50243.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

