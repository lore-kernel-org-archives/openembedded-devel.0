Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.3278.1613628092765444960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 22:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vKhDbiU7;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id z6so593861pfq.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 22:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DH5HKauPNyx/Z/IrySxdiCszBBkHa6VN5tMEpUncEo=;
        b=vKhDbiU7DHjk84ffSATlKJMej48nS6cSTu5a/yjaj6BQeE58lzcFpD1RyGKCu4aqiA
         RMY0Zw3VvpNieqcI4Df18umTugxVKT4y2C4+hjLZbcevwaj58akgG+4jEffA5xP5W8a2
         uC4LQI7FIHuvkbUwJPVebdegAZNoWvbgfGTjXVftv6uLnxDqDgDSin7NVE5qPXGRtLo+
         vcElQgD+P9twJGk1vjah8i/9AhSPzRl6rC4gSbcnau6Frlfzbl80w+JK5LkPjFz4LPnZ
         vF7CbGFjYJVywrOn8EE6Ieh2sS7HS2TfEqGG2MsVDb10wT9uhJ8LbqheAbDMG6Isc9YO
         23cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DH5HKauPNyx/Z/IrySxdiCszBBkHa6VN5tMEpUncEo=;
        b=CIySoIfx6EedxZ7B/eeK/U5SqlQ0JdgCTYWG/+ON6U5d3XIkXV/LPitXmCepGT+Lf8
         AEo4JSGtYB3RYNtzV0RwFykH2/d1BibLVljQsJYXbnM9FvpCvVEPdJh8CAowbgZg+iN8
         TDMGxmBJn7bxAts+71/0lX9OxeYRkvobGp5dUPCzKhH2Y78UuaMMmt0J2RVz8tfropox
         22SBnNigmoJpCVgQa9iN/MhqnbNAN913ljhXpTMkC1HplSHRsO3cWDL/RLO2WYu6tLUS
         yFxAjbUyUcEtX1egori/Y+UQgt0676wBXF4EQe1uFDX46pEPJSvNYc366B+ulhtw9bsx
         E9Dw==
X-Gm-Message-State: AOAM531LlJpAJrOBzTMxMEhMVF2AhogiuHQg96c6H1f268jgboG909LM
	c3HpMmvdYqKto8+fikcWfVxGsx9dLX9sCQ==
X-Google-Smtp-Source: ABdhPJzZfeZFXYGeHwQ3qiAwjX40nAeBRxvWmEdc3oNvW/GlRp49ORZK8y4VcCz++zVh2031oFeBHQ==
X-Received: by 2002:a63:724a:: with SMTP id c10mr2737630pgn.124.1613628091910;
        Wed, 17 Feb 2021 22:01:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id u17sm4861021pgh.72.2021.02.17.22.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 22:01:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] recipes: Update common-licenses references to match new names
Date: Wed, 17 Feb 2021 22:01:29 -0800
Message-Id: <20210218060129.429497-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The licenses were renamed to match their SPDX names, fix the
references in LIC_FILES_CHKSUM

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index 1a982368ec..ebe71ce5cb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -3,8 +3,8 @@ SECTION = "console/network"
 
 LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0-or-later;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0-or-later;md5=801f80980d171dd6425610833a22dbe6 "
 
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
index 25e01fac0c..fc185da453 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
 
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
index 3678ad7621..f989f8c873 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
 
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index a1bb4a399e..4b30d2098b 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -24,8 +24,8 @@ RDEPENDS_${PN} += "\
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
-    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+    file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=e9e36a9de734199567a4d769498f743d \
+    file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=1a6d268fd218675ffea8be556788b780 \
 "
 
 SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
index f2dda194dc..b946d3f744 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 HOMEPAGE=       "https://metacpan.org/release/Test-Warnings"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-- 
2.30.1

