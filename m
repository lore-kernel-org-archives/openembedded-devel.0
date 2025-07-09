Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F6EC83F17
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:36 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.3060.1752082295108373397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=haeK0TsZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553c31542b1so60338e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082293; x=1752687093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QkVWSmJMxN+O+WUuCx2bHCrknwlUOuQUOL7tMIilZM=;
        b=haeK0TsZYaGT8y5vbfW+axPk5ZlyySux8s7vGKYCGU/maNI2U0Nk54n7paW4uMlpS5
         lbLZSrRAl1GQ4zFKnRwfrLrC5nYgLxjzPxyAnPzRoQF/ZloFYEL3XvKj0K4azeisBbgl
         hccg/C2kV2K4cuFgXydNhQ6wG4QmodC4ixB5w4127D+pmstyMbmu4DO+xBDnDTOTdlSs
         8dg4XP9Qrlej4CEuaKhzwG/QksV/laOQpJUPcN6rPf7H5g0I9aqUcwDIk6VBC0bU4UL4
         Fun+MYi4tQHI8bQaYtgQrGg8+/eIeNrX386MNgdHyd2VsETuAEVvZJNJ91kgGPAWXECi
         t5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082293; x=1752687093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QkVWSmJMxN+O+WUuCx2bHCrknwlUOuQUOL7tMIilZM=;
        b=gfAqm1NOMTi5II+3qxVB7NsBZbsQ7HsjBSTU6jxeEjpej82PR5Pk2yBG0oQBIkBnd4
         6LiCGCC3P1DhHL1ckpUK6vJcquLr5EAYlTClJKcVdKRn+oCcd3Y/Zdih3A5so8H+CHxg
         jebPkijRtlTp1ZMg42QiHKE6mn5jfDDqQulfFGQxqb5E0Q9aHTirtJFy+TSNyfisuMP3
         X/j9lQwLX4CUW8qrw3hJIYHLkI1/5IWux14cQh9QiOuA+Je4yCFXIsWFuSPA260Q79k3
         JEFlYwiWSGhBFvj0fhA26uTt0qtAeYCST5Gze5Axg7yvWpn4zaiJM1wnNbObH98SeCw2
         1law==
X-Gm-Message-State: AOJu0YzEazT69vJSYgjGTzPE9tgG09y13azgTvF9QKm7+JqWYS1u9SID
	WnH4CZmo25ePdwTE4yb8eXRoq1hEiqDR8itv3TpT4VscuGONjBmSOAL2XiiQKQ==
X-Gm-Gg: ASbGncug/lBamguhX/wZnEhBRHyzi7F34IAXbI5oJrBgGaWdbYn1Bg3JXL6o73qY8Ma
	YpFlG2yXr2Sp03g0xLsg4xf4QJrqhSyFcnj3TO146z/o3OL63WtZSHas8AMVGtZ+/BgwfS7EPta
	IboSHyTPGzRtkqCgCmFPY8Zr0/4Un3rcNrUvpIjlEPICYeRSlbVZsIGYOthjC4RwVcq2G12kgd4
	Eyq7hAyQ6fn5ZgSHxUpgww0JsVLoIGbANEuWSC+IGvTfgh989wJayQ8dHrXXRbnS4g8ChwnXY/8
	n74ROu/iCW95BW1tgYsEr6ZherrH/mkyisedSaGLy9gGqs8F/AYsuwnIxsyi1+k3mbv59gq4mAe
	qsK8=
X-Google-Smtp-Source: AGHT+IHb1ZAfP+8KtpoFhFK2SWsPnhdktJdcD2uxCa6u1XJPkig2Iah0b1rCA5ZHiDpu3O+5wsXfpA==
X-Received: by 2002:a05:6512:3d1e:b0:549:5866:6489 with SMTP id 2adb3069b0e04-558fa9098a3mr1394180e87.47.1752082292618;
        Wed, 09 Jul 2025 10:31:32 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:32 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 19/20] serial: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:53 +0300
Message-ID: <20250709173054.605430-19-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118373

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
 .../0002-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../recipes-support/serial/serial_1.2.1.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/serial/serial/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/serial/serial/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/serial/serial/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..7dba62429c
--- /dev/null
+++ b/meta-oe/recipes-support/serial/serial/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 35fe02e5376fd1372fd5feaee5b9148744ed77eb Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 19:54:57 +0300
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
+Upstream-Status: Submitted [https://github.com/wjwwood/serial/pull/311]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0e4ede8..d03e39b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.3)
++cmake_minimum_required(VERSION 3.5)
+ project(serial)
+ set (SERIAL_VERSION_MAJOR 1)
+ set (SERIAL_VERSION_MINOR 2)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/serial/serial_1.2.1.bb b/meta-oe/recipes-support/serial/serial_1.2.1.bb
index 42151da532..654173fa38 100644
--- a/meta-oe/recipes-support/serial/serial_1.2.1.bb
+++ b/meta-oe/recipes-support/serial/serial_1.2.1.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://github.com/wjwwood/${BPN}.git;protocol=https;branch=main \
     file://Findcatkin.cmake \
     file://0001-Add-SOVERSION-for-shared-lib-and-comment-example.patch \
+    file://0002-allow-build-with-cmake-4.patch \
 "
 SRCREV = "10ac4e1c25c2cda1dc0a32a8e12b87fd89f3bb4f"
 SRC_URI[sha256sum] = "c8cd235dda2ef7d977ba06dfcb35c35e42f45cfd9149ba3ad257756123d8ff96"
-- 
2.43.0


