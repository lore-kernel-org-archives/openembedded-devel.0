Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65887C00528
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 22:49:02 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1764.1691275734150174230
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 15:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nlZ9n2Nh;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-563e21a6011so2392456a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 15:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691275733; x=1691880533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2j3C9bdByMplpEHTdj6Dkcz3yuO2kQle6nSjdHNOILY=;
        b=nlZ9n2NhsXlyK7eB5f2ZtIayGX10q/diVaBgslgWUuCqghJF/OrfLWu3HfPybHEyW6
         JC+s9nAGBlMw3W9F0w4BWnozO/JMIm730D3KqjaBxKrOyeJkq8AGsFZjDVr4nS2BsLkB
         Op5TV0bBT1GPw364FoMWZRs5I1TvuBlY4uqg6+2RB97SejEYrRHpFfxrDy1VZCbI1MuJ
         V0vESckQa/3zO9Z6KDsFpQpp6di6RunVSCeNiWpDaYdAwkySoWyqnh3q/uPCB2/9yFTR
         pCLyaPGUG/o1ZlJyYRDe21v0OqDTrMExti2yLm3vPJw2oJs+ck4sarOf9nNaFO3021AM
         +KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691275733; x=1691880533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2j3C9bdByMplpEHTdj6Dkcz3yuO2kQle6nSjdHNOILY=;
        b=A0YbFDlXQqApBybB4+HI33RKpOK0Lk/2aPwXQMJVu/QE2ln/dhirAwgM5nncR2pkHv
         zrB0N+S6ux/EsW6WolO8V9xHVJ82mpUa0AiT/AQHRki4YjGv5EkK0ex8OaOdHXvc8Ye8
         YEsKGkWDNOR2JwUfVD6X9kG6dy3mCjHz8yw1ZaU0V04R8diH8Eag0PnyVeesG7h0beoG
         4N5FOr63Oa0+5XB01qXb/qDvIMSB4TSvW22qkM6v4Ef9yvuTHv4LEJfKIbRIvAlTj/ww
         zmzgc9q679crKY+bi20LRQ9ua1gJUwDamJXsETHPJ9prM5rsoId6CG07w0iLvrLF8LXd
         Zj/A==
X-Gm-Message-State: AOJu0YxHaZshtAjELAS6B+ycovClRiFgphqw1VjP/MSVzg05ghD/sUui
	wjNR2yEIdsKhAjky91DrABtusZGRqJU=
X-Google-Smtp-Source: AGHT+IEYOjn93Bl2Wd39sAiJYoB5IXJHhHTd1BiUSTiOQeyqqa8juEDV+q8D0e86Xckk7soSefVNIw==
X-Received: by 2002:a05:6a21:7898:b0:134:8d7f:f4d9 with SMTP id bf24-20020a056a21789800b001348d7ff4d9mr7773104pzc.52.1691275733117;
        Sat, 05 Aug 2023 15:48:53 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:5b5a:92f0:d982:bb45])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b006871dad3e74sm3577105pfn.65.2023.08.05.15.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 15:48:52 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [PATCH] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046
Date: Sat,  5 Aug 2023 15:46:43 -0700
Message-Id: <20230805224642.2268494-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 22:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104292

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
  - Add gcc
  - Add binutils (for 'as')
  - Add glibc-dev (for crti.o and friends)
  - Add libgcc
  - Add libgcc-dev (for crtbeginS.o)
  - Add perl-dev (for "EXTERN.h")
* INSANE_SKIP dev-deps for -ptest

0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam
      - Add src/ to include paths

License-Update: Updated Artistic-1.0 (Perl) text

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
Ptests throw one warning in perl-dev itself
(meta-perl-ptest-image-libmodule-build-tiny-perl on qemux86-64)

root@qemux86-64:~# time ptest-runner 2>&1 | tee ptest-runner.log
START: ptest-runner
2023-08-05T22:45
BEGIN: /usr/lib/libmodule-build-tiny-perl/ptest
Creating new 'Build' script for 'Foo-Bar' version '0.001'
ok 1 - Ran Build.PL
ok 2 - Build created
ok 3 - Build is executable
ok 4 - Build has shebang line with $^X
ok 5 - _build_params created
ok 6 - Could run Build
In file included from /usr/lib/perl5/5.36.1/x86_64-linux/CORE/perl.h:7247,
                 from lib/Foo/Bar.xs:3:
/usr/lib/perl5/5.36.1/x86_64-linux/CORE/sv_inline.h:519:1: warning: 'always_inline' function might not be inlinable [-Wattributes]
  519 | Perl_newSV_type_mortal(pTHX_ const svtype type)
      | ^~~~~~~~~~~~~~~~~~~~~~
ok 7 - Build output looks correctly
ok 8 - created blib
ok 9 - created blib/lib
ok 10 - created blib/script
ok 11 - Foo::Bar copied to blib
ok 12 - pm contents are correct
ok 13 - pm file in blib is readonly
ok 14 - bin/simple copied to blib
ok 15 - blib/script/simple contents are correct
ok 16 - blib/script/simple is executable
ok 17 - script in blib is readonly
ok 18 - blib/script/simple has shebang line with $^X
ok 19 - dist sharedir has been made
ok 20 - dist sharedir file has been made
ok 21 - moduole sharedir has been made
ok 22 - module sharedir file has been made
ok 23 - Can run XSub Foo::Bar::foo
ok 24 - Module gets manified properly
ok 25 - Could run Build install
ok 26 - Build install output looks correctly
ok 27 - Module is installed
ok 28 - Script is installed
1..28
PASS: t/simple
DURATION: 15
END: /usr/lib/libmodule-build-tiny-perl/ptest
2023-08-05T22:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0
real	0m 15.44s
user	0m 4.04s
sys	0m 1.53s

 .../include/ptest-packagelists-meta-perl.inc  |  1 +
 .../libmodule-build-tiny-perl_0.045.bb        | 53 --------------
 .../libmodule-build-tiny-perl_0.046.bb        | 69 +++++++++++++++++++
 3 files changed, 70 insertions(+), 53 deletions(-)
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
index 000000000..64bb4b4a3
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
@@ -0,0 +1,69 @@
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
+    glibc-dev \
+    libgcc \
+    libgcc-dev \
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


