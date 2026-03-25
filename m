Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2E4106B519
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21204.1774441282931395212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pDglRpQ9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so47195815e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441281; x=1775046081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTeCiiJeZGyUQgTNNJOxQYlAZW6y/mZjkPCe73fcn5k=;
        b=pDglRpQ9cacxe+wSPhTPu0V12il9EizIDEBbKIRb+seYf7D+evNGLfhpmOzC0+rRy3
         0PD2f1LitmAIhkV09uq2QEbxRTMxkW2c9EAa+I9bwvr7msulsTv2ZeWE8eTVpCtWAQxN
         mPF8gRFa56md1i5vzvj6aRFlVVpt2f5/yn4YwXg5iouLgWlRgRI/3l5Z+kOewgOdAcCp
         YQGmZ7e5jysCeW0Z4fAJd5LfJRWV8Hr00vhpZkzZGJ1KqJ1pWogZ+xkvILNzpS6E1jEd
         XskyNQg1RF+M0IVTmGbf9atTwFoUP9axYm2aE7I5NaMXIZ4aZoSPUNWMPeEEF+0Lq1md
         YGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441281; x=1775046081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oTeCiiJeZGyUQgTNNJOxQYlAZW6y/mZjkPCe73fcn5k=;
        b=m8W0OoW+ezyg5IPowmKRi2BlJTf/QCw8eJoX5/flu3fDt+rLRtcWvmZsSpblvZja8Y
         lzJe3LHi79Am7X9DMew1UshtDKy2inus3ZJpe5e0yg1vl9Rkif0QC4V6itqkJDaOMNwj
         WqAGIrd6wC93HEnfi346teGa+1wru7h8LyvXe4lc9/uDNnDa7XIKqHXfsKTNHHyp4+2H
         LGDDslkcvwIbm1we92yFkVJrVl2j2/B+64ldFJ+9vMP2Jyj5sI2/08Km6v1Xp1cVTvOa
         4GpwQnIndFWHZB5S+LttxkTyTZ8SU/ga+o+hC+MTKqYo/QTI77a2/c2KZYeLvVKcgoIS
         4x0A==
X-Gm-Message-State: AOJu0YwZB/1RMNREX6+uoVC0fcPL/NLVoeHcNFwYGz7JgSoHQ44htLXZ
	1FyIDLXraPcCmKmhZPq1TfLfgO894p0MIJK8sgZF+Fc2Tzv10CIbmEGEEKBQTg==
X-Gm-Gg: ATEYQzyca17v1gqTTqu3DGOGvB7nVYMj0U4oaaAXmcymV3BXqv/izdHdAkUK1+BaTDD
	u9OXAFfsqxhy+jB7iDJb9Xw0JX8nguEAwZrhXe4dgAHna/nBKi5ewMxY2rmPsZeeDrYh70LnQMh
	BAq+S2/NBYnCCHARF67gar7vL/DOL0xCSG949ciz5fTYcgZwFiJjJqp50dqZE54On2LOuM9IjBT
	trQjYv6wPye/fhfhavOQtlIFkY6Hzb3v6SVZmZ/lVAnJcwKvNbKBXbJhYDPQsVk0LgJnnl5e+0s
	39Q7vxBAfDj3AclzdA74Sycyo2TmPDebpZnQE+a1r4nhUQ4M3rS6lKhtfZdqr7XToY0jSX4FJBJ
	6yCCXhuBj8r/UTkPbj86SbdLxZPRqaRyK+tluQy544CNMVH4vuY89hX1g3tBJoDfvWavZQ4KKnB
	p3Q1HCQ5mpfoSpng==
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-487160a681bmr46346455e9.33.1774441280973;
        Wed, 25 Mar 2026 05:21:20 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:20 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 14/15] libftdi: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:40 +0100
Message-ID: <20260325122046.1211090-15-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125621

Use PYTHON_DIR for the correct libpython and include directory
paths.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index 6faab82ad5..931342186c 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -32,8 +32,8 @@ PACKAGECONFIG[ftdi-eeprom] = "-DFTDI_EEPROM=on,-DFTDI_EEPROM=off,libconfuse"
 
 EXTRA_OECMAKE = "-DSTATICLIBS=off -DEXAMPLES=off \
                  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
-                 -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
-                 -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+                 -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so \
+                 -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}"
 
 do_install:append() {
     # remove absolute paths
-- 
2.53.0


