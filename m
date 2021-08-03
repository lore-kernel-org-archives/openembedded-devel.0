Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.1907.1628012312755367701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 10:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6h+e4o9;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e5so24591753pld.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w75lUYqyO7YuZaLh0IdzyT7uEoGwTJ69NfNMzzfZBVA=;
        b=M6h+e4o9hzLp0IBJVMEXDp+60C9X+fOP68Iv05u61eSxmDcyS+uI9SWl6qfmbqv9Xp
         5xuSmQ6re/ZFZ/09EFcqBctUEiqxbv9/smM0gWJsTE0VXQ0WrdxHgbtxhIDPnhimfH69
         GcdBISHTHgX9ccnqiW4rbvioCFfoQx4jJZ0TdA56s5SaypzSZnQPHenbTPeIUZTMuCEl
         T+qjlt2SosYttOdLGK9xDnQv1uJvj/quVzFkpyCdGXQFKAyo1ifpTIo1zSSt1dBTHs9Q
         wTuakPYaHi+g3kk1CT4Rg2tXwN26Seyp72Pu0fW2ZeHkXgSL6QLwn7ZM4b6bpLTFledL
         nr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w75lUYqyO7YuZaLh0IdzyT7uEoGwTJ69NfNMzzfZBVA=;
        b=BqPxe3M787ueJjNqS08O1XOpvtWk0QZGjwSx4TezALbHGS8KiArI6ZYUH5XqMYOLbG
         GB4qs6AM6/sy2SRu6G5jAbKw8SGESS3trMEUPbFgcO411kNKNpIxezJY1LKQvFncxS5u
         gIsPe/vK/yPL44QcijEtpxS3wfiXM2cyCo1MV4ZhWjRfDIcjsZvX7gsRYD4pXtBC/n8a
         LMp0eIeVTGFpjYdKHM4XJ0unIKMlXBHJTDjlzApJ/nS7MCasO41crc+E/QZY2esUxIv2
         qEzSRx6gNO4Oa+zZz9d6de+LLQuB/0owZXfRLIvqoqdnmOonpOZM1xKRK6NvCSI+yX1X
         JKVQ==
X-Gm-Message-State: AOAM532OKuwZI5uIKjr35o9LlRzHwYvQGmB0T8TVYN1vRBNTyGZ83cPm
	75kVuD7McCM5r6GrbQQe7AAD8CP59LqJSQ==
X-Google-Smtp-Source: ABdhPJxaLP8Z1IKtqrJb5hSQGmtHwzwJH8M/Vh6NHrS77YGOHvP5RbfZWE0FrVTRsTn1hMvKnwPayg==
X-Received: by 2002:a05:6a00:14c8:b029:3b8:7d42:960e with SMTP id w8-20020a056a0014c8b02903b87d42960emr15400091pfu.64.1628012312118;
        Tue, 03 Aug 2021 10:38:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id a11sm16805297pgj.75.2021.08.03.10.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 10:38:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] apitrace: Exclude from builds with glibc 2.34+
Date: Tue,  3 Aug 2021 10:38:28 -0700
Message-Id: <20210803173829.2669409-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs some work see [1]

[1] https://github.com/apitrace/apitrace/issues/756

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb         | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 06bde46a3c..a95fe8b040 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -227,7 +227,6 @@ RDEPENDS_packagegroup-meta-oe-dbs-python2 ="\

 RDEPENDS_packagegroup-meta-oe-devtools ="\
     abseil-cpp \
-    apitrace \
     breakpad \
     bootchart \
     android-tools-conf \
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
index e42b891d46..a1e82970a3 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -30,3 +30,6 @@ EXTRA_OECMAKE += "\
 "

 SECURITY_CFLAGS_toolchain-clang = ""
+
+# see https://github.com/apitrace/apitrace/issues/756
+PNBLACKLIST[apitrace] ?= "Needs porting to glibc 2.34+"
--
2.32.0
