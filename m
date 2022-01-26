Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFC2C5AC75
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 02:39:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.7436.1643164739807955327
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 18:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pHlEuN2f;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id q75so19900578pgq.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 18:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+S+oKIDG8vL7LkVsleybx407WaIftixHl4cHIsJhYJI=;
        b=pHlEuN2fli4MrtTvNC8rZ2C0/wvBulfWijv7OpzIu0UNA2dqGOjNTG4OmL5jrLe77w
         WDkb2G+bAFKggRDQ2/+oFMbDslIvC1NFu7DypwGKXLXChSrbiqFM6j8/uJGeiNcIyUQf
         Umn0OPwnK5MmubqSD8qRmlaIzIbh+v/83eg9RP2gelZrdIU5r+Jif3iWs+tRa+2XAQvU
         ETetgZBxRvI7yaFZmagGm7FAB3mL5DVcllrABIjs/1Qz9saK2pANp1Cjr0d7UNSua09A
         1wdrVUdSVt0d9/cpggBR1dwN0WaNXa8CVek7d8gZR9JleIcIe1gMz3hs3KYh6CQs31bF
         mY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+S+oKIDG8vL7LkVsleybx407WaIftixHl4cHIsJhYJI=;
        b=JzL+Eb+l9kBJ7Zp3X8IVd5FC2ui0gAz47X/n8iBSc3Jf75b5VmF58wcB9UAI8NTE34
         JRm/T/WcL+whSaz6v/6bxxU/MbZHS7fncsh19VqFcCgiq//lMlUB4TKYWlhSbFVkukx+
         DsMhtqwJMixOHoGr11HP3xkF4/kSUYe/uXpuNfLctt5pKFQq8bKv2sRsN5SXkN192bPz
         AKrjNTL5bncvzJHbn9gu/M59Q5LUch5evwqzBTGqQ+ZHureNObgs+YRsIFEFtURoSdGI
         h83MMv4KPwXRX1FfSeeVnEE51V4Ok495hISPHg+47Mni/lX+ubRb9zDpBKtnvM6oucJU
         Y0FA==
X-Gm-Message-State: AOAM531p58VDTv38cRkRNN9tfcAYnrCIv2M4GTR5GYQxMo5H9+vBcUjV
	/W7wDjpdkYF97b3vSDstdhFFlLlpKN0mrQ==
X-Google-Smtp-Source: 
 ABdhPJxfcX+G8rQhdsc5XjnlBWtOA1RE3aQJ+keeEZ62UM/yV8gDmyuJRJqUZYTLHjJa6SlNy9z5bQ==
X-Received: by 2002:a65:6a0f:: with SMTP id
 m15mr17547353pgu.391.1643164739064;
        Tue, 25 Jan 2022 18:38:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 s6sm1666934pjg.22.2022.01.25.18.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 18:38:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Update to 8.1.2
Date: Tue, 25 Jan 2022 18:38:54 -0800
Message-Id: <20220126023854.2187653-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 02:39:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95090

- Add fibers support for RISCV64

- Disable build on RISCV32 musl since getcontext/setcontext APIs do not
  exist on musl which are needed for fibers

- Detailed changes are here [1]

[1] https://www.php.net/ChangeLog-8.php#PHP_8_1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb    | 1 +
 .../recipes-devtools/php/{php_8.1.0.bb => php_8.1.2.bb}   | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.0.bb => php_8.1.2.bb} (97%)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 62ada76f93..3cf33c6943 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -327,6 +327,7 @@ RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64 = "android-tools breakpa
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64le = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:libc-musl:riscv32 = "php"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:aarch64 = "concurrencykit"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:x86 = "ply"
 
diff --git a/meta-oe/recipes-devtools/php/php_8.1.0.bb b/meta-oe/recipes-devtools/php/php_8.1.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/php/php_8.1.0.bb
rename to meta-oe/recipes-devtools/php/php_8.1.2.bb
index 43e86fe55b..038d79783b 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.2.bb
@@ -32,8 +32,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "0725ed2baea125496a898455d501a77460218b2a0cfad773fa9322f491b82b61"
-
+SRC_URI[sha256sum] = "913dc7dd4388427fa33ea4ac89834e856ff5394f4218eace260a3a279f5b53a9"
 
 inherit autotools pkgconfig python3native gettext
 
@@ -273,3 +272,8 @@ do_install:append:class-native() {
 # | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
 # | make: *** [ext/standard/math.lo] Error 1
 ARM_INSTRUCTION_SET = "arm"
+
+# Needs fibers assembly implemented for rv32
+# for example rv64 implementation is below
+# see https://github.com/php/php-src/commit/70b02d75f2abe3a292d49c4a4e9e4f850c2fee68
+COMPATIBLE_HOST:libc-musl:riscv32 = "null"
-- 
2.35.0


