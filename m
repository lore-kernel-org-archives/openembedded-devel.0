Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web12.1528.1586020399588839939
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id 22so10860206otf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U0Qhi1PvEh6ESAxEnIRoOsU1Uvi36DwXejSB15ZNW3g=;
        b=U0RsUwRICOKDseyLxWX9gQLTnbV7WANQI9TenylR7Bv8u7UfFcPnJi9+nPN28XvJpi
         ueT4CrbQU+sQszLWokSFZZ21kNEvQU4uEJUQp5sEU2gDxXwFweV37upcapmo/3DkMv5/
         psU842KYa344Hb8k1cUDOaCYk/nYSGbPUksptQlZ187gDDSTH7YOp5E77y86e5Q6uu/e
         Ird6WeEXbs0hqzfqIrW37qHlZ05jN6RBTiHt/zkqVRxGidk9Wg+TpEh/z13FG+pHDrso
         FCXVWi1WxRA8vFkQbG4Hi8gGezj177D1B4JoE3xcFKqdrNkrKGcsvBKoLh2sSYiOWVWz
         7oZw==
X-Gm-Message-State: AGi0PuaMWYlh3n6XOy22KyhMXLDTzfZb1uBnS0lT19msoV+tlYL+g28k
	+fYkJa+phDk1kdF3s0uG55VPiO9puo0=
X-Google-Smtp-Source: APiQypJGU9gwEFhCHA/FOumwQkTSSL71ihS+7/I0LW+RLkachavMpCkRtDU1M7PxO615MbWkptaOMQ==
X-Received: by 2002:a9d:6ad2:: with SMTP id m18mr11651075otq.28.1586020398383;
        Sat, 04 Apr 2020 10:13:18 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:17 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 12/27] python-spidev: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:36 -0400
Message-Id: <20200404171251.19823-12-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-spidev.inc  | 17 -----------------
 .../python/python3-spidev_3.2.bb               | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-spidev.inc

diff --git a/meta-python/recipes-devtools/python/python-spidev.inc b/meta-python/recipes-devtools/python/python-spidev.inc
deleted file mode 100644
index 1b93763d57..0000000000
--- a/meta-python/recipes-devtools/python/python-spidev.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Python bindings for Linux SPI access through spidev"
-DESCRIPTION = "This project contains a python module for interfacing with SPI\
-devices from user space via the spidev linux kernel driver.\
-This is a modified version of the code originally found\
-[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
-All code is GPLv2 licensed unless explicitly stated otherwise."
-HOMEPAGE = "http://github.com/doceme/py-spidev"
-SECTION = "devel/python"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60"
-SRCNAME = "spidev"
-
-SRC_URI[md5sum] = "f601676f1bb48b9aa3b3897f95216365"
-SRC_URI[sha256sum] = "09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456"
-
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
index 610611e438..65679594d3 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-spidev.inc
+SUMMARY = "Python bindings for Linux SPI access through spidev"
+DESCRIPTION = "This project contains a python module for interfacing with SPI\
+devices from user space via the spidev linux kernel driver.\
+This is a modified version of the code originally found\
+[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
+All code is GPLv2 licensed unless explicitly stated otherwise."
+HOMEPAGE = "http://github.com/doceme/py-spidev"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60"
+SRCNAME = "spidev"
+
+SRC_URI[md5sum] = "f601676f1bb48b9aa3b3897f95216365"
+SRC_URI[sha256sum] = "09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456"
+
+inherit pypi setuptools3
-- 
2.17.1

