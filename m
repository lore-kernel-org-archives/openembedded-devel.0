Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.23478.1586111984232150744
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id d3so11182786oic.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ir0pS70AzhWmICuCfvTFb6bVg4TOtXn0IVSHOPdmgSA=;
        b=THQiVAYtXXr/xp3O/zSV5XTcA7x4SWV/z6k5WmObDBNnDnpM88loZM2yHsE4pkh+4i
         CPH0rQBX377ULfGkQLS9bWsu1RNy0NAz1BG80u9DSXLZLVGbwHLDdrl9Lu/EGKp6wDQS
         3nx+FMq3MLYhceuvDnjTS65msYtNKYCYcRiF+Ndoh+wixg/wrgjXiPD/jF2dYcpniztJ
         rO3dsDBmfYHtjnqtu8fh54w3c9AyOhhq4ong34RjYrf8DoiMC1vzdUoRAzu4vlE55v+8
         wyk0Wb3Y0+xf9KT+cw3nKKd9Avv4iSlCDV3uUF0P1m1oNU4bg68wWDGOO9xjS+A8c4UP
         uw7Q==
X-Gm-Message-State: AGi0PuYJvbdeZQYGT2axXsH9VoAfe05rNx/y0PmjOiWJR32lr0fhEnuj
	+zdTXMyfzGYHvk2GJdU7KrOZZ/BYrLA=
X-Google-Smtp-Source: APiQypK2av0efDc96F6ST22JV+9uIvNHoXJ4DhO8obCqtsWiXBQSgGBjIhYPDBMONC66pBssjlZHzw==
X-Received: by 2002:aca:4403:: with SMTP id r3mr9960839oia.84.1586111983171;
        Sun, 05 Apr 2020 11:39:43 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:42 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/15] python-pynetlinux: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:15 -0400
Message-Id: <20200405183929.28266-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pynetlinux.inc   | 11 -----------
 .../python/python3-pynetlinux_1.1.bb                | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pynetlinux.inc

diff --git a/meta-python/recipes-devtools/python/python-pynetlinux.inc b/meta-python/recipes-devtools/python/python-pynetlinux.inc
deleted file mode 100644
index c755c0ae93..0000000000
--- a/meta-python/recipes-devtools/python/python-pynetlinux.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Linux network configuration library for Python"
-DESCRIPTION = "This library contains Python bindings to ioctl calls"
-SECTION = "devel/python"
-HOMEPAGE = "http://github.com/rlisagor/pynetlinux"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=74e1861736ee959824fe7542323c12e9"
-
-inherit pypi
-
-SRC_URI[md5sum] = "3336e5d4a478acca4e35bf3125b4f883"
-SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
index f6d9e3c06e..c80a166177 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-pynetlinux.inc
+SUMMARY = "Linux network configuration library for Python"
+DESCRIPTION = "This library contains Python bindings to ioctl calls"
+SECTION = "devel/python"
+HOMEPAGE = "http://github.com/rlisagor/pynetlinux"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=74e1861736ee959824fe7542323c12e9"
+
+SRC_URI[md5sum] = "3336e5d4a478acca4e35bf3125b4f883"
+SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
+
+inherit pypi setuptools3
-- 
2.17.1

