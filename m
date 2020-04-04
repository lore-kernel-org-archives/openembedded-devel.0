Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.1574.1586020390460421249
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id t28so10794505ott.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Fci8Ry+m9Y6tKuT9ouBJucUV2VRz9Ipz7YQlbHVcKwk=;
        b=qo2oD9uPclAfmEEMnX5xCclgIBMWa6czNpGzNhkwtTb2Pr20pJ+2vMEITRyzSYnWWb
         PxdtDYv5b2HXkWwjtnbJgh/hknxFIJMvXtt57/lawmjLYs9XBwTo5d81BQX8tHE6Egtl
         ynC5bgPSXKekeTQAKCbAlCIGidyggbeO7sjRZJVu66gB84PHKJTOMkLprbE7pJIr/riI
         RpDA5Xz4hFiWzmKgXYYlxuZB2AOZYeI9tgSnGxA7BVhunEPj6iM1N1gnltX2Q1V2Y6qX
         tvw6NRmgN34N+TmcPP0aWvS4ngYyha5bPiUvcvwNxACO4ZjU2DqmlIKEUPBq5RVtwxRP
         I/9Q==
X-Gm-Message-State: AGi0PubJpKGlRkM92nTXPdtwdrV2k6HxxCZbHX5HT+YAJtM39+Bali4H
	c3SRQTBToy4KuS6TTSqgabt+Ltyl93M=
X-Google-Smtp-Source: APiQypLVyYJ+WkyMCHmqK3LfCAKy5yngK8tWUajT1afK2/WaDcQTBCKWD9UFchKsxiVOsC9/JBRoFA==
X-Received: by 2002:a05:6830:1408:: with SMTP id v8mr10720224otp.123.1586020389226;
        Sat, 04 Apr 2020 10:13:09 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:08 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/27] python-twine: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:25 -0400
Message-Id: <20200404171251.19823-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-twine.inc        | 11 -----------
 .../recipes-devtools/python/python3-twine_1.13.0.bb | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-twine.inc

diff --git a/meta-python/recipes-devtools/python/python-twine.inc b/meta-python/recipes-devtools/python/python-twine.inc
deleted file mode 100644
index 2bc778da24..0000000000
--- a/meta-python/recipes-devtools/python/python-twine.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
-HOMEPAGE = "https://github.com/benjaminp/six"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2"
-
-SRC_URI[md5sum] = "6fb4da0c7d81ddfd48f619b8caa1493c"
-SRC_URI[sha256sum] = "d6c29c933ecfc74e9b1d9fa13aa1f87c5d5770e119f5a4ce032092f0ff5b14dc"
-
-inherit pypi
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
index 0456ec92d3..f5cc70f982 100644
--- a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-twine.inc
+DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
+HOMEPAGE = "https://github.com/benjaminp/six"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2"
+
+SRC_URI[md5sum] = "6fb4da0c7d81ddfd48f619b8caa1493c"
+SRC_URI[sha256sum] = "d6c29c933ecfc74e9b1d9fa13aa1f87c5d5770e119f5a4ce032092f0ff5b14dc"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

