Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B720577E24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:16:26 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u62so290206pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+FhEiyjNJ5kvwF2wYFn2Y/Gs1sYI8LvTze2s2y5zZ4k=;
	b=mSS3+ULHzVEDQq5JHfkCLFabCEcHdSVa5iR+XNkZ7IzCaMN0ieY8vTwFZzjwyL95Ny
	CjcS7ypAfD0UEIZdWs7XDRIgfnily5b/eZCh9IbEjjjaafjjsXd1RadNtCgPnRht+1nB
	hjPJT52HMKdYQ13RYSpPG3t8dznruEpb+Nt6kPFtEqL02c3OGsic70goGc8YhWyQmI9t
	28bL8MYwgXdeQsYDJTYxTkIMs1vgeUoz2KYDqwch3rs9DU6bMrg1l00DcQZWLGZqqvyj
	Cn3SV5/CgLdHq9iHVxLiqggfMSAzMkNswRHh2ODNaVPvggUv4qEKtVEwTiO7eTDkLwyk
	jOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+FhEiyjNJ5kvwF2wYFn2Y/Gs1sYI8LvTze2s2y5zZ4k=;
	b=Bk+flkBKxfF5VKKhdyRBFJZdOn4Ma1PCVa5vUDXVKdlujl06LzFl9rX+7SX+JW9BEI
	bCdA1neZQauwidjeSkbSa6WNrZxw8pkLr5xee31FT84dhbXBDa/tG6/ds40k87cHqtcQ
	bdjnDDVJR2wbeV4rqIGoSBVkbr4inTKbEX4Xa6ETcpgwGr8KzwJFH1UnLe9ULdZe1QNf
	j0WvrBrQvMZ9DZv1f0+I2sbrUdqMMG2Qje5u4hM1riw3nCNHcQHdLwE2pCGvr2v+T1aO
	0uzm+m8yf2Yt8y8HBhEAZIkpMp9puiyGHVuNwPcP9+kZgF5hG9ItgUPvVSvc5msT+LFl
	1g2w==
X-Gm-Message-State: AIVw113w1OR5JKOVYRckKfiFQ35EMfpzawk3dmmfs8cK62io2/pzet5m
	SCInM0+a3oBcb1CL
X-Received: by 10.99.95.216 with SMTP id t207mr414220pgb.19.1499786187474;
	Tue, 11 Jul 2017 08:16:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id 63sm345599pgd.57.2017.07.11.08.16.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 08:16:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 08:16:14 -0700
Message-Id: <20170711151614.21990-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-initramfs][PATCH] klibc: Fix linking by using bfd linker when default linker is gold
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 15:16:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../klibc-2.0.4/0001-always-use-bfd-linker.patch   | 30 ++++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
new file mode 100644
index 000000000..41a6b9e13
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
@@ -0,0 +1,30 @@
+From 9ea19bd9636806a73bcf29cfcee40a268f91eb4c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Jul 2017 08:09:52 -0700
+Subject: [PATCH] always use bfd linker
+
+its possible that distros choose to default to gold linker
+therefore explicitly asking for bfd linker would fix the
+linking issues on such distros
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dc10fc5d..40647be4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,7 @@ include $(srctree)/scripts/Kbuild.include
+ KLIBCROSS	?= $(CROSS_COMPILE)
+ export KLIBCROSS
+ export CC	:= $(KLIBCROSS)gcc
+-export LD	:= $(KLIBCROSS)ld
++export LD	:= $(KLIBCROSS)ld.bfd
+ export AR	:= $(KLIBCROSS)ar
+ export RANLIB	:= $(KLIBCROSS)ranlib
+ export STRIP	:= $(KLIBCROSS)strip
+-- 
+2.13.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index be59aa443..c4c3e00b8 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-Define-in_-structs-for-non-glibc-system-libs.patch \
            file://0001-include-linux-sysinfo.h-directly.patch \
            file://0001-mkfifo-Implement-mkfifo.patch \
+           file://0001-always-use-bfd-linker.patch \
 "
 
 ARMPATCHES ?= ""
-- 
2.13.2


