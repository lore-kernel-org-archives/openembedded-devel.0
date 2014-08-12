Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C0E31609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:37:32 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so9775418wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fP5uXb2OXZ9pojbFZVv/B6unT8BABG4uOYu87dl6yxA=;
	b=TkcsGlLX8MnOjOSFKhpLggybu+Yz3vWmcKfsNrPNX8jozKZBsrDKXLQcqAjitXhyYg
	CNoU+JRavso9D0tbDVD3OUC801X46mh8QQ/k1OlQAlVw7Flt+XYXv+8gDAzp8GiBXN0x
	nGyF8dg22hgdiUUDRKYAKyOMGLL9nDXjzLgwEdBIdl6/JNl5/dxZ+tQN3zwQr30VgiSy
	T14UXZurN6urd0bdRhrWT/03tzYb80pL+RCnwvsv966K0GqM7qVHpPnki66QyteaKYL1
	kl6wI+qIH5UkJTI4uQYpf+YP7uGLoJAgd/ir0uu0JssnJlXtTlBaqE2gN+YbbzP/fb0O
	11FA==
X-Received: by 10.194.202.231 with SMTP id kl7mr2462971wjc.134.1407843453301; 
	Tue, 12 Aug 2014 04:37:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xn12sm55282904wib.13.2014.08.12.04.37.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:37:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:38:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812113808.GH14848@jama>
References: <20140728185013.GA17391@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20140728185013.GA17391@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] uprev openldap 2.4.39
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
X-List-Received-Date: Tue, 12 Aug 2014 11:37:36 -0000
X-Groupsio-MsgNum: 51614
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MQHH0Amk2SOv3s5T"
Content-Disposition: inline

--MQHH0Amk2SOv3s5T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2014 at 02:50:13PM -0400, Amy Fong wrote:
> From 10be38b1a220079953f1aab0d1d79eee10a9855e Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Tue, 15 Jul 2014 17:48:54 -0400
> Subject: [PATCH] keystone: package openLDAP 2.4.39
>=20
> The patches are taken from Debian.

Please fix:

openldap-2.4.39: openldap: Files/directories were installed but not shipped
  /run [installed-vs-shipped]

>=20
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  .../add-tlscacert-option-to-ldap-conf.patch        |  10 +
>  .../openldap-2.4.39/autogroup-makefile.patch       |  35 ++++
>  .../contrib-modules-use-dpkg-buildflags.patch      |  40 ++++
>  .../do-not-second-guess-sonames.patch              |  68 +++++++
>  .../openldap/openldap-2.4.39/evolution-ntlm.patch  | 222 +++++++++++++++=
++++++
>  .../openldap-2.4.39/fix-build-top-mk.patch         |  11 +
>  .../openldap-2.4.39/fix-ftbfs-binutils-gold.patch  |  64 ++++++
>  .../getaddrinfo-is-threadsafe.patch                |  43 ++++
>  .../openldap/openldap-2.4.39/heimdal-fix.patch     |  23 +++
>  .../index-files-created-as-root.patch              |  37 ++++
>  .../openldap/openldap-2.4.39/install-strip.patch   |  14 ++
>  .../openldap-2.4.39/ldap-conf-tls-cacertdir.patch  |  29 +++
>  .../openldap-2.4.39/ldapi-socket-place.patch       |  16 ++
>  .../openldap-2.4.39/libldap-symbol-versions.patch  | 161 +++++++++++++++
>  .../openldap/openldap-2.4.39/man-slapd.patch       |  60 ++++++
>  .../openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch      |  25 +++
>  .../no-bdb-ABI-second-guessing.patch               |  42 ++++
>  .../openldap-2.4.39/sasl-default-path.patch        |  55 +++++
>  .../openldap/openldap-2.4.39/series                |  21 ++
>  .../openldap-2.4.39/slapi-errorlog-file.patch      |  16 ++
>  .../openldap-2.4.39/smbk5pwd-makefile.patch        |  53 +++++
>  ..._dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch |  40 ++++
>  .../openldap-2.4.39/wrong-database-location.patch  |  74 +++++++
>  .../recipes-support/openldap/openldap_2.4.39.bb    | 182 +++++++++++++++=
++
>  24 files changed, 1341 insertions(+)
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/add-=
tlscacert-option-to-ldap-conf.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/auto=
group-makefile.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/cont=
rib-modules-use-dpkg-buildflags.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/do-n=
ot-second-guess-sonames.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/evol=
ution-ntlm.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/fix-=
build-top-mk.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/fix-=
ftbfs-binutils-gold.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/geta=
ddrinfo-is-threadsafe.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/heim=
dal-fix.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/inde=
x-files-created-as-root.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/inst=
all-strip.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/ldap=
-conf-tls-cacertdir.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/ldap=
i-socket-place.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/libl=
dap-symbol-versions.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/man-=
slapd.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/no-A=
M_INIT_AUTOMAKE.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/no-b=
db-ABI-second-guessing.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/sasl=
-default-path.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/seri=
es
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/slap=
i-errorlog-file.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/smbk=
5pwd-makefile.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/swit=
ch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/wron=
g-database-location.patch
>  create mode 100644 meta-oe/recipes-support/openldap/openldap_2.4.39.bb
>=20
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/add-tlscace=
rt-option-to-ldap-conf.patch b/meta-oe/recipes-support/openldap/openldap-2.=
4.39/add-tlscacert-option-to-ldap-conf.patch
> new file mode 100644
> index 0000000..e8e731a
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/add-tlscacert-opti=
on-to-ldap-conf.patch
> @@ -0,0 +1,10 @@
> +--- a/libraries/libldap/ldap.conf
> ++++ b/libraries/libldap/ldap.conf
> +@@ -11,3 +11,7 @@
> + #SIZELIMIT	12
> + #TIMELIMIT	15
> + #DEREF		never
> ++
> ++# TLS certificates (needed for GnuTLS)
> ++TLS_CACERT	/etc/ssl/certs/ca-certificates.crt
> ++
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/autogroup-m=
akefile.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/autogroup-=
makefile.patch
> new file mode 100644
> index 0000000..d3f56c3
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/autogroup-makefile=
=2Epatch
> @@ -0,0 +1,35 @@
> +--- a/contrib/slapd-modules/autogroup/Makefile
> ++++ b/contrib/slapd-modules/autogroup/Makefile
> +@@ -2,11 +2,11 @@
> +=20
> + LDAP_SRC =3D ../../..
> + LDAP_BUILD =3D ../../..
> +-LDAP_INC =3D -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC=
)/servers/slapd
> +-LDAP_LIB =3D $(LDAP_BUILD)/libraries/libldap_r/libldap_r.la \
> +-	$(LDAP_BUILD)/libraries/liblber/liblber.la
> ++LDAP_INC =3D -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/inclu=
de -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
> ++LDAP_LIB =3D $(LDAP_BUILD)/debian/build/libraries/libldap_r/libldap_r.l=
a \
> ++	$(LDAP_BUILD)/debian/build/libraries/liblber/liblber.la
> +=20
> +-LIBTOOL =3D $(LDAP_BUILD)/libtool
> ++LIBTOOL =3D $(LDAP_BUILD)/debian/build/libtool
> + CC =3D gcc
> + OPT =3D -g -O2 -Wall
> + DEFS =3D=20
> +@@ -16,13 +16,13 @@ LIBS =3D $(LDAP_LIB)
> + PROGRAMS =3D autogroup.la
> + LTVER =3D 0:0:0
> +=20
> +-prefix=3D/usr/local
> ++prefix=3D/usr
> + exec_prefix=3D$(prefix)
> +-ldap_subdir=3D/openldap
> ++ldap_subdir=3D/ldap
> +=20
> + libdir=3D$(exec_prefix)/lib
> + libexecdir=3D$(exec_prefix)/libexec
> +-moduledir =3D $(libexecdir)$(ldap_subdir)
> ++moduledir =3D $(libdir)$(ldap_subdir)
> +=20
> + .SUFFIXES: .c .o .lo
> +=20
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/contrib-mod=
ules-use-dpkg-buildflags.patch b/meta-oe/recipes-support/openldap/openldap-=
2.4.39/contrib-modules-use-dpkg-buildflags.patch
> new file mode 100644
> index 0000000..1b15529
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/contrib-modules-us=
e-dpkg-buildflags.patch
> @@ -0,0 +1,40 @@
> +Description: pass CFLAGS to contrib builds
> + $(CFLAGS) is missing from the compiler invocations for autogroup and
> + smbk5pwd, which means they're not being hardened.
> +Author: Simon Ruderich <simon@ruderich.org>
> +Bug-Debian: http://bugs.debian.org/663724
> +
> +--- a/contrib/slapd-modules/autogroup/Makefile
> ++++ b/contrib/slapd-modules/autogroup/Makefile
> +@@ -27,12 +27,12 @@ moduledir =3D $(libexecdir)$(ldap_subdir)
> + .SUFFIXES: .c .o .lo
> +=20
> + .c.lo:
> +-	$(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(DEFS) $(INCS) -c $<
> ++	$(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(CFLAGS) $(DEFS) $(INCS) -c =
$<
> +=20
> + all: $(PROGRAMS)
> +=20
> + autogroup.la: autogroup.lo
> +-	$(LIBTOOL) --mode=3Dlink $(CC) $(OPT) -version-info $(LTVER) \
> ++	$(LIBTOOL) --mode=3Dlink $(CC) $(OPT) $(LDFLAGS) -version-info $(LTVER=
) \
> + 	-rpath $(moduledir) -module -o $@ $? $(LIBS)
> +=20
> + clean:
> +--- a/contrib/slapd-modules/smbk5pwd/Makefile
> ++++ b/contrib/slapd-modules/smbk5pwd/Makefile
> +@@ -46,12 +46,12 @@ moduledir =3D $(libexecdir)$(ldap_subdir)
> + .SUFFIXES: .c .o .lo
> +=20
> + .c.lo:
> +-	$(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(DEFS) $(INCS) -c $<
> ++	$(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(CFLAGS) $(DEFS) $(INCS) -c =
$<
> +=20
> + all: $(PROGRAMS)
> +=20
> + smbk5pwd.la:	smbk5pwd.lo
> +-	$(LIBTOOL) --mode=3Dlink $(CC) $(OPT) -version-info $(LTVER) \
> ++	$(LIBTOOL) --mode=3Dlink $(CC) $(OPT) $(LDFLAGS) -version-info $(LTVER=
) \
> + 	-rpath $(moduledir) -module -o $@ $? $(LIBS)
> +=20
> + clean:
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/do-not-seco=
nd-guess-sonames.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/d=
o-not-second-guess-sonames.patch
> new file mode 100644
> index 0000000..31cf652
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/do-not-second-gues=
s-sonames.patch
> @@ -0,0 +1,68 @@
> +Rip out code that second-guesses the libsasl soname / Debian shlibs.  If
> +cyrus sasl upstream is breaking the ABI, this needs to be fixed upstream
> +there, not kludged around upstream here!
> +
> +Debian bug #546885
> +
> +Upstream ITS #6302 filed.
> +
> +--- a/libraries/libldap/cyrus.c
> ++++ b/libraries/libldap/cyrus.c
> +@@ -74,28 +74,6 @@ int ldap_int_sasl_init( void )
> + 	/* XXX not threadsafe */
> + 	static int sasl_initialized =3D 0;
> +=20
> +-#ifdef HAVE_SASL_VERSION
> +-	/* stringify the version number, sasl.h doesn't do it for us */
> +-#define VSTR0(maj, min, pat)	#maj "." #min "." #pat
> +-#define VSTR(maj, min, pat)	VSTR0(maj, min, pat)
> +-#define SASL_VERSION_STRING	VSTR(SASL_VERSION_MAJOR, SASL_VERSION_MINOR=
, \
> +-				SASL_VERSION_STEP)
> +-	{ int rc;
> +-	sasl_version( NULL, &rc );
> +-	if ( ((rc >> 16) !=3D ((SASL_VERSION_MAJOR << 8)|SASL_VERSION_MINOR)) =
||
> +-		(rc & 0xffff) < SASL_VERSION_STEP) {
> +-		char version[sizeof("xxx.xxx.xxxxx")];
> +-		sprintf( version, "%u.%d.%d", (unsigned)rc >> 24, (rc >> 16) & 0xff,
> +-			rc & 0xffff );
> +-
> +-		Debug( LDAP_DEBUG_ANY,
> +-		"ldap_int_sasl_init: SASL library version mismatch:"
> +-		" expected " SASL_VERSION_STRING ","
> +-		" got %s\n", version, 0, 0 );
> +-		return -1;
> +-	}
> +-	}
> +-#endif
> + 	if ( sasl_initialized ) {
> + 		return 0;
> + 	}
> +--- a/servers/slapd/sasl.c
> ++++ b/servers/slapd/sasl.c
> +@@ -1145,26 +1145,6 @@ int slap_sasl_init( void )
> + #endif
> +=20
> + #ifdef HAVE_CYRUS_SASL
> +-#ifdef HAVE_SASL_VERSION
> +-	/* stringify the version number, sasl.h doesn't do it for us */
> +-#define	VSTR0(maj, min, pat)	#maj "." #min "." #pat
> +-#define	VSTR(maj, min, pat)	VSTR0(maj, min, pat)
> +-#define	SASL_VERSION_STRING	VSTR(SASL_VERSION_MAJOR, SASL_VERSION_MINOR=
, \
> +-				SASL_VERSION_STEP)
> +-
> +-	sasl_version( NULL, &rc );
> +-	if ( ((rc >> 16) !=3D ((SASL_VERSION_MAJOR << 8)|SASL_VERSION_MINOR)) =
||
> +-		(rc & 0xffff) < SASL_VERSION_STEP)
> +-	{
> +-		char version[sizeof("xxx.xxx.xxxxx")];
> +-		sprintf( version, "%u.%d.%d", (unsigned)rc >> 24, (rc >> 16) & 0xff,
> +-			rc & 0xffff );
> +-		Debug( LDAP_DEBUG_ANY, "slap_sasl_init: SASL library version mismatch=
:"
> +-			" expected %s, got %s\n",
> +-			SASL_VERSION_STRING, version, 0 );
> +-		return -1;
> +-	}
> +-#endif
> +=20
> + 	sasl_set_mutex(
> + 		ldap_pvt_sasl_mutex_new,
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/evolution-n=
tlm.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/evolution-ntlm=
=2Epatch
> new file mode 100644
> index 0000000..cd9bc26
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.pat=
ch
> @@ -0,0 +1,222 @@
> +Patch from evolution-exchange (2.10.3).  The ldap_ntlm_bind function is
> +actually called by evolution-data-server, checked at version 1.12.2.
> +Without this patch, the Exchange addressbook integration uses simple bin=
ds
> +with cleartext passwords.
> +
> +Russ checked with openldap-software for upstream's opinion on this patch
> +on 2007-12-21.  Upstream had never received it as a patch submission and
> +given that it's apparently only for older Exchange servers that can't do
> +SASL and DIGEST-MD5, it's not very appealing.
> +
> +Bug#457374 filed against evolution-data-server asking if this support is
> +still required on 2007-12-21.
> +
> +--- a/include/ldap.h
> ++++ b/include/ldap.h
> +@@ -2517,5 +2517,25 @@ ldap_parse_deref_control LDAP_P((
> + 	LDAPControl	**ctrls,
> + 	LDAPDerefRes	**drp ));
> +=20
> ++/*
> ++ * hacks for NTLM
> ++ */
> ++#define LDAP_AUTH_NTLM_REQUEST ((ber_tag_t) 0x8aU)
> ++#define LDAP_AUTH_NTLM_RESPONSE  ((ber_tag_t) 0x8bU)
> ++LDAP_F( int )
> ++ldap_ntlm_bind LDAP_P((
> ++      LDAP    *ld,
> ++      LDAP_CONST char *dn,
> ++      ber_tag_t tag,
> ++      struct berval *cred,
> ++      LDAPControl **sctrls,
> ++      LDAPControl **cctrls,
> ++      int   *msgidp ));
> ++LDAP_F( int )
> ++ldap_parse_ntlm_bind_result LDAP_P((
> ++      LDAP    *ld,
> ++      LDAPMessage *res,
> ++      struct berval *challenge));
> ++
> + LDAP_END_DECL
> + #endif /* _LDAP_H */
> +--- /dev/null
> ++++ b/libraries/libldap/ntlm.c
> +@@ -0,0 +1,138 @@
> ++/* $OpenLDAP: pkg/ldap/libraries/libldap/ntlm.c,v 1.1.4.10 2002/01/04 2=
0:38:21 kurt Exp $ */
> ++/*
> ++ * Copyright 1998-2002 The OpenLDAP Foundation, All Rights Reserved.
> ++ * COPYING RESTRICTIONS APPLY, see COPYRIGHT file
> ++ */
> ++
> ++/* Mostly copied from sasl.c */
> ++
> ++#include "portable.h"
> ++
> ++#include <stdlib.h>
> ++#include <stdio.h>
> ++
> ++#include <ac/socket.h>
> ++#include <ac/string.h>
> ++#include <ac/time.h>
> ++#include <ac/errno.h>
> ++
> ++#include "ldap-int.h"
> ++
> ++int
> ++ldap_ntlm_bind(
> ++ LDAP    *ld,
> ++ LDAP_CONST char *dn,
> ++ ber_tag_t tag,
> ++ struct berval *cred,
> ++ LDAPControl **sctrls,
> ++ LDAPControl **cctrls,
> ++ int   *msgidp )
> ++{
> ++ BerElement  *ber;
> ++ int rc;
> ++ ber_int_t id;
> ++
> ++ Debug( LDAP_DEBUG_TRACE, "ldap_ntlm_bind\n", 0, 0, 0 );
> ++
> ++ assert( ld !=3D NULL );
> ++ assert( LDAP_VALID( ld ) );
> ++ assert( msgidp !=3D NULL );
> ++
> ++ if( msgidp =3D=3D NULL ) {
> ++   ld->ld_errno =3D LDAP_PARAM_ERROR;
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ /* create a message to send */
> ++ if ( (ber =3D ldap_alloc_ber_with_options( ld )) =3D=3D NULL ) {
> ++   ld->ld_errno =3D LDAP_NO_MEMORY;
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ assert( LBER_VALID( ber ) );
> ++
> ++ LDAP_NEXT_MSGID( ld, id );
> ++ rc =3D ber_printf( ber, "{it{istON}" /*}*/,
> ++      id, LDAP_REQ_BIND,
> ++      ld->ld_version, dn, tag,
> ++      cred );
> ++
> ++ /* Put Server Controls */
> ++ if( ldap_int_put_controls( ld, sctrls, ber ) !=3D LDAP_SUCCESS ) {
> ++   ber_free( ber, 1 );
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ if ( ber_printf( ber, /*{*/ "N}" ) =3D=3D -1 ) {
> ++   ld->ld_errno =3D LDAP_ENCODING_ERROR;
> ++   ber_free( ber, 1 );
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ /* send the message */
> ++ *msgidp =3D ldap_send_initial_request( ld, LDAP_REQ_BIND, dn, ber, id =
);
> ++
> ++ if(*msgidp < 0)
> ++   return ld->ld_errno;
> ++
> ++ return LDAP_SUCCESS;
> ++}
> ++
> ++int
> ++ldap_parse_ntlm_bind_result(
> ++ LDAP    *ld,
> ++ LDAPMessage *res,
> ++ struct berval *challenge)
> ++{
> ++ ber_int_t errcode;
> ++ ber_tag_t tag;
> ++ BerElement  *ber;
> ++ ber_len_t len;
> ++
> ++ Debug( LDAP_DEBUG_TRACE, "ldap_parse_ntlm_bind_result\n", 0, 0, 0 );
> ++
> ++ assert( ld !=3D NULL );
> ++ assert( LDAP_VALID( ld ) );
> ++ assert( res !=3D NULL );
> ++
> ++ if ( ld =3D=3D NULL || res =3D=3D NULL ) {
> ++   return LDAP_PARAM_ERROR;
> ++ }
> ++
> ++ if( res->lm_msgtype !=3D LDAP_RES_BIND ) {
> ++   ld->ld_errno =3D LDAP_PARAM_ERROR;
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ if ( ld->ld_error ) {
> ++   LDAP_FREE( ld->ld_error );
> ++   ld->ld_error =3D NULL;
> ++ }
> ++ if ( ld->ld_matched ) {
> ++   LDAP_FREE( ld->ld_matched );
> ++   ld->ld_matched =3D NULL;
> ++ }
> ++
> ++ /* parse results */
> ++
> ++ ber =3D ber_dup( res->lm_ber );
> ++
> ++ if( ber =3D=3D NULL ) {
> ++   ld->ld_errno =3D LDAP_NO_MEMORY;
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ tag =3D ber_scanf( ber, "{ioa" /*}*/,
> ++      &errcode, challenge, &ld->ld_error );
> ++ ber_free( ber, 0 );
> ++
> ++ if( tag =3D=3D LBER_ERROR ) {
> ++   ld->ld_errno =3D LDAP_DECODING_ERROR;
> ++   return ld->ld_errno;
> ++ }
> ++
> ++ ld->ld_errno =3D errcode;
> ++
> ++ return( ld->ld_errno );
> ++}
> ++
> +--- a/libraries/libldap/Makefile.in
> ++++ b/libraries/libldap/Makefile.in
> +@@ -27,7 +27,7 @@ SRCS	=3D bind.c open.c result.c error.c co
> + 	init.c options.c print.c string.c util-int.c schema.c \
> + 	charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
> + 	tls2.c tls_o.c tls_g.c tls_m.c \
> +-	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
> ++	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c ntlm.c \
> + 	assertion.c deref.c ldif.c fetch.c
> +=20
> + OBJS	=3D bind.lo open.lo result.lo error.lo compare.lo search.lo \
> +@@ -40,7 +40,7 @@ OBJS	=3D bind.lo open.lo result.lo error.l
> + 	init.lo options.lo print.lo string.lo util-int.lo schema.lo \
> + 	charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
> + 	tls2.lo tls_o.lo tls_g.lo tls_m.lo \
> +-	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
> ++	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo ntlm.lo \
> + 	assertion.lo deref.lo ldif.lo fetch.lo
> +=20
> + LDAP_INCDIR=3D ../../include      =20
> +--- a/libraries/libldap_r/Makefile.in
> ++++ b/libraries/libldap_r/Makefile.in
> +@@ -29,7 +29,7 @@ XXSRCS    =3D apitest.c test.c \
> + 	init.c options.c print.c string.c util-int.c schema.c \
> + 	charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
> + 	tls2.c tls_o.c tls_g.c tls_m.c \
> +-	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
> ++	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c ntlm.c \
> + 	assertion.c deref.c ldif.c fetch.c
> + SRCS	=3D threads.c rdwr.c rmutex.c tpool.c rq.c \
> + 	thr_posix.c thr_cthreads.c thr_thr.c thr_nt.c \
> +@@ -47,7 +47,7 @@ OBJS	=3D threads.lo rdwr.lo rmutex.lo tpoo
> + 	init.lo options.lo print.lo string.lo util-int.lo schema.lo \
> + 	charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
> + 	tls2.lo tls_o.lo tls_g.lo tls_m.lo \
> +-	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
> ++	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo ntlm.lo \
> + 	assertion.lo deref.lo ldif.lo fetch.lo
> +=20
> + LDAP_INCDIR=3D ../../include      =20
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/fix-build-t=
op-mk.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/fix-build-to=
p-mk.patch
> new file mode 100644
> index 0000000..418fe35
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.p=
atch
> @@ -0,0 +1,11 @@
> +--- a/build/top.mk
> ++++ b/build/top.mk
> +@@ -20,7 +20,7 @@
> + RELEASEDATE=3D @OPENLDAP_RELEASE_DATE@
> +=20
> + @SET_MAKE@
> +-SHELL =3D /bin/sh
> ++SHELL =3D @SHELL@
> +=20
> + top_builddir =3D @top_builddir@
> +=20
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-b=
inutils-gold.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/fix-f=
tbfs-binutils-gold.patch
> new file mode 100644
> index 0000000..1f0ca88
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils=
-gold.patch
> @@ -0,0 +1,64 @@
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1214,7 +1214,7 @@ if test $ol_link_tls =3D no ; then
> + 				ol_with_tls=3Dgnutls
> + 				ol_link_tls=3Dyes
> +=20
> +-				TLS_LIBS=3D"-lgnutls"
> ++				TLS_LIBS=3D"-lgnutls -lgcrypt"
> +=20
> + 				AC_DEFINE(HAVE_GNUTLS, 1,=20
> + 					[define if you have GNUtls])
> +--- a/libraries/libldap/Makefile.in
> ++++ b/libraries/libldap/Makefile.in
> +@@ -51,21 +51,21 @@ LIB_DEFS =3D -DLDAP_LIBRARY
> + XLIBS =3D $(LIBRARY) $(LDAP_LIBLBER_LA) $(LDAP_LIBLUTIL_A)
> + XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)
> + NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> +-UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> ++UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(TLS=
_LIBS)
> + ifneq (,$(VERSION_OPTION))
> +   VERSION_FLAGS =3D $(VERSION_OPTION)$(srcdir)/libldap.map
> + endif
> +=20
> + apitest:	$(XLIBS) apitest.o
> +-	$(LTLINK) -o $@ apitest.o $(LIBS)
> ++	$(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)
> + dntest:	$(XLIBS) dntest.o
> +-	$(LTLINK) -o $@ dntest.o $(LIBS)
> ++	$(LTLINK) -o $@ dntest.o $(LIBS) $(TLS_LIBS)
> + ftest:	$(XLIBS) ftest.o
> +-	$(LTLINK) -o $@ ftest.o $(LIBS)
> ++	$(LTLINK) -o $@ ftest.o $(LIBS) $(TLS_LIBS)
> + ltest:	$(XLIBS) test.o
> +-	$(LTLINK) -o $@ test.o $(LIBS)
> ++	$(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)
> + urltest: $(XLIBS) urltest.o
> +-	$(LTLINK) -o $@ urltest.o $(LIBS)
> ++	$(LTLINK) -o $@ urltest.o $(LIBS) $(TLS_LIBS)
> +=20
> + CFFILES=3Dldap.conf
> +=20
> +--- a/libraries/libldap_r/Makefile.in
> ++++ b/libraries/libldap_r/Makefile.in
> +@@ -60,7 +60,7 @@ XLIBS =3D $(LIBRARY) $(LDAP_LIBLBER_LA) $(
> + XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)
> + XXXLIBS =3D $(LTHREAD_LIBS)
> + NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> +-UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTH=
READ_LIBS)
> ++UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTH=
READ_LIBS) $(TLS_LIBS)
> + ifneq (,$(VERSION_OPTION))
> +   VERSION_FLAGS =3D "$(VERSION_OPTION)$(XXDIR)/libldap.map"
> + endif
> +@@ -80,9 +80,9 @@ clean-local: FORCE
> + depend-common: .links
> +=20
> + apitest:	$(XLIBS) apitest.o
> +-	$(LTLINK) -o $@ apitest.o $(LIBS)
> ++	$(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)
> + ltest:	$(XLIBS) test.o
> +-	$(LTLINK) -o $@ test.o $(LIBS)
> ++	$(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)
> +=20
> + install-local: $(CFFILES) FORCE
> + 	-$(MKDIR) $(DESTDIR)$(libdir)
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/getaddrinfo=
-is-threadsafe.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/get=
addrinfo-is-threadsafe.patch
> new file mode 100644
> index 0000000..ab6e2b7
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-thr=
eadsafe.patch
> @@ -0,0 +1,43 @@
> +Author: Steve Langasek <vorlon@debian.org>
> +
> +OpenLDAP upstream conservatively assumes that certain resolver functions
> +(getaddrinfo, getnameinfo, res_query, dn_expand) are not re-entrant; but=
 we
> +know that the glibc implementations of these functions are thread-safe, =
so
> +we should bypass the use of this mutex.  This fixes a locking problem wh=
en
> +an application uses libldap and libnss-ldap is also used for hosts
> +resolution.
> +
> +Closes Debian bug #340601.
> +
> +Not suitable for forwarding upstream; might be made suitable by adding a
> +configure-time check for glibc and disabling the mutex only on known
> +thread-safe implementations.
> +
> +--- a/libraries/libldap/os-ip.c
> ++++ b/libraries/libldap/os-ip.c
> +@@ -602,13 +602,7 @@ ldap_connect_to_host(LDAP *ld, Sockbuf *
> + 	hints.ai_socktype =3D socktype;
> + 	snprintf(serv, sizeof serv, "%d", port );
> +=20
> +-	/* most getaddrinfo(3) use non-threadsafe resolver libraries */
> +-	LDAP_MUTEX_LOCK(&ldap_int_resolv_mutex);
> +-
> + 	err =3D getaddrinfo( host, serv, &hints, &res );
> +-
> +-	LDAP_MUTEX_UNLOCK(&ldap_int_resolv_mutex);
> +-
> + 	if ( err !=3D 0 ) {
> + 		osip_debug(ld, "ldap_connect_to_host: getaddrinfo failed: %s\n",
> + 			AC_GAI_STRERROR(err), 0, 0);
> +--- a/libraries/libldap/util-int.c
> ++++ b/libraries/libldap/util-int.c
> +@@ -431,9 +431,7 @@ int ldap_pvt_get_hname(
> + 	int rc;
> + #if defined( HAVE_GETNAMEINFO )
> +=20
> +-	LDAP_MUTEX_LOCK( &ldap_int_resolv_mutex );
> + 	rc =3D getnameinfo( sa, len, name, namelen, NULL, 0, 0 );
> +-	LDAP_MUTEX_UNLOCK( &ldap_int_resolv_mutex );
> + 	if ( rc ) *err =3D (char *)AC_GAI_STRERROR( rc );
> + 	return rc;
> +=20
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/heimdal-fix=
=2Epatch b/meta-oe/recipes-support/openldap/openldap-2.4.39/heimdal-fix.pat=
ch
> new file mode 100644
> index 0000000..4aad47c
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
> @@ -0,0 +1,23 @@
> +Author: Mattias Ellert <mattias.ellert@fysast.uu.se>
> +Description: adapt parameters of hdb_generate_key_set_password() to heim=
dal 1.6~git20120311
> + .
> + With version heimdal 1.6~git20120311 heimdal schanged the number of par=
ameters
> + of function hdb_generate_key_set_password(), implementing a fallback to=
 "default"
> + values when NULL-values are passed for these parameters.
> + .
> + This patch does exactly that.
> + .
> +Bug-Debian: 664930
> +Reviewed-by: Peter Marschall <peter@adpm.de>
> +
> +--- a/contrib/slapd-modules/smbk5pwd/smbk5pwd.c
> ++++ b/contrib/slapd-modules/smbk5pwd/smbk5pwd.c
> +@@ -470,7 +470,7 @@ static int smbk5pwd_exop_passwd(
> + 		}
> +=20
> + 		ret =3D hdb_generate_key_set_password(context, ent.principal,
> +-			qpw->rs_new.bv_val, &ent.keys.val, &nkeys);
> ++			qpw->rs_new.bv_val, NULL, 0, &ent.keys.val, &nkeys);
> + 		ent.keys.len =3D nkeys;
> + 		hdb_seal_keys(context, db, &ent);
> + 		krb5_free_principal( context, ent.principal );
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/index-files=
-created-as-root.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/i=
ndex-files-created-as-root.patch
> new file mode 100644
> index 0000000..47fc88a
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/index-files-create=
d-as-root.patch
> @@ -0,0 +1,37 @@
> +Document in the man page that slapindex should be run as the same user
> +as slapd, and print a warning if it's run as root (since Debian defaults
> +to running slapd as openldap).
> +
> +Not suitable for upstream in this form.  This patch needs to be reworked
> +to check the BerkeleyDB database ownership and only warn if running as
> +root with a database that's not owned by root.
> +
> +Upstream ITS #5356 filed requesting better handling of this.  Current
> +upstream discussion leans towards putting the check into the database
> +backend and aborting if slapd is run as a different user than the databa=
se
> +owner, which is an even better fix.
> +
> +--- a/doc/man/man8/slapindex.8
> ++++ b/doc/man/man8/slapindex.8
> +@@ -148,6 +148,10 @@
> + should not be running (at least, not in read-write
> + mode) when you do this to ensure consistency of the database.
> + .LP
> ++slapindex ought to be run as the user specified for
> ++.BR slapd (8)
> ++to ensure correct database permissions.
> ++.LP
> + This command provides ample opportunity for the user to obtain
> + and drink their favorite beverage.
> + .SH EXAMPLES
> +--- a/servers/slapd/slapindex.c
> ++++ b/servers/slapd/slapindex.c
> +@@ -34,6 +34,8 @@
> + int
> + slapindex( int argc, char **argv )
> + {
> ++    if (geteuid() =3D=3D 0)
> ++        fprintf( stderr, "\nWARNING!\nRunnig as root!\nThere's a fair c=
hance slapd will fail to start.\nCheck file permissions!\n\n");
> + 	ID id;
> + 	int rc =3D EXIT_SUCCESS;
> + 	const char *progname =3D "slapindex";
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/install-str=
ip.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/install-strip.p=
atch
> new file mode 100644
> index 0000000..2992b70
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/install-strip.patch
> @@ -0,0 +1,14 @@
> +# This patch ensures that the install operations which strip
> +# programs and libraries (LTINSTALL) work in a cross build
> +# environment.
> +--- openldap-2.2.24/.pc/install-strip.patch/build/top.mk	2005-01-20 09:0=
0:55.000000000 -0800
> ++++ openldap-2.2.24/build/top.mk	2005-04-16 13:48:20.536710376 -0700
> +@@ -116,7 +116,7 @@
> + LTLINK_MOD =3D $(LIBTOOL) $(LTONLY_MOD) --mode=3Dlink \
> + 	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
> +=20
> +-LTINSTALL =3D $(LIBTOOL) --mode=3Dinstall $(INSTALL)=20
> ++LTINSTALL =3D STRIPPROG=3D"" $(LIBTOOL) --mode=3Dinstall $(top_srcdir)/=
contrib/ldapc++/install-sh -c
> + LTFINISH =3D $(LIBTOOL) --mode=3Dfinish
> +=20
> + # Misc UNIX commands used in build environment
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/ldap-conf-t=
ls-cacertdir.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/ldap-=
conf-tls-cacertdir.patch
> new file mode 100644
> index 0000000..e8aab91
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cace=
rtdir.patch
> @@ -0,0 +1,29 @@
> +--- a/doc/man/man5/ldap.conf.5
> ++++ b/doc/man/man5/ldap.conf.5
> +@@ -317,7 +317,7 @@ certificates in separate individual file
> + .B TLS_CACERT
> + is always used before
> + .B TLS_CACERTDIR.
> +-This parameter is ignored with GnuTLS.
> ++This parameter is ignored with GnuTLS. On Debian openldap is linked aga=
inst GnuTLS.
> +=20
> + When using Mozilla NSS, <path> may contain a Mozilla NSS cert/key
> + database.  If <path> contains a Mozilla NSS cert/key database and
> +@@ -428,7 +428,7 @@ This parameter is ignored with GnuTLS.
> + Specifies the file to obtain random bits from when /dev/[u]random is
> + not available. Generally set to the name of the EGD/PRNGD socket.
> + The environment variable RANDFILE can also be used to specify the filen=
ame.
> +-This parameter is ignored with GnuTLS and Mozilla NSS.
> ++This parameter is ignored with GnuTLS and Mozilla NSS. On Debian openld=
ap is linked against GnuTLS.
> + .TP
> + .B TLS_REQCERT <level>
> + Specifies what checks to perform on server certificates in a TLS sessio=
n,
> +@@ -461,7 +461,7 @@ Specifies if the Certificate Revocation
> + used to verify if the server certificates have not been revoked. This
> + requires
> + .B TLS_CACERTDIR
> +-parameter to be set. This parameter is ignored with GnuTLS and Mozilla =
NSS.
> ++parameter to be set. This parameter is ignored with GnuTLS and Mozilla =
NSS. On Debian openldap is linked against GnuTLS.
> + .B <level>
> + can be specified as one of the following keywords:
> + .RS
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/ldapi-socke=
t-place.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/ldapi-sock=
et-place.patch
> new file mode 100644
> index 0000000..a482bbf
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place=
=2Epatch
> @@ -0,0 +1,16 @@
> +Move the ldapi socket to /var/run/slapd from /var/run, since /var/run
> +is only writable by root and slapd runs as openldap.
> +
> +Debian-specific.
> +
> +--- a/include/ldap_defaults.h
> ++++ b/include/ldap_defaults.h
> +@@ -39,7 +39,7 @@
> + #define LDAP_ENV_PREFIX "LDAP"
> +=20
> + /* default ldapi:// socket */
> +-#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"
> ++#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "slapd" LD=
AP_DIRSEP "ldapi"
> +=20
> + /*
> +  * SLAPD DEFINITIONS
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/libldap-sym=
bol-versions.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/libld=
ap-symbol-versions.patch
> new file mode 100644
> index 0000000..fb28f49
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/libldap-symbol-ver=
sions.patch
> @@ -0,0 +1,161 @@
> +Add symbol versioning to the public LDAP libraries.  This is required for
> +library transitions, such as the current transition from 2.1 to 2.4,
> +since programs will sometimes have both libraries loaded by different
> +dependency chains during the transition.
> +
> +Not yet contributed upstream.
> +
> +Upstream ITS #5365 filed requesting symbol versioning for libldap and
> +libber.
> +
> +--- a/libraries/libldap_r/Makefile.in
> ++++ b/libraries/libldap_r/Makefile.in
> +@@ -61,6 +61,9 @@ XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)
> + XXXLIBS =3D $(LTHREAD_LIBS)
> + NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> + UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTH=
READ_LIBS)
> ++ifneq (,$(VERSION_OPTION))
> ++  VERSION_FLAGS =3D "$(VERSION_OPTION)$(XXDIR)/libldap.map"
> ++endif
> +=20
> + .links : Makefile
> + 	@for i in $(XXSRCS); do \
> +--- a/build/top.mk
> ++++ b/build/top.mk
> +@@ -104,6 +104,9 @@ LTFLAGS_MOD =3D $(@PLAT@_LTFLAGS_MOD)
> + # LINK_LIBS referenced in library and module link commands.
> + LINK_LIBS =3D $(MOD_LIBS) $(@PLAT@_LINK_LIBS)
> +=20
> ++# option to pass to $(CC) to support library symbol versioning, if any
> ++VERSION_OPTION =3D @VERSION_OPTION@
> ++
> + LTSTATIC =3D @LTSTATIC@
> +=20
> + LTLINK   =3D $(LIBTOOL) --mode=3Dlink \
> +@@ -113,7 +116,7 @@ LTCOMPILE_LIB =3D $(LIBTOOL) $(LTONLY_LIB)
> + 	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(LIB_DEFS) -c
> +=20
> + LTLINK_LIB =3D $(LIBTOOL) $(LTONLY_LIB) --mode=3Dlink \
> +-	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB)
> ++	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB) $(VERSION_FLAGS)
> +=20
> + LTCOMPILE_MOD =3D $(LIBTOOL) $(LTONLY_MOD) --mode=3Dcompile \
> + 	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(MOD_DEFS) -c
> +--- a/build/openldap.m4
> ++++ b/build/openldap.m4
> +@@ -1136,3 +1136,54 @@ AC_DEFUN([OL_SSL_COMPAT],
> + #endif
> + 	], [ol_cv_ssl_crl_compat=3Dyes], [ol_cv_ssl_crl_compat=3Dno])])
> + ])
> ++
> ++dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++dnl check for symbol versioning support
> ++AC_DEFUN([OL_SYMBOL_VERSIONING],
> ++[AC_CACHE_CHECK([for .symver assembler directive],
> ++	[ol_cv_asm_symver_directive],[
> ++cat > conftest.s <<EOF
> ++${libc_cv_dot_text}
> ++_sym:
> ++.symver _sym,sym@VERS
> ++EOF
> ++if ${CC-cc} -c $ASFLAGS conftest.s 1>&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_L=
OG_FD; then
> ++  ol_cv_asm_symver_directive=3Dyes
> ++else
> ++  ol_cv_asm_symver_directive=3Dno
> ++fi
> ++rm -f conftest*])
> ++AC_CACHE_CHECK([for ld --version-script],
> ++	[ol_cv_ld_version_script_option],[
> ++if test $ol_cv_asm_symver_directive =3D yes; then
> ++  cat > conftest.s <<EOF
> ++${libc_cv_dot_text}
> ++_sym:
> ++.symver _sym,sym@VERS
> ++EOF
> ++  cat > conftest.map <<EOF
> ++VERS_1 {
> ++	global: sym;
> ++};
> ++
> ++VERS_2 {
> ++	global: sym;
> ++} VERS_1;
> ++EOF
> ++  if ${CC-cc} -c $ASFLAGS conftest.s 1>&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE=
_LOG_FD; then
> ++    if AC_TRY_COMMAND([${CC-cc} $CFLAGS $LDFLAGS -shared
> ++                                                 -o conftest.so conftes=
t.o
> ++                                                 -Wl,--version-script,c=
onftest.map
> ++                       1>&AS_MESSAGE_LOG_FD]);
> ++    then
> ++      ol_cv_ld_version_script_option=3Dyes
> ++    else
> ++      ol_cv_ld_version_script_option=3Dno
> ++    fi
> ++  else
> ++    ol_cv_ld_version_script_option=3Dno
> ++  fi
> ++else
> ++  ol_cv_ld_version_script_option=3Dno
> ++fi
> ++rm -f conftest*])])
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1909,6 +1909,13 @@ else
> + fi
> + AC_SUBST(LTSTATIC)dnl
> +=20
> ++VERSION_OPTION=3D""
> ++OL_SYMBOL_VERSIONING
> ++if test $ol_cv_ld_version_script_option =3D yes ; then
> ++  VERSION_OPTION=3D"-Wl,--version-script=3D"
> ++fi
> ++AC_SUBST(VERSION_OPTION)
> ++
> + dnl ----------------------------------------------------------------
> + if test $ol_enable_wrappers !=3D no ; then
> + 	AC_CHECK_HEADERS(tcpd.h,[
> +--- /dev/null
> ++++ b/libraries/libldap/libldap.map
> +@@ -0,0 +1,7 @@
> ++OPENLDAP_2.4_2 {
> ++  global:
> ++    ldap_*;
> ++    ldif_*;
> ++  local:
> ++    *;
> ++};
> +--- a/libraries/libldap/Makefile.in
> ++++ b/libraries/libldap/Makefile.in
> +@@ -52,6 +52,9 @@ XLIBS =3D $(LIBRARY) $(LDAP_LIBLBER_LA) $(
> + XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)
> + NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> + UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> ++ifneq (,$(VERSION_OPTION))
> ++  VERSION_FLAGS =3D $(VERSION_OPTION)$(srcdir)/libldap.map
> ++endif
> +=20
> + apitest:	$(XLIBS) apitest.o
> + 	$(LTLINK) -o $@ apitest.o $(LIBS)
> +--- a/libraries/liblber/Makefile.in
> ++++ b/libraries/liblber/Makefile.in
> +@@ -38,6 +38,9 @@ XLIBS =3D $(LIBRARY) $(LDAP_LIBLUTIL_A)
> + XXLIBS =3D=20
> + NT_LINK_LIBS =3D $(AC_LIBS)
> + UNIX_LINK_LIBS =3D $(AC_LIBS)
> ++ifneq (,$(VERSION_OPTION))
> ++  VERSION_FLAGS =3D "$(VERSION_OPTION)$(srcdir)/liblber.map"
> ++endif
> +=20
> + dtest:    $(XLIBS) dtest.o
> + 	$(LTLINK) -o $@ dtest.o $(LIBS)
> +--- /dev/null
> ++++ b/libraries/liblber/liblber.map
> +@@ -0,0 +1,8 @@
> ++OPENLDAP_2.4_2 {
> ++  global:
> ++    ber_*;
> ++    der_alloc;
> ++    lutil_*;
> ++  local:
> ++    *;
> ++};
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/man-slapd.p=
atch b/meta-oe/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
> new file mode 100644
> index 0000000..5f55137
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
> @@ -0,0 +1,60 @@
> +Patch the slapd man page to not refer to a header file that isn't
> +installed with the slapd package and to reference the correct path
> +for slapd.
> +
> +Debian-specific.
> +
> +--- a/doc/man/man8/slapd.8
> ++++ b/doc/man/man8/slapd.8
> +@@ -5,7 +5,7 @@
> + .SH NAME
> + slapd \- Stand-alone LDAP Daemon
> + .SH SYNOPSIS
> +-.B LIBEXECDIR/slapd=20
> ++.B /usr/sbin/slapd=20
> + [\c
> + .BR \-4 | \-6 ]
> + [\c
> +@@ -103,11 +103,10 @@
> + will not fork or disassociate from the invoking terminal.  Some general
> + operation and status messages are printed for any value of \fIdebug-lev=
el\fP.
> + \fIdebug-level\fP is taken as a bit string, with each bit corresponding=
 to a
> +-different kind of debugging information.  See <ldap_log.h> for details.
> +-Comma-separated arrays of friendly names can be specified to select
> +-debugging output of the corresponding debugging information.
> +-All the names recognized by the \fIloglevel\fP directive=20
> +-described in \fBslapd.conf\fP(5) are supported.
> ++different kind of debugging information.  Comma-separated arrays of fri=
endly
> ++names can be specified to select debugging output of the corresponding
> ++debugging information.  All the names recognized by the \fIloglevel\fP
> ++directive described in \fBslapd.conf\fP(5) are supported.
> + If \fIdebug-level\fP is \fB?\fP, a list of installed debug-levels is pr=
inted,
> + and slapd exits.
> +=20
> +@@ -317,7 +316,7 @@
> + .LP
> + .nf
> + .ft tt
> +-	LIBEXECDIR/slapd
> ++	/usr/sbin/slapd
> + .ft
> + .fi
> + .LP
> +@@ -328,7 +327,7 @@
> + .LP
> + .nf
> + .ft tt
> +-	LIBEXECDIR/slapd \-f /var/tmp/slapd.conf \-d 255
> ++	/usr/sbin/slapd \-f /var/tmp/slapd.conf \-d 255
> + .ft
> + .fi
> + .LP
> +@@ -336,7 +335,7 @@
> + .LP
> + .nf
> + .ft tt
> +-	LIBEXECDIR/slapd \-Tt
> ++	/usr/sbin/slapd \-Tt
> + .ft
> + .fi
> + .LP
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_=
AUTOMAKE.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/no-AM_INI=
T_AUTOMAKE.patch
> new file mode 100644
> index 0000000..8e7812d
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAK=
E.patch
> @@ -0,0 +1,25 @@
> +Description: don't use AM_INIT_AUTOMAKE macro when we aren't using autom=
ake
> + Calling AM_INIT_AUTOMAKE() in configure.in serves no purpose if we're n=
ot
> + using automake, and it confuses autoreconf.  Use AC_INIT() instead.
> +Author: Steve Langasek <vorlon@debian.org>
> +
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -26,7 +26,8 @@ dnl Configure.in for OpenLDAP
> + AC_COPYRIGHT([[Copyright 1998-2014 The OpenLDAP Foundation. All rights =
reserved.
> + Restrictions apply, see COPYRIGHT and LICENSE files.]])
> + AC_REVISION([$Id: 81bd528fb5194c83d688db355737b7715448b958 $])
> +-AC_INIT([OpenLDAP],,[http://www.openldap.org/its/])
> ++AC_INIT([OpenLDAP],[$OL_VERSION],[http://www.openldap.org/its/])
> ++AC_PROG_MAKE_SET
> + m4_define([AC_PACKAGE_BUGREPORT],[<http://www.openldap.org/its/>])
> + AC_CONFIG_SRCDIR(build/version.sh)dnl
> + dnl ----------------------------------------------------------------
> +@@ -69,7 +70,6 @@ dnl Determine host platform
> + dnl		we try not to use this for much
> + AC_CANONICAL_TARGET([])
> +=20
> +-AM_INIT_AUTOMAKE([$OL_PACKAGE],[$OL_VERSION], [no defines])dnl
> + AC_SUBST(PACKAGE)dnl
> + AC_SUBST(VERSION)dnl
> + AC_DEFINE_UNQUOTED(OPENLDAP_PACKAGE,"$PACKAGE",Package)
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-=
second-guessing.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/no=
-bdb-ABI-second-guessing.patch
> new file mode 100644
> index 0000000..db76aa7
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-=
guessing.patch
> @@ -0,0 +1,42 @@
> +Author: Steve Langasek <vorlon@debian.org>
> +Description: don't second-guess BDB ABI
> + OpenLDAP upstream conservatively assumes that any change to the version
> + number of libdb can result in an API-breaking change that could impact
> + the database.  In Debian, we know that such changes require bumping the
> + library soname and changing the package name, and demand such rigor from
> + our package maintainers even when upstreams don't deliver; so any such
> + check in the source code works against the packaging system by forcing
> + database upgrades when we know none are required.  Disable this check
> + so we rely on the packaging system to do its job.
> +Bug-Debian: http://bugs.debian.org/651333
> +Forwarded: not-needed
> +
> +--- a/servers/slapd/back-bdb/init.c
> ++++ b/servers/slapd/back-bdb/init.c
> +@@ -762,7 +762,7 @@ bdb_back_initialize(
> + 	bi->bi_controls =3D controls;
> +=20
> + 	{	/* version check */
> +-		int major, minor, patch, ver;
> ++		int major, minor, patch;
> + 		char *version =3D db_version( &major, &minor, &patch );
> + #ifdef HAVE_EBCDIC
> + 		char v2[1024];
> +@@ -776,17 +776,6 @@ bdb_back_initialize(
> + 		version =3D v2;
> + #endif
> +=20
> +-		ver =3D (major << 24) | (minor << 16) | patch;
> +-		if( ver !=3D DB_VERSION_FULL ) {
> +-			/* fail if a versions don't match */
> +-			Debug( LDAP_DEBUG_ANY,
> +-				LDAP_XSTRING(bdb_back_initialize) ": "
> +-				"BDB library version mismatch:"
> +-				" expected " DB_VERSION_STRING ","
> +-				" got %s\n", version, 0, 0 );
> +-			return -1;
> +-		}
> +-
> + 		Debug( LDAP_DEBUG_TRACE, LDAP_XSTRING(bdb_back_initialize)
> + 			": %s\n", version, 0, 0 );
> + 	}
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/sasl-defaul=
t-path.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/sasl-defaul=
t-path.patch
> new file mode 100644
> index 0000000..5ea240f
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/sasl-default-path.=
patch
> @@ -0,0 +1,55 @@
> +Add /etc/ldap/sasl2 to the SASL configuration search path.
> +
> +Not submitted upstream.  Somewhat Debian-specific and probably not of
> +interest upstream.
> +
> +--- a/include/ldap_defaults.h
> ++++ b/include/ldap_defaults.h
> +@@ -63,4 +63,6 @@
> + 	/* dn of the default "monitor" subentry */
> + #define SLAPD_MONITOR_DN		"cn=3DMonitor"
> +=20
> ++#define SASL_CONFIGPATH                        LDAP_SYSCONFDIR LDAP_DIR=
SEP "sasl2"
> ++
> + #endif /* _LDAP_CONFIG_H */
> +--- a/servers/slapd/sasl.c
> ++++ b/servers/slapd/sasl.c
> +@@ -1103,12 +1103,38 @@ static const rewrite_mapper slapd_mapper
> + };
> + #endif
> +=20
> ++static int
> ++slap_sasl_getconfpath( void * context, char ** path )
> ++{
> ++	char * sasl_default_configpath;
> ++	size_t len;
> ++
> ++#if SASL_VERSION_MAJOR >=3D 2
> ++	sasl_default_configpath =3D "/usr/lib/sasl2";
> ++#else
> ++	sasl_default_configpath =3D "/usr/lib/sasl";
> ++#endif
> ++
> ++	len =3D strlen(SASL_CONFIGPATH) + 1 /* colon */ +
> ++		strlen(sasl_default_configpath) + 1 /* \0 */;
> ++	*path =3D malloc( len );
> ++	if ( *path =3D=3D NULL )
> ++		return SASL_FAIL;
> ++
> ++	if (snprintf( *path, len, "%s:%s", SASL_CONFIGPATH,
> ++				sasl_default_configpath ) !=3D len-1 )
> ++		return SASL_FAIL;
> ++
> ++	return SASL_OK;
> ++}
> ++
> + int slap_sasl_init( void )
> + {
> + #ifdef HAVE_CYRUS_SASL
> + 	int rc;
> + 	static sasl_callback_t server_callbacks[] =3D {
> + 		{ SASL_CB_LOG, &slap_sasl_log, NULL },
> ++		{ SASL_CB_GETCONFPATH, &slap_sasl_getconfpath, NULL },
> + 		{ SASL_CB_GETOPT, &slap_sasl_getopt, NULL },
> + 		{ SASL_CB_LIST_END, NULL, NULL }
> + 	};
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/series b/me=
ta-oe/recipes-support/openldap/openldap-2.4.39/series
> new file mode 100644
> index 0000000..2f47de3
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/series
> @@ -0,0 +1,21 @@
> +man-slapd=20
> +evolution-ntlm
> +slapi-errorlog-file=20
> +ldapi-socket-place=20
> +wrong-database-location=20
> +index-files-created-as-root=20
> +sasl-default-path=20
> +libldap-symbol-versions
> +getaddrinfo-is-threadsafe
> +do-not-second-guess-sonames
> +contrib-modules-use-dpkg-buildflags
> +smbk5pwd-makefile
> +autogroup-makefile
> +ldap-conf-tls-cacertdir
> +add-tlscacert-option-to-ldap-conf
> +fix-ftbfs-binutils-gold
> +fix-build-top-mk
> +no-AM_INIT_AUTOMAKE
> +switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff
> +no-bdb-ABI-second-guessing
> +heimdal-fix
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/slapi-error=
log-file.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/slapi-err=
orlog-file.patch
> new file mode 100644
> index 0000000..4899451
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-fil=
e.patch
> @@ -0,0 +1,16 @@
> +The slapi error log file defaults to /var/errors given our setting
> +of --localstatedir.  Move it to /var/log/slapi-errors instead.
> +
> +Debian-specific.
> +
> +--- a/servers/slapd/slapi/slapi_overlay.c
> ++++ b/servers/slapd/slapi/slapi_overlay.c
> +@@ -930,7 +930,7 @@ int slapi_over_config( BackendDB *be, Co
> + 		ldap_pvt_thread_mutex_init( &slapi_printmessage_mutex );
> +=20
> + 		if ( slapi_log_file =3D=3D NULL )
> +-			slapi_log_file =3D slapi_ch_strdup( LDAP_RUNDIR LDAP_DIRSEP "errors"=
 );
> ++			slapi_log_file =3D slapi_ch_strdup( LDAP_RUNDIR LDAP_DIRSEP "log" LD=
AP_DIRSEP "slapi-errors" );
> +=20
> + 		rc =3D slapi_int_init_object_extensions();
> + 		if ( rc !=3D 0 )
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/smbk5pwd-ma=
kefile.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/smbk5pwd-ma=
kefile.patch
> new file mode 100644
> index 0000000..17d1b56
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.=
patch
> @@ -0,0 +1,53 @@
> +--- a/contrib/slapd-modules/smbk5pwd/Makefile
> ++++ b/contrib/slapd-modules/smbk5pwd/Makefile
> +@@ -14,17 +14,17 @@
> +=20
> + LDAP_SRC =3D ../../..
> + LDAP_BUILD =3D ../../..
> +-LDAP_INC =3D -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC=
)/servers/slapd
> +-LDAP_LIB =3D $(LDAP_BUILD)/libraries/libldap_r/libldap_r.la \
> +-	$(LDAP_BUILD)/libraries/liblber/liblber.la
> ++LDAP_INC =3D -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/debia=
n/build/servers/slapd -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDA=
P_SRC)/servers/slapd
> ++LDAP_LIB =3D $(LDAP_BUILD)/debian/build/libraries/libldap_r/libldap_r.l=
a \
> ++	$(LDAP_BUILD)/debian/build/libraries/liblber/liblber.la
> +=20
> + SSL_INC =3D=20
> +-SSL_LIB =3D -lcrypto
> ++SSL_LIB =3D -lgcrypt
> +=20
> +-HEIMDAL_INC =3D -I/usr/heimdal/include
> +-HEIMDAL_LIB =3D -L/usr/heimdal/lib -lkrb5 -lkadm5srv
> ++HEIMDAL_INC =3D -I/usr/include
> ++HEIMDAL_LIB =3D -lkrb5 -lkadm5srv
> +=20
> +-LIBTOOL =3D $(LDAP_BUILD)/libtool
> ++LIBTOOL =3D $(LDAP_BUILD)/debian/build/libtool
> + CC =3D gcc
> + OPT =3D -g -O2 -Wall
> + # Omit DO_KRB5, DO_SAMBA or DO_SHADOW if you don't want to support it.
> +@@ -35,13 +35,13 @@ LIBS =3D $(LDAP_LIB) $(HEIMDAL_LIB) $(SSL_
> + PROGRAMS =3D smbk5pwd.la
> + LTVER =3D 0:0:0
> +=20
> +-prefix=3D/usr/local
> ++prefix=3D/usr
> + exec_prefix=3D$(prefix)
> +-ldap_subdir=3D/openldap
> ++ldap_subdir=3D/ldap
> +=20
> + libdir=3D$(exec_prefix)/lib
> + libexecdir=3D$(exec_prefix)/libexec
> +-moduledir =3D $(libexecdir)$(ldap_subdir)
> ++moduledir =3D $(libdir)$(ldap_subdir)
> +=20
> + .SUFFIXES: .c .o .lo
> +=20
> +@@ -55,7 +55,7 @@ smbk5pwd.la:	smbk5pwd.lo
> + 	-rpath $(moduledir) -module -o $@ $? $(LIBS)
> +=20
> + clean:
> +-	rm -rf *.o *.lo *.la .libs
> ++	$(LIBTOOL) --mode=3Dclean rm -f
> +=20
> + install: $(PROGRAMS)
> + 	mkdir -p $(DESTDIR)$(moduledir)
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/switch-to-l=
t_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch b/meta-oe/recipes-support/=
openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.d=
iff.patch
> new file mode 100644
> index 0000000..f0dd4e1
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlope=
nadvise-to-get-RTLD_GLOBAL-set.diff.patch
> @@ -0,0 +1,40 @@
> +From: Jan-Marek Glogowski <jan-marek.glogowski@muenchen.de>
> +Date: Tue, 18 May 2010 17:47:05 +0200
> +Subject: Switch to lt_dlopenadvise() so back_perl can be opened with RTL=
D_GLOBAL.   =20
> + Open all modules with RTLD_GLOBAL, needed so that back_perl can load
> + non-trivial Perl extensions that require symbols from back_perl.so itse=
lf.
> +Bug-Debian: http://bugs.debian.org/327585
> +
> +---
> +--- a/servers/slapd/module.c
> ++++ b/servers/slapd/module.c
> +@@ -117,6 +117,20 @@ int module_unload( const char *file_name
> + 	return -1;	/* not found */
> + }
> +=20
> ++static lt_dlhandle slapd_lt_dlopenext_global( const char *filename )
> ++{
> ++	lt_dlhandle handle =3D 0;
> ++	lt_dladvise advise;
> ++
> ++	if (!lt_dladvise_init (&advise) && !lt_dladvise_ext (&advise)
> ++			&& !lt_dladvise_global (&advise))
> ++		handle =3D lt_dlopenadvise (filename, advise);
> ++
> ++	lt_dladvise_destroy (&advise);
> ++
> ++	return handle;
> ++}
> ++
> + int module_load(const char* file_name, int argc, char *argv[])
> + {
> + 	module_loaded_t *module;
> +@@ -180,7 +194,7 @@ int module_load(const char* file_name, i
> + 	 * to calling Debug. This is because Debug is a macro that expands
> + 	 * into multiple function calls.
> + 	 */
> +-	if ((module->lib =3D lt_dlopenext(file)) =3D=3D NULL) {
> ++	if ((module->lib =3D slapd_lt_dlopenext_global(file)) =3D=3D NULL) {
> + 		error =3D lt_dlerror();
> + #ifdef HAVE_EBCDIC
> + 		strcpy( ebuf, error );
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/wrong-datab=
ase-location.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/wrong=
-database-location.patch
> new file mode 100644
> index 0000000..25d96cb
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/wrong-database-loc=
ation.patch
> @@ -0,0 +1,74 @@
> +Move the default slapd database location to /var/lib/ldap instead of
> +/var/openldap-data.
> +
> +Debian-specific.
> +
> +--- a/doc/man/man5/slapd-bdb.5
> ++++ b/doc/man/man5/slapd-bdb.5
> +@@ -131,7 +131,7 @@ Specify the directory where the BDB file
> + associated indexes live.
> + A separate directory must be specified for each database.
> + The default is
> +-.BR LOCALSTATEDIR/openldap\-data .
> ++.BR LOCALSTATEDIR/lib/ldap .
> + .TP
> + .B dirtyread
> + Allow reads of modified but not yet committed data.
> +--- a/doc/man/man5/slapd.conf.5
> ++++ b/doc/man/man5/slapd.conf.5
> +@@ -2007,7 +2007,7 @@ suffix    "dc=3Dour\-domain,dc=3Dcom"
> + # The database directory MUST exist prior to
> + # running slapd AND should only be accessible
> + # by the slapd/tools. Mode 0700 recommended.
> +-directory LOCALSTATEDIR/openldap\-data
> ++directory LOCALSTATEDIR/lib/ldap
> + # Indices to maintain
> + index     objectClass  eq
> + index     cn,sn,mail   pres,eq,approx,sub
> +--- a/include/ldap_defaults.h
> ++++ b/include/ldap_defaults.h
> +@@ -47,7 +47,7 @@
> + 	/* location of the default slapd config file */
> + #define SLAPD_DEFAULT_CONFIGFILE	LDAP_SYSCONFDIR LDAP_DIRSEP "slapd.con=
f"
> + #define SLAPD_DEFAULT_CONFIGDIR		LDAP_SYSCONFDIR LDAP_DIRSEP "slapd.d"
> +-#define SLAPD_DEFAULT_DB_DIR		LDAP_RUNDIR LDAP_DIRSEP "openldap-data"
> ++#define SLAPD_DEFAULT_DB_DIR		LDAP_RUNDIR LDAP_DIRSEP "lib" LDAP_DIRSEP=
 "ldap"
> + #define SLAPD_DEFAULT_DB_MODE		0600
> + #define SLAPD_DEFAULT_UCDATA		LDAP_DATADIR LDAP_DIRSEP "ucdata"
> + 	/* default max deref depth for aliases */
> +--- a/servers/slapd/Makefile.in
> ++++ b/servers/slapd/Makefile.in
> +@@ -445,9 +445,9 @@ install-conf: FORCE
> +=20
> + install-db-config: FORCE
> + 	@-$(MKDIR) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir)
> +-	@-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/openldap-data
> ++	@-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/lib/ldap
> + 	$(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_CONFIG \
> +-		$(DESTDIR)$(localstatedir)/openldap-data/DB_CONFIG.example
> ++		$(DESTDIR)$(localstatedir)/lib/ldap/DB_CONFIG.example
> + 	$(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_CONFIG \
> + 		$(DESTDIR)$(sysconfdir)/DB_CONFIG.example
> +=20
> +--- a/doc/man/man5/slapd-config.5
> ++++ b/doc/man/man5/slapd-config.5
> +@@ -2051,7 +2051,7 @@ olcSuffix: "dc=3Dour\-domain,dc=3Dcom"
> + # The database directory MUST exist prior to
> + # running slapd AND should only be accessible
> + # by the slapd/tools. Mode 0700 recommended.
> +-olcDbDirectory: LOCALSTATEDIR/openldap\-data
> ++olcDbDirectory: LOCALSTATEDIR/lib/ldap
> + # Indices to maintain
> + olcDbIndex:     objectClass  eq
> + olcDbIndex:     cn,sn,mail   pres,eq,approx,sub
> +--- a/doc/man/man5/slapd-mdb.5
> ++++ b/doc/man/man5/slapd-mdb.5
> +@@ -52,7 +52,7 @@ Specify the directory where the LMDB fil
> + associated indexes live.
> + A separate directory must be specified for each database.
> + The default is
> +-.BR LOCALSTATEDIR/openldap\-data .
> ++.BR LOCALSTATEDIR/lib/ldap .
> + .TP
> + \fBenvflags \fR{\fBnosync\fR,\fBnometasync\fR,\fBwritemap\fR,\fBmapasyn=
c\fR,\fBnordahead\fR}
> + Specify flags for finer-grained control of the LMDB library's operation.
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb b/meta-o=
e/recipes-support/openldap/openldap_2.4.39.bb
> new file mode 100644
> index 0000000..3048c8e
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
> @@ -0,0 +1,182 @@
> +# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
> +#
> +DESCRIPTION =3D "OpenLDAP Software is an open source implementation of t=
he Lightweight Directory Access Protocol."
> +HOMEPAGE =3D "http://www.OpenLDAP.org/license.html"
> +# The OpenLDAP Public License - see the HOMEPAGE - defines
> +# the license.  www.openldap.org claims this is Open Source
> +# (see http://www.openldap.org), the license appears to be
> +# basically BSD.  opensource.org does not record this license
> +# at present (so it is apparently not OSI certified).
> +LICENSE =3D "OpenLDAP"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df2bdbaa4f50199a00b6de2ca7ec=
1db05"
> +SECTION =3D "libs"
> +
> +# patches taken from Debian
> +SRC_URI =3D "\
> +    ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz \
> +    file://man-slapd.patch \
> +    file://evolution-ntlm.patch \
> +    file://slapi-errorlog-file.patch \
> +    file://ldapi-socket-place.patch \
> +    file://wrong-database-location.patch \
> +    file://index-files-created-as-root.patch \
> +    file://sasl-default-path.patch \
> +    file://libldap-symbol-versions.patch \
> +    file://getaddrinfo-is-threadsafe.patch \
> +    file://do-not-second-guess-sonames.patch \
> +    file://contrib-modules-use-dpkg-buildflags.patch \
> +    file://smbk5pwd-makefile.patch \
> +    file://autogroup-makefile.patch \
> +    file://ldap-conf-tls-cacertdir.patch \
> +    file://add-tlscacert-option-to-ldap-conf.patch \
> +    file://fix-ftbfs-binutils-gold.patch \
> +    file://fix-build-top-mk.patch \
> +    file://no-AM_INIT_AUTOMAKE.patch \
> +    file://switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch \
> +    file://no-bdb-ABI-second-guessing.patch \
> +    file://heimdal-fix.patch \
> +"
> +SRC_URI[md5sum] =3D "b0d5ee4b252c841dec6b332d679cf943"
> +SRC_URI[sha256sum] =3D "8267c87347103fef56b783b24877c0feda1063d3cb85d070=
e503d076584bf8a7"
> +
> +DEPENDS =3D "util-linux groff-native db"
> +
> +PR =3D "r0"
> +# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
> +# installing .so and executables, this fails in cross compilation
> +# environments
> +SRC_URI +=3D "file://install-strip.patch"
> +
> +# inherit autotools
> +inherit autotools-brokensep
> +
> +# CV SETTINGS
> +# Required to work round AC_FUNC_MEMCMP which gets the wrong answer
> +# when cross compiling (should be in site?)
> +EXTRA_OECONF +=3D "ac_cv_func_memcmp_working=3Dyes"
> +
> +# CONFIG DEFINITIONS
> +# The following is necessary because it cannot be determined for a
> +# cross compile automagically.  Select should yield fine on all OE
> +# systems...
> +EXTRA_OECONF +=3D "--with-yielding-select=3Dyes"
> +# Shared libraries are nice...
> +EXTRA_OECONF +=3D "--enable-dynamic"
> +
> +PACKAGECONFIG ??=3D "openssl modules \
> +                   ldap meta monitor null passwd shell proxycache dnssrv=
 \
> +		   bdb hdb mdb sasl \
> +"
> +#--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
> +PACKAGECONFIG[gnutls] =3D "--with-tls=3Dgnutls,,gnutls"
> +PACKAGECONFIG[openssl] =3D "--with-tls=3Dopenssl,,openssl"
> +
> +PACKAGECONFIG[sasl] =3D "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sa=
sl"
> +PACKAGECONFIG[modules] =3D "lt_cv_dlopen_self=3Dyes --enable-modules,--d=
isable-modules,libtool"
> +
> +# SLAPD options
> +#
> +# UNIX crypt(3) passwd support:
> +EXTRA_OECONF +=3D "--enable-crypt"
> +
> +EXTRA_OECONF +=3D "--enable-ipv6"
> +
> +# SLAPD BACKEND
> +#
> +# The backend must be set by the configuration.  This controls the
> +# required database, the default database, bdb, is turned off but
> +# can be turned back on again and it *is* below!  The monitor backend
> +# is also disabled.  If you try to change the backends but fail to
> +# enable a single one the build will fail in an obvious way.
> +#
> +# EXTRA_OECONF +=3D "--disable-bdb --disable-hdb --disable-monitor"
> +#
> +# Backends=3D"bdb dnssrv hdb ldap ldbm meta monitor null passwd perl she=
ll sql"
> +#
> +# Note that multiple backends can be built.  The ldbm backend requires a
> +# build-time choice of database API.  The bdb backend forces this to be
> +# DB4.  To use the gdbm (or other) API the Berkely database module must
> +# be removed from the build.
> +md =3D "${libexecdir}/openldap"
> +#
> +#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
> +# The Berkely DB is the standard choice.  This version of OpenLDAP requi=
res
> +# the version 4 implementation or better.
> +PACKAGECONFIG[bdb] =3D "--enable-bdb=3Dmod,--enable-bdb=3Dno,db"
> +
> +#--enable-dnssrv       enable dnssrv backend no|yes|mod no
> +PACKAGECONFIG[dnssrv] =3D "--enable-dnssrv=3Dmod,--enable-dnssrv=3Dno"
> +
> +#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
> +# This forces ldbm to use Berkeley too, remove to use gdbm
> +PACKAGECONFIG[hdb] =3D "--enable-hdb=3Dmod,--enable-hdb=3Dno,db"
> +
> +#--enable-ldap         enable ldap backend no|yes|mod no
> +PACKAGECONFIG[ldap] =3D "--enable-ldap=3Dmod,--enable-ldap=3Dno,"
> +
> +#--enable-ldbm         enable ldbm backend no|yes|mod no
> +# ldbm requires further specification of the underlying database API, be=
cause
> +# bdb is enabled above this must be set to berkeley, however the config
> +# defaults this correctly so --with-ldbm-api is *not* set.  The build wi=
ll
> +# fail if bdb is removed, but no database is built to provide the
> +# support for ldbm
> +# guide.html:<P>back-ldbm was both slow and unreliable. Its byzantine in=
dexing code was prone to spontaneous corruption, as were the underlying dat=
abase libraries that were commonly used (e.g. GDBM or NDBM). back-bdb and b=
ack-hdb are superior in every aspect, with simplified indexing to avoid ind=
ex corruption, fine-grained locking for greater concurrency, hierarchical c=
aching for greater performance, streamlined on-disk format for greater effi=
ciency and portability, and full transaction support for greater reliabilit=
y.</P>
> +# configure: WARNING: unrecognized options: --disable-silent-rules, --en=
able-ldbm, --with-ldbm-api
> +#PACKAGECONFIG[ldbm] =3D "--enable-ldbm=3Dmod --with-ldbm-api=3Dgdbm,--e=
nable-ldbm-no,gdbm"
> +
> +#--enable-meta         enable metadirectory backend no|yes|mod no
> +PACKAGECONFIG[meta] =3D "--enable-meta=3Dmod,--enable-meta=3Dno,"
> +
> +#--enable-monitor      enable monitor backend no|yes|mod yes
> +PACKAGECONFIG[monitor] =3D "--enable-monitor=3Dmod,--enable-monitor=3Dno=
,"
> +
> +#--enable-null         enable null backend no|yes|mod no
> +PACKAGECONFIG[null] =3D "--enable-null=3Dmod,--enable-null=3Dno,"
> +
> +#--enable-passwd       enable passwd backend no|yes|mod no
> +PACKAGECONFIG[passwd] =3D "--enable-passwd=3Dmod,--enable-passwd=3Dno,"
> +
> +# disabling perl support - host contamination issues
> +#
> +#--enable-perl         enable perl backend no|yes|mod no
> +#  This requires a loadable perl dynamic library, if enabled without
> +#  doing something appropriate (building perl?) the build will pick
> +#  up the build machine perl - not good (inherit perlnative?)
> +# PACKAGECONFIG[perl] =3D "--enable-perl=3Dmod,--enable-perl=3Dno,perl"
> +
> +#--enable-shell        enable shell backend no|yes|mod no
> +# configure: WARNING: Use of --without-threads is recommended with back-=
shell
> +PACKAGECONFIG[shell] =3D "--enable-shell=3Dmod --without-threads,--enabl=
e-shell=3Dno,"
> +
> +#--enable-sql          enable sql backend no|yes|mod no
> +# sql requires some sql backend which provides sql.h, sqlite* provides
> +# sqlite.h (which may be compatible but hasn't been tried.)
> +PACKAGECONFIG[sql] =3D "--enable-sql=3Dmod,--enable-sql=3Dno,sqlite3"
> +
> +#--enable-dyngroup     Dynamic Group overlay no|yes|mod no
> +#  This is a demo, Proxy Cache defines init_module which conflicts with =
the
> +#  same symbol in dyngroup
> +PACKAGECONFIG[dyngroup] =3D "--enable-dyngroup=3Dmod,--enable-dyngroup=
=3Dno,"
> +
> +#--enable-proxycache   Proxy Cache overlay no|yes|mod no
> +PACKAGECONFIG[proxycache] =3D "--enable-proxycache=3Dmod,--enable-proxyc=
ache=3Dno,"
> +
> +#--enable-mdb         enable mdb database backend no|yes|mod no
> +PACKAGECONFIG[mdb] =3D "--enable-mdb=3Dmod,--enable-mdb=3Dno,"
> +
> +CPPFLAGS_append =3D " -D_GNU_SOURCE"
> +
> +do_configure() {
> +    cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
> +    rm -f ${S}/libtool
> +    rm -f ${S}/libtool
> +    aclocal
> +    libtoolize --force --copy
> +    gnu-configize
> +    autoconf
> +    oe_runconf
> +}
> +
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${li=
bdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecd=
ir}/openldap/*.so"
> +FILES_${PN}-dbg +=3D "${libexecdir}/openldap/.debug"
> +
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MQHH0Amk2SOv3s5T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp/KAACgkQN1Ujt2V2gBxSFwCfR2jzrYpZrNH+Wk0uG+QsBv8b
BYQAniZl62gsi95t1idoOtaH8dCT/GNF
=VcFQ
-----END PGP SIGNATURE-----

--MQHH0Amk2SOv3s5T--
