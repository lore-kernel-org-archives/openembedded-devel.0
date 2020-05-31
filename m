Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.18125.1590941790079713422
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xnk4+5WV;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w20so2363799pga.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WILnYy7SoWjyMJfg260G4+g9mNAb5Gcb5raarYhFg1E=;
        b=Xnk4+5WVov6/Hvj6DhFCFEugUjV9salZOPF1yNFfvk0GVm3eCfJWM9X+tagdIVbaIh
         P2VX0+rTANeKQVjnPKl2Da8e2II6CAmb4akaBYESsckRT3PhTwu0QKgeAdb5OLvemtJn
         t0B1MKBH99gsxML2w5GHsDl1Fwg3lHPe/bPGB7XA0K9d71Qb5zxT3kkbqnlQdGKSRgr+
         0noR+yD70oWMDqkW5NfqgC8vSh62aou/XCI5TlOfgJgnddXmW8FFvGFRrojgMDmCAPKm
         Pr8i+AArqtJ33UgABvgB2HYFvNndHs0jPC0mVmzj1fdV/zi7V9F7hrf4kG2OBaHlEY9A
         epJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WILnYy7SoWjyMJfg260G4+g9mNAb5Gcb5raarYhFg1E=;
        b=DOMX3LLcnJ1unaSi1pw5apeSgLjn8XwbCb6atXIj3ikuv2K5s+2QncBVBNOzRlqg8K
         xlgD1cms2Lkewy/xVDa7pfbteP2RnWKQK0+5xKymmw2c43ovlTUIbYeu9QzPPrHuzN91
         NKQKC4WvXEOCMbkxO6MEO+mhtUbWIr31E4AN0AGnEBeCEBDCfu+pVzIymrmxpRzIEtIe
         AV42fJhT1Gpvbtt8hv0NyVTVcHO2yyyNfw7jkpKe0SA7wlF73rSfeFSXfP4PfaHOpnU0
         bwEeWfRvog5kSKqTa9onCog3C1AtXHTH5Z8YQQaAFTExJTDCbMd+06aVLw4IMhq8NiSv
         ajow==
X-Gm-Message-State: AOAM533QN9PjBNj+1FrFqa89kBdXlo7yI3osacw+tgOQUxj9u5AC7RFL
	qB05BJciM0ng1hBIRuuiOe3hT1Ph
X-Google-Smtp-Source: ABdhPJw9wRTJ7/12nRTNUqQaMRe5mZEZ646M/ZBKLoWwJDRDQbIhlQaU1jrE1jaiR2iwyPMHrnIOTw==
X-Received: by 2002:a65:6790:: with SMTP id e16mr16647128pgr.145.1590941789149;
        Sun, 31 May 2020 09:16:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/35] uim: Add patch to fix -fno-common link error
Date: Sun, 31 May 2020 09:15:49 -0700
Message-Id: <86cc412d8fc2006719908fece653bc11b9c3f6c5.1590941673.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This is unearthed by gcc10 like below

| /mnt/b/yoe/master/build/tmp/hosttools/ld: .libs/gcroots.o:(.bss+0x0): multiple definition of `GCROOTS_jmp_buf'; .libs/mark.o:(.bss+0x0): first defined here
| /mnt/b/yoe/master/build/tmp/hosttools/ld: .libs/mach_dep.o:(.bss+0x0): multiple definition of `GCROOTS_jmp_buf'; .libs/mark.o:(.bss+0x0): first defined here
| collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5c6f6797047d5d3fdf6d84c2d7fe441ed8eb89b6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../uim/uim/JMP_BUF_GC_jmp_buf.patch              | 15 +++++++++++++++
 meta-oe/recipes-support/uim/uim_1.8.8.bb          |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch

diff --git a/meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch b/meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
new file mode 100644
index 0000000000..adb9c4b06b
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
@@ -0,0 +1,15 @@
+Fix error pointed out by gcc10
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/sigscheme/libgcroots/include/private/gc_priv.h
++++ b/sigscheme/libgcroots/include/private/gc_priv.h
+@@ -2026,7 +2026,7 @@ void GC_err_puts(const char *s);
+ 
+ # if defined(NEED_FIND_LIMIT) || \
+      defined(USE_PROC_FOR_LIBRARIES) && defined(THREADS)
+-JMP_BUF GC_jmp_buf;
++extern JMP_BUF GC_jmp_buf;
+ 
+ /* Set up a handler for address faults which will longjmp to	*/
+ /* GC_jmp_buf;							*/
diff --git a/meta-oe/recipes-support/uim/uim_1.8.8.bb b/meta-oe/recipes-support/uim/uim_1.8.8.bb
index 0366ad85ae..507a341445 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.8.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.8.bb
@@ -6,6 +6,7 @@ SECTION = "inputmethods"
 
 SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2 \
     file://0001-Fix-to-set-libedit-path-from-configure-option-proper.patch \
+    file://JMP_BUF_GC_jmp_buf.patch \
 "
 SRC_URI_append_class-target = "\
     file://uim-module-manager.patch \
-- 
2.17.1

