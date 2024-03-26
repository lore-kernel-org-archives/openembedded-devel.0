Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECDCCD1281
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:51:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.9184.1711417856129346533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XktZdUhw;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1def142ae7bso44203415ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417855; x=1712022655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpS5kj6ZzX6PdjJh4FZ/9eWOjjXX04NmJeQ7lPhdG6o=;
        b=XktZdUhw0xR/94XsQxqzKevJtcESIeeKQx7Xlu8FwF/IKOxBIAEgISgz+vLD+JM/dB
         xOelsI5VQBIeTUdNC89b5DS/PETRomIMrYVW3vV4X10WHvH/twQGgMGxgUdDc6DTgj/u
         sj2KcJWX0QLIKK71saGQqXH1SPgGEdm4rLWg4plua4g9WqGMBU73cEOHRsrejsAQ7G/y
         GkullQAHpPwJH6yRLlkhofycc1gvVMQnQ87mQowIwr4a1jsktJkrSQZv4qvzpMKTu2yD
         V+dhaHcbYAwe+Rgf55wrpGKjwlUdU2KYNayb+cVn25rKirV/v0XfqpnxT+n2RIJjElyW
         plCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417855; x=1712022655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpS5kj6ZzX6PdjJh4FZ/9eWOjjXX04NmJeQ7lPhdG6o=;
        b=UXhgyzal7ckVFq/XUe7Rue7o7dTDWnUogsxQIYJD7Tq5DP2pJtKfCcDLOF/jIzlFXJ
         6P1xI1gOqTx69HpzEnH4fELeAib4FNmx3t+NAiVi6E9vRbOu2AmNLtgd54oUkzIg2uAD
         4fHphgood3M3FHNQQs/5rWCLYTQ38wrbPnip/I/Lv3PvKe/1a3K7KZ+VdV/affgqHYiN
         scJgGzIfuY8bGtGMK7aKiAKMX3+7QLmlxnhlcvw/n+g8B2cmg0JZdV1/oC29b85PeaC7
         TF6tVE1b58T6B32pP/AK7hmaK6ZlJhGWknK1QpG34yRRY4UZkGlgajWrufpzmJ4qq2Hx
         iGBQ==
X-Gm-Message-State: AOJu0Yxphh/5g5AgZB39j7JjDkK0xKl+lJ+Z65AWs4T94s2Yv5N1dUQd
	zCUwaa8zuLJDPx6WQN+dMmEQ0wV5HldfkSB0LIztfX0JuejEnZuodsM6Ulav
X-Google-Smtp-Source: AGHT+IG2M0TkDlGeZdxO8vFo+UwYMP0IWItTmKfd++N8t8cCUofwvF/cP/fJ2GCi3znvtkm0twE/9w==
X-Received: by 2002:a17:902:8bc8:b0:1dd:c24d:4d1f with SMTP id r8-20020a1709028bc800b001ddc24d4d1fmr7225868plo.67.1711417855120;
        Mon, 25 Mar 2024 18:50:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/10] uftrace: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 18:50:41 -0700
Message-ID: <20240326015047.543274-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109615

The famous basename API fallout

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 34 +++++++++++++++++++
 .../uftrace/uftrace_0.15.2.bb                 |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-include-libgen.h-for-basename.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..4844003517
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,34 @@
+From 8e4e5479cee153db7315d5134663fa87082b39fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 17:46:24 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/namhyung/uftrace/pull/1909]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/utils.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/utils/utils.h b/utils/utils.h
+index 69a6072b..60265431 100644
+--- a/utils/utils.h
++++ b/utils/utils.h
+@@ -11,6 +11,9 @@
+ 
+ #include <ctype.h>
+ #include <endian.h>
++#ifndef __GLIBC__
++#include <libgen.h>
++#endif
+ #include <limits.h>
+ #include <signal.h>
+ #include <stdbool.h>
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb
index ff04d40eaf..60436025a3 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb
@@ -11,7 +11,8 @@ DEPENDS:append:libc-musl = " argp-standalone"
 inherit autotools
 
 SRCREV = "9d8657e90b918994d7d2bcf6dd2cc7354c35a1b4"
-SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https"
+SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
+           file://0001-include-libgen.h-for-basename.patch"
 S = "${WORKDIR}/git"
 
 LDFLAGS:append:libc-musl = " -largp"
-- 
2.44.0


