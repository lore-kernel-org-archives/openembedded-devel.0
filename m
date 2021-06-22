Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.10765.1624374620185246358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 08:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=W2Y7Pzst;
 spf=pass (domain: foundries.io, ip: 209.85.222.174, mailfrom: daiane.angolini@foundries.io)
Received: by mail-qk1-f174.google.com with SMTP id o6so4976533qkh.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wF76f68qql1q0VmVOxUR86f3grjnXAV9sd/KFcFWLuc=;
        b=W2Y7PzstpwWqha6KaRHd7wFrmMQCluaX64BW1GCLS2zU3PNa4xDiFbJaI0KfTSK/mr
         Gk5yS1K+S3dY2sWAznIoIOVnMyeanWfk4wX41V4VkjZ48Bi89aEASVV+zmbR2wcqoFbb
         dbZO/szJllvNhIlKh0R6Tfd0fJ9kBqA38VbtiIIs2hAy3EcW2nPvlysJTmxh4NfdYe6t
         eaDwnrjjz3VuUealEsB0dlH0keOoeLfGyp5+3ORJt/vO7HiGMLI6orKyMqdMN+wF8dKM
         wkwxjRvddzN2BKI8ZqVnuzjsjA4mX5jySABI00+cBy0q92oiAlMefS2kzIso4n3nlGLN
         0o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wF76f68qql1q0VmVOxUR86f3grjnXAV9sd/KFcFWLuc=;
        b=koMDiZ1nt8up3uUf0MY25WKder/Xsxxe9gefp3/1KUH04qaGpmernA1Vxu2q2oUFay
         kZuvm6YSXaY4u4d7PJ3murN3EJFUJcFRqXlIDwzh7V2AsIZ5GBqeVB9vQT7smxnTWjlO
         azVoJquGpWowUif+FZ9J/LkDNIFRKR6UkEoAN+525pWmC8I2uoOBHrQX+eONd6GnrK17
         8FBcabBXxLF0IA2CMQgscLR7k8RBk9RVOCMjdkqYb9S79ySzgEPGILHiFz/Uoo27cb68
         CWSGxn+3G1HufDfa0TXsBfoQT85Hz0KIhZR41wAdGP7AtcGEreh8Fq9t0cXD8s2c7Bp+
         BKjw==
X-Gm-Message-State: AOAM533PqcZA66sYjJ/akCA+sIKVysRveypu4XKijCpuK3q1eMlk3CP3
	i/5iIxuEkmSDgQ9GKbxqu6aViwq/kiJkEQ==
X-Google-Smtp-Source: ABdhPJx+KnYmP9HoqIfLH3zUTZFLEXtV1UDBiIDtO6qkH8V/HfTR/ISLjrN4/Eq7pwGPLhoNZ5Nsjg==
X-Received: by 2002:a05:620a:136a:: with SMTP id d10mr4711547qkl.422.1624374618911;
        Tue, 22 Jun 2021 08:10:18 -0700 (PDT)
Return-Path: <daiane.angolini@foundries.io>
Received: from localhost.localdomain ([2804:14c:3bac:19c0:2bf4:c81c:b4ed:b6ce])
        by smtp.gmail.com with ESMTPSA id u23sm10549134qkk.83.2021.06.22.08.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 08:10:18 -0700 (PDT)
From: daiane.angolini@foundries.io
To: openembedded-devel@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [PATCH] wireguard-module: Stop overriding modules_install in the recipe
Date: Tue, 22 Jun 2021 12:10:08 -0300
Message-Id: <20210622151008.995849-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure the recipe to use the module_install function from the module
source code and remove the overriden modules_install function from the
recipe.

Using the default modules_install (instead of the function defined in
the recipe file) the module is signed when DISTRO_FEATURE contains modsign.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../wireguard/wireguard-module_1.0.20210219.bb              | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
index 0525b4135..01e3b74c6 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
@@ -17,15 +17,11 @@ EXTRA_OEMAKE_append = " \
     "
 
 MAKE_TARGETS = "module"
+MODULES_INSTALL_TARGET = "module-install"
 
 RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
 MODULE_NAME = "wireguard"
 
-module_do_install() {
-    install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
-    install -m 0644 ${MODULE_NAME}.ko \
-    ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
-}
 
 # WireGuard has been merged into Linux kernel >= 5.6 and therefore this compatibility module is no longer required.
 # OE-core post dunfell has moved to use kernel 5.8 which now means we cant build this module in world builds
-- 
2.25.1

