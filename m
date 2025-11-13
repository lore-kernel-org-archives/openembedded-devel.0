Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB042CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17872.1763014776084213627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYrFdrVs;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo397052b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014775; x=1763619575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btNnWJqeh3+gpnmKcQFmF5aeK6X1wOJ0MC1AN/HBng0=;
        b=mYrFdrVspWdQkkH852WIowinCQJQeUNpQhlmx1KgGVS786Lx915qvvmOTvU6DXWd3a
         O3s/kY1t8txrKL8TuuVyxspxQqOU6mj1vW6k8wzA2xl2TkGFIts2UzGhZCHoZNfbsPKa
         scww4ChXMH4e8qsig0AdJ+OnrJ/2EG6DJuofD4Hq1/GQ61GKWLU3jjm7GMDIXgfo1st4
         fYlYTcca9ixuY2mI/u9orNMVOcG5TSJHPuqZ2evRYNyosIy7X5Nj/RmCdKxJhYz7pr3u
         bva8KjAu1fTxCTPXz51DoGIYegPOBMWjwRi0TD14DC0hyUd0vBpvEJONP/rJbAoqXzir
         TECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014775; x=1763619575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btNnWJqeh3+gpnmKcQFmF5aeK6X1wOJ0MC1AN/HBng0=;
        b=s54JImJALRrjFZF4MQQ1us1E5h+p0+zSXn9zyS076cQZNpdG27150uur/GbjwGTznl
         f1bp6pqhiO4rypClVd13xyNmbCI1S4eMx7Uh4rKGnpHyyw0MIOB8tIdmFku9S6R/7T+9
         62auGh2+SJruHm55TInTbnoZqxU8cCI5A4z2ZrhCcm3uuIgnAEc5RJKI8xPlzUs/YQR4
         n50F8FUwW52TY3XtHf7FuHd5AfgStsGlrMPmuwVdlOTstPLVAfgpzzyKqMDWUBTU2Jwj
         E2Y845kkV9bfYUPfpFz54gXvGPg9LRdlR48DR0fuc/S1U7w4oCePsrzyaEX1gqAkyGx1
         70Ug==
X-Gm-Message-State: AOJu0YxanGdjvo9lM+kkHYYpoPFSoKrtP1F/BHSgbALvP1RgpoNTi+qq
	eH2bXwFPP6aUnutd3zXuAzIuE/Hj0QcO+AuIzboJGLwkM5MRq9MdA8H/7E/scQ==
X-Gm-Gg: ASbGnctge4J1Abqi+FAdkOhKhZV+8t50/C9sPUPRJlbBCEanIRp7+xpJj2nE/nSbE1m
	NcV9konxKO+n/VrfGtx8hDrTQgC0N70gUjwipeoFVjCjvMYw9TeKeQLoiWRF+dc3SnUkzXf+ibN
	bntTdo/BDC7g/3qkUj2L/ZxRszTjkNo1Hzzdo7DTdkgiZfFkVkRqPcPJET8CO+d8MSgkVkRiwx2
	sazZB0SArZ+5fyPkNaHpynYIiEx7gZXBOoDCQuiNKBy0F3Y4wUcgM7CElVhNtvzy6it0jlPk+8l
	ksj4NYZeMoN7w4OPt4vQGIiXkF6+tLd/kQz4v5URPY4OSvrRFIA1fUMt6hiXuhkgSpDT2gPNklM
	EBuTTePTC/x7LCO3ocJTLjCeP56p01FuTnvp0eCjIx1s7r88WAWdnUMif38tjSgXmYS0Q+3DnN2
	ZAMmPmnQgyNxd2zQ==
X-Google-Smtp-Source: AGHT+IFoW2zf6mvRkTm/habV4aCLt6ln2YxuX4PXaLdatmBROsyTcJ2gV9pcDfk4y8kYG07E7gT+Kg==
X-Received: by 2002:a05:6a20:158b:b0:34f:c83b:b3ec with SMTP id adf61e73a8af0-35909891315mr7825024637.15.1763014775224;
        Wed, 12 Nov 2025 22:19:35 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:34 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 01/38] evtest: upgrade 1.35 -> 1.36
Date: Thu, 13 Nov 2025 19:18:36 +1300
Message-ID: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121599

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
refreshed for 1.36

Changelog:
===============
- Add KEY_ROTATE_LOCK_TOGGLE, KEY_REFRESH_RATE_TOGGLE
- Add performance key
- Add ifdef
- Use bytes instead of bits for size of ioctl input
- CI: add workflow rules
- evtest 1.36
- Add SW_MACHINE_COVER
- add KEY_MACRO 1-30 and other keys

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3682b77d4d7430e3542b57b3d0fb0a6318afe8bf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch | 7 +++----
 .../recipes-test/evtest/{evtest_1.35.bb => evtest_1.36.bb} | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-test/evtest/{evtest_1.35.bb => evtest_1.36.bb} (90%)

diff --git a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index 595b0296ea..55162207f8 100644
--- a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -1,4 +1,4 @@
-From 490f5b6cd788692d989f07180a5714c76872911e Mon Sep 17 00:00:00 2001
+From 55c872430c9444d7edaf50db0faa9bbc31dd085f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Nov 2019 11:58:58 -0800
 Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
@@ -10,13 +10,12 @@ input.h [1]
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/libevdev/evtest/merge_requests/6]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  evtest.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/evtest.c b/evtest.c
-index ba7a161..8fc2e5a 100644
+index d3d3d8f..3045cce 100644
 --- a/evtest.c
 +++ b/evtest.c
 @@ -63,6 +63,11 @@
@@ -30,4 +29,4 @@ index ba7a161..8fc2e5a 100644
 +
  #define BITS_PER_LONG (sizeof(long) * 8)
  #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
- #define OFF(x)  ((x)%BITS_PER_LONG)
+ #define NBYTES(x) (NBITS(x) * sizeof(long))
diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes-test/evtest/evtest_1.36.bb
similarity index 90%
rename from meta-oe/recipes-test/evtest/evtest_1.35.bb
rename to meta-oe/recipes-test/evtest/evtest_1.36.bb
index 52f684ce5f..56f50f74ca 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.36.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "da347a8f88d2e5729dd12d61ee9743f902065b55"
+SRCREV = "96e6cb5ae90726883be095a3e467e847c06225f7"
 SRC_URI = "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=https;branch=master \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            "

