Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5B0B76E4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:34:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAA7YK0n005294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Nov 2015 23:34:20 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 9 Nov 2015 23:34:19 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Nov 2015 15:34:13 +0800
Message-ID: <1447140853-21324-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libnet-ssleay-perl: fix test failures with openssl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 07:34:22 -0000
Content-Type: text/plain

Backport two patches from uptream to fix test failure with
openssl 1.0.2b or above.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ay-perl-Disable-test-that-fails-with-open.patch | 70 ++++++++++++++++++++
 ...2-betas-have-dropped-the-SSLv3_method-fun.patch | 75 ++++++++++++++++++++++
 .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb |  2 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
 create mode 100644 meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch

diff --git a/meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch b/meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
new file mode 100644
index 0000000..393ee19
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
@@ -0,0 +1,70 @@
+From e7a2d3a57fd51f0d4d5b3fcb6669b1876d4b18d2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 10 Nov 2015 01:23:18 -0500
+Subject: [PATCH 1/2] libnet-ssleay-perl: Disable test that fails with
+ openssl-1.0.2b or above
+
+Run testsuits:
+t/local/33_x509_create_cert............NOK 39/123
+not ok 39 - PEM_get_string_PrivateKey+passwd+enc_alg
+|   Failed test 'PEM_get_string_PrivateKey+passwd+enc_alg'
+|   at t/local/33_x509_create_cert.t line 104.
+|                   undef
+|     doesn't match '(?^:-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----)'
+
+This is due to the following change in OpenSSL:
+(git://git.openssl.org/openssl.git)
+......
+4d9dc0c269be87b92da188df1fbd8bfee4700eb3 is the first bad commit
+commit 4d9dc0c269be87b92da188df1fbd8bfee4700eb3
+Author: Dr. Stephen Henson <steve@openssl.org>
+Date: Thu May 28 15:44:20 2015 +0100
+
+check for error when creating PKCS#8 structure
+
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+(cherry picked from commit 2849707fa65d2803e6d1c1603fdd3fd1fdc4c6cc)
+......
+
+Upstream-Status: Backport from upstream latest 1.72:
+http://www.cpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-1.72.tar.gz
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ t/local/33_x509_create_cert.t | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/t/local/33_x509_create_cert.t b/t/local/33_x509_create_cert.t
+index 2f2c013..3e653ce 100755
+--- a/t/local/33_x509_create_cert.t
++++ b/t/local/33_x509_create_cert.t
+@@ -2,7 +2,7 @@
+ 
+ use strict;
+ use warnings;
+-use Test::More tests => 123;
++use Test::More tests => 121;
+ use Net::SSLeay qw/MBSTRING_ASC MBSTRING_UTF8 EVP_PK_RSA EVP_PKT_SIGN EVP_PKT_ENC/;
+ use File::Spec;
+ use utf8;
+@@ -99,10 +99,13 @@ is(Net::SSLeay::X509_NAME_cmp($ca_issuer, $ca_subject), 0, "X509_NAME_cmp");
+   }
+   ok(my $alg1 = Net::SSLeay::EVP_get_cipherbyname("DES-EDE3-CBC"), "EVP_get_cipherbyname");
+   like(my $key_pem3 = Net::SSLeay::PEM_get_string_PrivateKey($pk,"password",$alg1), qr/-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----/, "PEM_get_string_PrivateKey+passwd+enc_alg");
+-  
+-  ok(my $alg2 = Net::SSLeay::EVP_get_cipherbyname("DES-EDE3-OFB"), "EVP_get_cipherbyname");
+-  like(my $key_pem4 = Net::SSLeay::PEM_get_string_PrivateKey($pk,"password",$alg2), qr/-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----/, "PEM_get_string_PrivateKey+passwd+enc_alg");
+-  
++
++# DES-EDE3-OFB has no ASN1 support, detected by changes to do_pk8pkey as of openssl 1.0.1n
++# https://git.openssl.org/?p=openssl.git;a=commit;h=4d9dc0c269be87b92da188df1fbd8bfee4700eb3
++# this test now fails
++#  ok(my $alg2 = Net::SSLeay::EVP_get_cipherbyname("DES-EDE3-OFB"), "EVP_get_cipherbyname");
++#  like(my $key_pem4 = Net::SSLeay::PEM_get_string_PrivateKey($pk,"password",$alg2), qr/-----BEGIN (ENCRYPTED|RSA) PRIVATE KEY-----/, "PEM_get_string_PrivateKey+passwd+enc_alg");
++
+   is(Net::SSLeay::X509_NAME_print_ex($name), "O=Company Name,C=UK,CN=Common name text X509", "X509_NAME_print_ex");  
+ 
+   # 2014-06-06: Sigh, some versions of openssl have this patch, which afffects the results of this test:
+-- 
+1.9.1
+
diff --git a/meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch b/meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch
new file mode 100644
index 0000000..e3650b8
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch
@@ -0,0 +1,75 @@
+From d94f2d3f96db529383b22f2dc294847190d1bfbe Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 10 Nov 2015 02:11:30 -0500
+Subject: [PATCH 2/2] Recent 1.0.2 betas have dropped the SSLv3_method
+ function. This patch leaves out the function on newer versions, much the same
+ as the SSLv2 deprecation is handled. It also fixes the ALPN test, which was
+ incorrectly failing on OpenSSL due to the LibreSSL check (earlier versions
+ bailed out before that line). Signed-off-by: Patch from Tom Molesworth
+
+Upstream-Status: Backport from upstream 1.67
+http://www.cpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-1.67.tar.gz
+https://rt.cpan.org/Public/Bug/Display.html?id=101484
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ SSLeay.xs                 | 12 ++++++++++++
+ t/local/41_alpn_support.t |  2 +-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/SSLeay.xs b/SSLeay.xs
+index c31396d..1fd4fab 100644
+--- a/SSLeay.xs
++++ b/SSLeay.xs
+@@ -1409,6 +1409,9 @@ SSL_CTX_v2_new()
+ #endif
+ #endif
+ 
++#ifndef OPENSSL_NO_SSL3
++#if OPENSSL_VERSION_NUMBER < 0x10002000L
++
+ SSL_CTX *
+ SSL_CTX_v3_new()
+      CODE:
+@@ -1416,6 +1419,9 @@ SSL_CTX_v3_new()
+      OUTPUT:
+      RETVAL
+ 
++#endif
++#endif
++
+ SSL_CTX *
+ SSL_CTX_v23_new()
+      CODE:
+@@ -3758,9 +3764,15 @@ SSLv2_method()
+ #endif
+ #endif
+ 
++#ifndef OPENSSL_NO_SSL3
++#if OPENSSL_VERSION_NUMBER < 0x10002000L
++
+ const SSL_METHOD *
+ SSLv3_method()
+ 
++#endif
++#endif
++
+ const SSL_METHOD *
+ TLSv1_method()
+ 
+diff --git a/t/local/41_alpn_support.t b/t/local/41_alpn_support.t
+index ba984b5..87a0214 100644
+--- a/t/local/41_alpn_support.t
++++ b/t/local/41_alpn_support.t
+@@ -11,7 +11,7 @@ use Config;
+ 
+ BEGIN {
+   plan skip_all => "openssl 1.0.2 required" unless Net::SSLeay::SSLeay >= 0x10002000;
+-  plan skip_all => "libressl not supported" if &Net::SSLeay::LIBRESSL_VERSION_NUMBER;
++  plan skip_all => "libressl not supported" if defined &Net::SSLeay::LIBRESSL_VERSION_NUMBER;
+   plan skip_all => "fork() not supported on $^O" unless $Config{d_fork};
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
index b289151..cfd6f51 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -19,6 +19,8 @@ RDEPENDS_${PN} += "perl-module-carp \
                   "
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+           file://0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch \
+           file://0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch \
            file://run-ptest \
           "
 SRC_URI[md5sum] = "19600c036e9e0bbfbf9157f083e40755"
-- 
1.9.1


