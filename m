Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1473C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.5591.1752004656719951108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=As8+tel2;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32e14ce168eso43751791fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004654; x=1752609454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4Z2+hqJBWgTw92k454g9fClJ/UHHS6m0GiwMRU13jk=;
        b=As8+tel2HgbIU22eKDFCIglzmIPLX3tKvazARgH+JUvaboljE4iFGZM7WDycO+jdR4
         QsIntFY6I7HbyoTbaCxW9ruvfWe/GFqBMCN0mp/tMVSVtRBKnWO81RcVlNd/PyJsUN/t
         5kJfQuwgBqFURdgUOsh3SkzSrSOrLKQBfcguWIoO6q7h4F/0Uo/v75dj9cTHogew2OXy
         7jwpJvDdo4e+hjH49a6iOIVKontd0EPn5MVdyiqyC12uGUt/aC+nlBvg/MQKuSrEJ1mh
         T2JTyuXD/OBC8RBcaEtuWqKIrzrn6Tn4ys9sSRssdz3iT6wlI6aXbNF/wq5Cgb1mgfjv
         +VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004654; x=1752609454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4Z2+hqJBWgTw92k454g9fClJ/UHHS6m0GiwMRU13jk=;
        b=hvWi/c5u1ehKtEHsqar+gHgdRgNFoxZTAGCv+c1NSYKz7P4L4KUPxUccEvKU1FlVtm
         9ePJP4TuvCLMuU7a3IfQYVm9a72A/0NYlBy8gK7HskzbPTW36HZycffSfFOinKp7zzJo
         rFkcuQx9gQK0EtaNyRclN5SPXHTztY0vd+V/Hna7t/mwmZfIIrKR61JIRqlqGZi1laoH
         gu+pBSO6oyNHaX29g9LpelaCGFZ6MERc9tQF78hDxaluGD08XRDd+4PcZXgUyX4vrw2E
         pg/K3EEzwVIPFXsNyjjnWIEsmadjw7XsOWHulwPd6sBeGSXyqohRGNfSIxxAjyifu6MV
         2UVg==
X-Gm-Message-State: AOJu0Yync64cUiT9pgKKT/Oy62EqLwmpA8x8bP+ioFnBC+XFon26wIvn
	sW1Qydb/Gza7fYP7ijTuncssioREAGl2x510FbijBo4deBZVKLcekkq3V8WAgg==
X-Gm-Gg: ASbGncu6af6DdPtViFQIYOLRpEdqujM3+PU70TEdqHJ66cT1vpjYAltpGgK1LNfizIP
	LwLR3rvNkoCbr1qphnK2UBCpHX03YTJkKNKZfWU3yWyCe4KprOAUNVg4OjTJOARx+Qiw/rXCMq3
	NH5wCXuDUF8jsl14BRl5dNZQs9qF3axqARCe6m6/m07pAHQzbpipHc8fouGoViAXbjoRLbt6WgN
	teJmMeO0AQw+TaN0J/hXv1yET5RY50sKCdv2nYe56s2LmjybGww5DtCL7+dne2MwI7ZMsK8PXyN
	YboEzJ/Eg3rsmW+ghFOCE+Eh7I40S0ZhpMInyVHCDfHW1uG2FIy8zfFJj1/flLiuammrEPHO6/p
	R4W0=
X-Google-Smtp-Source: AGHT+IHSUDVat+ga1nS4QMOw629iGErJLjBCg+NbeeoAOE91qdDra0byW3AbCxkVvZGFTMJLby+INg==
X-Received: by 2002:a05:651c:1108:20b0:32f:45e5:df57 with SMTP id 38308e7fff4ca-32f45e5e10cmr831351fa.20.1752004654267;
        Tue, 08 Jul 2025 12:57:34 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:33 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 06/20] qhull: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:22 +0300
Message-ID: <20250708195636.1678606-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118328

Fix:

| CMake Error at CMakeLists.txt:71 (cmake_minimum_required):
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
 .../qhull/0002-allow-build-with-cmake-4.patch | 43 +++++++++++++++++++
 .../recipes-extended/qhull/qhull_2020.2.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qhull/qhull/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/qhull/qhull/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/qhull/qhull/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..5ca865316d
--- /dev/null
+++ b/meta-oe/recipes-extended/qhull/qhull/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 26db5aece1220e4142b5b82720123371a9223bc7 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 17:44:57 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:71 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/qhull/qhull/commit/62ccc56af071eaa478bef6ed41fd7a55d3bb2d80]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c2248f9..b2303c6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -68,7 +68,7 @@
+ # $DateTime: 2020/09/03 21:26:22 $$Author: bbarber $
+ 
+ project(qhull)
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ # Define qhull_VERSION in README.txt, Announce.txt, qh-get.htm, CMakeLists.txt
+ #   qhull-zip.sh (twice), qhull-wiki.md, qhull-news.htm, File_id.diz, index.htm
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
index 13638c391b..9efadbc7f4 100644
--- a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
+++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=484ee0cacf0472e8b40225b116f6296c"
 
 SRC_URI = "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz \
     file://0001-Use-LIB_INSTALL_DIR-for-cmake-and-pkgconfig-files-to.patch \
+    file://0002-allow-build-with-cmake-4.patch \
 "
 SRC_URI[sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
 
-- 
2.43.0


