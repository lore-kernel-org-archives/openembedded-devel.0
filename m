Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.21103.1610905017511715610
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q5TjR4ti;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id x20so2822232pjh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JhKUj3DmrEwyfkOhAme3QJ1HKDP43K69rDClU9Rt5WI=;
        b=q5TjR4tiOGEiPAZw6obj3p1Pf9prbqPJmM2cukOG9LCXNQu9XXwdPerhSy9bs97tXv
         SbMx52gmGuCP9YpJ0wbQ3JsNcJRv5hrVvpZbZTPOTz5iI5JOWzjSQwazeC+ahHgJteV1
         1xptMhoJJ+E/EVb8XYMUWnePk2CszAgznhvJpvEMGaEKKSRoxBpizLQ4C2qKvlQIqSHo
         UdTl79ueCSD971k52YElKeSMu0cbCRFg03AshvsiCS4a7gGpu6jnxVN4//AvfSfp7Kib
         3wxio103+Yn81KIMntwQUgBJc3FtAU9xpdYkqa82ARtYQFgajRaOsd+fCLE8tOXhKeD0
         JwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JhKUj3DmrEwyfkOhAme3QJ1HKDP43K69rDClU9Rt5WI=;
        b=DWPX4/XkvPkpPXC84/424oeVeIi8aNF4WZvUZMl+8llsFwBYPigbPdPHJ/RXsKQQPX
         GE9rBB+PQQZYmqTsg31Fap4k0uA7HOU+wB7Fc53eCuMY05ZTB6TGE6/rfdw2FAQqVNHM
         tZVGZ9/TFai7wnpgRepr8FhNQOCeIrII7aRiMtDvmJ30Xm3hevZf/WU3AjX5Pd3lhto7
         WUfiE9o2J+whjDHBl756c++WPKuHDvPgXZZol+bWYfVkQlm9VU7Dcm0fBkmDJXlprta+
         Rdx7db/GgoJZmlstU7sEgZf6xxMHL4b7kpRKQ2lPODr4dyPNrbVPj5q2RT6gn27M4FVo
         PY8A==
X-Gm-Message-State: AOAM531YiarTJMp81rMk5xj9HOmo1oH0KivEF5umjNBdGFEpYRfhaLF7
	zLHYNBwu1TH2M/biL6vjOHnqPDLjvSxlPw==
X-Google-Smtp-Source: ABdhPJwb12zCE3X07a6SVzc3V6qoRa7LE5KjT1VgAfVLmtnSmmULTM3A5X2bru7dFWVajeao+Uk7vA==
X-Received: by 2002:a17:902:d4c3:b029:de:84a5:aaf2 with SMTP id o3-20020a170902d4c3b02900de84a5aaf2mr9680661plg.80.1610905016933;
        Sun, 17 Jan 2021 09:36:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:56 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 17/31] sdbus-c++-libsystemd: Fix reallocarray check in meson
Date: Sun, 17 Jan 2021 09:36:22 -0800
Message-Id: <c920ef3decae5a18de6054f1fb3f90c608672bc6.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4a171790a66c6adb5bf0994c9b2c85a1ea0b8ce8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-meson-Fix-reallocarray-check.patch   | 25 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
new file mode 100644
index 0000000000..d3d339d56d
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
@@ -0,0 +1,25 @@
+From 1ebf1a1df17afd8b89f84b1928a89069035bf20b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Dec 2020 16:15:57 -0800
+Subject: [PATCH] meson: Fix reallocarray check
+
+reallocarray() is defined in stdlib.h, so that would be right header to
+check for its presense.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/17951]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -501,7 +501,7 @@ foreach ident : [
+                                  #include <sys/stat.h>
+                                  #include <unistd.h>'''],
+         ['explicit_bzero' ,   '''#include <string.h>'''],
+-        ['reallocarray',      '''#include <malloc.h>'''],
++        ['reallocarray',      '''#include <stdlib.h>'''],
+         ['set_mempolicy',     '''#include <stdlib.h>
+                                  #include <unistd.h>'''],
+         ['get_mempolicy',     '''#include <stdlib.h>
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index c8e81a4123..4b93087f4f 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -41,6 +41,7 @@ SRC_URI_MUSL = "\
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
                file://0003-src-basic-copy.c-include-signal.h.patch \
                file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch \
+               file://0001-meson-Fix-reallocarray-check.patch \
                "
 
 PACKAGECONFIG ??= "gshadow idn"
-- 
2.17.1

