Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.36385.1617491011280665230
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 16:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j394u1DE;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b16so8930946eds.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTu62MGaiDDjQw5xpFYVOhdRv5m0tje4azGVnwRZNU0=;
        b=j394u1DECQ+/mCsJTfzQrMCAgDKno0/gfTOF3lQ2iW46XNxEDJZcu8xyzvHpGzE+6B
         brczbPKUBoOQmSaSVtk56ceioDYvyHlFFK6JutHdpl8lltkPnMyy8Jr1VGsJYQydpq1m
         fOMhJfXuFsthVTgWsjxM4HLXpMAOxqx1l36d4x0n+iHJTecSSZ3C/hxhtvdaCXMfehM1
         BkIf+xlYcV06//TA2Gkru7SxQwB2LJ/gWZikWCk4IdyLcMqOM4QpILLhdp6OSSChCYlj
         dFVXR1mD7r3bqBYARTBjX0RSMSj1Rud5i1AOWgGpzR9413EjKlbZtpdkHeov4JSZbjHI
         Jbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTu62MGaiDDjQw5xpFYVOhdRv5m0tje4azGVnwRZNU0=;
        b=U2RHj8OAFsBtqC7Hs+VDtRfsvXnOOBTIFS45VurdlJyW3KwVMUQGl8mNgwfdOn6te0
         JHAJ/YZYk/DjodiMIghBwvmjW3JJ7n+LCSUSWdRB4rqkfTOae0EKDRf5o/jQnzMq9dO0
         Hfm5NgeyUf3aRJCIldvf+z/qs5qC0A4wyb8iU2LEXCQJ3C66QZbPoglfLZj0onbBPGlO
         LSIMDfhOhPJtJvkqabj8cOo0mi/vZaKBzzB/QPpzhxLsWbtERNCJAFfTXDpeZZomjDOz
         dWGz3OshPn1vkSni3xtizWPn3ez2Nq13TYn6VkTL5us/IMsUZN2x5J/V/KKd9mq3tmIz
         QCEw==
X-Gm-Message-State: AOAM530L5Hu27eQw0lt/T8fbb2paflFVBTuIbyKl9EjBpKxsPiTX3dxX
	aKo2WdCmQE4+OWPo+g5CtkMwNbu4bHU=
X-Google-Smtp-Source: ABdhPJyW+sAlQvA625qYxxgo0tCSRlZU5U0D8QTuu4idsxJ+4fR4WjZk5JCKt7M7Lwk0OO0dA5oLZg==
X-Received: by 2002:aa7:cf95:: with SMTP id z21mr22772818edx.76.1617491009698;
        Sat, 03 Apr 2021 16:03:29 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id yk8sm6136124ejb.123.2021.04.03.16.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 16:03:29 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] uml-utilities: fix installed-vs-shipped with usrmerge
Date: Sun,  4 Apr 2021 01:03:27 +0200
Message-Id: <20210403230327.1433909-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: uml-utilities-20040406-r1 do_package: QA Issue: uml-utilities: Files/directories were installed but not shipped in any package:
    /usr/lib/uml/port-helper
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  uml-utilities: 1 installed and not shipped files. [installed-vs-shipped]

* pass LIB_DIR instead of using default value from Makefile:
  $ grep LIB_DIR.*= tools/port-helper/Makefile
  LIB_DIR ?= /usr/lib/uml

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/uml-utilities/uml-utilities_20040406.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 8e00cb3ea4..f86b2b912e 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -18,15 +18,14 @@ S = "${WORKDIR}/tools"
 inherit update-alternatives
 
 do_compile() {
-    oe_runmake
+    oe_runmake LIB_DIR=${libdir}/uml
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${exec_prefix}${nonarch_base_libdir}"
-FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/uml/.debug"
+FILES_${PN} += "${libdir}/uml"
 
 ALTERNATIVE_${PN} = "tunctl"
 ALTERNATIVE_LINK_NAME[tunctl] = "${bindir}/tunctl"
-- 
2.30.2

