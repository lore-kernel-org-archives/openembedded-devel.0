Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D7DC48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 18:35:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.21013.1707590133165379926
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Feb 2024 10:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lk6cxD0P;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so16467495e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 10:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707590131; x=1708194931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZIeN1KiC/wZsg4tFBLYKfFxoHRIM48ipJMwmSt2hhw=;
        b=Lk6cxD0PhxSPqQdmiW3o3vGj7udlwZCiSxc6lbi6oy8A3DwO3x9cVE46x1sPbOPDdj
         v8+SbNt+vDjzPbFWL9DQkN82yeTt+fOtmPzGlmwC/lTBq2dbdKgeRpbHG0YdNLyc2a/J
         Cj9G+di4ZXMcvIYOO6sklbBKR5XXuPOjR4Lu/0vSFJYDpPFHdrQZYczuw2K1DSnANqLY
         Fdzvj978cfcAx+PPY5mL5UnlJ8FjlTZSOl4IiHxShYNCTaxXVAxCOpCAyezdRedSlmmV
         3Te9XeW0b0RiDvV18YIAbzNIsHEKm93cpkaWzsGPmRmjAlkC4qOlHqN+m389czrXLB8l
         QBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707590131; x=1708194931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZIeN1KiC/wZsg4tFBLYKfFxoHRIM48ipJMwmSt2hhw=;
        b=lpe/Ah123Va4OUJfXpK4azEs5aZnYq1adQQxy2e/4u5vdVwgzjc1P08t8Ke4tEMT2u
         7XV4jAuhzu93xPbG9lK8Os8uTKjXavbjal3YPcO9bGnQaScVN0nbLSvcIBqwDioTlqLm
         242SR3rmZUQi3EECGrxc6tm32RiL0SpR35c/iRjbWT/W2RK8CQG7qD7jEhDAaQyoJUVa
         XUFweQvvC+jaHCQm1JZ4OTdjYuUExZlCSfND7MWH0WhjprR3IPLXmInunbR/aBzSHXK+
         YTy2P19uooWTp0cFQr9InjSIwYpKzdFztLWkVSGZ80SQdDWokWCMkqhVFf28mU27F+6G
         a+MQ==
X-Gm-Message-State: AOJu0Yw6Onw4a3WzCex4kT5nW4N2GMu3OSyz8axuaMl/WP+EwjKHGgW/
	fLa7FGtTjJeVDSgdqloRWeBvussrROk8kWqtB4DooA/aFIUjwx09wEuSnV45
X-Google-Smtp-Source: AGHT+IFx7fyvwsaaPNa/Kw8DCpoTqCdw5ua5cEfY2bF/wV/vUlDwycVzVWLidzu0yn97vb2XFokKmg==
X-Received: by 2002:a05:600c:46c9:b0:40f:ddb6:a63b with SMTP id q9-20020a05600c46c900b0040fddb6a63bmr2270186wmo.24.1707590130606;
        Sat, 10 Feb 2024 10:35:30 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d016:9a35:28cd:913d])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b004100b3c41absm4008153wmq.30.2024.02.10.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 10:35:30 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] c-ares: Upgrade 1.24.0 -> 1.26.0
Date: Sat, 10 Feb 2024 18:35:26 +0000
Message-Id: <20240210183526.68684-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 18:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108701

Changes 1.26.0:

Brad House (14):
      update release notes format
      update format slightly
      RELEASE-NOTES -> RELEASE-NOTES.md
      test: fix outdated license headers
      no reason to include sys/random.h all the time (#684)
      Do not sanity check RR Name vs Question (#685)
      autotools: fix building for 32bit windows due to stdcall symbol mangling (#689)
      man ares_fds(3): mark as deprecated and add explanation (#691)
      fix doxygen typo
      Autotools allow make to override CFLAGS/CPPFLAGS/CXXFLAGS (#695)
      Event Subsystem: No longer require integrators to have their own (#696)
      adig: Differentiate between internal and server error
      Release prep for c-ares 1.26.0 (#698)
      clusterfuzz: enforce maximum DNS packet size due to long parser time

Erik Lax (1):
      Added flags to are_dns_parse to force RAW packet parsing (#693)

Gregor Jasny (1):
      cmake: improve some include related code (#680)

Changes 1.25.0:

Brad House (22):
      fix test building with symbol hiding
      ci: add test case for building with hidden symbol visibility
      ci: disable static for symbol hiding tests
      getrandom() may require sys/random.h on some systems
      fix support with older google test versions
      CI: Add Alpine Linux and old Ubuntu (#667)
      Fix bad stub for ares__iface_ips_enumerate()
      ahost should use ares_getaddrinfo() these days (#669)
      Connection failure should increment server failure count first
      sonarcloud: const
      clang-format
      ares_strsplit() rewrite as wrapper around ares__buf_split()
      clang-format
      Autotools warning fixes (#671)
      Old MacOS SDKs require you include sys/socket.h before net/if.h (#673)
      docs: host -> ip
      Autotools: rework to simplify and fix recent issues (#674)
      set winver consistently across build systems
      autotools: update logic for building tests to provide more feedback
      OSSFuzz: it assumes autotools builds a static library by default, which means the old autotools must have done that even though there were comments saying it wasn't.  Disable static by default on Windows however since it can't build both simultaneously.
      tests: replace google DNS with CloudFlare for reverse lookups as google's servers stopped responding properly
      1.25.0 release prep (#676)

Gregor Jasny (1):
      Fix minor warnings and documentation typos (#666)

Martin Chang (1):
      Use SOCK_DNS extension on socket on OpenBSD (#659)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../c-ares/{c-ares_1.24.0.bb => c-ares_1.26.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.24.0.bb => c-ares_1.26.0.bb} (85%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.26.0.bb
similarity index 85%
rename from meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.26.0.bb
index 3b3b2b83febc..450d466f4961 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.26.0.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
-SRC_URI = "https://c-ares.org/download/c-ares-1.24.0.tar.gz \
+SRC_URI = "https://c-ares.org/download/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "c517de6d5ac9cd55a9b72c1541c3e25b84588421817b5f092850ac09a8df5103"
+SRC_URI[sha256sum] = "bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.39.0


