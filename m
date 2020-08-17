Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.46395.1597679618137696617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3It/g6i;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id bh1so7721257plb.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gquEHvqzc+u0Iilv9qguFa4zHg8RSsGaZdXWa3HA674=;
        b=h3It/g6il/LsFqpB6wj6216+lygWWwlWQuibz2NbCojFbybpIlueo2ocB+b+HMfxpo
         erWcEw7vHC4zI8LU/74PJZqLaBjJlkVAOWYhlRRClUtM0UvkL8FmebERVEaUop1NOE2Q
         CHtNLtPHqslaDCxNxMEFpl9rpzPifGVPVFvenCGWn2QP57JH1Al5CMi3Ck5vm8z7+SUl
         zSu+EFRzB8+NZSIBgjX244dhT8uqc6rF/5hlEV8p+N7vEb40YQKBY7qbrhwYYPnkmoMO
         l96fRAvgsgGI+KmBUz5K3jiHcHo/TAKeXzOsJN46XK1mbFb9txwikZV/rOeSKadJMyn/
         jVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gquEHvqzc+u0Iilv9qguFa4zHg8RSsGaZdXWa3HA674=;
        b=paxmTdwt2Z4eii/rRFQrXr+l9UpUKmxl5mxIlA0I9wQmQiNrQweJbWWv9M+HXLcYxU
         EN33yECebOjncFE7vCKGa2P9RvGQN1+LrSIlikFxM6N1kmbzGsEJiFxwzWHLGVSricr+
         3MrV9EJ+9vJ+jXHRLGIRq93qdpaPOFksdzd7JZoWdPGbSQ++U77bXvgycQjad/OkqVwG
         LcdIvqG0XJMOuG0LrcrYpvEf70OBqQOPsQ7QOvmW2tumLIIaoXgBWaZ+6wypGrOCaE8B
         ZytttVUZae+EhKUVmkzk5l7j5aENgy7lksx5sFPos6z4Qgj+9BAEYHANPORAlghyiTzf
         uvew==
X-Gm-Message-State: AOAM5308pK90KU8Z7iZqgBhjPXYwWKgba0EwMYDM0Yd1z5856IKBwmXG
	A3V0zb9AXJ6cvqM+79h+SOF4tslTyxt0Gg==
X-Google-Smtp-Source: ABdhPJxDDsNWU71cNkq1zYngK9cuBrXzIAeyk8sEB/1gVL2IRtAqRKcNUxVHNQTac86Pq1t2T9zVOA==
X-Received: by 2002:a17:902:9a01:: with SMTP id v1mr11504168plp.15.1597679617238;
        Mon, 17 Aug 2020 08:53:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id z126sm20625879pfc.94.2020.08.17.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:53:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] crash: Fix arm64 build with -fno-common
Date: Mon, 17 Aug 2020 08:53:29 -0700
Message-Id: <20200817155329.1872891-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155329.1872891-1-raj.khem@gmail.com>
References: <20200817155329.1872891-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-gcc-10-compilation-error.-Without-t.patch | 54 +++++++++++++++++++
 meta-oe/recipes-kernel/crash/crash_7.2.8.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch b/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch
new file mode 100644
index 0000000000..c946444388
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch
@@ -0,0 +1,54 @@
+From 0dddb4e1158705345b7f4f71635d42c89e1b0c8f Mon Sep 17 00:00:00 2001
+From: Dave Anderson <anderson@redhat.com>
+Date: Fri, 31 Jan 2020 17:11:46 -0500
+Subject: [PATCH] Fix for an ARM64 gcc-10 compilation error.  Without the
+ patch, the build of the embedded gdb module fails with an error message that
+ indicates "multiple definition of 'tdesc_aarch64'". (anderson@redhat.com)
+
+Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/e770735200c02ac2414c394ea6ec5f7f033efe64]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdb-7.6.patch | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/gdb-7.6.patch b/gdb-7.6.patch
+index f6c311d..f64b55f 100644
+--- a/gdb-7.6.patch
++++ b/gdb-7.6.patch
+@@ -2471,3 +2471,33 @@ diff -up gdb-7.6/opcodes/configure.orig gdb-7.6/opcodes/configure
+  #else
+  # error "!__i386__ && !__x86_64__"
+  #endif
++--- gdb-7.6/gdb/features/aarch64.c.orig
+++++ gdb-7.6/gdb/features/aarch64.c
++@@ -5,7 +5,6 @@
++ #include "osabi.h"
++ #include "target-descriptions.h"
++ 
++-struct target_desc *tdesc_aarch64;
++ static void
++ initialize_tdesc_aarch64 (void)
++ {
++--- gdb-7.6/gdb/aarch64-linux-nat.c.orig
+++++ gdb-7.6/gdb/aarch64-linux-nat.c
++@@ -37,6 +37,7 @@
++ 
++ #include "gregset.h"
++ 
+++extern struct target_desc *tdesc_aarch64;
++ #include "features/aarch64.c"
++ 
++ /* Defines ps_err_e, struct ps_prochandle.  */
++--- gdb-7.6/gdb/aarch64-tdep.c.orig
+++++ gdb-7.6/gdb/aarch64-tdep.c
++@@ -52,6 +52,7 @@
++ #include "gdb_assert.h"
++ #include "vec.h"
++ 
+++struct target_desc *tdesc_aarch64;
++ #include "features/aarch64.c"
++ #include "features/aarch64-without-fpu.c"
++ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
index 834c92cc46..6e2533635b 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
+           file://0001-Fix-for-an-ARM64-gcc-10-compilation-error.-Without-t.patch \
            "
 SRCREV = "24f4801f8c8871a2e3e660fe9fa8fdd86bb29876"
 
-- 
2.28.0

