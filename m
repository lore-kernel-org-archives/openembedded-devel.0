Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8E2CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5087.1791839493959330856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=skclEBEy;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso162787a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839493; x=1792444293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIyg5qq8b+2UqKvFnrtqZGTXonYDjkNyPtCICmTLpUI=;
        b=skclEBEyWmyajqx06CO0tXBhMqvHF/O0udyd5j/piXHGf15QV3JzOIFfHh3pQ8xan2
         ip/sFE7ZmNrM5VPNPdJsIGigSF0XNBbJqFkxfb6U4UsoPVoZtvdK4qexOpLGtNZsPs9C
         0z95Q2DRbe1YLLlnJvErtyhYYcTHvIIzOEmtDegE0Nb1wMZPgwIEzvK2GG7LlGnTv6LQ
         YezmNaee8acwy/0Kjd+UHKkiHvbt9FUs0l3oYWUEkT5ChBUE29sdV2m/f7kLOLHwWlJ6
         +T/J6FlH0HaRWgrYT+EbVEiTx5zQ1PnG/dey+jBSkGOFWgtoMaXOzVkRcIcMMqHIxTKR
         0BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839493; x=1792444293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIyg5qq8b+2UqKvFnrtqZGTXonYDjkNyPtCICmTLpUI=;
        b=MPYfFDEDKHcZHnDQqhslcPWL6T2etCfxrPo3y9sjDpJHAB8qvOcYxetdYVGm5S3Det
         Ke6CZwdnWxdP4P/WLe5qS6nVhcZoKDvgwsf/NNSRLqLMjAyTIt7W44OlYFoUabtj4IMW
         RuZBCUFN7kqZKMmsuqWlLfBfIqBsu5hI6TXn4Q9WJGpz0+umTsX/bPgMcl71Ut1tkxZN
         VuUsPJt+Q9T9BtVkchGg4CRdnwLEY5YXVAoKAoPSlGkilGumQqPU2infAz0SQ09SvH+e
         0ZBXZuz8T4U2P3acu5ldtvlnHApAekEVC0Pnzg+C+eeHLMs7/MfrdfzCbtnKH96xzzz/
         Tf6w==
X-Gm-Message-State: AFq9FYLwhbsbiQQmWSToQLWDWYWHP72KaSAbyOO8mipvwQfNlxcCOikE
	G+jqbfjUVQmsHI3//3APJil5LbZqKd/ZzT+RsF6YS4RjCOjoVVdnomyTkN0qx62u
X-Gm-Gg: AYBFou1DN6NBLXjB00tE7+RtwBirOsXKiAjhQxWlWuvDDPlrnLVbV6sx8zE7QlBKTvb
	GrWu8U02yNVFz8JWmJEW+jCKQUgGY2ZxcJnijEbW4s2Dtbxos4FfmTQUadAxPOb5Oy/ocA7oxlN
	4F83U8h4xC7toqnb9mTKfQZUrHIuQrxB3qBxvEgl4THSNSelSn3Pcc85lIF+niY4wihWCJuidEe
	BNYIeGZewk4CCdikgzuqAICARYO8RxmH49aLYKjHNA0XgFCMeUoiBJeR4XNFXb/rnVppsNHTrt2
	UUn1EFiX5BMtYQD0rI/zIB6S1CuEljYoBrReu5wRk24VW0i1OwI9LTANAxbquze0vwwmzwC5ig8
	9hl6EELrjNXPgcd/IjQ+toKOTJCTKh7xngLOd2X8uNQE5Ox1Cv1egfbaxYXrEWWiZGWYIDTgpcE
	rypd1rzNNpE2ag/tF84Oz+2GSq7IUq3gZjmiAjPFEGNXcBaeeyFUrg3oR4PznAu0wkCAvGVXd67
	SM3VZV2wKx2j57uVpaJPGnfb7dwxwVSlPwsGIg=
X-Received: by 2002:a17:90b:48c1:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ab3a79c42amr8140756a91.43.1791839493341;
        Mon, 12 Oct 2026 14:11:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 30/43] tinyproxy: patch CVE-2026-31842
Date: Tue, 13 Oct 2026 10:09:54 +1300
Message-ID: <20261012211009.3352822-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130800

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-31842

[1]https://security-tracker.debian.org/tracker/CVE-2026-31842

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 985acd9e7c375e17a674be4c21e9e80d0259eb38)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-31842.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
new file mode 100644
index 00000000000..6b8c02d6292
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
@@ -0,0 +1,33 @@
+From ed5252d213a68546feaff68e2b40e401d2c2afd4 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 3 Apr 2026 11:21:23 +0200
+Subject: [PATCH] reqs: fix case-sensitive matching of "chunked" (#605)
+
+the chunked transfer encoding needs to be matched in a case-
+insensitive manner.
+
+closes #604
+
+(cherry picked from commit 879bf844abffa0bf5fae6aff0c73179024dd9f98)
+
+CVE: CVE-2026-31842
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/879bf844abffa0bf5fae6aff0c73179024dd9f98]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 7aacfd3..8b68538 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -850,7 +850,7 @@ static int is_chunked_transfer (pseudomap *hashofheaders)
+ {
+         char *data;
+         data = pseudomap_find (hashofheaders, "transfer-encoding");
+-        return data ? !strcmp (data, "chunked") : 0;
++        return data ? !strcasecmp (data, "chunked") : 0;
+ }
+ 
+ /*
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 2555d2132d9..a0ef5fd62f9 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://run-ptest \
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
+           file://CVE-2026-31842.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

