Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536DFC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 21:23:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.17735.1740864221266176253
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Mar 2025 13:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhuxUapV;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223594b3c6dso54621575ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 13:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740864220; x=1741469020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq88uzj9hXNNz9Jo23FbPG/FeISSbIJMUWznLxnjJRE=;
        b=LhuxUapVnPHks4+HwNgEm0cEUZv1JeQ61KXRBZgZNdGyi8mvBgmODYToWs9mUelBcp
         23knJPszUjSwKrl8KBXXulsLEF7BzjathuXsIpuA+dO6U7amq3povnv3w2XZ9J1lmCv/
         UHBZGinQ0M8W+abfiHlX72RvxosGNoTsmiez9pyXOcWh2VnSYKmWb4+QXgUtD5hvFX+O
         2OSGeidvQaMKO/SK/FgMXhp+QxcP7nvcJKS2BcNUI0oDBVz59xKxx0T1QbksJDakV78a
         1OlpKt1K8uJ5JynJ9txVIeaKECVWw2RNIgzto0waEHxBe9rfKdKJ6omAgdc5py7e2iiI
         cUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740864220; x=1741469020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq88uzj9hXNNz9Jo23FbPG/FeISSbIJMUWznLxnjJRE=;
        b=JTZ+JOgZN/sHf7Xjf6iLDG/XnSaOaR11KnO1nB91B8rFyUb0Uk5uu/IyDp8CYDvl6N
         BJjmY+pMtwtBqtTCnaSztDyrm0wDjPfI575JROEFgyFY3x6rTD1TGedboXZM9QkBUxZb
         PhgJdmgI1dC75MHCrGL/dX5LLNN70txbi6v8gKvKq8SVWoSEaBTlQ8DgCw0Gtb7MhakG
         5DCUrREsrQ+0W0FlA1uwkAPLlEEG4V1uxsjsDV1rpQK0CbNoOCEqVXvFib0LgZdcek8s
         I8h8jcuvYTaNHlvX3DG5KkB4oB2pq5Dmv1E9pr6PXDLHrejfw2rZnmVlF9czzZ9Sii35
         BkbA==
X-Gm-Message-State: AOJu0Yx8wbGFWuJxWuM2LmdvnPIMisFVab0sK/ho5JRsSct76r9KezPZ
	wlyXM0gW7HuvkHRu2Exz/2ogm26nsMmvwIWkoJdswdj21Cb3gwiGcyGnSbSZ
X-Gm-Gg: ASbGncv7EpOK0HdosuCC3a5HgpQR+cYVPTWzb03xRmEFUtqUZX0vJvB3zDX+JNY5MMB
	oUnEuYhf4JCQhiy48lT6JxA8WcD28zxH+O/wDMQ4xVuKBs91tQfM9w7Gkow5WrAK+2e1UJ8UyRV
	rkqtyEzCan4nj2nLdXLkjYNKupuCD6gq3uBqFNCjZTl11rXwbvqNVcpWDXDddRNENNOCfqGUY8c
	7Hjg0khKVCRQYImgFsUDdUimfImt34puHPW+tEmdGu4CQLhW24uw7UxB4BNRg6oUwQM4Ehy+vFI
	BSB8ohEC56ng8EX73LNe7Yakw/+TNlislq3x
X-Google-Smtp-Source: AGHT+IF+VjT/DfNcDhYrRkEcl7ib5nJXjgrZgma8BTd8qoDfjEpOKw4X/WKIEcyELQxGlwmUtIqaZg==
X-Received: by 2002:a05:6a21:339b:b0:1ee:d418:f752 with SMTP id adf61e73a8af0-1f2f4e44fa0mr12633518637.27.1740864220223;
        Sat, 01 Mar 2025 13:23:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c3fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003dd3csm6082588b3a.135.2025.03.01.13.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 13:23:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/2] libmypaint: Add m4 dir to autoconf macro search paths
Date: Sat,  1 Mar 2025 13:23:37 -0800
Message-ID: <20250301212338.1560068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 21:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115718

autotools bblass do not search for the .m4 files in srctree anymore [1]

[1] https://git.yoctoproject.org/poky/commit/?id=a4b1fa2b22794d59fee716afe6e269dae7f87ace

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
index d509aa3dd0..b0f9b82e42 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -16,11 +16,14 @@ SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypa
            file://0001-make-build-compatible-w.-autoconf-2.7.patch \
           "
 SRCREV = "2768251dacce3939136c839aeca413f4aa4241d0"
+
 PV = "1.6.1"
+
 S = "${WORKDIR}/git"
 
+EXTRA_AUTORECONF += "-I m4"
+
 do_configure:append() {
     # autogen uses python2 so generate headers ourselves
-    cd ${S}
-    python3 generate.py mypaint-brush-settings-gen.h brushsettings-gen.h
+    (cd ${S} && python3 generate.py mypaint-brush-settings-gen.h brushsettings-gen.h)
 }

