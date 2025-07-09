Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9F9C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:57:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7794.1752094666036027399
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 13:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j7IGMD6N;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3220c39cffso407101a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752094665; x=1752699465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQajb7cBCvv8R7JCyIy6Mpi1Ev5N6bV8/w3a82Jr7No=;
        b=j7IGMD6N3YGuS7SDUQGfFHZjKSKbE2b0Io6MOi1RnfsKRznW6bSA/INZ9wTEUgc4kv
         vSrIxj6HfhNHcdD0K+qF6P2t3vV5mXUYUIxhrNuQqazjOUlVfzp+j8cwS7dUmVO2yT6g
         PQFlShD5bPQ4q3RY/UDHC0QBaXVNVDEgA6nCRPMobHCErHCJ5//vbGxXlMBfymMhjdzE
         W1fl1HXIYtaOS2qZ+qFsbFQmUf1gH0hlN2WzTeghVVlf3m75xzhjfLyuZ55mIiuWtckn
         f5OEFP01jgrTyT+O9Q4HFHY6ywmUl356JvJHWmyc/OHpoWsO5tc+1L3QNnzNHIWVj91U
         Qcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752094665; x=1752699465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQajb7cBCvv8R7JCyIy6Mpi1Ev5N6bV8/w3a82Jr7No=;
        b=irt58KlvvpqsCERurM8FUozWiycwVnGEJ0epEI5FApCRVVCdR9sO9h6a9GZH740w5a
         3zwlEzeEHFuY35nNwZVrvCCOhgVHk4eruLRgZ2Rrh1rwVIk9eenadkqIifAbHmpb5cfo
         TR9tsi/BwXfcea6XgkrZz3CYdqdjrDqlGuKJpC3zpJ+JnGy3qMl4zRkXWLDHgeckRoBc
         LTLWBVjZbqbb4xVqspDZlTOkClS0WliGfe9n1gdSyC3bL5Izh0ibFN7l+YtIS16cD0ZO
         vhqsaJb+TGUCENAVtGyxlUZgLTE6a4wTY+BP5WhFBkd5A58ueNGw3LmhL1l526AVByDS
         Oc5g==
X-Gm-Message-State: AOJu0Yw9UMDbyTimOyeEhT0LvnbmaTo+4qjNoaFoKJeE509X3YEgjOUN
	zz8LtBkh7FPNZzzQdxry7Yn6wRFZdCtQM0zoMaETnvvJc96K3xgFDxK4THpwg7T5
X-Gm-Gg: ASbGnctAVN8YKsmv5iZkbnB5EgOQDmkdWu+7v2kidwB/XPGQghfrTcMPAxutHP4CFks
	IYKq6X+OxhoKunE3S3/4guQFz0dtWnJrwsPIG8jVAnRSZG4oxblTUvoV3kSiQtz397Oo4iYN+mu
	KtTEmWapaOD3pS2Xb288gZVHKYEztOF8Cv9dery8smiRbs1ZjYQikiUEYyFM57WifQH/JjsJ7rX
	+WL4j5tGxYq/jnNveORVXesANfFh5Z6GtVpP/gHFZnfNrbYVWWiKvIUCNUUrANjPYPGY9fT3tkB
	5fxyYfc/SRmaDkvm70sJqT/WclXC4izaxb5bWbuX+lnzwpJcm8izoREi7DlIAMQF
X-Google-Smtp-Source: AGHT+IE0Uodme2M1IxWfKQlzh/uFiFmMzcTs/rFZp8wYQ2qh6znJCATtQ5D5yMfcvv1C5lGH+UzCbA==
X-Received: by 2002:a17:902:ef0b:b0:235:cb94:1399 with SMTP id d9443c01a7336-23ddb1dc490mr73827985ad.6.1752094665019;
        Wed, 09 Jul 2025 13:57:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de432317bsm691215ad.108.2025.07.09.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:57:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] apitrace: Link in libatomic for 64bit atomic builtins
Date: Wed,  9 Jul 2025 13:57:42 -0700
Message-ID: <20250709205742.1872817-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118385

Fixes errors e.g.
riscv32-yoe-linux-musl-ld.lld: error: undefined symbol: __atomic_store_8
   >>> referenced by unique_lock.h:0 (/usr/include/c++/v1/__mutex/unique_lock.h:0)
   >>>               retrace/eglretrace.lto.libretrace_common.a(retrace_main.cpp.o at 399912).o:(retrace::RelayRunner::runRace())
   >>> referenced by retrace_main.cpp:1218 (retrace/retrace_main.cpp:1218)
   >>>               retrace/eglretrace.lto.libretrace_common.a(retrace_main.cpp.o at 399912).o:(main)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
index 1e41548c9b..83e2971552 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
@@ -26,5 +26,6 @@ EXTRA_OECMAKE += "\
 EXTRA_OECMAKE += "\
     -DENABLE_STATIC_SNAPPY=ON \
 "
+LDFLAGS:append:riscv32 = " -latomic"
 
 SECURITY_CFLAGS:toolchain-clang = ""

