Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.35286.1617484468516018331
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 14:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DJAbbsMA;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ap14so11867795ejc.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=827XEW5rJRr58Ee1vPGoWGyiO/EzhGsaMbvxc8W30IA=;
        b=DJAbbsMApwJGIUpBhMO3kS5BcLqSEB0+SuHzIgpgW0jEgHRHed9HaiJEZHSpHKwjPx
         GH9A8GCUDs8KmTXm5UlBhQcG9fKcZXKM1jPgr1Meblo+GpxpQN2Dn0ZjdEceJvD7nx3S
         1CxTqrc3xiqRTHzcgRStzuJklI9LzLSrIAATZEqzihOUz8KKa8BhrJt4kg9bern0MR2q
         kIndwrXZkfnMqadWZYa7qgdHGtL3mNgkgVaNEFxU3KHPK1sw/bmbYUKmcLBwYVYz9CpC
         RL9TsvhbtgEnOQs+urIT+vGw4WdUBdSbhZPXVSy8hGwf/ZeHtSm59byZ8J64j4ObhGst
         KWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=827XEW5rJRr58Ee1vPGoWGyiO/EzhGsaMbvxc8W30IA=;
        b=EtBL30p1fS9A95YhZvDeUxb9YUFzpi1ihu+Ipti7A5dPGIKr17weO9p5ThtK8vbOuc
         X3I5C2EPemo0LLLh0COcHwjNezqSXQqTGhJeavevVUawqvpv0BbrhGnMF1dlMkNId7MZ
         ImiVeFQbQvkCJPVnmuydM5JH1+4dCps69GEDMeJ64VneQI6sDxb+ueSTIXrNiFka5QaE
         htPHJsr3rvvS+TrzzIaTxwOqco2WEj7Rt6aHpY5i7nrX0FYzfj9vDxFpYiinrL+APpTv
         S2/Q5yy5kQlD5esXJztbNb2ZJZ0IhE6e2lQdpoNx+KmMjUXc03ix/S/hOgvTCrd8gHQx
         Jwpg==
X-Gm-Message-State: AOAM532rtuQbi4bLhyYNV2Qy8tM98rGTuTJKqUzEIzNXzqaQlCRokPqh
	m57pl+uuRJ9iQdoMPeAYe3qfy8AUzHM=
X-Google-Smtp-Source: ABdhPJx9023DvuyA/mMdhq44RrcfiyFXvbhUENzySfNThQXZnQWm3QK2GTWxiwNmaTDl6EWJuEtSoA==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr21045860ejr.516.1617484466917;
        Sat, 03 Apr 2021 14:14:26 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b22sm7405386edv.96.2021.04.03.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 14:14:26 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH] packagegroup-meta-oe: include glfw, icewm, geis only with x11 in DISTRO_FEATURES
Date: Sat,  3 Apr 2021 23:14:24 +0200
Message-Id: <20210403211424.1428211-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* and also opengl for glfw

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1921884a69..caa55ffb57 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -190,7 +190,7 @@ RDEPENDS_packagegroup-meta-oe-core = "\
     toybox \
     usleep \
 "
-RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " glfw"
+RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "glfw", "", d)}"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv64 = "safec"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv32 = "safec"
 
@@ -349,7 +349,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      libuio \
      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
      lprng \
-     icewm \
+     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icewm", "", d)} \
      md5deep \
      indent \
      jansson \
@@ -698,7 +698,6 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ace-cloud-editor \
     frame \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
-    geis \
     grail \
     asio \
     augeas \
-- 
2.30.2

