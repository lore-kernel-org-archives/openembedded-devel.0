Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20972CCF9E5
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:26:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6566.1761402385416973691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FjL7fOhl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso2799087f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761402384; x=1762007184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbvBQUp0ZX3E6LNQsF4BJQZ3aXuK5PB//pjq9SR6hjQ=;
        b=FjL7fOhlQTnD5xBaD0CoonUmrtVTXz4AZ/8jBsRP/50COsx0/894SdrAl3W+/2IN9X
         /cwVCClc8CfT4FKqmnlfVuBNGbm1ECAv4c4VvaFaDNP3rvI6HPkxuSkybcvn+EUmqEm4
         afy8a4QdEYTPEdgeIWGMXSJmYAew6H4rRDCbgohpdUzkpexklXwvtXZ7ZGciSSfPHpSR
         szUxLmEH+EsBmi60geH36xQAi6Nl9jrDGRvgHHgSMuj49pKzI8AUX4FHHDu4b/+1JzFM
         Za87CkeifB3OmStqsu46JyYZMx++RW9AqATVMCLYEI+RAaoAMC24CdobZFpf05AvdJk2
         g4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761402384; x=1762007184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbvBQUp0ZX3E6LNQsF4BJQZ3aXuK5PB//pjq9SR6hjQ=;
        b=DlfoQvGxGeDeMeXqNh/O9ps/g8jTG///qNpNUfXF/pCZykMc9+LgXt2ih/jjWFpghZ
         mWNCncUzl/LCjsm5N/UleCP9IoI9H+wiQbCWB9S9ECpSsIHjqyI76Nl1OI/oEQB0iHFL
         nzwNYE87tH6L1FDcnbCSlXibNg5OA6sv//WgyOUKWXXIamg/dKQuSuXBI22BfgndOGz2
         zpmG8ex0+Bc9ru9+vUDoye20LcyogmLUS2V8jOSOoaugHZW+U3dakFptKdS10IEg8vKD
         6kEPDRNYO4o0ijxDQo0fEhpvtlp3bibn9hFjsGoI3376ggkryd1/gAVDHkb4AtZBW8HP
         +mVQ==
X-Gm-Message-State: AOJu0Yy3vpWUr1uE/C16yG6SjwGZJxoRBRWMQ5HN4emj/ES1ZfulmeR7
	gjjpU1LQlZVEfpYLkTvTv30XV3CT7qbrMuk4UdLsCL41f1QepyqtdIIvixZTDg==
X-Gm-Gg: ASbGncubW4THRM0oeOYzaJmaBM2q2F1Xz2fK+XhhsU1dYRgN6oMKSQor0MUaK0w8t+C
	a5spzFLsfF0oNOxeNpBX37NeuEpIWDa1LRVhz+dx4R3VYcm7QbNJzuaahi/GnoDYgjhR2yBnXpu
	TJt0LUCHHej7zIQfEzcybjf+wLl2tO1LvnPBwZSIkGiHcG8wXBIiDtt0YoOyk7SVtKn0vWwWiQJ
	+cQ2QvUoJlz0eP+UZWV4Ap1bCmZ8L5HbPugSLJdSX9cv4MAl8gVBEkgr4WLqAkhwhLDKvfyC65l
	uuxqvS/9O8QIEOkBaICQ1EdpUg6jS4t/HUzQ2kMTIAO/Wnxawez6w/xWywFW/JP3/XmuYgLKHRd
	rwr78GNV5nlA2v6qlvgDqyOF1wMwT+gkeBaFHWZn2QrNpbIGXFxwJs1uaEyWSOtHnXMNfjN44qR
	jnf7bQF5Oc
X-Google-Smtp-Source: AGHT+IEH6zLG7qa+EF0fEoEPy4HUBCIImqCCVu8AkWKX6VrPd6YAtE7DWPrraakVOyfF/qASuQORcg==
X-Received: by 2002:a05:6000:25c7:b0:427:854:787 with SMTP id ffacd0b85a97d-4270854085bmr22633833f8f.51.1761402383683;
        Sat, 25 Oct 2025 07:26:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm3867482f8f.0.2025.10.25.07.26.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 07:26:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/5] libnet-dns-sec-perl: upgrade 1.10 -> 1.26
Date: Sat, 25 Oct 2025 16:26:18 +0200
Message-ID: <20251025142621.1566114-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025142621.1566114-1-skandigraun@gmail.com>
References: <20251025142621.1566114-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 14:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121002

Also fix ptests.

Changelog:
1.26:
-Avoid test failure on RedHat by requiring DSA-SHA1 opt-in.
-Fix: Rocky linux 9: libcrypto error
1.25:
-Suppress AUTOLOAD for Net::DNS::SEC::Private::_index.
-Abandon support for OpenSSL pre-1.1.1 API.
-Fix: Tests exhibiting signatures with SHA-1 fail since Fedora 41
-Fix: Net::DNS minimum version dependency
1.24:
-Eliminate deprecated RSA CRT parameter names.
-Add support for SM3 digest.
1.23:
-Code refactoring of XS component.
1.22:
-Enable Ed25519 sign/verify for BoringSSL & LibreSSL.
-Use EC curve names instead of literal NIDs.
-Circumvent sign/verify test failures on EBCDIC platforms.
-Fix: openssl-SNAP-20230831 breaks RSA sign/verify
1.21:
-Add new t/TestToolkit.pm
-Rework pre-installation test scripts.
- Fix: libressl-3.7.1 breaks DSA verify
1.20:
-Improve Net::DNS::SEC::Keyset tests and error reporting.
-Avoid test failures if/when DSA|MD5|SHA1 become unsupported.
1.19:
-Discontinue support for obsolete ECC-GOST.
-Add LICENSE file to comply with Fedora/RedHat announcement
 and WARNING of restrictions on use of strong cryptography.
1.18:
-Eliminate bareword filehandle usage.
-Eliminate indirect object syntax.
-Eliminate grep/map <expression>.
1.17:
-Recognise BIND private key accessed via symbolic link.
1.16:
-Improve testing of verify() functions.
-Rework code in Digest.pm
-SEC.xs code reduction.
1.15:
-Provide access to OpenSSL message digest implementations.
1.14:
-Improve exception capture in test scripts.
-Support more efficient algorithm mapping in Net::DNS.
1.13:
-Tweaks to resolve compilation errors with BoringSSL.
1.12:
-Avoid use of EC_POINT_set_affine_coordinates_GFp which is
 deprecated in OpenSSL 3.0.0
-Reduce level of support for OpenSSL non-LTS releases.
1.11:
-Explain why compilation aborted in Net::DNS::SEC::DSA et al.
-Fix Makefile.PL to suppress parallel test execution.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-perl.inc  |  2 +-
 .../libnet/libnet-dns-sec-perl_1.10.bb        | 30 ------------
 .../libnet/libnet-dns-sec-perl_1.26.bb        | 46 +++++++++++++++++++
 3 files changed, 47 insertions(+), 31 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 612754635b..fc32c709bc 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_PERL = "\
     libmime-types-perl \
     libmozilla-ca-perl \
     libnet-dns-perl \
+    libnet-dns-sec-perl \
     libnet-ldap-perl \
     libnet-ssleay-perl \
     libstrictures-perl \
@@ -48,7 +49,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
     libhtml-parser-perl \
     libmodule-build-tiny-perl \
-    libnet-dns-sec-perl \
     libunix-statgrab \
     libxml-libxml-perl \
 "
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
deleted file mode 100644
index ee365f9328..0000000000
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "DNSSEC extensions to Net::DNS"
-HOMEPAGE = "http://www.net-dns.org/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;beginline=165;endline=192;md5=6ef523fa09e8c272675839e21de16bde"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
-SRC_URI[sha256sum] = "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa536cf0314801989e"
-
-DEPENDS += "openssl"
-
-UPSTREAM_CHECK_REGEX = "Net\-DNS\-SEC\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
-
-S = "${UNPACKDIR}/Net-DNS-SEC-${PV}"
-
-EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_BASELIBDIR} -lcrypto'"
-
-inherit cpan ptest-perl
-
-RDEPENDS:${PN} = " \
-    libnet-dns-perl \
-    libcrypto \
-    perl-module-dynaloader \
-    perl-module-file-find \
-    perl-module-file-spec \
-    perl-module-io-file \
-    perl-module-mime-base64 \
-    perl-module-test-more \
-"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb
new file mode 100644
index 0000000000..d0e46783d5
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "DNSSEC extensions to Net::DNS"
+HOMEPAGE = "http://www.net-dns.org/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b7e4176275d57d0b036bdccbc01a0e7"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-SEC-${PV}.tar.gz"
+SRC_URI[sha256sum] = "88592c65487fb7b4d05134f2f9c48e649a9cd533a8493c50189b649b4ea711a6"
+
+DEPENDS += "openssl"
+
+UPSTREAM_CHECK_REGEX = "Net\-DNS\-SEC\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
+S = "${UNPACKDIR}/Net-DNS-SEC-${PV}"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_BASELIBDIR} -lcrypto'"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} = " \
+    libnet-dns-perl \
+    libcrypto \
+    perl-module-dynaloader \
+    perl-module-file-find \
+    perl-module-file-spec \
+    perl-module-io-file \
+    perl-module-mime-base64 \
+    perl-module-test-more \
+"
+
+do_install_ptest_perl:append(){
+   cp ${D}${PTEST_PATH}/t/TestToolkit.pm ${D}${PTEST_PATH}
+
+   # This test reconciles the perl module's MANIFEST file with the actual files
+   # in the module. This might be useful for package integrity check, but not so
+   # much for runtime testing - and it also requires the whole source tree to
+   # be installed. Rather just remove it.
+   rm ${D}${PTEST_PATH}/t/00-install.t
+}
+
+RDEPENDS:${PN}-ptest += "\
+    libnet-dns-perl \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec-functions \
+    perl-module-perlio"

