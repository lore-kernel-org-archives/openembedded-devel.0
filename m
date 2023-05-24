Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F16C7EE37
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.3701.1684914788345977627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=M35+kM0b;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-510bcd2d6b8so3576217a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914787; x=1687506787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvpBPB+GyGNYtSsehiN2mK21Jv/nsZ8aTYcV0x6ZZf4=;
        b=M35+kM0bVA3wRVv9QsTzpYwiJ5ALKS6ZrvyIETk12g6QrmKc4PqBx3CjS7sKT/PJmg
         /1Sfg8wrCnbaPyOZRgrJwu3SXA9+JRJ/YX6NepWeijCKthUMnZR5Ez7goL1f4Cjb8oIM
         0FC03lVgNZ4BVwdlgUh4wKn/o8r3Hlq6s5B/OKr+pOERRCXgKjrvlio3DwbibwhrzoRN
         eWhgd+STtN2EkgpUQ+xgMkSPb8JkEwtc0TbbJaAMNnJceGgPDHaTeOHWUXurwPlNtpcJ
         PpT9xNYHXo2sl3zUGjwa8wSuYEygqbVaKWSNdYvbWo7J3s0yoEa2wJhQ/JL9WHK0tiPz
         2tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914787; x=1687506787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvpBPB+GyGNYtSsehiN2mK21Jv/nsZ8aTYcV0x6ZZf4=;
        b=TmOTjS7Glct9dUTgBHVhqTdbCzcOoOwrQJ1ox5krijBJM5NNjObZ0NYCAGgIly7C93
         8T67RVmYRCzS76GBKq5unMmmLy4hDZ+t0yKJBlIuxgm8W5cuenew7GxdOYufbQJTbQXI
         2+yodRCAEdcEDgLu4PdrccrGnlGp9Nvw5qgKDZOcMwD8qtZqVKW2CQwUTjfyE+qMTToB
         NmqHSTdM1o52C+I5X3PLmX3uUb4LGlLUE/wvLEQvneR7MxnaBQcA1wCHt/a8gQxKRpN5
         9kEcU6K5X31jT/3krHg2OBJC73QRfPUYcmiCSE2gdqdDhw7L8J0DUzGrCZNq+kYF/o2b
         64cw==
X-Gm-Message-State: AC+VfDxxJvwotPP1UIcEbTwLTV+mFjeEyhiehf7Rvmn1poNVW6XDGTMj
	xX+rA3owqs/Tgt07il+UqC5Vn4pPPUs=
X-Google-Smtp-Source: ACHHUZ56D1jcIzziL2blOwFkQjPoNO96qNmnHrCmgyvSWV3WCGUzOSplaOSwUlHTzDG6eP4tH+NPcw==
X-Received: by 2002:a17:907:9804:b0:969:df2e:d7d1 with SMTP id ji4-20020a170907980400b00969df2ed7d1mr15958756ejc.24.1684914786406;
        Wed, 24 May 2023 00:53:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qp24-20020a170907207800b00959b3c30f2csm5414393ejb.222.2023.05.24.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/20] ndpi: remove unused CVE-2021-36082.patch
Date: Wed, 24 May 2023 09:52:41 +0200
Message-Id: <20230524075253.1033593-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102762

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=8359cf87458d185011831a8132b8af17bcbc9605

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ntopng/files/CVE-2021-36082.patch         | 116 ------------------
 1 file changed, 116 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch b/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
deleted file mode 100644
index 8fdd62d186..0000000000
--- a/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 1ec621c85b9411cc611652fd57a892cfef478af3 Mon Sep 17 00:00:00 2001
-From: Luca Deri <deri@ntop.org>
-Date: Sat, 15 May 2021 19:53:46 +0200
-Subject: [PATCH] Added further checks
-
-Upstream-Status: Backport [https://github.com/ntop/nDPI/commit/1ec621c85b9411cc611652fd57a892cfef478af3]
-CVE: CVE-2021-36082
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- src/lib/protocols/netbios.c |  2 +-
- src/lib/protocols/tls.c     | 32 +++++++++++++++++---------------
- 2 files changed, 18 insertions(+), 16 deletions(-)
-
-diff --git a/src/lib/protocols/netbios.c b/src/lib/protocols/netbios.c
-index 1f3850cb..0d3b705f 100644
---- a/src/lib/protocols/netbios.c
-+++ b/src/lib/protocols/netbios.c
-@@ -42,7 +42,7 @@ int ndpi_netbios_name_interpret(char *in, size_t inlen, char *out, u_int out_len
-   int ret = 0, len, idx = inlen;
-   char *b;
- 
--  len = (*in++)/2;
-+  len = (*in++)/2, inlen--;
-   b  = out;
-   *out = 0;
- 
-diff --git a/src/lib/protocols/tls.c b/src/lib/protocols/tls.c
-index 5b572cae..c115ac08 100644
---- a/src/lib/protocols/tls.c
-+++ b/src/lib/protocols/tls.c
-@@ -994,21 +994,23 @@ int processClientServerHello(struct ndpi_detection_module_struct *ndpi_struct,
- 	i += 4 + extension_len, offset += 4 + extension_len;
-       }
- 
--      ja3_str_len = snprintf(ja3_str, sizeof(ja3_str), "%u,", ja3.tls_handshake_version);
-+      ja3_str_len = snprintf(ja3_str, JA3_STR_LEN, "%u,", ja3.tls_handshake_version);
- 
--      for(i=0; i<ja3.num_cipher; i++) {
--	rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.cipher[i]);
-+      for(i=0; (i<ja3.num_cipher) && (JA3_STR_LEN > ja3_str_len); i++) {
-+	rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.cipher[i]);
- 
- 	if(rc <= 0) break; else ja3_str_len += rc;
-       }
- 
--      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
--      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
-+      if(JA3_STR_LEN > ja3_str_len) {
-+          rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
-+          if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
-+      }
- 
-       /* ********** */
- 
--      for(i=0; i<ja3.num_tls_extension; i++) {
--	int rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.tls_extension[i]);
-+      for(i=0; (i<ja3.num_tls_extension) && (JA3_STR_LEN-ja3_str_len); i++) {
-+	int rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.tls_extension[i]);
- 
- 	if(rc <= 0) break; else ja3_str_len += rc;
-       }
-@@ -1443,41 +1445,41 @@ int processClientServerHello(struct ndpi_detection_module_struct *ndpi_struct,
- 	      int rc;
- 
- 	    compute_ja3c:
--	      ja3_str_len = snprintf(ja3_str, sizeof(ja3_str), "%u,", ja3.tls_handshake_version);
-+	      ja3_str_len = snprintf(ja3_str, JA3_STR_LEN, "%u,", ja3.tls_handshake_version);
- 
- 	      for(i=0; i<ja3.num_cipher; i++) {
--		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
-+		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
- 			      (i > 0) ? "-" : "", ja3.cipher[i]);
- 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
- 	      }
- 
--	      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
-+	      rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
- 	      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
- 
- 	      /* ********** */
- 
- 	      for(i=0; i<ja3.num_tls_extension; i++) {
--		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
-+		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
- 			      (i > 0) ? "-" : "", ja3.tls_extension[i]);
- 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
- 	      }
- 
--	      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
-+	      rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
- 	      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
- 
- 	      /* ********** */
- 
- 	      for(i=0; i<ja3.num_elliptic_curve; i++) {
--		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
-+		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
- 			      (i > 0) ? "-" : "", ja3.elliptic_curve[i]);
- 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
- 	      }
- 
--	      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
-+	      rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
- 	      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
- 
- 	      for(i=0; i<ja3.num_elliptic_curve_point_format; i++) {
--		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
-+		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
- 			      (i > 0) ? "-" : "", ja3.elliptic_curve_point_format[i]);
- 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
- 	      }
--- 
-2.17.1
-
-- 
2.40.1


