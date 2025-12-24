Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A61E78496
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 21:15:36 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128085.1766610928732249634
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 13:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmWjaZej;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a137692691so71846385ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766610928; x=1767215728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ezXcdbUcJds6c3xvhN1z+po73csY5PAgpkQn4N/PCw=;
        b=ZmWjaZejQUW8qzbrRJaXLdrEbwU40kS7wKB7xNp0+qu5+RVh4MByk37D4as1UUAsbU
         6zS8JaZW7GHoM3snn37R5v0qh5y6zT2/qH18SAOLpXSP9CoKHcG8fWhZmqDVIGOKHvqg
         VYAs02TXLa61IqOfljtvMdEjz8N9QeC4J17MayhzuCCxcPRIOdM+I6rqJNwiT6Dxl2ue
         Uj5oKXpeXuPcvSPpFN5KVyknmLLUG5UEeRfNXtzw2+wBmGqH5+dPzAO55b7EHkNOEQji
         GUCqTzzVLd7qOzigRXBbxO3Y4LSBAFD/q1pO4wf42+aKAOkspwNaYSI/6EXT+11ZuuCy
         x57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766610928; x=1767215728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ezXcdbUcJds6c3xvhN1z+po73csY5PAgpkQn4N/PCw=;
        b=H47Fr4FmyRp1SDI+g+i+QpZl7Em3B/mvEXBkeMksXjo6FNg1NTeNcAxNTdql79iSTP
         U1AO2lDVm5LTnQCDLt8T8az505wfVS1+x82WKooqkr7mNBVWdBlKO0ggh+H2waabJFas
         QxwZdJktxwCh/NUh+hpks2NhHsoQlYGxR/c5wfigpKT2unQwxXHta69fpC4gmwaJ7kvJ
         DuyVqCLzo4C84hqw39LLhkXwoYc6u8SqbFP0Ye3lH47j25n4EsHZq6RrRviduWbuMPGC
         FPv8vVdvL4kRbsG2mS26Y5B+85fTy2Nk2ePXXwDr0ix2UkZaeh6x1LOe2yvqZtG2+uEg
         BvGw==
X-Gm-Message-State: AOJu0YzmRxvxqk8fJUEGQI4J3pnBCOgt7hjxo6Em4v9u70dPdzkoGHM/
	66JWLff2r/OWKRaZAoVAYqoV1hyzqb8U8tfVWu1lFhXXpm2ci/KM+M0VJwMoQDFE
X-Gm-Gg: AY/fxX7DTrBTeA20CGmhyF5Quj9O63OfJErGNQLKPQh2Uqsh42vE/aR9vliEgVq3k9u
	0fliDlc/+MQEAoQnTfegh+T2Gex3W63PjgWUXjbfSQh9IkL4RaIbLOpUsXWCbii+lf29cRaUg1/
	+WYbhb+a8QrpZmsJ+RBQiM04LXaXmMXzXKfGkjeMd66GAITFLeiMm7lAXjLr/dXY7GV9HiOkqa9
	rSg+6b+rGcmcWvHe9bfbvw8FWReak6uOZbcNL7WW/Hl30vWqXdXk4PP30pJy3h/1wGOHQpHDHth
	+SckCZndweivZAu3eEG64WT9iUNgg3j6BqmTel41DgDktIHd/cAOFHOMzA+Mc6a3KTq8zgYJT3Z
	NfFe0UrQqWIacLVgnenDM0tI1eJvkM6c7FF1yAVQ3s4m/LQrIPMwEUK++QcNETwQLzte8M2xjJC
	rHL3HIQ5x1PEnm/1UDvnKqku/w8Njt97/P4qPqGNPuwugNp2OOQOBl5yy4z3IPxxK4lJ1YKQtz6
	j3VA8+jiTa6fIqiIcGgKZpmVVcvz9cLWKqd7VhN3hI=
X-Google-Smtp-Source: AGHT+IEX3KNfetuxRdAZJ1Fb5kguqyMa67qSJ68GF/lxLH7fwefo8ZKD3JbIxvApFeiawEciRV+gmg==
X-Received: by 2002:a05:7022:799:b0:119:e56b:957e with SMTP id a92af1059eb24-121722ac244mr25367049c88.3.1766610927540;
        Wed, 24 Dec 2025 13:15:27 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::8429])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm72446579c88.17.2025.12.24.13.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 13:15:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rwmem: Fix tests to build with musl
Date: Wed, 24 Dec 2025 13:15:24 -0800
Message-ID: <20251224211524.1996247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 21:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122905

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rator-Use-own-generic-htobe-template.patch | 49 +++++++++++++++++++
 .../recipes-bsp/rwmem/rwmem_2.0.bb            |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch
new file mode 100644
index 0000000000..2a8f826b47
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-test_data_generator-Use-own-generic-htobe-template.patch
@@ -0,0 +1,49 @@
+From fd59aeedac8ab75d044026b8ff32adf9aa485dea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Dec 2025 12:56:14 -0800
+Subject: [PATCH] test_data_generator: Use own generic htobe() template
+
+musl based builds expose this build failure where htobe32/htobe64 macros
+are in endian.h and it needs to be included. However, there is a local
+template in librwmem/endianness.h that can be used for
+better portability across platforms which
+might use different C library implementations
+
+
+Remove this patch when upgrading to 0.3 since the v2 tests are removed [1]
+
+[1] https://github.com/tomba/rwmem/commit/f9e0bffacd7520ee8975c4a36a9d47292d145ae9
+
+Upstream-Status: Inappropriate [Use of these macros are removed in master]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_data_generator.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/test_data_generator.cpp b/tests/test_data_generator.cpp
+index 39e1322..94e732d 100644
+--- a/tests/test_data_generator.cpp
++++ b/tests/test_data_generator.cpp
+@@ -101,12 +101,12 @@ std::vector<uint8_t> TestRegisterFileBuilder::build() {
+
+     // Write header (RegisterFileData)
+     auto write_be32 = [&](uint32_t val) {
+-        uint32_t be_val = htobe32(val);
++        uint32_t be_val = htobe(val);
+         data.insert(data.end(), (uint8_t*)&be_val, (uint8_t*)&be_val + 4);
+     };
+
+     auto write_be64 = [&](uint64_t val) {
+-        uint64_t be_val = htobe64(val);
++        uint64_t be_val = htobe(val);
+         data.insert(data.end(), (uint8_t*)&be_val, (uint8_t*)&be_val + 8);
+     };
+
+@@ -169,4 +169,4 @@ std::vector<uint8_t> TestRegisterFileBuilder::build() {
+     }
+
+     return data;
+-}
+\ No newline at end of file
++}
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
index aea81ee23f..b89da34736 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
@@ -16,7 +16,9 @@ DEPENDS += "fmt libinih"

 SRCREV = "d8dda76a0d8bc3356120d087f783d237602e0278"

-SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master;tag=${PV}"
+SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master;tag=${PV} \
+           file://0001-test_data_generator-Use-own-generic-htobe-template.patch \
+		  "

 inherit meson pkgconfig


