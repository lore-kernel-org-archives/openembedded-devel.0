Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA8572325
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 10:55:21 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so2151288wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 02:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1cvjxgp8UTRFhq+b00f0t6LX1wK5zdibT3AG4QwTnfM=;
	b=KLZkSNtp4b3WczT/+ORubF0aliLZ4URqJWREElmD7cevmF47EgeInjhbnwAyRzZnO9
	IwAKoIUtWqsIPMAlf/A1cejtWD9ArdWDsVn5/SuZaXIj8I3eSTGF89ycj9PPDVGZlNsO
	Tmh1tReW7beQfvE/wdt025aS3gW13OpP3S8XepsmRAtG8YtYSW8Ke961KFmnJFIlLuna
	Tas/wECkXlPgP+6IWdAnSnj3PAhSlQDS3bCD5qF6w1nRhlvVvUVm+khc8SF4GQdIPC+v
	+YTxUL8pYAvMi/0UEaWIGNCqZZ1V7NDUCNV1xxyS4xWjAreSiNTTcEYjQddVEMQzryRs
	+nxA==
X-Received: by 10.194.5.227 with SMTP id v3mr26413606wjv.63.1418381722125;
	Fri, 12 Dec 2014 02:55:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a14sm1453153wib.22.2014.12.12.02.55.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 02:55:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Dec 2014 11:55:25 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141212105525.GA2470@jama>
References: <1417680874-8040-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417680874-8040-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] openl2tp: add new recipe
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
X-List-Received-Date: Fri, 12 Dec 2014 10:55:29 -0000
X-Groupsio-MsgNum: 53300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 04:14:34PM +0800, Li xin wrote:
> OpenL2TP is an open source L2TP client / server, written specifically
> for Linux. It has been designed for use as an enterprise L2TP VPN server
> or in commercial, Linux-based, embedded networking products and is able
> to support hundreds of sessions, each with different configuration.
> It is used by several ISPs to provide L2TP services and by corporations
> to implement L2TP VPNs.

Fails to build in world:

| In file included from ppp_unix.c:51:0:
| ../l2tp_private.h:44:26: fatal error: l2tp_options.h: No such file or dir=
ectory
|  #include "l2tp_options.h"

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  ...kefile-modify-CFLAGS-to-aviod-build-error.patch | 106 +++++++++++++++=
++++++
>  .../recipes-daemons/openl2tp/openl2tp_1.8.bb       |  34 +++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/openl2tp/openl2tp/Mak=
efile-modify-CFLAGS-to-aviod-build-error.patch
>  create mode 100644 meta-networking/recipes-daemons/openl2tp/openl2tp_1.8=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-daemons/openl2tp/openl2tp/Makefile-m=
odify-CFLAGS-to-aviod-build-error.patch b/meta-networking/recipes-daemons/o=
penl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
> new file mode 100644
> index 0000000..96dbc75
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/openl2tp/openl2tp/Makefile-modify-C=
FLAGS-to-aviod-build-error.patch
> @@ -0,0 +1,106 @@
> +From 152486fa3c36c3b99d17d5b553cf87ef412fae8e Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Mon, 1 Dec 2014 01:53:41 +0900
> +Subject: [PATCH] Makefile:modify CFLAGS to aviod build error.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + Makefile         | 22 +++++++++++-----------
> + plugins/Makefile |  6 +++---
> + 2 files changed, 14 insertions(+), 14 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 4aaa448..baa7882 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -152,10 +152,10 @@ LIBS.dmalloc=3D		-ldmalloc
> + export USE_DMALLOC
> + endif
> +=20
> +-CPPFLAGS=3D		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
> +-CFLAGS=3D			-I. -Iusl -Icli -isystem include \
> +-				-MMD -Wall -Werror -Wno-strict-aliasing \
> +-				$(CPPFLAGS) $(CPPFLAGS.dmalloc) \
> ++ADD_CPPFLAGS=3D		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
> ++ADD_CFLAGS=3D			-I. -Iusl -Icli -isystem include \
> ++				-MMD -Wall -Wno-strict-aliasing \
> ++				$(ADD_CPPFLAGS) $(CPPFLAGS.dmalloc) \
> + 				-DSYS_LIBDIR=3D$(SYS_LIBDIR)
> + LDFLAGS.l2tpd=3D		-Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc
> + LDFLAGS.l2tpconfig=3D	-Lcli -lcli -lreadline $(LIBS.dmalloc) $(READLINE=
_LDFLAGS) -lc
> +@@ -170,10 +170,10 @@ CFLAGS.optimize=3D	$(OPT_CFLAGS)
> + endif
> + export CFLAGS.optimize
> +=20
> +-CFLAGS+=3D		$(CFLAGS.optimize)
> ++ADD_CFLAGS+=3D		$(CFLAGS.optimize)
> +=20
> + ifeq ($(L2TP_USE_ASYNC_RPC),y)
> +-CPPFLAGS+=3D		-DL2TP_ASYNC_RPC
> ++ADD_CPPFLAGS+=3D		-DL2TP_ASYNC_RPC
> + endif
> +=20
> + ifeq ($(L2TP_FEATURE_RPC_MANAGEMENT),y)
> +@@ -220,13 +220,13 @@ endif
> +=20
> + # Compile without -Wall because rpcgen-generated code is full of warnin=
gs.
> + %_xdr.o:		%_xdr.c
> +-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
> ++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
> +=20
> + %_client.o:		%_client.c
> +-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
> ++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
> +=20
> + %_server.o:		%_server.c
> +-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
> ++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
> +=20
> + %_xdr.c:		%.x
> + 			-$(RM) $@
> +@@ -272,7 +272,7 @@ l2tpconfig:		$(L2TPCONFIG_SRCS.o)
> + 			$(CC) -o $@ $^ $(LDFLAGS.l2tpconfig)
> +=20
> + %.o:	%.c
> +-			$(CC) -c $(CFLAGS) $< -o $@
> ++			$(CC) -c $(CFLAGS) $(ADD_CFLAGS) $< -o $@
> +=20
> + l2tp_options.h:	FORCE
> + 	@rm -f $@.tmp
> +@@ -325,7 +325,7 @@ install:		install-all
> + install-all:		all install-daemon install-app
> +=20
> + install-daemon:
> +-			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS) =
EXTRA_CFLAGS=3D"$(CPPFLAGS)" install; if [ $$? -ne 0 ]; then exit 1; fi; do=
ne
> ++			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS) =
EXTRA_CFLAGS=3D"$(CPPFLAGS) $(ADD_CPPFLAGS)" install; if [ $$? -ne 0 ]; the=
n exit 1; fi; done
> + 			$(INSTALL) -d $(DESTDIR)/usr/sbin
> + 			$(INSTALL) openl2tpd $(DESTDIR)/usr/sbin
> +=20
> +diff --git a/plugins/Makefile b/plugins/Makefile
> +index 5be996d..6810236 100644
> +--- a/plugins/Makefile
> ++++ b/plugins/Makefile
> +@@ -1,7 +1,7 @@
> +-CFLAGS	:=3D $(CFLAGS.optimize) -MMD -Wall \
> ++ADD_CFLAGS	:=3D $(CFLAGS.optimize) -MMD -Wall \
> + 	-isystem ../include \
> + 	-I. -I.. -I../usl -fPIC $(EXTRA_CFLAGS)
> +-LDFLAGS	:=3D -shared
> ++ADD_LDFLAGS	:=3D -shared
> +=20
> + PLUGINS.c:=3D	ppp_unix.c ppp_null.c ipsec.c event_sock.c
> +=20
> +@@ -21,7 +21,7 @@ clean:
> + 		$(RM) $(PLUGINS.so) $(wildcard *.o) $(wildcard *.d) $(SRC.generated)
> +=20
> + %.so: %.c
> +-		$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $<
> ++		$(CC) -o $@ $(LDFLAGS) $(ADD_LDFLAGS) $(CFLAGS) $(ADD_CFLAGS) $<
> +=20
> + install:	all
> + 		$(INSTALL) -d $(DESTDIR)$(SYS_LIBDIR)/openl2tp
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb b/m=
eta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb
> new file mode 100644
> index 0000000..c7b80db
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/openl2tp/openl2tp_1.8.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "An L2TP client/server, designed for VPN use."
> +DESCRIPTION =3D "OpenL2TP is an open source L2TP client / server, writte=
n \
> +specifically for Linux. It has been designed for use as an enterprise \
> +L2TP VPN server or in commercial, Linux-based, embedded networking \
> +products and is able to support hundreds of sessions, each with \
> +different configuration. It is used by several ISPs to provide \
> +L2TP services and by corporations to implement L2TP VPNs."
> +
> +HOMEPAGE =3D "http://www.openl2tp.org/"
> +SECTION =3D "System Environment/Daemons"
> +
> +SRC_URI =3D "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/${P=
V}/${BP}.tar.gz \
> +           file://Makefile-modify-CFLAGS-to-aviod-build-error.patch"
> +SRC_URI[md5sum] =3D "e3d08dedfb9e6a9a1e24f6766f6dadd0"
> +SRC_URI[sha256sum] =3D "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0d=
ffd11b5444f4860f"
> +
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9d9259cbbf00945adc25a470c1d3=
585"
> +
> +DEPENDS =3D "popt flex readline"
> +inherit autotools-brokensep pkgconfig
> +EXTRA_OEMAKE =3D 'CFLAGS=3D"${CFLAGS} -Wno-nused-but-set-variable"'
> +
> +do_compile_prepend() {
> +    sed -i -e "s:SYS_LIBDIR=3D.*:SYS_LIBDIR=3D${libdir}:g" \
> +        -e 's:$(CROSS_COMPILE)as:${AS}:g' \
> +        -e 's:$(CROSS_COMPILE)ld:${LD}:g' \
> +        -e 's:$(CROSS_COMPILE)gcc:${CC}:g' \
> +        -e 's:$(CROSS_COMPILE)ar:${AR}:g' \
> +        -e 's:$(CROSS_COMPILE)nm:${NM}:g' \
> +        -e 's:$(CROSS_COMPILE)strip:${STRIP}:g' \
> +        -e 's:$(CROSS_COMPILE)install:install:g' \
> +        ${S}/Makefile
> +}
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSKyZ0ACgkQN1Ujt2V2gBykMQCcDIyZYdkyVffmJZM+ymaQwXMV
ND8AoI2PpiXdkLhe3XiQa02eRI7xsp6E
=D/hW
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
