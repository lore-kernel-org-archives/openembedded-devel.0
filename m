Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F741C83F16
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.3049.1752082281251777134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MIgdtmcF;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5550dca1241so71586e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082279; x=1752687079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o/Fz1jDmreNFFMbtvyPNK/r60rF4NoKG8sRm/1zYws=;
        b=MIgdtmcF1FcuvyL5tAvfjqPZv8AOU/TE6Up15ECvrzHvpnqbsR7E587XP9J65GuI3z
         E0G/st/QGwtDG2Ii8t4CJQnVtNQMaVBqYF8RBfARCBhR2qwixsRybEmIRPGjG5GlG0iR
         Om4wnDcYgFqYk0yi0VRzLW3fXPCKAvpl9O1mHqgzsJR5elWMRN8Xbz9mvNsi3GzOwQv3
         A3j/o9TeoMQNmPSyE+3+tnrf6ntEaHqUmTrS2K5m5OMKkmaDavRiYuHYLoT7sKtSApju
         PCTTdXmiJDDjXx1M1/3a09E2BuygTOFU2UzhPfmDNi8xwDSfB+ONop7JKCr9btpVtvu9
         NAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082279; x=1752687079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8o/Fz1jDmreNFFMbtvyPNK/r60rF4NoKG8sRm/1zYws=;
        b=DTRvQj03b/jq6/K1/hTDvEMB+f4OAl7FuxfLGrpmQ45ihWNX4lH9+gSUqD/POJ17qf
         JUjn2mXljbbR0Un9W15OioNhssc/qEejuJH7jA/PS2ytKYEnB8Mk5OqrZtqS3gocIYSh
         hhJdMPYeIvr8RxUCdsmnwwYB5/nsBHpxCCLBmaOfM1+Q4+6R1bNUYCzxqbVNN+r0r9SD
         +wYPZjmHTZnc99lgjIKSjsoNUvwxatFhyiQB2fe2hbjKG+wOfz3U9vu6hGNZlM8SqwMR
         U10RXSffHWS2rrD4fMeZ6uwK1akL10+VH1rQtWHpxujjL5D9HBxuBYNqTO0d43DlF1fx
         7+Dg==
X-Gm-Message-State: AOJu0YwX1eyDxpw0l8xp2TgEEOMfWoXlSBrXaQ9ZTfvA7MWP44Y0wSVY
	sq2PPjX4dXSDHJ9RbeA/whR0mZq7p7f99qTXBcbXy/FElqP7cQQ3JuwVru+JvA==
X-Gm-Gg: ASbGncuVXZzv5a27Qe0ILxT6Cq8QWzqVJP+F9rASeGAIQsQ3ycgPlOj6x5XBBXIr/g/
	5JD7F336SBZwD60ADWLa6CMDe60mxfjypfAps6okjIVrMfCPYRPorCH8oGXhfgbXN89Jxual9Bt
	UUovcRWDHyDGOQxzPH6YmsVf39Jn9KRiG63s25D3xjq5SV8H4idKTc2+vaozAod2cY2ibQG5xA3
	UKqas+75Oc2WCQaCMS8Rh19051N1qmTmYTlX6Njz4lu/uXVDYHu0u9YusHr+TvN9/BmWPcn+ubh
	iDnJJ/zWH72Pz3lkh+IgeSclFIHVF9iRCLQM0Z+bmcWbeRzo17ern7VEZl/PpIYiQyxmjGzcSSM
	RB8I=
X-Google-Smtp-Source: AGHT+IGRLMilwkMdPuJJ30QZ8HMpnacbnat2hIrYqVm/enY8+yQZfDG30YjuKgS8RrXwZ9yThq+A4A==
X-Received: by 2002:a05:6512:3c86:b0:553:5e35:b250 with SMTP id 2adb3069b0e04-559000c51e0mr306651e87.32.1752082278801;
        Wed, 09 Jul 2025 10:31:18 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:18 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 10/20] flatcc: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:44 +0300
Message-ID: <20250709173054.605430-10-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118364

Fix:

| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
 .../0002-allow-build-with-cmake-4.patch       | 52 +++++++++++++++++++
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..b0b0cedbfb
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,52 @@
+From 4a53680194dac08b8f0247a7f3459c95ce0fddbb Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 13:03:33 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
+Upstream-Status: Submitted [https://github.com/dvidelabs/flatcc/pull/349]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt               | 2 +-
+ external/hash/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb6715a..b69b0bb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ # Ubuntu 14.04 (Trusty)
+-cmake_minimum_required (VERSION 2.8.12.2)
++cmake_minimum_required (VERSION 3.5)
+ # Centos 7
+ #cmake_minimum_required (VERSION 2.8.11)
+ #cmake_minimum_required (VERSION 2.8)
+diff --git a/external/hash/CMakeLists.txt b/external/hash/CMakeLists.txt
+index 7b7d990..12eb3da 100644
+--- a/external/hash/CMakeLists.txt
++++ b/external/hash/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 3.0.2)
++cmake_minimum_required (VERSION 3.5)
+ 
+ project (HashTest)
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index 2565e3b9bd..a4bdda162d 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -11,10 +11,10 @@ PV = "0.6.2+git"
 SRC_URI = " \
            git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master \
            file://0001-Check-for-C-standard-version-23-for-__fallthrough__.patch \
+           file://0002-allow-build-with-cmake-4.patch \
 "
 SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
 
-
 inherit cmake
 
 # Enable installation for target
-- 
2.43.0


