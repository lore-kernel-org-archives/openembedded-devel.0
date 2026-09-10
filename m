Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B32C88E48
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:11:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27790.1789081864545086245
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oVAldl+z;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so281787a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081864; x=1789686664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rgtHO/0MXvxdhY6MBXE47kUB4UnMGerjMuXc45WOHY=;
        b=oVAldl+zNWNApDSxSop8imofXjS6qTH/3S0xiB/4+APoSLoI1WqCwcWQZ431rvoOe8
         24ZP9n61PG85nU/64r7zLbV26wHrtzhamVXkmItBMu0KueLrNLppJOXSKkBEDDq1mKFi
         8GMDuN5wtX+qKabrHAdpHdk+cVNpqNnHMZ++oaFmM+JJUNnXWNPfCXqJ6JQY3u7dLl5t
         5hKtVTJQnYwmlkeAOYOk8heoO8B98Ff0m0NCEg6XskFsHqRTRIHEZl95f3zDPlyGfGgH
         hTgcKQY3uF/TSht9fqYiVPwRPCchEGRHHJkbPVU0zP4PZhyU+95eEkrt91hpJkOyzYh0
         n5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081864; x=1789686664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rgtHO/0MXvxdhY6MBXE47kUB4UnMGerjMuXc45WOHY=;
        b=eNYArETwfeoXOJ2GcN1fXbLsVBRQormvwEk5G588OCSYqWtXUQTcsJc0BsYg9407fV
         4NhA3kgPLiuMI9V5Sw1Nah/dIWZRuUoeoSH3VZZIcmAdb10vYBxqikmP8blkR/natVKr
         4bBAMcr7Hx4WfqaNPNKPFwadWcwIi8rUFvy8/KLENA9ZZ5FWn+hheBzh5vLthBMeAmaM
         LIrfaemy5M0XyObcW4AtLp8pZMiVFVDY/5an66ypthNOyAEIVgpUF6xbrl42TAm9jYjz
         GdTDMUBzEmi5HkvO9cYj9zwywJjCp0w2HZEYJeBpgNPe9RkBchqALgWOVQa9Mwh1DaMK
         FTGA==
X-Gm-Message-State: AFuF++lW4ojdcBCqPjx+Z/6/95ndd40dcTN6rOq0rK51KNzDRtc7g6b1
	x6eVHRyIVYjk12JYBW8bMBLUQqq+NscH43TkUs8j/yq87FFvQ9O/4WyoPlGDpw==
X-Gm-Gg: AYBFou12oWpcfnB2qX3HK/37YC2+IihIEXmWHEMS+dmwMazZQXoslwBE8SbavtQTghr
	g+B2CvgY+PIQh0s2PAoraAv9WI/PaiwUQEXAI5zUYDMf4+vZ2Jr1JG/9Xkwhkghg+3dYlYiieNi
	HRcVmmhJx8FoAA7OJHS/5/3hSmntE8rjhoMARKKgSbwSmzbITLsXhlGgYqpWx8JL5cjqVBkVG7x
	KykUhT9c85usk2M9qx1fCeGs4BJfe2GeA6aC1HxKTpASD1IyHqcWu56vWccV6wKsbBqrwe9+jTi
	tIqdB1KaPP+MZ9vWKyOFyYqmOk6Fq+mEDGniFSBv/rzCAvvAC/wFh+acITbcJOra80/zSBeCOoF
	WghOuZCddrtJ96Vt/QIaWDRM7EvVk8OyHhDxTJvtmdyuGd/X2R9r4YVMsCqrFBFk1XE1abVHqOY
	Bx6tMGNivMayn/JI0ShXgUxKMhOJq2UANkjayFIzYHXo5PAUZ+djwkmFRx4NNMBa9UGk3ZIcSqo
	JpAcMsjWhnh8uM7/okR5EAFx4OGCvgCmA==
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39d9c3944aamr1569248a91.25.1789081863736;
        Thu, 10 Sep 2026 16:11:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:11:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 29/32] unbound: patch CVE-2026-55990
Date: Fri, 11 Sep 2026 11:09:28 +1200
Message-ID: <20260910230932.173913-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129947

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55990

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-55990.patch      | 59 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55990.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-55990.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55990.patch
new file mode 100644
index 0000000000..676f1aa17e
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-55990.patch
@@ -0,0 +1,59 @@
+From 6e6c039d23afb169991fa489c2010ab0069a2cab Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:18:41 +0200
+Subject: [PATCH] - Fix CVE-2026-55990, Packet of death for a DNSCrypt
+ misconfigured   Unbound. Thanks to Qifan Zhang, Palo Alto Networks, for the
+ report.
+
+(cherry picked from commit ae1b3810cc3a8eb9b43c378289f74020b42aa7f4)
+
+CVE: CVE-2026-55990
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/ae1b3810cc3a8eb9b43c378289f74020b42aa7f4]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ dnscrypt/dnscrypt.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/dnscrypt/dnscrypt.c b/dnscrypt/dnscrypt.c
+index 173484cdf..bf858361f 100644
+--- a/dnscrypt/dnscrypt.c
++++ b/dnscrypt/dnscrypt.c
+@@ -663,6 +663,8 @@ dnsc_find_cert(struct dnsc_env* dnscenv, struct sldns_buffer* buffer)
+ 	}
+ 	dnscrypt_header = (struct dnscrypt_query_header *)sldns_buffer_begin(buffer);
+ 	for (i = 0U; i < dnscenv->signed_certs_count; i++) {
++		if(!certs[i].keypair)
++			continue;
+ 		if (memcmp(certs[i].magic_query, dnscrypt_header->magic_query,
+                    DNSCRYPT_MAGIC_HEADER_LEN) == 0) {
+ 			return &certs[i];
+@@ -804,6 +806,7 @@ dnsc_parse_keys(struct dnsc_env *env, struct config_file *cfg)
+ 		sizeof *env->keypairs);
+ 	env->certs = sodium_allocarray(env->signed_certs_count,
+ 		sizeof *env->certs);
++	memset(env->certs, 0, env->signed_certs_count * sizeof(*env->certs));
+ 
+ 	cert_id = 0U;
+ 	keypair_id = 0U;
+@@ -963,12 +966,19 @@ dnsc_create(void)
+ int
+ dnsc_apply_cfg(struct dnsc_env *env, struct config_file *cfg)
+ {
++    int nkeys;
+     if(dnsc_parse_certs(env, cfg) <= 0) {
+         fatal_exit("dnsc_apply_cfg: no cert file loaded");
+     }
+-    if(dnsc_parse_keys(env, cfg) <= 0) {
++    nkeys = dnsc_parse_keys(env, cfg);
++    if(nkeys <= 0) {
+         fatal_exit("dnsc_apply_cfg: no key file loaded");
+     }
++    if((size_t)nkeys < env->signed_certs_count) {
++	fatal_exit("dnsc_apply_cfg: %u dnscrypt-provider-cert file(s) have no "
++		"matching dnscrypt-secret-key",
++		(unsigned)(env->signed_certs_count - (size_t)nkeys));
++    }
+     randombytes_buf(env->hash_key, sizeof env->hash_key);
+     env->provider_name = cfg->dnscrypt_provider;
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index b867ea9b73..e4d18e9b2a 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-55708.patch \
            file://CVE-2026-55717.patch \
            file://CVE-2026-55973.patch \
+           file://CVE-2026-55990.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

