Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AB2C83F17
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:49 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.5752.1752004662035033612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORW9dHVp;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso41740991fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004660; x=1752609460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHyMTTBgWUZIQX3DgC5BXCJSsgkuSqZDWPfK41HuBvQ=;
        b=ORW9dHVp/NsJ+mNVzne6MipXp6gVi7JuFR2hG3y3O5gbL8PFXU2/rf1Bxf5amttwIB
         UUUzgoxhBdQwUcC4DIP2w34nNDf/wqYRAosjLuT/OOlVXpflAtb9iudXX/R5DlAcYf7K
         w6fk+08bAfnC3E0q73GbI6Ik5o9Cj5uqs7xjxG6huY8+91cCdYDy+D+iDJQ2WM6Z/kn/
         rae3mSjdRY7V6cGJlZATGgU+JlsyUIBDeXEaDhdUXY91K3DzDxN3aYPhISO0qDeymDrZ
         o1a4dAXu8ckqh671JhJJ9InvhNNkpsTWr05VMOTVt2mxQisgpJ2XlY2TA5/8Arq4Q4wD
         QKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004660; x=1752609460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHyMTTBgWUZIQX3DgC5BXCJSsgkuSqZDWPfK41HuBvQ=;
        b=olGttDvkV0dDV40FmicFCIiO9zg09Wjt0xGjAboam/1bxEym5N3VPQD1YHtk2JY/Yw
         vZftGgXitaHzY9v6WKxOF33Z+iojWCgmLL18NFl4JURSehOm0r4Nt4U0Z2fDRyxe19h2
         nTF3/pRX6i5/8OQVb4/h6M1hk2xc6SaKIIGkpxcxaaP/Um78knTgKN1ZKYdwRFZjAY9F
         DeqcOBcJt650y4wJ7FL9Wak153c/EtYLgdK4ctwe5DGZ5Smna+yB2Qvyar8OrhQLcD0G
         8X539pTosfK1i8Oq5pTMAVr5/jb/Ah2cUOd++zwPHyCH43FbN6SF+fZifg9a0CZW4FUF
         KAVQ==
X-Gm-Message-State: AOJu0YxDE2IXvpelLA1fPNHvd9jnRnDjGmPJbwsK0Ajc6FZrrDzqTtG6
	wtQ2ka1CodnRLbkkICju7q2IfLvAyciOZud8bsto+hkmmflrTWUzqW/JGmANaQ==
X-Gm-Gg: ASbGncu2466hXRAeaPmCICEcLQkwLQZ0s+yHsCFP7yd3BUWuMvRqNoTwMvZbPEAoRBR
	8rlf10gK8ZpgxjO6uEGMxiqSzliL3N7b+Lf0Vrhd5wBBLKUi18+BHSUqRg8Kyf+r9F+YGarbTiw
	AGFBRpr7qKyEZdyQXYLkVleAo9wVHSEsMnWXeu9nL4dbChduwTo6UhahBSYVy3iajFDWljtgY5a
	vrjgGRo4nmEJ+OWLli5xD25308RGO3G+CZrwkPwfiGT7QSCQv1PGCr4HaQ9RUdLzY4SfXlYam0v
	GQAtD3ocyuGLkyPypYMudAHT4tD/aif1EJnt9YNCgbG96YoQQVNcDJsj/al29iwEBfH1S+pYnQE
	lzDM=
X-Google-Smtp-Source: AGHT+IFS/nmZHbukip8KL4GOZyrsGTB4oI4f7P3H5RmTXUa3/Eep7nGkgbrPyf03vtqj1m1djmOZmA==
X-Received: by 2002:a2e:b982:0:b0:32a:86ea:a1f2 with SMTP id 38308e7fff4ca-32f434b29ebmr2204021fa.22.1752004659552;
        Tue, 08 Jul 2025 12:57:39 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:39 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 10/20] rapidjson: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:26 +0300
Message-ID: <20250708195636.1678606-10-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118332

Fix:

| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
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
 .../rapidjson/rapidjson_git.bb                |  4 +-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..e40b9fe06c
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From b855b1632f9afe5199e01d84da54068a4cb152a8 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 18:46:59 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
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
+Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/ebd87cb468fb4cb060b37e579718c4a4125416c1]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3b9ac512..6d4121e9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
+ if(POLICY CMP0025)
+   # detect Apple's Clang
+   cmake_policy(SET CMP0025 NEW)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 724d329ee2..92858044c1 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,13 +4,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 
 SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
 PV = "1.1.0+git"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
-- 
2.43.0


