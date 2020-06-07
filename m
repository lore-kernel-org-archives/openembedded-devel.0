Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.1299.1591500302815618458
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NHErCjQo;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id i12so4302041pju.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EmkWrYi2znn+jF7Mlh+qX51WfiVIbNErRd9EaVzRSvg=;
        b=NHErCjQokCIRT5ILDxr0iIknhC94MeznzVNAxWS1WQLXLgCbimkw+YGi5Qc9quVZku
         qZ/y4jXqekB9pPl6jIH/ewWRN5Iktsa2yZ/ZYQz+nGdbppm37Vc5IhDQTf5DtxSCODbT
         5TedZtRdeEJQMYx2l2WchFuzXNPTE+fuwJLJ8w0f09aJD3p4edQ07k7nkz/cf7CV6KDK
         z2KBFLs/asoVemZKYo8+MMwp5hveIdUHvKBC2FOB4t3Yd28uFX7ynEdPzlfns+FVdf9b
         skMQvpItply5WcLvSfknlqKkwfVHN/i/D0TgAXeM6HSjfYe/7+KSAWmdyU61J+Di2FmQ
         ra+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EmkWrYi2znn+jF7Mlh+qX51WfiVIbNErRd9EaVzRSvg=;
        b=VvA3EAc0/D/OZGsYhB+2149LP50zpHyqcAfbdT4LXfR8Gzzy5E2FtDlFx3uTyM3KVd
         bTfxYgQeZ+/9PBOF7ShPlVQsRtd64dzfXePbCoOIaL9k7QSZRxQ4yhqmd5Z7bxkA2qYb
         9KPEVWMFuavhEPIgtHCgeY+RCUeidXszp7ZurRiq+YMe/ArvY7hxuraj1092k+AlBeYD
         xbHalSewb8vFpmpa9gPFs012btfp0MLy2lfmkLwOGsP1VrQnmoa5en8yfiKVFMSMrLA0
         0KgY7M1SY0DCSsYRLpDxqvI9fxyaBqB3RClQeCyOEczZCCMsDn9yA4gz4LrVFammkCLw
         X9BQ==
X-Gm-Message-State: AOAM533A9Bksoehyr0YcAZKSUBe2SR/NTKicP8Fk637BEfb9WwFmHPgX
	28NdKPmxlSyRLuw8hvLLqZcxx394
X-Google-Smtp-Source: ABdhPJxxX/7TJLhHITb8pSO1ezoyyznbgMhUZlXdkEOYN/s7ihlnLq0sLMcnJ5o7GyfRGk1X5PL9sw==
X-Received: by 2002:a17:902:bb86:: with SMTP id m6mr15638967pls.341.1591500302207;
        Sat, 06 Jun 2020 20:25:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 19/26] sound-theme-freedesktop: remove double depends
Date: Sat,  6 Jun 2020 20:24:29 -0700
Message-Id: <ed9a200e1457565041a953b0576fe8693a1fb3de.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

intltool-native was included more than once in DEPENDS.
Removing all but the first entry

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ea7d2ea94451a5a0563459625dbd256a6338707e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 098b08d476..e4fb4ff026 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0 intltool-native"
 
 inherit autotools gettext
 
-DEPENDS += "glib-2.0-native intltool-native"
+DEPENDS += "glib-2.0-native"
 
 SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
-- 
2.17.1

