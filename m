Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.3649.1619140781550786301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 18:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lSuSBkw3;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id d10so34092730pgf.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKYceniwMiyg90x1Bsk4y7haTm5VZLnQ88Ol2miOCLU=;
        b=lSuSBkw3IH4A37vpdaz9zAHQkPPYmuh9UFwNAxpcSl9ZG9Zeh2UR91k63K4eRK/NGb
         FxG0qA0hu58zp3ljmFTUCqeZB53uNszzO5YetOpTDvfCBX405zj8MN+Cuq5+4UViHT0o
         lM9pk0iNyGsXNCd1NsM/M++IjEZ915DVN+qoJ7c4JL7YdIIdecM5vNr0sjgcSLm/4yYE
         XTlYDfZ3Myiy7lHHsePDPuQlPo/2Wmi2jdujdjq5bSMxSrqAdeXcVhlG1NPAJ2i3+z2S
         3OBajoqaioCe/6NDKj6oD6pVOfss1pOjiQKm0g7ZwbLIsmLITf5/1ljG/JooayDQTjb/
         njIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKYceniwMiyg90x1Bsk4y7haTm5VZLnQ88Ol2miOCLU=;
        b=iZw9TfHg/8vpqdVBx2nA2NEWCgue8cmL3XgzJOPyhMpJEz6jQ+nI6KQt0mLVViw+ZD
         jFKy5zD7/wdzWZKEGqzNPEZR+IY4xgbVTRZSY1W7XIzmMXf7YWFUs0FaOw47JMy1KAll
         OKMKXkXgm5CeWt9V9HYmoVPS3NkqfeSz0vuifFCEKB2jWLIyBThjpGnPNO18rz0Q71fP
         j9d9Rr5Va7wToLEHKKK+2A3m+hE/lmvB6uzdHJ8A3WEe/eXUXT6MKunWlqgu5KRVmW5b
         4mKXfeUp3nfP4pNdGadyuqoaqZanoi53wvmzHQBYQNTiiHZ4kCCsEFELe8/aVdoTyqYa
         /4ig==
X-Gm-Message-State: AOAM533amrJS8lJz8RpegHQvHgTNRaOnO99hTlQACkntu9NaEeLGcK0r
	ZGGMQNJyoxAYJMQBOAk5oO4t4qCMGEjOEw==
X-Google-Smtp-Source: ABdhPJxtEksAAWU04x52jlPMOuIFcyz0+vKm+xYGaMzxOND9Cq/8BxjdauGXZ385qm/eFzZ9ETig+w==
X-Received: by 2002:a63:3245:: with SMTP id y66mr1422354pgy.435.1619140780829;
        Thu, 22 Apr 2021 18:19:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id w8sm2837572pfu.35.2021.04.22.18.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 18:19:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] sysprof: Enable sysprofd/libsysprof only when polkit in DISTRO_FEATURES
Date: Thu, 22 Apr 2021 18:19:38 -0700
Message-Id: <20210423011938.3643164-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
index 275fbaa699..e9fa25c63b 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
@@ -21,7 +21,9 @@ SRC_URI += " \
     file://0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch \
 "
 
-PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'sysprofd', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'libsysprof', '', d)} \
+                  ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
 PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
 PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
-- 
2.31.1

