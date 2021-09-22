Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.961.1632338564293928283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y81blVZ/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id n18so3737158pgm.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nEyOIvzKOE4+gOrAlw1TaONgchIzZ39B6e77VcrcFmc=;
        b=Y81blVZ/3+GZwxBYpKe2t6V+1O0snAabxwHj0yK4dsiNuJ1mWpiFYAzPS1j5ylCBar
         Pt3cqBng2yEem5n5A+RsJT6rnUFXDQbUAEEe9V+NtEu1lKjQgnjesFeuiht6au2vNtL9
         93arIuoH9Z8VIbCUyWP9aE+LWDMHPHiy/tOUNQ+Wk4EMsCH2aWz5qSGj+8ULhPh8qyBr
         q3dpxuHoAiE/dm2R+Vu7zPX1KaN68utQoM3fzb1nY6suR5Mo+5tFMVVuTF8UfYUG7ocu
         mmGZdKoCJg7aTIYfJ9F/p1qaCkyOJV7CG4A1UmDsGqRLMaBXtYOuKqBZoGVeBG4kBtim
         9wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nEyOIvzKOE4+gOrAlw1TaONgchIzZ39B6e77VcrcFmc=;
        b=Vq1mAcQYWHQtj9CfMH+chm2QZ54x+RJXEABty9ScgsFMw/nm5bdE0aa2cQrlOlpAad
         jdCxov+TXpdE7MuK8qNsGCMUW5CsR9A1X9iIMNAa069zNfx1yQ10EJ5TOIwWx7DipswG
         OWPMXM7LD+VAwxu/O+A9QcOShPIBUUdeENEphYhRwF89H7RARBOfNPdERJ5W0kWRQX9c
         7PIhwyyfX7P9zE7F4uLizvoxa7sy0Rhn5UxRP+23Vk/mgij2tlUNbdg/2hBKfrINr1Qq
         /QW61KTlfywMwudRWraKqgfDbwbkkrB0BKBsbksEDR6+xafEuWPT474jAms5P38sIwq/
         HESQ==
X-Gm-Message-State: AOAM533zPSfMxgcPV6uxf6cE9bJK5Yh3WWgmK8OEi6x6iAO9xVA/sXzi
	l6TP5XqP3+9r2ch2RSD6KvEzlJucGFGZJw==
X-Google-Smtp-Source: ABdhPJziSV3JnJ2oDWspi5bekuvKr0wdTQZntTA2DqY/dLcKhOkYgy9fTT99lsxKiDlZ7K5x5uaESg==
X-Received: by 2002:a63:7789:: with SMTP id s131mr524324pgc.8.1632338563651;
        Wed, 22 Sep 2021 12:22:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 32/39] wxwidgets: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:06 -0700
Message-Id: <20210922192213.3062719-32-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
-- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
index f1e87ba220..9d9fab2eae 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -10,7 +10,7 @@ LICENSE = "wxWidgets"
 LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
-inherit features_check lib_package binconfig
+inherit features_check lib_package binconfig pkgconfig
 
 # All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"
-- 
2.33.0

