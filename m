Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A092C531FD
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:13:53 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14259.1771647228050477272
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKivXhu6;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79802e2c989so24150527b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 20:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647227; x=1772252027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5KJah/gQ+DG1hUluLIkb1BmxLR1Nurz+NISrxWVlpQc=;
        b=AKivXhu69mliFoFk1Y42SegrAPN/LBjHu6l/5XdrqNDW1rmS4++6UmaAarcB3ctpGW
         8PIU6hrUlGikNtkFA7RSkd40mGiapS27f5NcdMilEt64KM3xJBmAmKSZ+jI+oV0oGQjT
         TMtHnuyj3zfkdUwhMCbA0OiFrLj4vnl41nEs+WCbEPqasX0eeIYrB7hMVSOpnG58r/uL
         6rDfkG5t2D4LAQZhucWrU2CHYGiBF8E7gPZQPkhUE9llxnSFq24YmPqqBCM8ZJSJmutb
         6rD+NaUzCiDwGCQf8smw2Juuf/ueI+d1t2ObWOw10SjzfDgqR3DI4IpKR7gwQQ4Kulkk
         OzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647227; x=1772252027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KJah/gQ+DG1hUluLIkb1BmxLR1Nurz+NISrxWVlpQc=;
        b=R2b/4CarHZXTKWrdBoRj58mrQMytHz5FAAvt9yDD77CcY8XCkbDk+zL2YAhzjp1OFp
         +nX7RmGhXqZE9SmecS08sj9Jk8xfA2HOAseeJSJkCzDW4wtdM9Is1b+CsHuZ3xi15K2F
         TO8lOcCtXoDjFC+TKCuTQr7f5w80caKTkm2VRIm2koACMjWenOFSo61mjg8v7rBblnHG
         DXQj6dS+01dwljaGETHEQiChTDrs28rrnZTF5QxYkLKgP20ONIeieodtm50IWAPWNQQb
         I27g31MyQPlPRT8zKfDVgQsiMFn0GI6TzP6yDzkThrK8I50gdXa0n3Yk9+XKcwOJsKPJ
         nZRA==
X-Gm-Message-State: AOJu0YzONr0ZFhMNTPbgfNBRhz6BWWSJUbNfHDKD3i34sWBUaXqIlMsW
	PuQEqyl9ddps7QXj0rJfs5htxSWoWjA1kT2w9L17SNkou7f6ppkbiNXAWW1md2oq
X-Gm-Gg: AZuq6aIaEywMRtV8I+W6lXG43g62iJ6XtkMULIuhLkD5abNd0D1UW+rGBl3oEzwZEhG
	wYNwxUxDDQvzQ0XiiWoZAOLJ39c6HoC38QQiaenOxSYlRI6B0V7LgUCggnDirs7HHXLBXJW90DU
	8bVOno5NujN0aPStFQp8HfcP4MkuX4cv/2XrADtY9xuTuE6NGKYpLT6K9VIfUjLmcaP3i5PLkJe
	vj+W9zGrQEMg+QDoj05DgT304UzKg56aOGq1msRB6bMA2NJ52zdXgGvBSlrm6tLis8b5vC4erO9
	jtyDb22buCcWwsKKUZb4PM4W3XXJG5zBfNGoU6f7sSbesdrK6aJhSKoV3vsZMoPxsksMXRUwJXX
	vZgskFttEJ09LuqwTUQF4YWTxPtf92A5R1q6QzUdp9AV8zBV/H3Grei1vyTbR6uVpbLo0hrayM3
	W+Iy3WkCaWwlH93q0+BiKzYOtZOhPCbImeNZTT8Bwc1PSEJhjDpkNEWbTw0+R5ky0Kip0OS70SZ
	MCbQ79P+96e41ewfVIzeeHmO1k9ajYKrUuaDLspnLICy5MjigOJdcj+csBjnQ==
X-Received: by 2002:a05:690c:810:b0:798:1219:c787 with SMTP id 00721157ae682-79828ef1981mr15702597b3.6.1771647226615;
        Fri, 20 Feb 2026 20:13:46 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddd1750sm5281097b3.44.2026.02.20.20.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:13:46 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][scarthgap][PATCH] In meta-perl, drop the SRC_URI[md5sum] where a SRC_URI[sha256sum] is already available.
Date: Fri, 20 Feb 2026 23:13:40 -0500
Message-ID: <20260221041340.1212324-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Feb 2026 04:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124528

This patch was generated from master

git cherry-pick cb4a67ad2c66e6df997e3c07308819ce657229ac~..94b51dc5761b03fa66d6f56295c7cad55e154c15

That showed 46 patches which were then squashed with

git reset --soft HEAD~46
git commit -s

This set is changing files only in meta-perl

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb | 1 -
 meta-perl/recipes-perl/adduser/adduser_3.118.bb                  | 1 -
 .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb     | 1 -
 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb   | 1 -
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb     | 1 -
 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb   | 1 -
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb      | 1 -
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb      | 1 -
 .../libdevel/libdevel-globaldestruction-perl_0.14.bb             | 1 -
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb     | 1 -
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb     | 1 -
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb                | 1 -
 meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb         | 1 -
 .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb    | 1 -
 .../libextutils/libextutils-installpaths-perl_0.012.bb           | 1 -
 .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb    | 1 -
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb     | 1 -
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb       | 1 -
 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb       | 1 -
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb         | 1 -
 meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb | 1 -
 meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb         | 1 -
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb         | 1 -
 meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb  | 1 -
 meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb | 1 -
 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb | 1 -
 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb        | 1 -
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb           | 1 -
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb         | 1 -
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb         | 1 -
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb         | 1 -
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb     | 1 -
 meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb     | 1 -
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb     | 1 -
 .../recipes-perl/libstrictures/libstrictures-perl_2.000006.bb    | 1 -
 .../libsub/libsub-exporter-progressive-perl_0.001013.bb          | 1 -
 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb      | 1 -
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb      | 1 -
 meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb   | 1 -
 meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb    | 1 -
 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb         | 1 -
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb         | 1 -
 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb     | 1 -
 .../libunicode/libunicode-linebreak-perl_2019.001.bb             | 1 -
 .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb    | 1 -
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb     | 1 -
 46 files changed, 46 deletions(-)

diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
index a5d28265d7..9da2b1adf9 100644
--- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -12,7 +12,6 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mime-construct-${PV}.tar.gz \
     file://fix-mime-construct-help-return-value.patch \
 "
 
-SRC_URI[md5sum] = "73834ea780fbea81b89dbd9b2fb54f58"
 SRC_URI[sha256sum] = "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d2ec706a7084a4a9303"
 
 inherit cpan
diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index 3ac2211aa6..431b41a2dd 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${
            file://0001-adduser-set-default-shell-with-sbin-nologin.patch \
 "
 
-SRC_URI[md5sum] = "44ba2475ebdaafc9613236bdda321c97"
 SRC_URI[sha256sum] = "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38ed417737ed3166ffc"
 
 S = "${WORKDIR}/${BPN}"
diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
index d87df0974b..1fc6048c6d 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
@@ -13,7 +13,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
-SRC_URI[md5sum] = "457cd497a0411a88b47d3741eb176071"
 SRC_URI[sha256sum] = "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c7a3cb35c259f5190"
 
 S = "${WORKDIR}/Algorithm-Diff-${PV}"
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index ee7c4d7502..4a7b576a2c 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.
            file://test.pl-adjust-for-ptest.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "d1fe2d6ecf7ea99299e4e3a8f945aad8"
 SRC_URI[sha256sum] = "3b276506986ccaa4949d92b13ce053a0017ad11562a991cc753364923fe81ca7"
 
 S = "${WORKDIR}/Authen-Radius-${PV}"
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index a9eec69502..531bc61cfb 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -14,7 +14,6 @@ RDEPENDS:${PN} = "libdigest-hmac-perl"
 SRC_URI = "http://www.cpan.org/authors/id/G/GB/GBARR/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "7c03a689d4c689e5a9e2f18a1c586b2f"
 SRC_URI[sha256sum] = "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32854e09"
 
 S = "${WORKDIR}/Authen-SASL-${PV}"
diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
index a51d327a31..43d6b03f40 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
 SRCNAME = "Capture-Tiny"
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "f5d24083ad270f8326dd659dd83eeb54"
 SRC_URI[sha256sum] = "6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 5c3701f16b..f4c1e5673a 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -16,7 +16,6 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "eeeab8cc93eef7dd2e2c343ecdf247b7"
 SRC_URI[sha256sum] = "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d8f5131beec31a0a33e"
 RDEPENDS:${PN} += "libcapture-tiny-perl"
 RDEPENDS:${PN} += "perl-module-base"
diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 4493a7e5e5..66369df641 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -18,7 +18,6 @@ DEPENDS = "perl"
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "467b7183d1062ab4a502b50c34e7d67f"
 SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
 
 S = "${WORKDIR}/Data-HexDump-${PV}"
diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
index 1dcecd0dcf..e8450c7ac8 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
@@ -10,7 +10,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
-SRC_URI[md5sum] = "24221ba322cf2dc46a1fc99b53e2380b"
 SRC_URI[sha256sum] = "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab"
 
 S = "${WORKDIR}/Devel-GlobalDestruction-${PV}"
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
index 43b7f4d5a9..41b4e78c5c 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -11,7 +11,6 @@ RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMAC-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "e6a5d6f552da16eacb5157ea4369ff9d"
 SRC_URI[sha256sum] = "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59"
 
 S = "${WORKDIR}/Digest-HMAC-${PV}"
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index df89c9bcdb..4aa37243a7 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "bd22388f268434f2b24f64e28bf1aa35"
 SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
 
 S = "${WORKDIR}/Digest-SHA1-${PV}"
diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index 79fff9d520..fd34c6d123 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fdba5c0690e66972c96fee112cf5f25c"
 SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
 
 S = "${WORKDIR}/Env-${PV}"
diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
index e54bb11ccd..15e0ef85c0 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
@@ -33,7 +33,6 @@ RDEPENDS:${PN}-ptest += " \
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6732b1c6207e4a9a3e2987c88368039a"
 SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
 
 S = "${WORKDIR}/Error-${PV}"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
index a58d96582e..0f43c537c0 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -8,7 +8,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
-SRC_URI[md5sum] = "565a7b09c7cac5907a25bbe2c959a717"
 SRC_URI[sha256sum] = "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c"
 
 S = "${WORKDIR}/ExtUtils-Config-${PV}"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
index 07dab4e161..f4db4ccff6 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
@@ -9,7 +9,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
-SRC_URI[md5sum] = "9a8d66aab1ffec98ea260faf03ac612b"
 SRC_URI[sha256sum] = "84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed"
 
 S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
index 43b5b60ef6..56617fcdac 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee
 
 SRCNAME = "ExtUtils-ParseXS"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2ae41036d85e98e1369645724962dd16"
 SRC_URI[sha256sum] = "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e8644b5f9a57cc4ee1c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index 1012ae952e..3f138baa41 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -13,7 +13,6 @@ S = "${WORKDIR}/File-Slurp-${PV}"
 
 inherit cpan
 
-SRC_URI[md5sum] = "7d584cd15c4f8b9547765eff8c4ef078"
 SRC_URI[sha256sum] = "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
 
 BBCLASSEXTEND="native"
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index 216d7c4136..4dbcc107bc 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -9,7 +9,6 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "eb7505e5f626913350df9dd4a03d54a8"
 SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
 
 S = "${WORKDIR}/HTML-Parser-${PV}"
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
index c871b97c39..a0ce7c0b2e 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
@@ -8,7 +8,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=62;endline=66;md5=aa91eed6adfe182d2af676954f06a7c9"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.tar.gz"
-SRC_URI[md5sum] = "d2bfa18fe1904df7f683e96611e87437"
 SRC_URI[sha256sum] = "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
 
 S = "${WORKDIR}/HTML-Tagset-${PV}"
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 227fa83fc0..b9099fc576 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[md5sum] = "d9271d60b872ed6fbe68b2d0fe8c450e"
 SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
 
 S = "${WORKDIR}/HTML-Tree-${PV}"
diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
index e88d60d13a..690bbe92eb 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
@@ -17,7 +17,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.gz"
-SRC_URI[md5sum] = "70f2f3b08a5b706ee382a8448c346cb1"
 SRC_URI[sha256sum] = "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5fa7244836a68b1084"
 
 S = "${WORKDIR}/Import-Into-${PV}"
diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index b745939234..5c5ccf7db2 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
 
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
-SRC_URI[md5sum] = "e91acf0a800b190d13585a47de775bdd"
 SRC_URI[sha256sum] = "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6aaa8296ea41bf199d"
 
 S = "${WORKDIR}/IO-stringy-${PV}"
diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index 203db7b10c..6172933f13 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -12,7 +12,6 @@ S = "${WORKDIR}/IPC-Signal-${PV}"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4cebf17fdf1785eaf8c151bf2e8c360a"
 SRC_URI[sha256sum] = "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525875c38cef2076fd0"
 
 inherit cpan
diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
index 1e4b563532..654fd2eedd 100644
--- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bc652758af65c24500f1d06a77415019"
 SRC_URI[sha256sum] = "909d47954697e7c04218f972915b787bd1244d75e3bd01620bc167d5bbc49c15"
 
 S = "${WORKDIR}/Locale-gettext-${PV}"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 538fa30d3f..fac74ba97e 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda
 
 SRCNAME = "Module-Pluggable"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "87ce2971662efd0b69a81bb4dc9ea76c"
 SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
 
 
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index 205df68029..9c4370e965 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -21,7 +21,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=36;endline=44;md5=9416434672a57853d6
 
 SRCNAME = "Module-Runtime"
 SRC_URI = "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "d3d47222fa2e3dfcb4526f6cc8437b20"
 SRC_URI[sha256sum] = "68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024"
 
 UPSTREAM_CHECK_REGEX = "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
index fe7bb3326e..37b5d61f7a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
@@ -6,7 +6,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=165;endline=192;md5=6ef523fa09e8c272675839e21de16bde"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
-SRC_URI[md5sum] = "ffa55a9898192c9d4c623cb1357eba9b"
 SRC_URI[sha256sum] = "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa536cf0314801989e"
 
 DEPENDS += "openssl"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index a77381dce8..a7793200a5 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d091ed00302f0276069bca9df9478744"
 SRC_URI[sha256sum] = "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288f610daa8c27995b351"
 
 S = "${WORKDIR}/perl-ldap-${PV}"
diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 4c4faab4db..a22b63809c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -13,7 +13,6 @@ DEPENDS += "libidn"
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
-SRC_URI[md5sum] = "c3e4de2065009d67bcb1df0afb473e12"
 SRC_URI[sha256sum] = "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e9430fbb6f393bdbb17"
 
 SRC_URI += "file://libidn-wr-cross-compile.patch"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index 5d0eccd84a..a91bb6cbe1 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -27,7 +27,6 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.ta
            file://no-exec-on-configure.patch \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
 SRC_URI[sha256sum] = "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8"
 
 S = "${WORKDIR}/Net-SSLeay-${PV}"
diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d1365f269c..d90b47d218 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -15,7 +15,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
-SRC_URI[md5sum] = "c8573c57a2d9469f038c40ac284b1e5f"
 SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
 
 S = "${WORKDIR}/Net-Telnet-${PV}"
diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index 643a704a1d..5e4c71b704 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -14,7 +14,6 @@ S = "${WORKDIR}/Proc-WaitStat-${PV}"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b911bd579b6b142391b21de1efa30c95"
 SRC_URI[sha256sum] = "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2ea1a41bd0bf4474bc"
 
 inherit cpan
diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
index c5efc15358..8ccd269e6d 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
@@ -9,7 +9,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ee45591befa3d0b1094ac75d282b6ba"
 SRC_URI[sha256sum] = "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index cf290d9908..6b1c4e8c0f 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -28,7 +28,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c195
     file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
 "
 
-SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
 SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
 
 S = "${WORKDIR}/Unix-Statgrab-${PV}"
diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
index 80c21b2b14..5a779a6733 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
@@ -29,7 +29,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
-SRC_URI[md5sum] = "35c14fd25320f32ff40e977feae95d0d"
 SRC_URI[sha256sum] = "09d57974a6d1b2380c802870fed471108f51170da81458e2751859f2714f8d57"
 
 S = "${WORKDIR}/strictures-${PV}"
diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index d51ab21715..10f0fa2044 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -14,7 +14,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
-SRC_URI[md5sum] = "72cf6acdd2a0a8b105821a4db98e4ebe"
 SRC_URI[sha256sum] = "d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056"
 
 S = "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 3a0de9757b..1981ae4a94 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -17,7 +17,6 @@ CPAN_AUTHOR = "DAGOLDEN"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6c6a174861fd160e8d5871a86df00baf"
 SRC_URI[sha256sum] = "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d98f3c8cc4a3ece293"
 
 S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index f4ce3131de..831ea1a8f6 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b2b4aab7a0e6bddb7ac3b21ba637482c"
 SRC_URI[sha256sum] = "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856a47290"
 
 S = "${WORKDIR}/TermReadKey-${PV}"
diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
index d74a347293..aea0e7e0f2 100644
--- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
@@ -25,7 +25,6 @@ CPAN_AUTHOR = "ADAMK"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/A/AD/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "682ed043f7d3e38f3dfd8745fd21c49a"
 SRC_URI[sha256sum] = "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6b1b2e97f08202b686c"
 
 RDEPENDS:${PN} += "perl-module-test-builder perl-module-test-more perl-module-test-tester"
diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
index 29118129ad..e9a2bd474b 100644
--- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "37a723df0580c0758c0ee67b37336c15"
 SRC_URI[sha256sum] = "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece41b6179d8e230704f8"
 
 S = "${WORKDIR}/Text-CharWidth-${PV}"
diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
index 9dfadde8e5..2e89b759bf 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "30d56e6dd5551ca16b8e16cc7299dc21"
 SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
 
 S = "${WORKDIR}/Text-Diff-${PV}"
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 1e8405cab9..88125845b1 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -14,7 +14,6 @@ RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "81b26e069eaebb084e91ea3c009b67ae"
 SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
 
 S = "${WORKDIR}/Text-Iconv-${PV}"
diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
index 017e951d3a..0949dbb7a0 100644
--- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -18,7 +18,6 @@ LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0799c16a00926e6c18d400c2e2861d5f"
 SRC_URI[sha256sum] = "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859ae1741d7941846a488"
 
 S = "${WORKDIR}/Text-WrapI18N-${PV}"
diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
index a7a998c358..ae922d9dda 100644
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=5;endline=9;md5=b5e8b1099b86b86fbc31
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "003d6da7a13700e069afed9238c864b9"
 SRC_URI[sha256sum] = "486762e4cacddcc77b13989f979a029f84630b8175e7fef17989e157d4b6318a"
 
 S = "${WORKDIR}/Unicode-LineBreak-${PV}"
diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
index 7962d22c9d..2261dafbb0 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -13,7 +13,6 @@ DEPENDS += "libxml-sax-perl-native"
 RDEPENDS:${PN} += "libxml-sax-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
-SRC_URI[md5sum] = "2992c0387632583b966ab9c965b25512"
 SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
 
 LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index 487a5c22cd..c3dee2bcbb 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -13,7 +13,6 @@ DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
-SRC_URI[md5sum] = "3e3023c648e3003c04de2fb04435f8bd"
 SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c682cf0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
-- 
2.43.0


