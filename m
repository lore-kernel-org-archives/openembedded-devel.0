Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3524.1618693606924355124
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NKg9/ogh;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id p67so15683980pfp.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=p0xcvgCRCz6XQmZZNG+B4IaQEadErBuA+5VJE2R8b+w=;
        b=NKg9/ogh4OKGbuOiqePCKqv6Wt6R56AkjQYkxvLCP4taE8j5EBp6SHQayotd6ybaQc
         Br+e7z+TWxJpm30DjbDEh/eL5SnCDJhEKofNMIdClobzSo+QDM3/K59mpHOFsLKqbfOG
         A0oEU+Qi7R0lQKBksWMkpcunzahFo+dJ6Tn/u6cK0T0edTOMmyos7dewnFeYzGX6yPnf
         pb63/mUMGtaTt3Jf8YQbbOqYRCK8nzijvmkjyQwP9aD3rHLIHHd8GfFSeRYQlhnpT9kV
         msb9SnU3I/4kE6R5CDpZbm7smr7xhF/jXLgLl/Zxp8k08qmqBGMohiN+ADlT1uNiDlr7
         2icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=p0xcvgCRCz6XQmZZNG+B4IaQEadErBuA+5VJE2R8b+w=;
        b=rmghD0cFPmnW8pxc/M3PJfJIrAzTqmW2eqq4J2uh/LsxL9OmorQ2O8y+CwKssIA5lc
         FGxMlnTEwFfxDIA5qQAV5B3lHdCxiWpFSNvlYqAYF/Y11C+zheGIfKwCIwfZn4hoVzAe
         Nn4gtVPmNsfxg0JAyFuPxj6oCF/cOVE0P6tJWWZ+6KAj2JkFvm4EQtinr7+LJ+YY6InG
         PRDtd+OhEvicVkylZUFcBJ/uZeyW5upcKnlV9ybLTv1FIBV1S57EL1xZddgBFuoPWTvm
         B59k+6I0nhY/6Du0v9bfMnau6E7kIZ8CXA0g9KrIVINnseIblqIZnYXXCj4v2+jep5KM
         MYSw==
X-Gm-Message-State: AOAM531GPsr2zfAExRg4sTJLlQgBeYyycifQYHQCSE+1YDL450VxJebU
	gjlcuQtmfC4Db+bwSd3fqqyireNuM/a7OQ==
X-Google-Smtp-Source: ABdhPJwtl/havU0FltkiLq2iKWmh2yaO8V7iVxr4YXxab3vhJMUTYDOjCNUD2RzoICrH/MhPlws2ww==
X-Received: by 2002:a63:f54b:: with SMTP id e11mr4754001pgk.139.1618693606345;
        Sat, 17 Apr 2021 14:06:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:46 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 50/50] open-vm-tools: Fix build with gcc 11
Date: Sat, 17 Apr 2021 14:05:59 -0700
Message-Id: <aa54436db9d4c2968b3d9f657a81369e42e563fb.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <Trevor.Gamblin@windriver.com>
(cherry picked from commit 08c0280b7cea4dd1d61d98331c1cd327a82636f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...latile-qualifier-exposed-incorrectly.patch | 29 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.2.5.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
new file mode 100644
index 00000000000..fdcd7d614e9
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
@@ -0,0 +1,29 @@
+From 524fd4db646b4ac2155074b4cedf8436a8ff726d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Apr 2021 06:58:31 -0700
+Subject: [PATCH] pollGtk: Fix volatile qualifier exposed incorrectly
+
+GCC11 flags it
+
+Fixes
+glib-2.0/glib/gatomic.h:117:5: error: argument 2 of '__atomic_load' discards 'volatile' qualifier [-Werror=incompatible-pointer-types]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/pollGtk/pollGtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/lib/pollGtk/pollGtk.c b/open-vm-tools/lib/pollGtk/pollGtk.c
+index 4ccaeda6..336a8bf1 100644
+--- a/open-vm-tools/lib/pollGtk/pollGtk.c
++++ b/open-vm-tools/lib/pollGtk/pollGtk.c
+@@ -127,7 +127,7 @@ typedef struct Poll {
+ } Poll;
+ 
+ static Poll *pollState;
+-static volatile gsize inited = 0;
++static gsize inited = 0;
+ 
+ static VMwareStatus
+ PollGtkCallback(PollClassSet classSet,   // IN
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
index 256949a03d3..473af8d41bc 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
     file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
     file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
+    file://0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch;patchdir=.. \
 "
 
 SRC_URI_append_libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
-- 
2.17.1

