Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB1F78740
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:44:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 14:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="21169337"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2018 14:44:20 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:44:05 -0800
Message-Id: <2795e9093576924f8f9ffbc7d011652506eff71e.1516574387.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
References: <cover.1516574387.git.timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 05/12] libio-socket-ssl-perl: upgrade 1.997 -> 2.052
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
X-List-Received-Date: Sun, 21 Jan 2018 22:44:18 -0000

* Fix RDEPENDS

Changes:

2.052 2017/10/22
- disable NPN support if LibreSSL>=2.6.1 is detected since they've replaced the
  functions with dummies instead of removing NPN completly or setting
  OPENSSL_NO_NEXTPROTONEG
- t/01loadmodule.t shows more output helpful in debugging problems
- update fingerprints for extenal tests
- update documentation to make behavior of syswrite more clear
2.051 2017/09/05
- syswrite: if SSL_write sets SSL_ERROR_SYSCALL but no $! (as seen with
  OpenSSL 1.1.0 on Windows) set $! to EPIPE to propagate a useful error up
  https://github.com/noxxi/p5-io-socket-ssl/issues/62
2.050 2017/08/18
- removed unecessary settings of SSL_version and SSL_cipher_list from tests
- protocol_version.t can now deal when TLS 1.0 and/or TLS 1.1 are not supported
  as is the case with openssl versions in latest Debian (buster)
2.049 2017/06/12
- fixed problem caused by typo in the context of session cache
  https://github.com/noxxi/p5-io-socket-ssl/issues/60
- update PublicSuffix information from publicsuffix.org
2.048 2017/04/16
- fixed small memory leaks during destruction of socket and context, RT#120643
2.047 2017/02/16
- better fix for problem which 2.046 tried to fix but broke LWP this way
2.046 2017/02/15
- cleanup everything in DESTROY and make sure to start with a fresh %{*self}
  in configure_SSL because it can happen that a GLOB gets used again without
  calling DESTROY (https://github.com/noxxi/p5-io-socket-ssl/issues/56)
2.045 2017/02/13
- fixed memory leak caused by not destroying CREATED_IN_THIS_THREAD for SSL
  objects -> github pull#55
- optimization: don't track SSL objects and CTX in *CREATED_IN_THIS_THREAD
  if perl is compiled w/o thread support
- small fix in t/protocol_version.t to use older versions of Net::SSLeay
  with openssl build w/o SSLv3 support
- when setting SSL_keepSocketOnError to true the socket will not be closed
  on fatal error. This is a modified version of
  https://github.com/noxxi/p5-io-socket-ssl/pull/53/
2.044 2017/01/26
- protect various 'eval'-based capability detections at startup with a localized
  __DIE__ handler. This way dynamically requiring IO::Socket::SSL as done by
  various third party software should cause less problems even if there is a
  global __DIE__ handler which does not properly deal with 'eval'.
2.043 2017/01/06
- make t/session_ticket.t work with OpenSSL 1.1.0. With this version the
  session does not get reused any longer if it was not properly closed which
  is now done using an explicit close by the client which causes a
  proper SSL_shutdown
2.042 2017/01/05
- enable session ticket callback with Net::SSLeay>=1.80
2.041 2017/01/04
- leave session ticket callback off for now until the needed patch is
  included in Net::SSLeay. See
  https://rt.cpan.org/Ticket/Display.html?id=116118#txn-1696146
2.040 2016/12/17
- fix detection of default CA path for OpenSSL 1.1.x
- Utils::CERT_asHash now includes the signature algorithm used
- Utils::CERT_asHash can now deal with large serial numbers
2.039 2016/11/20
- OpenSSL 1.1.0c changed the behavior of SSL_read so that it now returns -1 on
  EOF without proper SSL shutdown. Since it looks like that this behavior will
  be kept at least for 1.1.1+ adapt to the changed API by treating errno=NOERR
  on SSL_ERROR_SYSCALL as EOF.
2.038 2016/09/17
- restrict session ticket callback to Net::SSLeay 1.79+ since version before
  contains bug. Add test for session reuse
- extend SSL fingerprint to pubkey digest, i.e. 'sha1$pub$xxxxxx....'
- fix t/external/ocsp.t to use different server (under my control) to check
  OCSP stapling
2.037 2016/08/22
- fix session cache del_session: it freed the session but did not properly
  remove it from the cache. Further reuse causes crash.
2.036 2016/08/11
- disable OCSP support when Net::SSLeay 1.75..1.77 is used, see RT#116795
2.035 2016/08/11
- fixes for issues introduced in 2.034
  - return with error in configure_SSL if context creation failed. This
    might otherwise result in a segmentation fault later.
  - apply builtin defaults before any (user configurable) global settings
    (i.e. done with set_defaults, set_default_context...) so that builtins
    don't replace user settings
    Thanks to joel[DOT]a[DOT]berger[AT]gmail[DOT]com for reporting
2.034 2016/08/08
- move handling of global SSL arguments into creation of context, so that these
  get also applied when creating a context only.
2.033 2016/07/15
- support for session ticket reuse over multiple contexts and processes
  (if supported by Net::SSLeay)
- small optimizations, like saving various Net::SSLeay constants into variables
  and access variables instead of calling the constant sub all the time
- make t/dhe.t work with openssl 1.1.0
2.032 2016/07/12
- Set session id context only on the server side. Even if the documentation for
  SSL_CTX_set_session_id_context makes clear that this function is server side
  only it actually affects hndling of session reuse on the client side too and
  can result in error "SSL3_GET_SERVER_HELLO:attempt to reuse session in
  different context" at the client.
2.031 2016/07/08
- fix for bug in session handling introduced in 2.031, RT#115975
  Thanks to paul[AT]city-fan[DOT]org for reporting
2.030 2016/07/08
- Utils::CERT_create - don't add given extensions again if they were already
  added. Firefox croaks with sec_error_extension_value_invalid if (specific?)
  extensions are given twice.
- assume that Net::SSLeay::P_PKCS12_load_file will return the CA certificates
  with the reverse order as in the PKCS12 file, because that's what it does.
- support for creating ECC keys in Utils once supported by Net::SSLeay
- remove internal sub session_cache and access cache directly (faster)
2.029 2016/06/26
- fix del_session method in case a single item was in the cache
- use SSL_session_key as the real key for the cache and not some derivate of it,
  so that it works to remove the entry using the same key
2.028 2016/06/26
- add del_session method to session cache
2.027 2016/04/20
- only added Changes for 2.026
2.026 2016/04/20
- update default server and client ciphers based on recommendation of
  Mozilla and what the current browsers use. Notably this finally disables
  RC4 for the client (was disabled for server long ago) and adds CHACHA20.
2.025 2016/04/04
- Resolved memleak if SSL_crl_file was used: RT#113257, RT#113530
  Thanks to avi[DOT]maslati[AT]forescout[DOT]com and
  mark[DOT]kurman[AT]gmail[DOT]com for reporting the problem
2.024 2016/02/06
- Work around issue where the connect fails on systems having only a loopback
  interface and where IO::Socket::IP is used as super class (default when
  available). Since IO::Socket::IP sets AI_ADDRCONFIG by default connect to
  localhost would fail on this systems. This happened at least for the tests,
  see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=813796
  Workaround is to explicitly set GetAddrInfoFlags to 0 if no GetAddrInfoFlags
  is set but the Family/Domain is given. In this case AI_ADDRCONFIG would not
  be useful anyway but would cause at most harm.
2.023 2016/01/30
- OpenSSL 1.0.2f changed the behavior of SSL shutdown in case the TLS connection
  was not fully established (commit: f73c737c7ac908c5d6407c419769123392a3b0a9).
  This somehow resulted in Net::SSLeay::shutdown returning 0 (i.e. keep trying)
  which caused an endless loop. It will now ignore this result in case the TLS
  connection was not yet established and consider the TLS connection closed
  instead.
2.022 2015/12/10
- fix stringification of IPv6 inside subjectAltNames in Utils::CERT_asHash.
  Thanks to Mark.Martinec[AT]ijs[DOT]si for reporting in #110253
2.021 2015/12/02
- Fixes for documentation and typos thanks to DavsX and jwilk.
- Update PublicSuffix with latest version from publicsuffix.org
2.020 2015/09/20
- support multiple directories in SSL_ca_path as proposed in RT#106711
  by dr1027[AT]evocat[DOT]ne. Directories can be given as array or as string
  with a path separator, see documentation.
- typos fixed thanks to jwilk https://github.com/noxxi/p5-io-socket-ssl/pull/34
2.019 2015/09/01
- work around different behavior of getnameinfo from Socket and Socket6 by
  using a different wrapper depending on which module I use for IPv6.
  Thanks to bluhm for reporting.
2.018 2015/08/27
- RT#106687 - startssl.t failed on darwin with old openssl since server
  requested client certificate but offered also anon ciphers
2.017 2015/08/24
- checks for readability of files/dirs for certificates and CA no longer use
  -r because this is not safe when ACLs are used. Thanks to BBYRD, RT#106295
- new method sock_certificate similar to peer_certificate based on idea of
  Paul Evans, RT#105733
- get_fingerprint can now take optional certificate as argument and compute
  the fingerprint of it. Useful in connection with sock_certificate.
- check for both EWOULDBLOCK and EAGAIN since these codes are different on
  some platforms. Thanks to Andy Grundman, RT#106573
- enforce default verification scheme if none was specified, i.e. no longer
  just warn but accept. If really no verification is wanted a scheme of
  'none' must be explicitly specified.
- support different cipher suites per SNI hosts
2.016 2015/06/02
- add flag X509_V_FLAG_TRUSTED_FIRST by default if available in OpenSSL
  (since 1.02) and available with Net::SSLeay. RT#104759 (thanks GAAS)
- work around hanging prompt() with older perl in Makefile.PL RT#104731
- make t/memleak_bad_handshake.t work on cygwin and other systems having
  /proc/pid/statm, see RT#104659
- add better debugging based on patch from H.Merijn Brand
2.015 2015/05/13
- work around problem with IO::Socket::INET6 on windows, by explicitly using
  Domain AF_INET in the tests.
  Fixes RT#104226 reported by CHORNY
2.014 2015/05/05
- Utils::CERT_create - work around problems with authorityInfoAccess, where
  OpenSSL i2v does not create the same string as v2i expects
- Intercept - don't clone some specific extensions which make only sense with
  the original certificate
2.013 2015/05/01
- assign severities to internal error handling and make sure that follow-up
  errors like "configuration failed" or "certificate verify error" don't
  replace more specific "hostname verification failed" when reporting in
  sub errstr/$SSL_ERROR. see also RT#103423
- enhanced documentation thanks to Chase Whitener
  https://github.com/noxxi/p5-io-socket-ssl/pull/26
2.012 2015/02/02
- fix t/ocsp.t in case no HTTP::Tiny is installed
2.011 2015/02/01
- fix t/ocsp.t - don't count on revoked.grc.com using OCSP stapling #101855
- added option 'purpose' to Utils::CERT_create to get better control of the
  certificates purpose. Default is 'server,client' for non-CA (contrary to
  only 'server' before)
- removed RC4 from default cipher suites on the server site
  https://github.com/noxxi/p5-io-socket-ssl/issues/22
- refactoring of some tests using Test::More thanks to Sweet-kid and the
  2015 Pull Request Challenge
2.010 2015/01/14
- new options SSL_client_ca_file and SSL_client_ca to let the server send
  the list of acceptable CAs for the client certificate.
- t/protocol_version.t - fix in case SSLv3 is not supported in Net::SSLeay.
  RT#101485, thanks to TEAM.
2.009 2015/01/12
- remove util/analyze.pl. This tool is now together with other SSL tools in
  https://github.com/noxxi/p5-ssl-tools
- added ALPN support (needs OpenSSL1.02, Net::SSLeay 1.56+) thanks to TEAM,
  RT#101452
2.008 2014/12/16
- work around recent OCSP verification errors for revoked.grc.com (badly signed
  OCSP response, Firefox also complains about it) in test t/external/ocsp.t.
- util/analyze.pl - report more details about preferred cipher for specific TLS
  versions
2.007 2014/11/26
- make getline/readline fall back to super class if class is not sslified yet,
  i.e. behave the same as sysread, syswrite etc.
  This fixes RT#100529
2.006 2014/11/22
- Make (hopefully) non-blocking work on windows by using EWOULDBLOCK instead of
  EAGAIN. While this is the same on UNIX it is different on Windows and socket
  operations return there (WSA)EWOULDBLOCK and not EAGAIN. Enable non-blocking
  tests on Windows too.
- make PublicSuffix::_default_data thread safe
- update PublicSuffix with latest list from publicsuffix.org
2.005 2014/11/15
- next try to fix t/protocol_version.t for OpenSSL w/o SSLv3 support
2.004 2014/11/15
- only test fix: fix t/protocol_version.t to deal with OpenSSL installations
  which are compiled without SSLv3 support.
2.003 2014/11/14
- make SSLv3 available even if the SSL library disables it by default in
  SSL_CTX_new (like done in LibreSSL). Default will stay to disable SSLv3,
  so this will be only done when setting SSL_version explicitly.
- fix possible segmentation fault when trying to use an invalid certificate,
  reported by Nick Andrew.
- Use only the ICANN part of the default public suffix list and not the
  private domains. This makes existing exceptions for s3.amazonaws.com and
  googleapis.com obsolete. Thanks to Gervase Markham from mozilla.org.
2.002 2014/10/21
- fix check for (invalid) IPv4 when validating hostname against certificate. Do
  not use inet_aton any longer because it can cause DNS lookups for malformed
  IP. RT#99448, thanks to justincase[AT]yopmail[DOT]com.
- Update PublicSuffix with latest version from publicsuffix.org - lots of new
  top level domains.
- Add exception to PublicSuffix for s3.amazonaws.com - RT#99702, thanks to
  cpan[AT]cpanel[DOT]net.
2.001 2014/10/21
- Add SSL_OP_SINGLE_(DH|ECDH)_USE to default options to increase PFS security.
  Thanks to Heikki Vatiainen for suggesting.
- Update external tests with currently expected fingerprints of hosts.
- Some fixes to make it still work on 5.8.1.
2.000 2014/10/15
- consider SSL3.0 as broken because of POODLE and disable it by default.
- Skip live tests without asking if environment NO_NETWORK_TESTING is set.
  Thanks to ntyni[AT]debian[DOT]org for suggestion.
- skip tests which require fork on non-default windows setups without proper
  fork. Thanks to SHAY for https://github.com/noxxi/p5-io-socket-ssl/pull/18
1.999 2014/10/09
- make sure we don't use version 0.30 of IO::Socket::IP
- make sure that PeerHost is checked on all places where PeerAddr is
  checked, because these are synonyms and IO::Socket::IP prefers PeerHost
  while others prefer PeerAddr. Also accept PeerService additionally to
  PeerPort.
  See https://github.com/noxxi/p5-io-socket-ssl/issues/16 for details.
- add ability to use client certificates and to overwrite hostname with
  util/analyze-ssl.pl.
1.998 2014/09/07
- make client authentication work at the server side when SNI is in by use
  having CA path and other settings in all SSL contexts instead of only the main
  one.  Based on code from lundstrom[DOT]jerry[AT]gmail[DOT]com,
  https://github.com/noxxi/p5-io-socket-ssl/pull/15

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...cket-ssl-perl_1.997.bb => libio-socket-ssl-perl_2.052.bb} | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_1.997.bb => libio-socket-ssl-perl_2.052.bb} (82%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.052.bb
similarity index 82%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.052.bb
index ba5788a01..e4fc49344 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.052.bb
@@ -12,13 +12,18 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0|GPLv1+"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
-RDEPENDS_${PN} += "perl-module-scalar-util libnet-ssleay-perl"
+RDEPENDS_${PN} += "\
+    libnet-ssleay-perl \
+    perl-module-autoloader \
+    perl-module-scalar-util \
+    perl-module-io-socket \
+"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "2a6268bb42da81e69d1c1feb2fcb0eea"
-SRC_URI[sha256sum] = "acdb67b5b63aea5b7e70c3e4c70a16128810329592b63753a38c794aff76a1dd"
+SRC_URI[md5sum] = "26c9bcdfb4ba8763ef89264f21326a48"
+SRC_URI[sha256sum] = "e4897a9b17cb18a3c44aa683980d52cef534cdfcb8063d6877c879bfa2f26673"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
@@ -32,7 +37,6 @@ do_install_append () {
     cp -pRP ${S}/docs ${D}${docdir}/${PN}/
     cp -pRP ${S}/certs ${D}${docdir}/${PN}/
     cp -pRP ${S}/example ${D}${docdir}/${PN}/
-    cp -pRP ${S}/util ${D}${docdir}/${PN}/
 }
 
 do_install_ptest () {
-- 
2.13.6


