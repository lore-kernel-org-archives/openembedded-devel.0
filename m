Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.11821.1594608989034563602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H4NKmUtL;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id f2so4874100plr.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6bowGLc+9kNPmkUCl9G8Qtjo6EfLx8G6v/tXNpqCAjk=;
        b=H4NKmUtL47UwJFn49Ejsp5Weu6MeSksa1naw292dhoAtyhwuWZ8MeJBqKbrO4yZc+m
         AXiUOErw0RQT8Bo3KmNJcq+ZViNcZQ5QaI8p/I7coswms1u9JE2xRKf8qdIR1e3SCDVn
         atM1hg8AIrrgcAV4tcjGEUXaC+7w7Ta90iqGHa4fATBXpYJQSz939nIeQ94+4JFhtjwn
         4+vNbpCoYjgthKc7ekQeIXLSGA2EQ+zkF3iC4WSWOB6pOaHWPFu6zokhC6e2nPTW0sHv
         6E1GwtBJVjG4DqE3B6TEs8rON5kBO+2Azj+RP2O3fwCKCTypvQ5wghm8nn6shkDS4Uac
         bDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6bowGLc+9kNPmkUCl9G8Qtjo6EfLx8G6v/tXNpqCAjk=;
        b=FVLnW72vmZknsj4RjiNpBf5QLoxw+xkEWKTwzAny6XQR01cJLmb6p6ue3s83a/0zqE
         ZkoLNu7qRJVHbQHWwCEEsa9A9tgffA0TG15m7sZSMYnkQ34GZJGZwib5Lf397wovbIVG
         pF0OgKwSCh/vV5aTrObQefml+qve4lRHVZfFX9Lsy07h2A7jBfXu2jd6vslV6QiFQbFZ
         ghYCrTXkAlhGHiDeCuNWldDSpd0Qupk0OBXJg8ImTAbzpKLNY/Yrw8gor0Qs3zlNslnW
         MUp0I0Glm2BQ1uEHS3hX7CVYshlEMJ8SYrsagolY2oUDb/xCdyPH9BKTQOwhrBLM8BDs
         ZaVg==
X-Gm-Message-State: AOAM5319rp50d2hTZVpC2/eVbu/3YrvrhkDJgjZHnYRZ98+29i/GixlR
	spC/3jYIsbBQVQAxuDeLNzGVl5ELui8=
X-Google-Smtp-Source: ABdhPJy5+ciqR78Y7Ku3QOH5R0U90J0rc4XBQ1rSXiTi0IE5cGdP/VmWkN2Lpmjnj1SRnLk9iOM/qQ==
X-Received: by 2002:a17:902:fe85:: with SMTP id x5mr61399642plm.282.1594608988458;
        Sun, 12 Jul 2020 19:56:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/18] minicoredumper: update SRC_URI to use github instead
Date: Sun, 12 Jul 2020 19:56:07 -0700
Message-Id: <b86aae02b8a6feccaa38552dea2f608016aae675.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

Change SRC_URI:

 - all minicoredumper related sources moved to https://github.com/diamon/minicoredumper

>>From the NEWS:

The Linux Foundation will be shutting down their git service for workgroups.
The minicoredumper repository and bug tracking has been moved to the DiaMon
Workgroup account on github.com. We thank the Linux Foundation for providing
us the git service over the last 5 years.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 110fa8902db7e8568f92b314716effc7558980f4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 051656b5a0..d381c83ae8 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -13,7 +13,7 @@ SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
 
 PR .= "+git${SRCPV}"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
+SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https \
            file://minicoredumper.service \
            file://minicoredumper.init \
            "
-- 
2.17.1

