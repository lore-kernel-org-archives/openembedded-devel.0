Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408F1C3F6B0
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 05:53:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.11100.1659851584251986862
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G1akpdRG;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso6410456pjd.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jz8jH1l6MtdXaR3QaDfxHzjM1JjrLnPRUW92Wl8cLos=;
        b=G1akpdRGXcC6cpo92+0zLTdNXKJ0H7xRNMFSsCdpEHnlLGNngQkSrrXw0IRdcGa9Wn
         QLpTjhxNGzFdpGcEEbO7OvATpKPgwfsxFHAbpWat0DSIUOLWx8kr1qcSD2DXwGLhxSbI
         O11MLjW7rMxukJwQ5t6l97i+4EAcWH6GkheazdLHl309EKeH5TndFvYsASyZc+9Bqvra
         vE0ypV/qlNzT6vTzR+ZVzYR/9QHRQCsXLG0IuR+X7o/5YIcRjiMSon5uUD/VYbraiDMh
         Oatf0cd2S4DBx+a9AmkAmgG3/eWtSHbbaDLkEWkFjSERHcyvQ+lu8RSb0kxlS8E0Fb5k
         aHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jz8jH1l6MtdXaR3QaDfxHzjM1JjrLnPRUW92Wl8cLos=;
        b=tk77MWV8OT1JMIquLhRw6oVcWvyg/BfvwjR5pogwX5dmKwFNHeRpt0UbScwyp630vV
         Ff2LlbGzGbb35z0K8leUamqDexFbHtTRvpTC5jIyRjGr+v11gEioibgCV6K/Ic/CL+vM
         1a0wqjdiWTkM/X493Nk3cW9wILRzkiYVoIJTLA/a7qCrIG2UWEefkFsgYqwPhm5NpfKb
         wY0wS3IBYaXFt2xLQ0j4msgkD96ckp6b3m3F932eLxcWcGm/WvONgShs1E1rP/TtE/7t
         9OmQTniT1pJRjViFhIbA8vYKvG5Ak2kJlEc8P8B2Ge77BS9UNQ3FkA0x+PPfkgP6cEk9
         vdaA==
X-Gm-Message-State: ACgBeo3e1aDaSUb6sZirtreWZxP1Oat3vTm+MpuVNZCsSqJDezCykHf5
	9tz1jOZWz+BNyQ8ZnGS4lEytlGIQbS4=
X-Google-Smtp-Source: 
 AA6agR79LvJuwKy6ZL2TJLwx7I8VQkH4/jttX3C1PiclY4s0vqvNhMDVY3XHe8lkSlx5CUVJmOau0g==
X-Received: by 2002:a17:90b:1e4a:b0:1f7:3769:ac18 with SMTP id
 pi10-20020a17090b1e4a00b001f73769ac18mr3597742pjb.228.1659851583317;
        Sat, 06 Aug 2022 22:53:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0041a716cec9esm3872380pgm.62.2022.08.06.22.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 22:53:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/5] autofs: Fix build with glibc 2.36
Date: Sat,  6 Aug 2022 22:52:55 -0700
Message-Id: <20220807055255.2982774-5-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98146

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autofs/autofs/mount_conflict.patch        | 30 +++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.1.8.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch b/meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch
new file mode 100644
index 0000000000..e2a94bf825
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch
@@ -0,0 +1,30 @@
+Avoid conflicts between sys/mount.h and linux/mount.h
+
+linux/fs.h includes linux/mount.h and this include file is unused so
+do not include it and avoid conflict too with glibc 2.36+ see [1]
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/modules/parse_amd.c
++++ b/modules/parse_amd.c
+@@ -27,7 +27,6 @@
+ #include <sys/utsname.h>
+ #include <netinet/in.h>
+ #include <sys/mount.h>
+-#include <linux/fs.h>
+ 
+ #define MODULE_PARSE
+ #include "automount.h"
+--- a/modules/parse_sun.c
++++ b/modules/parse_sun.c
+@@ -30,7 +30,6 @@
+ #include <sys/utsname.h>
+ #include <netinet/in.h>
+ #include <sys/mount.h>
+-#include <linux/fs.h>
+ 
+ #define MODULE_PARSE
+ #include "automount.h"
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
index 1f87bddbee..cb80844586 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
            file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
            file://0001-Define-__SWORD_TYPE-if-undefined.patch \
+           file://mount_conflict.patch \
            "
 SRC_URI[sha256sum] = "0bd401c56f0eb1ca6251344c3a3d70bface3eccf9c67117cd184422c4cace30c"
 
-- 
2.37.1


