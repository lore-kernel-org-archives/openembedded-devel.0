Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.3607.1617934857620822874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WRFtmMm1;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id a8so4272761oic.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=g6n90fPYYfRwGFWrlDPl75Mq4+v/s7D/XHLfKK13V3I=;
        b=WRFtmMm1sjj2wlU41i8agu6+42e6epayKvcmNpb3Chk4oPdW5mFjJzNFvUFUh5+9zZ
         lYdscaDkz6Kewoyd8w3Uf0omDO/8V4RKhN5TSysplRXEwuri0k3BI/NalVba5mMwCvfh
         xAZz/zxLp7TX14J2F5ocoAlkbGBVlWzbrmyMSSDOQrdMpR8TdDZ8BWlIP+qVeuMDfRlp
         mhCBkpXCGwT3r5J7IchOfInKfnkZNyND+eO8HSC4u81ODRRXc/V6AeV821MFIOF/T1XG
         b8APszU3rXRIEQ0m4J/JYr6Eo+jyxZAGhFZQlUHWyWCr5I9NXgHK6fCkmQwYZtUQKVrz
         nj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=g6n90fPYYfRwGFWrlDPl75Mq4+v/s7D/XHLfKK13V3I=;
        b=Ss1iQGmA0eKTNkDzosy6T9obJeSEHya5QvW3P5OROvm8VGgHWO6+GFNrLxEFHybELE
         4DRzbZxoOWcsMPl7TTjHVIs/Z0vQyLZTHStO7QE6CpGdpV98u+tVr/hGSY4Y/GOzx8qp
         gHtqE4gmqfoLAq2lThSRJ8M2sO3gB4chuvHP6BqHaa8emJct1o0mKGoRLpiIYhLXoGH8
         +9166jtf7JdyxNRnOECLZXvTbYI2BS4M0cpqF4swAFhI6Q9Nr5EhYZiIIaceV3pof95/
         zkjKB/93TQfnE56pwzlMJv68eMYE7yKF4v35nIkLLIuXGFd7dikKIhYzAwTr9npj8D/o
         3aVg==
X-Gm-Message-State: AOAM531EHHBNxKdn8EcKbBzNwHqe+BAkAsFWnNtycGLFHlUidYQU0Uol
	MNdhzdYQY60E8P5ZJSJXUHCc0+jljNQ=
X-Google-Smtp-Source: ABdhPJxSSbVN4VQVbnUaXfNpBBV2CQbRcwSjOtcv7jByzvpQhyRek16uPnpgR+Z8QjvEYsHLcAEJHQ==
X-Received: by 2002:aca:d54c:: with SMTP id m73mr2731180oig.57.1617934856800;
        Thu, 08 Apr 2021 19:20:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/36] libyui(-ncurses): upgrade to 4.1.1, libyui repo was rewritten completely
Date: Thu,  8 Apr 2021 19:20:16 -0700
Message-Id: <c9700ef132137d856dffddd77af68634e1d461ee.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* af06143017fc5f18c4b6488ba4aed26bcc43ff6e doesn't exist in current repo:
  libyui$ git branch -a --contains af06143017fc5f18c4b6488ba4aed26bcc43ff6e
  error: no such commit af06143017fc5f18c4b6488ba4aed26bcc43ff6e

* there are no common commits in the new libyui repo, but luckily old
  repo is kept as
  https://github.com/libyui/libyui-old
  similarly libyui-ncurses now contains only README about being obsolete in:
  https://github.com/libyui/libyui-ncurses
  but at least it wasn't rewritten to have the new content

* now both recipes need to use the same git repo and just different subdirs in S

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f825ad7d7e05bd3125580880cb9e6c1fbe959777)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...byui-ncurses_4.0.0.bb => libyui-ncurses_4.1.1.bb} | 11 +++++------
 .../libyui/{libyui_4.0.0.bb => libyui_4.1.1.bb}      | 12 ++++++------
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_4.0.0.bb => libyui-ncurses_4.1.1.bb} (79%)
 rename meta-oe/recipes-graphics/libyui/{libyui_4.0.0.bb => libyui_4.1.1.bb} (66%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb
similarity index 79%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb
index a3a4a150662..fdf01618a28 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb
@@ -1,17 +1,16 @@
 SUMMARY = "Character Based User Interface for libyui"
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
+LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://../COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
-          "
+SRC_URI = "git://github.com/libyui/libyui.git"
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-SRCREV = "37d3a1e815a47f536b4f694f139f279cc93a3854"
+SRCREV = "718ac672374a2b0f50cbc7d637d90e6471babc3d"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/libyui-ncurses"
 
 inherit cmake gettext pkgconfig
 
diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb
similarity index 66%
rename from meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb
index e42c178e66f..acab7d45682 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb
@@ -1,18 +1,18 @@
 SUMMARY = "Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends."
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+LIC_FILES_CHKSUM = "file://../COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://../COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
 
-SRC_URI = "git://github.com/libyui/libyui-old.git \
+SRC_URI = "git://github.com/libyui/libyui.git \
            file://0001-Fix-build-with-clang.patch \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "af06143017fc5f18c4b6488ba4aed26bcc43ff6e"
+SRCREV = "718ac672374a2b0f50cbc7d637d90e6471babc3d"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/libyui"
 
 inherit cmake gettext pkgconfig
 
-- 
2.17.1

