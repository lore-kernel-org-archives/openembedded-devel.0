Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88EC1783EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:02:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y192so13935550pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ulWInY2O8oFBuLm/dvfq0shek1PH4ekQDIs8HNTDCGA=;
	b=V1h115IY4RWRsH4HS2SsdX5WsLBH+QKnZUahB1DKSsVd56WSrEcufBcIZcf+3YmHCF
	hz9ICPo3B3uZyeJB6ZQGshjA+EJtVVrHh/aRf/oZ/nleaeufi8zziuSKSPqLswox6J4e
	imYdcnQdAm3szZyFMdmxiCT9JqRE/aO50ICRpMq2n+943ggkfLJX/ht0WNj2odCet4AL
	zZoycQzlyidPrliA0j1BsSdEaY+bFTY5wWHslrVJvVOuNHrpmslDNhbEzIcWcRJYUffD
	nTcahALJa3N4jRY3c5bxpel01yWislzSnvQdKehSgH3RVyrGFrB/DLdWf7XYSibbLnvv
	7yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ulWInY2O8oFBuLm/dvfq0shek1PH4ekQDIs8HNTDCGA=;
	b=FIi9+WoaMKgs3lKU6tqr0B8E+GicB0oTC8SWoUX0xjRZ9cF+2nVWBHoq8PrNkyJdgs
	m3SoKqSbg8zd4RsRR5HR5O+BZrgjtLhJgJlzXiltlE6ZnaQ77rFd8N8e49wDp74BDnuJ
	mbjFoLrtXlNeb9I9B92bv9cXSBDpyrZZnvfUxFyjpDU60fWDK/tO4w63BlXhC/UjHXhP
	bb6eT5eA+ymkW2Gxc9vTYFH3dtG7oUY6eBGdRwrlqaEDr1HGvtdOnVFkkn4YdQjk8Af9
	u+o1U1VshHv3bxaqaIR6dmAU4tn9BpcRDY4E/BYvWkiQ6u9ht5nsTGCQR/YpTHjJ6eiU
	uFFQ==
X-Gm-Message-State: AHYfb5hLqeZriwfGqTQAvA5Dp0/mnVOwFdLl75kKyzSlIs1J23o9ok/Y
	SNB1dikzec8qZD22
X-Received: by 10.84.131.130 with SMTP id d2mr29715056pld.16.1502773351444;
	Mon, 14 Aug 2017 22:02:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	j63sm14640904pge.88.2017.08.14.22.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 22:02:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 22:02:19 -0700
Message-Id: <20170815050221.16408-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] gsoap: Upgrade to 2.8.51
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
X-List-Received-Date: Tue, 15 Aug 2017 05:02:30 -0000

Fixes build with openssl 1.1
Add patch to fix out of tree build

License changes are due to restructing of license files
see https://sourceforge.net/p/gsoap2/code/123/

Add OpenSSL exception to LICENSE field which was
missing thus far.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gsoap/gsoap/0001-Fix-out-of-tree-builds.patch  | 178 +++++++++++++++++++++
 .../gsoap/{gsoap_2.8.12.bb => gsoap_2.8.51.bb}     |  15 +-
 2 files changed, 186 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.12.bb => gsoap_2.8.51.bb} (65%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch
new file mode 100644
index 000000000..5ceb4bf02
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.patch
@@ -0,0 +1,178 @@
+From 8a10b6bd556426616e93f15639f369defbeca33f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Aug 2017 11:58:58 -0700
+Subject: [PATCH] Fix out of tree builds
+
+When build dir is not same as sourcedir then the build failed due
+to use of $(srcdir) variable which assumes source = build therefore
+replace that with top_srcdir
+
+Additionally move the conditional addition of sources to Makefile.am
+instead of adding it in configure.ac, since then we can use top_srcdir
+variable to access those sources too otherwise its not possible to
+specify the right dir for these sources
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted[https://sourceforge.net/p/gsoap2/patches/171/]
+
+ configure.ac                          |  5 +++--
+ gsoap/Makefile.am                     | 14 +++++++-------
+ gsoap/samples/autotest/Makefile.am    |  8 ++++----
+ gsoap/samples/databinding/Makefile.am |  8 ++++----
+ gsoap/wsdl/Makefile.am                | 15 +++++++++------
+ 5 files changed, 27 insertions(+), 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0631c18..c36e696 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -265,7 +265,7 @@ if test "x$with_openssl" = "xyes"; then
+     WSDL2H_EXTRA_FLAGS="-DWITH_OPENSSL -DWITH_GZIP"
+     # an ugly hack to get httpda and smdevp plugins to conditionally
+     # compile with wsdl2h when OPENSSL is available
+-    WSDL2H_EXTRA_LIBS="${WSDL2H_EXTRA_LIBS} ../plugin/httpda.c ../plugin/smdevp.c ../plugin/threads.c -lssl -lcrypto -lz"
++    WSDL2H_EXTRA_LIBS="${WSDL2H_EXTRA_LIBS} -lssl -lcrypto -lz"
+     SAMPLE_INCLUDES=
+     SAMPLE_SSL_LIBS="-lssl -lcrypto -lz"
+     WSDL2H_SOAP_CPP_LIB="libgsoapssl++.a"
+@@ -289,12 +289,13 @@ else
+   SAMPLE_INCLUDES=
+   WSDL2H_SOAP_CPP_LIB="libgsoap++.a"
+ fi
++AM_CONDITIONAL(WITH_OPENSSL, test "x$with_openssl" = "xyes" -a "x$with_gnutls" != "xyes")
++AC_SUBST(WITH_OPENSSL)
+ AC_SUBST(WSDL2H_EXTRA_FLAGS)
+ AC_SUBST(WSDL2H_EXTRA_LIBS)
+ AC_SUBST(SAMPLE_INCLUDES)
+ AC_SUBST(SAMPLE_SSL_LIBS)
+ AC_SUBST(WSDL2H_SOAP_CPP_LIB)
+-
+ # enable the compile of the samples
+ AC_ARG_ENABLE(samples,
+ [  --enable-samples	  enable compile for the gsoap samples],
+diff --git a/gsoap/Makefile.am b/gsoap/Makefile.am
+index 7273b82..9c0c89f 100644
+--- a/gsoap/Makefile.am
++++ b/gsoap/Makefile.am
+@@ -13,26 +13,26 @@ AM_CXXFLAGS = $(SOAPCPP2_DEBUG) -D$(platform)
+ AM_CFLAGS = $(SOAPCPP2_DEBUG) -D$(platform)
+ 
+ # Install all soapcpp2 and wsdl2h files into ${prefix}/share/gsoap
+-nobase_pkgdata_DATA = $(srcdir)/import/* $(srcdir)/plugin/* $(srcdir)/WS/* $(srcdir)/custom/* $(srcdir)/extras/*
++nobase_pkgdata_DATA = $(top_srcdir)/gsoap/import/* $(top_srcdir)/gsoap/plugin/* $(top_srcdir)/gsoap/WS/* $(top_srcdir)/gsoap/custom/* $(top_srcdir)/gsoap/extras/*
+ 
+ ## we cannot build stdsoap2.o from 2 different sources (stdsoap2.cpp and stdsoap2.c), so we need an intermediate target:
+ stdsoap2_ck.c: stdsoap2.cpp
+-	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ck.c
++	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ck.c
+ 
+ stdsoap2_cpp.cpp: stdsoap2.cpp
+-	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_cpp.cpp
++	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_cpp.cpp
+ 
+ stdsoap2_ck_cpp.cpp: stdsoap2.cpp
+-	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ck_cpp.cpp
++	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ck_cpp.cpp
+ 
+ stdsoap2_ssl.c: stdsoap2.cpp
+-	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl.c
++	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ssl.c
+ 
+ stdsoap2_ssl_cpp.cpp: stdsoap2.cpp
+-	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
++	$(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
+ ## do the same fo dom.cpp since we want to link it into the cpp libs and dom.c into the c libs
+ dom_cpp.cpp: dom.cpp
+-	$(LN_S) -f $(srcdir)/dom.cpp dom_cpp.cpp
++	$(LN_S) -f $(top_srcdir)/gsoap/dom.cpp dom_cpp.cpp
+ 
+ lib_LIBRARIES = libgsoap.a libgsoap++.a libgsoapck.a libgsoapck++.a libgsoapssl.a libgsoapssl++.a
+ 
+diff --git a/gsoap/samples/autotest/Makefile.am b/gsoap/samples/autotest/Makefile.am
+index 36adf51..61e514c 100644
+--- a/gsoap/samples/autotest/Makefile.am
++++ b/gsoap/samples/autotest/Makefile.am
+@@ -6,13 +6,13 @@
+ AUTOMAKE_OPTIONS = subdir-objects foreign 1.4
+ 
+ CPPFLAGS=-I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
+-AM_LDFLAGS=$(CPPFLAGS) -I$(srcdir) -L$(srcdir)
++AM_LDFLAGS=$(CPPFLAGS) -I$(top_srcdir)/gsoap/samples/autotest -L$(top_srcdir)/gsoap/samples/autotest
+ SOAP=$(top_srcdir)/gsoap/src/soapcpp2$(EXEEXT)
+ WSDL=$(top_srcdir)/gsoap/wsdl/wsdl2h$(EXEEXT)
+-WSDL_FLAGS=-d -P -t $(srcdir)/typemap.dat
++WSDL_FLAGS=-d -P -t $(top_srcdir)/gsoap/samples/autotest/typemap.dat
+ SOAP_FLAGS=-SL -T -I$(top_srcdir)/gsoap/import -I$(top_srcdir)/gsoap/custom
+-WSDLINPUT=$(srcdir)/examples.wsdl
+-SOAPHEADER=$(srcdir)/examples.h
++WSDLINPUT=$(top_srcdir)/gsoap/samples/autotest/examples.wsdl
++SOAPHEADER=$(top_srcdir)/gsoap/samples/autotest/examples.h
+ SOAP_CPP_SRC=soapC.cpp soapServer.cpp
+ SOAP_CPP_LIB=$(top_builddir)/gsoap/libgsoap++.a
+ 
+diff --git a/gsoap/samples/databinding/Makefile.am b/gsoap/samples/databinding/Makefile.am
+index 892d4fd..86ad482 100644
+--- a/gsoap/samples/databinding/Makefile.am
++++ b/gsoap/samples/databinding/Makefile.am
+@@ -6,13 +6,13 @@
+ AUTOMAKE_OPTIONS = subdir-objects foreign 1.4
+ 
+ CPPFLAGS=$(SAMPLE_INCLUDES) -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
+-AM_LDFLAGS=$(AM_CPPFLAGS) -I$(srcdir) -L$(srcdir)
++AM_LDFLAGS=$(AM_CPPFLAGS) -I$(top_srcdir)/gsoap/samples/databinding -L$(top_srcdir)/gsoap/samples/databinding
+ SOAP=$(top_srcdir)/gsoap/src/soapcpp2$(EXEEXT)
+ WSDL=$(top_srcdir)/gsoap/wsdl/wsdl2h$(EXEEXT)
+-WSDL_FLAGS=-g -t $(srcdir)/addresstypemap.dat
++WSDL_FLAGS=-g -t $(top_srcdir)/gsoap/samples/databinding/addresstypemap.dat
+ SOAP_FLAGS=-0 -CS -p address -I$(top_srcdir)/gsoap/import
+-WSDLINPUT=$(srcdir)/address.xsd
+-SOAPHEADER=$(srcdir)/address.h
++WSDLINPUT=$(top_srcdir)/gsoap/samples/databinding/address.xsd
++SOAPHEADER=$(top_srcdir)/gsoap/samples/databinding/address.h
+ SOAP_CPP_SRC=addressC.cpp
+ SOAP_CPP_LIB=$(top_builddir)/gsoap/libgsoap++.a
+ 
+diff --git a/gsoap/wsdl/Makefile.am b/gsoap/wsdl/Makefile.am
+index b8da5db..9f2aefa 100644
+--- a/gsoap/wsdl/Makefile.am
++++ b/gsoap/wsdl/Makefile.am
+@@ -6,14 +6,14 @@
+ AUTOMAKE_OPTIONS = foreign 1.4
+ 
+ # INCLUDES=-I$(top_srcdir)/gsoap
+-# AM_LDFLAGS=$(INCLUDES) -I$(srcdir) -L$(srcdir)
+-AM_LDFLAGS=-L$(srcdir) -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
++# AM_LDFLAGS=$(INCLUDES) -I$(top_srcdir)/gsoap/wsdl -L$(top_srcdir)/gsoap/wsdl
++AM_LDFLAGS=-L$(top_srcdir)/gsoap/wsdl -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
+ AM_CPPFLAGS=-I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
+ SOAP=$(top_builddir)/gsoap/src/soapcpp2$(EXEEXT)
+ SOAP_CPP_LIB=$(top_builddir)/gsoap/$(WSDL2H_SOAP_CPP_LIB)
+ SOAP_CPP_SRC=wsdlC.cpp
+-SOAPHEADER=$(srcdir)/wsdl.h
+-SOAP_FLAGS=-SC -pwsdl -I$(srcdir) -I$(top_srcdir)/gsoap/import
++SOAPHEADER=$(top_srcdir)/gsoap/wsdl/wsdl.h
++SOAP_FLAGS=-SC -pwsdl -I$(top_srcdir)/gsoap/wsdl -I$(top_srcdir)/gsoap/import
+ BUILT_SOURCES=$(SOAP_CPP_SRC)
+ # WSDL2H_EXTRA_FLAGS=-DWITH_OPENSSL -DWITH_GZIP # defined in configure.in
+ # WSDL2H_EXTRA_LIBS=-lssl -lcrypto -lz # defined in configure.in
+@@ -24,11 +24,14 @@ $(SOAP_CPP_SRC) : $(SOAPHEADER)
+ #LIBS=
+ 
+ bin_PROGRAMS=wsdl2h
+-
++if WITH_OPENSSL
++wsdl2h_LDADD=$(SOAP_CPP_LIB) $(top_srcdir)/gsoap/plugin/httpda.c $(top_srcdir)/gsoap/plugin/smdevp.c $(top_srcdir)/gsoap/plugin/threads.c $(WSDL2H_EXTRA_LIBS)
++else
++wsdl2h_LDADD=$(SOAP_CPP_LIB) $(WSDL2H_EXTRA_LIBS)
++endif
+ wsdl2h_CFLAGS=$(C_DEBUG_FLAGS) $(SOAPCPP2_NO_C_LOCALE) $(WSDL2H_EXTRA_FLAGS)
+ wsdl2h_CXXFLAGS=$(C_DEBUG_FLAGS) $(SOAPCPP2_NO_C_LOCALE) $(WSDL2H_EXTRA_FLAGS) $(WSDL2H_IMPORTPATH)
+ wsdl2h_CPPFLAGS=$(AM_CPPFLAGS) $(SOAPCPP2_NONAMESPACES) -D$(platform)
+ wsdl2h_SOURCES=wsdl2h.cpp wsdl.cpp wadl.cpp schema.cpp types.cpp service.cpp soap.cpp mime.cpp wsp.cpp bpel.cpp $(SOAP_CPP_SRC)
+-wsdl2h_LDADD=$(SOAP_CPP_LIB) $(WSDL2H_EXTRA_LIBS)
+ 
+ CLEANFILES= *~ *C.cpp *H.h *Stub.h *.nsmap
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
similarity index 65%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
index 6da08ac84..41fccb533 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
@@ -1,19 +1,20 @@
 DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
 for the development of SOAP Web Services and clients."
 SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b338b08b1b61e028e0f399a4de25e58f"
+LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
+                    file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip"
-SRC_URI[md5sum] = "5700d26fc6fe3073d038349e19c3640d"
-SRC_URI[sha256sum] = "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee3dcff783f4015a00"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
+           file://0001-Fix-out-of-tree-builds.patch \
+"
+SRC_URI[md5sum] = "212951d6e1435bb51fa4320f458809ea"
+SRC_URI[sha256sum] = "3e7bb24a9e492f5cb86daca34054c9787152f1d7b70add36b789d03816d5ffa1"
 
 inherit autotools
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
-
 S = "${WORKDIR}/${BPN}-2.8"
 
 PARALLEL_MAKE = ""
-- 
2.14.1


