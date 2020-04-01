Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.459.1585718173657072821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 22:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=ePhAevSf;
 spf=pass (domain: broadcom.com, ip: 209.85.216.67, mailfrom: scott.branden@broadcom.com)
Received: by mail-pj1-f67.google.com with SMTP id np9so2186629pjb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ri5p4vpsedkiF9NNfR2soD0HErVWUjojJGckgqeLMtQ=;
        b=ePhAevSfCvcbS0L0oC9NRwdJQm5/oyAbKq81X4elZsJysPUX0sbxsE1HaYFm8RNPpJ
         6WiMctLHEvZ2D/0kbTKsWs3Gg2GwRG4Jc3RKBBP3UcqrqXQGLgyAkioH+fAfpPSvkdBE
         MzsPdLd12sJSXHymYX2tg0QOh5QL3r+eWuYXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ri5p4vpsedkiF9NNfR2soD0HErVWUjojJGckgqeLMtQ=;
        b=mvUzFD3eAtRjVQTvNSvoK7Cwh1nZR9DiLEqm0hrAPb5IP3557bxI9MnL+LhFbSJXar
         mIrPlboW0X7pnDMGHxeOI3y0v5p3rzjDiwz4y9IMd/vpHZ8lV83ZLEavCW1DhtyalNJv
         9vD4bNOp1rSN4ML9IReKd+11QvhJNmlPsiipPRcpLGjV6TDgxnMeSzjjIKWYah3Xs8Wl
         KA9U98CqwNbpgw9h6tnUeEY5aUJ8qUaizVoDJKCx1SHp4pTNnzmf7xDl4YWuOOqif/eO
         VUWrEjmdE3wjWBGifVs8P1R/e/t5IrFVkljBU7FcI7ArKUmVFMK4IrH2DnsPW6RiWzwb
         VyeQ==
X-Gm-Message-State: AGi0PuYoaQ1Veepab49Swif4B9ayltVOT3cENxDd2K3KlGGNxbpa9tjq
	4xpRv48WSh5ZjsafDVu3jJwJPhXJGAqGhIyD3Z4BqgfJhqCeWF3TZjTD4sNobsVm2yygseOJQcA
	b6pG6nIjSSaa/rFA8od8KK+BOj/2VhbcqqNjGsWz3VsfL91G8ptzUALUG0GlSrceJ7ME1kcQoBU
	c73KUPkTi5MyLOvwb9lOyG/lvlUQ==
X-Google-Smtp-Source: APiQypJZfhGCJlis08l+Xx0YHMnLk1M72bymK51fGGe8puE4hPPPUh/xQN+r2/ViMqrF4ALQvAoxxg==
X-Received: by 2002:a17:90a:ba09:: with SMTP id s9mr2795881pjr.20.1585718172878;
        Tue, 31 Mar 2020 22:16:12 -0700 (PDT)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id p9sm540205pgs.50.2020.03.31.22.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:16:12 -0700 (PDT)
From: "Scott Branden" <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Scott Branden <scott.branden@broadcom.com>
Subject: [meta-oe][PATCH] kernel-selftest: only emit warning on clang if bpf is built
Date: Tue, 31 Mar 2020 22:15:55 -0700
Message-Id: <20200401051555.24776-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1

Only emit warning on clang if bpf is actually in PACKAGECONFIG.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 299c1f28e..cb4ac0458 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -59,10 +59,13 @@ KERNEL_SELFTEST_SRC ?= "Makefile \
 "
 
 do_compile() {
+    if [ ${@bb.utils.contains('PACKAGECONFIG', 'bpf', 'True', 'False', d)} = 'True' ]; then
     if [ ${@bb.utils.contains('DEPENDS', 'clang-native', 'True', 'False', d)} = 'False' ]; then
         bbwarn "clang >= 6.0 with bpf support is needed with kernel 4.18+ so
 either install it and add it to HOSTTOOLS, or add clang-native from meta-clang to dependency"
     fi
+    fi
+
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i}
-- 
2.17.1

