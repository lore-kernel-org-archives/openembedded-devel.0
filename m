Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEA1CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:49:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22836.1764262198033733882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTt3pzrh;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1225637b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262197; x=1764866997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wA6/DgxEfoqkMlwDuVrhYbSkEicbNxn/rLkOVmdLP1A=;
        b=mTt3pzrhWljb4lEKiyMJ96QGST9S2RX2jsi9pfdBxQVN9bmYT1qMyAOO2InmmpSztJ
         FooDR9X/aA7YOoiC3kE3YN8P4/Oxs11cTFTKhdukYYuqPGSuoGeizbMP/iGDUf6rSytK
         5PN/7XXguXwOwN80CZrWk84rEENPeld+o6y6XNdG7dvZ9854Je/Xo/pznAV1bY/VD55p
         Dw2qR7PHaln+6R5B40ciMfEBenaaKxBlJxMundlczOs0s15hZ58MkDoOzuDTP9LN/CqW
         K1YTj4ilLmlUrToYOkuWl0XQgM1Ecni9DYUGTIr1iARkGxt2Bsp2IL4GhB3ensGPoX0X
         FCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262197; x=1764866997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA6/DgxEfoqkMlwDuVrhYbSkEicbNxn/rLkOVmdLP1A=;
        b=APrVxtrt4z98W3gdGanFbnQKKHsSGPKYQFHFOyGavvJZ/k20W1sVL7Ka2jREI/mUi2
         0sEvpL/qqkb5tOtl34ePafEHz+Y02+NPIryBL7MqzZ6oA4rb0LesOg0JWmg538/J5PZs
         wozV5aKVwGxBLkbA8+HYxWkQv+h4YUWblQBCjFBS4Am7PaghRaZJWJKG5RouSBmK2tTu
         wFWDVx+bXC3r4fxQv//w4EytSqHnNOFjBAHE/xH7jCABBz79eCWn5/SXsmbHw4jz+vw6
         MKOnIbssM5TDaSMhxfCfaVmbyn12a4ODZ1sTkV/xo7XB6hZrCdYcFghfK4hQ3qmZaGSh
         Py1w==
X-Gm-Message-State: AOJu0YyqPWYGCKSbMH4rWe1VB4u3+U7suvd7gG47BBl5kja61HPASXy8
	aWrjADTKHHREPp4MMxoiLHt8AA/FK45O9tUc+/LIoIcTpEszBsbrPn1WDLnWDKW7
X-Gm-Gg: ASbGncskQOpsgtTmmBxylbAuOpBDrmC2Tp/DDpsAX7pvhSm6Pdl96qkZAa+iEi+cbLW
	cvLZ/zka4bUkuxkpb+6vS1aJr+SVahn6vU9Qgxepl62X8g0rJ7K+NmPydav8UyJP2DZ9pnH144A
	EJARU1pfw7EBNZnCngpzh8zh+JMzjR9/ixhHCTzOkj0cNP531PkYYp0PaLwvTvebwemxmz3dr0z
	4SJTreAku4Qu5dhVsPVhgC++nEAqiLPVEMm9Em2PhESkB9cS4GT1sqVzQAVK+6MBNVW2gtR5+lm
	QgTokg4YHMsEbZUkSHxW2Df8vx6M9WkqO25UajWbgp5Quv1G9bDr3O0jhMXWSrW+Ru6VCg1mQ0j
	YnurCQiutBq6sZwr285rBCsFSml1wfO3+KCUgcJI5he+2DrRngvZoX6bUJ83uatA8exRvxljSvK
	TYO2Hvr4VynUQnTsYBwUBbSbXOQ6UwIHu0u/lBAIhvVPrd7nXtnNlvXpny50w0tD9om+YpEfalS
	qHPINE6wWVpAH+h4RZI9SkLSOGPL/MO+uEPJkG3gF8=
X-Google-Smtp-Source: AGHT+IG7OWx7thYF+szi96Mg64Kzdzl/ZYO+8uHWksjcm9dgJizdbwqQotztfrCSjRxziYWOCu8SxQ==
X-Received: by 2002:a05:701b:208a:b0:11b:b064:f606 with SMTP id a92af1059eb24-11c9d85009cmr12142360c88.26.1764262196977;
        Thu, 27 Nov 2025 08:49:56 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb04a07bsm7798028c88.7.2025.11.27.08.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:49:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++: Ignore CreatesGenericErrorWhenErrnoIsUnknown test on non-glibc systems
Date: Thu, 27 Nov 2025 08:49:54 -0800
Message-ID: <20251127164954.2305711-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 16:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122113

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...actory-test-for-musl-libc-compatibil.patch | 29 +++++++++++++++++++
 .../recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch
new file mode 100644
index 0000000000..118d84e290
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch
@@ -0,0 +1,29 @@
+From da0d6595c48905ec7d99f1a75878fbeb17972d75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Nov 2025 23:29:53 -0800
+Subject: [PATCH] test: Fix error factory test for musl libc compatibility
+
+It uses errno value 123456 in test handling of unknown errors. This works
+on glibc which accepts any errno value, but musl libc validates
+errno ranges more strictly (typically 1-133).
+
+Ignore test on non-glibc systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/unittests/Types_test.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/tests/unittests/Types_test.cpp
++++ b/tests/unittests/Types_test.cpp
+@@ -488,7 +488,7 @@ TEST(AnErrorFactory, CanCreateAnErrorFro
+     EXPECT_TRUE(error.isValid());
+ }
+
+-#ifndef SDBUS_basu // Creating error from invalid errno is not supported on basu backend
++#if !defined(S0DBUS_basu) && defined(__GLIBC__)  // Creating error from invalid errno is not supported on basu backend
+ TEST(AnErrorFactory, CreatesGenericErrorWhenErrnoIsUnknown)
+ {
+     auto error = sdbus::createError(123456, "custom message");
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
index 6cacb5dfe8..43646953f2 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
@@ -18,6 +18,7 @@ DEPENDS += "expat"

 SRCREV = "28b78822cfc5fbec4bd9906168493e9985f586ed"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch \
            file://run-ptest"

 EXTRA_OECMAKE = "-DSDBUSCPP_BUILD_CODEGEN=OFF \

