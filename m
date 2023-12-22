Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8F7C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 14:01:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.23304.1703253656353706021
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 06:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rm+Cc18B;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3368b1e056eso1329890f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 06:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703253654; x=1703858454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztg334fdxspRcCqMTjxCmwkNU4dMvaGFS1Twk1YGGkg=;
        b=Rm+Cc18By8fs9NIYdOi1bLvNwa37VraiMLvo7OrNanwUkdJC3im/lpeWxyrcl3pqha
         FfnHSHYjzgZi4/ud/jp5sVSyj0xOAlxSHuvd8qSHyLUU4SHA0HFqSfDt93hpz4ETNLqu
         9jJN5GyL74DS7VlqqSso/JZiS43qx2WV0GwbKscaNG2GvlHokJGTOSWSMZlDYjKvNC1R
         zvU5HH9+rg8lfRzaBzpy0kpsPRWnzTVi1TaSlS6B0S3+8Hz2v2IGwgix4vJStc3DzQfT
         wRjlcgTOU3INQeHwzEOJxKSTKQb/2wNhkg+R+VcLb5kKpgiYfcwmpUfTEs5SElqu9fnq
         DVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703253654; x=1703858454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztg334fdxspRcCqMTjxCmwkNU4dMvaGFS1Twk1YGGkg=;
        b=dueC9p9EedxVDVd25yFYMsJ1kK3YCaNdOBYcdITyuopJoeVfeVeu7bf4t/wPqqEU/Q
         Mqqw1ubPZ0nSFd5wP9/3VB+mEGBIz8V0iogjPFWySg32QRfxQjcAckLcNk/luX8je/y8
         BV9dmex/Nnnl3Ump6QmVWkcs2YtlB7SSo1E5T+qPbX2o0ArWbmdJkrUPoZNv0qmN3rWy
         +6/DUtLSBIE/ZT2kDsfqRduWGOlZtblylL2fXXJt1KcsW6jSP6ZN1gh6rxnYAXy+PSf/
         LSrm/PHGAalbEvTEoKKjnbdOM/pBEVo/73zx7y9sWDwBWLcBwwbZvGiaFzobRemUJURx
         fXgg==
X-Gm-Message-State: AOJu0Yw3P6FtkfOV6Q1u0JCkO4BTfHIITRykqLYPJH4Z9jsmfjEOm1Hx
	qUP21OFxw0/z8MmjLobrQaqb9elGnS4=
X-Google-Smtp-Source: AGHT+IGATce2KgFX2P4bNvj1nKtaQ6dAlkhPhUJxAYVjLRjdWjUurfIbqSE4JWyljWhVsu+eJdAEhA==
X-Received: by 2002:a05:600c:1907:b0:40d:35c9:7b88 with SMTP id j7-20020a05600c190700b0040d35c97b88mr803809wmq.100.1703253652843;
        Fri, 22 Dec 2023 06:00:52 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0040c42681fcesm6963992wmq.15.2023.12.22.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 06:00:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperyasinak1@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2] wavpack: add PACKAGECONFIG for shared and enable it by default
Date: Fri, 22 Dec 2023 15:00:48 +0100
Message-ID: <20231222140048.3772170-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 14:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107750

* fixes gstreamer1.0-plugins-good build with wavpack enabled:
  PACKAGECONFIG:append:pn-gstreamer1.0-plugins-good = " wavpack"

* 5.1.0 built shared libs by default, 5.6.0 build with CMake doesn't, causing:
  http://errors.yoctoproject.org/Errors/Details/748247/

TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/13.2.0/ld: TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7/recipe-sysroot/usr/lib/libwavpack.a(read_words.c.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `bitset' which may bind externally can not be used when making a shared object; recompile with -fPIC
/usr/src/debug/wavpack/5.6.0/src/read_words.c:592:(.text+0xb88): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...reate-wavpack-as-versioned-shared-li.patch | 26 +++++++++++++++++++
 .../wavpack/wavpack_5.6.0.bb                  |  7 ++++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack/0001-CMakeLists.txt-create-wavpack-as-versioned-shared-li.patch

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack/0001-CMakeLists.txt-create-wavpack-as-versioned-shared-li.patch b/meta-oe/recipes-multimedia/wavpack/wavpack/0001-CMakeLists.txt-create-wavpack-as-versioned-shared-li.patch
new file mode 100644
index 0000000000..145483d05c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack/0001-CMakeLists.txt-create-wavpack-as-versioned-shared-li.patch
@@ -0,0 +1,26 @@
+From 0cebb83c7bccf990aaec446d021b697eaeef9f7e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 22 Dec 2023 14:57:20 +0100
+Subject: [PATCH] CMakeLists.txt: create wavpack as versioned shared library
+
+* as autotools build does
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Pending
+
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2597e98..7ca9bab 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -371,6 +371,7 @@ endif()
+ 
+ set_target_properties(wavpack PROPERTIES EXPORT_NAME WavPack)
+ set_target_properties(wavpack PROPERTIES PUBLIC_HEADER include/wavpack.h)
++set_target_properties(wavpack PROPERTIES SOVERSION ${PROJECT_VERSION})
+ 
+ if(WAVPACK_BUILD_PROGRAMS)
+ 
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index ebbc59dde8..dc5dab7626 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -4,8 +4,13 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=bb5d037e3ad41a3c84c9f2d8bb65a7b4"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https \
+    file://0001-CMakeLists.txt-create-wavpack-as-versioned-shared-li.patch \
+"
 SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
+
+PACKAGECONFIG = "shared"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
-- 
2.43.0


