Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.864.1793316676593135482
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JBPehqU9;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14fc585291cso72140c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316676; x=1793921476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HB/fmmh0b8BolF4UyH9xXGSHTScuwNznaBpA+afnjGg=;
        b=JBPehqU9cjONrGkyMeQw7qEVQ+PHruSfx91CQYZ3P/rh+g5qloQ1754rVMYIQ/bfcT
         A4X6Cd9L2CtxFOp590Rt1WoLNb6xJ8oG0kL3hJOk9E9ukk9XsRFjC0lVvxa/WHqEn1k8
         eW6wOozLqZ58p8w5ESvG9vpEhBxVt5DGkfKFyMDaiqypeyI1+HMt+SHNmrbkxisfzJ2o
         gp5H08rSaoAp1VdhSmR1am+7cO8tSpb3nm5c68rYHu+raj6AUv2Xk7yBEDqetKtOmXQQ
         CzgF6FXtVqjmMaPUrKboCmy2AGli7bg4Bitg1xncEaSfb8pn28rXT/qxxtSGszo2OTXK
         2i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316676; x=1793921476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HB/fmmh0b8BolF4UyH9xXGSHTScuwNznaBpA+afnjGg=;
        b=0lxEW75S9WxUOgHr4G2SLUsG2Up4ChYvQds9dNkej1vHgE/yIdkTpsIrMBpr6enwD3
         lU748GX3uzhFAUSa5N6kKbHaaYstIxUkR0nwxznrcIkWsrawprwjU9tqtA7HfYeg+8B/
         gQ+Xpsj4Nhz7eSeumXwGUFeKBzP9AIf0HmBnVxm7sv3d+VN33Q2FSb6XjafrlXM/c5Pw
         YnZ2CK6YSdacbhvd62RwMoBBZua2b809mpgxymM0m+5osjvlCYlsMPsMH7g3xl752MiW
         dPjk1ijtBMdY50hAT/PcLMV/ePRdGx84gjUMQ9pQDohA+jf6tUj2tfL9iPmkxuVD7uOk
         6wxw==
X-Gm-Message-State: AFq9FYK7mrNbvnlICZsHmNH9QvUgK9HLppiNdmw7xSzUYziTZDUFT6yc
	7IBtzftiyfQc01LcLabHa4C1hyLA9E7DQbt2BKe2Ck0TWeOwKd2oSphg+4f2ug==
X-Gm-Gg: AYBFou2u4yJfwRErMtWMWjy+nWlJSgD76bQEAGKX+ZccrWrXo6+1014fTD78EaXLEI0
	oZeERhBbmVfFy27RSqCU1L3Bmgg98Qq1R7+JF8tMult/ET0HhtLn2tVvcGWlQ4u86PQCwV3oHym
	34RJURXEvxpZKysdpChNkhtDKfpVcrkG3mRnBqYCr5PTMXbGCusOghiRmO/vLcMQxZRuZEy9CgK
	TpYsm4fRyPsA75gufAP+wg2BdBI+9RD0Q4PcGvTxKCXS9yEDVgiFRF2vvcnc3D/wTELR79AhB5H
	IbyhWBip0WgekdMLkc4ZpKsp2DRj/Cu6o+1pN9UWYdKdUrLIXVlY1osZCgriezN887f6jwbr7aJ
	mFtstxjNP5W88jZsf3rnDGBdS9PWfhv4hC+Aanf9mQ9BghidEo3ycOjnYty2kFq21pHxEtT5XKD
	m8wdvq2GSSYaEzewxtZr2hJ/GU4+7H6Pvyssh3aEo/wfU7mmMgVZc56fvCzhwxZ7d3rRmfgDzB2
	MVhYBEwvRblzQmljIJJ95eOyDXiLnfDWlhIUz47il/2HTVY+Xv9rbaiDHLi00XK0hl4011bNylk
	OjxmzrTMYHm1YMgub5sotsj7ns+n+c9OTyz9h4bxu0bRF5mJbGZURx4td3HAvg==
X-Received: by 2002:a05:7022:3b87:b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-1ac56c9ff33mr789406c88.3.1793316675634;
        Thu, 29 Oct 2026 16:31:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/8] libtorrent: upgrade 0.16.26 -> 0.16.27
Date: Fri, 30 Oct 2026 12:30:58 +1300
Message-ID: <20261029233102.1177876-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131673
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e-atomic-test-program-from-being-opt.patch | 57 -------------------
 ...rrent_0.16.26.bb => libtorrent_0.16.27.bb} |  3 +-
 2 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.26.bb => libtorrent_0.16.27.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
deleted file mode 100644
index 704ec754dc..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
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
-Upstream-Status: Submitted [https://github.com/rakshasa/libtorrent/pull/1020]
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
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.26.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.27.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.26.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.27.bb
index 2de8d5d31a..b54f7ffa0a 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.26.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.27.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV} \
-           file://0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch \
            "
-SRCREV = "21daa3b96a3b8cfe14961545b5115de7ed12da95"
+SRCREV = "47114f095b3476ed4ccd8dbee6f027f5905adce7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
