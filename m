Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3CEC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:20 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.16165.1647763699548875444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nwb9TEaJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so11939739pjp.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q3BUuU5oUMD9NbiOpfCNn4RWFOAsp2bnHkk8a8dhqqE=;
        b=Nwb9TEaJNIWziG7tjdOyTWi4G6FDU1pC2GFSPr3y4KtwGEigHSBNzvNEPdx7qxroxL
         MrRiu4ug4fdvpnYZDK7wEa0YYrNqOb+U18cVIO2rRMDvA8ZjHkEY3s4QP1c1ngH1FjGd
         EB7hapOu+WZ8vFL+EMog+Q/AqyWoo/5e9i1GdQmNMFwS90qxk+6DJGvZqzcyaz9c49MH
         wrfvlIbLO6Q+w4IDnYB+vr7ragG+vvOnkS95pN87wBU7qDA2QR6shi/gabbRFvjL6og6
         rJR62GVSacLtsdfZ6r4DqXhvFdra48mEfYGjMNaTqR2WM24D2Pv7IE+ZkWotDskdVtSJ
         rJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q3BUuU5oUMD9NbiOpfCNn4RWFOAsp2bnHkk8a8dhqqE=;
        b=2RRdDs1KvtIxm2LNZP0IA0z6JMKVJUt3Oqf+PmTcsPPSYcl9lL/PM2OP/sQzFujKUH
         S/2y0diRIuKtb9SQyITs02yo699voS5oGIGsdMWOY8GiH94IcwZri6A2Xhbakq+CfqvI
         BG0NkqTiuQ62y+6QzsCuUn8MpGjtnRRd7dXlNNgGsk8ulGgoyc4GjGwvoS0qeagajVHA
         jZR9cciRXQqVyD79NmdzrUFt7h2haus84opfrTRpFa71qb4s9GTivoS7QPzn5kIuFrsK
         n6SVARNEh+WD9TmRJ5wCgFxKObMSUk8mKg776VsoxxysWw7ZNHzjSP191XG6Jhfm9a7V
         Xasw==
X-Gm-Message-State: AOAM532JxEezcdtAYZkIRQvIVQDnDXLHwtcTmYlu7PzF5jlajslcAB2B
	mIN1mjAwrVeZ+dzq7l5x4WIbLlJOTkPUuw==
X-Google-Smtp-Source: 
 ABdhPJzjoZhQZtYQUdIJEZVcUo8AghqrtbUKs8XYSPUwV4C8+r4TmZQDb1zHxhV5iPSzuv2hTAL3Fg==
X-Received: by 2002:a17:90a:f8c:b0:1bc:cf23:2319 with SMTP id
 12-20020a17090a0f8c00b001bccf232319mr31081775pjz.67.1647763698797;
        Sun, 20 Mar 2022 01:08:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/17] liburing: Define libdir based on environment
 variable
Date: Sun, 20 Mar 2022 01:08:01 -0700
Message-Id: <20220320080815.825928-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96067

default variable is set to hardcode 'lib' which may not be right for all
platforms

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/liburing/liburing_2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/liburing/liburing_2.1.bb b/meta-oe/recipes-support/liburing/liburing_2.1.bb
index 90efa573f3..da8e6d3338 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.1.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.1.bb
@@ -24,8 +24,8 @@ XCFLAGS:append:libc-musl = " -lucontext"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'LDFLAGS=${LDFLAGS}' 'XCFLAGS=${XCFLAGS}' 'BUILDDIR=${S}'"
 do_configure() {
-    ${S}/configure --prefix=${prefix}
+    ${S}/configure --prefix=${prefix} --libdir=${libdir} --libdevdir=${libdir} --mandir=${mandir} --datadir=${datadir} --includedir=${includedir}
 }
 do_install () {
-    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+    oe_runmake install DESTDIR=${D}
 }
-- 
2.35.1


