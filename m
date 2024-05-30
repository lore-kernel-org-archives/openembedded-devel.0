Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7E6C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 03:59:53 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.140.1717041582847734066
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 20:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZYGsh+4z;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f4a52b94c3so3802865ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717041582; x=1717646382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uW8LCF2YZpnr1BhdPM15iEOTpdRAW1N3eiGKdGVcgQ=;
        b=ZYGsh+4zV68p3loLrs8SDCMF7U2hco9FkjGiwuzLLOC+6O5ET05m90XIaT9HOmjsew
         aTxwYTpQaIkLel56PiFNCrxuZtS1GdCdE1Fxv0aQtCb+MySjbalJ26w1NWegW8k77Jr9
         LeZ7Z0ZnAQdWOB+caqm9A5i4EpJ1XKsHMJNq39xFxjtYbfO+kVkElPOx3AvFBkl4EJ9C
         9tZyBb0AiT0LWvSmzKzwavo6jFQgMLvdNQvisJmSUjnHnIrOzcQEDGaOrK1aSbapgCcx
         vILnpTbm/pq0PJeqi4+tJ98xLij57RtWTDlZrjfwy7UboSbXrfjKb2v4FW5vykDdHZIe
         o5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717041582; x=1717646382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uW8LCF2YZpnr1BhdPM15iEOTpdRAW1N3eiGKdGVcgQ=;
        b=TbyndPYuHJESXs+LHQ5eELKru9jyamZ70Wat0zco8wwQHebfyUl7Un/NYPA6LG1BkN
         EBVF8ds6FyTbvl7qBT2y0wNhYcsWyMqhshcHm+mIFaD3c2GV5SVxu/kS8MlcsDvQ4RK9
         GUdYq7El/UZY/uUa9zF3qUdQOf8LUXduVnUCAJ2BKbeZcxe21O8HywxHaZP1Ja5ZBkBn
         s6/DsyvSw7XMvvAkSqQJ4kQ9py81sH05S2iMT/oxDnELvxHgP4mZLDaeL413zjX9xJiN
         DnHTDgX4nFVmFpnjQhQoxJPUOTv4a9HmPuOwhF0GtDgCwxmi0YETfbi86oOwioCNFlqZ
         TjoA==
X-Gm-Message-State: AOJu0YxE53WKW/oWJbiCEt+0eXpMyqjR5ovoTY0K1zx89dywaWYE4Rcj
	pesDjG+0EsAbUDZRNUXjb/ykIQ469nPZThfKFOMWzQpRQb115MMWpt6JXsreyQE=
X-Google-Smtp-Source: AGHT+IEFV7MYDTSKuj2DjhygFZ66igE0WJfGrrVDQk9DCjm3kaX6RaYh6sRojQhqGnP6892KXFlwAw==
X-Received: by 2002:a17:903:2301:b0:1e0:bae4:48f9 with SMTP id d9443c01a7336-1f61962ea2emr10098875ad.32.1717041581442;
        Wed, 29 May 2024 20:59:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c99d23asm110553705ad.208.2024.05.29.20.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 20:59:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix build with clang and riscv32
Date: Wed, 29 May 2024 20:59:38 -0700
Message-ID: <20240530035938.2567678-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 03:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110622

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-mutex_-to-mtx_-member-of-Concurrent.patch | 37 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.15.0.bb           |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch
new file mode 100644
index 0000000000..a09a17bf2c
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch
@@ -0,0 +1,37 @@
+From cd2b5362fe2e63dff3666ce72da27979fe06a519 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 May 2024 22:24:52 -0700
+Subject: [PATCH] libminifi: Rename mutex_ to mtx_ member of ConcurrentQueue
+
+Fixes
+libminifi/include/utils/MinifiConcurrentQueue.h:48:75: error: no member named 'mutex_' in 'ConcurrentQueue<T>'; did you mean 'mtx_'?
+|    48 |     : ConcurrentQueue(std::move(other), std::lock_guard<std::mutex>(other.mutex_)) {}
+|       |                                                                           ^~~~~~
+|       |                                                                           mtx_
+| libminifi/include/utils/MinifiConcurrentQueue.h:140:22: note: 'mtx_' declared here
+|   140 |   mutable std::mutex mtx_;
+|       |                      ^
+| 1 error generated.
+
+Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/1803]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libminifi/include/utils/MinifiConcurrentQueue.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libminifi/include/utils/MinifiConcurrentQueue.h b/libminifi/include/utils/MinifiConcurrentQueue.h
+index 8abc0ec93..1db58080b 100644
+--- a/libminifi/include/utils/MinifiConcurrentQueue.h
++++ b/libminifi/include/utils/MinifiConcurrentQueue.h
+@@ -45,7 +45,7 @@ class ConcurrentQueue {
+   ConcurrentQueue(const ConcurrentQueue& other) = delete;
+   ConcurrentQueue& operator=(const ConcurrentQueue& other) = delete;
+   ConcurrentQueue(ConcurrentQueue&& other)
+-    : ConcurrentQueue(std::move(other), std::lock_guard<std::mutex>(other.mutex_)) {}
++    : ConcurrentQueue(std::move(other), std::lock_guard<std::mutex>(other.mtx_)) {}
+ 
+   ConcurrentQueue& operator=(ConcurrentQueue&& other) {
+     if (this != &other) {
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
index c9b369f0a6..fca8d9e754 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch \
            file://0007-CMakeLists.txt-do-not-use-ccache.patch \
            file://0008-libsodium-aarch64_crypto.patch \
+           file://0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "
@@ -55,6 +56,8 @@ DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 EXTRA_OECMAKE = " \
                  -DCMAKE_BUILD_TYPE=Release \
                  -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
-- 
2.45.1


