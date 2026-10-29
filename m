Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.865.1793316678545370637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0gVGZnVY;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso116268c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316678; x=1793921478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KItx4smV4DnAQx20FmC1r6K3MdkWuzYqMfNF+K3WKxA=;
        b=0gVGZnVYs1xqVd/QbhUTq/EU29AeLU4CxVBhUWFFbsVVOCrIul8rCQAb9LnA7MncAs
         W1D24driRJ7rJt7ygsmBZ7YLgZMsWcQjK9ZeCNZVu8lGNKOgoGpqOYFTG04SQOihOJbg
         4PozqBFmHkynC3VJVoTqaOlKGQpYEIISYWAbFJMKqAVf0j/+mJkqCkxnhY0C0kFd38II
         t/IK/UlgBIeToNCxk5bUC3WNYl+HA7l25Urf5c1vtjhomQCeV54D5QG9+tNvIdOkkyXi
         Z5F9zkTTt0QOcOS6JysWLqFoF2u7uZIhyLxfbrs5alq9ubaxLbBAw3JqXjjUc5dQ1SfN
         SmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316678; x=1793921478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KItx4smV4DnAQx20FmC1r6K3MdkWuzYqMfNF+K3WKxA=;
        b=waQdFt37x4VskLqjKQjHdQ+JoTteS7jeChxkG24q37ckKty5gVYcVZN87fkhTLMeoa
         WLl3PxR/1tQkfqfEp6Z56lQv8wylyyfZLJuVHFZBiTql9b/zLAlTTykEhjsq6ITgvWzn
         ZISbzcv9PGVh7PE/NWSSi5A4mbJ3Qton6+oSjlH3aGcBF0az7rwyHQ3sYRuHSSybFiy9
         vZ+NC5n3+SHHjvkJrfgEzMtUE6d/92QA2hkrg/EEr0xSvyiu77iIXMFHhfaZhjND/XJU
         bt5mrnqFhjHsJjDYx4G6fzXOp/JiXVpnB8gbocdF/fTNG6fxvbMa4mTHm3w7HeEZER6d
         HoIg==
X-Gm-Message-State: AFq9FYJxOVUs+DwuFjhC+D+DfWi2I2s3nIYE/mAXpQm24Z0EgpzR2OFa
	mvNBb6LNL4qx8UKhKus+1G473a9T5gdlxHndmrYqnjC2GwpYctbf2Rfp0dlhcQ==
X-Gm-Gg: AYBFou2n8Jbyyr8qQpNoKqviMNbcSnQHbgBF2WKG9HkIU+EzZZDaMXmzIPGQqDpZvNm
	37w+YUt5KxHUfrrVCeCbN7W0H9tlwJlxPMcuNdZ3EycjeyEGMScR1wkRUI31Ao6FS9dPiM8tzPw
	h234xENITMB+UaKl7Rw4deCosNFPBcuBYym5pB2jZgfDWKUt9vHwuyaA6Vxw+XqasF/uiH7NKad
	duO7G38mwB6INRbN0733NVyOnjA3sjkDsHoA3FqC89bDZqM1HdKr/ykerQWEaTj+1cIdDhq1pR4
	nBmPDuNJLyRfWYc87S0QGtPoOK/IO4lTjs40UqtjyRbXJX7OLCAkddv83W6BnPsdzeIvYolUj+f
	7trnrJHtAAg4uuVl8sJJah5LWxyg1DesJshbcJstMboB+1t5LTVmHWS9cPeHm4ND8aFEnKx/LZQ
	Oog0ImGrDrsWG6T7j0hetEsev7PJg/Nm9PfAaZnPhvtOPy8N+7dnKMbz8tk7JAfC4Fx5aHjCknO
	HkiUkoI5pjtwa/Id9Iw7LZntu8cRM88nkK6nBJI/CEPYsFm4zsAnZzaXmirnl2ysM1KCP9d2rNp
	FEZ0zJ6bc9TiIRMoES+jn+lJOTmZ2FkIuvsEU4AERVM10IVTGOZSO+hO8Q9A1A==
X-Received: by 2002:a05:701b:42cb:20b0:187:c940:21b9 with SMTP id a92af1059eb24-1ac5d6a0756mr773534c88.30.1793316677695;
        Thu, 29 Oct 2026 16:31:17 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/8] rtorrent: upgrade 0.16.26 -> 0.16.27
Date: Fri, 30 Oct 2026 12:30:59 +1300
Message-ID: <20261029233102.1177876-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131674
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version.

Changelog:
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.27

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e-atomic-test-program-from-being-opt.patch | 57 -------------------
 ...torrent_0.16.26.bb => rtorrent_0.16.27.bb} |  3 +-
 2 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.26.bb => rtorrent_0.16.27.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
deleted file mode 100644
index 5f18c63c2c..0000000000
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 21 Oct 2026 13:00:00 -0700
-Subject: [PATCH] checks.m4: Keep the atomic test program from being optimized
- away
-
-TORRENT_CHECK_ATOMIC decides whether -latomic is needed by linking a
-program that loads from a local std::atomic<uint64_t>. The atomic never
-escapes, so with -O2 in CXXFLAGS clang folds the load to a constant and
-no __atomic_* call is emitted. The check then reports that -latomic is
-not required even on targets that need it for 64-bit atomics, such as
-riscv32, and linking fails later:
-
-  ld.lld: error: undefined symbol: __atomic_load_8
-
-Make the atomic global and modify it with fetch_add() so the atomic
-operations are emitted at any optimization level.
-
-Upstream-Status: Submitted [https://github.com/rakshasa/rtorrent/pull/2072]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- scripts/checks.m4 | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -99,13 +99,17 @@
- ])
- 
- 
-+# The atomic is global and modified with a read-modify-write operation,
-+# otherwise the compiler can optimize the operations away and the program
-+# links without libatomic even on targets that need it.
- AC_DEFUN([TORRENT_CHECK_ATOMIC], [
-   AC_MSG_CHECKING([whether 64-bit atomic operations require -latomic])
-   AC_LANG_PUSH(C++)
- 
-   AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <cstdint>
--                                    #include <atomic>]],
--                                    [[std::atomic<uint64_t> x(0);
-+                                    #include <atomic>
-+                                    std::atomic<uint64_t> x(0);]],
-+                                    [[x.fetch_add(1);
-                                     return x.load();]])],
-     [
-       AC_MSG_RESULT([no])
-@@ -116,8 +120,9 @@
-       LIBS="$LIBS -latomic"
- 
-       AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <cstdint>
--                                        #include <atomic>]],
--                                        [[std::atomic<uint64_t> x(0);
-+                                        #include <atomic>
-+                                        std::atomic<uint64_t> x(0);]],
-+                                        [[x.fetch_add(1);
-                                         return x.load();]])],
-         [
-           AC_MSG_RESULT([yes])
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.26.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.27.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.26.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.27.bb
index 77796bc3a8..d562173f24 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.26.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.27.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurses"
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV} \
-           file://0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch \
            "
 
-SRCREV = "62899bd053c39b70380464e8f64dbcfce92579aa"
+SRCREV = "cab23f12a4ecf43db046ed813bed3d835416338e"
 
 inherit autotools pkgconfig
 
