Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0983DC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:14 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35353.1790506266457597842
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aDi5dNhf;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc791f087e3so631524a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506266; x=1791111066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2acTmGyzaMExmC3OW4lMqx4hW6mWYa2Yuf3gtcbptE=;
        b=aDi5dNhfq7qBxWbBBf0bgwaH46ksnFTRJL0E7ooJ1ZFMIimmn9H+Su+yAxpuwB6gH6
         TOgwDPNW091SksBAsbYmOZ6sPsDoSjHbDxYn63bPwh1di6IXLCj6EG9+bgRTUkE9UTp+
         3jzpM9DIAjltL+nGcY/Ztp4d/gjIWqD3d87lOxKDDk6XpJnOSDaViVdW2SKO2jc9STFV
         8gNHJeSJzcw39ffTvwU+AM2LNvZVXooLEhsmqr87fncSMi5Ff8sJxgIHHRgUNc11/TrU
         CzqyTEBNoMq2/DssBnoNJ54ZsmVy6AgOwf3z/Eb7IZAJtAC5fh7UP5kyK1EW3uENEH/Z
         Ykvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506266; x=1791111066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2acTmGyzaMExmC3OW4lMqx4hW6mWYa2Yuf3gtcbptE=;
        b=ve/bs+saNafrH8oD3+AVtE4Rt9HzAakoxhN7725tyWlnPanxi2adhWWL6tAvJJR82J
         jn7VoTP8LtJ1us9o1XsIWQRTWf9uZ22v4M3PH5e1PIcXWEvfD0rQDAf8MpI2CBAv4IqI
         dfmTmZlPkL1nlz3cPgLzpRtXGsRFns7xdyssXYb5Kd6g38ldZs/8h25ACaMbGCHiCeKZ
         LOaQ6nWVYDgSaoqVgiJg67ZN3pwKP0Bq7AYSzc9T7KwzEcKQ84qiYkrUf8rf1MRbsWfB
         kt+grrFjljjri+9JEUSW5sA94519yC5qH2doYMdflXrJCZLPo1hLTkZYsu3OV62Kcbk6
         ftpQ==
X-Gm-Message-State: AFuF++mRkMojux6a5n3BAj4sAMHYQgF6fRU5fF5kYroy4hoHHCmSz9va
	BkOC+cbW+K3v5R2ezf4bh170cgYxHCMp6N5KxDyexzuxei9AVZ7y9tUoBmUXBQ==
X-Gm-Gg: AYBFou0z/4NneMtPwjYBOJdD9gA5w7lR2dRx8UdLbW5tB9bW/gt2JolpcJOfAB8Zj7H
	ZVRTYdV5c5Oaar/G1LEFeDP7gxk6208A+d6TnFL/Fcm75UYHp3TQe0sPZGi8x/XsjWHfZdDGVPA
	jjIfw85mU+2QKtrUZD7HwYlePn166nU5hIHRjWunuS18bugY2xh358J6+lFmnqxSiwSJjnQ42kc
	B2X+lu/4E/djr+jayDxB86N+2lEbBhbC9OBfpQm5Tb97cvf7rt2xXhcLo+mCuc+Uwuej4Leb1ms
	26I9Sapp+fffLKDHzABDxyugOsqaLb61PTn9EJpWOuM6yKCqa9NIkGYyCzMfc9rv9VKfHxPcgyo
	CEkeILUg4u2qc/2TDpNZu1DJ1ovtZHyHQAjGWAVLfMBMYgVBW0XmMc8DUEBPaPbyEx0vwMRGook
	0Oeztb5hblZs1MQCV1Gny00671z/z3My6sDagslmpaJsHM2rtjR05uu0py+dDzk3+HmDjmEpMV3
	LNLDMXA6NOefF0En0yPZ4Y=
X-Received: by 2002:a05:6a21:8216:b0:3dd:a195:fa0d with SMTP id adf61e73a8af0-3de0e933a8cmr10640280637.50.1790506265788;
        Sun, 27 Sep 2026 03:51:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 21/35] fio: upgrade 3.42 -> 3.43
Date: Sun, 27 Sep 2026 23:49:48 +1300
Message-ID: <20260927105002.1832451-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130355

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...inux-prctl.h-include-to-fix-musl-con.patch | 33 -------------------
 .../fio/{fio_3.42.bb => fio_3.43.bb}          |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
 rename meta-oe/recipes-benchmark/fio/{fio_3.42.bb => fio_3.43.bb} (93%)

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch b/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
deleted file mode 100644
index 9019e06f26..0000000000
--- a/meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 82688fff1241549177ed4d55c27c93117d738947 Mon Sep 17 00:00:00 2001
-From: Lucas Hecht <lucas.hecht@agdsn.de>
-Date: Tue, 26 May 2026 18:49:48 +0200
-Subject: [PATCH] backend: remove linux/prctl.h include to fix musl conflict
-
-Building with musl fails due to a duplicate definition of prctl_mm_map.
-This is because musl redefines linux/prctl.h in sys/prctl.h.
-
-This commit removes the linux/prctl.h include.
-
-Fixes: #2096
-
-Upstream-Status: Backport [a84eece62edd46c1f4c8047f1052ac6181fc8b3e]
-Signed-off-by: Lucas Hecht <lucas.hecht@agdsn.de>
----
- backend.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/backend.c b/backend.c
-index 230d7fd07965..cfc411531818 100644
---- a/backend.c
-+++ b/backend.c
-@@ -32,7 +32,6 @@
- #include <pthread.h>
- 
- #ifdef CONFIG_LINUX
--#include <linux/prctl.h>
- #include <sys/prctl.h>
- #endif
- 
--- 
-2.51.0
-
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.42.bb b/meta-oe/recipes-benchmark/fio/fio_3.43.bb
similarity index 93%
rename from meta-oe/recipes-benchmark/fio/fio_3.42.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.43.bb
index 966ae644b4..928b31ff3d 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.42.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.43.bb
@@ -24,9 +24,8 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 SRC_URI = " \
     git://git.kernel.dk/fio.git;branch=master;tag=${BP} \
-    file://0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch \
 "
-SRCREV = "ab77643023f5d7e3c1b71a7576a564f368bf577a"
+SRCREV = "d2dcd7e053d1902d2420f151c83990e6acdd9f8c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
 

