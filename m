Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8206FD88C2
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:56:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16531.1773219383764837701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVL2TR3D;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439c6fc2910so5519773f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773219382; x=1773824182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfchojBZhOWfdrnkZxTtMNpfILSbBATjlCEgVnBk+Nk=;
        b=IVL2TR3DIj1fryZPSlXvgMwJwbUJBgDY1TRaEMO7QLdlqX6ZQnHlHTU2B5ze+LglLO
         R5EncdqEg6+f6ynoW/oj6a2QwwGNgkD/BiA/p4Lzbq5qv1tNeY2Kio158OeFw5ayaRmG
         Qk9PTAE80fRJ6HydCPGv1N6v+iVh5DVTGOlzOgJ6e4OuBbtROmjn6mrxzBV3riVi/kr6
         twpctDfPcKAK0GGLg6YDcgAPnya4loVAMgHJ6CKLsvQ6NsmtzH5XPkCV3A/CcVUvvCfU
         d17YC1pilEBtImUaxAqxmnkmX0K3MGmf2LFhnCGA5dtOmYLKzRIbtHyTFxAjoeuZ7cYQ
         qbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219382; x=1773824182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfchojBZhOWfdrnkZxTtMNpfILSbBATjlCEgVnBk+Nk=;
        b=gxCn0kOoQwAsRPYGHQ2/ixmNnOtK2PyZGlJ7M5beoQodn/iP09oZPgI86//fgIrzw6
         cRMmQ6Z45tWwpmgJ8/mUbm0I2tZKJqOKWKc4hQ17Rz0tLKWjV0Wv1UgU8Z9KdPtF91PB
         tW3N6NhpoYx9h8M6nL58LPjHOrtx0bmY2dh8LcF1utz2w3uQIMrWqfxZale9ezM68uxL
         SGWHU7Ffn0gbqfi2YJ3cmTsnWestwJx6qhGbI+YxFMywiYS2hQuJt6IO+QV73wTMInPL
         cTwvFG/NavdhtJvaUw6AZxxWKomESbeYARb0fEJw9c89UgWPT9lJCY6Cf4B77vOoT+v0
         oVww==
X-Gm-Message-State: AOJu0YxmQ4WH/8++i3fRxmpkpuyKt/Cph+aKCWjxBw/iHlshpSh+mOMS
	nOfmehtBW8rMMOnUA00HVGXuIdl424NnHbSwtvWa9NZ+vSmj4vYLkf1xSoH8KA==
X-Gm-Gg: ATEYQzyp5dq/SZUJLIKG9yc6YO1EyNmPKZMJUOODey2lfNiOTLA3jPAN+APmSaHKHWa
	NhIRH9Q77ZIwWBsIedgRGpY5Lo6v5YjSv+2mmyqsAb6o3z3rlz+fhCaI/ls7aH7iYZzi47PPTUF
	gUlsvCe+bFrdxo2EQ4EE+OJqAkn2oIenYpMGir4WkOBTam8wCir7FCQ85udP84dnFzLNdxSrdwT
	a1c0C+Y8SI/soLeIP7p4RXvbF7z9WG5UL2CuVYZsU7UYa9e5B/LzHYHP9tTjblM2d5R+UmFmExg
	CZv/gprDyHHtHe8zWtLKk8EjsX0flBUx/dd4Pi8KOUdoPcrLWIULV2YpyHPx/cTlmug9eytvwJ+
	XFBcLdC4ww05kmqp7DZ7DhYKlr9dtMriOxTXedlUogU4WEb8KqWu/y2BV6cpC567+se879p5cYR
	ky1l1Y4RKOf3RiEUsW+Hhv
X-Received: by 2002:a05:6000:2886:b0:439:c202:99a2 with SMTP id ffacd0b85a97d-439f843c98amr3561350f8f.52.1773219381929;
        Wed, 11 Mar 2026 01:56:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81a3b91sm5415645f8f.13.2026.03.11.01.56.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:56:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] ettercap: patch CVE-2026-3603
Date: Wed, 11 Mar 2026 09:56:20 +0100
Message-ID: <20260311085620.1601814-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125073

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3606

Pick the commit that is marked to solve the related Github
issue[1]. Its commit message also references the CVE ID explicitly.

[1]: https://github.com/Ettercap/ettercap/issues/1297

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ettercap/ettercap/CVE-2026-3606.patch     | 48 +++++++++++++++++++
 .../ettercap/ettercap_0.8.3.1.bb              |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
new file mode 100644
index 0000000000..216134812b
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
@@ -0,0 +1,48 @@
+From e5f5c671296e7ee678e93968e133a932c76986ad Mon Sep 17 00:00:00 2001
+From: Alexander Koeppe <alexander@koeppe.rocks>
+Date: Sun, 8 Mar 2026 17:57:39 +0100
+Subject: [PATCH] Fix heap-out-of-bounds read issue in etterfilter
+ (CVE-2026-3606)
+
+CVE: CVE-2026-3606
+Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/41c312d4be6f6067968a275bf66b2abd2a0ba385]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/ec.h                  | 6 ++++++
+ utils/etterfilter/ef_output.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/include/ec.h b/include/ec.h
+index 4e363b0a..66da146e 100644
+--- a/include/ec.h
++++ b/include/ec.h
+@@ -81,6 +81,12 @@
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+ } while(0)
+ 
++#define SAFE_RECALLOC(x, s) do { \
++   x = realloc(x, s); \
++   ON_ERROR(x, NULL, "virtual memory exhausted"); \
++   memset(x, 0, s); \
++} while(0)
++
+ #define SAFE_STRDUP(x, s) do{ \
+    x = strdup(s); \
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+diff --git a/utils/etterfilter/ef_output.c b/utils/etterfilter/ef_output.c
+index 2530e599..2f49177e 100644
+--- a/utils/etterfilter/ef_output.c
++++ b/utils/etterfilter/ef_output.c
+@@ -150,10 +150,10 @@ static size_t create_data_segment(u_char** data, struct filter_header *fh, struc
+ static size_t add_data_segment(u_char **data, size_t base, u_char **string, size_t slen)
+ {
+    /* make room for the new string */
+-   SAFE_REALLOC(*data, base + slen + 1);
++   SAFE_RECALLOC(*data, base + slen + 1);
+ 
+    /* copy the string, NULL separated */
+-   memcpy(*data + base, *string, slen + 1);
++   memcpy(*data + base, *string, slen);
+ 
+    /* 
+     * change the pointer to the new string location 
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 99fcacd3ef..b6490842d2 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -19,7 +19,9 @@ DEPENDS += "ethtool \
 
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
-SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https"
+SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
+           file://CVE-2026-3606.patch \
+           "
 
 SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
 

