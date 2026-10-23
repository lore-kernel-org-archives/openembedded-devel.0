Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1646.1792738446860572403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bHr4mr6+;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso224686b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738446; x=1793343246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeI5C5dMrA228Uekxebb4NJiue2r1nVdGDbh4nxZ/iI=;
        b=bHr4mr6+xM5fGMJ5L1oPnJzRwLw6mRqrm12ezoeEAoTNsfcKSg3ZBV4h0vqtU8Mrg9
         JcQG+Jdld4/wLHOjr70JwtsiM08wS8Gk73dq7NoayHCPRiabDyqUWz2ZeUuBBPGYCnfw
         pY9S+KDbqsgKNTnxUi0hD8tJCyR1DpIepbvHrk3rBOXR/8hLmG7ZV4lNtthTLxW/XfO7
         zwKiUpCu4ngaOEXuZ/4qGV2s5iFdrFsH6rqX1Bq5uyTbqGp6gUf7CViThng6cOaefSMA
         JvWWOHBh1kQwm4ACWn3ZYkVigOZb8FyoK+d31oMtQ3iDwUAHWq4jiWsgkAbhZbsEPsq7
         As/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738446; x=1793343246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeI5C5dMrA228Uekxebb4NJiue2r1nVdGDbh4nxZ/iI=;
        b=1ucfjQsZZnONX8MAlavah03TVtKlsxXFfc3WmEgdD0g0ROg6jBQKNgPCi/C0+EHDFx
         Os8cCcz7tDAk3nmNCOrjEFo0IujXCrg38+7rux1fiput/jXWEe8iTRgdCMQBzlN5DI+W
         zLF4yj9S3o06ELfRFbY1AknSma4xcBSoPYwCGlgC5C/RhujlXlOzce2Yu6Z0WXNumvMq
         kaCMG/eSgj1khKIgmRGMf3BdQuwXzdqQZGtsbj7H1vD7Oh2HpoSdPzAhCtR5+697416j
         BfCs7iWYoZTZRwn5XbcvjkCeJXCxljZWXYvXH0T39ZEYC8EYeuGwuPWnSOGgHbxB0X1M
         vo3A==
X-Gm-Message-State: AFq9FYIzw/hEKK4dDepSk9Cp4CkVvxSdzEnuu37Z4Se1oytn4EDfbKeH
	NkwA8UJ57+UMRjeXA0Bykq2hadSTAYMM+lQ9qcZWgn2fsWHPzm0e4RdmiJiepHqw7so=
X-Gm-Gg: AYBFou13dcYgxBFiS95hbqRCTVSzmsateQSX1vR2dFmIBWJNu2z0HYLe39zybX3mjWi
	uZm2OyxoaXbrFSkUZcJlRCH6WiVWzhRVQMzZ9h9jPGGtLPzG1/pD4wLktIApWTBMQ1ESHrhi5Ox
	IGfwsR0QIZ4/VehsRj2XUedsVav6l933hBDxkHIEa5YBCmrWtdxkjFxEjPvyJxn90gvAJBSWiey
	euwgQuIGHb/DRjF7c6FCBSi1nEBFt9z9yq8Rc+Vgt/ulgGvqwJhB3dtxfToVZhlJ7iBeBQ34czn
	ND9y67m1QugAR8un2WyEyJ0LpSsTlU/UZGXmWwM8a+Qgz3+kvJcxyviJLOoRYc1cAZmt8EKgiZF
	1G/WOCxLjHejheHSDkd2HO0Ot1IF8tsY9kqV8n8dLD4hKVkDSO6wMaE+72V4wz+1nhTNJGuXH4W
	COZJ05BrV6Rvhqwy5oTXvPRo4ppJMLKYUgVPK0J0fOwWFT9SGan5vbhkzG3IU+nLhJPqhHqwNe9
	sYU2uv511XfMPg1H+q079wCCNa3eXNf8J/gYVQvRLtB/LjN1Pj6zpw5DbgKm/DC4EEpJNA+Y+Zv
	+v86xHd80J36bksE+E1CTidSerZWq+4xTQb8h3AmRELCrQY+10d0/At2B1jMH7vFh6tTABk2tAD
	HL6OjMsKv+5BH++KE7cI7t7K+EGDW70PtRntb5umAjtY3GZj3i7yWtQOeInG1hfr9mOFTWWbVh/
	hx0LM59LyeHP6Tv5k+udAlgnKYO4CJNYKXNniSUpSf+VnxAizFwt4zIpaKftFYO8+rZqEgek1nD
	alGpzRFWIf3JtyMeBvnwomita6Rrigc9cagn1OyJvCqXS0HXs8g
X-Received: by 2002:a05:6a00:428a:b0:89e:cfbb:e8a2 with SMTP id d2e1a72fcca58-8a2c473969emr1317700b3a.4.1792738446219;
        Thu, 22 Oct 2026 23:54:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/29] libtorrent: Fix libatomic detection with optimized builds
Date: Thu, 22 Oct 2026 23:53:32 -0700
Message-ID: <20261023065350.3228996-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131335
Content-Type: text/plain; charset="utf-8"

The configure check for -latomic links a program that loads from a
local std::atomic<uint64_t>, which clang folds away at -O2. On riscv32
it therefore reports that libatomic is not needed, and libtorrent.so is
left with undefined __atomic_fetch_add_8, __atomic_fetch_sub_8,
__atomic_load_8 and __atomic_store_8 references and no dependency on
libatomic.

Add a patch that makes the test atomic global and modifies it with
fetch_add() so the check cannot be optimized away.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-atomic-test-program-from-being-opt.patch | 57 +++++++++++++++++++
 .../libtorrent/libtorrent_0.16.25.bb          |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
new file mode 100644
index 0000000000..704ec754dc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
@@ -0,0 +1,57 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 13:00:00 -0700
+Subject: [PATCH] checks.m4: Keep the atomic test program from being optimized
+ away
+
+TORRENT_CHECK_ATOMIC decides whether -latomic is needed by linking a
+program that loads from a local std::atomic<uint64_t>. The atomic never
+escapes, so with -O2 in CXXFLAGS clang folds the load to a constant and
+no __atomic_* call is emitted. The check then reports that -latomic is
+not required even on targets that need it for 64-bit atomics, such as
+riscv32, and linking fails later:
+
+  ld.lld: error: undefined symbol: __atomic_load_8
+
+Make the atomic global and modify it with fetch_add() so the atomic
+operations are emitted at any optimization level.
+
+Upstream-Status: Submitted [https://github.com/rakshasa/libtorrent/pull/1020]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ scripts/checks.m4 | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+--- a/scripts/checks.m4
++++ b/scripts/checks.m4
+@@ -99,13 +99,17 @@
+ ])
+
+
++# The atomic is global and modified with a read-modify-write operation,
++# otherwise the compiler can optimize the operations away and the program
++# links without libatomic even on targets that need it.
+ AC_DEFUN([TORRENT_CHECK_ATOMIC], [
+   AC_MSG_CHECKING([whether 64-bit atomic operations require -latomic])
+   AC_LANG_PUSH(C++)
+
+   AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <cstdint>
+-                                    #include <atomic>]],
+-                                    [[std::atomic<uint64_t> x(0);
++                                    #include <atomic>
++                                    std::atomic<uint64_t> x(0);]],
++                                    [[x.fetch_add(1);
+                                     return x.load();]])],
+     [
+       AC_MSG_RESULT([no])
+@@ -116,8 +120,9 @@
+       LIBS="$LIBS -latomic"
+
+       AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <cstdint>
+-                                        #include <atomic>]],
+-                                        [[std::atomic<uint64_t> x(0);
++                                        #include <atomic>
++                                        std::atomic<uint64_t> x(0);]],
++                                        [[x.fetch_add(1);
+                                         return x.load();]])],
+         [
+           AC_MSG_RESULT([yes])
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
index 5b7133e645..a60d66730e 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"

 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"

-SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV} \
+           file://0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch \
+           "
 SRCREV = "6ad3fecf3e7e7aa86855445587b532a91256f344"

 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
