Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D40FA3742
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 01:44:57 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.4692.1667180689482939212
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 18:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWJle27/;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v17so6483874plo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bTXGNUOOOYLCYuEDYs6tLfbO+A4ypWqokkScOVfnB8=;
        b=mWJle27/8MIB+l4O29jEnyW9E7IUJnweWKur5dlmEIs7/AEvUbsxCVnPm3F0V//VJx
         ufE24GrFZygf+POv3opeMUfVeYolTZJjJWT8OvuKw5yrFuLqUnxQ9MMTxEx+x2KtVzXo
         pJandjK2pI20Zod1/R79x3PT+6UwOWYLIzOM91llFzvjH33hGIHyUTkDnytBXhnBR0qo
         FxU96mYmKhFx9Z8XuaWcLOYVOXwBvRAebzN5QVVsQtBQl9YYpV3F39LT6eJHVsCPcdKY
         iw1vt9yU0HAABtK+SB3wYb57kIkc6B3IJ4PayHtK2yjJRoRFr6vPh/yKfmXmXsjZe/P7
         5NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bTXGNUOOOYLCYuEDYs6tLfbO+A4ypWqokkScOVfnB8=;
        b=do8nf1EHY+PLsuB2yIXhfWqnwwo4AhifEDmZM9KUOZCKdBwcvg2QnyriBQLpVAHzgl
         2cN1V0PTgQhLD+bTNrbjyFez+rQcLv/wyACsSJjPV0R5bGTzL1VYNsfBv4XYxQmNnpr4
         XFwhaVWrFSpWZ+eqatl2aU+xvm2QbE8qiCdflYlxvOt1zaP3qOPFtixPtN51HK1J1oLZ
         205DuvdCN5YDl7u/d6+sHGI9Pt+T+O13PZ5rz/irlVhoNZRFgxUhr1f+VSARbiabYPFg
         Yf265UAYfVZJffm19DiYa4Bmgh/Yo1/zah+8op0Qwn3OeNUjPWZXNPueyqXlv/R6Fe8Y
         qMxg==
X-Gm-Message-State: ACrzQf3op+9bxoyYYMjdkTB3/4NAINXogbuUU2X+F2udIZ4eVNdDQI5W
	YexaPZiJH0Kol9A1pHwV+GozvmO/rLDKyw==
X-Google-Smtp-Source: AMsMyM5K4Pc2n7wVv/nw0V1iQtRVAEH1yQ9X/M7+3fH3n80QhIyzwt02QG6ymkB4f8vVHpaFekPQBg==
X-Received: by 2002:a17:90a:c691:b0:212:fd5f:1ab8 with SMTP id n17-20020a17090ac69100b00212fd5f1ab8mr28942677pjt.11.1667180688369;
        Sun, 30 Oct 2022 18:44:48 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f504:8040:1a2:6bab])
        by smtp.gmail.com with ESMTPSA id a19-20020aa79713000000b0056b3c863950sm3267428pfg.8.2022.10.30.18.44.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 18:44:47 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/3] libio-compress*-perl: cleanup; fixes
Date: Sun, 30 Oct 2022 18:44:33 -0700
Message-Id: <014ee83294821670d4dbdf54e90955d23a4ae5b9.1667179899.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667179899.git.tim.orling@konsulko.com>
References: <cover.1667179899.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 01:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99358

* Fix hardcoded PV in SRC_URI
* Use README for LIC_FILES_CHKSUM
* Fix HOMEPAGE
* Add SUMMARY
* Use upstream README for DESCRIPTION
* Correct libcompression-*-perl RDEPENDS
* Fix RDEPENDS

Handy on-target check for dependencies:
for path in $(find /usr/lib/perl5/vendor_perl/5.36.0/IO -name *.pm | sed
-e 's~/usr/lib/perl5/vendor_perl/5.36.0/~~' -e 's~/~::~g' -e 's~.pm~~');
do perl -M${path} -e'print'; done

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../libio/libio-compress-lzma-perl_2.096.bb   | 23 +++++------
 .../libio/libio-compress-perl_2.096.bb        | 39 +++++++++++++------
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
index 15952f17e6..09ed161d2e 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
@@ -1,24 +1,25 @@
-DESCRIPTION = "This module provides a Perl interface that allows writing lzma compressed \
-data to files or buffer."
-
+SUMMARY = "Perl interface to allow reading and writing of lzma files/buffers."
+DESCRIPTION = "This module provides a Perl interface to allow reading and \
+writing of lzma files/buffers."
+HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-MAINTAINER=	"Poky <poky@yoctoproject.org>"
-HOMEPAGE=	"https://metacpan.org/release/IO-Compress-Lzma"
-
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2d411393b876fe63f9f1d546363f1a47"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "6c1b70740605b8073e4fbb5ba1e7bbdb"
 SRC_URI[sha256sum] = "2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8"
-RDEPENDS:${PN} += "compress-raw-lzma-perl"
-RDEPENDS:${PN} += "libio-compress-perl"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
 inherit cpan
 
+RDEPENDS:${PN} += "\
+    perl-module-autoloader \
+    libcompress-raw-lzma-perl \
+    libio-compress-perl \
+"
+
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
index c00d8945b7..ea120b8246 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
@@ -1,24 +1,41 @@
-DESCRIPTION = "This module is not intended for direct use in application code. Its sole \
-purpose is to be sub-classed by IO::Compress modules."
-
+SUMMARY = "Perl interface to allow reading and writing of compressed data."
+DESCRIPTION = "This distribution provides a Perl interface to allow reading \
+and writing of compressed data created with the zlib and bzip2. \
+\ 
+IO-Compress supports reading and writing of the following compressed data \
+formats \
+  * bzip2 \
+  * RFC 1950 \
+  * RFC 1951 \
+  * RFC 1952 (i.e. gzip) \
+  * zip \
+"
+HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-MAINTAINER=	"Poky <poky@yoctoproject.org>"
-HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
-
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=36e282c4a4078cf2650d656cdda23210"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
 SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
-RDEPENDS:${PN} += "compress-raw-bzip2-perl"
-RDEPENDS:${PN} += "compress-raw-zlib-perl"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
 inherit cpan
 
+RDEPENDS:${PN} += "\
+    perl-module-bytes \
+    perl-module-cwd \
+    perl-module-encode \
+    perl-module-file-glob \
+    perl-module-file-spec \
+    perl-module-posix \
+    perl-module-scalar-util \
+    perl-module-utf8 \
+    libcompress-raw-bzip2-perl \
+    libcompress-raw-zlib-perl \
+"
+
 BBCLASSEXTEND = "native"
-- 
2.34.1


