Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21D8C77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 18:04:38 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.34068.1685297077086195587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 May 2023 11:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YRQ45nPJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5289cf35eeaso2627225a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685297076; x=1687889076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRSPKDdS60FRoo8g7necyJ+hyBFWY6a2stD6rJkK/M0=;
        b=YRQ45nPJb50wGtM3JJqGpP8+y5dIgHsOpGTzx1j+fARNg/h53XcjtBbWEA3G2fxm41
         FPIJxrhUROOurLaIzZ7yKBE+2N1rM6uRXboIUhbN6wu1EDesY7/pefnXuzvJTkVjqN21
         2fKyhBZ0WCnUVIK8CJ7HDDpyvskfXsvO7/lmqhO1/4OsDQt50aBIGmXPexiYmYTEkfJB
         F3SyqxZuoQ3QxRC6Yp0wh0EwdYxXA+V86AfmRVMbfC1CCQ4LdZz16Ao/7uVCL/YBbnFg
         cEGK2khKKYWwGdM77H28XGsduDPoZlLafoqwXTCbw0EwizXMa8s2uJXTtmlSszujw2yN
         WJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685297076; x=1687889076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRSPKDdS60FRoo8g7necyJ+hyBFWY6a2stD6rJkK/M0=;
        b=jk6yRRbySD1u2H3sPiEEIbcqZnNukYkRw+Lummg7gXPOSGO2O003cf5X7KL13YUJj9
         q0OGP+qRN+gCdTKIjObhAu8D+HxpicXtUdI+rEV/jw2TWRf0zN5WgjJDDNk+DqkxReX0
         m88DlvgyKlK3goSECIgTMu1jXlP/rVHwDWmaOt4JkXTpI941cM17ZgNEcFCyP6moDsS0
         DvGNJdpuFIjzsLxxq0Zq0MlaSHlkZ8rnRAUt99eo4nUKgJyrr2xCFL58DuXVF0Qmniqo
         EhJw08DZ6WqTH7NKNo7dVpHMRK12+R1kve94KL6bkPYcxaXVyF4m43OtQllboBO0vzyJ
         +4rQ==
X-Gm-Message-State: AC+VfDx9W6vT2xf/h4ynjp9etEsjhDM5RCLnHR+MRp4NxRwcXKTzItT7
	aFlBL9hfR53wvisnfaGPKUWpJ9HI3lc=
X-Google-Smtp-Source: ACHHUZ5BVTLe1qPtVoBdpKzEoyPTZB2QQBjh5Erj6E8K3x0zmg3fvUCpHl8BXRSjC64OhZQ6igpt4Q==
X-Received: by 2002:a17:902:db10:b0:1af:ccc9:ce65 with SMTP id m16-20020a170902db1000b001afccc9ce65mr6015889plx.28.1685297076128;
        Sun, 28 May 2023 11:04:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id d20-20020a170902b71400b001a4edbabad3sm6545561pls.230.2023.05.28.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 11:04:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcppkafka: Remove RECIPE_SYSROOT from packageconfig .pc file
Date: Sun, 28 May 2023 11:04:33 -0700
Message-Id: <20230528180433.1831671-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 18:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102889

Fixes
WARNING: libcppkafka-git-r0 do_package_qa: QA Issue: File /usr/share/pkgconfig/cppkafka.pc in package libcppkafka-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
index 0cb33fcd50..fd57e4e283 100644
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -21,4 +21,5 @@ S = "${WORKDIR}/git"
 
 do_install:append(){
     chrpath -d ${D}${libdir}/libcppkafka.so.0.3.1
+    sed -i -e 's|${STAGING_INCDIR}|\$\{includedir\}|g' ${D}${datadir}/pkgconfig/cppkafka.pc
 }
-- 
2.40.1


