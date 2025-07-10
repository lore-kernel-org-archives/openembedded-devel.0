Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D78C83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 08:55:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.4084.1752137699202921857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 01:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hcMK+9qd;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55502821bd2so684562e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752137697; x=1752742497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdU5q4lZOmkYMwbKQHC7N2wUXtOtyiz0+Xsz2Gw/ggQ=;
        b=hcMK+9qdzeO/Qbcp8Rk0rralYwxVmrkK7JUIKCS/k7c5G4u9qsf2m3kKCVGZwg3x5U
         6S6xuBxaA4jf+Du782cTT1Q/NRXqKwGzA0hrm9Y4SQQu/XO5qrw9xijgffMVLU7bE5Yi
         /eZ2P8CF4qS87e1lHBcjIiFoWLQ+XbROCRfQoc2fvnoaPnBLgaS4/kvNy1pKMKQwWdWb
         4iLowAZLYZ4kANwRK085Ha2FIWGzK4DhsQVjZIn6QPPQctRcF8vJFNrD1f+ZKNwkAE+J
         i4XFgd6yO7LrnayTAVpzVMBm8a7ii7mxuV4aMvs7OayBoToJ+GEBQPQcwOcfuDvd0lqD
         I4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137697; x=1752742497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdU5q4lZOmkYMwbKQHC7N2wUXtOtyiz0+Xsz2Gw/ggQ=;
        b=NwsX85rvMPf7kgC+l3QzCB3Y9gZE4F1k3ZA0xQh7f8I3K4HBFpmjIc4teFu3lXk8SD
         oS+82mlMdb8xzP1M30zsfAKCjM1TVkqKuH/cQYLmAofbagTgIM0wijpRZ+dMGqUDUdVL
         Z7wkAVWyw2QSILWBH5ydC2o9fgOPzhIbR2vgItb998HA/MwRISMAb0RY8FmuxEOWiLpk
         wajQ9wv8tSRlrO3ZmcCN5v2n5oisOXuBThek/TqCWTGHXJ7SKgrwadcdD17NAMR0ITUE
         6EfwACVPk732GZLrizTCk7LBhJzqitKxFfzRGDHtWwUHBsjWMv4PXp0LCPZWuPNhh3sX
         CP+w==
X-Gm-Message-State: AOJu0YyrI1/XdMvOJ/ZYniP0fdQ8lY0sadPG9C2PhiwQDmDl7eS2j0P6
	SnK0unvdy8Tb+fyjtwR7AlQ8OTvi4WH+HrGwcTsbQN/XVKNtc/VU/CfWVyYrZRptu/upQxXkQ3f
	7gnu8
X-Gm-Gg: ASbGnctFrnXmu7aGJGgO/1BpUJs9l74HNLHZI5/MNoqK0uG/A7O7V1IXAxB3wje9sda
	kUdXuj9WiSbe7G8tfJSWofC7/jo7sPXoy6i48KsuXYpKblxAnZuFHvMpJ/2xNwoGRNgUS/h2nlK
	qWyiQMCUssycElPdfMT58R1lk+9HfJFtvymmXEs01oAF3LJJxPhyZdSUQyZYUty8oO3Uq7DK2HL
	z830S5T8M7iUEPaoVRZBelZHxGCt1KgOjCX7tazBvQ85md1RV+iiJEjvn4KfoOvGAKB1ldpUDd8
	tnD/mherj3kix3TAwcWxwij0K/NqFiuaJf52aFA6WWykG0fRhqk2lQcC4ZqOO+bVyFrYuzRx0wk
	oqWlxmfqbpjpMByo5OByWm1zjBzP8+kzxfBURmDWIjO+5TJ2S9g==
X-Google-Smtp-Source: AGHT+IHi+AoOLcmjm2l3rkFuclzlwycaweNSvVD4Nz2t+6d6FKupfWQZ059Jz0DCLbJFmLh+h2I6tA==
X-Received: by 2002:a05:6512:1321:b0:554:e7f2:d759 with SMTP id 2adb3069b0e04-5592e3e2a84mr576649e87.28.1752137697282;
        Thu, 10 Jul 2025 01:54:57 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6bb33sm282286e87.174.2025.07.10.01.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:54:57 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/4] fwupd-efi: update from 1.6 to 1.7
Date: Thu, 10 Jul 2025 11:54:36 +0300
Message-ID: <20250710085438.270911-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710085438.270911-1-mikko.rapeli@linaro.org>
References: <20250710085438.270911-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 08:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118401

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

v2: no changes

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


