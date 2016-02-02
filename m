Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 1028377209
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:48:02 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Tue, 2 Feb 2016
	14:47:58 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id D774A28BA23;
	Tue,  2 Feb 2016 14:47:58 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Feb 2016 14:47:57 +0100
Message-ID: <1454420878-29968-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/2] [meta-oe] rsyslog: avoid deprecated GnuTLS functions
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
X-List-Received-Date: Tue, 02 Feb 2016 13:48:04 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../replace_deprecated_GnuTLS_functions.patch      | 73 ++++++++++++++++++++
 ...icate_type_set_priority_only_if_available.patch | 79 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |  5 +-
 3 files changed, 154 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch
new file mode 100644
index 0000000..be05eee
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/replace_deprecated_GnuTLS_functions.patch
@@ -0,0 +1,73 @@
+replace deprecated GnuTLS functions with newer ones if available
+
+closes https://github.com/rsyslog/rsyslog/issues/302
+
+Upstream fix https://github.com/rsyslog/rsyslog/commit/b34c35e38f258935c0e92ca754da097d7f3f0f58
+
+Upstream-Status: Backport
+Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
+
+---
+ configure.ac       |  2 ++
+ runtime/nsd_gtls.c | 21 ++++++++++++++++++---
+ 2 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 643fc94..56835fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -763,6 +763,8 @@ AC_ARG_ENABLE(gnutls,
+ if test "x$enable_gnutls" = "xyes"; then
+ 	PKG_CHECK_MODULES(GNUTLS, gnutls >= 1.4.0)
+ 	AC_DEFINE([ENABLE_GNUTLS], [1], [Indicator that GnuTLS is present])
++        AC_CHECK_LIB(gnutls, gnutls_global_init)
++	AC_CHECK_FUNCS(gnutls_certificate_set_retrieve_function,,)
+ fi
+ AM_CONDITIONAL(ENABLE_GNUTLS, test x$enable_gnutls = xyes)
+ 
+diff --git a/runtime/nsd_gtls.c b/runtime/nsd_gtls.c
+index a763e4b..e127834 100644
+--- a/runtime/nsd_gtls.c
++++ b/runtime/nsd_gtls.c
+@@ -232,15 +232,26 @@ gtlsLoadOurCertKey(nsd_gtls_t *pThis)
+  */
+ static int
+ gtlsClientCertCallback(gnutls_session session,
+-              __attribute__((unused)) const gnutls_datum* req_ca_rdn, int __attribute__((unused)) nreqs,
+-              __attribute__((unused)) const gnutls_pk_algorithm* sign_algos, int __attribute__((unused)) sign_algos_length,
+-              gnutls_retr_st *st)
++        __attribute__((unused)) const gnutls_datum* req_ca_rdn,
++	int __attribute__((unused)) nreqs,
++        __attribute__((unused)) const gnutls_pk_algorithm* sign_algos,
++	int __attribute__((unused)) sign_algos_length,
++#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
++	gnutls_retr2_st* st
++#else
++        gnutls_retr_st *st
++#endif
++	)
+ {
+ 	nsd_gtls_t *pThis;
+ 
+ 	pThis = (nsd_gtls_t*) gnutls_session_get_ptr(session);
+ 
++#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
++	st->cert_type = GNUTLS_CRT_X509;
++#else
+ 	st->type = GNUTLS_CRT_X509;
++#endif
+ 	st->ncerts = 1;
+ 	st->cert.x509 = &pThis->ourCert;
+ 	st->key.x509 = pThis->ourKey;
+@@ -1625,7 +1625,11 @@ Connect(nsd_t *pNsd, int family, uchar *port, uchar *host)
+ 	gnutls_session_set_ptr(pThis->sess, (void*)pThis);
+ 	iRet = gtlsLoadOurCertKey(pThis); /* first load .pem files */
+ 	if(iRet == RS_RET_OK) {
++#		if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION 
++		gnutls_certificate_set_retrieve_function(xcred, gtlsClientCertCallback);
++#		else
+ 		gnutls_certificate_client_set_retrieve_function(xcred, gtlsClientCertCallback);
++#	endif
+ 	} else if(iRet != RS_RET_CERTLESS) {
+ 		FINALIZE; /* we have an error case! */
+ 	}
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch
new file mode 100644
index 0000000..e1dab75
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use_gnutls_certificate_type_set_priority_only_if_available.patch
@@ -0,0 +1,79 @@
+From 21674039db99d1067e9df4df04d965297d62c6af Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 18 May 2015 09:36:02 +0200
+Subject: [PATCH] use gnutls_certificate_type_set_priority() only if available
+
+The gnutls_certificate_type_set_priority function is deprecated
+and not available in recent GnuTLS versions. However, there is no
+doc how to properly replace it with gnutls_priority_set_direct.
+A lot of folks have simply removed it, when they also called
+gnutls_set_default_priority. This is what we now also do. If
+this causes problems or someone has an idea of how to replace
+the deprecated function in a better way, please let us know!
+In any case, we use it as long as it is available and let
+not insult us by the deprecation warnings.
+
+Upstream-Status: Backport
+Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
+
+---
+ configure.ac       |  1 +
+ runtime/nsd_gtls.c | 18 ++++++++++++++++--
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 56835fb..1c2be01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -765,6 +765,7 @@ if test "x$enable_gnutls" = "xyes"; then
+ 	AC_DEFINE([ENABLE_GNUTLS], [1], [Indicator that GnuTLS is present])
+         AC_CHECK_LIB(gnutls, gnutls_global_init)
+ 	AC_CHECK_FUNCS(gnutls_certificate_set_retrieve_function,,)
++	AC_CHECK_FUNCS(gnutls_certificate_type_set_priority,,)
+ fi
+ AM_CONDITIONAL(ENABLE_GNUTLS, test x$enable_gnutls = xyes)
+ 
+diff --git a/runtime/nsd_gtls.c b/runtime/nsd_gtls.c
+index e127834..4b6aab1 100644
+--- a/runtime/nsd_gtls.c
++++ b/runtime/nsd_gtls.c
+@@ -1658,8 +1658,9 @@ Connect(nsd_t *pNsd, int family, uchar *port, uchar *host)
+ 	nsd_gtls_t *pThis = (nsd_gtls_t*) pNsd;
+ 	int sock;
+ 	int gnuRet;
+-	/* TODO: later? static const int cert_type_priority[3] = { GNUTLS_CRT_X509, GNUTLS_CRT_OPENPGP, 0 };*/
++#	if HAVE_GNUTLS_CERTIFICATE_TYPE_SET_PRIORITY
+ 	static const int cert_type_priority[2] = { GNUTLS_CRT_X509, 0 };
++#	endif
+ 	DEFiRet;
+ 
+ 	ISOBJ_TYPE_assert(pThis, nsd_gtls);
+@@ -1688,14 +1689,27 @@ Connect(nsd_t *pNsd, int family, uchar *port, uchar *host)
+ 		gnutls_certificate_set_retrieve_function(xcred, gtlsClientCertCallback);
+ #		else
+ 		gnutls_certificate_client_set_retrieve_function(xcred, gtlsClientCertCallback);
+-#	endif
++#		endif
+ 	} else if(iRet != RS_RET_CERTLESS) {
+ 		FINALIZE; /* we have an error case! */
+ 	}
+ 
+ 	/* Use default priorities */
+ 	CHKgnutls(gnutls_set_default_priority(pThis->sess));
++#	if HAVE_GNUTLS_CERTIFICATE_TYPE_SET_PRIORITY
++	/* The gnutls_certificate_type_set_priority function is deprecated
++	 * and not available in recent GnuTLS versions. However, there is no
++	 * doc how to properly replace it with gnutls_priority_set_direct.
++	 * A lot of folks have simply removed it, when they also called
++	 * gnutls_set_default_priority. This is what we now also do. If
++	 * this causes problems or someone has an idea of how to replace
++	 * the deprecated function in a better way, please let us know!
++	 * In any case, we use it as long as it is available and let
++	 * not insult us by the deprecation warnings.
++	 * 2015-05-18 rgerhards
++	 */
+ 	CHKgnutls(gnutls_certificate_type_set_priority(pThis->sess, cert_type_priority));
++#	endif
+ 
+ 	/* put the x509 credentials to the current session */
+ 	CHKgnutls(gnutls_credentials_set(pThis->sess, GNUTLS_CRD_CERTIFICATE, xcred));
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index ddc6eb3..928434e 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -17,9 +17,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
                     file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
 "
 
-# http://errors.yoctoproject.org/Errors/Details/25829/
-PNBLACKLIST[rsyslog] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
-
 SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
            file://rsyslog.conf \
@@ -28,6 +25,8 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
            file://json-0.12-fix.patch \
+           file://replace_deprecated_GnuTLS_functions.patch \
+           file://use_gnutls_certificate_type_set_priority_only_if_available.patch \
 "
 
 SRC_URI[md5sum] = "093c462a5245012bd9e7b82dd8aedffb"
-- 
1.9.1


