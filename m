Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FA7FA373D
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 01:44:57 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.4693.1667180691996106459
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 18:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SGVdiOoy;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so14604663pjc.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMAIFJ1bXzKVI4DcchIPtNNG9q4WR8Hxq8ubhUl0fnY=;
        b=SGVdiOoyEoeTOvC156YVTbE8HTA6zvjYS+ZGq9oMiMBRQ54ZcLUWrTkbhh/+Sp19fG
         aT8Of/iLI0xdlZi97v7Oj2mlRA2vC9J1z3FVjfNn5c4DzgReop2fTsSP0ZSQEMabdfgJ
         Z2nPXu5wSM4g5pEnnv2uwgkxDXoNrZVLm2XdtswA2X7E5Uj0CVJ+UeG8/VLDYn8+JtCD
         QewLvm2az4sLK5xfdNRumJNHqgmduurSuQJpjmXye9hH9nmll/CTEYqSyQTcUAhV1tgK
         tfF/vGlzv4bUDxW9f+BRqres1dH8G8gK9SByO01wZfQbKSnGDHL+5Q9ZcUUcDRCkp2j+
         2ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMAIFJ1bXzKVI4DcchIPtNNG9q4WR8Hxq8ubhUl0fnY=;
        b=od/oHerMN+7AF9D3XZ2483oOW/RtSHR8j2YwrI4/FVy9xfSjB0KWG5C+On6ne5ulBi
         tPaLi6GCSAPLYY7g27/hqD6lL+mQ+c4PCLZ9Z8uea74VkTKomRzHi+n/MmfyC2j//vah
         rsN8khQoMuhRjByzAY9hhmIq5P0t3rlwIwr2eHmaSy/6XIJR3F4zEgsP5sPwsjGlvIuL
         2ql528/T4D2ru5WjVkkmhul5YQmLH/jcKJvDuiLv707Lw/l/eBnjPn8qrNpLZYDe7Fsa
         /rqf2vDEfI8vPdf45xJ1iu4UsafMph8Xr/c2vNX3Dm7Y8ANPiTBrybC985k6MBxY2DA/
         IAkA==
X-Gm-Message-State: ACrzQf3F0tD67Zacl6gk7lYeDBKplhSk/ZJ/G/ZJtmMSpsnNo905gZb3
	9lIVrHqX3vjgZru8zGtolIFDwf9OAGqmUQ==
X-Google-Smtp-Source: AMsMyM6lNVgGEoqX75xTIRC6o1XV5mAoT7QEmpHiRg6x5WlxAJRjG4kuvqvm1XAl4LkkN6MedF60Rw==
X-Received: by 2002:a17:902:aa84:b0:185:480a:85b6 with SMTP id d4-20020a170902aa8400b00185480a85b6mr11936150plr.170.1667180690962;
        Sun, 30 Oct 2022 18:44:50 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f504:8040:1a2:6bab])
        by smtp.gmail.com with ESMTPSA id a19-20020aa79713000000b0056b3c863950sm3267428pfg.8.2022.10.30.18.44.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 18:44:50 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 3/3] libcompress-raw-*-perl: cleanup; fixes
Date: Sun, 30 Oct 2022 18:44:34 -0700
Message-Id: <1f3249a5a02471382ba32baaa52bf0d9c013aa5e.1667179899.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667179899.git.tim.orling@konsulko.com>
References: <cover.1667179899.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 01:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99359

* Add SUMMARY
* Fix HOMEPAGE
* Fix RDEPENDS
* Use README for LIC_FILES_CHKSUM

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../libcompress-raw-bzip2-perl_2.096.bb       | 11 ++++-------
 .../libcompress-raw-lzma-perl_2.096.bb        | 19 ++++++++++---------
 .../libcompress-raw-zlib-perl_2.096.bb        | 16 +++++++---------
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
index ef69987ea3..238c988850 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
@@ -1,16 +1,13 @@
+SUMMARY = "Low-Level Interface to bzip2 compression library"
 DESCRIPTION = ""Compress::Raw::Bzip2" provides an interface to the in-memory \
 compression/uncompression functions from the bzip2 compression library."
-
+HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-MAINTAINER=	"Poky <poky@yoctoproject.org>"
-HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Bzip2"
-
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=33084b7f607ba5d38a64b22f8e332f87"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-2.096.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4fdb7ea5071e4b774c52c37331386355"
 SRC_URI[sha256sum] = "a564e7634eca7740c5487d01effe1461e9e51b8909e69b3d8f5be98997958cbe"
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
index 04295cd3c6..0cd876be45 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
@@ -1,16 +1,13 @@
-DESCRIPTION = ""Compress::Raw::Lzma" provides an interface to the in-memory \
-compression/uncompression functions from the lzma compression library."
-
+SUMMARY = "Low-Level Interface to lzma compresion library."
+DESCRIPTION = "This module provides a Perl interface to allow reading and \
+wrting of lzma, lzip and xz files/buffers."
+HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-MAINTAINER=	"Poky <poky@yoctoproject.org>"
-HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Lzma"
-
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2d411393b876fe63f9f1d546363f1a47"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.096.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "b5079bb43712fcd1e74b80777fa376ed"
 SRC_URI[sha256sum] = "f3afb267b1303b0f125976e9e4a70c6a4a205e35e7c99b408911f5e5c6578217"
@@ -21,6 +18,10 @@ S = "${WORKDIR}/Compress-Raw-Lzma-${PV}"
 
 inherit cpan
 
+RDEPENDS:${PN} += "\
+    perl-module-universal \
+"
+
 export LIBLZMA_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
 export LIBLZMA_LIB="-I${STAGING_DIR_HOST}${libdir}"
 
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
index 81c370df2a..dcd5badab9 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
@@ -1,16 +1,14 @@
-DESCRIPTION = "The *Compress::Raw::Zlib* module provides a Perl interface to the *zlib* \
-compression library (see "AUTHOR" for details about where to get *zlib*)."
-
+SUMMARY = "Perl interface to the zlib compression library."
+DESCRIPTION = "The Compress::Raw::Zlib module provides a Perl interface \
+to the zlib compression library (see 'AUTHOR' for details about where to \
+get zlib)."
+HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-MAINTAINER=	"Poky <poky@yoctoproject.org>"
-HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Zlib"
-
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=603fa463887aed6bb3f6f2a999aca775"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Zlib-2.096.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4144ecdd901231553447998cf8035e4a"
 SRC_URI[sha256sum] = "cd4cba20c159a7748b8bc91278524a7da70573d9531fde62298609a5f1c65912"
-- 
2.34.1


