Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EB0C6FD19
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 02:47:58 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.383.1678762069229175047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Mar 2023 19:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IzXrxUI5;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id y19so8101256pgk.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678762068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4B/coiPJZRJiKVeKNasv+ZeYfqGPRMNa4WylUHrwZqI=;
        b=IzXrxUI5Ojo80Nalb5kZocMlWpuY6uwNnZTAoNQPk5E36YBuKpn5Gs/6y/cm0wyENh
         w5do4x3WdiNuzmNg9MgL1SUDqVxgoo1WjJYScJ+2EjgxWwMemlkurBK/LmMZKN4n1XTu
         JGNfPmOss0efRbK4bpohiSnj6wxoQ23mZEhVZCr5iTHSv+BumVnAkw5cZLfPs3wjxlQU
         Ge2ash423ZKtCNQlFxurG2bp2Q/aXI814GbmybaNlbPWII0WLeCeo7ipn5Rzq6x/nh7f
         zlR9jhv8rkcX+GaTFJ3ass1uGY+/vGjoEC0aqC/gAgndzL2iYVXWthKCoghgtsEgAPdd
         R/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678762068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4B/coiPJZRJiKVeKNasv+ZeYfqGPRMNa4WylUHrwZqI=;
        b=ejqXCAax0nY+yqfBKvE/UbrpHhgBN8ngFlFtGNJM5zPVditMZe43eteT4kNgZ6HUpo
         ENJTI3E9f4TSIevjtt3q5ZuYwt989r1sq1a2paJkahAg3lJ24UvZfJusi4NOra1RkfiR
         xTmicZVF/vNauzAeUo0GtwKzMYG/sdsiisbZzTFex6jj/wD3Yh7pRPzbj0X0aDQUPGpU
         cE72mR0P9JnCUgDUb6aQ5yTZ9RdmiQ9v9Hl+c13OyaQ3kEQ8ut82xKT9nYmwt7S3sRY4
         TAs5khoHVXbbg8OhSmHRQwxjtocXaFymOVxjO6u4rdUqFuHvUDCzEcwL9Mcut1HBZ+/g
         IJVg==
X-Gm-Message-State: AO0yUKU2id/SsnQAbQzBnSRSxCJv6Ayaoy9faFhyTdIKkjMoeJNnp+SA
	2YzTqr2FOf8tNzp6u9fq8q/nXhit9IhXrg==
X-Google-Smtp-Source: AK7set8y9W8zj5SP6Z+s2aWDALA74VyG1TnDerWfgBW60lCl7/WgUyhk3LQn+wmWOIfWyPYtXyEq+w==
X-Received: by 2002:a05:6a00:1819:b0:5a8:ac15:534d with SMTP id y25-20020a056a00181900b005a8ac15534dmr14773480pfa.13.1678762068341;
        Mon, 13 Mar 2023 19:47:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::6b15])
        by smtp.gmail.com with ESMTPSA id h17-20020aa786d1000000b005a9cb8edee3sm386670pfo.85.2023.03.13.19.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 19:47:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] freeglut: Drop -fcommon and add -Wno-implicit-function-declaration
Date: Mon, 13 Mar 2023 19:47:45 -0700
Message-Id: <20230314024745.3124007-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 02:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101516

-Wno-implicit-function-declaration is needed for keeping it going with
new compiler's e.g. clang16

-fcommon is no longer needed with this version of freeglut

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
index 86b94149bc..b433900bb0 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -16,8 +16,9 @@ PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"
 PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,libxkbcommon"
 PACKAGECONFIG[demos] = "-DFREEGLUT_BUILD_DEMOS=ON,-DFREEGLUT_BUILD_DEMOS=OFF,"
 PACKAGECONFIG[x11] = ",,virtual/libx11 libice libxmu libglu libxrandr libxext"
-# Do not use -fno-common, check back when upgrading to new version it might not be needed
-CFLAGS += "-fcommon"
+# Add -Wno-implicit-function-declaration since it might be otherwise treated at
+# error by clang16+ and this is not really a problem
+CFLAGS += "-Wno-implicit-function-declaration"
 
 PROVIDES += "mesa-glut"
 
-- 
2.39.2


