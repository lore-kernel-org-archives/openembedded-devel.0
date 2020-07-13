Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.11751.1594608991061319793
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nz0N8csL;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id o22so5516514pjw.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jlgXw1CB9plxvqu0Es4JXrqBGH+ECGw7aGC7bt1TgBY=;
        b=nz0N8csLFcHsea6kiKM0u5AYdgIU84TmL25g1lOSy9GHlERqHpJRAPn5AcNhJNxKH5
         NeFX2fAN6v8jWRplF3MG6p4GmIwTwpmVXLnooBB9gQv5NG/DebeqfOERNa0tB+CyMJDi
         sR4oS7WFY0xrPgqaC09xbc/pdySVrllJxGZ0XtgoehUul8WbII0DTbezW7/MvgsYTLoF
         LcxX4CSPPbvhhhISdVtd6A98lQqzGNgRT6CbqFqvZzy5yfp09qTmFctSOnx6u24gbVzK
         IGPdeigzeyn87eY8etKzvhXzrQG3xuiOUgPzyCHdw5YTInFiqsW7plZCjHEVmpYQ/YZF
         GbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jlgXw1CB9plxvqu0Es4JXrqBGH+ECGw7aGC7bt1TgBY=;
        b=PZrYViNtXThtH6vcHSGmOC+HrYtb7kq30+IGOyaKM6JkIlcHmbEnkybsNSgQw1C3WZ
         yI/AqB8HxhwuJZ4W7+cKvIN0aZNzsGX0bW/XtOiN7iSC3yqL2APCQgfkJPe5iV1F3YmR
         75hFmu2/YPfqxFWUcFQjg5fKPt5/yrcbpuRUESGHyaKjM202CND4aw7q9C9HaUVBoT/b
         wKOG5Vky0+BWe8MOIU3p9uPwIplt1vEhClqiEwXwzHaSQjo787A3cnQzhvNIKjXteRPx
         EvdvZ29oSa0qtUnNB+YAEDETKTzrWhJrZZYsE6xMEo/wF+1IC4N4umNanAC5z4Ii21gU
         FH3Q==
X-Gm-Message-State: AOAM533Hj7qQgneH4+xCbx0g0rf9e625ClDJBQF6b0skilUw5phQ1aQV
	0vOZ25UWrF4yHbRiLtYj67BJlMct2eA=
X-Google-Smtp-Source: ABdhPJx4yAyPyakNQfal6NHu7wxLWnRc2/uwYr610ZZ/7CH8FHU8qiZpSXibT7EeTXVsjbN4zaYpYg==
X-Received: by 2002:a17:902:b706:: with SMTP id d6mr19312371pls.244.1594608990431;
        Sun, 12 Jul 2020 19:56:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/18] paho-mqtt-c: Fix build error when enable multilib.
Date: Sun, 12 Jul 2020 19:56:09 -0700
Message-Id: <1f77d18cc63f82b51ca5df1b1fefd870b3fd5d1c.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

The error is as the following:
ERROR: paho-mqtt-c-1.3.2-r0 do_package: QA Issue: paho-mqtt-c:
Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/cmake
  /usr/lib/cmake/eclipse-paho-mqtt-c
  /usr/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfig.cmake
  /usr/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfigVersion.cmake
  /usr/lib/cmake/eclipse-paho-mqtt-c/eclipse-paho-mqtt-cConfig-noconfig.cmake

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93aa8defe3fae48c48b364136a0af8a58fd2be95)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
index 071d51fc60..3a1222e89e 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
@@ -22,6 +22,10 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+do_configure_prepend() {
+    sed -i s:\ lib/cmake:\ ${baselib}/cmake:g ${S}/src/CMakeLists.txt
+}
+
 do_install_append() {
     # paho-mqtt installes some thing that we don't want.
     rm -rf ${D}${prefix}/samples
-- 
2.17.1

