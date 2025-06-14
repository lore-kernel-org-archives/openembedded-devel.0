Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEE8C71141
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 09:27:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6798.1749893238820957718
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Jun 2025 02:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G6p+G3Bo;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso22784155e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Jun 2025 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749893237; x=1750498037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2h6dMiT1WoMJZz+LLF+7nkmGlNv6rv+WRdODRmkDlzk=;
        b=G6p+G3Bo6WN2GbRip6pF9fjrCj1eYa/jEI75k0jdslhUOPCoip005wSxJZrlA/Mkqr
         /q1yTp33sb4UiiLuVf3McYdcHHxMKJLV2xC8+2Z24HjrxjxAYz+8wQDY5vKsTN0Za7P1
         6u6cofinD/TfbZbEW+lMRrSsfGDBnhZR/oOtJrTvxfRsh700BEJBmldpPPLD0wRES7XT
         3RYTdDdWo25OQF0k0oMrHBoJGCswpN9qTbnCsuX8vVWeUsnz9sDBn4PVbs73BWlyeHEJ
         yl8mPnQiKBMoeZ2dA0e+MiCODBVMVH+bRrDdTyC5rSMny1lQvs9Y1hC63ZPiqjNi8zGm
         Iy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749893237; x=1750498037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h6dMiT1WoMJZz+LLF+7nkmGlNv6rv+WRdODRmkDlzk=;
        b=PESKIJJ15pBDXnZkfYGKAlgrNpm3a0ydn8UKKfWOrD5rCaRJuW2CSBZLMcOTMxq/um
         owO34x72jmSuz6pQ91P/Ah0WYIMR7dcYSjc9GzA1EFLjPXKvSO+foNCf5ojCCrdx6lm/
         IHuaz1FLadjD98LZo4DoLNtTOqoZ81XTSb8Yz12SZqDskJOdMPjIUvjbmWSyxPsZGQJJ
         gnLrvTFcwputEYhuw/W6FrrGQ3IDa+5pzGrKYlE8TeQ9TLuWe9vUYhuejjzCWscf4kuc
         1VdFHZBYPrMHb4dqUT2TC/OsShKmpOLlAQ0miPH/km8db83IGERsP56aO1hDk01ORKs/
         47cQ==
X-Gm-Message-State: AOJu0YzPoXq4wSw/09+cyQlzBKrfT42Hd1VyEaIfTModgtfaaIPA+tmO
	yx8Ty1qL3/dqBGZGNlcMjF6ujUzKNLG1JP1BmJDPKWHucwodYOVCEYYbMTsYxRYj
X-Gm-Gg: ASbGncu71McDkXVM3QsjrDJDWd2+dmIQCqrWKTyuZrMrhMbPIHrxuLez3Pum+q4QbHn
	E42RUBYGFlR62uj6se6XasdL38/rf3N5Sur2X27xq17FpYCCPhR5itwnl7Jc/9V1D/zuCx09lO6
	sdz2FeeCQ5qBLaTftbRu+63SBN+lgG+2pTQmcHXugouneghZBL8PVDZeH4i3ZYSz6W9WR2C1KZy
	Pvlonf0N/FeqH7PLx+3ANLn4NATTxi27FsH2vaWpVFldb2PzigMctsWw938vjrfGiHMOO5qDr6V
	g3KIv54fakmJBX9jpJc1rOOd5Dlus5Ohtrmjp5AMjxjNaxh/MGs97L5jp3mHtcDUfoofLaQWaYD
	djgZOxQfX1WeUruZ3ni+J9fsZvA1V
X-Google-Smtp-Source: AGHT+IFOjUodAFBx+4cfiJqTNUlaauIlcYwH5YBYZHiS8uXNjUnrtGjtwIFkKGsGiGXZTsaH2C/9Jw==
X-Received: by 2002:a05:600c:3e14:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-4533cacbe23mr31915895e9.31.1749893236503;
        Sat, 14 Jun 2025 02:27:16 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73966sm4801455f8f.34.2025.06.14.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:27:15 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 1/2] libcoap: Upgrade 4.3.4 -> 4.3.5
Date: Sat, 14 Jun 2025 09:26:34 +0000
Message-ID: <20250614092634.149312-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Jun 2025 09:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117910

Drop backport of CVE-2024-0962.

Change summary for version 4.3.5:

        * Support for wolfSSL TLS library.
        * Support for DTLS1.3 (using wolfSSL).
        * Support for Mbed TLS 3.6.0.
        * Support for EC-JPAKE (Mbed TLS)
        * TinyDTLS version update.
        * Support for RIOT using SOCK i/f.
        * Support for LwIP 2.2.0.
        * Support for LwIP using NO_SYS set to 0.
        * Support for (Posix based) Zephyr.
        * Support for QNX builds.
        * Support for ESP32 xtensa builds.
        * Updated Contiki-NG support.
        * Support for multi-thread safe libcoap usage.
        * Support for defining binary PSK for coap-client and coap-server.
        * Support for Connection-ID (CID) (Mbed TLS, wolfSSL and TinyDTLS).
        * Added new define types for defining PKI parameters.
        * Support for user definable ENGINE for OpenSSL.
        * Support for using noTLS and TinyDTLS with WebSockets.
        * Support for providing list of compilation #defines.
        * Support for proxy code running within lbcoap.
        * Cleaned up support for building .h files.
        * Additional scan-build and pre-commit checks in build tests.
        * Updated CI build tests to use latest action versions.
        * Fixes CVE-2023-35862.
        * Reported bugs fixed.
        * Documentation added and updated (Doxygen and man).

License-Update: Updated years
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../libcoap/libcoap/CVE-2024-0962.patch       | 45 -------------------
 .../{libcoap_4.3.4.bb => libcoap_4.3.5.bb}    |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.4.bb => libcoap_4.3.5.bb} (92%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch
deleted file mode 100644
index add52483b7a1..000000000000
--- a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From bf6a303883bde40cf96b960c8574cddd89e71701 Mon Sep 17 00:00:00 2001
-From: Jon Shallow <supjps-libcoap@jpshallow.com>
-Date: Thu, 25 Jan 2024 18:03:17 +0000
-Subject: [PATCH] coap_oscore.c: Fix parsing OSCORE configuration information
-
-A vulnerability was found in obgm libcoap 4.3.4. It has been rated as critical.
-Affected by this issue is the function get_split_entry of the file src/coap_oscore.c of the component Configuration File Handler.
-The manipulation leads to stack-based buffer overflow.
-
-CVE: CVE-2024-0962
-
-Upstream-Status: Backport [https://github.com/obgm/libcoap/pull/1311]
-
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- src/coap_oscore.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/coap_oscore.c b/src/coap_oscore.c
-index 83f785c92..e0fb22947 100644
---- a/src/coap_oscore.c
-+++ b/src/coap_oscore.c
-@@ -1678,11 +1678,12 @@ get_split_entry(const char **start,
-                 oscore_value_t *value) {
-   const char *begin = *start;
-   const char *end;
-+  const char *kend;
-   const char *split;
-   size_t i;
-
- retry:
--  end = memchr(begin, '\n', size);
-+  kend = end = memchr(begin, '\n', size);
-   if (end == NULL)
-     return 0;
-
-@@ -1693,7 +1694,7 @@ get_split_entry(const char **start,
-
-   if (begin[0] == '#' || (end - begin) == 0) {
-     /* Skip comment / blank line */
--    size -= end - begin + 1;
-+    size -= kend - begin + 1;
-     begin = *start;
-     goto retry;
-   }
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
similarity index 92%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
index 604fec8072c5..9e88b1af46be 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
@@ -5,13 +5,12 @@ RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE = "https://libcoap.net/"
 
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1978dbc41673ab1c20e64b287c8317bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9aa68c0f6785376aa8ec7f4f1aa6ae3c"
 
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://run-ptest \
-           file://CVE-2024-0962.patch \
            "
-SRCREV = "5fd2f89ef068214130e5d60b7087ef48711fa615"
+SRCREV = "7cf7465b784baded4de183290c547d582becfd28"
 
 S = "${WORKDIR}/git"
 

