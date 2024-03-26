Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA463C54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:50:54 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.9268.1711417851834510437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ecckB37+;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so4098637b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417851; x=1712022651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVM4IszJk19ZfdV7X8fwrt9f0aik72Y8TregynZaBSU=;
        b=ecckB37+JkVxdp4Psb1R+PFlvT20uSclEe0veoldh7xAxS8aH5WgZpa/7mN6dX9dE6
         1cWHEvSq9pug5m2FIX5g2+8bc+/eUT4Nz4CdlOTh/C9+O0Ndr2ReWJHewucpYZ/O2KuF
         GuwcouPhgTXx5N86QmdzmusAHDcPUGDo1Gb1iG+mGv0yAbdz0FF8BfFdVcnXCAnbh9Ah
         Zmed/pokJ3SI5gwEF9Wnjx2aHiGtBq/74qwUqdXDpEPuSg95hKKcZK0F9nv/BatAGUhE
         ASEFA1w9QUBbqrafGJ9Sgl+bxDlgT5fU8ynab1X6Xu1foLUdq5T1oFxatLyvCwAApkaL
         mgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417851; x=1712022651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVM4IszJk19ZfdV7X8fwrt9f0aik72Y8TregynZaBSU=;
        b=S8hnEcVXwu0l+8hecCbz77o2Asxkm24jNteqOycmzz8iHKtEzqr0HLn+GNslAB1rk/
         BcT/YpeOR8w9zmZpdfiK8C8aboYkhP3m5R8swupsQKtX7wYkYpAmSNrISQhCkStfPOjx
         DGzsPqTvt1vW/S8MqI3kr+WD49tHzJVOVKXBsVAnNZKY3DnTKat7Xb1Yk7Kp6Xf8f3eo
         NfwHcIybBHrJj27HXzVSktOYlEC/YZkyCwsA3MHWmE1TioAMefPIsyHxwDJiT5O3gQTR
         8c3LmxJLYLhNOi5pjzuXTQMkfObfjC425OLaiuDvWTkpKX2RIf0HrlPq8khERvGb9A1a
         2ONA==
X-Gm-Message-State: AOJu0YwhSr2Sx9opPs55aY5KOKV+b+qe35+QQyOpwuEl5Ifbmd1t1HbS
	OOcGn6chJU3ri43oOUv5RrWW4VHiFTDwYiV8hrcV/eSpjgwh99dxAXD/gvaQ
X-Google-Smtp-Source: AGHT+IF5JDhvgi8M34ih7yGhP5S5Hme7qqFRgkbKiZmw/LpjdhbYU/zaP+AOpiQbgXPdBf1boMkHjg==
X-Received: by 2002:a05:6a20:3ca2:b0:1a3:a669:747e with SMTP id b34-20020a056a203ca200b001a3a669747emr11351386pzj.12.1711417850793;
        Mon, 25 Mar 2024 18:50:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/10] ndctl: Fix build issues seen with musl 1.2.5
Date: Mon, 25 Mar 2024 18:50:37 -0700
Message-ID: <20240326015047.543274-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109611

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 32 +++++++++++++++++++
 meta-oe/recipes-core/ndctl/ndctl_v78.bb       |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-include-libgen.h-for-basename.patch

diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..9de0a715bf
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,32 @@
+From d7f01c310b74e3579a6474362922f173ac656d7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 15:41:29 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/pmem/ndctl/pull/263]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ daxctl/device.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/daxctl/device.c b/daxctl/device.c
+index d2d206b..e607a19 100644
+--- a/daxctl/device.c
++++ b/daxctl/device.c
+@@ -2,6 +2,7 @@
+ /* Copyright (C) 2019-2020 Intel Corporation. All rights reserved. */
+ #include <stdio.h>
+ #include <errno.h>
++#include <libgen.h>
+ #include <stdlib.h>
+ #include <syslog.h>
+ #include <unistd.h>
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v78.bb b/meta-oe/recipes-core/ndctl/ndctl_v78.bb
index 2974a7db7f..907c02c7c8 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v78.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v78.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 inherit meson pkgconfig bash-completion systemd
 
 SRCREV = "a871e6153b11fe63780b37cdcb1eb347b296095c"
-SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
+           file://0001-include-libgen.h-for-basename.patch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
 
-- 
2.44.0


