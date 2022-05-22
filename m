Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22B6C433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 20:42:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.20299.1653252174619203784
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 13:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d93MQKvf;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e2so6908639wrc.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fD/R4ZSE18RWKQXLmterdYjXpzo9taXxs4DWZ69aOWU=;
        b=d93MQKvfZx6qexLf48qYhyOE7CUFrc+r/il7jZ3GAAYErJbFd3qQDVQsCvUit4lTvI
         5NVArJuz2Lxi/qA4FQMU/JSBuhWjTwD+eo2qVNPJqqVrgWz1tluwFcoWYdpoDi78YqTw
         cfhD+CQ66gR9mU9ULJd7W+818XCg4Fi5uiLG0E8wcRGI/eu1rXO1hR7meJKYBKV5F8oE
         uemzSxh/RYBMuuFM7CLH17r/A0zHnq/p903Azm3GQN3XNkYEzp9yJs5yKmVP7nA0fI+s
         7fnwJaq3MIo0AqXXd8rnEeXT1f5fZZ3/a/Jl+h8dmvfoAmAWgQMLYPPW29Dzkwef3GUk
         IrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fD/R4ZSE18RWKQXLmterdYjXpzo9taXxs4DWZ69aOWU=;
        b=U/gx/Rpi8RLuKMz5oPWUKOm3Aajaxgx/G+R9XwDkxd+g86UWZzr+EyLXXMfaOBdG/h
         9KFtXQwjsyEOWLoGGtMlkx3hTaE3xhAu8l3LxFkFI/UbqlbDFxi/0hfZi6gfyrGMkLLd
         pmLJxae/ba/qdHA4jo6eyPzJtWr1F/iK/ShEb55IAa5uws3d7BA5tglROl9V3zns8/Cu
         0tRyDm+oqGnirNtsSyFfpnzmCEjoFtmqyADmsn+4iEAqcu/O/eJAlaDoMmBff1OFk3m8
         JhCtFkLORTkdu+ST3zINeura3biocgxqyqtu6Q3Bdqnf2jpv0T6Z2Bs6r3sAeunnQctf
         E59A==
X-Gm-Message-State: AOAM532flWXDgQYPE8mMxbXsHhDcuvbdXEVuu8fi7QtZUC6eYrQomCgA
	cYphgFgB9SsL6CQkyfhSZd3rRkvGd2ixzQ==
X-Google-Smtp-Source: 
 ABdhPJzMR8PrX5iHrpjx1pTquz8Nh4oByHzQOnkCHpzz8rL1IoaKL6zuYE6I8/KB0ClWQBn7AIXauA==
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id
 u6-20020a5d6da6000000b0020fbc8a9400mr10107330wrs.274.1653252172698;
        Sun, 22 May 2022 13:42:52 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-242-149.002.205.pools.vodafone-ip.de. [2.205.242.149])
        by smtp.gmail.com with ESMTPSA id
 o20-20020adfca14000000b0020cf33b4e53sm8158081wrh.116.2022.05.22.13.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 13:42:51 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH] overlayfs-tools: add new recipe
Date: Sun, 22 May 2022 22:42:07 +0200
Message-Id: <20220522204207.2323510-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 May 2022 20:42:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97220

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

This package provides maintenance tools for OverlayFS, such as vacuum,
diff, merge, and deref

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...-so-that-it-compiles-on-Ubuntu-20.04.patch | 41 +++++++++++++++++++
 .../overlayfs/overlayfs-tools_git.bb          | 28 +++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch b/meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
new file mode 100644
index 000000000..f7490ebce
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/files/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
@@ -0,0 +1,41 @@
+From 81b4fbb5f52044cb348534c23f10b3884972b09b Mon Sep 17 00:00:00 2001
+From: Beat Schaer <beat.schaer@wabtec.com>
+Date: Fri, 19 Mar 2021 08:18:58 +0100
+Subject: [PATCH] Fixed includes so that it compiles on Ubuntu 20.04
+
+---
+ logic.c | 3 +--
+ main.c  | 3 ++-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/logic.c b/logic.c
+index 97767f5..47ebfaa 100644
+--- a/logic.c
++++ b/logic.c
+@@ -7,8 +7,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>
+-#include <attr/xattr.h>
+-#include <attr/attributes.h>
++#include <sys/xattr.h>
+ #include <fts.h>
+ #include <libgen.h>
+ #include "logic.h"
+diff --git a/main.c b/main.c
+index aa11239..f462b98 100644
+--- a/main.c
++++ b/main.c
+@@ -12,7 +12,8 @@
+ #include <linux/limits.h>
+ #include <stdbool.h>
+ #include <sys/stat.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
++#include <errno.h>
+ #ifndef _SYS_STAT_H
+   #include <linux/stat.h>
+ #endif
+-- 
+2.25.1
+
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
new file mode 100644
index 000000000..b0406fbae
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Maintenance tools for OverlayFS"
+HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
+
+SRC_URI = "\
+    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
+    file://0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch \
+"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "291c7f4a3fb548d06c572700650c2e3bccb0cd27"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+DEPENDS += "attr"
+EXTRA_OEMAKE += "'CC=${CC} -O2'"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/overlay ${D}${bindir}
+}
-- 
2.25.1


