Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99067EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:39:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.6468.1689683953042045938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Eoyr1c57;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso9138587e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689683951; x=1692275951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpfAn59sVqjNiPjiKtfperndP2dv2KlLiDSYlBeeB0k=;
        b=Eoyr1c574LCAaxn8sFWxwzkj+tMjiqKofSOvYQOvi2Fz6H6o52a93nMIrq6yT+xuVc
         CXJJvlJpDEv6xobmls56mjVSlGfNcWDfRkqoHb3vMPL/0bBzkb682BGpGeo1PEfSGoCR
         TyjhqI3akxsoh8oqducFqeqa+4BTjMziRMOUcmEKCvxvbgftGkEPz14HI805qqJEe+PL
         dOG5IsUV7PmSROYOyWNVCV4XjNDOKktgYwbdkNRya+JAf0fmwY4xFs5BIF/G6aMFLY1R
         ZByL/I7MOaR7lPxmT4zcNLwYMDQe2IKnnHS4otsnJvSlqNrorsjbSqQLECCtbiu5hhd1
         g0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689683951; x=1692275951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpfAn59sVqjNiPjiKtfperndP2dv2KlLiDSYlBeeB0k=;
        b=bI88ZDj9B4xd9I/4/dfutiURUyzGkIjdvgbILNoqdeSoU7Cvos0Yzg10SbQ4Fh/aJ0
         3/A2KXCc2F/z57TobcfujRJ+jgjLaZjOBpLUBNLSw1+dlXrRfRkBjvmyaN5oAGnnM6ME
         9UalFjfBeso/0yWjq8UzHPjnUqp9Pii6+UkGVeP6BaGIiSsplwIhke9dFf2a8e+koEF8
         2QqZ4LWDYPHvncrvCUnH+lItf/RaLw+0cETpegde5HC25Yjp901Z/rOg9/0x5DnSyt68
         fPMPKu7OdYGiGYY+mjtue4wxo9lL2CELDmnLRoaGWhg8EFRL1pl9hVUJDAw320q77rN3
         oIrQ==
X-Gm-Message-State: ABy/qLarWdRj+HTXH4CudJ66L1YwUby0ly+cb8wzhfsJBW+Bx62AmByv
	bN3Ix3rc9bzOfPFiZhKUnGsNEuS5YLA=
X-Google-Smtp-Source: APBJJlHslV2XADiWMjhSLOMXd7fIjk57dSNltD6HTQJxgYwX5mwbtGSvKHJ1bYjRLsJhELIskb1Bcg==
X-Received: by 2002:ac2:5e78:0:b0:4f8:74b5:b4ec with SMTP id a24-20020ac25e78000000b004f874b5b4ecmr12829639lfr.41.1689683950770;
        Tue, 18 Jul 2023 05:39:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7d5d9000000b0051e0f100c48sm1181921eds.22.2023.07.18.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:39:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 3/3] libtomcrypt: add PACKAGECONFIG for ltm enabled by default
Date: Tue, 18 Jul 2023 14:38:34 +0200
Message-ID: <20230718123834.2182686-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 12:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103943

* enabled by default, because that's what dropbear expects and fails
  without as shown in:
  http://errors.yoctoproject.org/Errors/Details/720460/
  dropbear/2022.83-r0/crypto_desc.c:72: undefined reference to `ltm_desc'

* add comment about the LICENSE
* use EXTRA_OEMAKE

* FYI: if you need to use this in dunfell (for whatever reason e.g. to
  avoid CVE-2019-17362 in dropbear which contains bundled libtomcrypt),
  then you need to add:

  # Only needed for dunfell, fixed in kirkstone with:
  # https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=4b308773eca7570ce5007e8f953b56252c17fdb1
  DEPENDS += "libtool-cross"
  EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool'"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: inherit pkgconfig instead of explicitly using libtommath.a in EXTRALIBS
    makefile_include.mk does almost the right thing:

    ifndef EXTRALIBS
    ifneq ($(shell echo $(CFLAGS) | grep USE_LTM),)
    EXTRALIBS=$(shell PKG_CONFIG_PATH=$(LIBPATH)/pkgconfig pkg-config libtommath --libs)
    else
    ifneq ($(shell echo $(CFLAGS) | grep USE_TFM),)
    EXTRALIBS=$(shell PKG_CONFIG_PATH=$(LIBPATH)/pkgconfig pkg-config tomsfastmath --libs)
    endif
    endif
    endif

    but LIBPATH is unfortunately set to /usr/lib not SYSROOT_LIBDIR, but
    still returns '-ltommath' (as long as you don't have some strange
    libtommath on your host):
        PKG_CONFIG_PATH=/usr/lib/pkgconfig pkg-config libtommath --libs
        -ltommath

 .../libtomcrypt/libtomcrypt_1.18.2.bb         | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index 8b73cdda85..4f6d793eb8 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -1,11 +1,18 @@
 SUMMARY = "LibTomCrypt is a public domain open source cryptographic toolkit"
 HOMEPAGE = "https://www.libtom.net/LibTomCrypt"
 SECTION = "libs"
+# Unlicense isn't very accurate for this revision, it was WTFPL in 0.18.0-rc1:
+# https://github.com/libtom/libtomcrypt/commit/77e31fb6a980212e90b9a50f116dc5a7bd91e527
+# then updated to dual license PD and WTFPL also in 0.18.0-rc1:
+# https://github.com/libtom/libtomcrypt/commit/412b2ee1fccc3a0df58f93f372c90d6d0f93bfc9
+# and then updated again to Unlicense after the 0.18.2 tag (it's only in develop branch):
+# https://github.com/libtom/libtomcrypt/commit/3630bee6fc0f73dd9c7923fd43f8ae15a2c0fb70
+# but keep using Unlicense to avoid triggering people with WTFPL license:
+# https://groups.google.com/g/libtom/c/17Z7xkECULM
+# and this comment can be removed next time libtomcrypt is updated
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71baacc459522324ef3e2b9e052e8180"
 
-DEPENDS += "libtool-cross"
-
 SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master \
    file://CVE-2019-17362.patch \
 "
@@ -14,10 +21,19 @@ SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
 
 S = "${WORKDIR}/git"
 
+inherit pkgconfig
+
+PACKAGECONFIG ??= "ltm"
+PACKAGECONFIG[ltm] = ",,libtommath"
+
+CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'ltm', '-DUSE_LTM -DLTM_DESC', '', d)}"
+
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
+
 do_compile() {
     oe_runmake -f makefile.shared
 }
 
 do_install() {
-    oe_runmake -f makefile.shared 'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' install
+    oe_runmake -f makefile.shared install
 }

