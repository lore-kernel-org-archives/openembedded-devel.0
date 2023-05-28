Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC9DC77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 19:08:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.35289.1685300904639381152
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 May 2023 12:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YaXXFuGU;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso1903815b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685300904; x=1687892904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiniNRfweuvTrD0sh2PwqPPXpJ9aHitZkxP/WnNPE6E=;
        b=YaXXFuGUQhCGjE29aOt0qY9gj7CMW6QD6mNFiw7v5T8am0ZyLBF3YhI8xg4ARpK7Wp
         u5q3QrQ1/ZBQZWSgQn9a7uUOUNgGXtsdS5qyt8gWtrtq9Lt2+f17zBsVccE8fYnaAwmD
         /m9wtSLfU/7Rj85Kno/bDzRdCmy6CfUGhq/TMVZhWiFz65WZTDWKFGWWK2S1y8+ZochC
         VqlJJDPPLxmyiEr7+mgeXV1tqAEYrsopoeS/bA+bnQt7hFEcU9W4n6oXXUHFhGf2lpWM
         UeWHNpNhPwZKD93Df0pBlN1L/3d0Ofj+lyybA18zNV1Vl1XUHCLuXcl8JcmSTcujVU0n
         Cqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685300904; x=1687892904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiniNRfweuvTrD0sh2PwqPPXpJ9aHitZkxP/WnNPE6E=;
        b=aZcwASNlrJpGuevQy8odmXWnY9ASlQlCG3+euGZ/FIq1LryFEDMzBWiGj4v4d9P5X3
         6sTF3xNG2JWScRJWFkCy2nyCXEQLkZMhevUQX+xNrudFdNd8nGaR+MvdC0qExwMsyyoC
         jGEwigjJbfH9eqInY34yDwqxxsJcsQwU/xv98vKpIotv6RtqtTT6mm0v4oYsuOiqicxI
         TQd2ZzFBB3KDmlTJpsKInSTt1la6pvtvGDfkaweWq9LeBVZRoWFWGkK1Qic3li0vRmb/
         ey8zDPvkU4jlHuUt4ZIUwRzIkhLxvzMZ3sP0E8JkoL5eajusn4/wHUbSG8v9z4RwG4Es
         A0ww==
X-Gm-Message-State: AC+VfDxdxdOLARyOc8PAGUwX0bNb25wAa6sMpf4lsnRdvcjKZqIq8eEB
	OKIKxMwEKjQv8xArEW2EpqZXYRNlqDQ=
X-Google-Smtp-Source: ACHHUZ49r5NZmzgCvP865dNW1IhAAVSjXZppZeXFxYxoSB/qT55IaCbUnW7R0IZGbGGEkVySgQ9XJw==
X-Received: by 2002:a05:6a00:2d29:b0:64a:f730:154c with SMTP id fa41-20020a056a002d2900b0064af730154cmr12299765pfb.13.1685300903719;
        Sun, 28 May 2023 12:08:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b0062dba4e4706sm5461273pff.191.2023.05.28.12.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 12:08:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ettercap: Do not generate #line directives with bison/flex
Date: Sun, 28 May 2023 12:08:21 -0700
Message-Id: <20230528190821.1918617-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 19:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102892

Fixes
File /usr/src/debug/ettercap/0.8.3.1-r0/utils/ef_grammar.c in package ettercap-src contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 6c07223b31..723d7c8f78 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -32,6 +32,8 @@ EXTRA_OECMAKE = " \
     -DBUNDLED_LIBS=ON \
     -DENABLE_IPV6=ON \
     -DENABLE_GTK=OFF \
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
 "
 
 CFLAGS += "-D_GNU_SOURCE"
-- 
2.40.1


