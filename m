Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.7161.1599257644773757469
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 15:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E/DMPp3N;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id v4so8052742wmj.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2020 15:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yX2XtFqnNDh93tsscjTEznkqwxh+jjnRZOCTbaC0TEQ=;
        b=E/DMPp3Nofc2l3p6WpizfXnBwG/RGjFAde5+WgnyEDGks9p7l1vMc7qwo4Sj9MdKlD
         47ejtg/3Hnw5+YrPHuQWaBFMUYgAC8xLP/6L5gpQqoNDSOGthqKZhrjr3Z24/A+EdtjF
         TuoVmTQnn0mFJumy4tK1hE64ExOajck5NPPme/itCIt7ZdO2ZNkDT/L3buQCyag6nyxw
         xad7PEQK/rTl3tAzVWpotzgtHwjdwmdedNzsZN8TTNbJ35iXFBEKH2vsbnh+oA6i0y4p
         2+6qztOulwRl1mE3+lmzUN54hSJQM2Zzr+O3P9CkidkW+Z4yJc27PuTRLIIDkP3AoiOL
         nEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yX2XtFqnNDh93tsscjTEznkqwxh+jjnRZOCTbaC0TEQ=;
        b=onebuQ4WtpXstgebaslICDJSVOgQAxN8i7qsj1mKidaWzJLhT9QTwNBT/QrYLqKRja
         QnGAnIx2ADLy+vOLXyIPpB6qrrjvpV2P64kyEYJhlpA8QcpGtcD+BM8KkzBF1emj7zfs
         L0TJAfGU+e/cB2k8MhaVrG5lp5TuhiGHRWXzxGkYtMRGfEUZgjq229VNZ2St/ITc3VrF
         4pSoCXwtGubSqIG2R5F1N7sdkKG8KTFE1totye91YLx3oNQM6NK3S/W9y3D87/nkn7Q6
         8/+Ae0M2lG+8LU8mTqkT5ZuXz+iyNl8yYwsfJ3ASOsALZTy1v5/3Svtm8Po7ULoUz1mP
         ArfQ==
X-Gm-Message-State: AOAM532F+8RCkZsLplSZeS9o3b/N+BzXoIPh4BU+FNekCN9kPM9UItcS
	adJwADGen0K4IIo6HVgnYM/F0JBQtyc=
X-Google-Smtp-Source: ABdhPJzEPCFc56PkLW/Wfpk4s8eGc9xQ84zYY/Yw2i8oubVB5PAGp5BZiyGDk5xyGzC7N4A8w0lPqQ==
X-Received: by 2002:a1c:9942:: with SMTP id b63mr8921927wme.12.1599257642495;
        Fri, 04 Sep 2020 15:14:02 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain (mob-2-43-204-78.net.vodafone.it. [2.43.204.78])
        by smtp.gmail.com with ESMTPSA id k8sm14091120wma.16.2020.09.04.15.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 15:14:01 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] brotli: update to 1.0.9
Date: Sat,  5 Sep 2020 00:13:58 +0200
Message-Id: <20200904221358.14528-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

cherry-pick upstream fix for pkg-config based detection failure

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../recipes-extended/brotli/brotli/838.patch  | 47 +++++++++++++++++++
 .../{brotli_1.0.7.bb => brotli_1.0.9.bb}      |  7 +--
 2 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
 rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb} (81%)

diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-oe/recipes-extended/brotli/brotli/838.patch
new file mode 100644
index 000000000..8ecf2e4c9
--- /dev/null
+++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
@@ -0,0 +1,47 @@
+From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
+Date: Wed, 2 Sep 2020 10:49:49 +0200
+Subject: [PATCH] Revert "Add runtime linker path to pkg-config files (#740)"
+
+This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.
+---
+ scripts/libbrotlicommon.pc.in | 2 +-
+ scripts/libbrotlidec.pc.in    | 2 +-
+ scripts/libbrotlienc.pc.in    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/libbrotlicommon.pc.in b/scripts/libbrotlicommon.pc.in
+index 10ca969e..2a8cf7a3 100644
+--- a/scripts/libbrotlicommon.pc.in
++++ b/scripts/libbrotlicommon.pc.in
+@@ -7,5 +7,5 @@ Name: libbrotlicommon
+ URL: https://github.com/google/brotli
+ Description: Brotli common dictionary library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -R${libdir} -lbrotlicommon
++Libs: -L${libdir} -lbrotlicommon
+ Cflags: -I${includedir}
+diff --git a/scripts/libbrotlidec.pc.in b/scripts/libbrotlidec.pc.in
+index e7c3124f..6f8ef2e4 100644
+--- a/scripts/libbrotlidec.pc.in
++++ b/scripts/libbrotlidec.pc.in
+@@ -7,6 +7,6 @@ Name: libbrotlidec
+ URL: https://github.com/google/brotli
+ Description: Brotli decoder library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -R${libdir} -lbrotlidec
++Libs: -L${libdir} -lbrotlidec
+ Requires.private: libbrotlicommon >= 1.0.2
+ Cflags: -I${includedir}
+diff --git a/scripts/libbrotlienc.pc.in b/scripts/libbrotlienc.pc.in
+index 4dd0811b..2098afe2 100644
+--- a/scripts/libbrotlienc.pc.in
++++ b/scripts/libbrotlienc.pc.in
+@@ -7,6 +7,6 @@ Name: libbrotlienc
+ URL: https://github.com/google/brotli
+ Description: Brotli encoder library
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -R${libdir} -lbrotlienc
++Libs: -L${libdir} -lbrotlienc
+ Requires.private: libbrotlicommon >= 1.0.2
+ Cflags: -I${includedir}
diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
similarity index 81%
rename from meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
index 32f855844..0038ba74d 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
@@ -6,9 +6,10 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git"
-# tag 1.0.7
-SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
+SRC_URI = "git://github.com/google/brotli.git \
+           file://838.patch "
+# tag 1.0.9
+SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.17.1

