Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DE0C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 16:47:54 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.39842.1691426871018308768
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 09:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sPrjsIkx;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bbc06f830aso31876395ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691426870; x=1692031670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfGkOvpTbrQiTPNMAKr56z4ClOw8iAPCs4Qj5L9x1Io=;
        b=sPrjsIkxtdigBvZPb1jHq+D7dOJ6Md/xXIsFolX0kDd6+WTbh5NXXhVxMWNuN4v2r+
         risvpRffctSG7u4JuowEekKKLQXca9BXahNjrKwc6p4E1sw8P5U8R7QAALDOQGb1WQkY
         vJU3xfFOq2uJJU0AQpCVwyKz+blZyMdGceQtGeuIsBBNE0skVxF8ED7v1P0fYfkxH902
         msQ5pBDRm27uofVQlmaZfq7ZLsBpEdmdvd0wUIbrdbmZLjUnde4Mbec1g1RpktaRtlqS
         KqCoAzFFr/S+qIABZvIc59njsPYQeYg+UDfx0ms1Cnnniv31cvRTA7JXneayMho+LEQZ
         ZkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691426870; x=1692031670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfGkOvpTbrQiTPNMAKr56z4ClOw8iAPCs4Qj5L9x1Io=;
        b=TPUGLKmAGysUkGoIy41e/gI1nwXK35U3X54WV5fkbq8t/0tJ4QyrkWJCM1+FqLKPKE
         pbGif4zBAhCFDKXEMRX+r5nxGFbgxo3pSUItub+7jnlTWIPYKebV4rNP3tLqxPryHcq2
         YlRsvdkLRPUcO648MIsHb4vJKrqz7GqE83KVH4h57Aq6G+ge61uMKQGSzOF1ZLUeq++K
         pUxOtp5e1YlSZEWhcj6Tr0oA1Yfo9iAYDKN19cJX5dUA2P2AZa0pupiwjQMGoBoknwYP
         yDd/3To63MiCnxaSRkGOSyLIY+7eXyxm6+AC0ueX8+C5pH9nx8/RWIKldiCD49qSV/W8
         yn2g==
X-Gm-Message-State: AOJu0YzpKtIK/CMgy49k+RhR/gXD1TKzM9lFmmT2TUC4SVbSyfrW+xCA
	ZZ7Ws7+xClIGqDEwUsGUh/Ku39RVVD4=
X-Google-Smtp-Source: AGHT+IHAxa2zmSCUPX2KFqRsXQfSx5wf9Q3aXkwfCQuNmi0f6gHdUte4BSzrN4gMEfMHzevZxZSpXw==
X-Received: by 2002:a17:903:1c3:b0:1bb:c896:1d91 with SMTP id e3-20020a17090301c300b001bbc8961d91mr9263822plh.31.1691426870041;
        Mon, 07 Aug 2023 09:47:50 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:5fea:ca9e:42e5:f67f])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001b83e5ec666sm7168748plh.6.2023.08.07.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 09:47:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046
Date: Mon,  7 Aug 2023 09:44:53 -0700
Message-Id: <20230807164452.381251-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 16:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104302

* Drop redundant do_install
* Use four spaces for indent in RDEPENDS
* RDEPENDS:
  - += not =
  - sort alphabetically
  - Add perl-module-perl-ostype
  - Add perl-module-extutils-cbuilder-base
  - Replace perl-module-ipc-open3 with -ipc-cmd
  - Add perl-module-metadata
  - Add perl-module-parse-cpan-meta
  - Add perl-module-extutils-install
  - Add perl-module-encode-encoding
* Enable ptest
* RDEPENDS for ptest:
  - Add perl-module-ipc-open2
  - Add perl-module-blib
  - Add packagegroup-core-standalone-sdk-target
  - Add gcc
  - Add binutils
  - Add perl-dev (for "EXTERN.h")
* INSANE_SKIP dev-deps for -ptest

0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam
      - Add src/ to include paths

License-Update: Updated Artistic-1.0 (Perl) text

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
Changes in v2:
  * use packagegroup-core-standalone-sdk-target intead of
    individual libgcc-dev etc. components to be musl friendly
  * ptest results are the same for qemux86-musl and qemux86-64

 .../include/ptest-packagelists-meta-perl.inc  |  1 +
 .../libmodule-build-tiny-perl_0.045.bb        | 53 ---------------
 .../libmodule-build-tiny-perl_0.046.bb        | 67 +++++++++++++++++++
 3 files changed, 68 insertions(+), 53 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 1a8c759b1..e27981de7 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -13,6 +13,7 @@ PTESTS_FAST_META_PERL = "\
     libextutils-config-perl \
     libhtml-tagset-perl \
     libmozilla-ca-perl \
+    libmodule-build-tiny-perl \
     libstrictures-perl \
     libterm-readkey-perl \
     libtest-nowarnings-perl \
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
deleted file mode 100644
index 17ee50d7c..000000000
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
-DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
-Makefile.PL file to drive distribution configuration, build, test and \
-installation. Traditionally, Build.PL uses Module::Build as the underlying \
-build system. This module provides a simple, lightweight, drop-in replacement. \
-Whereas Module::Build has over 6,700 lines of code; this module has less than \
-120, yet supports the features needed by most distributions."
-SECTION = "libs"
-
-HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
-
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
-
-DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
-
-S = "${WORKDIR}/Module-Build-Tiny-${PV}"
-
-inherit cpan_build
-
-do_install () {
-        cpan_build_do_install
-}
-
-RDEPENDS:${PN} = " libextutils-config-perl \
-                   libextutils-helpers-perl \
-                   libextutils-installpaths-perl \
-                   perl-module-xsloader \
-                   perl-module-file-spec \
-                   perl-module-io-handle \
-                   perl-module-tap-harness-env \
-                   perl-module-ipc-open3 \
-                   perl-module-file-path \
-                   perl-module-cpan \
-                   perl-module-extutils-cbuilder \
-                   perl-module-getopt-long \
-                   perl-module-extutils-makemaker \
-                   perl-module-exporter \
-                   perl-module-carp \
-                   perl-module-test-more \
-                   perl-module-text-parsewords \
-                   perl-module-load \
-                   perl-module-file-temp \
-                   perl-module-data-dumper \
-                   perl-module-extutils-parsexs \
-                   perl-module-pod-man \
-                   perl-module-json-pp \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
new file mode 100644
index 000000000..efbccdda8
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
@@ -0,0 +1,67 @@
+SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=147a7b891d1584d3d33e478b1f2327c5"
+
+DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
+SRC_URI[sha256sum] = "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dcc347eb6e359ee878289"
+
+S = "${WORKDIR}/Module-Build-Tiny-${PV}"
+
+inherit cpan_build ptest-perl
+
+RDEPENDS:${PN} += " \
+    libextutils-config-perl \
+    libextutils-helpers-perl \
+    libextutils-installpaths-perl \
+    perl-module-carp \
+    perl-module-cpan \
+    perl-module-data-dumper \
+    perl-module-encode-encoding \
+    perl-module-exporter \
+    perl-module-extutils-cbuilder \
+    perl-module-extutils-cbuilder-base \
+    perl-module-extutils-install \
+    perl-module-extutils-makemaker \
+    perl-module-extutils-parsexs \
+    perl-module-file-path \
+    perl-module-file-spec \
+    perl-module-file-temp \
+    perl-module-getopt-long \
+    perl-module-io-handle \
+    perl-module-ipc-cmd \
+    perl-module-json-pp \
+    perl-module-load \
+    perl-module-metadata \
+    perl-module-parse-cpan-meta \
+    perl-module-perl-ostype \
+    perl-module-pod-man \
+    perl-module-tap-harness-env \
+    perl-module-test-more \
+    perl-module-text-parsewords \
+    perl-module-xsloader \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    binutils \
+    gcc \
+    packagegroup-core-standalone-sdk-target \
+    perl-dev \
+    perl-module-blib \
+    perl-module-ipc-open2 \
+"
+
+INSANE_SKIP:${PN}-ptest += "dev-deps"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


