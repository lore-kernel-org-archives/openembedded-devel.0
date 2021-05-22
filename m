Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.4722.1621674541916752753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 02:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aSzqnktk;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id lz27so33919360ejb.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KC125xIHEmYXJZ3TcP9wo0NtAl6RGPJeeIGlXbxsNw4=;
        b=aSzqnktkhRivy1nlPC1hqvU0ix1LWvl/NCXhlDdhtdVzpwHFofwm8x/ezxvuIWRBVn
         Ou1cm3vFNXD711tgOyP/JbAbRjxmZEYXq/a9Z1HNwavWlX+feiLzOjl1FE72iJSBXh4s
         XAuoqafsc/ujOtqbQIphjYe2X0PqQnXIAPV0E/7BjENvVXd3pEvlZmNbAmMjZkJJjPPf
         Vb3KG9II6rJYjGSAcvo6LWv4zDroc2ERT+rQj90wJGBaE3gxCxj5asr/imZeJlBvNUup
         6fGkiR3/FBCfJ+LHihFSxJswDiSSuUzFqDIzbo6+U5H8qpGAfPnAHXmutlZq8MndtggA
         E10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KC125xIHEmYXJZ3TcP9wo0NtAl6RGPJeeIGlXbxsNw4=;
        b=bjIHNeTLiG8zj0WJtwgnA/JIs89sRJsRxmFCfNoFyeZ9ycrEJUFaM75+Gj1FNXehMM
         GWNUUOOsziTbYpmfvjZoIkqaR0c+cLsqiUfdmNDzGbnOFIED2MZl1aaN/sIwZMWrpwTd
         cxPPq8LEryJBzIMU3/65a+U9o9KEFyq6tq8vjiGttyrRiWRA/+OeTEzkfNYkcZxKH2Gq
         8E4793J6SyLKyL3ofP6j7Ywoim+JDf8IEsHqAos5We7uPWNyK7X9wZXgCKgJysUXYBP+
         z/9+iiQpltyRCbPX8y2LG+Qp22uU7a8L9oJvuA4tla8BSoid5p17k6H0EihXittPByPt
         /TrQ==
X-Gm-Message-State: AOAM5314x427c2cks01sKbQXdXTMwJ3H4WXWvzawySeKKlpMs4G4puPs
	ZffujiXBrIbR7e0UjmZDZr2+bA6zZiY=
X-Google-Smtp-Source: ABdhPJwifd6d7H0I9PxAApbPjGILMbs2GX/2R86jOytUH7tek9z+Lw7oAq/AVHVDImq0yGh//nQMxw==
X-Received: by 2002:a17:906:fa0d:: with SMTP id lo13mr14398976ejb.477.1621674540299;
        Sat, 22 May 2021 02:09:00 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b6614c38748203e05ff.dip0.t-ipconnect.de. [2003:f0:7f1a:3b66:14c3:8748:203e:5ff])
        by smtp.gmail.com with ESMTPSA id q16sm5939436edw.87.2021.05.22.02.08.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:08:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v2] libeigen: upgrade 3.3.7 -> 3.3.9
Date: Sat, 22 May 2021 11:08:51 +0200
Message-Id: <20210522090851.17582-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simplify packaging a bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V2: Fix typo in commit message
 .../libeigen/{libeigen_3.3.7.bb => libeigen_3.3.9.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.7.bb => libeigen_3.3.9.bb} (77%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
similarity index 77%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
index 6ce318d0b..d6ef98f94 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
 
-SRCREV = "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
+SRCREV = "0fd6b4f71dd85b2009ee4d1aeb296e2c11fc9d68"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
-FILES_${PN} = "${libdir}"
-FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+FILES_${PN}-dev += "${datadir}/eigen3/cmake"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.31.1

