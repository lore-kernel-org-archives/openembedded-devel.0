Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.7895.1602823244772931867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 21:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IzN8y3qn;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id f19so740856pfj.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 21:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayaBIbqQCPc04yMF1khXn4BVOzhMh++FkAGZ7iR5WNk=;
        b=IzN8y3qnwrrY7qs6UK5p62RNNSk64rvXB+Eg025ETIxJA+ZOj5lptK+Ucw6sm5syQy
         65Ad/H862wZ16t+HlvecqA3YHu1ev5fSepxLHKh7EHpgW74XHSYPZJs+MSBCnFo7rnKH
         lQSPiWvxG72L5nd0uEMET4RJRZzgNw6Z0fafxYOdCbPV71BfAR/FuSJAf3t4ligdtFf3
         baTiyzBAkAnyJ03NnlXWQbILKUW436NENj7Vwz1wzeMCmVREyr602avfISBJotvPabLd
         9dUSfEZCc+zNMtnEkxYaIBaFA375jaRtZAOSTKaN8OdGl7k/IyyhDgwzOvaXK4LFH/AL
         TDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayaBIbqQCPc04yMF1khXn4BVOzhMh++FkAGZ7iR5WNk=;
        b=kAkF3qTDUYBoXoIGWXeN9xcFNEHmvC0+wYMZ+07zWbT5ADv21SIioKAUu9mzKcOSja
         m7jG6wrI0A1LRYnn9LOg/5AG6RwfDq8+p5T5aOLXpHvD1Rd2Fx49nUIxNGecks9oNDIE
         hhfbRSm0OVLdoq24zl6ZRczkmIUSt5Oy/dfY1lZ65qZZgwVUuVqXSn7GMik/zPlBokbQ
         x6djCHUo58j5myfGOhHvwXEG3+FvZcxxgp6/8290BaEyrzLAZj6BS0BrTnWkhuFvH9MF
         HIYrokeyiLqsWPBO3IDPXlUNaMasHTCWRO+2pT1IPZLR0vCB0b0RhIkALlU3ccPhaaPZ
         2SLg==
X-Gm-Message-State: AOAM530y4B7B/8SNNkR1x/YDZE8/lFRPHgWBOwjNvRC6n3XThKGwVyJE
	YxcMAV6oeNfkZ7qBvY8aI/7gsBxj8crIZw==
X-Google-Smtp-Source: ABdhPJxSoWkpsVxhhvef3x5rHVz2nLX0krN2/IB0bWac6f0dmecVADhCO1vt/TNVqhrQQmkRK3uXZg==
X-Received: by 2002:a05:6a00:170a:b029:152:6881:5e2d with SMTP id h10-20020a056a00170ab029015268815e2dmr1991309pfc.20.1602823244007;
        Thu, 15 Oct 2020 21:40:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id e5sm1025997pfl.216.2020.10.15.21.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 21:40:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 1/2] recipes: Use new license names in LIC_FILES_CHKSUM
Date: Thu, 15 Oct 2020 21:40:38 -0700
Message-Id: <20201016044039.832318-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb   | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb  | 2 +-
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb  | 4 ++--
 meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
index afd26fa1c4..6bf3ecc21d 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
 
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
index 3678ad7621..71ae1c669a 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
 
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index a1bb4a399e..e6dbcfe0a6 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -24,8 +24,8 @@ RDEPENDS_${PN} += "\
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
-    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+    file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d \
+    file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780 \
 "
 
 SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
index f2dda194dc..803fe601ee 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 HOMEPAGE=       "https://metacpan.org/release/Test-Warnings"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-- 
2.28.0

