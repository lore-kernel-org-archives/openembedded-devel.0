Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC01C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:37 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27850.1789081831983734419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iJBnGIKE;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c9879395so262782a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081831; x=1789686631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7Ukf4o44XeEdRh4TL0npgmLzHgMjDi9CghX50k/zrQ=;
        b=iJBnGIKEZ9MNiR6xNUQtH61c3F74BVMkUAjxCb7Sp4r4vUGRKtbR2wlbWxPegsNg1K
         mgGLhT/MhSTuDEnP2wZHml7wYmCykhhNNCt567Xvw+K7uZCdMM8civo/4avJRad9jbcB
         e66Ph/pmpgpDMXUp0WhzC7DwsrGRx0Btsjm/IzLokf7czVFOa56XtPV0D/2VwHDUb7ed
         73ghg3ZhNirngjl2xUORitPFh/gii5tKS8y7vqjBny84rV+M4Mi0AJ8/8hn1zFRayHjN
         pGVWvhZBgnlVTLx8bocEGLJmJxDFdxpLF6M7DXpe0LcYVv71WFGb4FhyXyqJKxJrm74n
         4aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081831; x=1789686631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7Ukf4o44XeEdRh4TL0npgmLzHgMjDi9CghX50k/zrQ=;
        b=GcsLDW6NpYdK5bAft1S/5qxtFlt4NYClTecQga/hXEfz4yr7BSLqVUXj/ZnrLXoUQY
         prSUiP1QX9aWhs0oNf83kzrgZy6JngfKepNnopyMwVtQ4VAjQ5F/6KyV4nXmPRLkdlXS
         7vGnw1rl893wX+p9LmI0Xl5Bk2LUOXwaRoTNfQRsvleh3Uf82jD+Ic4nK8sLLneMDN7I
         xEl2WV0mi16Eo8zY0z/qlRWCJlrQJfoJVhg8EWx2wvdUOeVOJ+z9Xraf12P5oBeer/1l
         W/cfRR3NjZWCHmKFL8ClkVNYtLoV8ENVwFetV9MrOKcerOAC8IGG4XQOTHhJuuhu7I6B
         YW7g==
X-Gm-Message-State: AFuF++mBq1+N2VEo0B04SWMfxKFUsuPluKB/GtlR54D4/zgA5yXnQwq0
	SkT3bT8UiuOT8Aqimc6H2hCzW9lQ0muN/Oae01m+Lh9yLfbnb7FqSgN3nN/ycQ==
X-Gm-Gg: AYBFou1s+9XC+j66ygTOvA2J1imxgtDtlmeFQ8o+ENQylAXjjxliAG1AWT9oN/H4Fmq
	yCYLAwKpIsu5FdM07ISONoTGHZQRWYsXYT5m3aCEyxHePX8++gWooRAS03AgycFXKAHfd3fJ6O0
	8tEvndkTR+zhNiDViSHpyL+mGV7yc/03cLoxqwYrmDN8YvBVogkLuXEqB1VGlQzq77UfLxNqG7N
	8s8PW1FT9M5hQpE9nSa9IODrBRmjpf2LdU91UezL7b1hnvEpjWIgG3BsMvXtF86ohqZ9/Mh8tS4
	oTRfmGHRKIpIQWnvReju/tme7lL+TGIr9PljHpe9/DLZQZuofVfIHorNqI8vch6ayAYz6FtgB3J
	h5FtXINRTALot+z9vTpvRie2ASswlqJVx1q4lRqCnHsZxy8Kchczvw0scISQO7VUUAz/JXToTdq
	tkDU833Yb/CsdkwueW8lphwSEjUjZuho2QU2+3uIntyHn0eQLrNsn9oJqpbTKMMUCWhH8iuH4ps
	tAOgBwyCZc+i2v/VcUIlVE=
X-Received: by 2002:a17:90b:518f:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39d9c1bef27mr1861361a91.13.1789081831215;
        Thu, 10 Sep 2026 16:10:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 17/32] unbound: patch CVE-2026-44687
Date: Fri, 11 Sep 2026 11:09:16 +1200
Message-ID: <20260910230932.173913-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129935

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44687

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-44687.patch      | 31 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44687.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-44687.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44687.patch
new file mode 100644
index 0000000000..03e57f6327
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44687.patch
@@ -0,0 +1,31 @@
+From ac34bce07f66a96baf85e3f25f99623b08b6dd86 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:12:03 +0200
+Subject: [PATCH] - Fix CVE-2026-44687, Off-by-one error in
+ 'harden-below-nxdomain'   logic can shadow a stub/forward zone by a
+ legitimate parent's   NXDOMAIN. Thanks to Qifan Zhang, Palo Alto Networks,
+ for the report.
+
+(cherry picked from commit 1e1940383ab5ee655fe7fac0da606fe59c76ce86)
+
+CVE: CVE-2026-44687
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/1e1940383ab5ee655fe7fac0da606fe59c76ce86]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/cache/dns.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/services/cache/dns.c b/services/cache/dns.c
+index 8dae2ffcc..121870ee3 100644
+--- a/services/cache/dns.c
++++ b/services/cache/dns.c
+@@ -1019,7 +1019,7 @@ dns_cache_lookup(struct module_env* env,
+ 	if(env->cfg->harden_below_nxdomain) {
+ 		while(!dname_is_root(k.qname)) {
+ 			if(dpname && dpnamelen
+-				&& !dname_subdomain_c(k.qname, dpname))
++				&& !dname_strict_subdomain_c(k.qname, dpname))
+ 				break; /* no synth nxdomain above the stub */
+ 			dname_remove_label(&k.qname, &k.qname_len);
+ 			h = query_info_hash(&k, flags);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index ac8cd281d6..6cae8632ae 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-32665.patch \
            file://CVE-2026-42955.patch \
            file://CVE-2026-44621.patch \
+           file://CVE-2026-44687.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

