Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB0EC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 18:51:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2979.1708714279168856787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 10:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=koPiUpUk;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d934c8f8f7so9821955ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 10:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1708714278; x=1709319078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnTCVAznJNwsXpQUJcKuRxsA9sjddcZEJQllyQkA7m8=;
        b=koPiUpUkjAVRN+c29hIaFsniH2pe9K4vtk93hkuzgykF0NdWS8GESzFTUcmqnKvEqH
         o0nDqDjIKPccxz9hd6C44TK2aQ38sV7RAs0Av+IrbczyaT9RuV7/XbDbxBA4aYQStHNp
         IMwXSjKaNUXxKl2RV3g/ZmBBZcoQkOjU1kMek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708714278; x=1709319078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnTCVAznJNwsXpQUJcKuRxsA9sjddcZEJQllyQkA7m8=;
        b=IuHkHDfC4JXfHAgkJSjTALsSf4Qj2zqEJH/nMF49cLT1+mnGEnRvMvkZWDHq64tFe3
         9VKiKpFcRFJjWuxz/ogsU6nOIVpGfStYuJ8cnjdla6lYTMEN07MgWu77J0M8PRSd+Dau
         uYNItHv3Wk+PAhzCxTk12zk4JfU4hNA0W50LP7wog3Do1wUirfC6uwNdTtYIKZFA/1AQ
         ZMVGJwksyVr7DuHAP1nVHbvuvteo04a/PnjN1b6P5unPOdm/VbX6Bgex4ZIkw11ynI8R
         OVFR1CzCKROsDmFvy6zOGdSILfiSi5SObDynT/ZSwnHcpg5OnlNt7NPSgw1ynpDYIUDc
         srQw==
X-Gm-Message-State: AOJu0YzVdER31dsIXRtTe74MDxN1oEQ95ARh4zxxWFva7/UwQbvhl+pA
	MidXMJ82k5e9ljk4gmktWiEV82uW4q+AjhqxdCXu3zzS9MWAAE4NMQRSPpnlLT3oC7d3Ae5X2aq
	GceE=
X-Google-Smtp-Source: AGHT+IEGZNrRFHFNxwHLIf/uoWkS1jNj27ZpqNsqlyh0QhHg2ZIkso+EJXcArbgqc74CUeWwlObP2w==
X-Received: by 2002:a17:903:120c:b0:1dc:1831:8ede with SMTP id l12-20020a170903120c00b001dc18318edemr665466plh.53.1708714277736;
        Fri, 23 Feb 2024 10:51:17 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id jc4-20020a17090325c400b001db3361bc1dsm12006703plb.102.2024.02.23.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 10:51:16 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 1/2] libencode-perl: drop recipe
Date: Fri, 23 Feb 2024 10:51:05 -0800
Message-Id: <20240223185106.2357468-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 18:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109016

Encode.pm is packaged in perl itself and users should
instead RDEPENDS on perl-module-encode

This was originally added a long time ago when I did not understand
the way the packages split was done.

See the other Encode::* sub-packages in:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/perl/files/perl-rdepends.txt#n313

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../include/ptest-packagelists-meta-perl.inc  |   1 -
 .../packagegroups/packagegroup-meta-perl.bb   |   3 -
 .../libencode/libencode-perl_3.20.bb          | 108 ------------------
 3 files changed, 112 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index bb6796f812..717fde29d3 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -36,7 +36,6 @@ PTESTS_PROBLEMS_META_PERL ="\
     libnet-dns-perl \
     libnet-dns-sec-perl \
     libnet-ldap-perl \
-    libencode-perl \
     libextutils-installpaths-perl \
     libfile-slurper-perl \
     libhtml-parser-perl \
diff --git a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
index 2672ab584a..c49b3b5a27 100644
--- a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
@@ -100,6 +100,3 @@ RDEPENDS:packagegroup-meta-perl-ptest-packages = "\
 "
 
 EXCLUDE_FROM_WORLD = "1"
-
-# perl-module-encode is preferred over libencode-perl
-# libencode-locale-perl depends on libencode-perl
diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb
deleted file mode 100644
index 6a083420a9..0000000000
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.20.bb
+++ /dev/null
@@ -1,108 +0,0 @@
-# NOTE:
-#    You should use perl-module-encode rather than this package
-#    unless you specifically need a version newer than what is
-#    provided by perl.
-
-SUMMARY = "Encode - character encodings"
-DESCRIPTION = "The \"Encode\" module provides the interfaces between \
-Perl's strings and the rest of the system.  Perl strings are sequences \
-of characters."
-
-HOMEPAGE = "https://metacpan.org/release/Encode"
-SECTION = "lib"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ced8fc06c54c05f227bfd9db38c1ed48a5a295db89f497d42b335afbf1f73517"
-
-UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
-
-S = "${WORKDIR}/Encode-${PV}"
-
-#EXTRA_CPANFLAGS:append = "PERL=../recipe-sysroot-native/usr/bin/perl-native/perl"
-inherit cpan ptest-perl
-do_install:prepend() {
-    # Requires "-T" (taint) option on command line
-    rm -rf ${B}/t/taint.t
-    # Circular dependency of perl-module-open on perl-module-encode
-    # and we cannot load perl-module-encode because we are providing
-    # an alternative
-    rm -rf ${B}/t/use-Encode-Alias.t
-}
-
-do_install:append() {
-    sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native||g" ${S}/*/*.exh ${S}/*.exh
-}
-
-do_install_ptest() {
-    mkdir ${D}${PTEST_PATH}/bin
-    cp -r ${B}/bin/piconv ${D}${PTEST_PATH}/bin
-    cp -r ${B}/blib ${D}${PTEST_PATH}
-    chown -R root:root ${D}${PTEST_PATH}
-}
-
-#  file /usr/bin/enc2xs from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
-#  file /usr/bin/encguess from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
-#  file /usr/bin/piconv from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
-RCONFLICTS:${PN} = "perl-misc perl-module-encode"
-
-RDEPENDS:${PN} += " \
-    perl-module-bytes \
-    perl-module-constant \
-    perl-module-parent \
-    perl-module-storable \
-    perl-module-xsloader \
-    "
-
-RPROVIDES:${PN} += " \
-    libencode-alias-perl \
-    libencode-byte-perl \
-    libencode-cjkconstants-perl \
-    libencode-cn-perl \
-    libencode-cn-hz-perl \
-    libencode-config-perl \
-    libencode-ebcdic-perl \
-    libencode-encoder-perl \
-    libencode-encoding-perl \
-    libencode-gsm0338-perl \
-    libencode-guess-perl \
-    libencode-jp-perl \
-    libencode-jp-h2z-perl \
-    libencode-jp-jis7-perl \
-    libencode-kr-perl \
-    libencode-kr-2022_kr-perl \
-    libencode-mime-header-perl \
-    libencode-mime-name-perl \
-    libencode-symbol-perl \
-    libencode-tw-perl \
-    libencode-unicode-perl \
-    libencode-unicode-utf7-perl \
-    libencoding-perl \
-    libencode-internal-perl \
-    libencode-mime-header-iso_2022_jp-perl \
-    libencode-utf8-perl \
-    libencode-utf_ebcdic-perl \
-    "
-
-RDEPENDS:${PN}-ptest += " \
-    perl-module-blib \
-    perl-module-charnames \
-    perl-module-file-compare \
-    perl-module-file-copy \
-    perl-module-filehandle \
-    perl-module-findbin \
-    perl-module-integer \
-    perl-module-io-select \
-    perl-module-ipc-open3 \
-    perl-module-mime-base64 \
-    perl-module-perlio \
-    perl-module-perlio-encoding \
-    perl-module-perlio-scalar \
-    perl-module-test-more \
-    perl-module-tie-scalar \
-    perl-module-unicore \
-    perl-module-utf8 \
-    "
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


