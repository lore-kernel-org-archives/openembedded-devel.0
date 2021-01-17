Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.21191.1610905618010407254
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GN7WEv/W;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id n7so9504106pgg.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=B8+kU4DaCv1s+9FMJbQPcCX1f4pi6HvAYRNt3Pf1kbc=;
        b=GN7WEv/WzkWcdO6ec1B7iZfdZlRnVgrZgfJlYhVC9KqGXlX9TPkNBp39h3KLACGA45
         TWyb2pIT8adYMJN0qwg7kGCvIH5s4+HRi024j7muxRaFw1BPTQzFumevS/fk1UaNqvJZ
         2tSzL3hX/liHnmbKEfCnbd7h9b63P6K6Cv1hS30omu3672+gvO80ujeAzkLmVxVgO33I
         5JrjOwg7RV5RNOySjBjh9rwtFjhfvlJfnYGwj9Gu6jLKsHOS01kN1eQUmjcJNOMOxUGH
         e/Wv+wriu2r3yeu72Xqc91D3iou58HaDkktEEDwmyNHZmr17m7c8j4P/JZMKsDn7NlMq
         /GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=B8+kU4DaCv1s+9FMJbQPcCX1f4pi6HvAYRNt3Pf1kbc=;
        b=ncv5Dsz0iS3A5ERcy5/s31q070aTZw1YuePNyHz2z2kBrL8XKQvjMmaKsYWwF6qNMb
         xo8Bzd/iX4IBU8JA3AZmBXzdD+sI/Wtprs2i1H2zIvGrlw+rfLUhw4Kdd3vozIZ+5fkP
         gKGD5vlclh1Bix7aPjjjrN/+JjjZFMentcKEdL5i6gE6oBcPsE2AmHi4zdsh3d+zHzdb
         3Zi0Mdq01TvUW/w0lQeT5Cwo48zhqTG0GbbtZObqthQFny+i3WBIXrXfhFjIbrXw1x7v
         tSxqQU5IN9oOW7YTILAw8V1zyR50CNiLZzURRjGkuky8hVgiPCmUZDBr9oR0eC4V89SE
         cwNQ==
X-Gm-Message-State: AOAM533Wu9tv0gr4FOfIVicqIhTYskAAzrTSS/OJRetyIpZinpKbmBHQ
	DLQWdFlMJL/vJMfC1olWlOo8xpMlfIxaAA==
X-Google-Smtp-Source: ABdhPJwAYxKq1mkW83QzM/O9lT99RhXsAjk4QUwsttre8O1zi9I/EmD0+irNfHLdFOc608wD5U2fZw==
X-Received: by 2002:aa7:8881:0:b029:1b4:5b52:b00b with SMTP id z1-20020aa788810000b02901b45b52b00bmr11117258pfe.47.1610905617347;
        Sun, 17 Jan 2021 09:46:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:56 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 25/28] nodejs: 12.19.1 -> 12.20.1
Date: Sun, 17 Jan 2021 09:46:23 -0800
Message-Id: <65d71ece83897b36891c106bec1eb37ca5859658.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Sean Nyekjaer <sean@geanix.com>

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cde1019804c2f7b67bf89d178eec9f4efafea414)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit ac6bc96e7da6b3c9d5b9c9272b487a926fbb462e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.19.1.bb => nodejs_12.20.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.1.bb => nodejs_12.20.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
index 8021fedf44..0673a3202d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=30e27bd6830002d9415e4a5da7901f03"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c66ff8861d9f96076a7cb61e3d75f54"
 
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d"
+SRC_URI[sha256sum] = "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

