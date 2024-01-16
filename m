Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D14C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 23:50:58 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.34745.1705449055898849027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 15:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jSXPc3Nw;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6db0c49e93eso7681545b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 15:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705449055; x=1706053855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZK+U7tllR4ZG0n/8OmHupP1K5bQXa5klcDQ0bqznBY=;
        b=jSXPc3NwgUncrg1WtmA7RtnUd/sDheMZV1csV6IZwteRrU2V0rszsxSQCgJWsGdc7E
         GN0fLgAhT5ZR5qJk0S1KdAognsm9NMqKjdz/+YPK7vQT7aWfJFxJz9/jIdklrEEnth6z
         Hga6gZMa2uxlSRub4GLcCTfPaQJ3B8S0bs4K52HH+XqIE/5DNACoNQVNyLcfUAyO1eAU
         5xOsTkCXRQgHgwNzGNrLH4Bb6MMLtdPetwFmv4VfQRbHGLm+4xJ0e/AJOfjEsgzJkc/z
         Y5MthCBIpU4voCrQbInirE9DapZLLXoadnp8p9fY0n3RZiFPdA/pTvjjXjLWMXb7aDsk
         J8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705449055; x=1706053855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZK+U7tllR4ZG0n/8OmHupP1K5bQXa5klcDQ0bqznBY=;
        b=LMMlTp+uzC1YnaqAJRFlMnbFWc9fQ48KowpAclX48YKpwFEhYKYLstnZ7bWp8T0sXT
         my1yibutPthsGqNM9hNS0zyNLTcLkcoqGkAzv3LDWXVqKm00fiEZR8saTmDh51Ukq7ma
         sl56wDVKs5LFETSra1CAWo4Iwn6ExpMJ7HY5I0wT7hvgOG87NtwUQhGsx2bFD/H0ylHg
         wYnqDE9De9VaQeM8fewP9/iEQ5oK/3llgs7KxmBLmoyZ+M82QAI8E+yktqkSntX6zfoR
         /tKi96n7SMGjB8Pnfr7hTs7J1EGjNVPk8FzczPfVx0vm955K5qft2+O4BOztM05qn4xU
         LluA==
X-Gm-Message-State: AOJu0Yz+3XJtvkLlnI5w12njC31sgo0oIvN4VD0Cf0uQYWLp/xp5QlV3
	C2bb7VxJhTmGfFnyUGiMYEeHnvSALKIxvA==
X-Google-Smtp-Source: AGHT+IEDTMy4IeR9mkRPVKFWp0I/nH0agJmuE14Ws2pFcecrgXKOIFjriz3MXtu8vky1bAKfxfmkjg==
X-Received: by 2002:a05:6a00:1b:b0:6da:3194:1e68 with SMTP id h27-20020a056a00001b00b006da31941e68mr9707787pfk.41.1705449054962;
        Tue, 16 Jan 2024 15:50:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b80b])
        by smtp.gmail.com with ESMTPSA id z1-20020aa785c1000000b006da8b181bfbsm142182pfn.169.2024.01.16.15.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 15:50:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] opencl-icd: Rename rdepends to virtual-opencl-icd
Date: Tue, 16 Jan 2024 15:50:52 -0800
Message-ID: <20240116235052.3713167-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 23:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108310

This helps in fending off the build time QA error

WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb: RPROVIDES is set to v
irtual/opencl-icd, the substring 'virtual/' holds no meaning in this context. It is suggested to use the 'virtual-' instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/conf/layer.conf                                     | 2 +-
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 2 +-
 meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 83a9f7d566..6b64328c81 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -54,7 +54,7 @@ PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 # Configures whether coreutils or uutils-coreutils is used.
 PREFERRED_PROVIDER_coreutils = "coreutils"
 PREFERRED_PROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
-PREFERRED_RPROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
+PREFERRED_RPROVIDER_virtual-opencl-icd ?= "opencl-icd-loader"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   fbset-modes \
diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index 93fac969c9..d43ea281ae 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -15,6 +15,6 @@ inherit autotools
 
 DEPENDS = "ruby-native"
 PROVIDES = "virtual/opencl-icd"
-RPROVIDES:${PN} = "virtual/opencl-icd"
+RPROVIDES:${PN} = "virtual-opencl-icd"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
index 6bf01a2484..146ec6e472 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
@@ -9,7 +9,7 @@ inherit pkgconfig cmake
 DEPENDS += "opencl-headers"
 
 PROVIDES = "virtual/opencl-icd"
-RPROVIDES:${PN} = "virtual/opencl-icd"
+RPROVIDES:${PN} = "virtual-opencl-icd"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


