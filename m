Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6BECCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:07:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17549.1761217654157782867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TmnvJI5g;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4710022571cso6807455e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217652; x=1761822452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpCUJHLRunt02Y88TslGGf7CNV1KtvnbGNWxE4o6TiU=;
        b=TmnvJI5gButqR3PdOJaqsZWtCZrrk6k9KojR//CJNzjokXNRfBy7AbZkq6V8jo+QDw
         pf/pibvEdJItkb5FcvfxqiUNHEmRsGFu7JJZYh/5ux55wcjG75LSadRB1jEMKEvZpHwf
         W5KhmwNQvcqLSGn/M+3Z0D7E09GL546jWn6KiyrcUGymVXGqthgzV8AfWd2zCgalMBu4
         1JtekZ8w4sf1tHUbtWtY5HGMKhw+dB90xKVMtfHUaH9bLRGDklV7P5nwTnsUJ2mScVeU
         xJVyMqzOsqZGrerb1yq+/nOSXAjpA02euapXZ57rSwNbjzXqOrzaHXjJkzC5bht5HNb8
         hQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217652; x=1761822452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpCUJHLRunt02Y88TslGGf7CNV1KtvnbGNWxE4o6TiU=;
        b=Yyn+qi81vSGyT5QwsB+iHJt/REg534hvvXfLXoZrpknNBaTVU4rowdmIOjOu8tHUMt
         VkarADd1wdlbo7f8uIFdpkS4AuTdmVbyq7swD98QQy8IbcVyqsjtHxAkt2IYYcSOMLiJ
         ydZJtcwHzLNO+YHdFtTbtVyudKZmxkBF3lTJrxx84IReUqAXzf4bOG9Lls2pUkpuEUk8
         f4l9PRUkK+50O+uMd9ATOHNt45BhpKvp3+Asz2kPZQNTFSgkBsBVgpRbZZN50cZivC9c
         m1KXHbYEM1SQVp3lG3dAVo1JhDeHD7VG2FlO0otInPUhfH3SFGqHnDp40SGqxOeAzZuM
         arYA==
X-Gm-Message-State: AOJu0YxEenXwV6jRVS/9HA3BCtPib18HRhN/TfKjPwZbreVjjssakMKN
	Vq1kZ+pbWmBdsHlA2X4uABeLyzj6pMrjZQ2c8jaHFox9VDnpz64Ok879xGgjbg==
X-Gm-Gg: ASbGncuAePQQ3X6a4geLiWizPaaLxwiRJ6DP3L2Dex7yrgn+5zWFytKW4EEiVhytx5L
	F16sLz2dzxsDdcClVhT1wM1LLxk9x6dPACqAn7Ke5PeTlDV3MN2cVvLvqfTApzx26umhMqiCaxD
	eDrvFpveZR9afsRqZiuVhqbqVz0jhD/9w/RXKxODiX/+brhhk774JnGWSshTy3Hh9uoL20ouEJR
	zJSNHh7X5vtrAsH4ZAZoKyc28F9l92FvSO49nr3hyHaRXlxfoCyMFUb0nXD9/YJldUYFhWSsv0A
	9JtSv/yjp8ma8JGOQueg/2zy7Skt5SkV1ML3BC67xDsrwlNZ9EnSP1Bnqe5O6r5GbeJQhmpa0q5
	EkzWLqTPpfWVGn8gcT8TlfAeOTKkBjwsMuo1c51+zRLI7XpJ+ZuKnkj1uiMk+H00G15Z4FNJtrk
	41vDxyf5mdZ96F1jfdYBb3fdpjBdr/Zwr9aWF2rFozU435c/jxLbVJpuspfhHQ
X-Google-Smtp-Source: AGHT+IEbWx+vdmByGSWrpJvG7oEdBvcvoYW60UgVXTI/veatw0TY4Wtqcf5yuog6JcgKB2NasHud4A==
X-Received: by 2002:a05:600c:3e07:b0:46e:4783:1a7a with SMTP id 5b1f17b1804b1-471178705bbmr183512975e9.3.1761217651836;
        Thu, 23 Oct 2025 04:07:31 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf4642fsm29940735e9.17.2025.10.23.04.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:07:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2600.140.3 -> 2881.0.25
Date: Thu, 23 Oct 2025 12:06:15 +0100
Message-ID: <20251023110614.889728-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 11:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120933

Convert systemd unit to use `-foreground` option removing the need for
the PID file. Also fix `Pending` Upstream-Status to make clear that
upstream doesn't take patches.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/0001-Fix-build-with-gcc-15.patch     |  2 +-
 .../0001-Use-secure_getenv-on-Linux.patch     | 30 -------------------
 .../0001-dns-sd-Include-missing-headers.patch |  4 +--
 ...ke-Set-libdns_sd.so-soname-correctly.patch |  4 +--
 ...-Separate-TLS-targets-from-libraries.patch |  4 +--
 ...-mDNSCore-Fix-broken-debug-parameter.patch | 18 +++++------
 .../0006-make-Add-top-level-Makefile.patch    | 14 ++++-----
 .../mdns/0009-remove-unneeded-headers.patch   | 30 -------------------
 .../recipes-protocols/mdns/mdns/mdns.service  |  7 ++---
 .../{mdns_2600.140.3.bb => mdns_2881.0.25.bb} |  6 ++--
 10 files changed, 25 insertions(+), 94 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_2600.140.3.bb => mdns_2881.0.25.bb} (95%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
index 038615538d..af33d5444c 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
@@ -1,4 +1,4 @@
-From 4f7a50fa0b9ecc177a54e84eca3c98207cb623ac Mon Sep 17 00:00:00 2001
+From c84f185f29d0839b97177aecb0a78b9717947973 Mon Sep 17 00:00:00 2001
 From: Nguyen Dat Tho <tho3.nguyen@lge.com>
 Date: Wed, 9 Apr 2025 13:05:24 +0900
 Subject: [PATCH] Fix build with gcc-15
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
deleted file mode 100644
index 2b75f29088..0000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3d4d517fe8924696584e84b953ab22f496b371be Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Tue, 27 May 2025 13:33:30 +0100
-Subject: [PATCH] Use secure_getenv on Linux
-
-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSShared/dnssd_clientstub.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/mDNSShared/dnssd_clientstub.c b/mDNSShared/dnssd_clientstub.c
-index 6667276ee33a..e7b51813664e 100644
---- a/mDNSShared/dnssd_clientstub.c
-+++ b/mDNSShared/dnssd_clientstub.c
-@@ -801,10 +801,14 @@ static DNSServiceErrorType ConnectToServer(DNSServiceRef *ref, DNSServiceFlags f
-         #endif
-         #ifndef USE_TCP_LOOPBACK
-         char* uds_serverpath = NULL;
-+#ifdef TARGET_OS_LINUX
-+        uds_serverpath = secure_getenv(MDNS_UDS_SERVERPATH_ENVVAR);
-+#else
-         if (!issetugid())
-         {
-             uds_serverpath = getenv(MDNS_UDS_SERVERPATH_ENVVAR);
-         }
-+#endif
-         if (uds_serverpath == NULL)
-             uds_serverpath = MDNS_UDS_SERVERPATH;
-         else if (strlen(uds_serverpath) >= MAX_CTLPATH)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
index 94b2ce8ab2..5464e3febe 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
@@ -1,11 +1,11 @@
-From 2e18dbd9c8ff3e48270fde2ba46b44e94ebdb439 Mon Sep 17 00:00:00 2001
+From cdbc28c668dd627906f833f9a8e32ac53b0b0139 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 4 Nov 2021 07:31:32 -0700
 Subject: [PATCH] dns-sd: Include missing headers
 
 Fixes build on Musl
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  mDNSPosix/nss_mdns.c | 3 +++
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
index 48f18f1f03..f547c64d93 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
@@ -1,9 +1,9 @@
-From aedffca94035f7a16303fb4f90cba19c0df1ca2e Mon Sep 17 00:00:00 2001
+From dcc1f39a0918cdebf53ac7c105b3d33df960ed14 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:12 +0000
 Subject: [PATCH] make: Set libdns_sd.so soname correctly
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/Makefile | 2 +-
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
index b07720b35e..2969b5e244 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
@@ -1,4 +1,4 @@
-From 74f0969c4f092d92c4fc6440c27707c2a5cbfe97 Mon Sep 17 00:00:00 2001
+From f7ee12c1f8e85b9d2fe4023b6539c8051dc710c3 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 15:14:26 +0000
 Subject: [PATCH] make: Separate TLS targets from libraries
@@ -6,7 +6,7 @@ Subject: [PATCH] make: Separate TLS targets from libraries
 There are dependencies on TLSOBJS, which fails when `-lmbedtls` is
 listed as a dependency, so separate it out.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSPosix/Makefile | 14 ++++++++------
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 42d0e51c54..0c1a9f373f 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -1,22 +1,22 @@
-From 224884989226b9d7980c0f09d895c3e0dc48c47a Mon Sep 17 00:00:00 2001
+From e79f75487e32f87677519ec40c021b1623395bde Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Mon, 5 Dec 2022 22:49:49 +0000
 Subject: [PATCH] mDNSCore: Fix broken debug parameter
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  mDNSCore/mDNS.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
-index 2a6f9d5b28f3..2bdd78e351d9 100644
---- a/mDNSCore/mDNS.c
-+++ b/mDNSCore/mDNS.c
-@@ -11046,7 +11046,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers(mDNS *const m, const DNSMessage *
- #else
+Index: mDNSResponder/mDNSCore/mDNS.c
+===================================================================
+--- mDNSResponder.orig/mDNSCore/mDNS.c
++++ mDNSResponder/mDNSCore/mDNS.c
+@@ -9481,7 +9481,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastA
+                         {
+                             CacheRecord *negcr;
                              const DNSServRef dnsserv = qptr->qDNSServer;
- #endif
 -                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, currentQName, DNSTypeName(q.qtype));
 +                            debugf("mDNSCoreReceiveNoUnicastAnswers making negative cache entry TTL %d for %##s (%s)", negttl, currentQName->c, DNSTypeName(q.qtype));
                              // Create a negative record for the current name in the CNAME chain.
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
index 01afa6fea5..5f8f428302 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -1,4 +1,4 @@
-From 41819656682c8ab68d1181a5ee39634df7630de3 Mon Sep 17 00:00:00 2001
+From a1c982808ebfb71ba7e0f16040013b7127a6e2ab Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 6 Dec 2022 13:28:31 +0000
 Subject: [PATCH] make: Add top-level Makefile
@@ -8,19 +8,15 @@ Simple top level Makefile that just delegates to mDNSPosix.
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
- Makefile | 6 ++++++
- 1 file changed, 6 insertions(+)
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
  create mode 100644 Makefile
 
 diff --git a/Makefile b/Makefile
 new file mode 100644
-index 000000000000..2fe39ad8938a
+index 000000000000..feb6ac67ef47
 --- /dev/null
 +++ b/Makefile
-@@ -0,0 +1,6 @@
-+# We install a stub Makefile in the top directory so that the various checks
-+# in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-+# other things) the sstate checks will clean the build directory when the
-+# task hashes changes.
+@@ -0,0 +1,2 @@
 +all clean:
 +	cd mDNSPosix && $(MAKE) $@
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
deleted file mode 100644
index ebebeb27f0..0000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 43b82963a79250b19c94e15d0a86b04a5cffc0e1 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Thu, 15 Jun 2023 17:02:58 +0000
-Subject: [PATCH] remove unneeded headers
-
-From a quick look, these seem to not be needed and having them
-breaks the build with mbedtls 3.x. Without them it builds fine
-on both 2.x and 3.x versions.
-
-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- mDNSPosix/mbedtls.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
-index a73681b6d528..ab8f8c772c00 100644
---- a/mDNSPosix/mbedtls.c
-+++ b/mDNSPosix/mbedtls.c
-@@ -38,10 +38,8 @@
- #include <mbedtls/sha256.h>
- #include <mbedtls/base64.h>
- 
--#include <mbedtls/certs.h>
- #include <mbedtls/x509.h>
- #include <mbedtls/ssl.h>
--#include <mbedtls/config.h>
- 
- // Posix TLS server context
- struct TLSContext_struct {
diff --git a/meta-networking/recipes-protocols/mdns/mdns/mdns.service b/meta-networking/recipes-protocols/mdns/mdns/mdns.service
index 531d142dcd..86869d4792 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/mdns.service
+++ b/meta-networking/recipes-protocols/mdns/mdns/mdns.service
@@ -3,11 +3,8 @@ Description=Zero-configuration networking
 After=network.target
 
 [Service]
-Type=forking
-ExecStartPre=/bin/rm -f /var/run/mdnsd.pid
-ExecStart=/usr/sbin/mdnsd
-ExecReload=/bin/kill -HUP $MAINPID
-PIDFile=/var/run/mdnsd.pid
+Type=exec
+ExecStart=/usr/sbin/mdnsd -foreground
 Restart=always
 RestartSec=10s
 
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2600.140.3.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.0.25.bb
similarity index 95%
rename from meta-networking/recipes-protocols/mdns/mdns_2600.140.3.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2881.0.25.bb
index d7f2335747..d44eb72f67 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2600.140.3.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.0.25.bb
@@ -12,13 +12,11 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0004-make-Separate-TLS-targets-from-libraries.patch \
            file://0005-mDNSCore-Fix-broken-debug-parameter.patch \
            file://0006-make-Add-top-level-Makefile.patch \
-           file://0009-remove-unneeded-headers.patch \
            file://0001-Fix-build-with-gcc-15.patch \
-           file://0001-Use-secure_getenv-on-Linux.patch \
            file://mdns.service \
            "
-BRANCH = "rel/mDNSResponder-2600"
-SRCREV = "62914d23f299cf336a8647fb3a1b5b78647b3b41"
+BRANCH = "main"
+SRCREV = "d4658af3f5f291311c6aee4210aa6d39bda82bbe"
 
 inherit github-releases manpages systemd update-rc.d
 
-- 
2.43.0


