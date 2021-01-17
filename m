Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.21354.1610905008006786383
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WayQUpIT;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id u11so3051923plg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FF/pT4TX4UDewsSeINDwRRzxwVZnbzzxu8NCOT/W1HA=;
        b=WayQUpITt81BNL4fmFr76QC0951hBzJEyT3ZYD3XqD0iMejo55m8VznglK6YhPPDt0
         m6SFxwsc7Og1rdFLZ+FzG6WuH9FuyZrvoO7gtjF0CoNGUvQm+nj2Yj1y8BKmEWiQy/tN
         /CgX6uE3XfX8q/QLHvF0eB+l6YSdO+IMBD+qgCZ+Klpte47KIzLtmxZ5nIa80hFjGZkS
         4hhskosQl5+foc2t8UgwA7exVLnxZ8/flvhNthPg8VbPpXZhMjRhE49MQPOy2hmxkYVw
         7mzh2BdAZP5TM1mefN1X+Eh5t9y9zwa1cKYJuKCnMXdPE9DoWdPJDAg7BNHiI/q/iuNQ
         +mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FF/pT4TX4UDewsSeINDwRRzxwVZnbzzxu8NCOT/W1HA=;
        b=JWPhH91WA4g5vKGbNw0yoHlNpnb+Diiwf2IlvMK+koZWNUZAQ7yTg0AojNXyyTD5ry
         sh32x6hVsi2JgU4sfubmQ95vxnhR3STE6wF6YYGYGazzqnriAd5fofZtCdakTB15cXOi
         K14BeOjcjZkn96NszW8Eik55zWameXiCUSTbGtPlxcQm8FGGMD3xRN2ffvwaAUUFo9Q3
         X0M1A/vCdHoCOe6/67kQazCViDzb64aX3SNPQSlrU2QDF7fB63tKgbywakPFcobaQMvU
         s42VseJMWCNHJdWinvkYa1riAL8nsCR0oA+BWUz4cR9v5LElyixeyDD6PWw4/F3DSCYH
         2LWQ==
X-Gm-Message-State: AOAM533KPl+50ZaP9dQIQomLmLz/AJ9Z2zHRK8ktHtyiviBV8NjVtcL/
	3uk8axuY/n6h7fZrVCuy3tkx5tj0JmAraA==
X-Google-Smtp-Source: ABdhPJyd8X+xl7gf1jFvaqRiHvDnBpHYe0dHSw9exbnRbhVQdXFHuFNjQFGZPuepaWew49q4UAXFKQ==
X-Received: by 2002:a17:90b:e15:: with SMTP id ge21mr21082326pjb.185.1610905007471;
        Sun, 17 Jan 2021 09:36:47 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:47 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 07/31] nodejs: 12.19.0 -> 12.19.1
Date: Sun, 17 Jan 2021 09:36:12 -0800
Message-Id: <387f40ce8068ec8848c2e3b76ce2e3267b98c3d6.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

Uprev nodejs in order to fix CVE-2020-8277.
This CVE allows an attacker to trigger a DNS request for a host
of their choice, which could trigger a Denial of Service in
nodejs versions < 12.19.1.

See https://nvd.nist.gov/vuln/detail/CVE-2020-8277 for details.

CVE: CVE-2020-8277
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a44015408253d8a4f64055f41fa1f497aeacfc30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.19.0.bb => nodejs_12.19.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.0.bb => nodejs_12.19.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
index 9d15586238..8021fedf44 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "3b671c45c493f96d7e018c15110cdbafa4478e5e5cfc9e6eec83cea9e6b551e1"
+SRC_URI[sha256sum] = "74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

