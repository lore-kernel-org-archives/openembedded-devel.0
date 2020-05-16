Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.7878.1589646395932359313
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 09:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CiNM5l1D;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id hi11so2399474pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2020 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5WaC/XE94541az9fBvGuU3inUBtrAQqOLiKAikgAWs8=;
        b=CiNM5l1DM1AY1iVtnbCXotrTtFmf1QxXvkZ0N9KPJ4onpF3eINyz5VyYb/UK+sdoCT
         Jw/wtoZZo2/RB+Q9iyCFE2XhlBZg5o5tDRUlY7wkyLjwgIvDS+tQuj4IXlwF/xskirR0
         Xe2xpsHGrjaCac2441HMXk7kLTSsgyNoFYXhY5hMDeQj1WzOtC6NXbhApnaJ3w36e0Iz
         6bUMYorWNq7a6T8vihR7Sa2rp0NVAjR2s2odUgHZfqC4AxDibuH0fNlzeEyj3oVtNShm
         c8OPaayT8IRsaZuLAUZp00q2p+jqvZN8FCey1dRkFNtr/n7oLzBRkYtiY8YNUxAudgSW
         agJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5WaC/XE94541az9fBvGuU3inUBtrAQqOLiKAikgAWs8=;
        b=Y5vd49ITXrPaQ6hrUPRHp24BEuzTlvRqkM+scf50w/3zRLqTjAQKhCQrz46QbXFemI
         6vsPTC6QCFlFjcgPltcDnBa4nYEbDQYJMXOIibWWVMyKQnJpc52FNIEcTAcZVsZ84wjR
         4OAZkfUZcDqMGJ6m00lTIZCDyq9w/lZwPcbFXvHo+drtHxzsYDlEH/ehWo195Iv1HTPe
         qh2/ycdmoO/15YEd9TRUeftBWHMD7Bc9O3YRS04nS/warFF8ywBKL8WUx99OuC3W8LmA
         uYQtA5/2OHVaG23BaHk2kFn1cN6VXCIDNmhHNFKhVtDsoYQrFG24v102wtooXZ8oMeeS
         mNCA==
X-Gm-Message-State: AOAM532KFMzHTkGvJIdDUEpkRAxzxWui0qt4TMtGqDzWAFm5SeVV3Ajl
	/GkoJ/N3RN5G5vjluX/mqhsx94CL0XQ=
X-Google-Smtp-Source: ABdhPJwbnTHVHnfvNf2Y5i67G3qdRJFgu+tIBczqBFOpjensD24NsCWNjfUSwTx2w5mPrG+N4extHA==
X-Received: by 2002:a17:902:b684:: with SMTP id c4mr8720920pls.210.1589646395119;
        Sat, 16 May 2020 09:26:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id t20sm4206084pjo.13.2020.05.16.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 09:26:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] uim: Add patch to fix -fno-common link error
Date: Sat, 16 May 2020 09:26:31 -0700
Message-Id: <20200516162631.1862339-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516162631.1862339-1-raj.khem@gmail.com>
References: <20200516162631.1862339-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is unearthed by gcc10 like below

| /mnt/b/yoe/master/build/tmp/hosttools/ld: .libs/gcroots.o:(.bss+0x0): multiple definition of `GCROOTS_jmp_buf'; .libs/mark.o:(.bss+0x0): first defined here
| /mnt/b/yoe/master/build/tmp/hosttools/ld: .libs/mach_dep.o:(.bss+0x0): multiple definition of `GCROOTS_jmp_buf'; .libs/mark.o:(.bss+0x0): first defined here
| collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.26.2

