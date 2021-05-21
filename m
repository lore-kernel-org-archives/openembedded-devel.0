Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.912.1621621888282219048
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 11:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BjsV5rPC;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so6462816pjb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yC0DT6/JeSO1zibtNJlyIvytHZShckZIoVhqaU51RTo=;
        b=BjsV5rPCiMqsoxtRGks4tgo5BYjAk2ag6+HGsIIswjpOHen/Lz+dOb2uHE7Ezhavcy
         UN1g4bxL0dJRHkVIXJOAE4YNVCIwtDlJkboMNpmi8ovy0uWbhWPga8OQm/vOjrg+7sEj
         xtDA0z58Z+lt7OQ4np3WbXJqZemXl6CdzsIqwQkeGYjNVvyMkn53WyxwsmA9pB5ABzMb
         vqAlkpO9gUByeLi4oDTJ5Oqky4Zau8QYdzsvq3OXElQLFXIW2YCk7C4dAOOOWeUsB3UQ
         N4Io2SV9cmcnFyjYMJ4vCJshVrGB0xq03RtCaa+vRULdY2g+OVDZwzjeQs/Yhe1rwyfx
         mH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yC0DT6/JeSO1zibtNJlyIvytHZShckZIoVhqaU51RTo=;
        b=kRJ6QLq6bk9lYVQ9FG9Yb6hQXJcj+M8FpuTGzqNcq3EvJouYTSZwgeK6Nq7wQ2RIWW
         IIiP8XqyecdfG+2ap++zUp0qs7EE794tBtlxVzg2Y2+ajyV5cjGvF3/f2Y0cN0bHFdpU
         pHEak1qdt7rPrWP4jwKLu3FDNGHgHQJobUZlvBcYgIL8dBNbaGvTDaXr8IZT7YavdZRk
         vi/pxBgBww7NB91740CQDONU5havXzh7+34auOAVffoSTEm2TaJTiCXQiX+INMIJpX2z
         9dInf6bcwRalUEjR0G2z9MbqxFPWPtJW8m+4WtS1800q90/PAgLacdn4DLvvVSP3MGJd
         JsQQ==
X-Gm-Message-State: AOAM5319KweYAAxolPwjIjRc0MRBrvLuSzVbNnAgPLpGYklm8dAkh0pg
	iY0DuNByBhgbU8eQJutySqvjIlFkFuiyPg==
X-Google-Smtp-Source: ABdhPJzZjjioC9DbGRk3T/PZ2kkgfnhCKY0jeNcE0eNcFOiNkRbuuV1MltGbPKn+dF1QErYDwoqTIA==
X-Received: by 2002:a17:90b:341:: with SMTP id fh1mr12110497pjb.136.1621621887530;
        Fri, 21 May 2021 11:31:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a746])
        by smtp.gmail.com with ESMTPSA id m1sm1234257pgd.78.2021.05.21.11.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:31:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] rdma-core: Upgrade to 35.0
Date: Fri, 21 May 2021 11:31:24 -0700
Message-Id: <20210521183124.485947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Native python is being probed on some builds

Fixes
recipe-sysroot-native/usr/share/cmake-3.20/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
  (Required is exact version "3.8")

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rdma-core/{rdma-core_33.0.bb => rdma-core_35.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_33.0.bb => rdma-core_35.0.bb} (91%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_33.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_35.0.bb
similarity index 91%
rename from meta-networking/recipes-support/rdma-core/rdma-core_33.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_35.0.bb
index 1c1569cfb0..af4b3788ba 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_33.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_35.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS_${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git"
-SRCREV = "e66ca0832e58dafac7af7ad9e6799eaef438061a"
+SRCREV = "e29a698e99028e9a092bb00c03ee4bfa31ae0cf3"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
@@ -26,7 +26,7 @@ FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*"
 INSANE_SKIP_${PN} += "dev-so"
 
-inherit cmake cpan-base systemd
+inherit cmake cpan-base python3native systemd
 
 SYSTEMD_SERVICE_${PN} = " \
     srp_daemon.service \
-- 
2.31.1

