Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE9BCF9C73
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:33 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.8977.1727245468198648956
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FkprtWuL;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e201f146cc8so5891473276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245467; x=1727850267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luVHFH/GIpU7amXz/CUFPZFh3cqASAJjp0V7m8imxYY=;
        b=FkprtWuLKCr4LRCn39qb8pMu+3wWEybcZEdY3YNN8+Rr31Y15MMPO9CPSlMScYD9ss
         U+94ijjR4wTYSKBLE1KGH/M2t3NNXfvik9JnROMnWr3R4LoQC19ge0Ljjc8JEvEdCFu6
         pljn9xOvidXF70b89EvhSEGzgjfz4c5hbzyzlE0IbvnpCqhJnhF8xGOJIRS1hp6Z3Bpm
         9O2Y/UHHWsoN3ilcGJq8V6nowcQybzPTLHT2Wzec2+O0IwzO/6HHPbIBYQEYhrme5Y5D
         EFN4zVa/2VRZV6r7iXtP2JNJXVPMHBclZZJIuAf5isFy6clqCayyUlXlb3L0oR+a1Anh
         4C1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245467; x=1727850267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luVHFH/GIpU7amXz/CUFPZFh3cqASAJjp0V7m8imxYY=;
        b=HM/9RJusJXiSQUP/JNZewcoTze2jiKGgwKt2LVLwzO4VtMLymIr3BQNF8ry99f6KJd
         8VXpkEFTBux1MU3TVybzBLTlpH5zFNOiI5c8t4rmV/TxcuQhGbTBJHKw/go1uq9q+O3Z
         Pzb0wFOV569KeAw8XuKlWtCIwuoAh7dVo8Xleepl615fmTd86eS8leKqKcTfDMH9LT6D
         Hq8mx9eRGaKRhc1mfviAriKjSumUfEgXNvF4u30HSkDEp+axx8k1cVJ57xtgmiU/L7OH
         LsMO6MrinXZMaG+LSvxFTYLOtgj6xoXNAy6Q+Eqh+SZml0ovB+XSMPpoEQ12vLHyA+o6
         ow3g==
X-Gm-Message-State: AOJu0Yx32jspCZAr9li2WGzwvc4ieWKJSYWU2yDp6C2wWfudt6mBlJ2m
	p3bLCdzNGzsjP/jYfgC3mslLQvdFiYp9F6s/qOVXQV+oo743oi9O+ptJqRET
X-Google-Smtp-Source: AGHT+IHjcJYSNQbgmocCEQaSc1V0mK7IERXPKy0IXoY61JPBiUJUgDwX1athYhyDbfIgkq+ZZ18eyw==
X-Received: by 2002:a05:6902:178e:b0:e24:9f65:ec7e with SMTP id 3f1490d57ef6-e24d9bd9fa3mr1179258276.39.1727245466877;
        Tue, 24 Sep 2024 23:24:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/9] python3-pdm: Upgrade to 2.19.1
Date: Tue, 24 Sep 2024 23:24:15 -0700
Message-ID: <20240925062422.3146738-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112485

Add newlt added dependency on python3-pdm-build-locked-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pdm_2.16.1.bb => python3-pdm_2.19.1.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.16.1.bb => python3-pdm_2.19.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.16.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pdm_2.16.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
index 91ec759386..245e76014e 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
@@ -4,12 +4,13 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "b8680028b3aff3af8e15b483467da36bb9f02fcd402cf939da8ab6375d955131"
+SRC_URI[sha256sum] = "7fe235a9cb27b7ec17b762dc85bc9ae71e0776e4b7a8b6f64203f24bb915aa2c"
 
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
     python3-pdm-backend-native \
+    python3-pdm-build-locked-native \
 "
 
 BBCLASSEXTEND = "native nativesdk"

