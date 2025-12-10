Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D8FD3C54F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:13 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15631.1765373172598122894
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XCh+S+Qq;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34a4079cfaeso2382254a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373172; x=1765977972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skJPoO0Gk5kx3jFYrNQCbYzldwvQkfVq0AIub0NCCuM=;
        b=XCh+S+Qq0UQhbS2vWzuYNMw0YWQBi8cJS84ukV1OI5U1CyBgdxQdpyhH763NvCkZvK
         KwAl8d6r9KwaVGwTew0W6QGt0ktuuzwpaM0Va+FKTibm1i7racxpBdFHeTKU7TmfnuKJ
         VKMIsGvobjZMWX9SgIoNIQR2V2MSs6qQdJlF+NsVtXjWkqU4IvsPGU0E9IsGoU50fl1v
         /uQPBo4MJsH6NKI8OVxyL7Z9annin3z8fvUQLWTbyuxuK/qFPtKk+gMeXaGg23QaAnI/
         V94g3mh/k0wpoR987DILi6apm1KTmsXshW8/mhIVYFepvFgoSndNTtH4gyKXP/txvFUU
         tv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373172; x=1765977972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skJPoO0Gk5kx3jFYrNQCbYzldwvQkfVq0AIub0NCCuM=;
        b=sekklUaSe6LVlxMIQGTUTl2Q6+kAedcY+ObenOEdlBIhxwTKFUgtLUgBIiNuVjgQw0
         JU46WankT0+Eu37Qeby1bNqAGV2Uk1FcTwKU3mwjEstd7THodirH5NkllSjTIIS6YorO
         aFXdwpc/ytDSR4ZmpEG1f2PGeKm/jmwcHjfKm2zj2U3eJ7z3ylgE5lkBUjndMIlsBGdf
         0MZwGRAOaYKvzu9guiPcfv+vr4hvlQdmhDzA5md8PWLR+XytpSeJwr2ecGtBMHASho9k
         wOJYDU2kPXy/Hj57+1tze4pvdFyguII5lKFektQRmNliyrdt+Xw1ifL+zVKPMj/c4LMZ
         yCeg==
X-Gm-Message-State: AOJu0Yyd4kypVXuH6Hd/apfVxiCBlsr06Qcbqlocl3ly3PxUe5TJGHS6
	UhFQFeBRJ6aODXgne4fZ0+RVgXPtjcy+d8oXCpad2w18+jtZ2lSJl47ktVXiNA==
X-Gm-Gg: AY/fxX6DGI6ru0YNHz5tNw4DzO2zSggQ/ZP1Y7QFSCe1w2JRPzrOTmtySdCN878/ohB
	3MUjKvr/HqOWRtCBKdhQgz7WhFKaueAN3aKQ9QwihdM35bq4NbejQ+CZ4kxI4y9shqkfr1rkob+
	MxWdxb7d/4NchsgaK2CIjbGIg7buLvk4JBfoXkgtPRo0AIGSQRyYcsxK2ZuSCDYtf7vtHO1UNmi
	SBs2NfBYr61Oc/H/HP3UCeuDBxqWcMR8GwR+IR8He0F3t7uH1Nau6+CAbQezAS4UmKfQ+PdHLrI
	/DN6mFkdDtB30YTO3B3ueAw9dixT65di6vc+UxvtspKU1Br53+MUSg2z7Yt8KYqQJAwBEK4G1UI
	9iajeDwN42QrAg4yFItTjf8Po9cHC+n2LMV+SOodwd/f4DdkEl5ahz7rrbAIXsqCpWIXzhWyPFR
	fTrHh/vXYZzS5KXThg0TC7OGNrJAdknMrTNQ==
X-Google-Smtp-Source: AGHT+IFS++szpEa07TAB9NJw/purpStPbYAMTxkvNobQ/j6HmJaBc+4KT2MRy5hUfCGKprnHoDqm2g==
X-Received: by 2002:a17:90b:4ec4:b0:33b:ba50:fccc with SMTP id 98e67ed59e1d1-34a72837c9bmr2522462a91.18.1765373171737;
        Wed, 10 Dec 2025 05:26:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7092b1c1sm2550009a91.15.2025.12.10.05.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 21/43] sdbus-c++: Ignore CreatesGenericErrorWhenErrnoIsUnknown test on non-glibc systems
Date: Wed, 10 Dec 2025 18:56:00 +0530
Message-ID: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122525

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c6618c38daee4b108d804c3a9046b12d60a7e96b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

