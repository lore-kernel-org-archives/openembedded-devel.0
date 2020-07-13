Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.11844.1594608994680792666
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=piSNFSKG;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x9so4886280plr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EBAOZLkXK0xzM2mZgAxSTDm9MZUUGbr1BeAIC2UZ2tU=;
        b=piSNFSKG3j6E8L1vmzuX3pX5dlBV2MvOxBT8KJl7ZI2CWCGx6o9nII+iG6kegf5F0Z
         PJrKTLz2SsXhAQmCt9Q3NkxAmRj6nGQLpZzk/8wH89VkOA8AahClXy0oRff37l2oN1iA
         Fd6hQLNCe4vtSiZ2HHUDgawwO3hfEqLwNwU10AB8oYH8C6A9/xVOgYnc8gj4ObQ/TRWW
         i+KppxMtwkmpCOdjS1uULZ3OdqdpWJBzU1EXOQLHnaKG56gkbIJQ7VrOWukY2YXviy0B
         lCy3PGLZ+WHh0Cx3zSOTOxddxX8LDXIgag8cusZwx7Lz6mLTghMk2au7G6G5zrXZRrbL
         o/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EBAOZLkXK0xzM2mZgAxSTDm9MZUUGbr1BeAIC2UZ2tU=;
        b=OCi2W8WfsBNoqB8rOfiPSlk816niWw4bEr+Zi1SjgvTPje75LBIc2S/mt1l2mviKYH
         TOKpFf9owf8xz1Cxt5l+UYx7typYRVNMopie4nLYLxU2JlMQQIbhiDIaAYqa21N362dT
         hHRydPXPNUJW0UXJmjT93TQ9bh5PFSeuyHIi/mPyVlvwMYifGbbrxys97ctfKTWurrS0
         9+rbYGOkfDtHdmdmuRi5qMntRh9WnnTIJyHswaGPN0+52vYI5r6se6+Zbk3kkTpjfcaG
         VTDOktsExHSEJbxwNpFgF3uUn6pYa/Mt9sPn3S9yqHYV0biy7k7LlyVAb8Ib57jRi5Rs
         h6zQ==
X-Gm-Message-State: AOAM533hIh98ulZj8ydejrybwQTAe+sX28tzbsufcMvmtTKlQezHFmLj
	78E+jynNaW8IJZuUeF/50Y7BMjngbvo=
X-Google-Smtp-Source: ABdhPJzLaz2dp+KUb6x4sZkutdU2orxN15exk/oIUktzwf1b8a3jojZ29ztqTqTEaeLMqa/pF6z4Fg==
X-Received: by 2002:a17:90a:bf02:: with SMTP id c2mr17114345pjs.114.1594608994096;
        Sun, 12 Jul 2020 19:56:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/18] drbd-utils: Add CLEANBROKEN to fix rebuild errors
Date: Sun, 12 Jul 2020 19:56:13 -0700
Message-Id: <c0d869c0958c28d2e8361961568fc0d20bd1912d.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when rebuild:
DEBUG: Executing shell function autotools_preconfigure
NOTE: make clean
aclocal
autoheader
autoconf

You need to call ./configure with appropriate arguments (again).

make: *** [Makefile:287: config.status] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 922e061fdbbc80c44f49866c7b08b2e09e4a3d0a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
index b83f68f8c1..5dabdd51d0 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
@@ -56,3 +56,5 @@ FILES_${PN} += "${nonarch_base_libdir}/drbd \
                 ${nonarch_libdir}/drbd \
                 ${nonarch_libdir}/tmpfiles.d"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/drbd/.debug"
+
+CLEANBROKEN = "1"
-- 
2.17.1

