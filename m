Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.977.1611269712424222751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bKn7ALYC;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id e15so2847916wme.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Iq7U+LxntlrrvxlOPeplq992fCg0SAackNiZZP6zTPc=;
        b=bKn7ALYCiMSA6NtmnLOrTlqvQp1AGA6f7bCxOpmJYXsSSMhVuR+/JgsnyRoZUy91pL
         mpX8vnA5tg5ncgz/eMb1/3AEWYqhHjedmtN63zJyUbRTosrvEZOLuc6xzYwwnR47hEgu
         jJ5QRA2E7VOhvLzbdebqPkSmGJNOKwoADHnvAxdiiu2sSCTebKlMwEMMMb06aohi/Npr
         rEGAGNwULw0t9Xy7jxy+//Ey/+8fY3nNaN/+O68wLuptUGSVrLIL6tE9hgLUPHqIwUz/
         zXLOEwlWQxBtO2JWzCWBuwBtBGN/r6oHCeqgslyLyiPMD8b9Q+Sjcg5EW/i6piWo7NBK
         kKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iq7U+LxntlrrvxlOPeplq992fCg0SAackNiZZP6zTPc=;
        b=uTFZhO2cLAB0P8+uxoE5wwNE2vf+VdlCUDtdJNyTDudI5CNYzCfZJyVjI92hk+Lu1a
         +40FBi8/lyI62054mV77rLlwV2paa2voHArbSMb9Zl0whY1wUlkHMF1/00wmJTTVRNWo
         DUpyxx6yQ3fYe6olwyijTJFf9epDG7qf5nwlyJjGU0c+HShPU+1vLeh0IuQCoiqyeqU/
         ddJAaUOVqpHVADVOQs1dzFUtk9mtDUM5QxW5YcZS22ZrmCF2qNJqUbVyer6jyo1hHKiq
         MuP90g1K+EY9B6hcla6qPSi6q4oMPDlaoFuaV+87/wY+TWUf2JD/fzei5U1B5gkUMN0r
         0gJA==
X-Gm-Message-State: AOAM533JosFmY/PW0W0Xw1YKx0vZduNbCnnAXuioUKptJfWwW74mzcLf
	K8zX/wQnLwvru+WKw43AmPBBlDwXheTMng==
X-Google-Smtp-Source: ABdhPJzYfk/qg4TAtrm0knfQKOfvzVLDgl79wu2qY3vKGeGvcIoF+j4kfFOiELlu6gJSKOGeX2sOSA==
X-Received: by 2002:a1c:4e:: with SMTP id 75mr1305899wma.150.1611269711030;
        Thu, 21 Jan 2021 14:55:11 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:10 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] jack: upgrade 1.19.16 -> 1.19.17
Date: Thu, 21 Jan 2021 23:54:55 +0100
Message-Id: <20210121225458.278343-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

removed patch was merged

1.9.17

    Fix jack_control stopping after first command iteration
    Fix library compat/current version under macOS
    Fix return codes of jackd on success
    Ignore DB_VERSION_MISMATCH error on windows, it is expected
    Remove old workaround for asio4all, as it breaks with jack-router

External changes, related to macOS/Windows installer:

    Add jack-router to Windows installer, opt-in
    Fix registry keys for Windows, add 32bit compat ones on 64bit
    Support for arm64 macOS builds
    Show welcome and license pages on windows installer
    Update QjackCtl used in macOS/Windows installers to v0.9.0, with some commits cherry-picked from develop branch

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-Use-SYS_futex-instead-of-__NR_futex.patch | 62 -------------------
 .../jack/{jack_1.19.16.bb => jack_1.19.17.bb} |  3 +-
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.16.bb => jack_1.19.17.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
deleted file mode 100644
index dd1b7ccfd..000000000
--- a/meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 83068f9b71aea16d1ad036fdcc326de1027b5585 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 22:13:29 -0800
-Subject: [PATCH] Use SYS_futex instead of __NR_futex
-
-SYS_futex is expected from system C library.
-in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
-rv32 is using 64bit time_t from get go unlike other 32bit architectures
-in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
-this aliases it to NR_futex so that SYS_futex is then defined for rv32
-
-Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/670]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- linux/JackLinuxFutex.cpp | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/linux/JackLinuxFutex.cpp b/linux/JackLinuxFutex.cpp
-index deff006b..aef99cd2 100644
---- a/linux/JackLinuxFutex.cpp
-+++ b/linux/JackLinuxFutex.cpp
-@@ -29,6 +29,10 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
- #include <syscall.h>
- #include <linux/futex.h>
- 
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- namespace Jack
- {
- 
-@@ -67,7 +71,7 @@ bool JackLinuxFutex::Signal()
-         if (! fFutex->internal) return true;
-     }
- 
--    ::syscall(__NR_futex, fFutex, fFutex->internal ? FUTEX_WAKE_PRIVATE : FUTEX_WAKE, 1, NULL, NULL, 0);
-+    ::syscall(SYS_futex, fFutex, fFutex->internal ? FUTEX_WAKE_PRIVATE : FUTEX_WAKE, 1, NULL, NULL, 0);
-     return true;
- }
- 
-@@ -94,7 +98,7 @@ bool JackLinuxFutex::Wait()
-         if (__sync_bool_compare_and_swap(&fFutex->futex, 1, 0))
-             return true;
- 
--        if (::syscall(__NR_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, NULL, NULL, 0) != 0 && errno != EWOULDBLOCK)
-+        if (::syscall(SYS_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, NULL, NULL, 0) != 0 && errno != EWOULDBLOCK)
-             return false;
-     }
- }
-@@ -122,7 +126,7 @@ bool JackLinuxFutex::TimedWait(long usec)
-         if (__sync_bool_compare_and_swap(&fFutex->futex, 1, 0))
-             return true;
- 
--        if (::syscall(__NR_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, &timeout, NULL, 0) != 0 && errno != EWOULDBLOCK)
-+        if (::syscall(SYS_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, &timeout, NULL, 0) != 0 && errno != EWOULDBLOCK)
-             return false;
-     }
- }
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.16.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.17.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.16.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.17.bb
index c13d6261c..d5288c7b7 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.16.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.17.bb
@@ -16,9 +16,8 @@ DEPENDS = "libsamplerate0 libsndfile1 readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git \
            file://0001-example-clients-Use-c-compiler-for-jack_simdtests.patch \
-           file://0001-Use-SYS_futex-instead-of-__NR_futex.patch \
           "
-SRCREV = "5b78c2ef158c2d9ffe09818a7dd80209ed251c5f"
+SRCREV = "9e23888b8def6527774889cf4ef6348fb78c7154"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

