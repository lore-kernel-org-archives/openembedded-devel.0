Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1AAAD787C3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169357"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:24 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:09 -0800
Message-Id: <d57d839bd9663c4f808ed512164e4bcccf8e445d.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 09/12] libnet-ssleay-perl: upgrade 1.81 -> 1.84
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Fix RDEPENDS
* Use OPENSSL_PREFIX to pick up proper OpenSSL
* Fix mangled .so by rearranging EXTRA_CPANFLAGS

Changes:

1.84 2018-01-17
* Fixed an error in t/local/04_basic.t causing a test failure if
* Test::Exception not installed. Reported by Joel Berger.

1.83 2018-01-16
* Fixed a problem with exporting OPENSSL_NO_NEXTPROTONEG even though they are not availble
  on LibreSSL
* Patch patch-SSLeay_xs-NO_NPN from Alexander Bluhm.
* Patch from Heikki Vatiainen adds support for SSL_set_default_passwd_cb* for
* OpenSSL 1.1.0f and later. LibreSSL does not support these functions, at least yet.
* Patch from Heikki Vatiainen adds new functions related to SSL_CTX_new.
* Patch from Heikki Vatiainen adds two new functions introduced in OpenSSL 1.1.0, a number
  of constants and a couple of const qualifiers to SSLeay.xs. Tests and
  documentation .pod were also updated.
* Patch from Heikki Vatiainen adds one new OpenSSL 1.1.0 function and has a minor fix for
* LibreSSL version detection:
  - Added support for SSL_use_certificate_chain_file
    function introduced in OpenSSL 1.1.0.
  - Fixed LibreSSL version detection to correctly parse
* LibreSSL minor version.
* Patch from Steffen Ulrich to fix memory leaks in OCSP handling. Thanks.
* Patch from Heikki Vatiainen adds new functions for certificate verification introduced in
* OpenSSL 1.02, a number of constants, new test data files, new tests and
  updates to .pod documentation.
* The new functions provide access to the built-in wildcard check
  functionality available in OpenSSL 1.0.2 and later.
* The patch also adds new tests for the new functions and updates some of
  the current tests for CTX_set_default_passwd_cb* functions.
* Added X509_STORE_CTX_new and X509_verify_cert.
* SSL_OCSP_response_verify now clears the error queue if OCSP_basic_verify fails but the
  intermediate certificate succeeds. Patch from Stefan Ullrich.

1.82 2017-10-31
* Added support for building under Linuxbrew (a linuxbrew version of MacOS Homebrew)
* Patch from Matthew Altus, that implements SSL_CTX_set_psk_client_callback() and
  SSL_set_psk_client_callback().
* Patch to build with LibreSSL has no support for NPN
* Also skip the NPN test if the SSL library is LibreSSL.
* Fixed a problem with a variable declaration in ssleay_session_secret_cb_invoke reported
  by Graham Ollis.
* Significant patch set from Open System Consultants:
  - Bugfix: tlsext_status_cb_invoke(...): free ocsp_response only when allocated.
  - The same callback is used on a server side for OCSP stapling and in that
    case ocsp_response is NULL and not used.
  - New feature: Added a binding SSL_set_session_ticket_ext_cb(ssl,callback,data)
  - A callback used by EAP-FAST/EAP-TEAT to parse and process TLS session ticket.
  - Tests are in t/local/65_ticket_sharing_2.t
  - New feature: Added a binding SSL_set_session_ticket_ext(ssl,ticket)
  - Used by EAP-FAST/EAP-TEAP to define TLS session ticket value.
  - Tests are in t/local/65_ticket_sharing_2.t
  - Bugfix: tlsext_ticket_key_cb_invoke(...): allow SHA256 HMAC key to be 32 bytes
    instead of 16 bytes (which OpenSSL will pad with zeros up to 32 bytes).
  - New feature: Added following bindings:
    = X509_get_ex_data(cert,idx)
    = X509_get_ex_new_index(argl,argp,new_func,dup_funL,free_func)
    = X509_get_app_data(cert)
    = X509_set_ex_data(cert,idx,data)
    = X509_set_app_data(cert,arg)
    = X509_STORE_CTX_get_ex_new_index(argl,argp,new_func,dup_func,free_func)
    = X509_STORE_CTX_get_app_data(x509_store_ctx)
    = X509_STORE_CTX_set_app_data(x509_store_ctx,arg)
  - New feature: Added an implementation for SSL_get_finished(ssl,buf,count=2*EVP_MAX_MD_SIZE)
  - Tests are in t/local/43_misc_functions.t
  - New feature: Added an implementation for SSL_get_peer_finished(ssl,buf,count=2*EVP_MAX_MD_SIZE)
  - Tests are in t/local/43_misc_functions.t
  - Bugfix: SSL_get_keyblock_size(s): Calculate key block size correctly also with AEAD ciphers
    which don’t use digest functions.
  - New feature: Added a binding SSL_set_tlsext_status_ocsp_resp(ssl,staple)
  - Used by a server side to include OCSP staple in ServerHello.
  - Bugfix: SSL_OCSP_response_verify(ssl,rsp,svreq,flags): check that chain and last are not NULL
    before trying to use them.
  - Bugfix: inc/Module/Install/PRIVATE/Net/SSLeay.pm: Don’t quote include and lib paths.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...eay-perl_1.81.bb => libnet-ssleay-perl_1.84.bb} | 27 ++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.81.bb => libnet-ssleay-perl_1.84.bb} (65%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.81.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.84.bb
similarity index 65%
rename from meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.81.bb
rename to meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.84.bb
index a861b69e9..cfecef9cf 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.81.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.84.bb
@@ -11,27 +11,30 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=67d67095d83e339da538a082fad5f38e"
 
 DEPENDS = "openssl zlib openssl-native"
-RDEPENDS_${PN} += "perl-module-carp \
-                   perl-module-errno \
-                   perl-module-extutils-makemaker \
-                   perl-module-mime-base64 \
-                   perl-module-socket \
-                  "
+RDEPENDS_${PN} += "\
+    libssl \
+    libcrypto \
+    perl-module-carp \
+    perl-module-errno \
+    perl-module-extutils-makemaker \
+    perl-module-mime-base64 \
+    perl-module-socket \
+    zlib \
+"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "71932ce34d4db44de8d00399c3405792"
-SRC_URI[sha256sum] = "00cbb6174e628b42178e1445c9fd5a3c5ae2cfd6a5a43e03610ba14786f21b7d"
+SRC_URI[md5sum] = "cfbe968487149626978f427cc9fb8c77"
+SRC_URI[sha256sum] = "823ec3cbb428309d6a9e56f362a9300693ce3215b7fede109adb7be361fff177"
 
 S = "${WORKDIR}/Net-SSLeay-${PV}"
 
 inherit cpan ptest
 
-EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
-                   INC=-I=${STAGING_INCDIR} \
-                   '-lssl -lcrypto -lz' \
-                  "
+export OPENSSL_PREFIX="${STAGING_LIBDIR}"
+
+EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
 
 do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
-- 
2.13.6


