Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E394C25B0C
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 05:53:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.11154.1659851581786355238
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bQq4tg9T;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id w10so6025949plq.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cxOYPYYdmUedkOkBYgRUD4LW1aCCwxaNc3oFH15RPSY=;
        b=bQq4tg9TmOnURL1qjZBbhsRNBhNW+UU0JVDbrZZldJFydef9gXmaB4cSZ7vuTsaJ0L
         CJ4ZXL4ZfB1GYB5T5jM/Ja0CsXnCyCc7SBCZFQNJ/tNzPBp0mPQ5eZfF1WhPpaQNJnT2
         ctuKYwwFfu8u88B4FU90DXrw5E7M8WGcb3HhyeRFp61PWLcNpQFFpM/KRkU1+1dggsGD
         Fxd1wgkJiH9Jw2Xz0IxE8RNud+h8IQVihBQqbBJKibauUNOziQ9oH7nlDNxwQIne+IRF
         s9ieX6dZiMnEtkkamwbuAO1xLSuArf25zcLaooNEVySJq1M7JtwGHKul6DiLB8slUJKt
         d0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cxOYPYYdmUedkOkBYgRUD4LW1aCCwxaNc3oFH15RPSY=;
        b=KUd9SYfxGDZwrMqpO7IL5Brwt8g7yR+e92wf6n62zJfm8LMNeKTjBMQdkecpysz8aU
         /I2LbUjIzNSXw9VnlCU69tdBWCSZ7/KOFDpwjgBoh5TbLm3CRdpRuPwaRt8UAdlc6WiR
         XkuWvGhTqqUgDUuKY2Wotjaq9npghYSB18lhRrWNjnVR+xFArG142kwYOOrdC93U6ga2
         aXitlPnaJn9AF7mTwtvUyHMaVEty17q85z7UgSMoAIZugKjY4psnlijL0rJZ6OqExPwB
         gw4nfCny7F4xKo98Ggrloz2qiggxS+mKGn2bDhJc4q+QCBmiG2m/RY8banXHU4JdRyYu
         wP2w==
X-Gm-Message-State: ACgBeo3YISJloZHhKN/SimWmXpwRkSnwX2rSjL7UaREJniDKwAKftu0o
	mfzOV7Cc/6PLkVxoAi05sYyXdE8UMmw=
X-Google-Smtp-Source: 
 AA6agR7RZQUvO0waufbuiZnRWMJU4ye3XV2zX+/JLmz3E3IGi2IIZMz0uT1Bdsg1IUWxVW+t2IO83g==
X-Received: by 2002:a17:90a:df14:b0:1f3:3a50:9dc1 with SMTP id
 gp20-20020a17090adf1400b001f33a509dc1mr14923404pjb.139.1659851580754;
        Sat, 06 Aug 2022 22:53:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0041a716cec9esm3872380pgm.62.2022.08.06.22.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 22:52:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 3/5] sdbus-c++-libsystemd: Fix build with glibc
 2.36
Date: Sat,  6 Aug 2022 22:52:53 -0700
Message-Id: <20220807055255.2982774-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807055255.2982774-1-raj.khem@gmail.com>
References: <20220807055255.2982774-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Aug 2022 05:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98144

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-linux-fs.h-to-resolve-fsconfig_.patch | 74 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_250.3.bb   |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
new file mode 100644
index 0000000000..01afd37a37
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
@@ -0,0 +1,74 @@
+From b0933e76c6f0594c10cf8a9a70b34e15b68066d1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 23 Jul 2022 10:38:49 +0000
+Subject: [PATCH] glibc: Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23992/commits/21c03ad5e9d8d0350e30dae92a5e15da318a1539]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build             | 13 ++++++++++++-
+ src/basic/fd-util.c     |  2 ++
+ src/core/namespace.c    |  2 ++
+ src/shared/mount-util.c |  2 ++
+ 4 files changed, 18 insertions(+), 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -474,7 +474,6 @@ decl_headers = '''
+ #include <uchar.h>
+ #include <sys/mount.h>
+ #include <sys/stat.h>
+-#include <linux/fs.h>
+ '''
+ 
+ foreach decl : ['char16_t',
+@@ -486,6 +485,17 @@ foreach decl : ['char16_t',
+         # We get -1 if the size cannot be determined
+         have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
+ 
++        if decl == 'struct mount_attr'
++                if have
++                        want_linux_fs_h = false
++                else
++                        have = cc.sizeof(decl,
++                                         prefix : decl_headers + '#include <linux/fs.h>',
++                                         args : '-D_GNU_SOURCE') > 0
++                        want_linux_fs_h = have
++                endif
++        endif
++
+         if decl == 'struct statx'
+                 if have
+                         want_linux_stat_h = false
+@@ -501,6 +511,7 @@ foreach decl : ['char16_t',
+ endforeach
+ 
+ conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
++conf.set10('WANT_LINUX_FS_H', want_linux_fs_h)
+ 
+ foreach ident : ['secure_getenv', '__secure_getenv']
+         conf.set10('HAVE_' + ident.to_upper(), cc.has_function(ident))
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -6,7 +6,9 @@
+ #include <stdio.h>
+ #include <sys/mount.h>
+ #include <unistd.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "base-filesystem.h"
+--- a/src/shared/mount-util.c
++++ b/src/shared/mount-util.c
+@@ -7,7 +7,9 @@
+ #include <sys/statvfs.h>
+ #include <unistd.h>
+ #include <linux/loop.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "chase-symlinks.h"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
index d5c799aac3..853cc20b67 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
@@ -14,6 +14,7 @@ SRCREV = "73be9643910c3f7f3ff84765d63060846c110016"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
+           file://0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch \
            "
 
 # patches needed by musl
-- 
2.37.1


