Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA481C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:50:54 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.9180.1711417850522169989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SBkY3fop;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso2491689a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417849; x=1712022649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGYAhJ9w1gEUvFE/0YIizauKIaxVRWibUMhyZhxeEf4=;
        b=SBkY3fopELN98xCWhwIEjb3zgvoi+UX7aqVo8AI6Zq+jzAbWdFzyUXDwYVJXCFns6t
         xd5m3R8cPD5UCXKVEOwmJiV+gLSxXbpaWz6uxoE72G7RXqCZP55GwkB8DG6SMFyQ7AFv
         /ua8edrgTYXp/DPqiOGxOpTfd3jgsxFSJBLKgW86CAq44mC9de+aeKXW54kzDgjTCOwy
         Zj5R1JL9fvhnMEzV2MASnnCYqWMbAwo0iGyVRiLIy3Yanlb8Vg4NWVnDWsCZ0V6HfI7v
         sQPCdd6y+wuWSqUGjV92LkunFaz5AsDY2HiIUlzNaef7jU0rqn5qquKnxL2aq5A2lhcg
         aH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417849; x=1712022649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGYAhJ9w1gEUvFE/0YIizauKIaxVRWibUMhyZhxeEf4=;
        b=ui3iHGvNLwFwKoflMF5lYqXuXrG89Xkidi31qTAcRrLToenobUK+xokbWr5Oj4vKg4
         aGL/GXi61AqJzjkgy6g3947HaCwitRrygMVZVeU7YrhRM2cLBssK/Q8gp/Ixfj7bPwwS
         J6kpxJbh4lYTACSFGxqDG1zAj4KgYW2mM4KkayXG1RD7QHqH1rEvp7qdAXDaGIton//p
         ZapGpZFRkOUQD3smH0ox+RwxT2lnA08AQu4MwuW/t8wFRoCXWRnKnjWjJ72Aa+dVmoL/
         u0Des42z0C2Q5e07sdD9N2etWucqiA2J2qORpv1kGWy1qX98wuURBDbn+/Io62RriJiH
         menQ==
X-Gm-Message-State: AOJu0YxHEpbLOGK/A/Dzjo2gHjw9un7eFIVDEfh3LF/zQVRGpLS1Uqqa
	STlDvCA8xhdxgbj620JhnmolKfr4b9NcWP5L4GF5CuOZxKQtZTb271+MqRcn
X-Google-Smtp-Source: AGHT+IHcakKL9ZA3XVddsjj0pesY+YZBrNjJqcFDcO2Szs+IL8+LLNyfk7PpszlgqBCjIrDE+gwIig==
X-Received: by 2002:a05:6a20:9598:b0:1a3:d60c:4de5 with SMTP id iu24-20020a056a20959800b001a3d60c4de5mr788911pzb.13.1711417849403;
        Mon, 25 Mar 2024 18:50:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/10] sanlock: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 18:50:36 -0700
Message-ID: <20240326015047.543274-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109610

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 32 +++++++++++++++++++
 .../recipes-extended/sanlock/sanlock_3.9.1.bb |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..439ffc6473
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,32 @@
+From c955ac2a4d57f21351e53a5209346fdc2325a747 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 15:12:02 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wdmd/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wdmd/main.c b/wdmd/main.c
+index 38a99f3..7014462 100644
+--- a/wdmd/main.c
++++ b/wdmd/main.c
+@@ -15,6 +15,7 @@
+ #include <stddef.h>
+ #include <grp.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <string.h>
+ #include <errno.h>
+ #include <limits.h>
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
index 91b1460ff7..1d0f8b0103 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
@@ -16,8 +16,9 @@ PV .= "+git"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
+           file://0001-include-libgen.h-for-basename.patch \
           "
-SRCREV = "90156f382c2508cc7dc4dc32f8247d3e1291b318"
+SRCREV = "ecf30a1ccf756776dfea440e4cf9b0b54581075f"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


