Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F21ECCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13707.1762853892848624659
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cm2gZVbd;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29555b384acso37268605ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853892; x=1763458692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq303ZS95SDHBERGKGcodos4V88l7vseq/gmx1aa3i4=;
        b=Cm2gZVbdN4sXHltIdkUUGX9/Xx6iTDSsv9sH3jznHy6fMd6PKE3CoyiPJOlq6HsTSN
         TFMUIMIG5UNu09wz8FELX54f0EJWk3ysZmaE6JEHZmUyGpQNufd1E3IH7nNjFmGl34nK
         GruM5qkW6xx/j/q/egNYUv51ZTgJTnm2LmQFE2O8+tpy3x/SjcrdHJsH4qO8P7radHDl
         4t875HTNwg2AKbK7tfbYYvFOcc2cdJvX51P+WLVxF+8H3b2GjSrJcCnhWrz4hty/s5zC
         aSBHu7JeYp7IHpDWG8jBvDnNWGra6RU17nS76Wx/dcBUbI9+KcobBCcFGrP39m+aNlWb
         ig8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853892; x=1763458692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oq303ZS95SDHBERGKGcodos4V88l7vseq/gmx1aa3i4=;
        b=AykLiLlrhATmzy+9GpPHNhq7AeNeGDCU20O5x5W2NNV42HndqbsP/r5yY2EmzxyePG
         GoXy9qMJ/uKRtbuKXLB4HkilC5cWx/7l1a0HVBk072c7wHdfie/fueyR7uW206mEynXn
         i61B/7N1+0AOFW22bNc2efFsgj1gFQN+YWq5CSeO3xjKHv5JPcChgd9pMXS6UOkIy2Dk
         QYZulpCd90Se6KOhJRMsLUPC5Fl4RNGHHRRDG7Xy3d70kS2k6TBkaDqyW53SpreqBrrQ
         RXOJNNgFUv5c2uqlx4MWZFbzBfX00w5UDNgXDwCe5mwcqbNIxxY9zm8IXWZyMJE2LTfj
         iXkg==
X-Gm-Message-State: AOJu0YwaVIveVOUA+Epb0UI5Rcg8Hz0UdUoV6unhqbPxBkTsf60lq+pv
	NyYrUcp63d48McRokDhyhhv8u8LLF8YJzXpwLIvpGyGHtVDXq1M9jLc0wheE/kwBQlw=
X-Gm-Gg: ASbGncsyWnGVDpCHm8h0lu5KE0npL/7wWTojoCVoyiBup7JAw79SPGM06E4CpZPf1vB
	dXpUIazlGeyuiiyvEejO12WNlSeRpPBlHBupi3rSIhFU3pR+hJBg3/0e2qOWcitDUs+LLLKv+4S
	4U5AD/KuH4PyDu81hxP//5F3SFrr6VBdDHwvHSYeRJLHkUUp9F0D/sUPfVrSGwErQ1Gy+aPD3A/
	3GjnnPrO7mug1AC+w8rjE3FPj4vxwTyJInU8UTckUmQo8prCay+hd/I4ireb9wYCR0DKN33bdh9
	PSeYWa3pDs82LIHZBDsFSzEdFMinVwkhrc69f1ntpUEJW703m72o2/ybBTUcdi3uGGZx3+ktaXc
	3K9EHGjqYLc/YTFREu/mQzBtwjOSIcEo+ykGA/Yb2RpxpLs95wp2G9otIrNaT6YmZtadyySJ+BO
	/WWu8ir80rsPbXLunXUNVMiYHq
X-Google-Smtp-Source: AGHT+IFiMnNvHzZWRXUB6Af6e+/IYEPFcgBWDePA3DdT87zWDWuYBKQdjX1UCqYAQEkNBQp8S/FYHA==
X-Received: by 2002:a17:903:244a:b0:290:c0d7:237e with SMTP id d9443c01a7336-297e56d6282mr148520135ad.39.1762853891915;
        Tue, 11 Nov 2025 01:38:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 12/18] pure-ftpd: upgrade 1.0.51 -> 1.0.52
Date: Tue, 11 Nov 2025 22:37:27 +1300
Message-ID: <20251111093733.1393568-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121515

From: Wang Mingyu <wangmy@fujitsu.com>

nostrip.patch
refreshed for 1.0.52

License-Update: Copyright year updated to 2024

Changelog:
==========
 - The QUIT command is now accepted during a transfer.
 - The server can be built with --with-minimal again.
 - Fixed an out of bounds read in the MLSD command.
 - Larger mmap()ed pages are used on aarch64.
 - Improved compatibility with HPUX
 - Improved OpenSSL API compatibility
 - Improved compatibility with OpenWall Linux
 - Improved compatibility with Netfilter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fac6357f60463b80cfa2e348804a587f343481ff)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch      | 7 +++----
 .../pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} (81%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
index 32d714f6f4..90244cf096 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
@@ -1,4 +1,4 @@
-From 79fd22c0def26eba130db98e312bb00fec32ac0a Mon Sep 17 00:00:00 2001
+From ed60c2ad3a7ed9762fcb6a304c7f60544606baef Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Tue, 4 Aug 2015 03:07:01 +0200
 Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is
@@ -10,16 +10,15 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-
 ---
  configure.ac | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 695ce68..0f28b55 100644
+index e578b2b..3874124 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -414,8 +414,6 @@ AC_ARG_WITH(minimal,
+@@ -415,8 +415,6 @@ AC_ARG_WITH(minimal,
      AC_DEFINE(NO_FTP_USERS)
      AC_DEFINE(WITHOUT_ASCII)    
      AC_DEFINE(BORING_MODE)
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
similarity index 81%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
index 6f03f73db5..1ce3c468b7 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "0BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=194bc994ad6bbd4ff5a021082fe52156"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5138d4a8a877b32de6a78cf7e9e99c25"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "4160f66b76615eea2397eac4ea3f0a146b7928207b79bc4cc2f99ad7b7bd9513"
+SRC_URI[sha256sum] = "1126f3a95856d08889ff89703cb1aa9ec9924d939d154e96904c920f05dc3c74"
 
 inherit autotools
 

