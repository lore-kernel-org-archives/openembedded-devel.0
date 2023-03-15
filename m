Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F65C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 04:04:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.367.1678853042658139919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 21:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AVB0CP8T;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id p20so18703870plw.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 21:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678853042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXGNYsLOE8YM+9t5ot7OFX+nRkqxi/uyOxKynxOWy1o=;
        b=AVB0CP8Tc8/ESr7Ygzcz5WF3agWg21o4GxlkeIvsp5qn9T14Z7oT3+482UXWzX3f8z
         Vox1t7QK6OTbBbnojAqvWofdxFs8ENhefEuI9lJWTmtW3Ab5b2XE7tWOWADPDWb6kRw3
         bES1Fjn/VC77cm2Z4I2V+1Fv3Ev31161VGDp0P3/+EoZ0DN4GdygA3PoJkiCLsuZmF3c
         gayXnvJ9H53kyerbXdQECCV0AP0uOiL0mMSRRWaRhYsV0zl+boMKwTMVd1TF0yEL7l/6
         En0y83cXRjYnTgLtzRjFzPPK6eG+2uoVap5wpt5+NEE/fXyQLSeYjcEIgQDunkPdohrX
         5bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678853042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXGNYsLOE8YM+9t5ot7OFX+nRkqxi/uyOxKynxOWy1o=;
        b=29W7WH9G/XX8Bu3tL4bcHQ4t1B0STJhA6KfMwVXgJU5podQuIlGLa7I5oYJCq9X6G4
         4QhA1nb2jBYAOcoXxsD4a65uFGf471MF/5Wxw7vNssnpxU4VisSctLuP1VZCls9J+NaN
         GiyB6jwPHZEcwkdMmO4xLJBH1FZLMDKIpDVVlJVx5ZU/Rv+cK9+hPF5lwPq0oVrXIFTb
         pmtGIYvu8pCSKQ2Tm8brGVB4JTYZRdY5urWJv6xnKtQqvu4asDPuoPKKO+L30kmWDu3c
         s6bnuG9EZ2iMFWLl9ON58IBshomvN3fGnwIIeYroZiWdFtOIDM9ar7oVAURbXiOF32Ax
         MdoA==
X-Gm-Message-State: AO0yUKXFe3d5b8AfTtCUWLf3XknclZC3z0kK8OTX2lz0m+zKE2PYb5J4
	aWh8Uh2mFByEQ+JGMe4B6+HSqCBhFlCKqw==
X-Google-Smtp-Source: AK7set8cEQnzg4C910h2dx7fooL2QlOyBo6SoTYVnLIqjH+2t4FyRmpi3q56Y25RJye0vFmTSgexLg==
X-Received: by 2002:a05:6a20:6d19:b0:d3:626b:976b with SMTP id fv25-20020a056a206d1900b000d3626b976bmr13058858pzb.26.1678853041651;
        Tue, 14 Mar 2023 21:04:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::513a])
        by smtp.gmail.com with ESMTPSA id b16-20020aa78710000000b006259c00d7b9sm297507pfo.101.2023.03.14.21.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 21:04:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Depend on file-native
Date: Tue, 14 Mar 2023 21:03:59 -0700
Message-Id: <20230315040359.3160300-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 04:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101528

Some older distribution e.g. alma8 has a version of file utility which
is version 5.33 but more importantly missing this patch [1] from version
5.40 which causes package failures in wasm files e.g.

ERROR: nodejs-18.14.2-r0 do_package: Fatal errors occurred in subprocesses:
Command '['file', '-b', '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/nodejs/18.14.2-r0/package/usr/lib/nodejs/ptest/test/wasi/wasm/write_file.wasm']' returned non-zero exit status 1.
Subprocess output:ERROR: Bad magic format `version %#x (MVP)' (bad format char: #)
Command '['file', '-b', '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/nodejs/18.14.2-r0/package/usr/lib/nodejs/ptest/test/wasi/wasm/symlink_loop.wasm']' returned non-zero exit status 1.
Subprocess output:ERROR: Bad magic format `version %#x (MVP)' (bad format char: #)
Command '['file', '-b', '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/nodejs/18.14.2-r0/package/usr/lib/nodejs/ptest/test/wasi/wasm/notdir.wasm']' returned non-zero exit status 1.
Subprocess output:ERROR: Bad magic format `version %#x (MVP)' (bad format char: #)
Command '['file', '-b', '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/nodejs/18.14.2-r0/package/usr/lib/nodejs/ptest/test/wasi/wasm/preopen_populates.wasm']' returned non-zero exit status 1.
Subprocess output:ERROR: Bad magic format `version %#x (MVP)' (bad format char: #)
Command '['file', '-b', '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/nodejs/18.14.2-r0/package/usr/lib/nodejs/ptest/test/wasi/wasm/clock_getres.wasm']' returned non-zero exit status 1.
Subprocess output:ERROR: Bad magic format `version %#x (MVP)' (bad format char: #)
Command '['file', '-b', '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/nodejs/18.14.2-r0/package/usr/lib/nodejs/ptest/test/wasi/wasm/main_args.wasm']' returned non-zero exit status 1.

[1] https://github.com/file/file/commit/85b7ab83257b3191a1a7ca044589a092bcef2bb3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
index c92c373746..7361f4039a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2dff1ccca11e333f1388e34f7e2d1de3"
 
 CVE_PRODUCT = "nodejs node.js"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl file-replacement-native"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
@@ -88,6 +88,8 @@ EXTRA_OEMAKE = "\
     builddir_name=./ \
 "
 
+EXTRANATIVEPATH += "file-native"
+
 python prune_sources() {
     import shutil
 
-- 
2.40.0


