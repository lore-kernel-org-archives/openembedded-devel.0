Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 06D7671AC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:35:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x63so1503168pfx.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=DoezxwELnevfvgta4tiG7poQHz3jn651UKElWZIgLSk=;
	b=OxYOovX+hIlG0YcmGBvjYWudLiAQ01cPB66SuxuYVmUoFaxpiTEs891vHVuMNXYdeq
	pVJNw3PbPoNlQ+TklHWrRKDYq3hNvCMrvRcic0LNGQ+DWDtkWLbME737mjj0G0wT0KOW
	8v6B6jpUWyv3ZHEsUjP8Egc8vIScoM7Mv2l41URP1b+9tX8o5U4grEVgTdfI9oTf/a9d
	4lUWpEi004xv9gUjnRGzKAJLcFLxvYoJtwcf5ci9NTz6ZmPJ75cYf2B+s55BIepnmBhq
	6HNCRHpBLi8IsDLRkoZ2+Ra+ugEcLllexF+o5Ydj4SeWTWhvlM3+J69DYZmwyWuWCHpH
	JQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DoezxwELnevfvgta4tiG7poQHz3jn651UKElWZIgLSk=;
	b=U6lyAtcbuAuXU668CZOmYXgHIAv16VmFh8HozZpHhIGnB8sEe/U3GI/gAQOVMR37JN
	4QYq/HIiQsyWoDgeJ/p/7qNFK6O7PyuvcV+K1FbModi93h732P4G26hu6GUeEg3jOp3E
	e963jeNF9fjX4dlLmvOHiczXJE3j+ULmSphvZN03tLMo+6kKBiMKlPr0E2eHG6mR8Xn0
	4+i5Q0ndCFTgcU2CU7HpTsnEDvtKdJbnde1TQh3PhE987zrj2qZeAOQ8D5UMPCoyQ8ym
	XMjZkoO0YR+HhsexPb+mLbHTWSHbCV3suHm4tqZBQ2HjbIb5GuyJIu7sn67tI8aIWxvD
	j89A==
X-Gm-Message-State: AFeK/H0xOgyf4Tm/NTVetM61nd5B5AeEPbbviVmmo1aJuvunrN7baKSexKldRszKTESC5Q==
X-Received: by 10.98.3.3 with SMTP id 3mr2602819pfd.95.1489570542456;
	Wed, 15 Mar 2017 02:35:42 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	c64sm3053619pfa.45.2017.03.15.02.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Mar 2017 02:35:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, openembedded-devel@lists.openembedded.org,
	hongxu.jia@windriver.com
Date: Wed, 15 Mar 2017 02:35:37 -0700
Message-Id: <1489570537-7480-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libnet-ssleay-perl: Update to 1.80
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Mar 2017 09:35:50 -0000

Updated LICENSE to reflect actual on website
Fixes musl compile error.

addresses many compatability issue with the newer openssl
drop to backported patch now in this version

http://cpansearch.perl.org/src/MIKEM/Net-SSLeay-1.80/Changes

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ay-perl-Disable-test-that-fails-with-open.patch | 70 --------------------
 ...2-betas-have-dropped-the-SSLv3_method-fun.patch | 75 ----------------------
 ...eay-perl_1.65.bb => libnet-ssleay-perl_1.80.bb} | 14 ++--
 3 files changed, 4 insertions(+), 155 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
 delete mode 100644 meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.65.bb => libnet-ssleay-perl_1.80.bb} (75%)

diff --git a/meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch b/meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
deleted file mode 100644
index 393ee19..0000000
--- a/meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From e7a2d3a57fd51f0d4d5b3fcb6669b1876d4b18d2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 10 Nov 2015 01:23:18 -0500
-Subject: [PATCH 1/2] libnet-ssleay-perl: Disable test that fails with
- openssl-1.0.2b or above
-
-Run testsuits:
-t/local/33_x509_create_cert............NOK 39/123
-not ok 39 - PEM_get_string_PrivateKey+passwd+enc_alg
-|   Failed test 'PEM_get_string_PrivateKey+passwd+enc_alg'
-|   at t/local/33_x509_create_cert.t line 104.
-|                   undef
-|     doesn't match '(?^:-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----)'
-
-This is due to the following change in OpenSSL:
-(git://git.openssl.org/openssl.git)
-......
-4d9dc0c269be87b92da188df1fbd8bfee4700eb3 is the first bad commit
-commit 4d9dc0c269be87b92da188df1fbd8bfee4700eb3
-Author: Dr. Stephen Henson <steve@openssl.org>
-Date: Thu May 28 15:44:20 2015 +0100
-
-check for error when creating PKCS#8 structure
-
-Reviewed-by: Rich Salz <rsalz@openssl.org>
-(cherry picked from commit 2849707fa65d2803e6d1c1603fdd3fd1fdc4c6cc)
-......
-
-Upstream-Status: Backport from upstream latest 1.72:
-http://www.cpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-1.72.tar.gz
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- t/local/33_x509_create_cert.t | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/t/local/33_x509_create_cert.t b/t/local/33_x509_create_cert.t
-index 2f2c013..3e653ce 100755
---- a/t/local/33_x509_create_cert.t
-+++ b/t/local/33_x509_create_cert.t
-@@ -2,7 +2,7 @@
- 
- use strict;
- use warnings;
--use Test::More tests => 123;
-+use Test::More tests => 121;
- use Net::SSLeay qw/MBSTRING_ASC MBSTRING_UTF8 EVP_PK_RSA EVP_PKT_SIGN EVP_PKT_ENC/;
- use File::Spec;
- use utf8;
-@@ -99,10 +99,13 @@ is(Net::SSLeay::X509_NAME_cmp($ca_issuer, $ca_subject), 0, "X509_NAME_cmp");
-   }
-   ok(my $alg1 = Net::SSLeay::EVP_get_cipherbyname("DES-EDE3-CBC"), "EVP_get_cipherbyname");
-   like(my $key_pem3 = Net::SSLeay::PEM_get_string_PrivateKey($pk,"password",$alg1), qr/-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----/, "PEM_get_string_PrivateKey+passwd+enc_alg");
--  
--  ok(my $alg2 = Net::SSLeay::EVP_get_cipherbyname("DES-EDE3-OFB"), "EVP_get_cipherbyname");
--  like(my $key_pem4 = Net::SSLeay::PEM_get_string_PrivateKey($pk,"password",$alg2), qr/-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----/, "PEM_get_string_PrivateKey+passwd+enc_alg");
--  
-+
-+# DES-EDE3-OFB has no ASN1 support, detected by changes to do_pk8pkey as of openssl 1.0.1n
-+# https://git.openssl.org/?p=openssl.git;a=commit;h=4d9dc0c269be87b92da188df1fbd8bfee4700eb3
-+# this test now fails
-+#  ok(my $alg2 = Net::SSLeay::EVP_get_cipherbyname("DES-EDE3-OFB"), "EVP_get_cipherbyname");
-+#  like(my $key_pem4 = Net::SSLeay::PEM_get_string_PrivateKey($pk,"password",$alg2), qr/-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----/, "PEM_get_string_PrivateKey+passwd+enc_alg");
-+
-   is(Net::SSLeay::X509_NAME_print_ex($name), "O=Company Name,C=UK,CN=Common name text X509", "X509_NAME_print_ex");  
- 
-   # 2014-06-06: Sigh, some versions of openssl have this patch, which afffects the results of this test:
--- 
-1.9.1
-
diff --git a/meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch b/meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch
deleted file mode 100644
index e3650b8..0000000
--- a/meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From d94f2d3f96db529383b22f2dc294847190d1bfbe Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 10 Nov 2015 02:11:30 -0500
-Subject: [PATCH 2/2] Recent 1.0.2 betas have dropped the SSLv3_method
- function. This patch leaves out the function on newer versions, much the same
- as the SSLv2 deprecation is handled. It also fixes the ALPN test, which was
- incorrectly failing on OpenSSL due to the LibreSSL check (earlier versions
- bailed out before that line). Signed-off-by: Patch from Tom Molesworth
-
-Upstream-Status: Backport from upstream 1.67
-http://www.cpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-1.67.tar.gz
-https://rt.cpan.org/Public/Bug/Display.html?id=101484
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- SSLeay.xs                 | 12 ++++++++++++
- t/local/41_alpn_support.t |  2 +-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/SSLeay.xs b/SSLeay.xs
-index c31396d..1fd4fab 100644
---- a/SSLeay.xs
-+++ b/SSLeay.xs
-@@ -1409,6 +1409,9 @@ SSL_CTX_v2_new()
- #endif
- #endif
- 
-+#ifndef OPENSSL_NO_SSL3
-+#if OPENSSL_VERSION_NUMBER < 0x10002000L
-+
- SSL_CTX *
- SSL_CTX_v3_new()
-      CODE:
-@@ -1416,6 +1419,9 @@ SSL_CTX_v3_new()
-      OUTPUT:
-      RETVAL
- 
-+#endif
-+#endif
-+
- SSL_CTX *
- SSL_CTX_v23_new()
-      CODE:
-@@ -3758,9 +3764,15 @@ SSLv2_method()
- #endif
- #endif
- 
-+#ifndef OPENSSL_NO_SSL3
-+#if OPENSSL_VERSION_NUMBER < 0x10002000L
-+
- const SSL_METHOD *
- SSLv3_method()
- 
-+#endif
-+#endif
-+
- const SSL_METHOD *
- TLSv1_method()
- 
-diff --git a/t/local/41_alpn_support.t b/t/local/41_alpn_support.t
-index ba984b5..87a0214 100644
---- a/t/local/41_alpn_support.t
-+++ b/t/local/41_alpn_support.t
-@@ -11,7 +11,7 @@ use Config;
- 
- BEGIN {
-   plan skip_all => "openssl 1.0.2 required" unless Net::SSLeay::SSLeay >= 0x10002000;
--  plan skip_all => "libressl not supported" if &Net::SSLeay::LIBRESSL_VERSION_NUMBER;
-+  plan skip_all => "libressl not supported" if defined &Net::SSLeay::LIBRESSL_VERSION_NUMBER;
-   plan skip_all => "fork() not supported on $^O" unless $Config{d_fork};
- }
- 
--- 
-1.9.1
-
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
similarity index 75%
rename from meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
rename to meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
index f347942..32d92ba 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
@@ -7,8 +7,8 @@ so you can write servers or clients for more complicated applications."
 HOMEPAGE = "http://search.cpan.org/dist/Net-SSLeay/"
 SECTION = "libs"
 
-LICENSE = "OpenSSL"
-LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=49f415984b387be999ee2ad0e5c692fe"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=67d67095d83e339da538a082fad5f38e"
 
 DEPENDS = "openssl zlib"
 RDEPENDS_${PN} += "perl-module-carp \
@@ -19,12 +19,10 @@ RDEPENDS_${PN} += "perl-module-carp \
                   "
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
-           file://0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch \
-           file://0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "19600c036e9e0bbfbf9157f083e40755"
-SRC_URI[sha256sum] = "2fb1371120b85f018944d95736c107163f04ba56b6029c0709a2c3d6247b9c06"
+SRC_URI[md5sum] = "b1e0fd96d7f3be57580377226ca5f089"
+SRC_URI[sha256sum] = "a541a66d59fc5f9bb7af09d3a0b68305e4c43ba9488b12915728fd282ea01b93"
 
 S = "${WORKDIR}/Net-SSLeay-${PV}"
 
@@ -35,10 +33,6 @@ EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
                    '-lssl -lcrypto -lz' \
                   "
 
-do_configure_prepend() {
-    export OPENSSL_PREFIX=${STAGING_DIR_NATIVE}${prefix_native}
-}
-
 do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
-- 
2.7.4


