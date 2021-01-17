Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.21172.1610905015243286516
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WO+YnoJ+;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id c132so9492181pga.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lz5ezM6bJNDz5IBYyvBImdtRcVv/p83NLlSJB2MM3uA=;
        b=WO+YnoJ+c0X36no62L8nqOBBKBuewdF5xjh9cgrOb7QXOj6RHoBQ6/7U9j6nzxdu7q
         /evm17cyOCGJIBegpJUKlZIISf1r/KuDG3PxSERi7+7NROfglMlLbllgj5Oala1H+s1L
         rYXxZQdDmixYLALN6W5SzBxyqeWK4+VD6/OuRoJLRjDfjJTl6YHNPDu48dJaeZVUA1Ub
         pvcsDGbsa3/BG+S7Xty3pcI22iOSbsM6z0EpnyVbgoCcN2982iVhDqmA/76ygizgncbn
         u3NTaq5LruRDxFigDmXJ+5qPiUSVzIhNfp36JVR+QmTZGfCudB4EmjJDE7m97jRT9Ktv
         i2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lz5ezM6bJNDz5IBYyvBImdtRcVv/p83NLlSJB2MM3uA=;
        b=teJ0Blc2UUDODdS31r5QLDnd5/pnxWmnVfcwiSV1mSLD6UnJDdzjQSdRo8k7prmO/c
         MOpxWmxnJ/nbVY4iTd7f5BYhz1fCeKtbvcSQNGPgPRCSDTla4qrjAYVVIALFkIJ7IGHD
         QlLvpAlLsE5T4RZf6Dm5W/O52Bfw4BHbiR/hOX+RohmRANVCqEepA6oeZHOb5puOGO/D
         V3N89h/uJET8h2APrQbAsvm/izvS26Mp30xqmdlUBmX/uAd71/cjhGz7hm+bRg8oY7SA
         Zng0XZD1z/ckhN2KYWK1i4DDWoucC8vJqUOkhlR3qGpo48ZEWI0swHP4wYZqc+qVUhi8
         Qjrw==
X-Gm-Message-State: AOAM530vncFaVRAQFleznkIPA/nQ8lt0pn4R6LuVu5rHd2abpzVq6DTX
	2zL5VUuDiGXstsOeIKHaZ9hhNIkGpVmErQ==
X-Google-Smtp-Source: ABdhPJy64FloQfm44wXRlFHiP9CupM8UcHaCNoIspsI53Y+pXV7slSpia4cM0983evmzXUiTSxwbYw==
X-Received: by 2002:a63:c207:: with SMTP id b7mr22313491pgd.184.1610905014688;
        Sun, 17 Jan 2021 09:36:54 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:54 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 15/31] colord: fix installed-vs-shipped error
Date: Sun, 17 Jan 2021 09:36:20 -0800
Message-Id: <f7a7fce11587c7b355a506715934692483a36a0d.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

When multilib is enabled, tmpfiles.d is created in /usr/lib rather than
${libdir} which is /usr/lib64. It causes installed-vs-shipped error:

| ERROR: colord-1.4.4-r0 do_package: QA Issue: colord:
         Files/directories were installed but not shipped in any package:
|   /usr/lib/tmpfiles.d
|   /usr/lib/tmpfiles.d/colord.conf

Fix the path in FILES to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f147cbab5d11e7f708448de1917d78ff99170464)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/colord/colord.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index df86708e2b..f514c0b782 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -36,7 +36,7 @@ FILES_${PN} += " \
     ${datadir}/glib-2.0 \
     ${datadir}/color \
     ${systemd_user_unitdir} \
-    ${libdir}/tmpfiles.d \
+    ${nonarch_libdir}/tmpfiles.d \
     ${libdir}/colord-plugins \
     ${libdir}/colord-sensors \
 "
-- 
2.17.1

