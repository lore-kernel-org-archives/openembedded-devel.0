Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC8BC54731
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 22:45:58 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.22412.1724539553432702015
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 15:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvXzObxM;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-27020fca39aso2600723fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 15:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724539552; x=1725144352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbywF+byI6SLBJ4wegLOiKSC5rY9Et7vYk6aHSI3lzk=;
        b=UvXzObxMuspDnKkZNCi/Yok7UJBF9fhMkZux2PPnkorcSnDChHDsnIpa4DKoAY1rPd
         3rKS6wDkRhDflJSukywHTYhKBzDhiBk5fFDv+SQnmmgobIvSfJ8DxjfeOoBAxrsB7r+m
         o0iulOrrXxebEsebmUdvJsaCLJ4HxGZXHby+TJPTJfcN6eKPpu+13MaMnu/SzYoU86j7
         U2fF/mYbqsQeF4pw3TOfwyN83uOE/nl9YPeTGpMZDyCoi272tt3ecOckgkn+DGuW5OPy
         DwfCoWTy5wY3r4kjpjt3UCbyOv8HgVadyAAGahgfTwwNozeLLOEzzgoflyaMjcjOmQSq
         3Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724539552; x=1725144352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbywF+byI6SLBJ4wegLOiKSC5rY9Et7vYk6aHSI3lzk=;
        b=bVrLF4fdpQZGSj3ut7XxNZ24J9u75aCsv7Yd8Z2hhKzLFFHank1N1RUNXjCc+THLln
         dfWsoc1G2Eqneq9hjZMCRQSRX1j3/oESptkVGIECWVT0YwaOqq1pP04Il2nmUMlldu5D
         UETCqzgHzrTJjpJilyqbSN39Xh/yUeeGLA50EEmSg0KCKD0E5Y4DW6BsTeufdjWgnNUL
         GUwr5a8HnsN36SlkCe+bg3Y51NeeRozPzs8kdsFwlaa3zS2K7U3QdJk+LxFbo+dj7TF2
         kMozRIBuRx+q14XYArNoIPYAahVe2Fs/gAJqcd3Dbd4npBVdAomIyLyOLvaR43mJd5AJ
         xc1g==
X-Gm-Message-State: AOJu0Yz/4jOKa5ShY5GhZ75vhPWuJ1CsCWtN3uI7lHVJujXGbmlwgrKZ
	4V73+tlranQY/7ACUo1eRRMX45QygQd3hU8w4oE/dihXGnli0td2HXSwcA==
X-Google-Smtp-Source: AGHT+IH4O1HEZk4koNXGvcdWmhLiE7GOJPW9rOE0AhyQrWViZ+gJ7+tKr0inSiuNLdc/dqrsQU+umw==
X-Received: by 2002:a05:6358:5328:b0:1ac:f5dc:5163 with SMTP id e5c5f4694b2df-1b5c3b5ab4emr697898055d.29.1724539552271;
        Sat, 24 Aug 2024 15:45:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343388a1sm4914817b3a.184.2024.08.24.15.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 15:45:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] libblockdev: Fix build with latest e2fsprogs
Date: Sat, 24 Aug 2024 15:45:45 -0700
Message-ID: <20240824224545.1944956-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240824224545.1944956-1-raj.khem@gmail.com>
References: <20240824224545.1944956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 22:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111925

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-libext2fs-unused-parameters-fix.patch | 92 +++++++++++++++++++
 .../libblockdev/libblockdev_3.1.1.bb          |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch b/meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch
new file mode 100644
index 0000000000..8129c1e2a7
--- /dev/null
+++ b/meta-oe/recipes-extended/libblockdev/files/0001-libext2fs-unused-parameters-fix.patch
@@ -0,0 +1,92 @@
+From 3aad8d471201da4125bd03d7a6921707461fe182 Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Fri, 7 Jun 2024 10:06:22 +0200
+Subject: [PATCH 1/3] fs: Ignore unused-parameter warning in the FS plugin
+
+There are some unused parameters in the libext2fs header which
+together with Wall and Werror means the plugin compilation fails.
+As a workaround we'll disable the unused-parameter warning for
+now.
+
+Fixes: #1026
+
+Taken from Fedora
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/plugins/fs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/fs/Makefile.am b/src/plugins/fs/Makefile.am
+index 7d4849c0..00474d5a 100644
+--- a/src/plugins/fs/Makefile.am
++++ b/src/plugins/fs/Makefile.am
+@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
+ 
+ lib_LTLIBRARIES = libbd_fs.la
+ 
+-libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror
++libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter
+ libbd_fs_la_LIBADD   = ${builddir}/../../utils/libbd_utils.la $(GLIB_LIBS) $(GIO_LIBS) $(BLKID_LIBS) $(MOUNT_LIBS) $(UUID_LIBS) $(EXT2FS_LIBS)
+ libbd_fs_la_LDFLAGS	 = -L${srcdir}/../../utils/ -version-info 3:0:0 -Wl,--no-undefined -export-symbols-regex '^bd_.*'
+ libbd_fs_la_CPPFLAGS = -I${builddir}/../../../include/ -I${srcdir}/../
+-- 
+2.45.2
+
+
+From da5c14f3e2f83c8c40203897154ee2b788782792 Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Fri, 7 Jun 2024 15:21:09 +0200
+Subject: [PATCH 2/3] fs: Ignore shift-count-overflow warning in FS plugin
+
+The warning happens in the libext2fs header.
+---
+ src/plugins/fs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/fs/Makefile.am b/src/plugins/fs/Makefile.am
+index 00474d5a..42e1c777 100644
+--- a/src/plugins/fs/Makefile.am
++++ b/src/plugins/fs/Makefile.am
+@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
+ 
+ lib_LTLIBRARIES = libbd_fs.la
+ 
+-libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter
++libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter -Wno-shift-count-overflow
+ libbd_fs_la_LIBADD   = ${builddir}/../../utils/libbd_utils.la $(GLIB_LIBS) $(GIO_LIBS) $(BLKID_LIBS) $(MOUNT_LIBS) $(UUID_LIBS) $(EXT2FS_LIBS)
+ libbd_fs_la_LDFLAGS	 = -L${srcdir}/../../utils/ -version-info 3:0:0 -Wl,--no-undefined -export-symbols-regex '^bd_.*'
+ libbd_fs_la_CPPFLAGS = -I${builddir}/../../../include/ -I${srcdir}/../
+-- 
+2.45.2
+
+
+From 90ceb4b52fbda34673fe5303da84b9a902187503 Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Wed, 12 Jun 2024 15:34:02 +0200
+Subject: [PATCH 3/3] fs: Fix ignoring errors from libext2fs
+
+Follow-up for #1028, we still want to show the warning and not
+completely supress it.
+---
+ src/plugins/fs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/fs/Makefile.am b/src/plugins/fs/Makefile.am
+index 42e1c777..1ee256f0 100644
+--- a/src/plugins/fs/Makefile.am
++++ b/src/plugins/fs/Makefile.am
+@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
+ 
+ lib_LTLIBRARIES = libbd_fs.la
+ 
+-libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-unused-parameter -Wno-shift-count-overflow
++libbd_fs_la_CFLAGS   = $(GLIB_CFLAGS) $(GIO_CFLAGS) $(BLKID_CFLAGS) $(MOUNT_CFLAGS) $(UUID_CFLAGS) $(EXT2FS_CFLAGS) -Wall -Wextra -Werror -Wno-error=unused-parameter -Wno-error=shift-count-overflow
+ libbd_fs_la_LIBADD   = ${builddir}/../../utils/libbd_utils.la $(GLIB_LIBS) $(GIO_LIBS) $(BLKID_LIBS) $(MOUNT_LIBS) $(UUID_LIBS) $(EXT2FS_LIBS)
+ libbd_fs_la_LDFLAGS	 = -L${srcdir}/../../utils/ -version-info 3:0:0 -Wl,--no-undefined -export-symbols-regex '^bd_.*'
+ libbd_fs_la_CPPFLAGS = -I${builddir}/../../../include/ -I${srcdir}/../
+-- 
+2.45.2
+
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
index fb778005ff..a42e09d336 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
@@ -14,6 +14,7 @@ DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.1.x-devel;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
+           file://0001-libext2fs-unused-parameters-fix.patch \
            "
 SRCREV = "68aaff5556afe26be749c29a2b7cbd714dce3050"
 S = "${WORKDIR}/git"

