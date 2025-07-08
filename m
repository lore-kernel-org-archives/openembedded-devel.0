Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9A7C83F12
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:03:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.14939.1751969029115688059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cwA3sMa8;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4547362e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751969027; x=1752573827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHMdY0R9I9IJBoi031gBJvSrEkIUVDFDVJqsdeUahA0=;
        b=cwA3sMa8la1N7GFArqWWZVlKzNa+JNcnXyqzzoJsHFs+wgNpPJBw5L6tiegxyHh226
         eIgQzw9lKh08GLT3zfFEVLMLVPbE4DZ+wWhi7f+vx43lNd76T4DapxJEcrPlJU7yHvMj
         HN4wKvuHnoXAqpqtIRZ09iZg+P93HV9KYR6Z7yzoVKPln4co0/yREMjm9MP2P6iiTWr7
         KDFhTdlbhOD356azExx0O4Qph4kQdnp1sODKA1GC+kOf6B1dpk3fOkCjQXqMDmAeXUUX
         bmArQcV30mMXygS4pF8T4D/e2ngCRtm0mMIjBSw+K610m6USlFWFo1SxEQ0+/qq1QyVx
         mn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969027; x=1752573827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHMdY0R9I9IJBoi031gBJvSrEkIUVDFDVJqsdeUahA0=;
        b=bqTaERJUCMVd15eHU3vdRm6l1Cb/9yis2+UPtMRVW3O0bi7q4OQomlRKtOfAnyWBHB
         3eYw+qzP1TVloE53BOTSkJ26aMyH/y1NICdcjdu9lrLBEVwP/7Ul5QDLB77r979uTCJJ
         62DpX9dgW5+aUsJ/IkXvIwWZ4icaCFbzpggaU7YC04Zovpzi9AM/wmkI5ES+BOUjTu/J
         n56qX8Vw2dJuT7zOC8cKc54NzywikXZnSU4WKaU6f29f66HROD26d2f7PsLGF9zI3xMs
         myUJPK6s07lyE2+dB0QWHhESno4IUK+wV9kO9fB8m4xvzDJQY7ZD864TeAayXOl5KnKu
         ZpHQ==
X-Gm-Message-State: AOJu0YyS830G+xRRPYeKtQs9KpZTPeqKvB8V/XgO9y/d9gmWSNxOIqCS
	UZYK+EhDBB/Vy/rh63COOp7z3Pidmgy5foPdvPDxZswBdgV3Hg0CPSD1YRvuYxXWj1LWX0+kiC2
	L4ffW
X-Gm-Gg: ASbGncuejLNDk8RTOdSL41jrpMQCez17ebDzKMJjD7yk3xYJ1JXtpYPHfgn7Ud/d/9Z
	imDovDTrCldEi8v0FgKt2kUplYUL/nCUrAhCN4NyoYoXJdQ2uGwjXRG2FL1v4hf88kOPEzyQy0X
	ZWwd+GGMt1IdaUNPtVMgypOGiafAarx5BAfZ6pfV5NInfXBIuDqHBe7bR9iEDJtyUke6P7JYDwD
	TwXhuPlDmX7Dvlbl31GJIj5f/z01FIcy0QXXV0WWyLu1ocyArPHhmhY6D5byByfX6aFekWSBvjp
	gPiMpkZrNK5IE0bEiVs5I8+fKObQSmS8J/QPnqfRw3tBYdKDkye3HUxGYHYQQS8hchEWCrGd3wr
	KbZUVx7O+QPO154PKdef7wPVD0pwD6Chp5QJDigI=
X-Google-Smtp-Source: AGHT+IHMdgEvONFpZfrCDFd0civy278MbcufApeGk4A+GtJBPdF/9gOd3zT3FX3HRFoWUiuf3X5+Rw==
X-Received: by 2002:a05:6512:2c8d:b0:553:2ca4:39d3 with SMTP id 2adb3069b0e04-557ab1135ddmr4288938e87.48.1751969027193;
        Tue, 08 Jul 2025 03:03:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d9013sm1623585e87.84.2025.07.08.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:03:46 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH 2/4] fwupd-efi: update from 1.6 to 1.7
Date: Tue,  8 Jul 2025 13:03:27 +0300
Message-ID: <20250708100330.138561-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708100330.138561-1-mikko.rapeli@linaro.org>
References: <20250708100330.138561-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118304

Remove upstreamed patch.

https://github.com/fwupd/fwupd-efi/releases/tag/1.7

This release fixes the following bugs:

    Fix compilation with GNU-EFI 4.0

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ..._binary.py-Use-env-to-detect-python3.patch | 23 -------------------
 .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |  5 ++--
 .../{fwupd_1.9.30.bb => fwupd_2.0.12.bb}      |  0
 3 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.30.bb => fwupd_2.0.12.bb} (100%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
deleted file mode 100644
index c362681421b0..000000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4c8f95fedecbc590eb7cd98aaf97912fa36b8f2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jun 2024 23:58:36 -0700
-Subject: [PATCH] efi/generate_binary.py: Use env to detect python3
-
-This enables python3 from native sysroot correctly
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- efi/generate_binary.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/efi/generate_binary.py b/efi/generate_binary.py
-index 443472a..a4611bb 100755
---- a/efi/generate_binary.py
-+++ b/efi/generate_binary.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
similarity index 90%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
index bbf2b1fdac06..d6ace116e789 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
@@ -2,10 +2,9 @@ SUMMARY = "EFI executable for fwupd"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
-           file://0001-efi-generate_binary.py-Use-env-to-detect-python3.patch"
+SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main"
 
-SRCREV = "58a2928f778278ab1f7f8fcddbab81ba587a8962"
+SRCREV = "cfd0be286a9b050c1aa4bfa3f0820256903a264a"
 
 DEPENDS = "gnu-efi python3-pefile-native"
 
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
similarity index 100%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
-- 
2.43.0


