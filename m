Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344DEC46CD7
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.57802.1702626769856439862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i0DxRSXU;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54dcfca54e0so455601a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626768; x=1703231568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGqWke770wOSBAeZjzSRFAG/+6F6MY9265eGLduEq88=;
        b=i0DxRSXU+s7JfUKWLei9ktFbIvMYCJ7IQN5E+LjvVvxIPQna2lmGsONcy7i5eGg5wv
         F0+wNzsHIRY8QDg8DiruhT0p/puQMAiq0Y63AgWq7I9sA+XV/uQazQxQhwaWkt/tNchK
         AEMgFX5ZPMOaAZPSJ+igpTSTj6Ru65du23M7XPAWy8TBG2ghogm0CbgEpqlEDz5DDvVC
         +N403YAB0WIQQP70ygw/EAhY0x9HEdU/yqrh3QRRI65w0iBUXw2dLR35y2JSQebzAkfc
         MqmYcHs4oqvjScO65F220N58QqlHUZx0xdCP/PA9xiQd4uI433JXlAKCSy8l6dilxUf9
         XMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626768; x=1703231568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGqWke770wOSBAeZjzSRFAG/+6F6MY9265eGLduEq88=;
        b=HzNHQw4Cw4OUQd1z/ngJqJRYvyc/a+OeGjMyWtWX+IKYVCESWB6IGLLf5NRjYqmPid
         z0wli2jMrH2JW0PIaa34hUqEfjdR/BtOVt5F/dMvwabH7wW5MElMoSTt8uuYE6OEC3T3
         p6R7JVP28seScmS0vnrM4C3qYlxlYqwxbZetLVnorBxPM3X3XpIfYs0ZSNK171bAScnc
         mYSpwDTLj8Kb07pR7sFth0idr3sToejtSO9CUNio+XaWgKaRnT2BnngYGUXuZj3gIfUF
         fNHZK1bCCFxcJ1lSrc6Wx8xGDarN9ledMA9yhtuRC5Y1Kq/QidyfsYgSQoMGA56PpMe3
         zn4Q==
X-Gm-Message-State: AOJu0Yy1Oha25Z7l2Grm6yyv0a8rkzGEWPlPz+4Oma21ZHkbRf1Obx+I
	+5avK8xKww4luhufV68vr4jnhto5jUg=
X-Google-Smtp-Source: AGHT+IHXa8i+LDk4EFUt3o+BNHFk9zzCrw0azk2HYZ5EY7vAn0tu3Ay6km9r5Tedb+kKOxJrIAk0kQ==
X-Received: by 2002:a17:907:728a:b0:a1b:a52e:3216 with SMTP id dt10-20020a170907728a00b00a1ba52e3216mr5882098ejc.122.1702626768082;
        Thu, 14 Dec 2023 23:52:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/20] python3-uinput: remove as unmaintained
Date: Fri, 15 Dec 2023 08:52:24 +0100
Message-Id: <20231215075239.3049865-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107498

Both homepage and downloads are gone, last release in 2016,
still relies on distutils which is no longer available in python core as of 3.12.
https://pypi.org/project/python-uinput/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 ...time_t-default-on-32bit-architecture.patch | 43 -------------------
 ...-use-setuptools-instead-of-distutils.patch | 30 -------------
 .../python/python3-uinput_0.11.2.bb           | 20 ---------
 4 files changed, 94 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index af1b7ba92..a8b4532c3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -438,7 +438,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-typeguard \
     python3-tzlocal \
     python3-u-msgpack-python \
-    python3-uinput \
     python3-ujson \
     python3-unidiff \
     python3-uritemplate \
diff --git a/meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch b/meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch
deleted file mode 100644
index 4095fc909..000000000
--- a/meta-python/recipes-devtools/python/python3-uinput/0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 69adf9e32f5b11e15c0cbe17f9331c77fed65bf8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 28 May 2022 15:50:50 -0700
-Subject: [PATCH] Deal with 64bit time_t default on 32bit architectures
-
-Deal with Y2K38 concerns related to Linux input events on more recent
-kernels and libcs on 32-bit systems
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libsuinput/src/suinput.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/libsuinput/src/suinput.c b/libsuinput/src/suinput.c
-index 8d5fb71..13ff16a 100644
---- a/libsuinput/src/suinput.c
-+++ b/libsuinput/src/suinput.c
-@@ -45,11 +45,20 @@ int suinput_emit(int uinput_fd, uint16_t ev_type, uint16_t ev_code,
-         struct input_event event;
- 
-         memset(&event, 0, sizeof(event));
--        gettimeofday(&event.time, 0);
-         event.type = ev_type;
-         event.code = ev_code;
-         event.value = ev_value;
- 
-+/* attempt to deal with 64-bit time keeping on recent 32-bit systems */
-+#if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64))
-+	gettimeofday(&event.time, 0);
-+#else
-+        struct timeval now;
-+        memset(&now, 0, sizeof(now));
-+        gettimeofday(&now, 0);
-+        event.input_event_sec  = now.tv_sec;
-+        event.input_event_usec = now.tv_usec;
-+#endif
-         return suinput_write_event(uinput_fd, &event);
- }
- 
--- 
-2.36.1
-
diff --git a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
deleted file mode 100644
index b2e1b9cd8..000000000
--- a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7a4dde83a9584adb42c7f810d882b1fbf5767e2c Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Tue, 24 May 2022 21:43:35 +0200
-Subject: [PATCH] setup: use setuptools instead of distutils
-
-The latter is deprecated, use setuptools instead.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
-Upstream-Status: Pending
-
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 3fa3343..4900b8b 100644
---- a/setup.py
-+++ b/setup.py
-@@ -3,7 +3,7 @@
- import errno
- import subprocess
- 
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- 
- libudev_so = "libudev.so.1"
- 
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb b/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
deleted file mode 100644
index ef466539b..000000000
--- a/meta-python/recipes-devtools/python/python3-uinput_0.11.2.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Python interface to Linux uinput kernel module."
-HOMEPAGE = "https://pypi.org/project/python-uinput/"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-
-SRC_URI += "file://0001-setup-use-setuptools-instead-of-distutils.patch \
-            file://0001-Deal-with-64bit-time_t-default-on-32bit-architecture.patch \
-"
-SRC_URI[sha256sum] = "99392b676c77b5795b86b7d75274db33fe754fd1e06fb3d58b167c797dc47f0c"
-
-PYPI_PACKAGE = "python-uinput"
-
-inherit pypi setuptools3
-
-DEPENDS += "udev"
-RDEPENDS:${PN} += " \
-    python3-ctypes \
-    python3-distutils \
-"
-RRECOMMENDS:${PN} += "kernel-module-uinput"
-- 
2.39.2


