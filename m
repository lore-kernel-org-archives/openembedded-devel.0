Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF58C83F20
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:44:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.19861.1752255866421764089
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 10:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4DR6b3/;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553c31542b1so2267810e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752255864; x=1752860664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHKhr7tXM20Ra7w6+rEJ31lrufNb9H9shncVoCVSjAI=;
        b=B4DR6b3/YNhl1HP3BIWE8yLTfPaKn3k+KgTsZV5pU5mk4CjJp6Pl3iv/sS3aL3XI9o
         CJhWRu4aTMWNV5MnrdLtPbLKWqTqgtYEb+YYCJMxyvFY+0KbwoTzl88ZdjYlab46IcD3
         E/mw/TvaZeFbORGvEJuF1RDGGpwEXg/omE8RndirVlcgrhVOt9RBE3SnQ0quRen86EJj
         rFxLgYOzdVK1GEl/UC+iRM8xmn1aPLIAfRZGsTfFHw4FHKici8h6rkx/DOaQX2vBhXCY
         UGBpxgUQd1Gt/8Zgc56IlJhJETSvmc5fNN20eYdhR4CRA91Z/GfJQipGqsPUmRN3tcya
         RBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255864; x=1752860664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHKhr7tXM20Ra7w6+rEJ31lrufNb9H9shncVoCVSjAI=;
        b=gGC+cou2A3mJ0S4bKPUTzCXP2YZKtJuRb+osXKUrbRE2ZtRbMq9UHrcheGug4yBrCY
         sZixs4D06Uw/nIIrq39vp+cQlwGinZNHBaERjogNcIyqeHqkDSeFY+BDYbdyu53BRJeu
         zjPZgGVi2hYgaUyH04OWFpPbV7lo+M7PfyF5Lwm+n94V53P+lJ7B++2uUWbeGH4BtXhZ
         eeRPplXYRRJm0Sv8rpdCll5TjEfAOg0m3tIlIhV/0JZQ/PVmB+sGn4UctvqcuP/4aX3N
         GHuPL6CyqyicQHowcpjSXY9uBA+YcgGMvgXamGzLJcQgfK7T2cPdQ+FssiW+9OnWNkKT
         XKcg==
X-Gm-Message-State: AOJu0Yzx4Xh2jaHmC6X/IzXW8IJSiTF8Z7tCML/PkR/LAwUMdZDsWaFZ
	1/METYkFW8JuYPFxD/6ThyMYaqV8Zd5wWx4VzGXKtYZ3tyMNez8+teTmcAvCCw==
X-Gm-Gg: ASbGnct0frVh5EbhNMOVqyKGaYnrxz4SGlW/HGDEQgocA9LLYPSOsNMDiD+Aw2Ivon+
	zVxO/LH8LWjzvSn9RlUrHmnDnWYMva4wat5BXfowHYsninYpS9GpioNVX7hqK5FodzqLMZXQk6L
	QScSvQqM0C1N0aGPUy/nn10t2hh+JQ8DYdenp5NNzHgeGH6TQWzuwrT3OJm/Fvs5jvTHEITaOlh
	ChIEuNf0kjykFnyPQF0RwLUyqN6wSsFVDKRNBg0XsoyqzwvHGNCufjVWY6GgjS6mHesM1lnwFmT
	aCGqvRqteNuPKDmL4q/cqXHGN+om37nLReJiebH0MSKK/d3NLHL8DxnqCAUyuulVaDOKMpyaTPt
	44LQatrDCRPkoxWVvn0ze9XbJZKMopIL3wYUkEA==
X-Google-Smtp-Source: AGHT+IFWcvqHFyjPHX9aKWhb1GgWWx+QCtMBwJd/IEZHY1qY0W6UEtdy/Cd0DpfSYrjQEY22YAsWhw==
X-Received: by 2002:a05:6512:304e:b0:556:c4f1:c7d6 with SMTP id 2adb3069b0e04-55a044ada33mr1290045e87.7.1752255863954;
        Fri, 11 Jul 2025 10:44:23 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60791sm1028002e87.150.2025.07.11.10.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 10:44:23 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 2/3] libmusicbrainz: Add patch for CMake 4+ compatibility
Date: Fri, 11 Jul 2025 20:43:59 +0300
Message-ID: <20250711174400.2092299-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711174400.2092299-1-alperyasinak1@gmail.com>
References: <20250711174400.2092299-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118457

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
 .../musicbrainz/libmusicbrainz_git.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz/0002-allow-build-with-cmake-4.patch

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz/0002-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..2aad2b617f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From f5504099fd6f93ebfa351a034d29beb86db3408c Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Fri, 11 Jul 2025 16:43:29 +0300
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
+Upstream-Status: Submitted [https://github.com/metabrainz/libmusicbrainz/pull/21]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6181a06..f3672a3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ PROJECT(libmusicbrainz5)
+ SET(PROJECT_VERSION 5.1.0)
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 1ae43e8aef..9200d0ea72 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -10,6 +10,7 @@ PV = "5.1.0+git"
 SRCREV = "4655b571a70d73d41467091f59c518517c956198"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol=https \
            file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_request_.patch \
+           file://0002-allow-build-with-cmake-4.patch \
            "
 
 
-- 
2.43.0


