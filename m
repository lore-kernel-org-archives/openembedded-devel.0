Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33447D5C0CA
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:15:53 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16512.1765869349054522073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQDptEAH;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso6333900b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869348; x=1766474148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBjQhYYsr4snQU3wEg5ISjOg2XI5frfS7he11dl91FY=;
        b=kQDptEAHk62+Jib9lHei0fxevd/yOmOBXQ0/wnkKDfIGY2xmND16PYreejdwoKbTo+
         nMy4hhddX4XCi8bhSmqEmzT5xRjlpWvDm2701hrTUUP0/v9A6OWyTKDuHMfUDF7XjTVE
         /kZP9KHHvXsE8GZ8wq7/FDRz8Uya1NYIEEqG88euGneerB01a78hZ3zM7/+DF1tgLDKr
         itJx3+pe/hPE0SCilPaWJhiBLyzVDxmf7eAAK824uZ+SA4nCEvK4p2c09gHGbQB4J2PE
         3zk+0C1aqY3zY5spi2FKMGLPZZppqCcMBGUUswzyVbCDiAPzUUiYvY5mv4YYJduCo1ee
         MJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869348; x=1766474148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mBjQhYYsr4snQU3wEg5ISjOg2XI5frfS7he11dl91FY=;
        b=VEBvuH43JfUDqwzVf42OFnsOOVYK0aGQKpMlx5O+LIkQAuDGWh2G8bSsMCwKFcatot
         BxMZy6K2O+lNd2c5qksc0PMTfpiyQOtyGPPtFzWKLtqAOEqP/BLc4MHZFWpd6YICDLVh
         cYsarQ3/tpSbRY5nsM0DUvdd/59Iy4hZJ3q+oS8qQms+I4xOWfNSQHVgK7an0FcFuF4F
         vIhKGwDDt3nOV3m8a7AagVQOOKt83cQ7ZK6BYXuQm18MLH6DWlVQwqFVqNIrxYGFYEN5
         CIpGyMLPnAAz2S3eOwLwD3LhGpIrWUCqIGNvmAjdyt+Wih/6s7VTncAcdPFL7+Imbwzw
         ll6w==
X-Gm-Message-State: AOJu0Yw+AcFTz34o5Sc4IP3wAwPe7pNfHGgKtsLSADzdFBwj70Ydef0p
	D74ecTRwVzBAfG1+3HCmgcWkXUEws6TKHXtQGxe0T8tbzbqfLieiBMx03AZ89w==
X-Gm-Gg: AY/fxX47I7/wxL0jORnPTlq6QAZQynxbn++fiyskq1QMovWPVMNtdNDMFyfXrWgDd67
	cNKJqqUj2RKubITe/G3Xc4Y1r7ecAAKviEu9AY2ej9v9YDaDgXy+2T56pP3W6h9HNMnpymJJtLo
	r+ln+yIrVumTV2M2gKhPZdFi/RHmEz23cKQjzM0I+nfNPdHNjQIox9YOwO7YKZ42D/7/qFv6Dus
	BMtI5YggqPFNtllCl7l+vWWI09mSUiT/3lumUPzyqhkesb4JFV1efEqR9NxhFpAJlMBZP3MMU1Q
	Wn2Yc1r7DJnvz/BU710+RL985sEQIzZccmYBWnP6sQxHkYg/aiSF4e4IxMAYvXddbxr1ZLJ6V1A
	kyRusii8k0A0Kk1X+HdpzFCrq1c04zhK6JhVdlJLcsVVO/ATkVWRb/h29/4mdSQrneUOuT3HIsM
	qhKAoJ4GhJH9foDkwejpWiTqUk
X-Google-Smtp-Source: AGHT+IH+K1X+0L9eoU7/Z7EBy11TWhvV7VrGSbXKIq488HBjz4lZ3KFebb880AJ7iNYKf0jzC0k8Zw==
X-Received: by 2002:a05:6a00:2993:b0:7ab:653a:ca0e with SMTP id d2e1a72fcca58-7f6679361demr13887140b3a.23.1765869348092;
        Mon, 15 Dec 2025 23:15:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm14471448b3a.30.2025.12.15.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:15:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/6] unbound: patch CVE-2024-43167
Date: Tue, 16 Dec 2025 12:45:34 +0530
Message-ID: <20251216071537.3174578-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
References: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122682

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-43167

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2024-43167.patch      | 46 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-43167.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2024-43167.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2024-43167.patch
new file mode 100644
index 0000000000..23efc49338
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2024-43167.patch
@@ -0,0 +1,46 @@
+From 81b41525fd07660f60ccca0378d1e1650d0b45b7 Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Tue, 21 May 2024 08:40:16 +0000
+Subject: [PATCH] fix null pointer dereference issue in function ub_ctx_set_fwd
+ of file libunbound/libunbound.c
+
+CVE: CVE-2024-43167
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/8e43e2574c4e02f79c562a061581cdcefe136912]
+(cherry picked from commit 8e43e2574c4e02f79c562a061581cdcefe136912)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libunbound/libunbound.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/libunbound/libunbound.c b/libunbound/libunbound.c
+index 80a82bb4..c52114d9 100644
+--- a/libunbound/libunbound.c
++++ b/libunbound/libunbound.c
+@@ -976,7 +976,8 @@ ub_ctx_set_fwd(struct ub_ctx* ctx, const char* addr)
+ 	if(!addr) {
+ 		/* disable fwd mode - the root stub should be first. */
+ 		if(ctx->env->cfg->forwards &&
+-			strcmp(ctx->env->cfg->forwards->name, ".") == 0) {
++			(ctx->env->cfg->forwards->name &&
++			strcmp(ctx->env->cfg->forwards->name, ".") == 0)) {
+ 			s = ctx->env->cfg->forwards;
+ 			ctx->env->cfg->forwards = s->next;
+ 			s->next = NULL;
+@@ -996,7 +997,8 @@ ub_ctx_set_fwd(struct ub_ctx* ctx, const char* addr)
+ 	/* it parses, add root stub in front of list */
+ 	lock_basic_lock(&ctx->cfglock);
+ 	if(!ctx->env->cfg->forwards ||
+-		strcmp(ctx->env->cfg->forwards->name, ".") != 0) {
++		(ctx->env->cfg->forwards->name &&
++		strcmp(ctx->env->cfg->forwards->name, ".") != 0)) {
+ 		s = calloc(1, sizeof(*s));
+ 		if(!s) {
+ 			lock_basic_unlock(&ctx->cfglock);
+@@ -1014,6 +1016,7 @@ ub_ctx_set_fwd(struct ub_ctx* ctx, const char* addr)
+ 		ctx->env->cfg->forwards = s;
+ 	} else {
+ 		log_assert(ctx->env->cfg->forwards);
++		log_assert(ctx->env->cfg->forwards->name);
+ 		s = ctx->env->cfg->forwards;
+ 	}
+ 	dupl = strdup(addr);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 0542ae454b..9a537c2dc2 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
            file://CVE-2024-8508.patch \
            file://CVE-2024-33655.patch \
            file://CVE-2025-11411.patch \
+           file://CVE-2024-43167.patch \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 

