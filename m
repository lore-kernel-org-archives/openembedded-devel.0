Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.950.1632338546498722614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nCkXn3OF;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q68so3761974pga.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=St2pMmSJjqf86jfGexiCzI40cef3ZJIeKFz0NBfyLDk=;
        b=nCkXn3OFxTKvDgnkBQr9ZUW/HB0rW3AfBBQOeFO+c5mCiERoD9BeXejxfmhyZAfnn2
         0RVn1RLJh48M3rrGXClJmCFe0IWrJF22dsDYv/w1MtO0PfbjY7dauONMzmrELo7xk74u
         cNodqJAZuV97au5t7DuseJwkn+FprN7KlUYeBsmk3PcFs8r8ulcmVH9HOO6h3jB0ZsQI
         PO+jKiY0KarK7gTjtYCG3vI6oWNsCploRO27Cl2t5sytS1zgnLQ5RqM0GLjQ2+nb3vYx
         rDPa0AP8AnjFxSuWao8IQRkcX1/WJR8CNfHGHKguXCke+DmzjBTaQ4bOGfBh6ggylwQC
         Th2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=St2pMmSJjqf86jfGexiCzI40cef3ZJIeKFz0NBfyLDk=;
        b=SnnB6/ibAhLKwMbj1fgvDv4U+H3jL+PGGs3SIL/bC68I5UgsrZQzsaSXSRr9LEfuXM
         9V8Drf0SZljZ2oD2GX2UjIt8c1VrLpuTgYreI5y7oen3xZsg+LFSe5V1A8mmBRsxuG2l
         BJsjcobFHtM3uVmej+HnV4y+ZW+bfckjIWEBbn+bs0KzOlWVwQDI/dm1Y7tsJ5T4Ho/Z
         44l7Dkgn5dVEM38/V/dSu2kuDFknlR6UrKxP7NJZ5qHwrNYH0P9OVt0L99W+E/+lDmbq
         FDebmZGmh9yv9pmOWJYbI3S82ugO0hR6wJvfOUtm0fIndMRbqNT5F0xN1hhYUb+NSQL5
         hscA==
X-Gm-Message-State: AOAM531qiRqbecL1hI45DC9LfZpbmXJdLfTzHbsgd5bHjh1GGkTrZyH0
	0l+UpBmVChD0aht3wXn84YmwoQEC8OD4BA==
X-Google-Smtp-Source: ABdhPJxnQrZ1b7t2F6XG2t3itGqT0lxwdwnkkpadlEEPFJSKBfJskL5SMph/DnmcdIVt9Pg8//CHcw==
X-Received: by 2002:a05:6a00:2284:b0:43d:fc72:e565 with SMTP id f4-20020a056a00228400b0043dfc72e565mr389700pfe.84.1632338545820;
        Wed, 22 Sep 2021 12:22:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/39] libubox: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:46 -0700
Message-Id: <20210922192213.3062719-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libubox/1.0.1+gitAUTOINC+07413cce72-r0/git/blobmsg_json.c:23:11: fatal error: 'json/json.h' file not found
        #include <json/json.h>
                 ^~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/libubox/libubox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index 7dbefa1152..76d1c8bf3a 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -24,7 +24,7 @@ PV = "1.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
 
 DEPENDS = "json-c"
 
-- 
2.33.0

