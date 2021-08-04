Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.9703.1628087237101005733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 07:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JC3PvpEj;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso4071217wmq.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0kUtNtbF6b9wFQEIMI+wrNBytXs59OsvKgLHF/E3HF8=;
        b=JC3PvpEjxiTQzE7L6t6aLndix5WE082cBX8HFXWG53IAkjiUWtQe7fixFbIG8FcE3L
         /gtOLfulM+D2F6Zy/RS0blLK7vg7dFN3zINXQaVMjzJvag9R8JwPZTJcSY79pHGsm2Rp
         0FabZSETcotFDYiMSZ8LLxYkoDU/VvMAYKzylkKFifoFBuLDbXpq2MpUt+OCwFbPGJja
         uPNTKxPJWWk85xdhNxpJdRP9sb+RUdfa4f4cJTVZFJ84MgB80gnQ5wPojR93/ed93Di1
         W4/aNIgAJutqBWUVi7e1ZJ7u8O66XnXzieQo8n8NU7zlFTd9MS7WFG69vxHKMnasr4rK
         6Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0kUtNtbF6b9wFQEIMI+wrNBytXs59OsvKgLHF/E3HF8=;
        b=sJjU+tw/fdvKRmgOdtDmYeSXycLzHHwk/PiIPghqeUy3Cy9S/z07MEmiX8BQxplenI
         iVhef5aYUeglsFM0l7MSzlImuNHwizYNdrgSPH1u2qi7nGG6tiab+KEHcD+KuanjNDQ9
         aFZAPQPqGQj8LDeGlIsQ5RGFg4rI3d6snP0EV6JLm62573T/PuNVmteguben+B7Ozyjc
         EOCP4ctIYepKnvt5g7q04Ux/U5zo6HsQrcEXhr7sJvZm8dORq7Q30iYm4weoiYia3Nzq
         9XRNsqrClNhphhAowssujFIZBo68fEiELUNh7L3wty5dYPJJU+0wQgzegb/DfHuySErq
         Vvzg==
X-Gm-Message-State: AOAM530ni1SZPPGittrlZUug6fRuq7DkhOcP2lCe+g95p12iquPeuAUt
	rp2/ou+FKfD1a0qzlQ/CN3eaUuDiGZOjRQ==
X-Google-Smtp-Source: ABdhPJxhqCq0BkV1hRvqP2X4TpIy6k5oBrRjqi0VQZNeNNw8PW7lOruv8d7oMLkDegNYUyLvjECQpQ==
X-Received: by 2002:a05:600c:3ba2:: with SMTP id n34mr14598455wms.119.1628087235660;
        Wed, 04 Aug 2021 07:27:15 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w13sm3411032wru.72.2021.08.04.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 07:27:15 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] klibc.bbclass, image_types_sparse.bbclass, packagegroup-meta-oe.bb: update the overrides syntax conversion
Date: Wed,  4 Aug 2021 16:27:12 +0200
Message-Id: <20210804142712.251990-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* re-run the latest version of the script which converts CONVERSION_CMD as well since
  https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d9e81d66db2bc2aa56d177cef78c814c29679a4a
* skip many incorrect s/_linux/:linux/g changes which were introduced by:
  https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=9ea1041f8eab26ee871a9176e9691e5d3e6745bd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass               |  2 +-
 meta-oe/classes/image_types_sparse.bbclass         |  2 +-
 .../packagegroups/packagegroup-meta-oe.bb          | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 83112c06fa..202d132d94 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -4,7 +4,7 @@ DEPENDS =+ "klcc-cross"
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
 CC:forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
-CC:forcevariable:armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
+CC:forcevariable:armv4:linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 1459f800a5..af3879372b 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -1,7 +1,7 @@
 inherit image_types
 
 CONVERSIONTYPES += "sparse"
-CONVERSION_CMD_sparse() {
+CONVERSION_CMD:sparse() {
     in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
     out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
     case "${type}" in
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5cd605ff49..47ee3099aa 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -205,7 +205,7 @@ RDEPENDS:packagegroup-meta-oe-crypto ="\
     libsodium \
     pkcs11-helper \
 "
-RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
+RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
 
 RDEPENDS:packagegroup-meta-oe-dbs ="\
     influxdb \
@@ -948,12 +948,12 @@ RDEPENDS:packagegroup-meta-oe-test ="\
     pm-qa \
     testfloat \
 "
-RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
-RDEPENDS_packagegroup-meta-oe-test:remove:arm = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:powerpc = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
+RDEPENDS:packagegroup-meta-oe-test:remove:arm = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:mipsarch = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:powerpc = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 = "fwts"
 
 RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
-- 
2.30.2

