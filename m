Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59EDA71A3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 06:34:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9O6YxQN012857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2016 23:34:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 23 Oct 2016 23:34:58 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Oct 2016 14:35:04 +0800
Message-ID: <1477290904-11557-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1477290904-11557-1-git-send-email-Qi.Chen@windriver.com>
References: <1477290904-11557-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] rsyslog: upgrade to 8.22.0
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
X-List-Received-Date: Mon, 24 Oct 2016 06:34:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

enable_tls_ptests.patch is removed as the problem has been fixed in new version.

fix_build_with_musl.patch is removed as it's no longer suitable.
The file it fixes is not even there any more.

Several necessary runtime dependencies are added to rsyslog-ptest.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...include-config.h-before-any-other-headers.patch |  51 ------
 .../rsyslog/rsyslog/enable_tls_ptests.patch        |  28 ----
 .../rsyslog/rsyslog/fix_build_with_musl.patch      |  62 -------
 .../rsyslog/rsyslog/json-0.12-fix.patch            |  47 ------
 .../replace_deprecated_GnuTLS_functions.patch      |  73 ---------
 ...icate_type_set_priority_only_if_available.patch |  79 ---------
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb  | 180 ---------------------
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb | 172 ++++++++++++++++++++
 8 files changed, 172 insertions(+), 520 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch
deleted file mode 100644
index 1048b42..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Backport below commit for fixing:
-
-lexer.l:34:14: error: expected identifier or '(' before '__extension__'
-
-From 876bdd1c85353f7e254f4b4c3e228484860cea57 Mon Sep 17 00:00:00 2001
-From: Tomas Heinrich <theinric@redhat.com>
-Date: Mon, 17 Nov 2014 20:53:22 +0100
-Subject: [PATCH] bugfix: include config.h before any other headers
-
-For some reason, flex used to prepend several standard headers before
-config.h. This prevented some conditional extension in these headers
-from being defined.
-
-The explicit prototype for strdup() shouldn't be required anymore as
-it should be provided by string.h.
-
-Upstream-Status: Backport
----
- grammar/lexer.l | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/grammar/lexer.l b/grammar/lexer.l
-index 359cf9f..c834ef7 100644
---- a/grammar/lexer.l
-+++ b/grammar/lexer.l
-@@ -28,10 +28,12 @@
-   * limitations under the License.
-   */
- 
--%{
-+%top{
- #include "config.h"
-+}
-+
-+%{
- #include "parserif.h"
--extern char *strdup(__const char*); /* somehow we may not get this from string.h... */
- %}
- 
- %option noyywrap nodefault case-insensitive yylineno
-@@ -67,6 +69,7 @@ extern char *strdup(__const char*); /* somehow we may not get this from string.h
- #include <ctype.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <strings.h>
- #include <libestr.h>
- #include "rainerscript.h"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch
deleted file mode 100644
index c858f32..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Enable tls ptest
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
---- rsyslog-7.4.4/tests/Makefile.am.orig	2013-08-30 18:30:41.000000000 +0200
-+++ rsyslog-7.4.4/tests/Makefile.am	2015-10-01 09:38:45.176289031 +0200
-@@ -118,15 +118,13 @@
- endif
- 
- if ENABLE_GNUTLS
--# TODO: re-enable in newer version
--#TESTS +=  \
--	#sndrcv_tls_anon.sh \
--	#sndrcv_tls_anon_rebind.sh \
--	#imtcp-tls-basic.sh
-+TESTS +=  \
-+	 imtcp-tls-basic.sh \
-+	 imtcp_conndrop_tls.sh
- if HAVE_VALGRIND
- TESTS += imtcp-tls-basic-vg.sh \
--	 imtcp_conndrop_tls-vg.sh 
--	 manytcp-too-few-tls-vg.sh 
-+	 imtcp_conndrop_tls-vg.sh \
-+	 manytcp-too-few-tls.sh
- endif
- endif
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
deleted file mode 100644
index db35db0..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/fix_build_with_musl.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b6cc506b6ad0b5dd9aa9831ed42e6759183aaf45 Mon Sep 17 00:00:00 2001
-From: Peter Liu <peter.x.liu@external.atlascopco.com>
-Date: Mon, 26 Sep 2016 17:03:57 +0200
-Subject: [PATCH] fix building with musl libc
-
-- struct timeval is defined in sys/time.h with a musl libc.
-- include fcntl.h without the conditional checking.
-
-Upstream-Status: Pending
-
-Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
----
- tests/msleep.c  | 2 +-
- tools/omfile.c  | 4 +---
- tools/pidfile.c | 2 --
- 3 files changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/tests/msleep.c b/tests/msleep.c
-index 36fa01b..ca818be 100644
---- a/tests/msleep.c
-+++ b/tests/msleep.c
-@@ -26,7 +26,7 @@
- #include "config.h"
- #include <stdio.h>
- #include <stdlib.h>
--#include <time.h>
-+#include <sys/time.h>
- 
- int main(int argc, char *argv[])
- {
-diff --git a/tools/omfile.c b/tools/omfile.c
-index 11eab56..765ef91 100644
---- a/tools/omfile.c
-+++ b/tools/omfile.c
-@@ -48,9 +48,7 @@
- #include <libgen.h>
- #include <unistd.h>
- #include <sys/file.h>
--#ifdef OS_SOLARIS
--#	include <fcntl.h>
--#endif
-+#include <fcntl.h>
- #ifdef HAVE_ATOMIC_BUILTINS
- #	include <pthread.h>
- #endif
-diff --git a/tools/pidfile.c b/tools/pidfile.c
-index 8298b94..188cca4 100644
---- a/tools/pidfile.c
-+++ b/tools/pidfile.c
-@@ -36,9 +36,7 @@
- #include <string.h>
- #include <errno.h>
- #include <signal.h>
--#ifdef __sun
- #include <fcntl.h>
--#endif
- 
- #include "srUtils.h"
- 
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
deleted file mode 100644
index 3dd85a7..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-json-c-0.12 unlike 0.11 doesn't install json -> json-c symlink in include
-
-* Resolved in Version 7.6.4 [v7.6-stable] 2014-09-12
-  https://github.com/rsyslog/rsyslog/blob/v7-stable/ChangeLog
-* permits to build against json-c 0.12
-  Unfortunately, json-c had an ABI breakage, so this is necessary. Note
-  that versions prior to 0.12 had security issues (CVE-2013-6370,
-  CVE-2013-6371) and so it is desirable to link against the new version.
-  Thanks to Thomas D. for the patch. Note that at least some distros
-  have fixed the security issue in older versions of json-c, so this
-  seems to apply mostly when building from sources.
-
-Upstream-Status: Backport
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff --git a/plugins/ommongodb/ommongodb.c b/plugins/ommongodb/ommongodb.c
-index 41c0d76..682c40e 100644
---- a/plugins/ommongodb/ommongodb.c
-+++ b/plugins/ommongodb/ommongodb.c
-@@ -33,9 +33,9 @@
- #include <stdint.h>
- #include <time.h>
- #include <mongo.h>
--#include <json.h>
-+#include <json-c/json.h>
- /* For struct json_object_iter, should not be necessary in future versions */
--#include <json_object_private.h>
-+#include <json-c/json_object_private.h>
- 
- #include "rsyslog.h"
- #include "conf.h"
-diff --git a/runtime/msg.c b/runtime/msg.c
-index d04ce7b..b367e1f 100644
---- a/runtime/msg.c
-+++ b/runtime/msg.c
-@@ -41,9 +41,9 @@
- #endif
- #include <netdb.h>
- #include <libestr.h>
--#include <json.h>
-+#include <json-c/json.h>
- /* For struct json_object_iter, should not be necessary in future versions */
--#include <json_object_private.h>
-+#include <json-c/json_object_private.h>
- #if HAVE_MALLOC_H
- #  include <malloc.h>
- #endif
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch
deleted file mode 100644
index be05eee..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-replace deprecated GnuTLS functions with newer ones if available
-
-closes https://github.com/rsyslog/rsyslog/issues/302
-
-Upstream fix https://github.com/rsyslog/rsyslog/commit/b34c35e38f258935c0e92ca754da097d7f3f0f58
-
-Upstream-Status: Backport
-Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
-
----
- configure.ac       |  2 ++
- runtime/nsd_gtls.c | 21 ++++++++++++++++++---
- 2 files changed, 20 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 643fc94..56835fb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -763,6 +763,8 @@ AC_ARG_ENABLE(gnutls,
- if test "x$enable_gnutls" = "xyes"; then
- 	PKG_CHECK_MODULES(GNUTLS, gnutls >= 1.4.0)
- 	AC_DEFINE([ENABLE_GNUTLS], [1], [Indicator that GnuTLS is present])
-+        AC_CHECK_LIB(gnutls, gnutls_global_init)
-+	AC_CHECK_FUNCS(gnutls_certificate_set_retrieve_function,,)
- fi
- AM_CONDITIONAL(ENABLE_GNUTLS, test x$enable_gnutls = xyes)
- 
-diff --git a/runtime/nsd_gtls.c b/runtime/nsd_gtls.c
-index a763e4b..e127834 100644
---- a/runtime/nsd_gtls.c
-+++ b/runtime/nsd_gtls.c
-@@ -232,15 +232,26 @@ gtlsLoadOurCertKey(nsd_gtls_t *pThis)
-  */
- static int
- gtlsClientCertCallback(gnutls_session session,
--              __attribute__((unused)) const gnutls_datum* req_ca_rdn, int __attribute__((unused)) nreqs,
--              __attribute__((unused)) const gnutls_pk_algorithm* sign_algos, int __attribute__((unused)) sign_algos_length,
--              gnutls_retr_st *st)
-+        __attribute__((unused)) const gnutls_datum* req_ca_rdn,
-+	int __attribute__((unused)) nreqs,
-+        __attribute__((unused)) const gnutls_pk_algorithm* sign_algos,
-+	int __attribute__((unused)) sign_algos_length,
-+#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
-+	gnutls_retr2_st* st
-+#else
-+        gnutls_retr_st *st
-+#endif
-+	)
- {
- 	nsd_gtls_t *pThis;
- 
- 	pThis = (nsd_gtls_t*) gnutls_session_get_ptr(session);
- 
-+#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
-+	st->cert_type = GNUTLS_CRT_X509;
-+#else
- 	st->type = GNUTLS_CRT_X509;
-+#endif
- 	st->ncerts = 1;
- 	st->cert.x509 = &pThis->ourCert;
- 	st->key.x509 = pThis->ourKey;
-@@ -1625,7 +1625,11 @@ Connect(nsd_t *pNsd, int family, uchar *port, uchar *host)
- 	gnutls_session_set_ptr(pThis->sess, (void*)pThis);
- 	iRet = gtlsLoadOurCertKey(pThis); /* first load .pem files */
- 	if(iRet == RS_RET_OK) {
-+#		if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION 
-+		gnutls_certificate_set_retrieve_function(xcred, gtlsClientCertCallback);
-+#		else
- 		gnutls_certificate_client_set_retrieve_function(xcred, gtlsClientCertCallback);
-+#	endif
- 	} else if(iRet != RS_RET_CERTLESS) {
- 		FINALIZE; /* we have an error case! */
- 	}
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch
deleted file mode 100644
index e1dab75..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 21674039db99d1067e9df4df04d965297d62c6af Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Mon, 18 May 2015 09:36:02 +0200
-Subject: [PATCH] use gnutls_certificate_type_set_priority() only if available
-
-The gnutls_certificate_type_set_priority function is deprecated
-and not available in recent GnuTLS versions. However, there is no
-doc how to properly replace it with gnutls_priority_set_direct.
-A lot of folks have simply removed it, when they also called
-gnutls_set_default_priority. This is what we now also do. If
-this causes problems or someone has an idea of how to replace
-the deprecated function in a better way, please let us know!
-In any case, we use it as long as it is available and let
-not insult us by the deprecation warnings.
-
-Upstream-Status: Backport
-Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
-
----
- configure.ac       |  1 +
- runtime/nsd_gtls.c | 18 ++++++++++++++++--
- 2 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 56835fb..1c2be01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -765,6 +765,7 @@ if test "x$enable_gnutls" = "xyes"; then
- 	AC_DEFINE([ENABLE_GNUTLS], [1], [Indicator that GnuTLS is present])
-         AC_CHECK_LIB(gnutls, gnutls_global_init)
- 	AC_CHECK_FUNCS(gnutls_certificate_set_retrieve_function,,)
-+	AC_CHECK_FUNCS(gnutls_certificate_type_set_priority,,)
- fi
- AM_CONDITIONAL(ENABLE_GNUTLS, test x$enable_gnutls = xyes)
- 
-diff --git a/runtime/nsd_gtls.c b/runtime/nsd_gtls.c
-index e127834..4b6aab1 100644
---- a/runtime/nsd_gtls.c
-+++ b/runtime/nsd_gtls.c
-@@ -1658,8 +1658,9 @@ Connect(nsd_t *pNsd, int family, uchar *port, uchar *host)
- 	nsd_gtls_t *pThis = (nsd_gtls_t*) pNsd;
- 	int sock;
- 	int gnuRet;
--	/* TODO: later? static const int cert_type_priority[3] = { GNUTLS_CRT_X509, GNUTLS_CRT_OPENPGP, 0 };*/
-+#	if HAVE_GNUTLS_CERTIFICATE_TYPE_SET_PRIORITY
- 	static const int cert_type_priority[2] = { GNUTLS_CRT_X509, 0 };
-+#	endif
- 	DEFiRet;
- 
- 	ISOBJ_TYPE_assert(pThis, nsd_gtls);
-@@ -1688,14 +1689,27 @@ Connect(nsd_t *pNsd, int family, uchar *port, uchar *host)
- 		gnutls_certificate_set_retrieve_function(xcred, gtlsClientCertCallback);
- #		else
- 		gnutls_certificate_client_set_retrieve_function(xcred, gtlsClientCertCallback);
--#	endif
-+#		endif
- 	} else if(iRet != RS_RET_CERTLESS) {
- 		FINALIZE; /* we have an error case! */
- 	}
- 
- 	/* Use default priorities */
- 	CHKgnutls(gnutls_set_default_priority(pThis->sess));
-+#	if HAVE_GNUTLS_CERTIFICATE_TYPE_SET_PRIORITY
-+	/* The gnutls_certificate_type_set_priority function is deprecated
-+	 * and not available in recent GnuTLS versions. However, there is no
-+	 * doc how to properly replace it with gnutls_priority_set_direct.
-+	 * A lot of folks have simply removed it, when they also called
-+	 * gnutls_set_default_priority. This is what we now also do. If
-+	 * this causes problems or someone has an idea of how to replace
-+	 * the deprecated function in a better way, please let us know!
-+	 * In any case, we use it as long as it is available and let
-+	 * not insult us by the deprecation warnings.
-+	 * 2015-05-18 rgerhards
-+	 */
- 	CHKgnutls(gnutls_certificate_type_set_priority(pThis->sess, cert_type_priority));
-+#	endif
- 
- 	/* put the x509 credentials to the current session */
- 	CHKgnutls(gnutls_credentials_set(pThis->sess, GNUTLS_CRD_CERTIFICATE, xcred));
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
deleted file mode 100644
index 38bbe9c..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
+++ /dev/null
@@ -1,180 +0,0 @@
-SUMMARY = "Rsyslog is an enhanced multi-threaded syslogd"
-DESCRIPTION = "\
-Rsyslog is an enhanced syslogd supporting, among others, MySQL,\
- PostgreSQL, failover log destinations, syslog/tcp, fine grain\
- output format control, high precision timestamps, queued operations\
- and the ability to filter on any message part. It is quite\
- compatible to stock sysklogd and can be used as a drop-in replacement.\
- Its advanced features make it suitable for enterprise-class,\
- encryption protected syslog relay chains while at the same time being\
- very easy to setup for the novice user."
-
-DEPENDS = "zlib libestr json-c bison-native flex-native liblogging"
-HOMEPAGE = "http://www.rsyslog.com/"
-LICENSE = "GPLv3 & LGPLv3 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
-                    file://COPYING.LESSER;md5=cb7903f1e5c39ae838209e130dca270a \
-                    file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
-"
-
-SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.tar.gz \
-           file://initscript \
-           file://rsyslog.conf \
-           file://rsyslog.logrotate \
-           file://use-pkgconfig-to-check-libgcrypt.patch \
-           file://run-ptest \
-           file://rsyslog-fix-ptest-not-finish.patch \
-           file://json-0.12-fix.patch \
-           file://replace_deprecated_GnuTLS_functions.patch \
-           file://use_gnutls_certificate_type_set_priority_only_if_available.patch \
-           file://bugfix-include-config.h-before-any-other-headers.patch \
-           file://enable_tls_ptests.patch \
-           file://fix_build_with_musl.patch \
-"
-
-SRC_URI[md5sum] = "fa78a6e675fe78a811edcdf7eb6f1975"
-SRC_URI[sha256sum] = "fc29d2d9cbf3396091dd0bab2eb6f847aed4a44ef73138a97ddf9447446125ee"
-
-inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
-
-EXTRA_OECONF += "--disable-generate-man-pages"
-
-# first line is default yes in configure
-PACKAGECONFIG ??= " \
-    zlib rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
-    imdiag gnutls imfile \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench ${VALGRIND}', '', d)} \
-"
-
-# default yes in configure
-PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
-PACKAGECONFIG[rsyslogd] = "--enable-rsyslogd,--disable-rsyslogd,,"
-PACKAGECONFIG[rsyslogrt] = "--enable-rsyslogrt,--disable-rsyslogrt,,"
-PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,,"
-PACKAGECONFIG[klog] = "--enable-klog,--disable-klog,,"
-PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,,"
-PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
-PACKAGECONFIG[libgcrypt] = "--enable-libgcrypt,--disable-libgcrypt,libgcrypt,"
-PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
-
-# default no in configure
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
-PACKAGECONFIG[imdiag] = "--enable-imdiag,--disable-imdiag,,"
-PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
-PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
-PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
-PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
-PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
-PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
-PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
-PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
-PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
-
-TESTDIR = "tests"
-do_compile_ptest() {
-    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
-    oe_runmake -C ${TESTDIR} buildtest-TESTS
-}
-
-do_install_ptest() {
-    # install the tests
-    cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
-    cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
-
-    # do NOT need to rebuild Makefile itself
-    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-
-    # fix the srcdir, top_srcdir
-    sed -i 's,^\(srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-    sed -i 's,^\(top_srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-
-    # valgrind is not compatible with arm and mips,
-    # so remove related test cases if there is no valgrind.
-    if [ x${VALGRIND} = x ]; then
-        sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-    fi
-
-    # install test-driver
-    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}/${TESTDIR}
-
-    # install necessary links
-    install -d ${D}${PTEST_PATH}/tools
-    ln -sf ${sbindir}/rsyslogd ${D}${PTEST_PATH}/tools/rsyslogd
-
-    install -d ${D}${PTEST_PATH}/runtime
-    install -d ${D}${PTEST_PATH}/runtime/.libs
-    (
-        cd ${D}/${libdir}/rsyslog
-        allso="*.so"
-        for i in $allso; do
-            ln -sf ${libdir}/rsyslog/$i ${D}${PTEST_PATH}/runtime/.libs/$i
-        done
-    )
-
-    # fix the module load path with runtime/.libs
-    find ${D}${PTEST_PATH}/${TESTDIR} -name \*.conf -exec \
-        sed -i -e 's:../plugins/.*/.libs/:../runtime/.libs/:' \
-        '{}' \;
-}
-
-do_install_append() {
-    install -d "${D}${sysconfdir}/init.d"
-    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog.${BPN}
-    install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
-    install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.rsyslog
-}
-
-FILES_${PN} += "${bindir}"
-
-INITSCRIPT_NAME = "syslog"
-INITSCRIPT_PARAMS = "defaults"
-
-# higher than sysklogd's 100
-ALTERNATIVE_PRIORITY = "110"
-
-ALTERNATIVE_${PN} = "syslogd syslog-conf syslog-logrotate"
-
-ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
-ALTERNATIVE_TARGET[syslogd] = "${sbindir}/rsyslogd"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
-ALTERNATIVE_TARGET[syslog-conf] = "${sysconfdir}/rsyslog.conf"
-ALTERNATIVE_LINK_NAME[syslog-logrotate] = "${sysconfdir}/logrotate.d/syslog"
-ALTERNATIVE_TARGET[syslog-logrotate] = "${sysconfdir}/logrotate.rsyslog"
-
-CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-
-RDEPENDS_${PN} += "logrotate"
-
-# for rsyslog-ptest
-VALGRIND = "valgrind"
-VALGRIND_mips = ""
-VALGRIND_mips64 = ""
-VALGRIND_mips64n32 = ""
-VALGRIND_arm = ""
-VALGRIND_aarch64 = ""
-RDEPENDS_${PN}-ptest += "make diffutils gzip"
-RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
-
-# no syslog-init for systemd
-python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        sysconfdir = d.getVar('sysconfdir', True)
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
-
-    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        pn = d.getVar('PN', True)
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
-}
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
new file mode 100644
index 0000000..7242323
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -0,0 +1,172 @@
+SUMMARY = "Rsyslog is an enhanced multi-threaded syslogd"
+DESCRIPTION = "\
+Rsyslog is an enhanced syslogd supporting, among others, MySQL,\
+ PostgreSQL, failover log destinations, syslog/tcp, fine grain\
+ output format control, high precision timestamps, queued operations\
+ and the ability to filter on any message part. It is quite\
+ compatible to stock sysklogd and can be used as a drop-in replacement.\
+ Its advanced features make it suitable for enterprise-class,\
+ encryption protected syslog relay chains while at the same time being\
+ very easy to setup for the novice user."
+
+DEPENDS = "zlib libestr libfastjson bison-native flex-native liblogging"
+HOMEPAGE = "http://www.rsyslog.com/"
+LICENSE = "GPLv3 & LGPLv3 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
+                    file://COPYING.LESSER;md5=cb7903f1e5c39ae838209e130dca270a \
+                    file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
+"
+
+SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.tar.gz \
+           file://initscript \
+           file://rsyslog.conf \
+           file://rsyslog.logrotate \
+           file://use-pkgconfig-to-check-libgcrypt.patch \
+           file://run-ptest \
+           file://rsyslog-fix-ptest-not-finish.patch \
+"
+
+SRC_URI[md5sum] = "ad0f25f429aa2daa326732950a5eeb6c"
+SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca"
+
+inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
+
+EXTRA_OECONF += "--disable-generate-man-pages"
+
+# first line is default yes in configure
+PACKAGECONFIG ??= " \
+    rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
+    imdiag gnutls imfile \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench relp ${VALGRIND}', '', d)} \
+"
+
+# default yes in configure
+PACKAGECONFIG[relp] = "--enable-relp,--disable-relp,librelp,"
+PACKAGECONFIG[rsyslogd] = "--enable-rsyslogd,--disable-rsyslogd,,"
+PACKAGECONFIG[rsyslogrt] = "--enable-rsyslogrt,--disable-rsyslogrt,,"
+PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,,"
+PACKAGECONFIG[klog] = "--enable-klog,--disable-klog,,"
+PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,,"
+PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
+PACKAGECONFIG[libgcrypt] = "--enable-libgcrypt,--disable-libgcrypt,libgcrypt,"
+PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
+
+# default no in configure
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
+PACKAGECONFIG[imdiag] = "--enable-imdiag,--disable-imdiag,,"
+PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
+PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
+PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
+PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
+PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
+
+TESTDIR = "tests"
+do_compile_ptest() {
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    # install the tests
+    cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
+    cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
+
+    # do NOT need to rebuild Makefile itself
+    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+
+    # fix the srcdir, top_srcdir
+    sed -i 's,^\(srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+    sed -i 's,^\(top_srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+
+    # valgrind is not compatible with arm and mips,
+    # so remove related test cases if there is no valgrind.
+    if [ x${VALGRIND} = x ]; then
+        sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+    fi
+
+    # install test-driver
+    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
+
+    # install necessary links
+    install -d ${D}${PTEST_PATH}/tools
+    ln -sf ${sbindir}/rsyslogd ${D}${PTEST_PATH}/tools/rsyslogd
+
+    install -d ${D}${PTEST_PATH}/runtime
+    install -d ${D}${PTEST_PATH}/runtime/.libs
+    (
+        cd ${D}/${libdir}/rsyslog
+        allso="*.so"
+        for i in $allso; do
+            ln -sf ${libdir}/rsyslog/$i ${D}${PTEST_PATH}/runtime/.libs/$i
+        done
+    )
+
+    # fix the module load path with runtime/.libs
+    find ${D}${PTEST_PATH}/${TESTDIR} -name "*.conf" -o -name "*.sh" -o -name "*.c" | xargs \
+        sed -i -e 's:../plugins/.*/.libs/:../runtime/.libs/:g'
+}
+
+do_install_append() {
+    install -d "${D}${sysconfdir}/init.d"
+    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog.${BPN}
+    install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
+    install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.rsyslog
+}
+
+FILES_${PN} += "${bindir}"
+
+INITSCRIPT_NAME = "syslog"
+INITSCRIPT_PARAMS = "defaults"
+
+# higher than sysklogd's 100
+ALTERNATIVE_PRIORITY = "110"
+
+ALTERNATIVE_${PN} = "syslogd syslog-conf syslog-logrotate"
+
+ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
+ALTERNATIVE_TARGET[syslogd] = "${sbindir}/rsyslogd"
+ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
+ALTERNATIVE_TARGET[syslog-conf] = "${sysconfdir}/rsyslog.conf"
+ALTERNATIVE_LINK_NAME[syslog-logrotate] = "${sysconfdir}/logrotate.d/syslog"
+ALTERNATIVE_TARGET[syslog-logrotate] = "${sysconfdir}/logrotate.rsyslog"
+
+CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
+RDEPENDS_${PN} += "logrotate"
+
+# for rsyslog-ptest
+VALGRIND = "valgrind"
+VALGRIND_mips = ""
+VALGRIND_mips64 = ""
+VALGRIND_mips64n32 = ""
+VALGRIND_arm = ""
+VALGRIND_aarch64 = ""
+RDEPENDS_${PN}-ptest += "make diffutils gzip bash gawk coreutils procps"
+RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
+
+# no syslog-init for systemd
+python () {
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        pn = d.getVar('PN', True)
+        sysconfdir = d.getVar('sysconfdir', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        pn = d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
+}
-- 
1.9.1


