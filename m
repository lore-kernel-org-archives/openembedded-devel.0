Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9033CCCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 06:50:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1158.1761375043882874018
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 23:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZcfevjBM;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475de184058so421535e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761375042; x=1761979842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvioGqJHe48RZBfUAoBGz2jaw46LlgNwdDDukRe0Gh4=;
        b=ZcfevjBMSt8CBLpuHeuIGmNnnpJ1kOMYSkv4sNyVGG5cLxcdeKlsQz0IoBfJWcl9gJ
         9MVh6j8KVTxe2P0OFWr1iRrMl6RfyQ97jGYW4D50l8Yyf9ETFa7ua+8Ta01YB1Q6Qv5W
         P8DsrhdQzdvNMMk+Dd7RXnax8dSZHKuHkVMo/yKXQotILFj/GNiONYb3hMz3i50X2SPr
         AK1Tl5BICGiaeIjVTmiBOOYBGxo5U6l5Yxk+OsgnVkdiLiDD21ue9nl+Db+1ZIvz/Ifl
         VH5BePxLK5S/7pKg6z9fL28sx24TfJJD3U+cEXUbtVoBJE/+l/ajYZ0FYiKvq34+ywRG
         +f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761375042; x=1761979842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvioGqJHe48RZBfUAoBGz2jaw46LlgNwdDDukRe0Gh4=;
        b=oHYXXhHTkjf29sYYlMd/lddb03z9iBdS9C+oULcJ1GPuNyT7SwhcCe1utPRa9Nh7vt
         Sl0ChHWGWmoV1Q7lPswQtD4dnlrjdMxm03IaYIfQFKIN9oViJ0qaS30kdVdZtztYUUZ+
         ypdLdzEL0Z8gIL8RRiJCtbMEtRvJJfwnuG66pVMbUiXRZrE9Z5mYbF0pItVyxcKP1Rja
         lV8osIMuhVCMaCxtHXy+KIql6cIVuefFekSECe3ilMbqFi/8vpKouqmkPB++Js7jvfpX
         qrCYjmwEaH1opb/KZ/CZtD4jz6vgZ3STh4tkZHhkFwJEBg5+TYMJ7sTos+Fre8mwdmey
         lZ9g==
X-Gm-Message-State: AOJu0Yz4Xo0dA463V2CYahAowX3qUSKCvVKMAUb/dyAK7j/sUo62/tLD
	/v62unaUhpgt3ztU54dAPhOrRNUAmFlR2/rRoU7LnP7UzBqnCP+bIIUsyGHTmA==
X-Gm-Gg: ASbGncvRgsLguQjscVPD5GuiXjm5hoooyevjE4gG1yqK7er90NI6kZq2Sq5v+2HcbPY
	tIs6DSeTYAMKjIkkDTPU0UIHRK03iXhd7+1bLkmDTLVGuDa5xRPvHO1p3xd0XnmeF9zYeEAVkLR
	2qnEAhvfjTguCyPZuXmubcQyeTLij4ZbW9NoWW9E+LJCa/mu7bPG9ERliWgSEUI3TNdwCjOhHic
	jidf0aEhCr40gqUX5sXCeiks8pHDRKaNVKyUKNA/ePoV0R78fuy0qUR83wKfOYd6ER4hUZfl4Ko
	zs7X84qUAGZV2oXNQwAmr3AM3gJumtqYftk7kXFh4ZQkwjeGSFj7i+NBGtarjqMmbqHAx6quxuE
	/GaRwRoX1neaOVRIiVBGpYNpstSjVoxIzrlVzsIE5CHD7nvEy1ki697wsMKIMaRTXH16kFsRuJ2
	hsd6Jc5SYk
X-Google-Smtp-Source: AGHT+IHgHIQsrMPigrwrz8h1p27m7k+pPfrNaMBmLZEBEAyvoj0VwwvFEubrpPcd5OAsY3sCW5h50Q==
X-Received: by 2002:a05:600c:6299:b0:475:ddf7:9969 with SMTP id 5b1f17b1804b1-475ddf79e25mr5172015e9.9.1761375041992;
        Fri, 24 Oct 2025 23:50:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4cc5efsm18499555e9.16.2025.10.24.23.50.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 23:50:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH] libnet-ssleay-perl: upgrade 1.85 -> 1.94
Date: Sat, 25 Oct 2025 08:50:40 +0200
Message-ID: <20251025065040.936882-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 06:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120998

Also fix ptests.

Added two backported patches that makes patches compatible with the latest openssl.

Changelog: https://metacpan.org/release/CHRISN/Net-SSLeay-1.94/changes

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-perl.inc  |  2 +-
 ...509_get_cert_info-allow-single-colon.patch | 29 +++++++++++++++
 ...rmatting-difference-in-OpenSSL-3.4.1.patch | 32 ++++++++++++++++
 .../no-exec-on-configure.patch                | 37 -------------------
 .../libnet/libnet-ssleay-perl/run-ptest       | 27 ++++++++++++++
 ...erl_1.85.bb => libnet-ssleay-perl_1.94.bb} | 28 ++++++++------
 6 files changed, 106 insertions(+), 49 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
 delete mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/run-ptest
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.85.bb => libnet-ssleay-perl_1.94.bb} (56%)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index fff99cab2b..e923bd00c4 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_PERL = "\
     libmime-types-perl \
     libmozilla-ca-perl \
     libnet-ldap-perl \
+    libnet-ssleay-perl \
     libstrictures-perl \
     libsub-uplevel-perl \
     libterm-readkey-perl \
@@ -48,7 +49,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libmodule-build-tiny-perl \
     libnet-dns-perl \
     libnet-dns-sec-perl \
-    libnet-ssleay-perl \
     libunix-statgrab \
     libxml-libxml-perl \
 "
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch
new file mode 100644
index 0000000000..805a16d6c9
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch
@@ -0,0 +1,29 @@
+From 4068d585875d3ba99da2cbe41f60d0dd4f4290d1 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Wed, 16 Oct 2024 21:48:51 +0200
+Subject: [PATCH] test: 32_x509_get_cert_info allow single colon.
+
+Starting with 3.4.0 the double colon in emailAddress has been removed.
+Adapt the test to allow a single colon in 3.4.0 and later.
+
+Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssleay/commit/4068d585875d3ba99da2cbe41f60d0dd4f4290d1]
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+---
+ t/local/32_x509_get_cert_info.t | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/t/local/32_x509_get_cert_info.t b/t/local/32_x509_get_cert_info.t
+index 0f7e2d5a..0fd1b689 100644
+--- a/t/local/32_x509_get_cert_info.t
++++ b/t/local/32_x509_get_cert_info.t
+@@ -188,6 +188,10 @@ for my $f (keys (%$dump)) {
+                   ) {
+                       $ext_data =~ s{(othername:) [^, ]+}{$1<unsupported>}g;
+                   }
++                  # Starting with 3.4.0 the double colon in emailAddress has been removed.
++                  if (Net::SSLeay::SSLeay >= 0x30400000) {
++                      $ext_data =~ s{emailAddress::}{emailAddress:};
++                  }
+               }
+               elsif ( $nid == 89 ) {
+                   # The output formatting for certificate policies has a
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
new file mode 100644
index 0000000000..17310908c1
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
@@ -0,0 +1,32 @@
+From eac7ac502b02f44a84a67920e9f634cce71ff335 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Tue, 18 Feb 2025 18:57:15 +0100
+Subject: [PATCH] tests: Address another formatting difference in OpenSSL 3.4.1
+
+Since OpenSSL 3.4.1, commit 8a28bca8ee08 ("x509: add a newline after
+printing Full Name") to be exact, there is another new line change.
+
+Adapt the testsuite.
+
+Fixes: #513
+
+Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssleay/commit/eac7ac502b02f44a84a67920e9f634cce71ff335]
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+---
+ t/local/32_x509_get_cert_info.t | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/t/local/32_x509_get_cert_info.t b/t/local/32_x509_get_cert_info.t
+index 0fd1b68..08316bf 100644
+--- a/t/local/32_x509_get_cert_info.t
++++ b/t/local/32_x509_get_cert_info.t
+@@ -218,6 +218,9 @@ for my $f (keys (%$dump)) {
+                       # OpenSSL 1.0.0 to 1.1.1:
+                       $ext_data =~ s{(Full Name:\n  )}{\n$1}g;
+                       $ext_data .= "\n";
++                  } elsif ( Net::SSLeay::SSLeay >  0x3040000f ) {
++                      $ext_data =~ s{(\nFull Name:)}{\n$1}g;
++                      $ext_data .= "\n";
+                   }
+               }
+               elsif ( $nid == 126 ) {
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
deleted file mode 100644
index 9620df5ece..0000000000
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Avoid running target binaries during in cross build
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2018-08-27 14:56:24.788544991 +0200
-+++ b/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2018-08-27 15:00:12.847266331 +0200
-@@ -24,20 +24,7 @@
-     $self->requires_external_cc;
- 
-     my $prefix = $self->find_openssl_prefix;
--    my $exec   = $self->find_openssl_exec($prefix);
--
--    unless (-x $exec) {
--        print <<EOM;
--*** Could not find OpenSSL
--    If it's already installed, please set the OPENSSL_PREFIX environment
--    variable accordingly. If it isn't installed yet, get the latest version
--    from http://www.openssl.org/.
--EOM
--        exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
--    }
--
--    $self->check_openssl_version($prefix, $exec);
--    my $opts = $self->ssleay_get_build_opts($prefix, $exec);
-+    my $opts = $self->ssleay_get_build_opts($prefix);
- 
-     $self->makemaker_args(
-         CCCDLFLAGS => $opts->{cccdlflags},
-@@ -58,7 +45,7 @@
- }
- 
- sub ssleay_get_build_opts {
--    my ($self, $prefix, $exec) = @_;
-+    my ($self, $prefix) = @_;
- 
-     my $opts = {
-         lib_links  => [],
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/run-ptest b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/run-ptest
new file mode 100644
index 0000000000..03e3172e3b
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/run-ptest
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+result=0
+
+if ! nslookup example.com; then
+  mv /etc/resolv.conf /etc/resolv.conf.bak
+  echo "nameserver 8.8.8.8" > /etc/resolv.conf
+  trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
+fi
+
+for case in `find t -type f -name '*.t'`; do
+    perl -I . $case >$case.output 2>&1
+    ret=$?
+    cat $case.output
+    if [ $ret -ne 0 ]; then
+        result=1
+        echo "FAIL: ${case%.t}"
+    elif grep -i 'SKIP' $case.output; then
+        echo "SKIP: ${case%.t}"
+    else
+        echo "PASS: ${case%.t}"
+    fi
+
+    rm -f $case.output
+done
+
+exit $result
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.94.bb
similarity index 56%
rename from meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
rename to meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.94.bb
index daf07baa22..532744456d 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.94.bb
@@ -7,8 +7,8 @@ so you can write servers or clients for more complicated applications."
 HOMEPAGE = "https://metacpan.org/dist/Net-SSLeay"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=67d67095d83e339da538a082fad5f38e"
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c49f0a6dd21ce7d8988794dea20b650e"
 
 DEPENDS = "openssl zlib openssl-native"
 RDEPENDS:${PN} += "\
@@ -23,25 +23,31 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
-           file://no-exec-on-configure.patch \
-           file://run-ptest \
-          "
-SRC_URI[sha256sum] = "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8"
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CH/CHRISN/Net-SSLeay-${PV}.tar.gz \
+           file://0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch \
+           file://0001-test-32_x509_get_cert_info-allow-single-colon.patch \
+           file://run-ptest"
+SRC_URI[sha256sum] = "9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d"
 
 S = "${UNPACKDIR}/Net-SSLeay-${PV}"
 
-inherit cpan ptest
+inherit cpan ptest-perl
 
 do_configure() {
     export OPENSSL_PREFIX="${STAGING_EXECPREFIXDIR}"
     cpan_do_configure
 }
 
-do_install_ptest() {
-    cp -r ${B}/t ${D}${PTEST_PATH}
+do_install_ptest_perl:append(){
+    cp -r ${S}/inc ${D}${PTEST_PATH}
 }
 
 FILES:${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Net/SSLeay/.debug/"
 
-RDEPENDS:${PN}-ptest = " perl"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-english \
+    perl-module-file-spec-functions \
+    perl-module-findbin \
+    perl-module-perlio \
+    perl-module-test-more \
+    perl-module-threads"

