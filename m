Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E9AC83F12
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.5809.1751928865294791700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmUzK4eh;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so4861739e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928863; x=1752533663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/iz2iaWHSL51BDoX04KUQ6OkHnX3YDWaSCK3rDac7g=;
        b=GmUzK4ehHkoFYAy+gu2594k//K7px9I2srP1i0O5wPRBYx07zSIublycLPqveJCC/p
         OmXYrBVuk0D6LYylqbrJMFw1h99uyZ6E3QnuI/RXvjZ7Y7F8BpO79IlU4NViZR/IxQ/m
         u964pkM4xRKeHTB37yN7WylCvGX2rkayaDAtwYebZphXmxhIWdn1Nh427rP6QzJuRO7L
         cRXu4DzcsPIvLjkr2cIScYlNwRDz+fTcpaCLSOPw7j6PGRrNzmTLYuQXiMNIkFbMwHui
         uRaqTJCS+fIZf+dtpt2jgY/6QRCm76XfWkEwxc9GEzhvBFbhHcjKrH9Gfxwk5R8DnEka
         1gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928863; x=1752533663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/iz2iaWHSL51BDoX04KUQ6OkHnX3YDWaSCK3rDac7g=;
        b=bQ0y5+tUd8B6MmeD9n/N66iOtdQ+eZSudAXyni+XRwjAduH5s+5x4iW3oSQN47wSDh
         4CW+cwQuyMzx5cQAIIW4TbyakHAYgGdJrJObEuzMZShJItJc3PsFn3/Zx+UH7B0VNfSj
         BivVaobjIawmUpJNFZ/2ksaWtkFuqsj6aKW8a7UxELd8iM2RaAaZB050+y09niR+EZVI
         Qvqc9LIBn7ALXKC0HDl3A/rfPd05FCZL9ze85WHFGHAYZ1UU2+jBgjvyvRRFNkIM676G
         9RNnbozuC8yofyEqADHHDwpXBjaEgsO7PWnAvOJapdpSIGc0dVpYHTrDpkM/aotjadv3
         kIOw==
X-Gm-Message-State: AOJu0YytxyVDBJrrtZNSv/VYxAKcKRlCKWJsO7SuHMHCUtgIqVWrBbmU
	IyoQD7fiqKzb5fuWeDP50Bps5S91z9vQiJulUzTjV1gPU5SwQXN8qR0KNEfZ9A==
X-Gm-Gg: ASbGncutMeJqA5tZRR705tL8N7x8wmW/gi56BvO3DAfJ7JjjbQTOiLfUkf63qwJKPtT
	/UEQ9L2CthdNdTNhOv59QtRRHGky8GxeEabbEwP/7XAuaoCmSJLEqfSo2aDHXHbPHx0aAPdRBLN
	naNRmUU1eZxYjVpvhpU9yb4GDkC5z8l4+i4+GzNdGjieCzLnhzI1kCqhk/OM2fC8PjfKPlW4Blu
	Y5np6wwQLnwfUtCjMlCUbjYW6ZiFa60XTxPMh0nSA0oNxcXywHqDwf3YzI5NbDZ5Do8t1rxKtes
	5ZtuQsaswUoGbHG+W7E14y+0bBb9V9/AR84+OR3z6SM2o3L0UuKjlxxuWm4si/dAEFv4nKn9MPu
	gLNU=
X-Google-Smtp-Source: AGHT+IF0/vfXxyx2VjtyXW7ggd7m2+QFYhYSoCPY5Bcm5yxJBJmNOskAKeY1Pca9hsh5VjSahJZ01A==
X-Received: by 2002:a05:6512:2309:b0:553:ccef:e318 with SMTP id 2adb3069b0e04-557aa680289mr4278195e87.41.1751928862832;
        Mon, 07 Jul 2025 15:54:22 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:22 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 5/9] cdrkit: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:03 +0300
Message-ID: <20250707225407.1558421-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118293

Fix:

| CMake Error in CMakeLists.txt:
|   No cmake_minimum_required command is present.  A line of code such as
|
|     cmake_minimum_required(VERSION 4.0)
|
|   should be added at the top of the file.  The version specified may be lower
|   if you wish to support older CMake versions for this project.  For more
|   information run "cmake --help-policy CMP0000".
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |  1 +
 .../files/0003-allow-build-with-cmake-4.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0003-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 4b57957cfc..16b15f745e 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-add-new-option-eltorito-platform.patch \
            file://0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch \
            file://fix-incompatible-pointer-type-error.patch \
+           file://0003-allow-build-with-cmake-4.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch \
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0003-allow-build-with-cmake-4.patch b/meta-oe/recipes-multimedia/cdrkit/files/0003-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..bcab44a5a4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0003-allow-build-with-cmake-4.patch
@@ -0,0 +1,37 @@
+From 4ce4c135f83f9d7894ccbb0901391f5cbf2b1935 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 7 Jul 2025 21:34:32 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+| CMake Error in CMakeLists.txt:
+|   No cmake_minimum_required command is present.  A line of code such as
+|
+|     cmake_minimum_required(VERSION 4.0)
+|
+|   should be added at the top of the file.  The version specified may be lower
+|   if you wish to support older CMake versions for this project.  For more
+|   information run "cmake --help-policy CMP0000".
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Pending
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57edba6..bdfb8bb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,4 @@
++cmake_minimum_required(VERSION 3.5)
+ PROJECT (cdrkit C)
+ SUBDIRS(include genisoimage wodim libedc libhfs_iso libparanoia icedax libusal librols libunls readom netscsid 3rd-party/dirsplit)
+ 
+-- 
+2.43.0
+
-- 
2.43.0


