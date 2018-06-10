Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 776797604D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 14:11:36 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id k16-v6so17718915wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o+hEF9fUcMR0hAnHyZZPy7WufxUSiFtKfcfuszbxBZw=;
	b=cf0Uw/vhkkH2V8ai6V282vq9dcmzF9Okz5HKWh0PprLTgTagEgednfnG/V/PKRMJZL
	BFSOywTAoJnLlWMsB2JLZnYXI0tpomlsxlXBygY2YGye/tHqCCB3NGpo8ourtXREuau8
	R0jHeIAzWHWWq3wj9XqHmVCCJazhRuSXzW1RGvvf+ROhQpNFkmgC5HR5SIrLnUXcWQ/t
	/xOwYTBde6O5PA12DWAcQgOPkBomgrOSPtdRVW9dAmniXYk4h9PRnkwfroQnScB2IIfK
	8TfEvRMFsJj0uGYAs+VrSyN64aA9kbL/cNJvS7yaORhKjhiXHnlV8DQZLBglhaPWdnBv
	tbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o+hEF9fUcMR0hAnHyZZPy7WufxUSiFtKfcfuszbxBZw=;
	b=HPxJk0tWBSIeC7aO2FETvWTcoFAwFaK5RLSe2+OUmXhzLVkhqsiOGRm5zRVcuBtGJr
	ps/DucXzRutXlzTKgJXwwtYn4Je/k6ck1qc3kuW/xXrv61svEZhBWlcRgsYqa0GxQvKU
	PROiCWTyM/n/9/ZivUdxx4ZKh1mcEoB0BfEcwV+W2juZ92kuxYWQZ+8hxZlAhEIf4jON
	IAS7C+pwQ5a+usp0ud96EX4T1sbYhp/LC6ttMVbBj99aXCpU1gQ0EwjLr/9rbva0P5QI
	QgAMB+H6+xH0GJaKa4lRO7qyTLMknn0oqpc5dA26H9XDdugpKxYNXzpRrA86M2gE/N+j
	AJAw==
X-Gm-Message-State: APt69E3Y93QuGqNHtDEPyd4V3kRqlxMOsHxzuXp1sumgTsqqxZwOud9Q
	6ZeyAqCXaBOUh7VCgfzsS7Vg7A==
X-Google-Smtp-Source: ADUXVKLzhrovL3iDoGcXJUQUfAUd+UuGEkb1bxGkTpM5H5AhuwHlRaipK/BkRxop4xe5eu8LQmwz8g==
X-Received: by 2002:adf:84c2:: with SMTP id
	60-v6mr10829096wrg.167.1528639896799; 
	Sun, 10 Jun 2018 07:11:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j4-v6sm9170414wrr.47.2018.06.10.07.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 07:11:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 14:11:33 +0000
Message-Id: <20180610141136.4311-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-qt5 1/4] qtwebengine: fix build with gcc8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jun 2018 14:11:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0003-Fix-build-with-gcc8.patch            | 50 +++++++++++++++++++
 ...dbox-Define-TEMP_FAILURE_RETRY-if-n.patch} |  2 +-
 ...id-mallinfo-APIs-on-non-glibc-linux.patch} |  2 +-
 ...ium-musl-include-fcntl.h-for-loff_t.patch} |  2 +-
 ...-off64_t-instead-of-the-internal-__.patch} |  2 +-
 ...sl-linux-glibc-make-the-distinction.patch} |  2 +-
 ...ocator-Do-not-include-glibc_weak_sy.patch} |  2 +-
 ...-correct-member-name-__si_fields-fr.patch} |  2 +-
 ...ine-res_ninit-and-res_nclose-for-no.patch} |  2 +-
 ...m-musl-Do-not-define-__sbrk-on-musl.patch} |  2 +-
 ...l-Adjust-default-pthread-stack-size.patch} |  2 +-
 ...lude-asm-generic-ioctl.h-for-TCGETS.patch} |  2 +-
 ...alloc-Use-off64_t-insread-of-__off6.patch} |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb             | 27 +++++-----
 14 files changed, 76 insertions(+), 25 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch
 rename recipes-qt/qt5/qtwebengine/{0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch => 0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} (93%)
 rename recipes-qt/qt5/qtwebengine/{0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch => 0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0005-chromium-musl-include-fcntl.h-for-loff_t.patch => 0006-chromium-musl-include-fcntl.h-for-loff_t.patch} (92%)
 rename recipes-qt/qt5/qtwebengine/{0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch => 0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0007-chromium-musl-linux-glibc-make-the-distinction.patch => 0008-chromium-musl-linux-glibc-make-the-distinction.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch => 0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch => 0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch => 0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch => 0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0012-chromium-musl-Adjust-default-pthread-stack-size.patch => 0013-chromium-musl-Adjust-default-pthread-stack-size.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch => 0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch} (91%)
 rename recipes-qt/qt5/qtwebengine/{0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch => 0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch} (95%)

diff --git a/recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch b/recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch
new file mode 100644
index 0000000..10c81e9
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch
@@ -0,0 +1,50 @@
+From 334c96ea89c49d559f955182c9a30c62919622ca Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 5 Jun 2018 13:58:16 +0000
+Subject: [PATCH] Fix build with gcc8
+
+---
+ chromium/mojo/public/c/system/buffer.h       | 2 +-
+ chromium/mojo/public/c/system/data_pipe.h    | 2 +-
+ chromium/mojo/public/c/system/message_pipe.h | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/chromium/mojo/public/c/system/buffer.h b/chromium/mojo/public/c/system/buffer.h
+index 09f6d285f3..e516a09e49 100644
+--- a/chromium/mojo/public/c/system/buffer.h
++++ b/chromium/mojo/public/c/system/buffer.h
+@@ -35,7 +35,7 @@ const MojoCreateSharedBufferOptionsFlags
+   ((MojoCreateSharedBufferOptionsFlags)0)
+ #endif
+ 
+-MOJO_STATIC_ASSERT(MOJO_ALIGNOF(int64_t) == 8, "int64_t has weird alignment");
++MOJO_STATIC_ASSERT(MOJO_ALIGNOF(int64_t) == 4 || MOJO_ALIGNOF(int64_t) == 8, "int64_t has weird alignment");
+ struct MOJO_ALIGNAS(8) MojoCreateSharedBufferOptions {
+   uint32_t struct_size;
+   MojoCreateSharedBufferOptionsFlags flags;
+diff --git a/chromium/mojo/public/c/system/data_pipe.h b/chromium/mojo/public/c/system/data_pipe.h
+index 62adbea1ea..76225858ba 100644
+--- a/chromium/mojo/public/c/system/data_pipe.h
++++ b/chromium/mojo/public/c/system/data_pipe.h
+@@ -46,7 +46,7 @@ const MojoCreateDataPipeOptionsFlags MOJO_CREATE_DATA_PIPE_OPTIONS_FLAG_NONE =
+   ((MojoCreateDataPipeOptionsFlags)0)
+ #endif
+ 
+-MOJO_STATIC_ASSERT(MOJO_ALIGNOF(int64_t) == 8, "int64_t has weird alignment");
++MOJO_STATIC_ASSERT(MOJO_ALIGNOF(int64_t) == 4 || MOJO_ALIGNOF(int64_t) == 8, "int64_t has weird alignment");
+ struct MOJO_ALIGNAS(8) MojoCreateDataPipeOptions {
+   MOJO_ALIGNAS(4) uint32_t struct_size;
+   MOJO_ALIGNAS(4) MojoCreateDataPipeOptionsFlags flags;
+diff --git a/chromium/mojo/public/c/system/message_pipe.h b/chromium/mojo/public/c/system/message_pipe.h
+index f0f69d1025..364a02971e 100644
+--- a/chromium/mojo/public/c/system/message_pipe.h
++++ b/chromium/mojo/public/c/system/message_pipe.h
+@@ -44,7 +44,7 @@ const MojoCreateMessagePipeOptionsFlags
+   ((MojoCreateMessagePipeOptionsFlags)0)
+ #endif
+ 
+-MOJO_STATIC_ASSERT(MOJO_ALIGNOF(int64_t) == 8, "int64_t has weird alignment");
++MOJO_STATIC_ASSERT(MOJO_ALIGNOF(int64_t) == 4 || MOJO_ALIGNOF(int64_t) == 8, "int64_t has weird alignment");
+ struct MOJO_ALIGNAS(8) MojoCreateMessagePipeOptions {
+   uint32_t struct_size;
+   MojoCreateMessagePipeOptionsFlags flags;
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
similarity index 93%
rename from recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
rename to recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 96dee6a..678e577 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From b0f4e5412e2cd7eecd63e61c2903d27bad1e438f Mon Sep 17 00:00:00 2001
+From e6e9d77a7a1c174c09214b89b2e1ac034099ea67 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
rename to recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 12cdad8..f9163b4 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From e77a7338d6c25babab860fd1456047ec90297fe9 Mon Sep 17 00:00:00 2001
+From 68356e04310ab5a2fb7869bacc899a718d448033 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
similarity index 92%
rename from recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
rename to recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
index d30693b..0e3c761 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From 570159b9334b8eb242b597846cd2cfa82164babf Mon Sep 17 00:00:00 2001
+From aca69707d74a9286fecf1017c59c8dea91bd7f14 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
rename to recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index 652d782..8404ad6 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 9e7821ff3f65bc6b5b541800c4911c28121e25d4 Mon Sep 17 00:00:00 2001
+From bcbb7edd4e5acdc775a4cfbceafd9bd5a4bbbae5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
rename to recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
index 328481e..70e23cc 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 9e83cb6ba980a66563cc4c5b5c863180f0b538aa Mon Sep 17 00:00:00 2001
+From ce13970c1b2d397377461e2b92be541f6778dd79 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
rename to recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index c730927..b4a6736 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From 6984ed77603d2c20f7cfdc3aa25d79bafaa475c0 Mon Sep 17 00:00:00 2001
+From cc0cf540da630b6646601b20c3b55a828ba337f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
rename to recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index f4eab30..52caf6c 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 7f6bef2fe015663d8218921835166f54266f126a Mon Sep 17 00:00:00 2001
+From 3c5e5f6dc8f5853838dec1ef198caa06a651d5e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
rename to recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 3cb2517..de69087 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From 1582b4305705d66e8f4c4d27c2edf5d4842c8a69 Mon Sep 17 00:00:00 2001
+From c2a5b9616eff83826852b5b9d0a32ddd93764c6a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index 9bd9756..ab45271 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From 291a34f1252619a654c0bdc7bd779890e9bd3b4b Mon Sep 17 00:00:00 2001
+From 0f06eb79e93f756719049223b790e3feb3844642 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
rename to recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
index 57501f5..5144fbb 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From 5ca95d5c90e867fb5e69414d4371be6cc7436f1e Mon Sep 17 00:00:00 2001
+From 544a41a83d4a17a998e72296429b442fd103f4f3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
similarity index 91%
rename from recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
rename to recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index 00793ef..7c63e19 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 1633367ce21f63a747b1523867a1bf431098f223 Mon Sep 17 00:00:00 2001
+From 85d7a5e3cd7db85b5a9305f35ba4c1a76c96a696 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
similarity index 95%
rename from recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
rename to recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index 1d037fd..b967f1d 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From 597ec448bce31e3cb9fc000a516c799a85eb6ded Mon Sep 17 00:00:00 2001
+From 0a0d0244d8282c93dbe32f35ba390f239ff6e137 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 24869f8..3cd549a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -137,25 +137,26 @@ SRC_URI_append_libc-musl = "\
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/65-based
-# 65-based.meta-qt5.3
+# 65-based.meta-qt5.4
 SRC_URI += " \
     file://0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
     file://0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
+    file://0003-Fix-build-with-gcc8.patch;patchdir=src/3rdparty \
 "
 
 SRC_URI_append_libc-musl = "\
-    file://0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
-    file://0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
-    file://0005-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
-    file://0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
-    file://0007-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
-    file://0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
-    file://0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
-    file://0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
-    file://0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
-    file://0012-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
-    file://0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
-    file://0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
+    file://0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
+    file://0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
+    file://0006-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
+    file://0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
+    file://0008-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
+    file://0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
+    file://0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
+    file://0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
+    file://0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
+    file://0013-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
+    file://0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
+    file://0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
 SRCREV_qtwebengine = "28e0320235d33f00c6c141a549dc0553ee0043a5"
-- 
2.17.1


