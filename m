Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF6F7FA37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 01:58:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="79194608"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 09:58:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 68FF44CE1BF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 09:50:32 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Nov 2019 09:58:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Nov 2019 09:59:42 +0800
Message-ID: <20191128015942.8733-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 68FF44CE1BF0.AD5AE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] gsoap: upgrade 2.8.51 -> 2.8.95
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
X-List-Received-Date: Thu, 28 Nov 2019 01:58:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gsoap/0001-Fix-out-of-tree-builds.patch
Removed since this is included in 2.8.95.

gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
Removed since this does not fit the latest version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gsoap/0001-Fix-out-of-tree-builds.patch   | 178 ------------------
 .../0001-stdgsoap2-Fix-build-with-musl.patch  |  63 -------
 .../{gsoap_2.8.51.bb => gsoap_2.8.95.bb}      |   6 +-
 3 files changed, 2 insertions(+), 245 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch
 delete mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.51.bb => gsoap_2.8.95.bb} (82%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch
deleted file mode 100644
index 5ceb4bf02..000000000
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 8a10b6bd556426616e93f15639f369defbeca33f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Aug 2017 11:58:58 -0700
-Subject: [PATCH] Fix out of tree builds
-
-When build dir is not same as sourcedir then the build failed due
-to use of $(srcdir) variable which assumes source = build therefore
-replace that with top_srcdir
-
-Additionally move the conditional addition of sources to Makefile.am
-instead of adding it in configure.ac, since then we can use top_srcdir
-variable to access those sources too otherwise its not possible to
-specify the right dir for these sources
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted[https://sourceforge.net/p/gsoap2/patches/171/]
-
- configure.ac                          |  5 +++--
- gsoap/Makefile.am                     | 14 +++++++-------
- gsoap/samples/autotest/Makefile.am    |  8 ++++----
- gsoap/samples/databinding/Makefile.am |  8 ++++----
- gsoap/wsdl/Makefile.am                | 15 +++++++++------
- 5 files changed, 27 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0631c18..c36e696 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -265,7 +265,7 @@ if test "x$with_openssl" = "xyes"; then
-     WSDL2H_EXTRA_FLAGS="-DWITH_OPENSSL -DWITH_GZIP"
-     # an ugly hack to get httpda and smdevp plugins to conditionally
-     # compile with wsdl2h when OPENSSL is available
--    WSDL2H_EXTRA_LIBS="${WSDL2H_EXTRA_LIBS} ../plugin/httpda.c ../plugin/smdevp.c ../plugin/threads.c -lssl -lcrypto -lz"
-+    WSDL2H_EXTRA_LIBS="${WSDL2H_EXTRA_LIBS} -lssl -lcrypto -lz"
-     SAMPLE_INCLUDES=
-     SAMPLE_SSL_LIBS="-lssl -lcrypto -lz"
-     WSDL2H_SOAP_CPP_LIB="libgsoapssl++.a"
-@@ -289,12 +289,13 @@ else
-   SAMPLE_INCLUDES=
-   WSDL2H_SOAP_CPP_LIB="libgsoap++.a"
- fi
-+AM_CONDITIONAL(WITH_OPENSSL, test "x$with_openssl" = "xyes" -a "x$with_gnutls" != "xyes")
-+AC_SUBST(WITH_OPENSSL)
- AC_SUBST(WSDL2H_EXTRA_FLAGS)
- AC_SUBST(WSDL2H_EXTRA_LIBS)
- AC_SUBST(SAMPLE_INCLUDES)
- AC_SUBST(SAMPLE_SSL_LIBS)
- AC_SUBST(WSDL2H_SOAP_CPP_LIB)
--
- # enable the compile of the samples
- AC_ARG_ENABLE(samples,
- [  --enable-samples	  enable compile for the gsoap samples],
-diff --git a/gsoap/Makefile.am b/gsoap/Makefile.am
-index 7273b82..9c0c89f 100644
---- a/gsoap/Makefile.am
-+++ b/gsoap/Makefile.am
-@@ -13,26 +13,26 @@ AM_CXXFLAGS = $(SOAPCPP2_DEBUG) -D$(platform)
- AM_CFLAGS = $(SOAPCPP2_DEBUG) -D$(platform)
- 
- # Install all soapcpp2 and wsdl2h files into ${prefix}/share/gsoap
--nobase_pkgdata_DATA = $(srcdir)/import/* $(srcdir)/plugin/* $(srcdir)/WS/* $(srcdir)/custom/* $(srcdir)/extras/*
-+nobase_pkgdata_DATA = $(top_srcdir)/gsoap/import/* $(top_srcdir)/gsoap/plugin/* $(top_srcdir)/gsoap/WS/* $(top_srcdir)/gsoap/custom/* $(top_srcdir)/gsoap/extras/*
- 
- ## we cannot build stdsoap2.o from 2 different sources (stdsoap2.cpp and stdsoap2.c), so we need an intermediate target:
- stdsoap2_ck.c: stdsoap2.cpp
--	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ck.c
-+	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ck.c
- 
- stdsoap2_cpp.cpp: stdsoap2.cpp
--	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_cpp.cpp
-+	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_cpp.cpp
- 
- stdsoap2_ck_cpp.cpp: stdsoap2.cpp
--	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ck_cpp.cpp
-+	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ck_cpp.cpp
- 
- stdsoap2_ssl.c: stdsoap2.cpp
--	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl.c
-+	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ssl.c
- 
- stdsoap2_ssl_cpp.cpp: stdsoap2.cpp
--	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
-+	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
- ## do the same fo dom.cpp since we want to link it into the cpp libs and dom.c into the c libs
- dom_cpp.cpp: dom.cpp
--	$(LN_S) -f $(srcdir)/dom.cpp dom_cpp.cpp
-+	$(LN_S) -f $(top_srcdir)/gsoap/dom.cpp dom_cpp.cpp
- 
- lib_LIBRARIES = libgsoap.a libgsoap++.a libgsoapck.a libgsoapck++.a libgsoapssl.a libgsoapssl++.a
- 
-diff --git a/gsoap/samples/autotest/Makefile.am b/gsoap/samples/autotest/Makefile.am
-index 36adf51..61e514c 100644
---- a/gsoap/samples/autotest/Makefile.am
-+++ b/gsoap/samples/autotest/Makefile.am
-@@ -6,13 +6,13 @@
- AUTOMAKE_OPTIONS = subdir-objects foreign 1.4
- 
- CPPFLAGS=-I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
--AM_LDFLAGS=$(CPPFLAGS) -I$(srcdir) -L$(srcdir)
-+AM_LDFLAGS=$(CPPFLAGS) -I$(top_srcdir)/gsoap/samples/autotest -L$(top_srcdir)/gsoap/samples/autotest
- SOAP=$(top_srcdir)/gsoap/src/soapcpp2$(EXEEXT)
- WSDL=$(top_srcdir)/gsoap/wsdl/wsdl2h$(EXEEXT)
--WSDL_FLAGS=-d -P -t $(srcdir)/typemap.dat
-+WSDL_FLAGS=-d -P -t $(top_srcdir)/gsoap/samples/autotest/typemap.dat
- SOAP_FLAGS=-SL -T -I$(top_srcdir)/gsoap/import -I$(top_srcdir)/gsoap/custom
--WSDLINPUT=$(srcdir)/examples.wsdl
--SOAPHEADER=$(srcdir)/examples.h
-+WSDLINPUT=$(top_srcdir)/gsoap/samples/autotest/examples.wsdl
-+SOAPHEADER=$(top_srcdir)/gsoap/samples/autotest/examples.h
- SOAP_CPP_SRC=soapC.cpp soapServer.cpp
- SOAP_CPP_LIB=$(top_builddir)/gsoap/libgsoap++.a
- 
-diff --git a/gsoap/samples/databinding/Makefile.am b/gsoap/samples/databinding/Makefile.am
-index 892d4fd..86ad482 100644
---- a/gsoap/samples/databinding/Makefile.am
-+++ b/gsoap/samples/databinding/Makefile.am
-@@ -6,13 +6,13 @@
- AUTOMAKE_OPTIONS = subdir-objects foreign 1.4
- 
- CPPFLAGS=$(SAMPLE_INCLUDES) -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
--AM_LDFLAGS=$(AM_CPPFLAGS) -I$(srcdir) -L$(srcdir)
-+AM_LDFLAGS=$(AM_CPPFLAGS) -I$(top_srcdir)/gsoap/samples/databinding -L$(top_srcdir)/gsoap/samples/databinding
- SOAP=$(top_srcdir)/gsoap/src/soapcpp2$(EXEEXT)
- WSDL=$(top_srcdir)/gsoap/wsdl/wsdl2h$(EXEEXT)
--WSDL_FLAGS=-g -t $(srcdir)/addresstypemap.dat
-+WSDL_FLAGS=-g -t $(top_srcdir)/gsoap/samples/databinding/addresstypemap.dat
- SOAP_FLAGS=-0 -CS -p address -I$(top_srcdir)/gsoap/import
--WSDLINPUT=$(srcdir)/address.xsd
--SOAPHEADER=$(srcdir)/address.h
-+WSDLINPUT=$(top_srcdir)/gsoap/samples/databinding/address.xsd
-+SOAPHEADER=$(top_srcdir)/gsoap/samples/databinding/address.h
- SOAP_CPP_SRC=addressC.cpp
- SOAP_CPP_LIB=$(top_builddir)/gsoap/libgsoap++.a
- 
-diff --git a/gsoap/wsdl/Makefile.am b/gsoap/wsdl/Makefile.am
-index b8da5db..9f2aefa 100644
---- a/gsoap/wsdl/Makefile.am
-+++ b/gsoap/wsdl/Makefile.am
-@@ -6,14 +6,14 @@
- AUTOMAKE_OPTIONS = foreign 1.4
- 
- # INCLUDES=-I$(top_srcdir)/gsoap
--# AM_LDFLAGS=$(INCLUDES) -I$(srcdir) -L$(srcdir)
--AM_LDFLAGS=-L$(srcdir) -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
-+# AM_LDFLAGS=$(INCLUDES) -I$(top_srcdir)/gsoap/wsdl -L$(top_srcdir)/gsoap/wsdl
-+AM_LDFLAGS=-L$(top_srcdir)/gsoap/wsdl -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
- AM_CPPFLAGS=-I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
- SOAP=$(top_builddir)/gsoap/src/soapcpp2$(EXEEXT)
- SOAP_CPP_LIB=$(top_builddir)/gsoap/$(WSDL2H_SOAP_CPP_LIB)
- SOAP_CPP_SRC=wsdlC.cpp
--SOAPHEADER=$(srcdir)/wsdl.h
--SOAP_FLAGS=-SC -pwsdl -I$(srcdir) -I$(top_srcdir)/gsoap/import
-+SOAPHEADER=$(top_srcdir)/gsoap/wsdl/wsdl.h
-+SOAP_FLAGS=-SC -pwsdl -I$(top_srcdir)/gsoap/wsdl -I$(top_srcdir)/gsoap/import
- BUILT_SOURCES=$(SOAP_CPP_SRC)
- # WSDL2H_EXTRA_FLAGS=-DWITH_OPENSSL -DWITH_GZIP # defined in configure.in
- # WSDL2H_EXTRA_LIBS=-lssl -lcrypto -lz # defined in configure.in
-@@ -24,11 +24,14 @@ $(SOAP_CPP_SRC) : $(SOAPHEADER)
- #LIBS=
- 
- bin_PROGRAMS=wsdl2h
--
-+if WITH_OPENSSL
-+wsdl2h_LDADD=$(SOAP_CPP_LIB) $(top_srcdir)/gsoap/plugin/httpda.c $(top_srcdir)/gsoap/plugin/smdevp.c $(top_srcdir)/gsoap/plugin/threads.c $(WSDL2H_EXTRA_LIBS)
-+else
-+wsdl2h_LDADD=$(SOAP_CPP_LIB) $(WSDL2H_EXTRA_LIBS)
-+endif
- wsdl2h_CFLAGS=$(C_DEBUG_FLAGS) $(SOAPCPP2_NO_C_LOCALE) $(WSDL2H_EXTRA_FLAGS)
- wsdl2h_CXXFLAGS=$(C_DEBUG_FLAGS) $(SOAPCPP2_NO_C_LOCALE) $(WSDL2H_EXTRA_FLAGS) $(WSDL2H_IMPORTPATH)
- wsdl2h_CPPFLAGS=$(AM_CPPFLAGS) $(SOAPCPP2_NONAMESPACES) -D$(platform)
- wsdl2h_SOURCES=wsdl2h.cpp wsdl.cpp wadl.cpp schema.cpp types.cpp service.cpp soap.cpp mime.cpp wsp.cpp bpel.cpp $(SOAP_CPP_SRC)
--wsdl2h_LDADD=$(SOAP_CPP_LIB) $(WSDL2H_EXTRA_LIBS)
- 
- CLEANFILES= *~ *C.cpp *H.h *Stub.h *.nsmap
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
deleted file mode 100644
index 571cbe540..000000000
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From db260fbc7af4c73c997c485a0c69c61594a0e59c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Aug 2017 19:48:50 -0700
-Subject: [PATCH] stdgsoap2: Fix build with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gsoap/stdsoap2.c   | 2 +-
- gsoap/stdsoap2.cpp | 4 ++--
- gsoap/stdsoap2.h   | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gsoap/stdsoap2.c b/gsoap/stdsoap2.c
-index 58e9df4..62389e1 100644
---- a/gsoap/stdsoap2.c
-+++ b/gsoap/stdsoap2.c
-@@ -4462,7 +4462,7 @@ tcp_gethost(struct soap *soap, const char *addr, struct in_addr *inaddr)
-       return soap->error = SOAP_EOM;
-     return SOAP_OK;
-   }
--#if defined(__GLIBC__) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
-+#if defined(LINUX) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
-   if (gethostbyname_r(addr, &hostent, soap->buf, sizeof(soap->buf), &host, &soap->errnum) < 0)
-     host = NULL;
- #elif defined(_AIX43) || ((defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R))
-diff --git a/gsoap/stdsoap2.cpp b/gsoap/stdsoap2.cpp
-index 58e9df4..b637161 100644
---- a/gsoap/stdsoap2.cpp
-+++ b/gsoap/stdsoap2.cpp
-@@ -4462,7 +4462,7 @@ tcp_gethost(struct soap *soap, const char *addr, struct in_addr *inaddr)
-       return soap->error = SOAP_EOM;
-     return SOAP_OK;
-   }
--#if defined(__GLIBC__) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
-+#if defined(LINUX) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
-   if (gethostbyname_r(addr, &hostent, soap->buf, sizeof(soap->buf), &host, &soap->errnum) < 0)
-     host = NULL;
- #elif defined(_AIX43) || ((defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R))
-@@ -19658,7 +19658,7 @@ soap_strerror(struct soap *soap)
-   {
- #ifndef WIN32
- # ifdef HAVE_STRERROR_R
--#  if defined(_GNU_SOURCE) && !defined(__ANDROID__)
-+#  if defined(_GNU_SOURCE) && !defined(__ANDROID__) && defined(__GLIBC__)
-     return strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* GNU-specific */
- #  else
-     strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
-diff --git a/gsoap/stdsoap2.h b/gsoap/stdsoap2.h
-index 07a3952..c6ace4c 100644
---- a/gsoap/stdsoap2.h
-+++ b/gsoap/stdsoap2.h
-@@ -947,7 +947,7 @@ extern "C" {
- # endif
- #elif defined(SOCKLEN_T)
- # define SOAP_SOCKLEN_T SOCKLEN_T
--#elif defined(__socklen_t_defined) || defined(_SOCKLEN_T) || defined(CYGWIN) || defined(FREEBSD) || defined(__FreeBSD__) || defined(OPENBSD) || defined(__QNX__) || defined(QNX) || defined(OS390) || defined(__ANDROID__) || defined(_XOPEN_SOURCE)
-+#elif defined(__socklen_t_defined) || defined(_SOCKLEN_T) || defined(CYGWIN) || defined(FREEBSD) || defined(__FreeBSD__) || defined(OPENBSD) || defined(__QNX__) || defined(QNX) || defined(OS390) || defined(__ANDROID__) || defined(_XOPEN_SOURCE) || defined (LINUX)
- # define SOAP_SOCKLEN_T socklen_t
- #elif defined(IRIX) || defined(WIN32) || defined(__APPLE__) || defined(SUN_OS) || defined(OPENSERVER) || defined(TRU64) || defined(VXWORKS)
- # define SOAP_SOCKLEN_T int
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
similarity index 82%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
index 36530d2df..22a049892 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
                     file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
-           file://0001-Fix-out-of-tree-builds.patch \
-           file://0001-stdgsoap2-Fix-build-with-musl.patch \
            "
-SRC_URI[md5sum] = "212951d6e1435bb51fa4320f458809ea"
-SRC_URI[sha256sum] = "3e7bb24a9e492f5cb86daca34054c9787152f1d7b70add36b789d03816d5ffa1"
+SRC_URI[md5sum] = "88031646018d60857f21246962d10011"
+SRC_URI[sha256sum] = "fe07aa152cd946ef8ebd3f87653f14c1d38efe7c6e6fce8c6f773c4814f79baf"
 
 inherit autotools
 
-- 
2.20.1




