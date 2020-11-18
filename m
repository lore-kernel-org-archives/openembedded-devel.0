Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.25421.1605712097094462463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W53gQde0;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id j5so1123714plk.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+YdqzBWkhaUStPDhBekHs6kHeRJvPig2Z3/bxpJKTKI=;
        b=W53gQde0ZqtDSMdsGL/5M2CYgZuYjTXdoMlx72/cGKJzvj3dho1X8VgUcgXPeezd0Y
         sruKdsQOb7xoBNx+So0a2xFld08qxWIcOoo47V9xDouxeJoGOVWVmTwwIDUEZTT2oSiQ
         gS2XXZj69xelErxeMwLH32o5yYGcTaxkS6eKVXv0dpHjnG85a75+pq4sAVNmq8w9UaBW
         UjbyVnmmGcmbhW6FJCBd23103Zeu9owDva07GcvNyc6dLRX7JuuNMJ8D1dRW5ZC5lm3/
         owc5w5fQc9RyacaZdwkb9XOcuF6ug9wuU2NKDh4fCmvXnLZeVBGY4bagOc6qIFlGx0NY
         ZTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+YdqzBWkhaUStPDhBekHs6kHeRJvPig2Z3/bxpJKTKI=;
        b=dfHoMtCmfZNTUzoNUb5YgEcdwMkjts3Yau8+5uUcxNOQcevrSs2hxxefeEyuifDVr5
         dbTPzZVFNZMirADid/GL6BZ1szMvlZKWFk9wpN7oZg8eOu38UzuYG2ashOJFO7eKB4AQ
         ZEXwPhOxBronP5TpLj92wMl83TdP1iq00wd/nckO2fJsAEbp6j//OIUoDwCt35ZmFXnF
         PdjjTklEESNDGmqz7XpDdCvCWMP0f4adwrgxso8K+Nu+qj/xCe1L+gDu2eSHSoJWATij
         9f/ajRVDywSX5c6j1yvjlQ2Y90b11ZeZ3z5ZDHbUX7n8++Y1fx3OrYd1acYX3SYt8Ugc
         11ZA==
X-Gm-Message-State: AOAM532ElvyyYctf2iBX/1veI7cNm7oJ/Hhjv5LjAjIu1qcXu4hmJ53J
	+BOYyMkdVm+ccHGLq9MG1BF79/L9HD8=
X-Google-Smtp-Source: ABdhPJxOnkBaSzo647GZ85oFzP1/O9aGn6FCdE373K1V1+B3TVfQfsL0f5MKevLDf8Hwl4kD9+vcXg==
X-Received: by 2002:a17:90a:940f:: with SMTP id r15mr346220pjo.219.1605712096505;
        Wed, 18 Nov 2020 07:08:16 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:15 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/17] libeigen: update SRC_URI to use gitlab git
Date: Wed, 18 Nov 2020 07:07:53 -0800
Message-Id: <d89968b63f16f49ff04f37dbfb55fb078f5f2541.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Diego Rondini <diego.rondini@kynetics.com>

Update SRC_URI to use gitlab git repository. As discussed here gitlab archive
stability is not fully guaranteed, so repository is preferred:
https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888/3

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a6b2a0c3d045bd09d4049ca8fb155f881657c31f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index 9c3d962f41f..6ce318d0b59 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
-SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
+SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
 
-S = "${WORKDIR}/eigen-${PV}"
+SRCREV = "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
+
+S = "${WORKDIR}/git"
 
 inherit cmake
 
-- 
2.17.1

