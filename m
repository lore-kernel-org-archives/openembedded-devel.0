Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.26092.1599943205896893671
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 13:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KEsL4RnP;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id g21so1257298plq.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=We/+khetHGfPDvRZNN8cilCCwKArzyokJ4CeUma4OLo=;
        b=KEsL4RnPiKojiUa3pOd1SIAiBi7IgAPARgUo2eOCK07jJCGXyU8n6k7/3ZMwqAgh1l
         oXMAT9UpRDgOTQHaed0pUk0yAc9SFwoCIxHwUJS20gYD1OUuAKMeUYQbkYC83yebkWM9
         eRpowC52GVCZyiPtVZe3raKQnG1CEfw0qP7Z3RcnRR1TtqkGgpANnqhf3rGhx4Slzswx
         fV5f/Jm6niUistPWLwtOpgUCDgRWF0zPG5tde+T7QVQCiV3bOcb2+69E2zIO7jxHUKjQ
         QMkPUwz7yHE1/YUWtZwcc/0chxwf9W26uc2GWJdXF5uXoKMfk8WqYmmZmff5mtmNW4hV
         hVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=We/+khetHGfPDvRZNN8cilCCwKArzyokJ4CeUma4OLo=;
        b=tBITd0VIEhw+PHGT+fm12ZSy2jX/Wre5z3M1kFHUxTufsoaL+lrm4y26zinVKW2p1H
         XzWpoQ5CYHqjIDUwIa2t0fwETshxQkXAfpGDGN6YWmd0f9snJBIYfqYr3XzfT1qbiKIM
         B2ZJJXgHx5BCfzmjOqVhSKLs3Uley4Q+MYzdrXzwtIJWkpP1jIm8RpPJDM4mJxHG9PEU
         w6w0yiV7tXFLdq32pJAnGYCmYqpz9rreCTV1o9pV5U/FUvmtlYXl2VHUgksulvVwPnmt
         XgMUOQxwI6HmZ6MVI6AZBKoeenrODu2WAKwHzcqQEHvIuDmE2bDSF/drW+O/naLYfctf
         49Fw==
X-Gm-Message-State: AOAM532Av5bWkwpnoEoufnU8Y9QI/9ITWcYKhMO+Jw/eJJRkwzAfsWxl
	2NBPaT1cNdYfno6yZNQyjE6FaT2mAC2HxA==
X-Google-Smtp-Source: ABdhPJzyIxMDiewT+24Ahvkm7TxxhJkF9haUTHlF3O1jAEDINqscygmNY5JQiP93jm1p+If8pe4SzA==
X-Received: by 2002:a17:90b:368e:: with SMTP id mj14mr7193614pjb.220.1599943205096;
        Sat, 12 Sep 2020 13:40:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id bx18sm4930321pjb.6.2020.09.12.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 13:40:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Add source-code-pro-fonts
Date: Sat, 12 Sep 2020 13:40:02 -0700
Message-Id: <20200912204002.3316979-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make st conditional on x11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2e84576ca9..53532772a1 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -454,7 +454,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     openbox \
     packagegroup-fonts-truetype \
     qrencode \
-    st \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
     takao-fonts \
     leptonica \
     libvncserver \
@@ -476,6 +476,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     source-han-sans-jp-fonts \
     source-han-sans-kr-fonts \
     source-han-sans-tw-fonts \
+    source-code-pro-fonts \
     ttf-dejavu-sans \
     ttf-dejavu-sans-condensed \
     ttf-dejavu-sans-mono \
-- 
2.28.0

