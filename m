Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.14191.1599292186840154520
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 00:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YUn6jLQb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id z4so9613323wrr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ThjoyU/ogtgRuJTQxroJePxaFhfBb50VTPoA9D+gU6A=;
        b=YUn6jLQb0XCkkbFPHoog5bG1lYx9m/6t+acl0N1CNRoDTtJggy2AclIWeDFu6WfGd7
         hk3Wzs/r/uWOWU3Jd/cxfjnCvsUSrLRNTxeMkHU4vWGqgxnk5P6Of+LwoOX07Sh/3BFN
         RMa883ti+NMUFHRyRh9zxFHErv1iQw3q7WylNTmWkkKwlSCmgxMyoGTQtRIJUiHEXuUZ
         2gI2oJ746+M/2PxfoarM3JcOZzK7E5vACJfIBV2ErDg8c49zIwlh9Ikrz8bQbtvkmZRx
         C+zY+bTmEHznXiDI86qH3IC2wr2cvh/qE3CvCrX776HUKBgFjYF1X4WHxQ6V2+4wS4Wd
         Ausw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ThjoyU/ogtgRuJTQxroJePxaFhfBb50VTPoA9D+gU6A=;
        b=J73CcxE3+YEKo0hP9EK5bK/r9CZl3/ptJYbJ3JxFKvJhE0xumnBJfGWvYHZ+5cmRmA
         PoUfo7msyL08pT8hytfWRfwGFscf4ydU2aAOOXTNFSJwX81aVyNnKiXizTwgvGsyBzpW
         FCn2N+VgYBS210jOMY1aV3Ad800I+xscFJzyOsm+GUG8WECKLCiB/dRpqecpzeKYL3OL
         +J55yTIXvh14XMmN+HbSXc1oonuBJiyCDW3wq7Lc0JLiLa2FFLWPHoaYMBy0wYDEhUEs
         BkXpgC9FKczo7XhM+GafVi/D7jCpLaq6uCxgr08I8SIgLuI5ogmG2R+aTGoWKVCSCG43
         tpFA==
X-Gm-Message-State: AOAM531X3RHod9zQngr8Uhj1k2vMKP63980gtfZOcVWc7qBjeZcgc6O9
	JGf8itvc9be1vkGqt+0BIsjFm/1epT8=
X-Google-Smtp-Source: ABdhPJwLaa7cusFQHPIJZVuqs8fhRpawJNmsZGasNkgxRgEEJB+dMrvBuKYKW97sZ3amEQlmPrsgwQ==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr6321064wrq.313.1599292184597;
        Sat, 05 Sep 2020 00:49:44 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.106.34])
        by smtp.gmail.com with ESMTPSA id 2sm16237660wrs.64.2020.09.05.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 00:49:43 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] brotli: update to 1.0.9
Date: Sat,  5 Sep 2020 09:49:18 +0200
Message-Id: <20200905074918.23065-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

cherry-pick upstream fix for pkg-config based detection failure

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../recipes-extended/brotli/brotli/838.patch  | 48 +++++++++++++++++++
 .../{brotli_1.0.7.bb => brotli_1.0.9.bb}      |  7 +--
 2 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
 rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb} (81%)

diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-oe/recipes-extended/brotli/brotli/838.patch
new file mode 100644
index 000000000..98b888760
--- /dev/null
+++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Backport [https://github.com/google/brotli/pull/838]
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

