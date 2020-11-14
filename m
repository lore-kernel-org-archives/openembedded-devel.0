Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.11644.1605388017611308465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 13:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jztZb8Rl;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: texier.pj2@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id a65so19884882wme.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 13:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1ZTKwaXJTD71bsH6RzPpO9Y4+vUHwge733iyh+7X/PI=;
        b=jztZb8Rl90bbz5NHZ9HpOSRplkQvNZvdCEuNTSJktMpYqsWXDOkR/pwFCv/DhGTkMo
         t1cGsnSMnzCKG9oXq1DeSqsYnIELnpaFOMx7DYOVHW1jQN4r5D/46ILKqECURwv3l+jg
         6DIz3mHMv/HZsMahONTZPQ4wrEa1C5DQoQhiJIg+hT5LIM8W73UeK9FdeH9Jm8i9xVfs
         RYrYCZtQ00ANVVUeIESRufoRbyB7Rku9nBO7SMyQzA4OxdJjkaYSNi9pY7bvEq6zpRRD
         mbTVyJ7v3P5q4jATGxBL6qS9CnL7H6VT650gsSGJzzMxgzTPcFht+cibi2BfK+ID5UD5
         gBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1ZTKwaXJTD71bsH6RzPpO9Y4+vUHwge733iyh+7X/PI=;
        b=OKNzXK60jjiwzU65Js3VU+UsQ4kzTUrEn5zy8HycKqa4pdE9lnfZ3nXzPG8S4ZBMo4
         EY6yiP9yio+CXEoBJUQOG7cHoM2FxNRqBgbZzXc8C7nBXRvDmuaxxOK/mGnu7Zy3Ta0d
         /yOVGgc2DIceEZLZYLffT9iz8p0adb0y/B1UT8sVg30Z9u+uTUkqAYS6hpfDNLSY5/hr
         OHUHYIkUqovdOPAB60+Z0L0DyEIBA6G1G95fQIx+dfJv6hsrxNA1+LIoD9Q2GNwnqasY
         ly5dPWb0r8I1CVkVdQCe8obt/VroXn969qU8ai7dK8uoKh3H4pIi0vxa+zxbD4XUKsGb
         BKUw==
X-Gm-Message-State: AOAM532XkCDxiYpSJ15lKcpyNHQSZq2kaf+r5ChOSC+dFDNDx0+rDEUj
	LFv09R3Xl25bRmXEYLfM3o5z6h9AI93ngg==
X-Google-Smtp-Source: ABdhPJyFyN2Rjezcoa8IUAXHc3mQHqBMr0dSa23uJPCjJUB4g/0PMLfQZVT1uMx45tImQeYbHXocTw==
X-Received: by 2002:a1c:87:: with SMTP id 129mr8269601wma.34.1605388015898;
        Sat, 14 Nov 2020 13:06:55 -0800 (PST)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:207c:d256:8c6d:8ffd])
        by smtp.gmail.com with ESMTPSA id a128sm14644657wmf.5.2020.11.14.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 13:06:55 -0800 (PST)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] inotify-tools: upgrade 3.20.2.2 -> 3.20.11.0
Date: Sat, 14 Nov 2020 22:06:53 +0100
Message-Id: <20201114210653.25943-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

 - Drop patch (already in version)

This includes the following changes:

98e8dfa inotify-tools 3.20.11.0
583492a Allow produce NULL-delimited output (#118)
e38d78e Resolves Issue #72 (#113)
8672a5e User $(id -u) over $USER
e5f4ec6 Create FUNDING.yml
8967735 Add integration test to test if chown is tracked successfully
e114a35 Only call git clean -fdx if specified
933dea5 Update issue templates
6644476 Create CODE_OF_CONDUCT.md
c03dcfc Added -P/--no-dereference to watch a symlink (#46)
aa125f5 Use localtime_r over localtime
d222aa9 Fix some issues pointed out by lgtm
69829a8 cirrus-ci: disable the FreeBSD 13 builds
c164cfd Add status for FreeBSD
1b06e96 Stop running unit tests on FreeBSD
7ddf451 Makefile.am: add build rule for README (#111)
67b6e71 Add arm64 build

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 ...akefile.am-add-build-rule-for-README.patch | 46 -------------------
 .../inotify-tools/inotify-tools_git.bb        |  8 ++--
 2 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0001-Makefile.am-add-build-rule-for-README.patch

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-Makefile.am-add-build-rule-for-README.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-Makefile.am-add-build-rule-for-README.patch
deleted file mode 100644
index 2c7cd9970..000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-Makefile.am-add-build-rule-for-README.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 22bff509e2a0e5640994bc92ded62c383d99bc37 Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Mon, 24 Feb 2020 21:44:45 +0100
-Subject: [PATCH] Makefile.am: add build rule for README
-
-Fixes:
-
-| configure.ac:17: installing 'config/config.sub'
-| configure.ac:16: installing 'config/install-sh'
-| configure.ac:16: installing 'config/missing'
-| Makefile.am: error: required file './README' not found
-| libinotifytools/src/Makefile.am: installing 'config/depcomp'
-
-Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/111]
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- Makefile.am | 2 ++
- autogen.sh  | 1 -
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 56e4531..d08c8fe 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,6 +2,8 @@ ACLOCAL_AMFLAGS = -I m4
- 
- SUBDIRS = libinotifytools src man
- 
-+README: README.md
-+
- dist-hook:
- # Automake official documentation states that dist-hook should assume files
- # are not writable.
-diff --git a/autogen.sh b/autogen.sh
-index 48eb21d..31572c2 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -1,4 +1,3 @@
- #!/bin/sh
- 
--cp README.md README
- autoreconf --install "$@" || exit 1
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
index f42abeb2b..8206590a8 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
@@ -5,12 +5,10 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "cfa93aa19f81d85b63cd64da30c7499890d4c07d"
-PV = "3.20.2.2"
+SRCREV = "98e8dfa47eb6a6ba52e35de55d2de21b274a4af8"
+PV = "3.20.11.0"
 
-SRC_URI = "git://github.com/rvoicilas/${BPN} \
-           file://0001-Makefile.am-add-build-rule-for-README.patch \
-           "
+SRC_URI = "git://github.com/rvoicilas/${BPN}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

