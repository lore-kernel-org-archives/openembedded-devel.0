Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C11CC5AD7B
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:50:59 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48481.1786427451484306166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kjUrAsf/;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80cebd41372so37825197b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786427450; x=1787032250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0zan8fT02rzPYfrQamfrz9qIH3JWXPpC3vBbp4cmT8=;
        b=kjUrAsf/fjxzZTopaYGdS7uQelONKCZdFC6jZaoYRYE3BoyLMaRafLqmq1R+YQiXYK
         D0FoQff0u1jffHdyG2jYpnn2yOxOJudJhvBTJ3jGPpnKvGn5Iqt2zmkYYM/SRN8Zgpu0
         XU30N5SKoy7oA19C/iAcO5X3LoZjdOktj9VQ2Bl9uZmf6Vw9ODuL9+KwnoX3Ab5esGto
         F9ZOJXawaT6yVIkUWzEy8kR2sOO7+bBN52vIj4x9R8vrSVvVs8cB0gVCmrW0rxZDLloS
         sfLh0UtvrFBqepazEsfWBkuxt/iPtS7b1Z6SZ92iZXCLpHF126+BUTjbQT4+gJEMseJ1
         G3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427450; x=1787032250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0zan8fT02rzPYfrQamfrz9qIH3JWXPpC3vBbp4cmT8=;
        b=EkjIsVKht4/K6O/cEoHX7+DjsS746z6iiilgX1JRQAdk9TJHd5ZscIZyZgv+ZIfCf8
         kPRBkxAaTyJyB7JD+/Y4e8KXS1rjZxjszKuUWtJIsGXXMHREMtXmd9z8reSW/zxQN+y2
         jC7+IF+AyQNAFckWAQR9/kPGnBgDjCzr4z/3P4BnruDOWfFvsuCwccI5o+UT6cEj8T9B
         ozL1udrvrJe3y3BK9U1Tq4Xf0BWbQJLVzdOzMZPtpWHo621QUER+iDvhff6mkK7ZC2p5
         ewfc5Ls3pShQhdvftjriOinkTpB8Ywc6aMlggcpIEb/P3MgJcywYiisSu6sQsqv1wpfk
         r+fw==
X-Gm-Message-State: AOJu0YwwgmM9RTb5SIAUCSAgJ7Yu1WbSRzgVNE7LUBZ9KnlZTYzqmi4q
	sC5zlYnoDVn9+IJLp3gJeIpWb0uQC/0d2w50/507m3FrSOiFTENYPFQDnJ+DmTfw
X-Gm-Gg: AR+sD109hW4JcMj2h6cewBEEMirjT4GxSvzykufU07LgIVcFi9f5gybWdNv5mrzsJIQ
	FIopS7jYieLpIyrVTUlJGWxIEVV3PwrISUzf4Xa80b5irKxi7txTJpSJvMNUNMoiI74E4D2PHTG
	CRYLG6ckimbR25t3UdsOONaxDZtyrYAmZvLLV9Zhpt/dsX86bdbfZEwfGfikh22bBfOwPUgEh5S
	EMaNmdEqI1hauSy4vrQuL50i4USI1LFKriRPFOOhhC9gtBACSv/63g2VOcoBBPRLz1ubBpvRriz
	GC3BfP81HYCKpgdsUTtdrcrBy5E8sfTfpZOl3xmutIgyscys6gE8M3ABmWfkZKmGEO59CnwGI05
	P4DETYLmKC7h48cuBBi/Q7gPiQIYHwHd9xuepS2OH6LrfryyNYrrRNiWMpDKuidVIKxFhP/WNQT
	ZSoU412IDcDhNQUCQN/Uah91rGhvs8BTL/Y+OYVFwbt9FZ+ILT8oW1cqWIQd8hAv92uXaMHl92F
	sMXrSC6xZzTJ4e5fj/mAgbeomJt79SZ1WZKG48vN/4BAdAvNdlnW+CioqwQ6zQ4U3JqeYt6hjdt
	Odya1OiDWTO2+2CTI1GHJnuCIttilYEiANoQwM5kTiI=
X-Received: by 2002:a05:690c:909:b0:81f:64e8:9362 with SMTP id 00721157ae682-82f2adeeaffmr4343857b3.16.1786427450167;
        Mon, 10 Aug 2026 22:50:50 -0700 (PDT)
Received: from localhost.localdomain (71-208-30-139.ftmy.qwest.net. [71.208.30.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82ec43b384bsm3861597b3.38.2026.08.10.22.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:50:49 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH] python3-charset-normalizer: add patch for setuptools version
Date: Tue, 11 Aug 2026 01:50:21 -0400
Message-ID: <20260811055021.965988-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128915

The 3.4.9 upgrade dropped the setuptools uppper-bound patch because upstream raised its cap from <82.1 to <83.1.  But oe-core ships
setuptools 84.0.0, so do_compile failed with Unmet dependencies: setuptools<83.1,>=68 ... found: 84.0.0

Refreshed patch to match 3.4.9's pyproject.toml

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../0001-pyproject.toml-relax-setuptools-upper-bound.patch    | 4 ++--
 .../python/python3-charset-normalizer_3.4.9.bb                | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
index 8d9ee26d8f..508debc340 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] pyproject.toml: relax setuptools upper bound
 
 OE provides setuptools via DEPENDS and builds with --no-isolation, so the
 upstream upper cap on setuptools is spurious and breaks the build whenever
-oe-core ships a newer setuptools (currently 83.0.0).
+oe-core ships a newer setuptools (currently 84.0.0).
 
 Upstream-Status: Inappropriate [oe-core specific setuptools version]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -19,6 +19,6 @@ index 1111111..2222222 100644
 +++ b/pyproject.toml
 @@ -1,3 +1,3 @@
  [build-system]
--requires = ["setuptools>=68,<82.1"]
+-requires = ["setuptools>=68,<83.1"]
 +requires = ["setuptools>=68"]
  build-backend = "backend"
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
index 70dcb9e158..6df52a23d4 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
+SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
 SRC_URI[sha256sum] = "673611bbd43f0810bec0b0f028ddeaaa501190339cac411f347ac76917c3ae7b"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
-- 
2.43.0


