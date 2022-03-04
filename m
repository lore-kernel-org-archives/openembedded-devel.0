Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3362FC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.5085.1646383829057554960
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PXtyVttN;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id a5so7070774pfv.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckf+0UHmjEJvGezrHHOaICM2q9dmxx/MMQPuhP9hkyw=;
        b=PXtyVttNU3o0ECOPRMr2sP+P2c1HVMR0mC3jMOdCUEfSCsEZMSamq3QWQIriSgWsrd
         KxCWoRcmsoSOkofdrDUA/94NF1rNstMKGiAmoLa7hDWLKd8X5xemYnfXEUtUhu1QUP99
         pn6s098kIBuWj8QCTo+ufiwc6MPLj3wkAWT6qNgR2fNtMJCK/zeLuKMDuhyF1IpfT8iZ
         UUev38zgCiiCbONM4qbmx+44k3yHEWDUZL4LKcR9XclWhuGKQ3uv+KpSyLAdejtwoJuF
         5c3u+UfI+5E73bMM01/MlXnLwp3FYefOO8bImi04Z7+TFxTImqA4A3MQ6ClWu4WHyylw
         idRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckf+0UHmjEJvGezrHHOaICM2q9dmxx/MMQPuhP9hkyw=;
        b=U+Ap6JFnRwhOfG62Ciqv65o7aM3ZE+5Jmq086He/+CRn4w+wWBK/t3NXKal0mKzbJO
         ojuOEfIZa+RB6uy8OIOvCNIImjB1j3i1FF3/PcgszdWJ1K9V1mzjSA/hbGy4H2V+pgLx
         4sbO85Vezh0nG62msijNdfaVaDHMTEONlsfYUMI1EHI+XpDFjirXuLGj5uYUDHAGGSb1
         3lCYhbSnBw0kCRWztOJ56bZxIdUkdG8hMw57c10AlFI92HgseFnBNb+CxoClASyQyHbO
         STxC/2lxZww+aYkbjBK7koWJxGRoGnB4h+9HRYlz39WrGn5h2TmJaCmgkKjmlKdf+zwl
         BCdA==
X-Gm-Message-State: AOAM531ZH1Y3Sf45A0ERcQmoXzg4GfW8VFmAj6Vk201vR4MD8i4ldlA7
	T3486PiHLPmTtUUUgH9Ci86HJWVMGeEYVw==
X-Google-Smtp-Source: 
 ABdhPJwV1Mbz7snGu8aEYY337hlfvG27YzOd0PpNszZ/W8tMz95OpZX/WB/IjUElV2kr895UY+28uA==
X-Received: by 2002:a05:6a00:a8f:b0:4e1:2619:11a2 with SMTP id
 b15-20020a056a000a8f00b004e1261911a2mr42151950pfl.53.1646383827549;
        Fri, 04 Mar 2022 00:50:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 07/10] recipes: Update LICENSE variable to use SPDX
 license identifiers
Date: Fri,  4 Mar 2022 00:50:15 -0800
Message-Id: <20220304085018.1255075-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95774

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb          | 2 +-
 .../recipes-extended/mime-construct/mime-construct_1.11.bb      | 2 +-
 meta-perl/recipes-perl/adduser/adduser_3.118.bb                 | 2 +-
 .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb    | 2 +-
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb    | 2 +-
 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb  | 2 +-
 meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb               | 2 +-
 .../libclass/libclass-method-modifiers-perl_2.13.bb             | 2 +-
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
 .../recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb   | 2 +-
 .../recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb  | 2 +-
 .../recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb     | 2 +-
 meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb         | 2 +-
 meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb         | 2 +-
 .../libdevel/libdevel-globaldestruction-perl_0.14.bb            | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb    | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb    | 2 +-
 meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb  | 2 +-
 meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb         | 2 +-
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb               | 2 +-
 .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb   | 2 +-
 .../recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb  | 2 +-
 .../recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb  | 2 +-
 .../libextutils/libextutils-installpaths-perl_0.012.bb          | 2 +-
 .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb   | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb    | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb    | 2 +-
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb      | 2 +-
 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb      | 2 +-
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb        | 2 +-
 .../recipes-perl/libimport/libimport-into-perl_1.002004.bb      | 2 +-
 meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb   | 2 +-
 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb    | 2 +-
 meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb    | 2 +-
 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb     | 2 +-
 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb          | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 +-
 meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb        | 2 +-
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb        | 2 +-
 meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb | 2 +-
 meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb  | 2 +-
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb       | 2 +-
 .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb   | 2 +-
 .../recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb      | 2 +-
 .../recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb      | 2 +-
 meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb           | 2 +-
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 +-
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb        | 2 +-
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb        | 2 +-
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb        | 2 +-
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb    | 2 +-
 meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb    | 2 +-
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 +-
 .../recipes-perl/libstrictures/libstrictures-perl_2.000006.bb   | 2 +-
 .../libsub/libsub-exporter-progressive-perl_0.001013.bb         | 2 +-
 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb     | 2 +-
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb     | 2 +-
 meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb       | 2 +-
 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb     | 2 +-
 meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb  | 2 +-
 meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb        | 2 +-
 meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb   | 2 +-
 meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb   | 2 +-
 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb        | 2 +-
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb        | 2 +-
 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb    | 2 +-
 .../libunicode/libunicode-linebreak-perl_2019.001.bb            | 2 +-
 .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb   | 2 +-
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb      | 2 +-
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb    | 2 +-
 meta-perl/recipes-perl/po4a/po4a_0.49.bb                        | 2 +-
 71 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
index 38ef0f8dc8..b40d52ab94 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
@@ -8,7 +8,7 @@ Normal entries are entries which match one of the many included regular \
 expression files contain in the database."
 SECTION = "Applications/System"
 HOMEPAGE = "http://logcheck.org/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
index 2919904572..a5d28265d7 100644
--- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Constructs and (by default) mails MIME messages. \
                like programs."
 HOMEPAGE = "http://search.cpan.org/~rosch/mime-construct/mime-construct"
 SECTION = "mail"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=5e2e5da619ac8ef8c84767ccc4656e96"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mime-construct-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index 7554014fab..3ac2211aa6 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "adduser, addgroup - add a user or group to the system"
 HOMEPAGE = "https://salsa.debian.org/debian/adduser"
 SECTION = "base/utils"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef"
 
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${PV}/${BPN}_${PV}.tar.xz \
diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
index 4155fade97..d87df0974b 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
@@ -9,7 +9,7 @@ differences. \
 SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~nedkonz/Algorithm-Diff/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index 4212dd228c..8545eb50f7 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -5,7 +5,7 @@ protocols should be able to share."
 HOMEPAGE = "http://search.cpan.org/dist/Authen-SASL/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=17123315bbcda19f484c07227594a609"
 
 DEPENDS = "perl"
diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
index 358513121b..a51d327a31 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~dagolden/Capture-Tiny/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
 SRCNAME = "Capture-Tiny"
diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
index bca20f6a4a..4c9864094d 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
@@ -4,7 +4,7 @@ submissions, file uploads, reading and writing cookies, query string generation
 and manipulation, and processing and preparing HTTP headers."
 HOMEPAGE = "http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod"
 SECTION = "libs"
-LICENSE = "Artistic-2.0 | GPL-2.0"
+LICENSE = "Artistic-2.0 | GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
index dc62f58e9f..4cd6343878 100644
--- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://github.com/moose/Class-Method-Modifiers/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16fd0ec7b73c0e158426f753943f1058"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index ea9dfed261..5db0bb4269 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -9,7 +9,7 @@ Shell developers."
 HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index 6e1ea54611..3f004bb2ec 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Guess OpenSSL include path"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
index 5b6e9b4937..9bfb631d30 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.15.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Crypt::OpenSSL::Random - OpenSSL/LibreSSL pseudo-random number generator access"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=089c18d635ae273e1727ec385e64063b"
 
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
index 8dd2574e97..fd92c8a8db 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Crypt Openssl RSA cpan module"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
index a398382c66..8c56c206f7 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "lib-curses provides an interface between Perl programs and \
 the curses library."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=0b37356c5e9e28080a3422d82af8af09"
 
diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
index c328696b02..c7baeab6be 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
@@ -7,7 +7,7 @@ module, and nothing else. \
 HOMEPAGE = "https://metacpan.org/release/DBD-SQLite"
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1726e2117494ba3e13e1c3d93f795360"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
index 9f9950e35c..1dcecd0dcf 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/pod/Devel-GlobalDestruction/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
index 10b4d6e2ba..51a2ad3498 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Keyed-Hashing for Message Authentication"
 HOMEPAGE = "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=13;endline=17;md5=da980cdc026faa065e5d5004115334e6"
 
 RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index 91c5f08f9e..cd63675128 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
 HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
index 700974b423..ae193dbc6a 100644
--- a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
@@ -2,7 +2,7 @@ SUMMARY = "Encode::Locale - Determine the locale encoding"
 AUTHOR = "Gisle Aas <gisle@activestate.com>"
 HOMEPAGE = "https://metacpan.org/module/Encode::Locale"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=14e8006c2134045725fd81292a323d24"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Encode-Locale-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
index 2286ee5249..8d239e7e2e 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
@@ -11,7 +11,7 @@ of characters."
 AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
 HOMEPAGE = "https://metacpan.org/release/Encode"
 SECTION = "lib"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index dd8e1159ee..79fff9d520 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -5,7 +5,7 @@ variables to be treated as scalar or array variables."
 
 HOMEPAGE = "http://search.cpan.org/~flora/Env/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
index bc54634705..a58d96582e 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
index 5e869c8112..fd6347b3d0 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~smueller/ExtUtils-CppGuess/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
index 3538e11ac0..8534822e62 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=223c04045664f72c3a6556462612bddd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
index de3a745f88..07dab4e161 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-InstallPaths/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
index e6034904f5..43b5b60ef6 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://metapan.org/release/ExtUtils-ParseXS/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee0c05b86a474ae2b6"
 
 SRCNAME = "ExtUtils-ParseXS"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index 945b4c1c87..1012ae952e 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This module provides subroutines to read or write \
   reading the list of filenames in a directory. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
index c7e5c56b6e..3fa4fb17b4 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
@@ -4,7 +4,7 @@ All functions are optionally exported. All functions throw exceptions on \
 errors, write functions don't return any meaningful value."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
 
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index 38ea9cebc8..216d7c4136 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
 HOMEPAGE = "https://metacpan.org/release/HTML-Parser"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
 
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
index b506589f64..c871b97c39 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This module contains several data tables useful in various \
 kinds of HTML parsing operations."
 HOMEPAGE = "https://metacpan.org/release/HTML-Tagset"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=62;endline=66;md5=aa91eed6adfe182d2af676954f06a7c9"
 
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index e3c8663ea0..d2c151bf5c 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://www.cpan.org/authors/id/C/CJ/CJM/HTML-Tree-${PV}.readme"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
index a0be629683..e88d60d13a 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/pod/Import-Into/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
index 272f7c5f33..ef69987ea3 100644
--- a/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
@@ -2,7 +2,7 @@ DESCRIPTION = ""Compress::Raw::Bzip2" provides an interface to the in-memory \
 compression/uncompression functions from the bzip2 compression library."
 
 SECTION = "libs"
-LICENSE = "Artisticv1 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 MAINTAINER=	"Poky <poky@yoctoproject.org>"
 HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Bzip2"
diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
index 38655892a2..04295cd3c6 100644
--- a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
@@ -2,7 +2,7 @@ DESCRIPTION = ""Compress::Raw::Lzma" provides an interface to the in-memory \
 compression/uncompression functions from the lzma compression library."
 
 SECTION = "libs"
-LICENSE = "Artisticv1 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 MAINTAINER=	"Poky <poky@yoctoproject.org>"
 HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Lzma"
diff --git a/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
index 8b2ab14599..81c370df2a 100644
--- a/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The *Compress::Raw::Zlib* module provides a Perl interface to the
 compression library (see "AUTHOR" for details about where to get *zlib*)."
 
 SECTION = "libs"
-LICENSE = "Artisticv1 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 MAINTAINER=	"Poky <poky@yoctoproject.org>"
 HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Zlib"
diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
index a5c773551d..9655176a86 100644
--- a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This module provides a Perl interface that allows writing lzma co
 data to files or buffer."
 
 SECTION = "libs"
-LICENSE = "Artisticv1 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 MAINTAINER=	"Poky <poky@yoctoproject.org>"
 HOMEPAGE=	"https://metacpan.org/release/IO-Compress-Lzma"
diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
index 01580db03f..ccc78d0078 100644
--- a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This module is not intended for direct use in application code. I
 purpose is to be sub-classed by IO::Compress modules."
 
 SECTION = "libs"
-LICENSE = "Artisticv1 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 MAINTAINER=	"Poky <poky@yoctoproject.org>"
 HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
index 0be1497d9a..1d04f0054f 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
@@ -9,7 +9,7 @@ mod_perl."
 HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
 
 RDEPENDS:${PN} += "\
diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index 3f5a27843a..b745939234 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -5,7 +5,7 @@ filehandles; in particular, IO::Scalar, IO::ScalarArray, and IO::Lines."
 
 HOMEPAGE = "http://www.zeegee.com/products/IO-stringy/"
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
 
 
diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index b518164df9..389be2c16c 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -5,7 +5,7 @@ dealing with signals."
 HOMEPAGE = "http://search.cpan.org/~rosch/IPC-Signal-1.00/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
 
 S = "${WORKDIR}/IPC-Signal-${PV}"
diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
index fdc72a2b92..1e4b563532 100644
--- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~pvandry/Locale-gettext-${PV}/"
 
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
index 79b4681a63..20557a3f3e 100644
--- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
@@ -4,7 +4,7 @@ messages on Internet."
 HOMEPAGE = "http://search.cpan.org/~nezumi/MIME-Charset-${PV}/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/MIME-Charset-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
index 18fa46f017..2c06728ed2 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
@@ -8,7 +8,7 @@ one known mime type."
 HOMEPAGE = "http://search.cpan.org/~markov/MIME-Types-${PV}"
 SECTION = "libraries"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
index ebf2a5b4de..ff3f4d6944 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=57b8100f0b648cd37fbc3725fe3c111a"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 1d257ce4f0..6f3d5ba59d 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 AUTHOR = "Simon Wistow <simon@thegestalt.org>"
 HOMEPAGE = "https://github.com/simonwistow/Module-Pluggable"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda25db0b38fcc41086"
 
 SRCNAME = "Module-Pluggable"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index bb950b80de..205df68029 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -16,7 +16,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~zefram/Module-Runtime/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=36;endline=44;md5=9416434672a57853d6181f3da9094963"
 
 SRCNAME = "Module-Runtime"
diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
index 596d448253..5480b9069f 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://metapan.org/release/Moo/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=0e7ee44f5ce5e9b84619cd198caad1d6"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index c82190a336..293f421205 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -6,7 +6,7 @@ deleting or modifying entries."
 
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f6314d201d89e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 37586fd4f0..4c4faab4db 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -5,7 +5,7 @@ Domain Names according to IDNA (RFC 3490), in a way very much inspired by \
 Turbo Fredriksson's PHP-IDN. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
 DEPENDS += "libidn"
 # We must need glibc-gconvs to enable charset related functions,
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index effcb3dc75..5d0eccd84a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -7,7 +7,7 @@ so you can write servers or clients for more complicated applications."
 HOMEPAGE = "http://search.cpan.org/dist/Net-SSLeay/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=67d67095d83e339da538a082fad5f38e"
 
 DEPENDS = "openssl zlib openssl-native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index 9b259ab879..d7d4201048 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -11,7 +11,7 @@ shell."
 HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
 SECTION = "Development/Libraries"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index 1dbd923b07..ffd87ed0b5 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -5,7 +5,7 @@ on wait status values."
 HOMEPAGE = "http://search.cpan.org/~rosch/Proc-WaitStat/"
 SECTION = "libraries"
 
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=21;endline=23;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
 
 RDEPENDS:${PN} += "perl libipc-signal-perl"
diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
index df7b9b8081..c5efc15358 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index c2b6d4abf8..c568ade997 100644
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
diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
index 765455b490..80c21b2b14 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
@@ -25,7 +25,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/pod/strictures"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index fa66cd8f3b..d51ab21715 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/pod/Sub-Exporter-Progressive/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 98c322fabb..3a0de9757b 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -9,7 +9,7 @@ THIS IS NOT THE SORT OF THING YOU WANT TO DO EVERYDAY \
 SECTION = "libs"
 HOMEPAGE= "https://metacpan.org/release/Sub-Uplevel"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f1207cd3108e4ade18448d81e6bcb6c"
 
 CPAN_PACKAGE = "Sub-Uplevel"
diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index 3948f3c6f3..f4ce3131de 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -9,7 +9,7 @@ working."
 HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
 SECTION = "libraries"
 
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
index 75e1623f94..6252bc3351 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
@@ -22,7 +22,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://github.com/rjbs/Test-Deep/"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=a897a42bafc3422cab17c2eb94f87a7c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Deep-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
index 7d7f336c3d..b8547cb1fe 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
@@ -22,7 +22,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://testanything.org"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
index b20668331d..d74a347293 100644
--- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
@@ -14,7 +14,7 @@ The test is run by an \\"END\\" block in Test::NoWarnings. It will not be \
 run when any forked children exit."
 
 SECTION = "libs"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 
 HOMEPAGE= "https://metacpan.org/release/Test-NoWarnings"
 
diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
index 96939ec4d7..7f539933d7 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.36.bb
@@ -9,7 +9,7 @@ the time to go take a look. \
 SECTION = "libs"
 HOMEPAGE= "https://metacpan.org/release/Test-Warn"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=73;endline=78;md5=42b423d91c92ba59c215835a2ee9b57a"
 
 CPAN_PACKAGE = "Test-Warn"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb
index 8014c19a95..d1c0d95fd3 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb
@@ -10,7 +10,7 @@ be calculated *before* the warnings test is run, resulting in a TAP error. \
 demonstration.)"
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 HOMEPAGE=       "https://metacpan.org/release/Test-Warnings"
 
diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
index 9057ae7fa4..29118129ad 100644
--- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~kubota/Text-CharWidth-${PV}/"
 
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
index b6f7495eb2..afdf63ede4 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~ovid/Text-Diff/"
 
-LICENSE = "Artistic-1.0 | GPL-2.0+"
+LICENSE = "Artistic-1.0 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index a16bf8797e..1e8405cab9 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -8,7 +8,7 @@ Settings of fromcode and tocode and their permitted combinations are \
 implementation-dependent. Valid values are specified in the system \
 documentation."
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
 RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
index 5dc2ad32a5..017e951d3a 100644
--- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 
 HOMEPAGE = "http://search.cpan.org/~kubota/Text-WrapI18N-${PV}/"
 
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
index 4c01a4ca18..a7a998c358 100644
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/release/Unicode-LineBreak"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=5;endline=9;md5=b5e8b1099b86b86fbc315b50484231ab"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
index 62477458a0..7962d22c9d 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -7,7 +7,7 @@ to, and most don't.  This filter does the trivial but oft-repeated task \
 of putting all characters into a single event. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 HOMEPAGE = "http://search.cpan.org/dist/XML-Filter-BufferText/"
 DEPENDS += "libxml-sax-perl-native"
 RDEPENDS:${PN} += "libxml-sax-perl"
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index 58d0e4cb2b..c2898a9012 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -8,7 +8,7 @@ your programs."
 
 HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0|GPLv1+"
+LICENSE = "Artistic-1.0|GPL-1.0-or-later"
 DEPENDS += "libxml2 \
         libxml-sax-perl-native \
         zlib \
diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index ab684eaaaa..487a5c22cd 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -7,7 +7,7 @@ although it has been put to limited use in settings such as XML::LibXML and \
 the AxKit XML Application Server. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Writer/"
 DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
index d7a97dd90e..679ea0fb44 100644
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The po4a (PO for anything) project goal is to ease translations \
 (and more interestingly, the maintenance of translations) using gettext tools \
 on areas where they were not expected like documentation."
 HOMEPAGE = "https://po4a.alioth.debian.org"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
 
 SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https;branch=master"
-- 
2.35.1


