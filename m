Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78EAC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 20:12:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.2577.1643141578178552702
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 12:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hyfQGfYY;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 n16-20020a17090a091000b001b46196d572so3936127pjn.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 12:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UAnzOWf20tPQ7ZYjwvJevWKYIJ0dMt3eXZQzYpSQ+k=;
        b=hyfQGfYY+lNVNWcRRmVJlEsP8ZMIyQ4qqZWQHvhtSDe5yhPAPk23jV55QnGgP+j83u
         khsaPfou1+0xs83/xT/0+TSye1cFTRbP9YaXO4t7J4dHAYvEbS79RC2f7I1ayTwJgx/8
         Dd4J3vxm6I++PMNRrvSn7qExLu/+okvFu6KSblNMCuqiXUFOLU5DBnnCHebKg1MTaGRC
         UGHCkwgNNoWmxreK7XP918SfsSj7TjRCxXCmzePNQJxkhC4RWyfxH2XKj4QQ2Jalf3Lb
         6bphLP8VUlQwD4gXmvIvWnhdv+UWbEY9wFwjgR+gFn6MhrjC7fCiAgssxY6KMVJcMm29
         GbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UAnzOWf20tPQ7ZYjwvJevWKYIJ0dMt3eXZQzYpSQ+k=;
        b=7qLiGxTiPohaSsTq0rX4+iJldGbwfPQc/kvETqjOqKwqvnt2ZcwX976tLheTzvoK/F
         z9KbgtT3pp+wFNKx6VVtqS9SOsLdXWjukKl2k2hgRLHpuKFgLSWSYGRukLg6KhxoGLm0
         UQB5a7vheh6xU1QYOWEwgy1T5lgT0psgkUNiiKgCJp01XJVvObMeHBotkAH47uuY8GE1
         4UONhd8oSZKWJZ3/J5IRbHpqK9lyEoLq+5ILA3X4SSZUExLPhq/nXQcszkKSIkL/4WW2
         PC4XwWy5i3R4cLlVmvY2F1w+B3BK+v0SpT8DImxopoOkmmDn4DDw1F38+gic1lg/vEOM
         8KCg==
X-Gm-Message-State: AOAM530K4qoRl6Yso0BFv1sWqlSpEz/7HZfGcEpVTi0XjlOnRSNzk+br
	juWIx1iaBn/THhy2Uo+BlHOd4aK820hmGA==
X-Google-Smtp-Source: 
 ABdhPJwiJS0QqgGxUmooLev8iFOYtPWdUI2Zc5sgz8IXmYCIGTRx6v8SR/ECFwu2nATD0zUnZkJJ3w==
X-Received: by 2002:a17:902:8a93:b0:14b:6cd8:16d7 with SMTP id
 p19-20020a1709028a9300b0014b6cd816d7mr5666055plo.97.1643141577272;
        Tue, 25 Jan 2022 12:12:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 s42sm9368513pfg.146.2022.01.25.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 12:12:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] evolution-data-server: Disable g-i data
 generation
Date: Tue, 25 Jan 2022 12:12:54 -0800
Message-Id: <20220125201254.1288738-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 20:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95084

This still fails the build, since it starts peeking into build machine
sysroot

Fixes
| FAILED: src/camel/Camel-1.2.gir /mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux-musl/evolution-data-server/3.42.3-r0/build/src/camel/Camel-1.2.gir
...
| Error loading shared library libz.so.1: Exec format error (needed by /mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux-musl/evolution-data-server/3.42.3-r0
/build/src/camel/libcamel-1.2.so.63)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/evolution-data-server/evolution-data-server.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 9ccaedbcce..3be2742c20 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
 
 LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME:libc-musl = "HAVE_LKSTRFTIME=OFF"
+GI_DATA_ENABLED="False"
 
 EXTRA_OECMAKE = " \
     -DSYSCONF_INSTALL_DIR=${sysconfdir} \
-- 
2.35.0


