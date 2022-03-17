Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D19DC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 02:52:48 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.5831.1647485566854775949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ShZvuNs4;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id h2so5712389pfh.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+sfKkSFX989irhcA1Hgmyeha8M5rvFMp8JNB7Ts7PU=;
        b=ShZvuNs4z0u5Au/7oOTGMLvZVDc81zjWhZv5Ri+8ihcg5MOdUQQvBvnhqE4zfVXjku
         A9YHWPWtDvAPSUJa0qUWvJ/NhSB+HqBnJLzvkb+LRL4RW3sQZSxoUrYStosXdGzIkZge
         Bs6WvR1r4vylsG0CNNf6YHQcGdiW+v/Ceo+wSvsRRcoy+4wo84892FAc1B8sDLiyTboj
         PPozdebeI+cUAhhGvBe/O+0D7tqwoeg1Q7YUOFstlX6KmaX2H84rbVRqs8HaEzNCz/rK
         CdW2wy/GymApxJwqAFDx379WTo8VIdBgOC1mhrzyE7IhMJEzOeO0LcfkYtrBgvhnHnwg
         h4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+sfKkSFX989irhcA1Hgmyeha8M5rvFMp8JNB7Ts7PU=;
        b=60loIGf/IpwFaZQAzZu+ZQ1zQAuGdVRIozdwK+8q7Jv7c6ZlpLZ/Sk1AYPeShMzR9b
         PW+MwsAPvWgenqVMVm7fhvKJgdmO/cYwLTv14mzWYtZN3QIXUqyWR/alGUgjSs4FmjWj
         e60DVwiffk8QGGf44iWQtQBaUAMnVF7KpqPxA7zHrXmmscYR9hMEN4/X+iaXAotPG50w
         zjjx/0NgGmV1j7rSGmw7xKUP5+S2JdwiGC06T8hkx/qKLrAKVRKcXWuwZwulbJvb7yvK
         1yAnjHHkW1PIki3PJ6j4EYKJc1LBV+ZJkzDoMzz0meti3lPGJogUbeZA7FE4Y4hLG6kZ
         U/ow==
X-Gm-Message-State: AOAM531AXgl30Hb7qIVViSnp6dt1MpUJYwa2OV/Yn/TIZLQtpKTgnJUZ
	rNspEp1vDFIEQD+iMEaPP/UMw6TIDYYvCA==
X-Google-Smtp-Source: 
 ABdhPJxCuk6W07KOMsra+0PECsxmCZbSKoWFhwmtNeRkD7nejPdzNgx3ESV2WqIsXB5tazpwur/M/g==
X-Received: by 2002:a65:43c8:0:b0:378:7add:ec4c with SMTP id
 n8-20020a6543c8000000b003787addec4cmr1927507pgp.570.1647485566036;
        Wed, 16 Mar 2022 19:52:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm4862829pfh.174.2022.03.16.19.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 19:52:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Fix build on rv32/musl
Date: Wed, 16 Mar 2022 19:52:43 -0700
Message-Id: <20220317025243.518388-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 02:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96031

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.1.3.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.3.bb b/meta-oe/recipes-devtools/php/php_8.1.3.bb
index bfe4d270d6..8086bac550 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.3.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=99532e0f6620bc9bca34f12fadaee33c"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
+DEPENDS:append:libc-musl = " libucontext"
 DEPENDS:class-native = "zlib-native libxml2-native"
 
 PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
@@ -66,6 +67,10 @@ EXTRA_OECONF = "--enable-mbstring \
 
 EXTRA_OECONF:append:riscv64 = " --with-pcre-jit=no"
 EXTRA_OECONF:append:riscv32 = " --with-pcre-jit=no"
+# Needs fibers assembly implemented for rv32
+# for example rv64 implementation is below
+# see https://github.com/php/php-src/commit/70b02d75f2abe3a292d49c4a4e9e4f850c2fee68
+EXTRA_OECONF:append:riscv32:libc-musl = " --disable-fiber-asm"
 
 CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
 
@@ -116,6 +121,7 @@ CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_IN
 # See https://bugs.php.net/bug.php?id=60109
 CFLAGS += " -DHAVE_LIBDL "
 LDFLAGS += " -ldl "
+LDFLAGS:append:libc-musl = " -lucontext "
 
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
@@ -272,8 +278,3 @@ do_install:append:class-native() {
 # | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
 # | make: *** [ext/standard/math.lo] Error 1
 ARM_INSTRUCTION_SET = "arm"
-
-# Needs fibers assembly implemented for rv32
-# for example rv64 implementation is below
-# see https://github.com/php/php-src/commit/70b02d75f2abe3a292d49c4a4e9e4f850c2fee68
-COMPATIBLE_HOST:libc-musl:riscv32 = "null"
-- 
2.35.1


