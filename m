Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC85C83F18
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.3050.1752082283796801369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HshSG/aX;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-556fd896c99so52026e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082282; x=1752687082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr4ZoUMj1tSQXOLhN30vQi3SjRHMSWJFqYPivwJd1ro=;
        b=HshSG/aXG1gOcjRIkSBa0YfHiKYliFyDh5WqwJh+Ivnfa6mYm1iIg29f14mcRThiHZ
         pmoKuS2LRj9vWKDcg0ncuT+69PVZnycZKuL21vz+24pm+NX832qS9SPRHNNml8G6H9Yw
         dwMoLD88lRzmmzKhNEtWfHjk8S7iRyKUFgr2GH1l2qKOGADWkoatp3VjME85TQ4HNuQX
         w/tOYjau+1S1XuJKBlptmrHaLUmxGDaXG2jzHh4F7U2TBkFBz8Xf7gSzwZFYQ1IBb/8f
         Jv/xnmG3XOvAN4CT79VQ+LQ3HUuXtfEzTNkIqMQTYLe+1bi+JldhcMC6xuEo768XOibZ
         LOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082282; x=1752687082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr4ZoUMj1tSQXOLhN30vQi3SjRHMSWJFqYPivwJd1ro=;
        b=KxOyEfs0uPbHpW48zk7BhsrO43tOhGE4tniQVfsWv/p32859m2HY27HM4uNsIOf7vx
         ZzZ2GzZVK1Z6RxkocSDZohFHIeRkMrMDG95pJQUXYriuOmCU/BbXq0IsofS0KjSlNpur
         8bm8KpT71Jq7G3iJryOCC4RzMMswIyxRyCabR7I8xrn72H7CJYMzToWpyBqAa3+RheBZ
         pRZw7xj751BLakFMjxe8Yl3CC9P8F9Jkycj3CybdheMJQrzZLMaj7GqISUlBWCsKBGW3
         o/ds4JZdaqq5c5FPshcuARnsVPArKyYtHv7itRVGxJwiNBK+f6dXbmy1jhFFdFxjHnFP
         AHcg==
X-Gm-Message-State: AOJu0YxpWCuZJwhNdlOr8F/n2uHtl8Sk/cgpz0WOT+G8ScuuiusPvVOl
	xZXubaGthgN5wRKAy96Orq8Bz6FfHYhg5RUQKvxMFLyKvjfyx6vc4Si7pdvTPA==
X-Gm-Gg: ASbGncsOvEZFdPa0G/1vP7diTV00n6AKp8YWBAJx+kNzyRjD39WOEdzkG7q8ovH4MHS
	flzU6+2JZLLfDtFHiEgMwDGNP7+os6F2B3ZffLo2LdeavN5XCyl/rGXqB6HgJHcbVJxJBhYw/r+
	ZvFp+VMSg85+M97pVMjAvQkmK4q0jrkpDMsoYJ1QakAeKU3brDXXQGenlw62JPJVh2KVrutBYzI
	adfl3IWFWecwjMCGlJV03VInrKxklL4ZOaSc+eRyIHGk3iMKF3SNjteN6y12NnWufENp37KEktf
	drS8mWZDGUSr18vnK2GWNT5b8ViqRkslrkHYmRv6rGnuZkgopSQXAsFtMnTusy550ubQUUFzeuA
	1QAHijKlJI/Qbzw==
X-Google-Smtp-Source: AGHT+IGODKo8WRVSxuN9mF4k1IpU6QUOxHNAqrv5PK7ePtSX/a9NeqKQdAkYJrpEYRORTKUZ/yDDaA==
X-Received: by 2002:a05:6512:3c9d:b0:553:37e7:867b with SMTP id 2adb3069b0e04-558fa8f88bemr1275332e87.31.1752082281401;
        Wed, 09 Jul 2025 10:31:21 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:20 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 12/20] cppgenerate: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:46 +0300
Message-ID: <20250709173054.605430-12-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118366

Fix:

| CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
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
 .../0001-allow-build-with-cmake-4.patch       | 43 +++++++++++++++++++
 .../cppgenerate/cppgenerate_0.3.bb            |  5 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cppgenerate/cppgenerate/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/cppgenerate/cppgenerate/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..419a9c0b5d
--- /dev/null
+++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From c7df183e6c34171fc4ce316c049ce69e87ae38a1 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 13:39:08 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
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
+Upstream-Status: Submitted [https://github.com/rm5248/libcppgenerate/pull/11]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bec9d86..00b4abf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ #
+ # Copyright 2018 Robert Middleton robert.middleton@rm5248.com
+ #
+-cmake_minimum_required( VERSION 3.1 )
++cmake_minimum_required( VERSION 3.5 )
+ 
+ project( libcppgenerate VERSION 0.3)
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
index 6e709b6e7e..edb5538425 100644
--- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
+++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
@@ -4,9 +4,10 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
 
-SRC_URI = "git://github.com/rm5248/libcppgenerate.git;branch=master;protocol=https"
-SRCREV = "930c5503f76c877b72b9ff8546353d6f422bd010"
+SRC_URI = "git://github.com/rm5248/libcppgenerate.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 
+SRCREV = "930c5503f76c877b72b9ff8546353d6f422bd010"
 
 inherit cmake
 
-- 
2.43.0


