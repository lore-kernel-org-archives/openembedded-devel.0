Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.950.1617733437916870568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PZycwR3d;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id r12so23483108ejr.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OPeWE3smWquvnkhSOYoqgGUWO5edfV4V7+HvMkt+Grw=;
        b=PZycwR3duzVU88YSMq1UC/YmjsLhw1jY1A71JT5Ev2h1NqDBwynvJNzPCCPIVnmOgG
         Q/aAk1LGC/CK1NUcUr1t6KJvWmWtHILGDAzE/+Hi9mIIS2diQaXHz0m2vkLhRUa6wSoP
         nytgnAbIinTn2Nv/CqofWLDSCcvox2lINhDrQzYkfPEvyhQJQHBRWksMI9tjxqr/Panr
         Hcg1H5lZedT80dcNon72IQSlfC5SS/dXcSwEEFrlLhwaX0uRJp+aM50TkFSHA0ss6t8d
         yfywLmQ7MBKqIwUkLyJ2dyhuowQQHC6i4mfBXbqoWoP3LjIp/pl5RacQbUt3as8+hohe
         obzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OPeWE3smWquvnkhSOYoqgGUWO5edfV4V7+HvMkt+Grw=;
        b=ZFW8m5ZeMzKucJqunENDvc05MckObSJFwVZnuQytsxoC39Du5xDJQ1sh/i6MW4tO74
         j4Bq9PMkaIp4uYpODoEbBH9kOYzslM+lECY2KtsFkMzK9UHT8Fkk/LtTAeYGKBAJIQ/X
         kKw9f/9r2gaEv8jX0OI9nPmfM1hV5V0gupSFMxzO2Y0VEiKO6iIkyAloHfhKhmju8MJ2
         THcbuJgqrwTtPG3s2T9z0bbzmGzVUUq5pL86+Syk/OI6iLJvlflNfUygWF8blHHx3Cw8
         h9NOt83reltSjaB1BUiXwTf5RMNg1f61Rxn+TFXrqqLkyVixy0NHbGtLZ3mxzKI+Dn8o
         7j+Q==
X-Gm-Message-State: AOAM5317zLhxP6HdAvukUl+hxOlbxurExJgxXG2sX+P1o6J9L5iIZpqQ
	cX9iI7ysC/AiWnXRWmT92I0+WIJxnEU=
X-Google-Smtp-Source: ABdhPJzSsNgPUvihEuOVTmg4O+jF/CyB4xAZfjwfc6QYjZge5q6YJr21pRqw9bNEXpOpO3BgW747BQ==
X-Received: by 2002:a17:906:2594:: with SMTP id m20mr11748261ejb.124.1617733436568;
        Tue, 06 Apr 2021 11:23:56 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j7sm14482705edv.40.2021.04.06.11.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:23:56 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] libyui(-ncurses): upgrade to 4.1.1, libyui repo was rewritten completely
Date: Tue,  6 Apr 2021 20:23:48 +0200
Message-Id: <20210406182348.1584147-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406182348.1584147-1-Martin.Jansa@gmail.com>
References: <20210406182348.1584147-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index a3a4a15066..fdf01618a2 100644
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
index e42c178e66..acab7d4568 100644
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
2.30.2

