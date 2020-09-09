Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9260.1599640971967255749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=QPgV302B;
 spf=pass (domain: blade-group.com, ip: 209.85.221.44, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f44.google.com with SMTP id c18so1975932wrm.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MB5RXiS64RSGKJ/Jv4lIBAwdphlZkeuJpqxjBBxya1k=;
        b=QPgV302BC/OP9rpOUfW0rT0z8gbWTgz0SoOpXcb5yQo5QUyKG4998gMeKi02BQ3rGE
         bMEIBgdV2B2dS8zW8ClhwSEAQV9H8vQO3cNc68d4E2Foo/numa7+7k2iWJ7N+81LMI/f
         gEfvx5kdtS9OEG2kjCwrSjHLGwOIfFIbXUfdkfglKZZB2mv10/AZPBcyyYUX6uPlbJ7i
         nd7DEP0OL2JbZAbTWdDHmBCZOqm5g6cydsBVzpJ2aI06r1OjJ8gLDXpNznLCUygnH287
         tzT0SLWIHGFOV7Q/vAOr5MtkCK4l6h7FKvxT6OndtdtKsVGQav9i69QmUuCEHoO3B2uq
         6b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MB5RXiS64RSGKJ/Jv4lIBAwdphlZkeuJpqxjBBxya1k=;
        b=iBa1eOaJTA2Z3M5qKTyU10SHwlYuW20H5i6Fs+m6cm/uuQOSl7wlGNHxFH8pTdVuIz
         pDbMBykSH7adORJDiozAoxLpdA8qmc2/CBNokGOILnHxw4rM5Fx9TTzjOzYi1Jcc9k4W
         zk/8Zv2rgAGhsvHyIayMGMmLWPYhnejEKn7jSNMgyZpPJc8BAUXcIR75WfVy+neGOsYj
         GcQIx/l5NHhfhMaaI1tX1KZNoHN5k08xV6EI1AEo53Etkg4wsY4JPrxJy5LiLQ2R+KlR
         Fsb1oCJCJ2B+3scqHGUuST3dIks7Txg9XD73J+HY0ZVSKQmm9MKL8LGsDovoBM/ERnHH
         ZL2w==
X-Gm-Message-State: AOAM531aCZe3gUZSGbktHYLG+WvvV6tDSzt0CISzn2+i/orf5iRYpUq2
	NNOcmpNj+PrRsIO4MHosMjCk6aa9LDE5LGLF
X-Google-Smtp-Source: ABdhPJwohXh1TwzM4tdCGgf4VVN700SmSwBjN8P0JwCxi2zUrKegCyC1sZR2dTAaXpYiDeI1SKOi2w==
X-Received: by 2002:adf:82d5:: with SMTP id 79mr3128124wrc.60.1599640969996;
        Wed, 09 Sep 2020 01:42:49 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id o4sm3027825wrv.86.2020.09.09.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:42:49 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 1/4] libcec: workaround wrong choice of PYTHON_PKG_DIR when building on Debian
Date: Wed,  9 Sep 2020 10:41:50 +0200
Message-Id: <20200909084154.178795-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

As described in https://github.com/Pulse-Eight/libcec/issues/530 the
cmake code looks at the host to make decisions about the target, and
we can't even override this with a flag.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 ...buggy-test-confusing-host-and-target.patch | 31 +++++++++++++++++++
 .../recipes-extended/libcec/libcec_6.0.2.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch

diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch b/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
new file mode 100644
index 000000000..7c29e15e2
--- /dev/null
+++ b/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
@@ -0,0 +1,31 @@
+From 8ce50bf569ec2d931735180079bbe507730626c8 Mon Sep 17 00:00:00 2001
+From: Yann Dirson <yann@blade-group.com>
+Date: Mon, 7 Sep 2020 18:17:21 +0200
+Subject: [PATCH] Remove buggy test confusing host and target
+
+---
+ src/libcec/cmake/CheckPlatformSupport.cmake | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cmake/CheckPlatformSupport.cmake
+index 1d99bd8..31dac4f 100644
+--- a/src/libcec/cmake/CheckPlatformSupport.cmake
++++ b/src/libcec/cmake/CheckPlatformSupport.cmake
+@@ -266,14 +266,6 @@ else()
+                 DESTINATION python/cec)
+       endif()
+     else()
+-      if(EXISTS "/etc/os-release")
+-        file(READ "/etc/os-release" OS_RELEASE)
+-        string(REGEX MATCH "ID(_LIKE)?=debian" IS_DEBIAN ${OS_RELEASE})
+-        if (IS_DEBIAN)
+-          SET(PYTHON_PKG_DIR "dist-packages")
+-        endif()
+-      endif()
+-
+       if (NOT PYTHON_PKG_DIR)
+         SET(PYTHON_PKG_DIR "site-packages")
+       endif()
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index 894ee52f9..c4aeb8c55 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -13,6 +13,7 @@ SRCREV = "29d82c80bcc62be2878a9ac080de7eb286c4beb9"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release \
            file://0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch \
            file://0001-Enhance-reproducibility.patch \
+           file://0001-Remove-buggy-test-confusing-host-and-target.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

