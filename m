Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1FEC8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 09:04:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9257.1756458266652064944
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Aug 2025 02:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YX+293sp;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d0dd9c9229so217690f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756458265; x=1757063065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2qfgzs5jQk9KCrfh59snBjG0Y9VtRUGZyDXsKYUh7E=;
        b=YX+293spF8bXEsxdd0+aAogjK6L5yl7gLxVrKc4Jj0GFmXz77Vay+vJSJADTWB8ji5
         JEqRTEdT2f0FgmSd2zTfKQSLbGVOrPl2cRWaRNt9h5r8kB0vByGoxJzHcHj5ysrUovtT
         T/DMpw+bblbaP9ZOk3/YZGhMN5x5EtibvpnKN/64bbeih1L8TD85LMa4jMcDpOFDMJwe
         YSKzkoUAW7NvUWl4Hsn39PSv68hcFdK00JHslYlmEj72kjGredwB/4QOrE83/IrUSMfQ
         W1GiUlSKYRDVdsgxYD/bw5yGpUPN0+rGtjXGwEtNzH2lAU4YtjvpBpa1LgK0gxgwCD+6
         gN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756458265; x=1757063065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2qfgzs5jQk9KCrfh59snBjG0Y9VtRUGZyDXsKYUh7E=;
        b=sNXIOn75F1pAv/6Bi7pqpAfV3jF8vECWmMWj9esMhz87c1fxwsI7WoymDWxA3a8CQB
         npH9grQnjnxVervTZnNpRs/S9n9li0jBLQtJIFnNpy5JdSV0dQ6NnaJf0f89A0lCvhto
         hs3owY6hsYu0oQfSP6KKb8HdZ9zxcOXcd1QWKCgUbWFbETUncWJ/sApDZY44Vf1QZIBQ
         LZ0Q+UC/LvZv/gXrTc4PetWb+ERfhumGm2rygPQpaotcv+zVQlnGSTF+Hkn2gyJXLeEP
         0kEXDMMkOUiI5e3gpDtdAkjdMUOjqW6RwlgT14I5z48lsE5Z+dEFkjTkkKBO1i8hWzVl
         RJeg==
X-Gm-Message-State: AOJu0YzlgFGuTbY79PtIdElqZXwjJd8Avt107vetgUhhi2dNts3YGPmt
	YYKiqNO3XvAf+IHzFv9O+UeP4SzunxVrFnNBviNXWEeT1Iv4qvYaPPE20pGoFSle
X-Gm-Gg: ASbGncu2UXw/s0x+k8N8s39j0Sr9aMqXXBknggFM+74RSQzR9+RF/fjI2dxWUSVcm2j
	tX1aIMaA+naAunU0QTrzSOEYl+lgflpa46F3Ae7gSs9juMwvsHFscva1ZhHOy9DetjhmoMLxklr
	w/igdLqgRtTLHf9CZXG6QV3DvCmrL081NKK+hu+kWAituYqRkYjbpcAfOX678EKebj78BQsseFe
	7vd1P6e0SO2UMAIRx05AhaASFqZkbnVDxhUYXqveFTTP5020fIDP3jEGnkq/5V1vlMja4g30LJa
	v+il6lE2MYjZTkSdYW0bTkM+Q99zGZ3Vn9exOCq/qPsPo1E3/umyvHBZR4SGbxnBl3H2h4ekaj+
	3iKHT7dxCCkVX7V0EIWO3AvJXxo8NaeEGN9c4idV5EBlROwVTyTIJnq8e1PukS8vUUpC66m36X0
	jr
X-Google-Smtp-Source: AGHT+IHCJmrVdBRzw8g9hfbXdGavp5djMwTIEfnGOCVdO/4kpBLGqGvAOIwG6BKFYnJzhQbWLKJsxg==
X-Received: by 2002:a05:6000:2087:b0:3b7:926f:894c with SMTP id ffacd0b85a97d-3c5daefe265mr20315772f8f.23.1756458264400;
        Fri, 29 Aug 2025 02:04:24 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e50e30asm31117025e9.24.2025.08.29.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 02:04:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2600.120.12 -> 2600.140.3
Date: Fri, 29 Aug 2025 09:04:04 +0000
Message-ID: <20250829090403.49728-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 09:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119136

Also cleanup dangling comments in the recipe.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/mdns/0001-Fix-build-with-gcc-15.patch     |  2 +-
 .../mdns/0001-Use-secure_getenv-on-Linux.patch     |  2 +-
 .../mdns/0001-dns-sd-Include-missing-headers.patch |  2 +-
 ...02-make-Set-libdns_sd.so-soname-correctly.patch |  2 +-
 ...-make-Separate-TLS-targets-from-libraries.patch |  2 +-
 .../0005-mDNSCore-Fix-broken-debug-parameter.patch |  4 ++--
 .../mdns/0006-make-Add-top-level-Makefile.patch    | 14 +++++++++-----
 .../mdns/mdns/0009-remove-unneeded-headers.patch   |  2 +-
 .../{mdns_2600.120.12.bb => mdns_2600.140.3.bb}    | 10 +---------
 9 files changed, 18 insertions(+), 22 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2600.120.12.bb => mdns_2600.140.3.bb} (90%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
index af33d5444cca..038615538d53 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
@@ -1,4 +1,4 @@
-From c84f185f29d0839b97177aecb0a78b9717947973 Mon Sep 17 00:00:00 2001
+From 4f7a50fa0b9ecc177a54e84eca3c98207cb623ac Mon Sep 17 00:00:00 2001
 From: Nguyen Dat Tho <tho3.nguyen@lge.com>
 Date: Wed, 9 Apr 2025 13:05:24 +0900
 Subject: [PATCH] Fix build with gcc-15
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
index 242aa7f7d819..2b75f2908837 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
@@ -1,4 +1,4 @@
-From 1bf3be6cd775635aed95689f97a13fa6a037c741 Mon Sep 17 00:00:00 2001
+From 3d4d517fe8924696584e84b953ab22f496b371be Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 27 May 2025 13:33:30 +0100
 Subject: [PATCH] Use secure_getenv on Linux
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index 651879ea8695..94b2ce8ab2da 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -1,4 +1,4 @@
-From cdbc28c668dd627906f833f9a8e32ac53b0b0139 Mon Sep 17 00:00:00 2001
+From 2e18dbd9c8ff3e48270fde2ba46b44e94ebdb439 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 4 Nov 2021 07:31:32 -0700
 Subject: [PATCH] dns-sd: Include missing headers
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index abe8178f6320..48f18f1f039b 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -1,4 +1,4 @@
-From dcc1f39a0918cdebf53ac7c105b3d33df960ed14 Mon Sep 17 00:00:00 2001
+From aedffca94035f7a16303fb4f90cba19c0df1ca2e Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:12 +0000
 Subject: [PATCH] make: Set libdns_sd.so soname correctly
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index af27a89f4c67..b07720b35ef9 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -1,4 +1,4 @@
-From f7ee12c1f8e85b9d2fe4023b6539c8051dc710c3 Mon Sep 17 00:00:00 2001
+From 74f0969c4f092d92c4fc6440c27707c2a5cbfe97 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:26 +0000
 Subject: [PATCH] make: Separate TLS targets from libraries
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 7d8f04c9027e..42d0e51c5413 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -1,4 +1,4 @@
-From e79f75487e32f87677519ec40c021b1623395bde Mon Sep 17 00:00:00 2001
+From 224884989226b9d7980c0f09d895c3e0dc48c47a Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
 Subject: [PATCH] mDNSCore: Fix broken debug parameter
@@ -10,7 +10,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
-index ad9eaa37a82a..fc51e1ad9bd4 100644
+index 2a6f9d5b28f3..2bdd78e351d9 100644
 --- a/mDNSCore/mDNS.c
 +++ b/mDNSCore/mDNS.c
 @@ -11046,7 +11046,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
index 5f8f428302da..01afa6fea571 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -1,4 +1,4 @@
-From a1c982808ebfb71ba7e0f16040013b7127a6e2ab Mon Sep 17 00:00:00 2001
+From 41819656682c8ab68d1181a5ee39634df7630de3 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 6 Dec 2022 13:28:31 +0000
 Subject: [PATCH] make: Add top-level Makefile
@@ -8,15 +8,19 @@ Simple top level Makefile that just delegates to mDNSPosix.
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
- Makefile | 2 ++
- 1 file changed, 2 insertions(+)
+ Makefile | 6 ++++++
+ 1 file changed, 6 insertions(+)
  create mode 100644 Makefile
 
 diff --git a/Makefile b/Makefile
 new file mode 100644
-index 000000000000..feb6ac67ef47
+index 000000000000..2fe39ad8938a
 --- /dev/null
 +++ b/Makefile
-@@ -0,0 +1,2 @@
+@@ -0,0 +1,6 @@
++# We install a stub Makefile in the top directory so that the various checks
++# in base.bbclass pass their tests for a Makefile, this ensures (that amongst
++# other things) the sstate checks will clean the build directory when the
++# task hashes changes.
 +all clean:
 +	cd mDNSPosix && $(MAKE) $@
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
index e8785b1aa7ed..ebebeb27f033 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
@@ -1,4 +1,4 @@
-From 8e32fb0876a073c23ab73047a2e0f6d011b3660c Mon Sep 17 00:00:00 2001
+From 43b82963a79250b19c94e15d0a86b04a5cffc0e1 Mon Sep 17 00:00:00 2001
 From: Beniamin Sandu <beniaminsandu@gmail.com>
 Date: Thu, 15 Jun 2023 17:02:58 +0000
 Subject: [PATCH] remove unneeded headers
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb b/meta-networking/recipes-protocols/mdns/mdns_2600.140.3.bb
similarity index 90%
rename from meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2600.140.3.bb
index f7c8f178005d..d7f2335747bc 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2600.140.3.bb
@@ -18,15 +18,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://mdns.service \
            "
 BRANCH = "rel/mDNSResponder-2600"
-SRCREV = "3a0deda2995d98243dae379bcec10e57928c15e8"
-
-# We install a stub Makefile in the top directory so that the various checks
-# in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-# other things) the sstate checks will clean the build directory when the
-# task hashes changes.
-#
-# We can't use the approach of setting ${S} to mDNSPosix as we need
-# DEBUG_PREFIX_MAP to cover files which come from the Clients directory too.
+SRCREV = "62914d23f299cf336a8647fb3a1b5b78647b3b41"
 
 inherit github-releases manpages systemd update-rc.d
 

