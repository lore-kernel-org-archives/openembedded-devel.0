Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.69.1620778031078463962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 17:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tDszLiRf;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t193so4368201pgb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b7HfnJWM4dh7yboQpgKUB6Hzlhfb/9cgQcyED6yYRds=;
        b=tDszLiRfL3Zv0qxSo9yFZEkeXklJBq0SSBTsCQtemAKXwdnAWE64a9o+XtyEPz/rR3
         DAouetD3yem5zDANLmFK7vkI9PfdfIu/bqJSGLQU0rLq6RYNCuIl+I6OfbHP9zvj1wZA
         PJNAFBSmNU11DNqxgOpKU8PignWsPfFOauPHFAdAQVOAOEyCLJ//jLa2DP6EDig9qylT
         08P1S55dPIWnrV3vxjSas8DkhJCmlgZiVdVQSusLGvRLorByhudDmwP4K0R/RbNYnUOA
         s2eWm2G+Ll90vj+a4IrwSylSmkSS1y6meSl9bPpeEkxBUHSXuFGIMIWH+vUIbDUSvcGu
         OLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b7HfnJWM4dh7yboQpgKUB6Hzlhfb/9cgQcyED6yYRds=;
        b=f7l2Rl/5imDa9dE47Fjwx6h4HNojXtzCd3YJoFeeswEQ8NlVVnIU271YAw3naHSr9X
         Yl6xhbHjIKu27frfHzKGw9rBCe4+QYOgomF3cofWpR6w9PhT0IsjAf6tCXqKsoqvR3d+
         /lAj67fErSE9igVCnqOMptynwzeOkj/gjJgvS+zJKB7pi18j/P3AVURzQxj6TU1gUtXz
         1LVXL325LPudpDCTEPoKdA4iWmOv378fopCT1T2/OG0lPXJqur7/HmI9bSqwsB16hI0F
         yIMvZYMNaKJNUPQVZA1oWSzMr8s/08Kddnz9Se1zW8pdkXGv/bzk5iyUTBibEs5ZKRW9
         M8FQ==
X-Gm-Message-State: AOAM5306gYSIv+P3RoBgWKvZpeVkYBXy/XEdslugQHjnSudra8YYafkw
	pbFr6fB3HkGezyeG2L83oc0ECvqbYlD6Rg==
X-Google-Smtp-Source: ABdhPJwHdW7mJQvinymLZZxZucFJOE7jYqjBYqONwrV1lt6RQY9JnjW+UmbpvIS4XEn4eQS/URsiBA==
X-Received: by 2002:a63:184a:: with SMTP id 10mr32658983pgy.426.1620778030338;
        Tue, 11 May 2021 17:07:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id n30sm14675966pgd.8.2021.05.11.17.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 17:07:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] breakpad: Fix type mismatch for SIGSTKSZ
Date: Tue, 11 May 2021 17:07:04 -0700
Message-Id: <20210512000704.2889545-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512000704.2889545-1-raj.khem@gmail.com>
References: <20210512000704.2889545-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dler.cc-Match-the-types-for-SIGSTKSZ.patch | 34 +++++++++++++++++++
 .../recipes-devtools/breakpad/breakpad_git.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch
new file mode 100644
index 0000000000..afe8a61b29
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch
@@ -0,0 +1,34 @@
+From 66a2b6e4ba8e2b49115043127ce4aa0fcd71ad1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 May 2021 11:12:35 -0700
+Subject: [PATCH] exception_handler.cc: Match the types for SIGSTKSZ
+
+In glibc 2.34, SIGSTKSZ is a syscall which returns a long int, therefore
+current check fails
+
+| ../git/src/client/linux/handler/exception_handler.cc:141:49: error: no matching function for call to 'max(int, long int)'
+|   141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+|       |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/linux/handler/exception_handler.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
+index ca353c40..dc0fc4a9 100644
+--- a/src/client/linux/handler/exception_handler.cc
++++ b/src/client/linux/handler/exception_handler.cc
+@@ -138,7 +138,7 @@ void InstallAlternateStackLocked() {
+   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
+   // the alternative stack. Ensure that the size of the alternative stack is
+   // large enough.
+-  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
++  static const unsigned kSigStackSize = std::max(16384u, (unsigned)SIGSTKSZ);
+ 
+   // Only set an alternative stack if there isn't already one, or if the current
+   // one is too small.
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 81955f450d..4756ef772d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main \
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
            file://mcontext.patch \
            file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
+           file://0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
            file://0001-Do-not-add-stack-pointer-to-clobber-list.patch;patchdir=src/third_party/lss \
-- 
2.31.1

