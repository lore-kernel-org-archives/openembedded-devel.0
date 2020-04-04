Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.1596.1586020411473570195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id r19so10784591otn.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ln1cnL3q5cqA9o8iiBePj5puMFpClPVIjKmURNVfN0c=;
        b=c2cAqhNF2Hc3oEwSy2mpmwt2HsvhIzBi47/ZM9BME7Ph8Zc85DCzQ5qCVWOz0jn8RF
         NXPxlry1Cca0ruQMcp5zZbm2zFLJODmcH2NjShIHE0sxLF/9hxDRHSARaWzXAvw7IWtp
         MP56UKA9MSxDzmObQvgkmbRWBgMXKKL2VSidyhgmmHnAHZigDVzq7BYBK+j/nJ8X8Buu
         zxvdRstPIq4FDnbkpf0YwPUn+SfROVWKlQmMnZve++z/BgqF/zeswkzmY8Iea5xxT05I
         q2PzI0+JrbSUhS3ywr/3RpMIWx104gnNfDX1VpAztzdQ6GxJwdrT7vYd8Vcw0+HH2l63
         5YCA==
X-Gm-Message-State: AGi0PuZSp4LTOxL3jleV8nYRIX3Xq/qRHueSqCLjYNI2/hi6nKEdteHK
	PhFspzONtuHZtTuM/vTMmVk51I5Z8Nc=
X-Google-Smtp-Source: APiQypLNcC6gEhBaktEFSOvaNwLeUdzDjwHEyqrOf6jA2sqCcESOkcS9dcjp3flRU1EyJ56qUDpAuw==
X-Received: by 2002:a9d:600f:: with SMTP id h15mr6996379otj.275.1586020410313;
        Sat, 04 Apr 2020 10:13:30 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:29 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 26/27] python-sdnotify: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:50 -0400
Message-Id: <20200404171251.19823-26-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-sdnotify.inc                 | 16 ----------------
 .../python/python3-sdnotify_0.3.2.bb           | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-sdnotify.inc

diff --git a/meta-python/recipes-devtools/python/python-sdnotify.inc b/meta-python/recipes-devtools/python/python-sdnotify.inc
deleted file mode 100644
index ea0e575c47..0000000000
--- a/meta-python/recipes-devtools/python/python-sdnotify.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-HOMEPAGE = "https://github.com/bb4242/sdnotify"
-SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
-
-DESCRIPTION = "\
-  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
-  This protocol can be used to inform systemd about service start-up completion, \
-  watchdog events, and other service status changes. \
-  Thus, this package can be used to write system services in Python that play nicely with systemd. \
-  "
-
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
-
-SRC_URI[md5sum] = "749ddca1c70be1697fecc443fb1fdb16"
-SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1"
diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
index 377af12e16..221a8c8717 100644
--- a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
@@ -1,2 +1,18 @@
+HOMEPAGE = "https://github.com/bb4242/sdnotify"
+SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
+
+DESCRIPTION = "\
+  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
+  This protocol can be used to inform systemd about service start-up completion, \
+  watchdog events, and other service status changes. \
+  Thus, this package can be used to write system services in Python that play nicely with systemd. \
+  "
+
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
+
+SRC_URI[md5sum] = "749ddca1c70be1697fecc443fb1fdb16"
+SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1"
+
 inherit setuptools3 pypi
-require python-sdnotify.inc
-- 
2.17.1

