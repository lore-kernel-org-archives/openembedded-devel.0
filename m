Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.55362.1597706759919046467
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 16:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jkLMiCsR;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id t10so8307859plz.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 16:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72vrFYmfdfP35sg3JJ4XUTIB6DalgTrNSUyXYVdQJBI=;
        b=jkLMiCsR5z5+JK+3aOAQeXbrQPTQqVhF7dr5hGiICop71t1nRRaziEEH3Gu8bp+GXS
         gKvBqYgxHokbFPrP8iomXIrEEEz+4w4nWEgoqbO3zsA5z3OYKdFarcRcW6GPIL11yAaY
         3vrZJdniPfh6AHHlhg7TcwYkKhvMkiJoK43ZviZp2lpXSOqubzBsESujwXQpXZ54gas7
         demzq2kUIG2E5UMEkJyF2ZPbWDTT1ZRbjHjfyj3+NCFU+kiG5nemsM3RgAtv1OgmvDGw
         e5S68lsY2dTtsjErsjFwYC/QL7RUL2mHCo0jZzxVWpF6F3/cuDounoIIiRsMpQ7bXHnR
         idhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72vrFYmfdfP35sg3JJ4XUTIB6DalgTrNSUyXYVdQJBI=;
        b=WitUviO0Ol3wjmKMV+MDOHYPsM6AYoEcdTEHlS50gv9IZ8yAZbnmUcPwA1Prn6/tT9
         BACX+RcygyWeGMvYjWgX2tzHLvMtAMpth0Vi0rMU8HN0Yxl503j5QEK66FHp1OmwVNl6
         mJJ4e98tTuWEqUhF3Cq7BKnWc23k+ZySIL9qgf3tjjofKhUyi2lRFYJPQL5Vu70U9gfv
         fdHzMpBboJvuoy2nGQ3M3LvnAN4ewkUEVyUPP8Msn320gLGDfGE9a4SHhd60tAbGWxIa
         ThHWl0G5kaov+ECLCBUK47zCpZ7zDLuwiDTtMoztfXO2R45nqwCKb9w7k9FzXkVhBz/u
         qGmQ==
X-Gm-Message-State: AOAM532UPvzdfxALPhit00nVNwaLuk0lFwpfvWNEab5D9Hh2L0Z86xHl
	GpRlFzgn45MhcWtp/F3e8aaJuLBdMr2u4Q==
X-Google-Smtp-Source: ABdhPJx7ja9hTsEW7bf23unyBAf3aYOkPoQd3SWj5JOpPaNeLxRvVYCxipPAI8oN3JxZxQD0mnVWhA==
X-Received: by 2002:a17:902:b681:: with SMTP id c1mr13333859pls.10.1597706759053;
        Mon, 17 Aug 2020 16:25:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id p9sm19918089pjm.1.2020.08.17.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 16:25:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix build with lto/clang
Date: Mon, 17 Aug 2020 16:25:56 -0700
Message-Id: <20200817232556.3803981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CMAKE_RANLIN to llvm-ranlib and use lld for linking since it
detects LTO use for civetweb and therefore archives (.a) should be
creatd is compiler ar/ranlib and gold or lld be used.

backport a patch to fix build with clang, this patch is already proposed
via [1]

[1] https://github.com/facebook/rocksdb/pull/7265

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../remove_const_due_to_std_lock_guard.patch  | 38 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch b/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
new file mode 100644
index 0000000000..2d66576f6e
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
@@ -0,0 +1,38 @@
+From bfce136fa9ff1e955928539484ba4dd55f98f05b Mon Sep 17 00:00:00 2001
+From: Willem Jan Withagen <wjw@digiware.nl>
+Date: Sun, 16 Aug 2020 23:38:55 +0200
+Subject: [PATCH] Update channel.h
+
+Compiling this on FreeBSD with CLang fails due to:
+```In file included from /usr/ports/net/ceph15/work/ceph-15.2.4/src/rocksdb/utilities/backupable/backupable_db.cc:16:
+/usr/ports/net/ceph15/work/ceph-15.2.4/src/rocksdb/util/channel.h:35:33: error: no matching constructor for initialization of 'std::lock_guard<std::mutex>'
+    std::lock_guard<std::mutex> lk(lock_);
+                                ^  ~~~~~
+/usr/include/c++/v1/__mutex_base:90:14: note: candidate constructor not viable: 1st argument ('const std::mutex') would lose const qualifier
+    explicit lock_guard(mutex_type& __m) _LIBCPP_THREAD_SAFETY_ANNOTATION(acquire_capability(__m))
+             ^
+/usr/include/c++/v1/__mutex_base:100:5: note: candidate constructor not viable: no known conversion from 'const std::mutex' to 'const std::__1::lock_guard<std::__1::mutex>' for 1st argument
+    lock_guard(lock_guard const&) _LIBCPP_EQUAL_DELETE;
+    ^
+/usr/include/c++/v1/__mutex_base:94:5: note: candidate constructor not viable: requires 2 arguments, but 1 was provided
+    lock_guard(mutex_type& __m, adopt_lock_t) _LIBCPP_THREAD_SAFETY_ANNOTATION(requires_capability(__m))
+    ^
+1 error generated.
+```
+---
+ thirdparty/rocksdb/util/channel.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/thirdparty/rocksdb/util/channel.h b/thirdparty/rocksdb/util/channel.h
+index 705fa2d28f..993bef5bc0 100644
+--- a/thirdparty/rocksdb/util/channel.h
++++ b/thirdparty/rocksdb/util/channel.h
+@@ -31,7 +31,7 @@ class channel {
+     return buffer_.empty() && eof_;
+   }
+ 
+-  size_t size() const {
++  size_t size() {
+     std::lock_guard<std::mutex> lk(lock_);
+     return buffer_.size();
+   }
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 150d1fa53c..92baa98314 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://fix-osspuuid-cross-compile.patch \
             file://fix-osspuuid-musl-compile.patch \
             file://fix-rocksdb-cross-compile.patch \
+            file://remove_const_due_to_std_lock_guard.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
@@ -37,6 +38,8 @@ EXTRA_OECMAKE += " \
     -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
     -DSKIP_TESTS=ON \
     "
+EXTRA_OECMAKE_append_toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
+LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
 
 # There are endian issues when communicating with the x86 nifi on the the mips and the ppc machines.
 COMPATIBLE_MACHINE_mips = "(!.*mips).*"
-- 
2.28.0

