Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE305C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 09:08:44 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.49009.1638781723809336567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 01:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ap91CkiK;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id l7so19662510lja.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 01:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4puCPYch4vcFpLP6QWCxjFaTqdXpFNT0y4zrEPdBDrw=;
        b=Ap91CkiKzJ41HL+oBvdwYzJzS0wwvDuT+fY+9s+Cd5e+LXxWUC/9eNLmfMXD7ihLBG
         9Qk6lZZEssB85CqinaIES5PjD7pCnRoITEKyBb8PsKtxiZftMfElqNXkin+7cJT/4HA/
         TQRxZf7TVzefi7OA8RwvBldiTfL5c0Jg5yadJ9cJ9NRkZRz3j3TajbPEN1tA1bc/atyw
         zPpHqAaQvt7PymYspYRMeQeS8nGY/2Kc2MOQ4ZKqVkXkU3+CEfW1gZCClA1dZP2cV1ES
         EWsa5WY23WAmqOX0Q1LBHlhQY2VkxRmv5RemKuQvFrhMGA8vcsJZZNAG+dkOVmOUXqup
         S7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4puCPYch4vcFpLP6QWCxjFaTqdXpFNT0y4zrEPdBDrw=;
        b=yqb6ZaHrfHRBufLFXq+sfbfwZEioW405zBlRVfocg8yqRxTjqaf9H08ldr49UXja33
         E6k7Xj3xoGwn4T2VclqwAsTmJLUF/8Y+zGLJL3Kx8/ia7wwdLugrZfI/70W6WcnEX272
         5+9ZUgPIoJ0PegIniMW4gs016cEgU2v/8eAhS/UHX6n+PGtBGcIYvEm7mh7Bjl5ON9qV
         ufl6503c92fn9241/44Rj3Doh3Q9eQR5zkO5vRlPLmrDTSrpdZOySV4myqqIVY3BsU1w
         3FVrJ6n+G6SNB/HVpZyrXW/t2+iACKZ5+BI4YyQqQCnCviBmxRPyYfmPWWBhvv3IH1pI
         ykcg==
X-Gm-Message-State: AOAM531qlYcZKmLK2DHDpp1i4zaOipI64pdsSDshGAMwKMtQ9KKtIOFs
	LguMYBBRXP0Dfl9L407z4EjQ20pYvGolqg==
X-Google-Smtp-Source: 
 ABdhPJyLAErV2CjJ3VR1izwy+Bmoz92szHE6+xiULPeNGTjGRxREZejQCqOruhhafmJjUIQLkFuBfA==
X-Received: by 2002:a2e:8693:: with SMTP id
 l19mr35988551lji.452.1638781721703;
        Mon, 06 Dec 2021 01:08:41 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 p17sm1265289ljm.138.2021.12.06.01.08.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 01:08:41 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Revert "ccid: Fix floating runtime dependency on
 flex"
Date: Mon,  6 Dec 2021 10:08:20 +0100
Message-Id: <20211206090820.1009099-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Dec 2021 09:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94214

With the switch to recipe-specific sysroots this patch is no longer
needed. Tested building with and without the patch and the resulting
binaries are identical.

This reverts commit 960314be5d854212ee65604a68a92a3616b2a544.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../ccid/ccid/no-dep-on-libfl.patch            | 18 ------------------
 meta-oe/recipes-support/ccid/ccid_1.4.33.bb    |  1 -
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch

diff --git a/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch b/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
deleted file mode 100644
index 477cc31ad..000000000
--- a/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-No need to link with libfl.
-
-Upstream-Status: Pending
-Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
-
-Index: ccid-1.4.8/src/Makefile.am
-===================================================================
---- ccid-1.4.8.orig/src/Makefile.am
-+++ ccid-1.4.8/src/Makefile.am
-@@ -53,7 +53,7 @@ PROVIDED_BY_PCSC = debug.c
- endif
- 
- libccid_la_SOURCES = $(COMMON) $(USB) $(TOKEN_PARSER) $(PROVIDED_BY_PCSC) $(T1)
--libccid_la_LIBADD = $(LEXLIB) $(LIBUSB_LIBS) $(PTHREAD_LIBS)
-+libccid_la_LIBADD = $(LIBUSB_LIBS) $(PTHREAD_LIBS)
- libccid_la_CFLAGS = $(PCSC_CFLAGS) $(LIBUSB_CFLAGS) $(PTHREAD_CFLAGS) \
- 	$(SYMBOL_VISIBILITY) -D$(CCID_VERSION) -DSIMCLIST_NO_DUMPRESTORE
- libccid_la_LDFLAGS = -avoid-version
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb b/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
index 4b1c42173..e3cb7cef1 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
@@ -7,7 +7,6 @@ DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS:${PN} = "pcsc-lite"
 
 SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
-    file://no-dep-on-libfl.patch \
     file://0001-Add-build-rule-for-README.patch \
 "
 

