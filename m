Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B30CC433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 21:32:32 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.28321.1634506348612742860
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MYi5Qr32;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 66so13982740pgc.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GAOBlImchJU3gOM4R6DOyrdyhOjtOaFSCVYMdXA+TyI=;
        b=MYi5Qr32whtQbzFO7idfBwnUUmPuasNQOjZ4OpgJZb9oUUxuusKezhE1jZ+igCf5UL
         mzcAYPaGaFVKetGMqESodwpfZfAg4pP+GluxeUOKsKMKsR6gdNEv78FrwHwjLtrmmLrI
         4RwlXtECuCehlNhQ79EPHf32UJgouRqDDCMjsuzUsMXJf1jm8HPeax/jxCi5qbefNNUs
         O1nmApufLFz3Dpqipz0DEzZ9dGeyPY2w133RKrmTkwpnNnW0Ih8OeuXAnT8MTV1OD5+7
         Uq9uo7X/9b64wQiHxBDnMcgZEOAhWIWphANsgMcotMvqkW+GD7mdYB9nU3of+6e60sui
         ozxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GAOBlImchJU3gOM4R6DOyrdyhOjtOaFSCVYMdXA+TyI=;
        b=UMgOA12GzdvsdZMmEgN55SFlQq/GYNChUoSP+fKhCTXeuyBZYQtDkCcaAG9PkrDlcD
         aVlP0m8BpUrE5buN8sNlLa7E2O8JbP/cImLKOd6sTSu9gTBP6Zqc4Nt7IYjmWkvBOFIq
         98jxzaV3pb0ewG/TOJQpsYTrB2zYdWL7IFN4asW8PXGooOgm8hdnQmwJoDakp7IBh1rH
         1n9dptRDjdGSFI3SikLKq0cHoVE4l3gRF/PaTX1yp2b8ks+MidPtI8iJcEfw8h3dXi5e
         03L57MT7PiGs6c1CJBLB4h37bMN2mSCRMtGdlPXd4eqaTQh8ArrvnhHiiJdjjwrUnnlc
         yB+g==
X-Gm-Message-State: AOAM531TkCg9OIHcjT01f8+jNQVjPZyxbZz8Py+yBYniGI1ymOpxo7ey
	itO5Df9BDQjJuiDu9Fy1opvv+GwdO1Vd9A==
X-Google-Smtp-Source: 
 ABdhPJyACK/VnLfeWnzxx7pB45B7lyWncqyt6ZcmyvrVvXysIyn8IKgtO7w+F+lx+O2wTD8h7C4swA==
X-Received: by 2002:a62:7506:0:b0:44c:efe8:4167 with SMTP id
 q6-20020a627506000000b0044cefe84167mr24996421pfc.59.1634506347799;
        Sun, 17 Oct 2021 14:32:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 t11sm11421325pfj.173.2021.10.17.14.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 14:32:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] nodejs: Upgrade to 14.18.1
Date: Sun, 17 Oct 2021 14:32:24 -0700
Message-Id: <20211017213224.2127995-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 21:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93411

License-Update: Reflect new location of gtest sources
                remove node-inspect from license
		update Acorn to v8.4.1

Use internal openssl until nodejs is fixed to work with openssl3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix openssl and c-ares errors

 .../{nodejs_14.17.1.bb => nodejs_14.18.1.bb}       | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_14.17.1.bb => nodejs_14.18.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
index d468f2518e..76ff980997 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a1016f9b7979cfe6fc3466a9bba60b1e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6768abdfc4dae4fde59d6b4df96930f3"
 
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
+DEPENDS:append:class-native = " c-ares-native"
 
 inherit pkgconfig python3native qemu
 
@@ -33,7 +34,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "ddf1d2d56ddf35ecd98c5ea5ddcd690b245899f289559b4330c921255f5a247f"
+SRC_URI[sha256sum] = "3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -58,7 +59,7 @@ ARCHFLAGS:arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES:append:mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "ares brotli icu zlib"
+PACKAGECONFIG ??= "brotli icu zlib"
 
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[brotli] = "--shared-brotli,,brotli"
@@ -87,7 +88,6 @@ python do_unpack() {
 
     bb.build.exec_func('base_do_unpack', d)
 
-    shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
     if 'ares' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/cares', True)
     if 'brotli' in d.getVar('PACKAGECONFIG'):
@@ -129,10 +129,6 @@ python do_create_v8_qemu_wrapper () {
 do_create_v8_qemu_wrapper[dirs] = "${B}"
 addtask create_v8_qemu_wrapper after do_configure before do_compile
 
-# Keep until openssl 3.x compatibility is fixed
-CXXFLAGS += "-fpermissive"
-BUILD_CXXFLAGS += "-fpermissive"
-
 LDFLAGS:append:x86 = " -latomic"
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
@@ -140,7 +136,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-    python3 configure.py --prefix=${prefix} --cross-compiling --shared-openssl \
+    python3 configure.py --prefix=${prefix} --cross-compiling \
                --without-dtrace \
                --without-etw \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
-- 
2.33.1


