Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.1874.1613676760114306894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNWHIKe+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id k22so1806186pll.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 11:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=im+vyuFekrv3/0pGD/Mx4FN5EhGEGSV+pUduNyCJ41g=;
        b=bNWHIKe+cebA5dY+fxif4ue6ktdNbYQBDPdJtqV48vRQE5a4ymLjKqz1gLlri3RH8X
         FbCzzY1B0+xjXqOmmlADaaQsugRc2VyxHix9evcPz3p3z4uJQ2UOwPUidnvZ3iPj0rLk
         LkRMlGCIqQqAOXP6aFmIrBxp4NVPXeSWDsaL0Wn8d1hsMiddL7HodSPMr4ag+yAqScw1
         DgUD2TubgGwUo79EzFESPJQiDh64QSiwW0z32BadXNuPFGKfXHNcHkKQ/HkgFp8mlSIM
         hlBD+fZ8QQNN8R1Hk/9bBUF7kKfV84q4VQttWJeF9oOgTWXuqvCkFgTHciOrgX6r4RaP
         Xy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=im+vyuFekrv3/0pGD/Mx4FN5EhGEGSV+pUduNyCJ41g=;
        b=DblRWZULVEL/6BZfieJ3JnQgfK9KN2WFPV0mcMZOHarV3f5MOh1ubatRTX5N20uTQC
         UHOOjLP9LeQzBFM9qiRhs749spi8v/42dhg4de1Vj9mwqeC0/HgtsYCIUkf6YdgV0AEV
         qANouU1B54a+Lq0hhuef5v9NQeOkBjOgbxUJU8QpljuO155bmZLAGNXTqb2vjil1Gagh
         SoOgOBQGzCHztVwuZ2m2QTJnQN81juHACQjNH/SXmGqhLJ0F48kjRQQjfth+TLp7j0XW
         Q6ts0s2F9qLE6RA6KBC2FMT9qLWSBIdJPre8do/g6XejMi+bW05zEX36dqUYXZo6hi5N
         IyPQ==
X-Gm-Message-State: AOAM530NuOVfHbsJqhyNJW4dqr/bdtbO6gGjhvpXzEFryGg3bAHGI0nK
	5vq9EO98KKBGMeiycTdIWYS12T1FMjfGIg==
X-Google-Smtp-Source: ABdhPJySrrLoUqtKtfsRrLoj3YGWf1NL1dguf10SPZSb5DFdt2MUqzF9lS+FuxJIXTCA90pIU3U4tQ==
X-Received: by 2002:a17:90b:358f:: with SMTP id mm15mr5431464pjb.13.1613676759285;
        Thu, 18 Feb 2021 11:32:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id a19sm6713675pff.186.2021.02.18.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 11:32:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] recipes: Update common-licenses references to match new names
Date: Thu, 18 Feb 2021 11:32:35 -0800
Message-Id: <20210218193235.2329864-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210218193235.2329864-1-raj.khem@gmail.com>
References: <20210218193235.2329864-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The licenses were renamed to match their SPDX names, fix the
references in LIC_FILES_CHKSUM

Correct the checksums where they were wrong

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Update checksums where needed

 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb   | 4 ++--
 meta-networking/recipes-support/arptables/arptables_git.bb    | 2 +-
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb              | 2 +-
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb | 2 +-
 .../recipes-extended/inputattach-config/inputattach-config.bb | 2 +-
 .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb          | 4 ++--
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb   | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb  | 2 +-
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb  | 4 ++--
 meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 1a982368ec..166bf57279 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -3,8 +3,8 @@ SECTION = "console/network"
 
 LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0-or-later;md5=c51d3eef3be114124d11349ca0d7e117 \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0-or-later;md5=fed54355545ffd980b814dab4a3b312c"
 
 SAMBA_MIRROR = "http://samba.org/samba/ftp"
 MIRRORS += "\
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index c02a19944d..5afec7663a 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
 PV = "0.0.5+git${SRCPV}"
 
diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index f42223b1f8..a2f0ccc069 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -4,7 +4,7 @@ security or integrity checking, no throttling, no features, except \
 one: you don't have to type the coordinates of your peer."
 HOMEPAGE = "http://www.fefe.de/ncp"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
 SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index ae1463942a..d93a7f7239 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
-    file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
index 68beec670b..3933355abf 100644
--- a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
+++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
@@ -1,6 +1,6 @@
 SUMMARY = "inputattach configuration file"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 SRC_URI = "file://inputattach.conf"
 
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index d6da51b0de..f7fbedd6e0 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "This recipe provides m4 macros from gnome-doc-utils project, so \
 that dependent recipes can build. Gnome-doc-utils itself is no longer packaged because \
 it requires libxml2 and python 2 at the same time, which can no longer be satisfied. "
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"
 SRC_URI = "file://gnome-doc-utils.m4"
 
 PROVIDES = "gnome-doc-utils"
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 25e01fac0c..38598e2b49 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
 
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
index 3678ad7621..415652c1ed 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
 
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index a1bb4a399e..c0113b4fd9 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -24,8 +24,8 @@ RDEPENDS_${PN} += "\
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
-    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+    file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61 \
+    file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
 "
 
 SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
index f2dda194dc..7cd07b2c0b 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 HOMEPAGE=       "https://metacpan.org/release/Test-Warnings"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-- 
2.30.1

