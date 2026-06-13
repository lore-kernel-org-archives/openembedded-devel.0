Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6732ECD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:18:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87533.1781338713186894665
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hc8Bn48t;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf125989f2so13436335ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338712; x=1781943512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbjsGLSmqXWwg5sPV8Sxd38Gzz5FzIJ/kZmwspPHG3M=;
        b=Hc8Bn48tGS5fsdtaklY8FO1GzoeleVez+Qy2H2sWyHREsQHw8Vda2vGP1rHwb8zfbi
         UgnnEKW+884mD7ZeSJmwufkfp+oTAkiQ1u4cnIJseDg1rG7AGShqp72lLNU3G+6154Uv
         lim5+SMl2fuwgnbJp50ljekZv/87n/4o1nkEnTVDBAf8rTa8Ng3l/Tit0VC+PuHgZqDi
         PeW5DF9C4YwQHIGT/vaizauEIsb0WWeseGT1D2DbxYlB2ILAVc8WVPEb59hgKO/NTqPu
         O1zojTgs+QhPgvsyOogXXQfVuwH/G/V3BvrOjD8muwSOhv9aWYoqNCYW/MD2T9pJTmXA
         saqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338712; x=1781943512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbjsGLSmqXWwg5sPV8Sxd38Gzz5FzIJ/kZmwspPHG3M=;
        b=BUO+cUrqZzNLHjShEzN1y6k2+Q8OHCPgjpWYe6XuD5RLV2n2JieN9tZ0iZy72r1Bad
         jBnd0rCw0OmgpMIIvx04f07RE1uUOBMNzgK0zGBGmLSc2SbuZM7lfdaVjXZZv1RPeDtl
         2BcCdP6q9BuJzR7oNUsJuPwq48bB5KeWxAetW5Qy6C9V/mvjarxNJ7HR9PgAuWsGsWel
         s1xwndTg2SbH6XtgUMDEwzPKZ2aWoNEr9C9JadB02cBxssBNrMpYemOyJeqF3GwZ9cMX
         Tk1MmZv3MHUgJHUEf3tccKAhxsDvj+3CSAirpPtqqMloMXAR1svWdb1iRHp6rDwgVMvo
         XBng==
X-Gm-Message-State: AOJu0Yzoy3YYF5l2GXyuvjOabiK295ChLeYmoQJZJtCMtHBC299+7FQY
	gXllvBol/b1e6DRdYSva6LKWH0EYbMad/NdsExEJSjXzDGOpXAuyCdesZb7E7Rzw
X-Gm-Gg: Acq92OHnMb/ehsxtQAyiXFiZapegPhG9n8GNWzs4cR0RPEeM2FHL8/x1N+jFwITZYUW
	lC9tRHbFBi603An4VOmY2+RiqzRRZEZfFUzY0znW6yoE3GV2XZ+vw8alnfCJjtG5QWYzM/8S+TE
	mvj28Y56M5zK3bV6xifL9zBOt/ExfjaCsCL8VlTylq0ajnkSNtAWWt1tlQ2QjuwOwF22i1jve/W
	cNtSqbAAsghkBTELNjUPuMPo/GvsSnUvd+91LuUQT4YdFCwQy8+qu5VTImEbItZAsKiE4DrZjx+
	Oh/iXnwRf+gUktVW8UPJw99ep/z5te5gnhdwGWaRqqtHp9bpg/Rbta6i/c9rDstYm+fRw1HosUO
	bGUx50QvGzDgbD2ieF9ax4M0mrzrCNvQI/VHQbThadJtOd7qemKv8wleHDWS4TDzGbXq9RHlJcA
	t/eFGDiPa7n8e2yrvlykidoSb3j7hkzuRXF5jJqbH4Xi3Zseo=
X-Received: by 2002:a17:902:ce90:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2c4137e5032mr67997985ad.27.1781338712409;
        Sat, 13 Jun 2026 01:18:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/16] fio: fix build with musl
Date: Sat, 13 Jun 2026 20:18:09 +1200
Message-ID: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127553

From: Max Krummenacher <max.oss.09@gmail.com>

Backport the upstream fix.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1f265bd73deee6142a6dca9fd80d0708715cbc5b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...inux-prctl.h-include-to-fix-musl-con.patch | 33 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.42.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch b/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
new file mode 100644
index 0000000000..9019e06f26
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
@@ -0,0 +1,33 @@
+From 82688fff1241549177ed4d55c27c93117d738947 Mon Sep 17 00:00:00 2001
+From: Lucas Hecht <lucas.hecht@agdsn.de>
+Date: Tue, 26 May 2026 18:49:48 +0200
+Subject: [PATCH] backend: remove linux/prctl.h include to fix musl conflict
+
+Building with musl fails due to a duplicate definition of prctl_mm_map.
+This is because musl redefines linux/prctl.h in sys/prctl.h.
+
+This commit removes the linux/prctl.h include.
+
+Fixes: #2096
+
+Upstream-Status: Backport [a84eece62edd46c1f4c8047f1052ac6181fc8b3e]
+Signed-off-by: Lucas Hecht <lucas.hecht@agdsn.de>
+---
+ backend.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/backend.c b/backend.c
+index 230d7fd07965..cfc411531818 100644
+--- a/backend.c
++++ b/backend.c
+@@ -32,7 +32,6 @@
+ #include <pthread.h>
+ 
+ #ifdef CONFIG_LINUX
+-#include <linux/prctl.h>
+ #include <sys/prctl.h>
+ #endif
+ 
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.42.bb b/meta-oe/recipes-benchmark/fio/fio_3.42.bb
index dac7548d08..966ae644b4 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.42.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.42.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 SRC_URI = " \
     git://git.kernel.dk/fio.git;branch=master;tag=${BP} \
+    file://0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch \
 "
 SRCREV = "ab77643023f5d7e3c1b71a7576a564f368bf577a"
 

