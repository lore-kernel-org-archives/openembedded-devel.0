Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABB010A88D2
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:04 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50966.1774538518441408262
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ntggezoR;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so11491285e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538516; x=1775143316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjC6ewlit/p8you58aG9+5sILqFbox84OcNF6Pqs4OM=;
        b=ntggezoRS8ncviT2OV3Y2IaJv8XDFZ8qWfQfMUv7BrBjd5rnZWiPG/VgVj6U5/Ot89
         ne9Yo4zK71ush27CbZdrZqpjRbHyK4RPSwd8bFAGQmbC1QV5THZnm3SB3DiY+uRwuCdN
         hh4PgEFXfnr/SgGxsAqd32HV4lOV7ustsHnJW09VDqi7OsPGe94Hy/CGKsxL136r9pu1
         Rnacy0KqwhzYUypfPw8Rr2vG7Zv58s7vmLnsYGMm6NdRRt5OSjRtoU/9/p9QlOCrrqym
         BihwFmlkhk164Ni6yApkMNg4tGhvbkNJcNNdkzqxmGrXhrHrYyd4nfs8h4HBoO6OSoDi
         MGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538516; x=1775143316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjC6ewlit/p8you58aG9+5sILqFbox84OcNF6Pqs4OM=;
        b=UdzoadLJTYxmZtGpVwrjotIzmqxo7wWyctRuekDMF/m1O1b52Vuqz6ZBYaeeiB7B7+
         rcXdxA5HLZOct3wXFzlB+tsu+F0/1Sfb6spEXXqViLQiYrcn7V52Yrc+GLGmmgw1Pbrs
         IrT9YC5QgBuXVbt3DXtTLuoZxsNctpiXHevg6YWbmb2ZvsNLt1CpFrC9m/P/G3wZNGtu
         Gdao0f/NHvLJe9yOy2kBs+efXinHVAydu/djUdahRgUYvcU8NJUb6Ck8vey6mrxhSYPy
         mlsA8Giv4+/eoRQA10qbBsg1mIMrDmn9ijxAA04OxQKxhkfWRizahjvklLT+DtqcjizA
         HvRA==
X-Gm-Message-State: AOJu0YxICWKuzIRKN1R2hRUDhVZvRflBC8a6ATmZJCCn9nHMNGtfF87r
	uFUbPsyKcfBSk8uTOFvM7pzgf0FdmBXEUni+sUB8ddf6lgka3s7xkoWCzDR7Gg==
X-Gm-Gg: ATEYQzyhFKwx1oy3FQdVndIw+i8fe065J2zY5o+JPdnywOre129mmRjFhb60ZRevNL/
	Jet8wtJP+z85jM3kXi57a1Ue4nOayLg8Frp/eZUtbtW3flvxexA6wtbaXyZK0H1E+0bHK2p6sFG
	a48h58zltuASmePRTxRFkypDrcvcFpLOi0FQQ+DZOahME1pbHNQFs6XFdEUDEfJIcMoOH0Rtnw2
	fLn2JgJUVV3nSYcbqgbOOn3/UMjPa+TpscUu3LYC4XZV3AZylYWMzH+z19fABuUtgcyObsgaLR6
	wZVhv6I3txqLUCpcug9MddgTQhARMHxeU0lU7qLxY0kZd5EwICdNEGu51ALRJQTsk4ai3nL/CVz
	b6mZ2sIYdQshtmbKq1X5zZQ/pTEtL9d39dZ2KwZGH9/ZJZjLVQp40dLUXOxF9Onx8gJZFEDz5Hs
	/5L9fWk8PgkwajwA==
X-Received: by 2002:a05:600c:5296:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-4871605bdffmr122245085e9.25.1774538514598;
        Thu, 26 Mar 2026 08:21:54 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:21:53 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-networking][PATCH 02/13] libiec61850: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 16:14:27 +0100
Message-ID: <20260326152143.2224099-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125741

Use PYTHON_DIR instead of the custom constructed directory name.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 4 ++--
 .../recipes-connectivity/libiec61850/libiec61850_1.6.1.bb     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
index a33a6248a7..3f34ed2960 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
 -install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${PYTHON_SITE_DIR})
 -install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
-+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
-+install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/${PYTHON_DIR}/site-packages)
++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/${PYTHON_DIR}/site-packages)
  
  add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index c46ed88d83..d42d9de103 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -25,7 +25,7 @@ inherit cmake pkgconfig python3-dir python3native siteinfo python3targetconfig
 EXTRA_OECMAKE = " \
     -DBUILD_EXAMPLES=OFF \
     -DBUILD_PYTHON_BINDINGS=ON \
-    -DPYTHON_BASEVERSION=${PYTHON_BASEVERSION} \
+    -DPYTHON_DIR=${PYTHON_DIR} \
 "
 
 RDEPENDS:${PN}-python = " python3-core "
-- 
2.53.0


