Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E28E8FDCE
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 06:56:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4534.1766818599950652090
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 22:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OXtC1XxV;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso48542215e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 22:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766818598; x=1767423398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsqpbeS10daB2DBovHUKhN1NEa1QJDlmnjHbsRq0eyM=;
        b=OXtC1XxVJkXnYVNEwxa5GmuXnwcT+s4Gh+b02dpwEoQsux3DTlYfFBIL+CLS5gHUId
         dnqA6QlNvbKg/J/lgNiGNQNu4KFh8eHTs5Vu01rUl9Bi02UsAewn54GPY8Ez/wzlCFFl
         khRn40t6H4+oNINdbTaLD5HOCAKBz7wHWAwcPi3Gw8Q8iETRZsmmWz+JtkB1HSoCqMXf
         l9mJAiUxV1OUc1mfGL71DToDgJ+Bftfla+KgkNeCutvjQ8enNczpAXd3kJoTF6OcQZt4
         3C8mOmGq7lrIJ2xfxKu55HAqdWik5y7xET7I8Xzs03C/1GTnxRzzs4hiNe9UA01Q28zp
         mU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766818598; x=1767423398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsqpbeS10daB2DBovHUKhN1NEa1QJDlmnjHbsRq0eyM=;
        b=c5MJ3wWrJSHxSR228Bark6bE6c4UKQ2YZ7PmAkuL6UwhfSlSxLCpZ2xz4sWNqg7YfR
         T7oLaEz2O9nMve2uoUVrlUuLIMQNWEUjNEqk7O+metc2DkVqi08ViOduU+ThHwqxahuI
         /GwvEuPFplp2iYNZO/ytzRQZzjG0rKf0gHdWui7HTCnIyJj3Ft/Q4Ck0QiMd22OwFAwv
         4f9/YnaDWVe2n/v3Y1UDj0n8Tb4LC8EAP7oVzBjbvAkrVfA+h1PyxWyCseNuQJWo0ELc
         jifWzl42enAuPuD+EypvqeqdsO73BD0xQsZ/RAhksGns7cdYKVFMX8q+7bNBCyErfax0
         pCVQ==
X-Gm-Message-State: AOJu0YxyD/QSu139cH3KNKIRo1ulrNaNs3fNd+MovX9dXT1wsc3rJlqD
	so3+DG2sEobQ3MBny3OXm4x3CqhKSAdRPE1a6Je61PV6MzNkpFMreKUWu31x/Q==
X-Gm-Gg: AY/fxX52fnNAHI+6JM3X61pWx6UExKDNwHB2Lk7oM49ifRd/DbBK3lQQIJ47fi3Z4I/
	SzTSLpLDkAzQBinKiJUlDHd1HQE8CQpXrOxVeAaiNAhh1cMrciWaqzNDkgYpu54LnBQGfms9pHO
	hTDpX2gNVlabo8UgsHI6CfTSJHz+9oC1REjK+UblN70QXY8Up5l272Pq8hawMSacqUKLTunE/Or
	eWwP0Ce6/OIPptpkKT8jXfu4JEZhQDnuctyXq5hw0zOsrROJrjs17z6aMsbFWFpMdnSiGMT8Tem
	IHxIhJdFexDu2gGoTi0gxCv9gcjZkw071Nz9oGXvNvcv0iUa8rSpCPsuZtsDzJzng7akVp3gO20
	BZoBtNZXcRvCjZkrfKonDlj6cYvJMAF0PkbCyqmIyzzrw3Rewda7UEerx5A+ull7dywOVZ+UblN
	3802NWdDLF
X-Google-Smtp-Source: AGHT+IHOFO/xhAR9brwJEemovbUkhMkMPRo3zRNdRCjmpgAfe7lRJjGFrMYC5kj6u0SSfe1yFcHQSw==
X-Received: by 2002:a05:600c:1d1d:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-47d19532f48mr241592495e9.5.1766818597924;
        Fri, 26 Dec 2025 22:56:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm48902371f8f.31.2025.12.26.22.56.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 22:56:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 1/6] physfs: upgrade 3.0.2 -> latest revision
Date: Sat, 27 Dec 2025 07:56:31 +0100
Message-ID: <20251227065636.3144581-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 06:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122944

License-Update: small formatting changes and copyright year update. License hasn't changed.

The previous version of the recipe, 3.0.2 was released in 2019. The last release, 3.2.0 was
done in 2022.
However the project is still actively developed (it just moved to Github) - fetch the latest
revision, at least until there is a new release.

Shortlog:
https://github.com/icculus/physfs/commits/main?since=2019-03-19&until=2025-12-26

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 43 -------------------
 .../recipes-support/physfs/physfs_3.0.2.bb    | 16 -------
 .../recipes-support/physfs/physfs_3.2.0.bb    | 19 ++++++++
 3 files changed, 19 insertions(+), 59 deletions(-)
 delete mode 100644 meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch
 delete mode 100644 meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
 create mode 100644 meta-filesystems/recipes-support/physfs/physfs_3.2.0.bb

diff --git a/meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch b/meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 1584921e65..0000000000
--- a/meta-filesystems/recipes-support/physfs/physfs/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 09f8ca5776f5265571d95454b7307bbee56474da Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Thu, 10 Jul 2025 13:19:24 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:12 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/icculus/physfs/commit/f7d24ce8486d9229207cca1ff98858fe60ffe583]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4a67c27..f0f0183 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -9,7 +9,7 @@
- #  compile, using preprocessor checks for platform-specific bits instead of
- #  testing in here.
- 
--cmake_minimum_required(VERSION 2.8.4)
-+cmake_minimum_required(VERSION 3.5)
- 
- project(PhysicsFS)
- set(PHYSFS_VERSION 3.0.2)
--- 
-2.43.0
-
diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
deleted file mode 100644
index 2571d3f6a0..0000000000
--- a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
-HOMEPAGE = "http://icculus.org/physfs"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=96801882d1120239dcafbf888e821a6e"
-DEPENDS = "readline zlib"
-
-inherit cmake
-
-PE = "1"
-
-SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2 \
-        file://0001-allow-build-with-cmake-4.patch"
-SRC_URI[md5sum] = "dc751294aaf59d1359bbe34e693d1d87"
-SRC_URI[sha256sum] = "304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863"
-
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.2.0.bb b/meta-filesystems/recipes-support/physfs/physfs_3.2.0.bb
new file mode 100644
index 0000000000..958dde8902
--- /dev/null
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.2.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
+HOMEPAGE = "http://icculus.org/physfs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e64c08153665a18b56559d0683a64909"
+DEPENDS = "readline zlib"
+
+inherit cmake
+
+PE = "1"
+PV .= "+git"
+
+SRC_URI = "git://github.com/icculus/physfs.git;protocol=https;branch=main"
+SRCREV = "d70c3fcf06814f8608c8327d3e8136063ee0133d"
+
+do_install:append(){
+    sed -i 's|${RECIPE_SYSROOT}|\$\{CMAKE_SYSROOT\}|g' ${D}${libdir}/cmake/PhysFS/PhysFS-static-targets.cmake
+}
+
+FILES:${PN} += "${datadir}/licenses/PhysicsFS3"

