Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C922AC001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 01:47:33 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.79249.1691545648979851128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Aug 2023 18:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nNwB3RTU;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-686e0213c0bso4596421b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Aug 2023 18:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691545648; x=1692150448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUo5vEmGY7dqcN8xr4eCVCCWiB+z/nZ02kVtSokU2xw=;
        b=nNwB3RTU3glab9owgfPBXksyMTxxY+B/eA8NZ/p2BB8piFgaByWV3gG+q2B/UkNfuL
         JgfHbVV2Y83vmoMjpr1g9H9hTpLjmer+hJp9UA13boDyojPrmyVdmW0gnIy9dt/TnjGI
         LBw04xOrPplpadQWHKstwzNrGfW5xJ0yjPjkjePt5PLDDWyUthajDl6KTq337vPFKmBs
         45Xf/j8OtZWw6hGP3Y7PDXWJvtcVS9+zgaCg7LXVrQx/F0Yjr+Mklr2txHaG4sPWhwc2
         R0x2oH8Wef6l+O3AX5e2hyaafAXhZ8B7lBTGQlyfHrQr1heZkpRdt8Zs4XQn7txf3el7
         7CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691545648; x=1692150448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUo5vEmGY7dqcN8xr4eCVCCWiB+z/nZ02kVtSokU2xw=;
        b=hpiNQXmZbcfRMUT5MZTOYvU3OW2xVK9aPOFFPfAVwUzoipzJQfZAurZfKTw0hVEjfi
         pCiLGGPVFhyHvkicqpx/rXSAhNAZpB5qPAzesB+Lj/p516MrvVupj65gqapQkCHMcZxj
         2MT0vfRxvb4SpooK9kNb4WQqma425YEpWjONxbSJyyhsw5AKLEumS26AbkI96mW6f5It
         4/sQrby0Gqh2a+5uUdIFFLjfFjrPqY28KqaXmIgbQPyOcETxK1LWjs66gsSFbsBl1zil
         CEWeRXZ4iMhQee8d1yoHacAe+AlXoV+ZTifpnOi6+H95xM5q+r6OnLBPrZhBdJoEVy5O
         wwgw==
X-Gm-Message-State: AOJu0YyTVCQ8kot0gFr3ESF0CREwMEFexdf1s3ezIPb3pkHxMpWWci3G
	/nC9YEgx+64iWEythXuNGZHh0bNWvcw=
X-Google-Smtp-Source: AGHT+IG334aXexh0bR52iYGemIPLNxo6v4GFV/dMJlFc2N4PV2bCwf4oj97LpG3GkZnJkagsFibkdQ==
X-Received: by 2002:a05:6a20:8f09:b0:132:cd2d:16fd with SMTP id b9-20020a056a208f0900b00132cd2d16fdmr1419098pzk.38.1691545647774;
        Tue, 08 Aug 2023 18:47:27 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:bb1e:dae0:d79d:26e5])
        by smtp.gmail.com with ESMTPSA id je19-20020a170903265300b001b9dab0397bsm9668926plb.29.2023.08.08.18.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:47:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046
Date: Tue,  8 Aug 2023 18:44:20 -0700
Message-Id: <20230809014419.3606952-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Aug 2023 01:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104309

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
  - Add packagegroup-core-buildessential
  - Add perl-dev (for "EXTERN.h")
* INSANE_SKIP dev-deps for -ptest

0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam
      - Add src/ to include paths

License-Update: Updated Artistic-1.0 (Perl) text

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
Changes in v3:
  - add packagegroup-core-buildessential instead of
    - gcc
    - buildutils
    - packagegroup-core-standalone-sdk

Results from ptest are the same as previous v2

 .../include/ptest-packagelists-meta-perl.inc  |  1 +
 .../libmodule-build-tiny-perl_0.045.bb        | 53 ---------------
 .../libmodule-build-tiny-perl_0.046.bb        | 65 +++++++++++++++++++
 3 files changed, 66 insertions(+), 53 deletions(-)
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
index 000000000..1e23d87a6
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
@@ -0,0 +1,65 @@
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
+    packagegroup-core-buildessential \
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


