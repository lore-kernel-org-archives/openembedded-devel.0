Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3189.1613626835143206610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 21:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vq9sjSFU;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 189so538270pfy.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 21:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjFyWoIEJhu25MF8d45P4HvvytONY2YsEPe6Cqi9RTE=;
        b=Vq9sjSFUTxN9ScLK7Wg48jc1Bmw7qSGVp/jzbsxhrK7y60fvCx5MF9qkDweVN+HDqU
         ASb+InWmrU0vgYtX9v6y82QrBENl7H6ho0w+qQclWHjebwa8a0bRMPOeR9q6MmXUg91Z
         juYPLHheoE/hL5w3X6yvhk/6deFosNK24EhOuNtIk5ypkynhqMBxczIFA86CtckJFK61
         ee2juWwZa8jbNhxzjrZXZ6U/y0qES6s3D5APzY+U0aCMwAP9MnbY/7wO6QZpisvrXYGu
         3OMurW2EtQwf3rmICFw0ecWAFI6GWbDS1nI4s/pVk6pIgyt58BPoTmEf48LCVYsA3694
         4MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjFyWoIEJhu25MF8d45P4HvvytONY2YsEPe6Cqi9RTE=;
        b=i8ilhweJDxMGj+N8U2heYeOa8heweNzt8a+nockFjveFougFHk/cgMr9aXdeVioOTs
         qmisyB3TSGHM1U/3NBrXcelbwtOFksenXgQENgQifAdKOdT3fvjMbd/CQLkMliMMTeNa
         Up7+StjYnaIYdDaEp85SytnGSIIcZyNWo9Q81RIXn9cF/0TZbaSD49aU22Yv0HhNB+2J
         AcPLdNEhO06ILlSnyVULsCwjexBlcVu9/4CLKpt9zNmxdD/AE5XPBns7Pi0Yx3WeASH7
         GWvd3zxIOw8RiHkkf4wT4vRFedGIOrK8nK2shSqz5cxXquwr9TYSfVCYzlKrVCd8veRw
         mbsw==
X-Gm-Message-State: AOAM5315IF/GupNCaR/PEVBt+JjQ2aY7ZpfFtrRTW/KlMvLj9PahpEAI
	3plAD1/cq6eG0YChpbtRge9MlX97Rj1ftg==
X-Google-Smtp-Source: ABdhPJxDShkM4mpfpanghFdbNr7C6uSD4oy7WszRLb/AR83P9LRJmMvopeNFwrlwOj64sSppr4V0Uw==
X-Received: by 2002:a62:fcd0:0:b029:1ec:e3ad:6028 with SMTP id e199-20020a62fcd00000b02901ece3ad6028mr2672637pfh.41.1613626834262;
        Wed, 17 Feb 2021 21:40:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id m5sm4404155pgj.11.2021.02.17.21.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 21:40:33 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] recipes: Update LICENSE fields to match new names
Date: Wed, 17 Feb 2021 21:40:31 -0800
Message-Id: <20210218054031.402871-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The licenses were renamed to match their SPDX names, fix the
references in LICENSE.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     | 2 +-
 meta-networking/recipes-support/arptables/arptables_git.bb      | 2 +-
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb                | 2 +-
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 .../recipes-extended/inputattach-config/inputattach-config.bb   | 2 +-
 .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb            | 2 +-
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb    | 2 +-
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 +-
 meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb   | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 1a982368ec..ee195c57ac 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "https://www.samba.org/"
 SECTION = "console/network"
 
-LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
+LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index c02a19944d..2dadd507a9 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
 PV = "0.0.5+git${SRCPV}"
diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index f42223b1f8..a94aa36b19 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "ncp is a utility for copying files in a LAN. It has absolutely no
 security or integrity checking, no throttling, no features, except \
 one: you don't have to type the coordinates of your peer."
 HOMEPAGE = "http://www.fefe.de/ncp"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index ae1463942a..a44710c8fe 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Different utilities from Android"
 SECTION = "console/utils"
-LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
+LICENSE = "Apache-2.0 & GPL-2.0-only & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
     file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
index 68beec670b..000d2da535 100644
--- a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
+++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
@@ -1,5 +1,5 @@
 SUMMARY = "inputattach configuration file"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
 SRC_URI = "file://inputattach.conf"
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index d6da51b0de..bc00caff0f 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Stub implementation of gnome-doc-utils"
 DESCRIPTION = "This recipe provides m4 macros from gnome-doc-utils project, so \
 that dependent recipes can build. Gnome-doc-utils itself is no longer packaged because \
 it requires libxml2 and python 2 at the same time, which can no longer be satisfied. "
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
                     file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 SRC_URI = "file://gnome-doc-utils.m4"
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 25e01fac0c..dc8bdacfe6 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -9,7 +9,7 @@ Shell developers."
 HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
index 3678ad7621..026c7a713f 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
@@ -4,7 +4,7 @@ All functions are optionally exported. All functions throw exceptions on \
 errors, write functions don't return any meaningful value."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
 
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index a1bb4a399e..c573a2f9bf 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -7,7 +7,7 @@ etc."
 
 HOMEPAGE = "https://metacpan.org/release/Unix-Statgrab"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+ | LGPL-2.1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later | LGPL-2.1-or-later"
 DEPENDS += "libcapture-tiny-perl-native"
 DEPENDS += "libconfig-autoconf-perl-native"
 DEPENDS += "libstatgrab"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
index f2dda194dc..324c14bfe5 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
@@ -10,7 +10,7 @@ be calculated *before* the warnings test is run, resulting in a TAP error. \
 demonstration.)"
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 HOMEPAGE=       "https://metacpan.org/release/Test-Warnings"
 
-- 
2.30.1

