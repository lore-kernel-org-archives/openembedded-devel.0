Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Pxzlf-0001aq-7p for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:40:23 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 7C462A7EB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 11:37:38 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
Date: Fri, 11 Mar 2011 11:38:37 +0100
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Message-Id: <201103111138.38493.pgsellmann@portner-elektronik.at>
Subject: [PATCH] gsoap_2.7.13 build errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Mar 2011 10:40:23 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a compiler error about an impossible cast from QUIRKS* to const QUIRKS*
The patches are from Fedora12 which has the exact same gsoap-version
They can be found at http://archive.fedoraproject.org/pub/archive/fedora/linux/releases/12/Everything/source/SRPMS/gsoap-2.7.13-2.fc12.src.rpm

In the native package, the generated binary is installed in STAGING_BINDIR_NATIVE where expected by the gsoap-package

Otherwise the gsoap-package uses a soapcpp2 delivered as 32bit-executable in the source-package! This fails on x86_64 hosts.

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch |   17 +++++
 recipes/gsoap/gsoap-2.7.13/unused_args.patch       |   39 +++++++++++
 .../gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch    |   72 ++++++++++++++++++++
 recipes/gsoap/gsoap-native_2.7.13.bb               |    3 +-
 recipes/gsoap/gsoap_2.7.13.inc                     |    4 +-
 5 files changed, 133 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch
 create mode 100644 recipes/gsoap/gsoap-2.7.13/unused_args.patch
 create mode 100644 recipes/gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch

diff --git a/recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch b/recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch
new file mode 100644
index 0000000..443fb69
--- /dev/null
+++ b/recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch
@@ -0,0 +1,17 @@
+diff -up gsoap-2.7/gsoap/stdsoap2.cpp.openssl gsoap-2.7/gsoap/stdsoap2.cpp
+--- gsoap-2.7/gsoap/stdsoap2.cpp.openssl	2008-10-02 19:36:28.000000000 +0200
++++ gsoap-2.7/gsoap/stdsoap2.cpp	2009-08-22 22:20:49.000000000 +0200
+@@ -4153,7 +4153,12 @@ again:
+           { X509_EXTENSION *ext = X509_get_ext(peer, i);
+             const char *ext_str = OBJ_nid2sn(OBJ_obj2nid(X509_EXTENSION_get_object(ext)));
+             if (ext_str && !strcmp(ext_str, "subjectAltName"))
+-            { X509V3_EXT_METHOD *meth = X509V3_EXT_get(ext);
++            {
++#if (OPENSSL_VERSION_NUMBER >= 0x10000000L)
++              const X509V3_EXT_METHOD *meth = X509V3_EXT_get(ext);
++#else
++              X509V3_EXT_METHOD *meth = X509V3_EXT_get(ext);
++#endif
+               void *ext_data;
+ #if (OPENSSL_VERSION_NUMBER >= 0x0090800fL)
+               const unsigned char *data;
diff --git a/recipes/gsoap/gsoap-2.7.13/unused_args.patch b/recipes/gsoap/gsoap-2.7.13/unused_args.patch
new file mode 100644
index 0000000..376a9b9
--- /dev/null
+++ b/recipes/gsoap/gsoap-2.7.13/unused_args.patch
@@ -0,0 +1,39 @@
+diff -rup gsoap-2.7/gsoap/src/symbol2.c gsoap-2.7mf/gsoap/src/symbol2.c
+--- gsoap-2.7/gsoap/src/symbol2.c	2009-03-21 16:24:34.000000000 -0500
++++ gsoap-2.7mf/gsoap/src/symbol2.c	2009-05-11 10:18:32.000000000 -0500
+@@ -7334,6 +7334,7 @@ soap_instantiate_class(Tnode *typ)
+   fprintf(fhead,"\nSOAP_FMAC3 %s * SOAP_FMAC4 soap_instantiate_%s(struct soap*, int, const char*, const char*, size_t*);", c_type(typ), c_ident(typ));
+   fprintf(fout,"\n\nSOAP_FMAC3 %s * SOAP_FMAC4 soap_instantiate_%s(struct soap *soap, int n, const char *type, const char *arrayType, size_t *size)", c_type(typ), c_ident(typ));
+   fprintf(fout,"\n{");
++  fprintf(fout,"\n\t(void)type; (void)arrayType; /* appease -Wall -Werror */");
+   fprintf(fout, "\n\tDBGLOG(TEST, SOAP_MESSAGE(fdebug, \"soap_instantiate_%s(%%d, %%s, %%s)\\n\", n, type?type:\"\", arrayType?arrayType:\"\"));", c_ident(typ));
+ 
+   fprintf(fout,"\n\tstruct soap_clist *cp = soap_link(soap, NULL, %s, n, soap_fdelete);", soap_type(typ));
+@@ -7867,6 +7868,8 @@ Tnode* typ;
+         fprintf(fout,"\n\nvoid %s::soap_default(struct soap *soap)\n{", c_ident(typ)); 
+         if ((s = has_soapref(typ)))
+           fprintf(fout,"\n\tthis->%s = soap;", s);
++         else
++           fprintf(fout,"\n\t(void)soap; /* appease -Wall -Werror */");
+ 	d = get_Darraydims(typ);
+         if (d)
+ 	{ fprintf(fout,"\n\tthis->%s = NULL;", ident(p->sym->name));
+@@ -7894,6 +7897,8 @@ Tnode* typ;
+         fprintf(fout,"\n\nSOAP_FMAC3 void SOAP_FMAC4 soap_default_%s(struct soap *soap, %s)\n{", c_ident(typ),c_type_id(typ, "*a")); 
+         if ((s = has_soapref(typ)))
+           fprintf(fout,"\n\ta->%s = soap;", s);
++         else
++           fprintf(fout,"\n\t(void)soap; /* appease -Wall -Werror */");
+ 	d = get_Darraydims(typ);
+         if (d)
+ 	{ fprintf(fout,"\n\ta->%s = NULL;", ident(p->sym->name));
+@@ -9123,7 +9128,7 @@ soap_out(Tnode *typ)
+       if (is_typedef(typ))
+         fprintf(fout, "\n{\treturn soap_%s2s(soap, n);\n}", t_ident(typ));
+       else if (is_boolean(typ))
+-        fprintf(fout, "\n{\treturn soap_code_str(soap_codes_%s, n!=0);\n}", c_ident(typ));
++        fprintf(fout, "\n{\t(void)soap; /* appease -Wall -Werror */\n\treturn soap_code_str(soap_codes_%s, n!=0);\n}", c_ident(typ));
+       else if (!is_mask(typ))
+       { fprintf(fout, "\n{\tconst char *s = soap_code_str(soap_codes_%s, (long)n);", c_ident(typ));
+         fprintf(fout, "\n\tif (s)\n\t\treturn s;");
+Only in gsoap-2.7mf/gsoap/src: symbol2.c~
diff --git a/recipes/gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch b/recipes/gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch
new file mode 100644
index 0000000..e25324d
--- /dev/null
+++ b/recipes/gsoap/gsoap-2.7.13/use_libtool-2.7.12.patch
@@ -0,0 +1,72 @@
+diff -ur gsoap-2.7/configure.in gsoap-2.7mf/configure.in
+--- gsoap-2.7/configure.in	2008-10-02 12:36:28.000000000 -0500
++++ gsoap-2.7mf/configure.in	2008-12-24 15:05:11.000000000 -0600
+@@ -15,7 +15,7 @@
+ AM_PROG_LEX
+ AC_PROG_YACC
+ AC_PROG_CPP
+-AC_PROG_RANLIB
++AM_PROG_LIBTOOL
+ AC_PROG_LN_S
+ AC_PROG_AWK
+ AC_PROG_INSTALL
+@@ -157,12 +157,12 @@
+   AC_MSG_RESULT(no)
+   WSDL2H_EXTRA_FLAGS="-DWITH_OPENSSL -DWITH_GZIP"
+   WSDL2H_EXTRA_LIBS="-lssl -lcrypto -lz"
+-  WSDL2H_SOAP_CPP_LIB="libgsoapssl++.a"
++  WSDL2H_SOAP_CPP_LIB="libgsoapssl++.la"
+ else
+   AC_MSG_RESULT(yes)
+   WSDL2H_EXTRA_FLAGS=
+   WSDL2H_EXTRA_LIBS=
+-  WSDL2H_SOAP_CPP_LIB="libgsoap++.a"
++  WSDL2H_SOAP_CPP_LIB="libgsoap++.la"
+ fi
+ AC_SUBST(WSDL2H_EXTRA_FLAGS)
+ AC_SUBST(WSDL2H_EXTRA_LIBS)
+diff -ur gsoap-2.7/gsoap/Makefile.am gsoap-2.7mf/gsoap/Makefile.am
+--- gsoap-2.7/gsoap/Makefile.am	2008-10-02 12:36:28.000000000 -0500
++++ gsoap-2.7mf/gsoap/Makefile.am	2008-12-24 15:43:06.000000000 -0600
+@@ -3,7 +3,7 @@
+ ## you have all needed files, that a GNU package needs
+ AUTOMAKE_OPTIONS = foreign 1.4
+ 
+-SUBDIRS = src wsdl @SAMPLE_DIRS@
++SUBDIRS = . src wsdl @SAMPLE_DIRS@
+ CLEANFILES = soapcpp2 wsdl2h stdsoap2_cpp.cpp stdsoap2_ck.c stdsoap2_ck_cpp.cpp stdsoap2_ssl.c stdsoap2_ssl_cpp.cpp
+ 
+ ##	*~ *.req.xml *.res.xml *.nsmap *.wsdl *.xsd *Proxy.h \
+@@ -31,19 +31,19 @@
+ stdsoap2_ssl_cpp.cpp: stdsoap2.cpp
+ 	$(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
+ 
+-lib_LIBRARIES = libgsoap.a libgsoap++.a libgsoapck.a libgsoapck++.a libgsoapssl.a libgsoapssl++.a
+-libgsoap_a_SOURCES = stdsoap2.c
+-libgsoap_a_CFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform)
+-libgsoap___a_SOURCES = stdsoap2_cpp.cpp
+-libgsoap___a_CXXFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform)
+-libgsoapck_a_SOURCES = stdsoap2_ck.c
+-libgsoapck_a_CFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_COOKIES
+-libgsoapck___a_SOURCES = stdsoap2_ck_cpp.cpp
+-libgsoapck___a_CXXFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_COOKIES
+-libgsoapssl_a_SOURCES = stdsoap2_ssl.c
+-libgsoapssl_a_CFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_OPENSSL -DWITH_DOM -DWITH_GZIP
+-libgsoapssl___a_SOURCES = stdsoap2_ssl_cpp.cpp
+-libgsoapssl___a_CXXFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_OPENSSL -DWITH_DOM -DWITH_GZIP
++lib_LTLIBRARIES = libgsoap.la libgsoap++.la libgsoapck.la libgsoapck++.la libgsoapssl.la libgsoapssl++.la
++libgsoap_la_SOURCES = stdsoap2.c
++libgsoap_la_CFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform)
++libgsoap___la_SOURCES = stdsoap2_cpp.cpp
++libgsoap___la_CXXFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform)
++libgsoapck_la_SOURCES = stdsoap2_ck.c
++libgsoapck_la_CFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_COOKIES
++libgsoapck___la_SOURCES = stdsoap2_ck_cpp.cpp
++libgsoapck___la_CXXFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_COOKIES
++libgsoapssl_la_SOURCES = stdsoap2_ssl.c
++libgsoapssl_la_CFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_OPENSSL -DWITH_DOM -DWITH_GZIP
++libgsoapssl___la_SOURCES = stdsoap2_ssl_cpp.cpp
++libgsoapssl___la_CXXFLAGS = $(SOAPCPP2_DEBUG) $(SOAPCPP2_NONAMESPACES) -D$(platform) -DWITH_OPENSSL -DWITH_DOM -DWITH_GZIP
+ 
+ BUILT_SOURCES = stdsoap2_cpp.cpp $(lib_LIBRARIES)
+ 
diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap-native_2.7.13.bb
index 3e905e7..83c2329 100644
--- a/recipes/gsoap/gsoap-native_2.7.13.bb
+++ b/recipes/gsoap/gsoap-native_2.7.13.bb
@@ -6,8 +6,9 @@ EXTRA_OEMAKE = ""
 
 inherit native
 
+
 do_install() {
-	:
+	install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
 }
 
 
diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.13.inc
index 877e1d1..c3ab3c4 100644
--- a/recipes/gsoap/gsoap_2.7.13.inc
+++ b/recipes/gsoap/gsoap_2.7.13.inc
@@ -3,7 +3,9 @@ for the development of SOAP Web Services and clients."
 SECTION = "devel"
 LICENSE = "GPL"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz	\
+	file://gsoap-2.7-openssl.patch	\
+	file://unused_args.patch"
 
 inherit autotools
 
-- 
1.7.2.3



