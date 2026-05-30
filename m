Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB87CCD6E54
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 14:00:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7349.1780149627102878385
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 07:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QxJYLpAu;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so92671165e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780149625; x=1780754425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCCW3DDtxwtKd3NDwoF24aQqSNHt7lhoopfMIRIHK08=;
        b=QxJYLpAuRCsdY+QDPH0d2x7zsePPBH/UVHP3wFzEM7dsxoyKh5aolTQ8YUemUeyjdv
         dj8yZzfWr/BhpLZQ0Gt/qPjciR/yx/qI1lYx2aGoqwNH3X1JpiCShPEuZjToUnBTecep
         Vd+TkFV8pdKkP2NTX5OZy0otLVf8pe/KandhvclwIJFzG0JPrhQ6EYS/UP1SfW8ykSXS
         AjKGsRy+9fM/SKF6cl3DEqfvGfN32iWRg8XCBPBpWB0L9EOigaYMCSyepI0qKQUpxN3F
         naKEWetiZzGdUPJcMATb9z5lAzjrGXHy6H2khKGnhe+BB+bBJbqd+l1vytVwvgmty0P1
         5yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149625; x=1780754425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCCW3DDtxwtKd3NDwoF24aQqSNHt7lhoopfMIRIHK08=;
        b=G2IiVxY2fjWzt5veIKktnmiyrLXk2AkF6K0R2D0FavaBOwSiDwuva5CTH3PXFnNmUF
         mor/oVOC+9vXLeZWQOx5QuFVxD0/q2DWBX57vK3ME34kYWiz3AoT6VnXoiAmqemEBXUE
         4qZd7P+FqcWrBOJ8hqW5ZqsiZvJBgPXMIwj2oK+e/A9LnQ8vMgqtzngi7xrxQIp7/zwh
         W9TknqPL2+Ol9hFu5GZ4gLYhUgAh76H6+xoVlwXNP5FTp3FAtiQNZ01SlS+ybJBbOuAh
         Ddfueriz/gN3KgJ2AwOkjyKKm3qjPj8CvxjscXlPgZ4LSMzQvBMOJieVJxDg+AqKlRys
         v9FA==
X-Gm-Message-State: AOJu0Yxu4FE37c9aYrKcWdNEsjCST7Or/yvZA55FQtAexhUNFBDS91cp
	+vVGKeRiOPUCVRZ0ZbR+MUG/O7TXTybtIGtqN/6ysYQIVj9M/O/JF3C1/kOoTw==
X-Gm-Gg: Acq92OGIcm7b93ioPWamN9QyxjvdYG8lZkuJGm3VfCZfSj2DEszGu1BI5DyeV44Gl2d
	TUVK8we/zGWbkFIYyJ9OKRGQ7J/JJEiCeexAkrAmpfqI32MibbZscNeQKrxGeWIXdPKx7jXkYMx
	kSTV4KsnSBaRffjhKMjbJ3/yPpLUulYTSvtFP7A/cQTG06EYTMDQ5HLBVRkKoEN/cKsWmN2RmmE
	FGIJtxLgwdUkNO3FECKi0RPjAtqoSylA2kZYV/ZY7X+JPpa9B9pZDy+6MpfNgRfJaQbAt/8tTnK
	LwVNMiDbHbx3iC9ta0GF/b/bhuWrLPx3c/dkLrGQUH+62No2Sl0Y7ZdUwZURsP2TiHoHBEcP4bc
	N60WVX7r4lnmANOMbQWUrQjnOv7/ua6+31BW7xXkZBRUpKN+2xWkrOeXXi+CeHI8Kvq//0VR1zq
	suE4ga40vR/leC/hFbSfBfhyWgpCuHVQUMD2b3A0iO
X-Received: by 2002:a05:600c:6008:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490a2963f07mr48291765e9.25.1780149625263;
        Sat, 30 May 2026 07:00:25 -0700 (PDT)
Received: from Saturn.local.all ([81.221.206.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c12359bsm43904725e9.4.2026.05.30.07.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:00:24 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [meta-oe][PATCH] fio: fix build with musl
Date: Sat, 30 May 2026 15:59:41 +0200
Message-ID: <20260530135941.294665-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 14:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127302

Backport the upstream fix.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 ...inux-prctl.h-include-to-fix-musl-con.patch | 33 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.42.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch b/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
new file mode 100644
index 000000000000..9019e06f2676
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
index dac7548d0835..966ae644b417 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.42.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.42.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 SRC_URI = " \
     git://git.kernel.dk/fio.git;branch=master;tag=${BP} \
+    file://0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch \
 "
 SRCREV = "ab77643023f5d7e3c1b71a7576a564f368bf577a"
 
-- 
2.51.0


