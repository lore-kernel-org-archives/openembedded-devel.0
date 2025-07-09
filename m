Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2705BC83F17
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.3022.1752082279890465796
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A/tC0fs/;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553d771435fso52802e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082278; x=1752687078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyYbquG+69KHkFrG6XS8HnYm78pyhsXcGTcERkC0CG4=;
        b=A/tC0fs/bFKCqBJZe+J51Z0KX453wXntGQfPDTLTuqO/s7gjnnIU4nbyDS2dUV5mYm
         l801qWWE97wugMnyRfZzMKzmyn3xN7LFQo8Mh4tbx4j5keIN22uwPJ+iqOiS05lVx9vN
         mDh9aIUU2XSMrhWae+W5+zYqn7VUM3yLAUL9W2lPbXhk6rwHsRRZlmYmRx664wqgjTuV
         EuUsHfSQ8Ietir+SMpDpHhjepBCPfLiQTOc+5SS3OnGMUcNpU/KK3BDzyvHp7xztf3vY
         5RYXvDFYf6P1QVCSBXlRhT3iTGe14a94baTcwD+p3q45ocIIYxMlifEQrnb4/Wnw261J
         1GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082278; x=1752687078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyYbquG+69KHkFrG6XS8HnYm78pyhsXcGTcERkC0CG4=;
        b=kYrFCqWjcKNpKOCspWMlQRx8qxNKvQfMRTfEIf7cksZUA+W7oNUyvdyPwghWRYb6s6
         2vB2fIjbUvnUm7G9SrV98R63qH4IfOOunZhCtJitonco8Jp9yVRRn9greKx9q2j2+/6/
         OXQWrX9of6tSx2tAwSdAryTRyDYkxGmwx/RcJk0oLB3F887IuQ+E+NorHskI3Dt/0kQH
         gqk9EmwJtERMBcWldf+55yPCjt6DAtMlgL/EuQJi7Ue7kNr0e7XTA+bPXWTyu4/ncOFD
         jLBVFq/UoPTtjs42Vp9BI6gyCtzYPS/8T6x4umUhmIat+JEKHhAg3nPN7iKewUh5vGWG
         IoPA==
X-Gm-Message-State: AOJu0YzFrtc81HThKiKo3j0U40Ss1M5tFAQv5iOu6e/OntnXMQAAAa1r
	GN3jiOYrBdXmaz3Ssn9R/0POMY6+rNlM+fIanMmW3bmFF1xORbOQ6vfqN4Rx1w==
X-Gm-Gg: ASbGncs1SrRwqj4P6X+95juCl/qMchxXP0lal01Ab8EWq8voU357v87a5N9wNJ1qIII
	qyJkXx2VP0OTYGKfhaZRrGchUKAw9br4wKot5q5GfZv5npC+fXmENIsqJfh19r9IdAQY+gdIak1
	H2K0zfVrv8q5Zea3g9leEQlPxxRxsN+EDptWMA40NaiXUhg6we9J93lSMsbYaiwMLORepixe8x+
	IpD2zE1h6ADypbIv/gG8yvpryu9+qdjnfPDfD407zvjDljGFHjZq3dfJXkl87DGvXjz0Cf1YXyK
	HuFmO/R7ItnubQLFRUrGoZjxHx6KZ4XwkFd7YfQmT9ZPrhRgvcyw4bMXAMhv4iHYXKnsjWRDe2O
	WL99KjDybwTUx5g==
X-Google-Smtp-Source: AGHT+IEgGpRxDRIktfF4cWKz/MTdiXRYRByKrkaA+eTK01luKy4t4y0WqJ1L11d18PYPQRnVU5QdHw==
X-Received: by 2002:a05:6512:114c:b0:552:1c1b:556 with SMTP id 2adb3069b0e04-558fa8b24ddmr1207540e87.24.1752082277427;
        Wed, 09 Jul 2025 10:31:17 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:17 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 09/20] libuvc: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:43 +0300
Message-ID: <20250709173054.605430-9-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118363

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../recipes-multimedia/libuvc/libuvc_0.0.7.bb |  5 ++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..bc91f3bf92
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 347567b4a01079faa1e5d3796f185241efee6e4c Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 12:49:18 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/libuvc/libuvc/pull/294]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fbaffc9..54e7431 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(libuvc
+   VERSION 0.0.7
+   LANGUAGES C
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
index 10e64e9878..9a3f718e16 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2f1963e0bb88c93463af750daf9ba0c2"
 
 DEPENDS = "libusb jpeg"
 
-SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https"
-SRCREV = "68d07a00e11d1944e27b7295ee69673239c00b4b"
+SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 
+SRCREV = "68d07a00e11d1944e27b7295ee69673239c00b4b"
 
 inherit cmake pkgconfig
-- 
2.43.0


