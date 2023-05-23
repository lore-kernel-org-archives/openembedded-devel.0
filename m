Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C05C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:51:57 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.14153.1684817514864357852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SDK+pK1s;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ae85b71141so36849135ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684817514; x=1687409514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcuSXFSgflTeS/UALpIIt/AWqeRaPsZKA3f8DFfBcPM=;
        b=SDK+pK1svfmlf+N4RD+D5zmpPNEaOahwOleUGWHHR8VaL6aU0a6f1pH8uFyhIqA2RM
         8hm2Te4oz+BZqjqvn7F8PUF5yiD9NLMU1gofCXDowP9Fm+HoK4v/Zu2e3sgd/0HH1xDz
         EllO2/BVkvIyC3M8DzGglCKzVvG7Dk2Jmn51nOmlWZQIi8vzG3DgRHJWEp2GjBuqLHid
         GEWocahBvuh91TI9ReYWMSCW/DeCugv+eC9WfSgR2MacQO8a7pWlNoCunx4GWGqjKdru
         tRyEQVIGnW+DLuRqS4rt86/+ffXnu6y8Ma6vHm3zq1YjT/94tZVSOKg/C7UzIrAb/MTs
         0QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684817514; x=1687409514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcuSXFSgflTeS/UALpIIt/AWqeRaPsZKA3f8DFfBcPM=;
        b=ckkngE6myKsfrrpk6pIke22cDpDeEAZiJyC733zr7nkgKcJp5F1jk85a1hxOm5S58z
         33GQ2S6JzVyYDcGHBHlXqO7u0vaZmpI6o0ms1P/v72dIpvYlh+vd44ldPIzgZV9SPgQq
         XA3KCisyRrYlVXlnRCAt+6aYIn4BLt8XcX5FebRreyZCvXm/4hH9/iGuMQWgrY+NVUZE
         D61lKuDo45mkPKqMqGTBOS0SIlQAZkKXsuTFFiwNMnOyhzqC5FhbKcvxRj7T8xP0c+bz
         kOs3L4a9HM8kXyweL3PuAVhHP2+m9NqDHNZ4UoDiUdap5S5RTNc42BvjJfrPCI4NqEUN
         AClw==
X-Gm-Message-State: AC+VfDzxaRLs7YoIB8EzJ2A3LojqAThk+4G6H+nUuUl00OGNRQohbCwE
	Pp8WvC7Ub8x5cVub/xBRo10Y2bsyZHc=
X-Google-Smtp-Source: ACHHUZ4l0ngH8HvJMfiN5eneuxTbQbYnepH/kPxGjrV7lXhe3QrQxWOwRhAxccrzAer8HYtbt6c8FA==
X-Received: by 2002:a17:902:e84c:b0:1af:bfb0:e7e4 with SMTP id t12-20020a170902e84c00b001afbfb0e7e4mr3891838plg.36.1684817514012;
        Mon, 22 May 2023 21:51:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id o5-20020a170903210500b001ae6fe84244sm5690390ple.243.2023.05.22.21.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:51:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	jan vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] fftw: Check for TOOLCHAIN_OPTIONS to be non-empty before sed ops
Date: Mon, 22 May 2023 21:51:51 -0700
Message-Id: <20230523045151.139311-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102729

Ensures that we do not apply empty sed expression which might happen
when building native recipe

Cc: jan vermaete <jan.vermaete@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index 1fead4d029..33e8279880 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -55,7 +55,7 @@ do_configure() {
 do_compile() {
     for lib in fftw fftwl fftwf; do
         cd ${WORKDIR}/build-$lib
-        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
+        test -n "${TOOLCHAIN_OPTIONS}" && sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
         autotools_do_compile
     done
 }
-- 
2.40.1


