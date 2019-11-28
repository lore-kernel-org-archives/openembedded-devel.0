Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 167DA7F8A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 04:01:57 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id cg2so9798690qvb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 20:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+BOB6Ji/W1eGMtb2y8l+mIdbmuYmKjrWxWkb8rhgXJA=;
	b=GM8dmsc2W+gdQqp9IZ4AFLaJFd752HUlY0ySPrax+rVEQ+DZfZyfNfNHfcfv6jl4Om
	6MjQIjXOk94xakUoZyv94PJEid55aMR2mTQK2jGUZSJ2xPX3Q+7FlG4pKgTgq8OKHTF5
	bIVt6ef+aaxDPjqjgxSdx+fnIZUVb0N/k4Rof/TsVSLcBbdt0IPA5vClrevOLBaksnFM
	vqAHbZ3CFZgiaERcWltWKyoLSfZE/r1NTJgY4za0JA3bMfrxCgzulSgoX0y7UKbsRfh5
	K/IeH45TfBKATnMLepF/eIyChpTB0poUmEHTycxuXz7Dewh6/vuhRXOcWzPFG6zRytle
	R2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+BOB6Ji/W1eGMtb2y8l+mIdbmuYmKjrWxWkb8rhgXJA=;
	b=sIl9fENx7E4nGCmiLoYPEGjoYMGdHKnAwaH8EWfwQmK35FxD2gbODqXJ5etzm6MQ4Q
	Mzr3DIxAenaql4RVJImMUaLesDJaatfEbwcaqCuk9BWhYusCKQH8vSku10se+TnN0PoU
	0L1AUxYRRl8VkxClO1dVjRUM38WlbvAwy0wOIMt2bt0wEpojkKlp1viqR4I9hnX8U3wT
	vLE3qJ6rDrJs6/IznDGA44jbOfwYiaMLZKrkdNPheVTP/6qIY493RfFzgIzi8uYtrk6Z
	FlDL2VgMmCNhbvWPGus7H/gG2iX8uVDZVgN2qSViQzm89ojKnbwdgdzaB5Sv2yFffnkN
	LRYQ==
X-Gm-Message-State: APjAAAUU4gcQtYGj0zc9MDOFpsdsQsyRgtbf5PMBKDVq58Ly7KCNHsjk
	ompW3lqbcps30h3pvQA2b52blrBuuBv6lgPZBI4=
X-Google-Smtp-Source: APXvYqwIuUS3zbFBn4RRtcTUWRI1SPeU7NJ2H3hn9zdAFwndFXIrnWg07omWIsEKTGcsmBnIxNPoD0Msim06N3imtAo=
X-Received: by 2002:a0c:c211:: with SMTP id l17mr8640140qvh.55.1574913718386; 
	Wed, 27 Nov 2019 20:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20191128015942.8733-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191128015942.8733-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2019 20:01:31 -0800
Message-ID: <CAMKF1sqyHgPO-OS4=OyBp_SRJX6qyECg8FJtQuNJX3sHA0rEQQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] gsoap: upgrade 2.8.51 -> 2.8.95
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
X-List-Received-Date: Thu, 28 Nov 2019 04:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 5:59 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> w=
rote:
>
> gsoap/0001-Fix-out-of-tree-builds.patch
> Removed since this is included in 2.8.95.
>
> gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
> Removed since this does not fit the latest version.
>

its not clear if you mean the patch is obsolete or its dropped because
it is not easily forward portable?

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../gsoap/0001-Fix-out-of-tree-builds.patch   | 178 ------------------
>  .../0001-stdgsoap2-Fix-build-with-musl.patch  |  63 -------
>  .../{gsoap_2.8.51.bb =3D> gsoap_2.8.95.bb}      |   6 +-
>  3 files changed, 2 insertions(+), 245 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-t=
ree-builds.patch
>  delete mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fi=
x-build-with-musl.patch
>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.51.bb =3D> gsoap_2.8.95.=
bb} (82%)
>
> diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-bui=
lds.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds=
.patch
> deleted file mode 100644
> index 5ceb4bf02..000000000
> --- a/meta-oe/recipes-support/gsoap/gsoap/0001-Fix-out-of-tree-builds.pat=
ch
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -From 8a10b6bd556426616e93f15639f369defbeca33f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 14 Aug 2017 11:58:58 -0700
> -Subject: [PATCH] Fix out of tree builds
> -
> -When build dir is not same as sourcedir then the build failed due
> -to use of $(srcdir) variable which assumes source =3D build therefore
> -replace that with top_srcdir
> -
> -Additionally move the conditional addition of sources to Makefile.am
> -instead of adding it in configure.ac, since then we can use top_srcdir
> -variable to access those sources too otherwise its not possible to
> -specify the right dir for these sources
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted[https://sourceforge.net/p/gsoap2/patches/171/=
]
> -
> - configure.ac                          |  5 +++--
> - gsoap/Makefile.am                     | 14 +++++++-------
> - gsoap/samples/autotest/Makefile.am    |  8 ++++----
> - gsoap/samples/databinding/Makefile.am |  8 ++++----
> - gsoap/wsdl/Makefile.am                | 15 +++++++++------
> - 5 files changed, 27 insertions(+), 23 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0631c18..c36e696 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -265,7 +265,7 @@ if test "x$with_openssl" =3D "xyes"; then
> -     WSDL2H_EXTRA_FLAGS=3D"-DWITH_OPENSSL -DWITH_GZIP"
> -     # an ugly hack to get httpda and smdevp plugins to conditionally
> -     # compile with wsdl2h when OPENSSL is available
> --    WSDL2H_EXTRA_LIBS=3D"${WSDL2H_EXTRA_LIBS} ../plugin/httpda.c ../plu=
gin/smdevp.c ../plugin/threads.c -lssl -lcrypto -lz"
> -+    WSDL2H_EXTRA_LIBS=3D"${WSDL2H_EXTRA_LIBS} -lssl -lcrypto -lz"
> -     SAMPLE_INCLUDES=3D
> -     SAMPLE_SSL_LIBS=3D"-lssl -lcrypto -lz"
> -     WSDL2H_SOAP_CPP_LIB=3D"libgsoapssl++.a"
> -@@ -289,12 +289,13 @@ else
> -   SAMPLE_INCLUDES=3D
> -   WSDL2H_SOAP_CPP_LIB=3D"libgsoap++.a"
> - fi
> -+AM_CONDITIONAL(WITH_OPENSSL, test "x$with_openssl" =3D "xyes" -a "x$wit=
h_gnutls" !=3D "xyes")
> -+AC_SUBST(WITH_OPENSSL)
> - AC_SUBST(WSDL2H_EXTRA_FLAGS)
> - AC_SUBST(WSDL2H_EXTRA_LIBS)
> - AC_SUBST(SAMPLE_INCLUDES)
> - AC_SUBST(SAMPLE_SSL_LIBS)
> - AC_SUBST(WSDL2H_SOAP_CPP_LIB)
> --
> - # enable the compile of the samples
> - AC_ARG_ENABLE(samples,
> - [  --enable-samples     enable compile for the gsoap samples],
> -diff --git a/gsoap/Makefile.am b/gsoap/Makefile.am
> -index 7273b82..9c0c89f 100644
> ---- a/gsoap/Makefile.am
> -+++ b/gsoap/Makefile.am
> -@@ -13,26 +13,26 @@ AM_CXXFLAGS =3D $(SOAPCPP2_DEBUG) -D$(platform)
> - AM_CFLAGS =3D $(SOAPCPP2_DEBUG) -D$(platform)
> -
> - # Install all soapcpp2 and wsdl2h files into ${prefix}/share/gsoap
> --nobase_pkgdata_DATA =3D $(srcdir)/import/* $(srcdir)/plugin/* $(srcdir)=
/WS/* $(srcdir)/custom/* $(srcdir)/extras/*
> -+nobase_pkgdata_DATA =3D $(top_srcdir)/gsoap/import/* $(top_srcdir)/gsoa=
p/plugin/* $(top_srcdir)/gsoap/WS/* $(top_srcdir)/gsoap/custom/* $(top_srcd=
ir)/gsoap/extras/*
> -
> - ## we cannot build stdsoap2.o from 2 different sources (stdsoap2.cpp an=
d stdsoap2.c), so we need an intermediate target:
> - stdsoap2_ck.c: stdsoap2.cpp
> --      $(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ck.c
> -+      $(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ck.c
> -
> - stdsoap2_cpp.cpp: stdsoap2.cpp
> --      $(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_cpp.cpp
> -+      $(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_cpp.cpp
> -
> - stdsoap2_ck_cpp.cpp: stdsoap2.cpp
> --      $(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ck_cpp.cpp
> -+      $(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ck_cpp.cpp
> -
> - stdsoap2_ssl.c: stdsoap2.cpp
> --      $(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl.c
> -+      $(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ssl.c
> -
> - stdsoap2_ssl_cpp.cpp: stdsoap2.cpp
> --      $(LN_S) -f $(srcdir)/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
> -+      $(LN_S) -f $(top_srcdir)/gsoap/stdsoap2.cpp stdsoap2_ssl_cpp.cpp
> - ## do the same fo dom.cpp since we want to link it into the cpp libs an=
d dom.c into the c libs
> - dom_cpp.cpp: dom.cpp
> --      $(LN_S) -f $(srcdir)/dom.cpp dom_cpp.cpp
> -+      $(LN_S) -f $(top_srcdir)/gsoap/dom.cpp dom_cpp.cpp
> -
> - lib_LIBRARIES =3D libgsoap.a libgsoap++.a libgsoapck.a libgsoapck++.a l=
ibgsoapssl.a libgsoapssl++.a
> -
> -diff --git a/gsoap/samples/autotest/Makefile.am b/gsoap/samples/autotest=
/Makefile.am
> -index 36adf51..61e514c 100644
> ---- a/gsoap/samples/autotest/Makefile.am
> -+++ b/gsoap/samples/autotest/Makefile.am
> -@@ -6,13 +6,13 @@
> - AUTOMAKE_OPTIONS =3D subdir-objects foreign 1.4
> -
> - CPPFLAGS=3D-I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
> --AM_LDFLAGS=3D$(CPPFLAGS) -I$(srcdir) -L$(srcdir)
> -+AM_LDFLAGS=3D$(CPPFLAGS) -I$(top_srcdir)/gsoap/samples/autotest -L$(top=
_srcdir)/gsoap/samples/autotest
> - SOAP=3D$(top_srcdir)/gsoap/src/soapcpp2$(EXEEXT)
> - WSDL=3D$(top_srcdir)/gsoap/wsdl/wsdl2h$(EXEEXT)
> --WSDL_FLAGS=3D-d -P -t $(srcdir)/typemap.dat
> -+WSDL_FLAGS=3D-d -P -t $(top_srcdir)/gsoap/samples/autotest/typemap.dat
> - SOAP_FLAGS=3D-SL -T -I$(top_srcdir)/gsoap/import -I$(top_srcdir)/gsoap/=
custom
> --WSDLINPUT=3D$(srcdir)/examples.wsdl
> --SOAPHEADER=3D$(srcdir)/examples.h
> -+WSDLINPUT=3D$(top_srcdir)/gsoap/samples/autotest/examples.wsdl
> -+SOAPHEADER=3D$(top_srcdir)/gsoap/samples/autotest/examples.h
> - SOAP_CPP_SRC=3DsoapC.cpp soapServer.cpp
> - SOAP_CPP_LIB=3D$(top_builddir)/gsoap/libgsoap++.a
> -
> -diff --git a/gsoap/samples/databinding/Makefile.am b/gsoap/samples/datab=
inding/Makefile.am
> -index 892d4fd..86ad482 100644
> ---- a/gsoap/samples/databinding/Makefile.am
> -+++ b/gsoap/samples/databinding/Makefile.am
> -@@ -6,13 +6,13 @@
> - AUTOMAKE_OPTIONS =3D subdir-objects foreign 1.4
> -
> - CPPFLAGS=3D$(SAMPLE_INCLUDES) -I$(top_srcdir)/gsoap -I$(top_srcdir)/gso=
ap/plugin
> --AM_LDFLAGS=3D$(AM_CPPFLAGS) -I$(srcdir) -L$(srcdir)
> -+AM_LDFLAGS=3D$(AM_CPPFLAGS) -I$(top_srcdir)/gsoap/samples/databinding -=
L$(top_srcdir)/gsoap/samples/databinding
> - SOAP=3D$(top_srcdir)/gsoap/src/soapcpp2$(EXEEXT)
> - WSDL=3D$(top_srcdir)/gsoap/wsdl/wsdl2h$(EXEEXT)
> --WSDL_FLAGS=3D-g -t $(srcdir)/addresstypemap.dat
> -+WSDL_FLAGS=3D-g -t $(top_srcdir)/gsoap/samples/databinding/addresstypem=
ap.dat
> - SOAP_FLAGS=3D-0 -CS -p address -I$(top_srcdir)/gsoap/import
> --WSDLINPUT=3D$(srcdir)/address.xsd
> --SOAPHEADER=3D$(srcdir)/address.h
> -+WSDLINPUT=3D$(top_srcdir)/gsoap/samples/databinding/address.xsd
> -+SOAPHEADER=3D$(top_srcdir)/gsoap/samples/databinding/address.h
> - SOAP_CPP_SRC=3DaddressC.cpp
> - SOAP_CPP_LIB=3D$(top_builddir)/gsoap/libgsoap++.a
> -
> -diff --git a/gsoap/wsdl/Makefile.am b/gsoap/wsdl/Makefile.am
> -index b8da5db..9f2aefa 100644
> ---- a/gsoap/wsdl/Makefile.am
> -+++ b/gsoap/wsdl/Makefile.am
> -@@ -6,14 +6,14 @@
> - AUTOMAKE_OPTIONS =3D foreign 1.4
> -
> - # INCLUDES=3D-I$(top_srcdir)/gsoap
> --# AM_LDFLAGS=3D$(INCLUDES) -I$(srcdir) -L$(srcdir)
> --AM_LDFLAGS=3D-L$(srcdir) -I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/pl=
ugin
> -+# AM_LDFLAGS=3D$(INCLUDES) -I$(top_srcdir)/gsoap/wsdl -L$(top_srcdir)/g=
soap/wsdl
> -+AM_LDFLAGS=3D-L$(top_srcdir)/gsoap/wsdl -I$(top_srcdir)/gsoap -I$(top_s=
rcdir)/gsoap/plugin
> - AM_CPPFLAGS=3D-I$(top_srcdir)/gsoap -I$(top_srcdir)/gsoap/plugin
> - SOAP=3D$(top_builddir)/gsoap/src/soapcpp2$(EXEEXT)
> - SOAP_CPP_LIB=3D$(top_builddir)/gsoap/$(WSDL2H_SOAP_CPP_LIB)
> - SOAP_CPP_SRC=3DwsdlC.cpp
> --SOAPHEADER=3D$(srcdir)/wsdl.h
> --SOAP_FLAGS=3D-SC -pwsdl -I$(srcdir) -I$(top_srcdir)/gsoap/import
> -+SOAPHEADER=3D$(top_srcdir)/gsoap/wsdl/wsdl.h
> -+SOAP_FLAGS=3D-SC -pwsdl -I$(top_srcdir)/gsoap/wsdl -I$(top_srcdir)/gsoa=
p/import
> - BUILT_SOURCES=3D$(SOAP_CPP_SRC)
> - # WSDL2H_EXTRA_FLAGS=3D-DWITH_OPENSSL -DWITH_GZIP # defined in configur=
e.in
> - # WSDL2H_EXTRA_LIBS=3D-lssl -lcrypto -lz # defined in configure.in
> -@@ -24,11 +24,14 @@ $(SOAP_CPP_SRC) : $(SOAPHEADER)
> - #LIBS=3D
> -
> - bin_PROGRAMS=3Dwsdl2h
> --
> -+if WITH_OPENSSL
> -+wsdl2h_LDADD=3D$(SOAP_CPP_LIB) $(top_srcdir)/gsoap/plugin/httpda.c $(to=
p_srcdir)/gsoap/plugin/smdevp.c $(top_srcdir)/gsoap/plugin/threads.c $(WSDL=
2H_EXTRA_LIBS)
> -+else
> -+wsdl2h_LDADD=3D$(SOAP_CPP_LIB) $(WSDL2H_EXTRA_LIBS)
> -+endif
> - wsdl2h_CFLAGS=3D$(C_DEBUG_FLAGS) $(SOAPCPP2_NO_C_LOCALE) $(WSDL2H_EXTRA=
_FLAGS)
> - wsdl2h_CXXFLAGS=3D$(C_DEBUG_FLAGS) $(SOAPCPP2_NO_C_LOCALE) $(WSDL2H_EXT=
RA_FLAGS) $(WSDL2H_IMPORTPATH)
> - wsdl2h_CPPFLAGS=3D$(AM_CPPFLAGS) $(SOAPCPP2_NONAMESPACES) -D$(platform)
> - wsdl2h_SOURCES=3Dwsdl2h.cpp wsdl.cpp wadl.cpp schema.cpp types.cpp serv=
ice.cpp soap.cpp mime.cpp wsp.cpp bpel.cpp $(SOAP_CPP_SRC)
> --wsdl2h_LDADD=3D$(SOAP_CPP_LIB) $(WSDL2H_EXTRA_LIBS)
> -
> - CLEANFILES=3D *~ *C.cpp *H.h *Stub.h *.nsmap
> ---
> -2.14.1
> -
> diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build=
-with-musl.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-b=
uild-with-musl.patch
> deleted file mode 100644
> index 571cbe540..000000000
> --- a/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-m=
usl.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From db260fbc7af4c73c997c485a0c69c61594a0e59c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 30 Aug 2017 19:48:50 -0700
> -Subject: [PATCH] stdgsoap2: Fix build with musl
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gsoap/stdsoap2.c   | 2 +-
> - gsoap/stdsoap2.cpp | 4 ++--
> - gsoap/stdsoap2.h   | 2 +-
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/gsoap/stdsoap2.c b/gsoap/stdsoap2.c
> -index 58e9df4..62389e1 100644
> ---- a/gsoap/stdsoap2.c
> -+++ b/gsoap/stdsoap2.c
> -@@ -4462,7 +4462,7 @@ tcp_gethost(struct soap *soap, const char *addr, s=
truct in_addr *inaddr)
> -       return soap->error =3D SOAP_EOM;
> -     return SOAP_OK;
> -   }
> --#if defined(__GLIBC__) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FR=
EEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
> -+#if defined(LINUX) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBS=
D) || defined(__FreeBSD__))) || defined(__ANDROID__)
> -   if (gethostbyname_r(addr, &hostent, soap->buf, sizeof(soap->buf), &ho=
st, &soap->errnum) < 0)
> -     host =3D NULL;
> - #elif defined(_AIX43) || ((defined(TRU64) || defined(HP_UX)) && defined=
(HAVE_GETHOSTBYNAME_R))
> -diff --git a/gsoap/stdsoap2.cpp b/gsoap/stdsoap2.cpp
> -index 58e9df4..b637161 100644
> ---- a/gsoap/stdsoap2.cpp
> -+++ b/gsoap/stdsoap2.cpp
> -@@ -4462,7 +4462,7 @@ tcp_gethost(struct soap *soap, const char *addr, s=
truct in_addr *inaddr)
> -       return soap->error =3D SOAP_EOM;
> -     return SOAP_OK;
> -   }
> --#if defined(__GLIBC__) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FR=
EEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
> -+#if defined(LINUX) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBS=
D) || defined(__FreeBSD__))) || defined(__ANDROID__)
> -   if (gethostbyname_r(addr, &hostent, soap->buf, sizeof(soap->buf), &ho=
st, &soap->errnum) < 0)
> -     host =3D NULL;
> - #elif defined(_AIX43) || ((defined(TRU64) || defined(HP_UX)) && defined=
(HAVE_GETHOSTBYNAME_R))
> -@@ -19658,7 +19658,7 @@ soap_strerror(struct soap *soap)
> -   {
> - #ifndef WIN32
> - # ifdef HAVE_STRERROR_R
> --#  if defined(_GNU_SOURCE) && !defined(__ANDROID__)
> -+#  if defined(_GNU_SOURCE) && !defined(__ANDROID__) && defined(__GLIBC_=
_)
> -     return strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* GNU-=
specific */
> - #  else
> -     strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-complia=
nt */
> -diff --git a/gsoap/stdsoap2.h b/gsoap/stdsoap2.h
> -index 07a3952..c6ace4c 100644
> ---- a/gsoap/stdsoap2.h
> -+++ b/gsoap/stdsoap2.h
> -@@ -947,7 +947,7 @@ extern "C" {
> - # endif
> - #elif defined(SOCKLEN_T)
> - # define SOAP_SOCKLEN_T SOCKLEN_T
> --#elif defined(__socklen_t_defined) || defined(_SOCKLEN_T) || defined(CY=
GWIN) || defined(FREEBSD) || defined(__FreeBSD__) || defined(OPENBSD) || de=
fined(__QNX__) || defined(QNX) || defined(OS390) || defined(__ANDROID__) ||=
 defined(_XOPEN_SOURCE)
> -+#elif defined(__socklen_t_defined) || defined(_SOCKLEN_T) || defined(CY=
GWIN) || defined(FREEBSD) || defined(__FreeBSD__) || defined(OPENBSD) || de=
fined(__QNX__) || defined(QNX) || defined(OS390) || defined(__ANDROID__) ||=
 defined(_XOPEN_SOURCE) || defined (LINUX)
> - # define SOAP_SOCKLEN_T socklen_t
> - #elif defined(IRIX) || defined(WIN32) || defined(__APPLE__) || defined(=
SUN_OS) || defined(OPENSERVER) || defined(TRU64) || defined(VXWORKS)
> - # define SOAP_SOCKLEN_T int
> ---
> -2.14.1
> -
> diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb b/meta-oe/reci=
pes-support/gsoap/gsoap_2.8.95.bb
> similarity index 82%
> rename from meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
> rename to meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
> index 36530d2df..22a049892 100644
> --- a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
> +++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb
> @@ -6,11 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4f40a9413=
79143186f9602242c3fb729 \
>                      file://GPLv2_license.txt;md5=3Da33672dbe491b6517750a=
0389063508b"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
> -           file://0001-Fix-out-of-tree-builds.patch \
> -           file://0001-stdgsoap2-Fix-build-with-musl.patch \
>             "
> -SRC_URI[md5sum] =3D "212951d6e1435bb51fa4320f458809ea"
> -SRC_URI[sha256sum] =3D "3e7bb24a9e492f5cb86daca34054c9787152f1d7b70add36=
b789d03816d5ffa1"
> +SRC_URI[md5sum] =3D "88031646018d60857f21246962d10011"
> +SRC_URI[sha256sum] =3D "fe07aa152cd946ef8ebd3f87653f14c1d38efe7c6e6fce8c=
6f773c4814f79baf"
>
>  inherit autotools
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

