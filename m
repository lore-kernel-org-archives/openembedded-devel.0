Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6739FC38A2D
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.20221.1650820938524505016
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 10:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sx7yhQ4e;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c23so22105437plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=enUIih9aii1Zy+9s5dzB8AxIGEfe4UDoYYlEExEO/NA=;
        b=Sx7yhQ4eKE7G8dwMKdvIiidgi4RetP9hV9lSFrlnxtOTij0pQ9ZPp02lk/tH4CTbDj
         2idi8L3hj9C+lzmGqHKCc8DRcoZPI/9R6XzPjrRdSwRe2Dv6vsKEEsqynxQFBDmSRIKc
         1Nj02SqfjvoXFF8i+j86sVuVOP/+TYxylVh3FqUHJuPfSWxM78s/rB5Y5BQX3zFQKHiV
         SEqNy9GridEuTZlJ7rR7TsOPMfGBJfVDpeM2NYBJFvyzfwYowXV29Ub0Z6iay8qG0MVF
         upjNtkSXLr2zmaLlxd1gVmmHR6sKYZyL7mxv2bHr7ePKqFkrgufqUjVqLDdKBrCUwdXZ
         LaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=enUIih9aii1Zy+9s5dzB8AxIGEfe4UDoYYlEExEO/NA=;
        b=HwkEMvA/OYZicVem81euFPl1v6LxNoZTseYsiNP+T55cHytxtg1I142K+MTsJTTA55
         LYkj9XRFJNb2IX4sjl0CNH5Rh7URFzF/sbmisL5DWjrNBJgF75fiDFYHsxpyP+iZtFYE
         YYNnwCu0Eunp3ymGxM/tdXVVuEkOqfblmg0EdC/XXr6etUpVJlUgBap/WupBsiD9iTBJ
         jpDSqTP+t6Z6Etc5CSQGuybey0poSGOZzG9qdKWXL3V4ocJbS//lPlpXeUIdvRb/YHV0
         v4Pvq9ebMIpz2EiXw1xPNmM6elcDx6sQh+s3Faf+AOuxX1bpnBAEQvjUmqBozpDQOuiT
         5IBA==
X-Gm-Message-State: AOAM531McW3js34I8gKswdSeZQ6J4PEb6LhIPROuVRiR60ihN24/ZuNy
	tSf0T86KBPgdgQ+MVNyTaDImw4h3TfwnBA==
X-Google-Smtp-Source: 
 ABdhPJwLiBSZ0XemP8gZAM38quN09GpBSx+oEwgUF2WoQ+yR6qW5B2PWxymb+a0nQhGLmj+v5DLYNw==
X-Received: by 2002:a17:902:c40b:b0:15d:1361:f0f5 with SMTP id
 k11-20020a170902c40b00b0015d1361f0f5mr1580951plk.172.1650820937833;
        Sun, 24 Apr 2022 10:22:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 e13-20020a63370d000000b003810782e0cdsm7253160pga.56.2022.04.24.10.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 10:22:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mozjs: Use vendored icu on ppc/clang
Date: Sun, 24 Apr 2022 10:22:14 -0700
Message-Id: <20220424172214.324878-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424172214.324878-1-raj.khem@gmail.com>
References: <20220424172214.324878-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96755

This helps compile gjs, external icu is needed with gcc-12 but not with
clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
index af9256860c..9b990ecdf3 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
@@ -24,6 +24,7 @@ inherit pkgconfig perlnative python3native rust
 
 DEPENDS += "zlib cargo-native python3 icu"
 DEPENDS:remove:mipsarch = "icu"
+DEPENDS:remove:powerpc:toolchain-clang = "icu"
 
 B = "${WORKDIR}/build"
 
@@ -43,6 +44,7 @@ JIT ?= ""
 JIT:mipsarch = "--disable-jit"
 ICU ?= "--with-system-icu"
 ICU:mipsarch = ""
+ICU:powerpc:toolchain-clang = ""
 
 do_configure() {
     cd ${B}
-- 
2.36.0


