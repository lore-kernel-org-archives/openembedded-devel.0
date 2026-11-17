Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.727.1794955425409588996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CE0QGsL7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so2683285e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955424; x=1795560224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aET/3JmCcA0dKtPMGW5fOfbwowu/t7/b8l3IMuWzLjQ=;
        b=CE0QGsL7aOOl7x8etgt0zC6nOuqmgYncVj93q50pvMiyq8o/gQoDY1qxYtSP9I31a6
         exYelek9fMoMPIQX1Gs+HB3JujixUv2ir0461WNudBMW+p54MuJFzgPPrUhHQXdhMV8G
         bakso+66sl+MVIwrtltMUt8nIJ/ZgV9q9jVAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955424; x=1795560224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aET/3JmCcA0dKtPMGW5fOfbwowu/t7/b8l3IMuWzLjQ=;
        b=Se6QIizqelaeBiVDInLSSz6qjgI1aX3sDqVRcKsAomOkRTIfJLISVuQA5qY0LaCjIY
         hDelM7t5vBLLp6gQfjaGUu7s8wbAKwvGt2LQk87HRmartnN0lg0miWHpNCG27kGjzgwN
         dh6LWhkHiXedRuHHiKFJuw+hoFqBMGhRYBT5De9o/QfV2m6AHoLoBU87M1WiB3kNOJ42
         PhfzC2ugnnLiegbTIkmHWvb6Fs0YwQSJYngtYdlwDWSXbXL0VQPMJCk3tXuxl1QoLrnj
         Ik/ju2KxEu9jhXhNZIKr2sSMTRhU6Hg1kSBvqdIsHt1QVDm6BjG95PhGdvYLbxuunUcx
         JNmQ==
X-Gm-Message-State: APuU4Z/7k1MQX6AIYw/t6EsiwHvnSXskvM5N43h4NOJvm9TsdF09/Vi6
	jutFJbQsu49IQ3KTQeG2tBHBe76aDi5Z9zq/EWEDJ5i/RrSg/PpW0+csDVfjF43Rnr3WKYFieG6
	KpW5m
X-Gm-Gg: AYBFou1JrggW0O8A9qtm8/jBAY1GlVHNwAEcFKMnPEcjz08LR7iciS6aXGsN+fJxkXT
	NwkPJiF/qqdpQ0f//+54Tg+XRUcc0O72wtUAsG/Z2RxiVkKJyyG10mlVsSb8EHZryAicQEzG+/j
	xR1iM5FaIMMU+twlwEVVB1CFQ0lhIU8OvhHQ49b31uqRbLlpqWMabE+aMiUIYvgvytBJoD25WzG
	c5x1nABiEMUqxrkDB6G+IywDJ+58kAk3SkCa3UDmAcChuOz8+8PMCEogxzbK8lpx4uba3FTozX9
	B6eOkEee2QRPU0Fwie0zj5i8pXDLskUa5YCkXoiTvPPPMi8UX3qio8ROI/uvS/+T02J0KrjGiW9
	czlKf9Kg8eQ6dJg04GG59nXcNMQCSigzF9or4NFJLjxWn5Otd9wXb+v/ff0q/EMr4jiTF7WV2j6
	szMFjtgYq0V1ZFCuVivZbPdMNmHpU40awFHcyFVxkGdyOGn/DK4QLu54hM1a1EgEXymmF2KyS2v
	CSKdt6e8d2yZzGt9AQPLOww2Vbt/JZ+3zcOU9p0ZG9D+fztZJUaRZzBtQBEqxzpzgxlpTcprK87
	5/0NulnC1LYThbgxPdHO2gGVWYocrpnt3OLHFgHZEZ8AozGRs4nhd6ry+3GAOMVI5Awn84OmG5g
	TXAlSkOFkQ3AMiH771F8Vy3NROsf+u4L4Jq7UgSKaazISgAbyZIC32g==
X-Received: by 2002:a05:600c:4715:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb7da3d288mr11536075e9.34.1794955423551;
        Tue, 17 Nov 2026 14:43:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 05/11] libmspack: Upgrade 0.11alpha -> 0.12alpha
Date: Wed, 18 Nov 2026 00:43:31 +0200
Message-ID: <20261117224337.4181772-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132595
Content-Type: text/plain; charset="utf-8"

- test/chminfo.c: add various guards to stop out-of-bounds reads
  when reading CHM files with unusual structure sizes.
- cabd_read_files(): Don't set merge_next/merge_prev if the file is
  skipped, which happens if salvage mode is enabled and the file's
  filename is blank or overlong. Otherwise, cabd_can_merge_folders()
  will read from the skipped file's freed memory when comparing file
  lists, which typically crashes.
- cabd_read_files(): now rejects cabs for having file folder index
  0xFFFF ("continued previous and next"), but more than one folder.
- cabd_read_string(): seek to the byte after a string if it's
  null-terminated but empty (when it's not allowed to be), so that
  salvage mode can continue reading if that was the only problem.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libmspack/CVE-2026-110602.patch           | 41 -------------------
 ...ck_0.11alpha.bb => libmspack_0.12alpha.bb} |  6 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
 rename meta-oe/recipes-support/cabextract/{libmspack_0.11alpha.bb => libmspack_0.12alpha.bb} (78%)

diff --git a/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
deleted file mode 100644
index 15d690945f..0000000000
--- a/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From aca3603bed20772fd86ce5b901005668cee835ad Mon Sep 17 00:00:00 2001
-From: Stuart Caie <kyzer@cabextract.org.uk>
-Date: Mon, 15 Jun 2026 16:33:33 +0000
-Subject: [PATCH] kwajd_read_headers(): initialise pointers before returning
- any error
-
-CVE: CVE-2026-110602
-Upstream-Status: Backport [https://github.com/kyz/libmspack/commit/4d868504114346aa767d435fbb89a8b76603493f]
-
-Dropped changes for test and ChangeLog file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- mspack/kwajd.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/mspack/kwajd.c b/mspack/kwajd.c
-index 30caa89..ede91dd 100644
---- a/mspack/kwajd.c
-+++ b/mspack/kwajd.c
-@@ -160,6 +160,11 @@ static int kwajd_read_headers(struct mspack_system *sys,
-     unsigned char buf[16];
-     int i;
- 
-+
-+    /* initialise pointers */
-+    hdr->filename = NULL;
-+    hdr->extra    = NULL;
-+
-     /* read in the header */
-     if (sys->read(fh, &buf[0], kwajh_SIZEOF) != kwajh_SIZEOF) {
-         return MSPACK_ERR_READ;
-@@ -177,8 +182,6 @@ static int kwajd_read_headers(struct mspack_system *sys,
-     hdr->data_offset  = EndGetI16(&buf[kwajh_DataOffset]);
-     hdr->headers      = EndGetI16(&buf[kwajh_Flags]);
-     hdr->length       = 0;
--    hdr->filename     = NULL;
--    hdr->extra        = NULL;
-     hdr->extra_length = 0;
- 
-     /* optional headers */
diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/meta-oe/recipes-support/cabextract/libmspack_0.12alpha.bb
similarity index 78%
rename from meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
rename to meta-oe/recipes-support/cabextract/libmspack_0.12alpha.bb
index c612e54e17..1d849bc052 100644
--- a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
+++ b/meta-oe/recipes-support/cabextract/libmspack_0.12alpha.bb
@@ -8,10 +8,8 @@ LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz \
-           file://CVE-2026-110602.patch \
-"
-SRC_URI[sha256sum] = "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b"
+SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz"
+SRC_URI[sha256sum] = "1834d1079a6e8db9546fa95d3a1fc2cf676124a8a60bbdd7f30b2db4eb4ad683"
 
 inherit autotools
 
-- 
2.47.3

