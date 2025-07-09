Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065F9C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.3051.1752082285204130263
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6k6CH/y;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so106942e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082283; x=1752687083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fr1o/PcHwo/y06ySz3WvapzKuZLXPtQMX1DNFm9w4Jc=;
        b=U6k6CH/yG1/4+OGCxd3bnpM0qgdjGXIRMKuhrS/ML2uDL+gKQetf/Z5f2HjCny9uGm
         LJzf0d8hSoytDT3BxU402CuqScNv3pbZwHWYk4eoC87CdEn2usMf3qb9IOsR5M3naBPL
         yWpmaNpuEedLoPNZaR4Qob+xfHcbyGdSagDldojqCDe5ZjpdWTESVW4g/qklKX2tBWTG
         PJxlTKvh7EN7XTSOJUwLQNmcoYymYt+dGCcyRj2bNQyG94BYFPsEpTZgXaDEZOYx9J5M
         fhuaqsV7gW60XxCH+QMUC5a808qPIF3gi7xBxeMIgjD8L02mRMZgYynNrvKkDh+HzVIJ
         cVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082283; x=1752687083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr1o/PcHwo/y06ySz3WvapzKuZLXPtQMX1DNFm9w4Jc=;
        b=gqOH01/0+mj80OWp5vVvJYq5LYMhwhR/XQVQijtpPF/C/b02GxP5MixsZXbveL1qhY
         GliTmKJG5MrowyI/H7GvN9IyPmc7T/I6cNdyK7zUVHLDhAH/XyCpzW+JYZEboULTsucw
         N0FMIiQMAX+q1hyAtZYLj6Wh2vqzyAY4l+tK7U7kXXzCGpNkH2QojSJTav+4U5fkI3xJ
         aHrrUzK+tExBxee0gba7n5Lj60RhOd9evDQn2fO9Hj/Vb8da+0g+FZ+nHVbmPtQdyjMV
         PURMZ/c3L73hj+t99nfJkPrP7m9u9MjC46LT8SNYaSQkDScXDEoAZQ6xByYcYGIsTHpM
         7BhQ==
X-Gm-Message-State: AOJu0YzT9LO8G3LuviYnrPPN25duL9XaJeIxkJ7+wN7Z2UIUGIyAr9dK
	XlDgTxGIZFws6W7QrjSrFSxL4CU3Rta5/KipYTgTEHM4uv8DOEplLBkDrzZ6Uw==
X-Gm-Gg: ASbGncvD8ZZgoqzIBB4lKLKBwWkqJVjGA2s6TfwEymBRWO68g44+APw9thPzYF6OEqJ
	mwI4+c4i0gHf60YTXyLxfLdh4ea52VQsb64nZiV4gVnu30L3Ph/w5tLrrz1Vphlxet1SRpx7Jbe
	0f+S2mzUiEx4aMBMRE68zc3/qoCOYjz2zA6ZBUDKNiztLN6QBHF2lPiCfcdEibIReUfLLidwqiV
	CecmGbNBUsBr106Ca3DiE9byEU1YeKBP1Rinjh/l5N3ajdZO8nG2QJhfuSFtB5WukJRjRFhe098
	S5qN/nUH1KDxRhJCYXdHvcv6u32JkzlFJ74Ih1sE91+FyKwLD3pOrNLTSAir0ZPRnVDq640A+c5
	q1k0=
X-Google-Smtp-Source: AGHT+IE2057/oq2halRUKENTM7kDXDMukASMzfk53iocIVF3zUxcae+93gfOmv+U2d+Os5IeKD7SPw==
X-Received: by 2002:a05:6512:238e:b0:553:34b7:5731 with SMTP id 2adb3069b0e04-558fa87690amr1526443e87.3.1752082282748;
        Wed, 09 Jul 2025 10:31:22 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:22 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 13/20] read-edid: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:47 +0300
Message-ID: <20250709173054.605430-13-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118367

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
 .../read-edid/read-edid_3.0.2.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/read-edid/read-edid/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/read-edid/read-edid/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/read-edid/read-edid/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..b1a1352945
--- /dev/null
+++ b/meta-oe/recipes-support/read-edid/read-edid/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From affb4ef9dda539222eaad0784577254be1e17195 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 14:02:08 +0300
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
+Upstream-Status: Pending
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2b9bc86..98c90aa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ project (read-edid)
+ 
+ option(I2CBUILD "Build I2C get-edid implementation" ON)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
index 5ea0fb852a..86ea350d1d 100644
--- a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=292c42e2aedc4af636636bf7af0e2b26"
 SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
            file://0001-Do-not-install-license-file.patch \
            file://0001-get-edid-define-quiet-once.patch \
+           file://0002-allow-build-with-cmake-4.patch \
 	   "
 SRC_URI[sha256sum] = "c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f"
 
-- 
2.43.0


