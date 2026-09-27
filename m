Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01369C98328
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:38 +0000 (UTC)
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29995.1790469572198626512
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lGHB8Qtc;
 spf=pass (domain: gmail.com, ip: 74.125.227.168, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so223025a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469571; x=1791074371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37aJK3mxQLizslUDs+/kI8C2CLgfArSBL1h1FJGJ4Og=;
        b=lGHB8Qtcx5nOzPz7KkNnRc1ImKaudmYT/reYxLRfLiGtd+vEi6MQqcxaFOJlsh1IWK
         +G/+rAWWLMVRMJxPileyxClJgHHB1KvvSkhfFdhm4TaZ2qwC6MwJIObt4iN/IHUUE78M
         hhglDazaPlgo9UID8mfCe5zTsUPNWITiG5m28Hvg5h10endZQ55UXjVwic1dPFYcfy3y
         1+HEDrLHWTZ55eXu+0Vyq5ELBLNqQbOPAxj5XBvFXaGUVtNi2szBuEQAUq5E2wNdV6ok
         GqRABUeIUNJ9QmwZV7Rw8LLTNO8RJay24aO0xJy5RMq1klkNGlmhNX0V/YJGe1lKT1A6
         B46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469571; x=1791074371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37aJK3mxQLizslUDs+/kI8C2CLgfArSBL1h1FJGJ4Og=;
        b=KRZDgs82dE+EtB9U+WH+C0UVO8Ewqui3znWC3//NZfhGO2CJ2ze+NQbhlQGs1YUGmR
         Q6iiyaRhKPeKRejEBGbTZ3pUKSH8sIaKkW6+bD42qfytwuWW2z2wOV/4aiL8wp9dQg2h
         BhW86SG3zCuukgaAXTpPIsLIEd1tlNNRj3bya/svItpPlThHCrsv9NKmMNZ49DvWniKI
         505ZQ1S2thQg0vBxACOR8fLaugFYyLtiSemay0FOlpwWQ4fEX/uJbsGxtG5NHSAudOm+
         timXiEb2qtNcMgl+TVgtWTbtXabV0CeeKmHU1apA9uWX2IU/bV4dAaPK224Q79m93/Hs
         MgFQ==
X-Gm-Message-State: AFq9FYI8NgV5P9aY3L2hQZATh5by+QZKjLQW/nu3cz6T102IoGPtTtZb
	y4eFsLqPZeVZPlhs8udFz7P/Kmc3cz4+91drDD3iCMVc5hTsUKmwxh+X7IOeCg==
X-Gm-Gg: AYBFou0eLXk6UWWkofddaR4vh2ymHFUrs7U4LsemMBDx06wNoC8oFTr4PpUidiTyVqp
	adKHipf0z/It3vEiEFLx+lXjAE0BIKZUjhkkkvdYe4YCgkg+Wu/HIfAPsRnaSpuiYlN1hWOziTZ
	cQN5nh158/WT9JbWWrdwBXFnNODdJb1t00PzoWkeVlHEA95NTU39glcyPzJbyaOOroE2utCDQKI
	8zSxKiw8zOVPu10VN2X+SG5Ob6YJlX60RF2uDpLGPvbUr7BwogDn8QhNov2lyXATtZyQNegsRpb
	oKtohF45e3GHqxKh1/jFi6565TgIYKRLhsaDwrgdWXbaAnmgoojEY55X1eLlA9IIn12zeE6eCE5
	d7RLx4mG66jCbPjSpnAAZeXMlbGpHrAlsaNEDh9/Gni9YC7RUNAGjyY8Kz9UhYmJgHNEHFauevA
	CWHJ5SIjP/0IKeC2wbviqMHOgVIoOmvpY63lgpNNKuftKdQZilqWx86EK0ztXJRtrd7vR5gFG59
	pM01JwV4iokbt3yQfpWz94=
X-Received: by 2002:a17:90b:1c83:b0:3a0:cde8:1dd6 with SMTP id 98e67ed59e1d1-3a0cde82a7amr2569539a91.6.1790469571471;
        Sat, 26 Sep 2026 17:39:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 2/11] unbound: patch CVE-2026-81642
Date: Sun, 27 Sep 2026 13:39:12 +1300
Message-ID: <20260927003921.746786-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130321

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-81642

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-81642.patch      | 30 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-81642.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-81642.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-81642.patch
new file mode 100644
index 0000000000..9f77424a95
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-81642.patch
@@ -0,0 +1,30 @@
+From a774b2050a1543e87def9cba0e25dcdabffde526 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 16 Sep 2026 09:18:49 +0200
+Subject: [PATCH] - Fix CVE-2026-81642, Heap buffer overflow and possible
+ Remote Code   Execution when digesting DNSKEY. Thanks to Yuqi Qiu and Xiang
+ Li   from Nankai University, AOSP Lab for the report.
+
+(cherry picked from commit 8c2e0fd6cc5b6eaa618ac72227808824b4edee7c)
+
+CVE: CVE-2026-81642
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/8c2e0fd6cc5b6eaa618ac72227808824b4edee7c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ validator/val_sigcrypt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/validator/val_sigcrypt.c b/validator/val_sigcrypt.c
+index cde281870..b9bfe685c 100644
+--- a/validator/val_sigcrypt.c
++++ b/validator/val_sigcrypt.c
+@@ -305,6 +305,8 @@ ds_create_dnskey_digest(struct module_env* env,
+ 	 * digest = digest_algorithm( DNSKEY owner name | DNSKEY RDATA);
+ 	 *	DNSKEY RDATA = Flags | Protocol | Algorithm | Public Key. */
+ 	sldns_buffer_clear(b);
++	if(!sldns_buffer_available(b, dnskey_rrset->rk.dname_len + dnskey_len-2))
++		return 0; /* buffer too small */
+ 	sldns_buffer_write(b, dnskey_rrset->rk.dname, 
+ 		dnskey_rrset->rk.dname_len);
+ 	query_dname_tolower(sldns_buffer_begin(b));
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 0b59d7c9f9..c8d7c6cdab 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-56416.patch \
            file://CVE-2026-56444.patch \
            file://CVE-2026-80225.patch \
+           file://CVE-2026-81642.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

