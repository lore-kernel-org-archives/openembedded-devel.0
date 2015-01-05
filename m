Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7530860167
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:38:25 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y8EPy-0007AP-2O from Joe_MacDonald@mentor.com ;
	Mon, 05 Jan 2015 12:38:26 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Jan 2015 12:38:25 -0800
Received: by burninator (Postfix, from userid 1000)	id 7E2E6580D10; Mon,  5
	Jan 2015 15:38:21 -0500 (EST)
Date: Mon, 5 Jan 2015 15:38:21 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150105203821.GB28725@mentor.com>
References: <1420489338-6024-1-git-send-email-joe_macdonald@mentor.com>
	<20150105202949.GA19402@jama>
MIME-Version: 1.0
In-Reply-To: <20150105202949.GA19402@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] [meta-networking][PATCH v2] openl2tp: add new recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 20:38:30 -0000
X-Groupsio-MsgNum: 53667
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] [meta-networking][PATCH v2] openl2tp: add new recipe] On 15.=
01.05 (Mon 21:29) Martin Jansa wrote:

> On Mon, Jan 05, 2015 at 03:22:18PM -0500, Joe MacDonald wrote:
> > From: Li xin <lixin.fnst@cn.fujitsu.com>
>=20
> Wrong ML, belongs to openembedded-devel.

Yep, it does.  Command-line history failure.

-J.

>=20
> >=20
> > OpenL2TP is an open source L2TP client / server, written specifically
> > for Linux. It has been designed for use as an enterprise L2TP VPN server
> > or in commercial, Linux-based, embedded networking products and is able
> > to support hundreds of sessions, each with different configuration.
> > It is used by several ISPs to provide L2TP services and by corporations
> > to implement L2TP VPNs.
> >=20
> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >=20
> > Martin:
> >=20
> >    This is basically just a minor clean-up of the earlier openl2tp reci=
pe.  So
> >    far I've been unable to reproduce the error reported in the world bu=
ild.  If
> >    there's still a log kicking around from that failure, I'd love to ge=
t a look
> >    at it, I'm also doing a world build locally to try this out, but it =
still
> >    looks like it should be okay now.  If it fails for you again before =
I get
> >    some kind of results, can you point me at the log?
> >=20
> >    -J.
> >=20
> >  ...kefile-modify-CFLAGS-to-aviod-build-error.patch | 106 +++++++++++++=
++++++++
> >  .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  32 +++++++
> >  2 files changed, 138 insertions(+)
> >  create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp=
/Makefile-modify-CFLAGS-to-aviod-build-error.patch
> >  create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp=
_1.8.bb
> >=20
> > diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefi=
le-modify-CFLAGS-to-aviod-build-error.patch b/meta-networking/recipes-proto=
cols/openl2tp/openl2tp/Makefile-modify-CFLAGS-to-aviod-build-error.patch
> > new file mode 100644
> > index 0000000..96dbc75
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-modi=
fy-CFLAGS-to-aviod-build-error.patch
> > @@ -0,0 +1,106 @@
> > +From 152486fa3c36c3b99d17d5b553cf87ef412fae8e Mon Sep 17 00:00:00 2001
> > +From: Li xin <lixin.fnst@cn.fujitsu.com>
> > +Date: Mon, 1 Dec 2014 01:53:41 +0900
> > +Subject: [PATCH] Makefile:modify CFLAGS to aviod build error.
> > +
> > +Upstream-Status: pending
> > +
> > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > +---
> > + Makefile         | 22 +++++++++++-----------
> > + plugins/Makefile |  6 +++---
> > + 2 files changed, 14 insertions(+), 14 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 4aaa448..baa7882 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -152,10 +152,10 @@ LIBS.dmalloc=3D		-ldmalloc
> > + export USE_DMALLOC
> > + endif
> > +=20
> > +-CPPFLAGS=3D		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
> > +-CFLAGS=3D			-I. -Iusl -Icli -isystem include \
> > +-				-MMD -Wall -Werror -Wno-strict-aliasing \
> > +-				$(CPPFLAGS) $(CPPFLAGS.dmalloc) \
> > ++ADD_CPPFLAGS=3D		$(CPPFLAGS.l2tptest) $(CPPFLAGS-y)
> > ++ADD_CFLAGS=3D			-I. -Iusl -Icli -isystem include \
> > ++				-MMD -Wall -Wno-strict-aliasing \
> > ++				$(ADD_CPPFLAGS) $(CPPFLAGS.dmalloc) \
> > + 				-DSYS_LIBDIR=3D$(SYS_LIBDIR)
> > + LDFLAGS.l2tpd=3D		-Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc
> > + LDFLAGS.l2tpconfig=3D	-Lcli -lcli -lreadline $(LIBS.dmalloc) $(READLI=
NE_LDFLAGS) -lc
> > +@@ -170,10 +170,10 @@ CFLAGS.optimize=3D	$(OPT_CFLAGS)
> > + endif
> > + export CFLAGS.optimize
> > +=20
> > +-CFLAGS+=3D		$(CFLAGS.optimize)
> > ++ADD_CFLAGS+=3D		$(CFLAGS.optimize)
> > +=20
> > + ifeq ($(L2TP_USE_ASYNC_RPC),y)
> > +-CPPFLAGS+=3D		-DL2TP_ASYNC_RPC
> > ++ADD_CPPFLAGS+=3D		-DL2TP_ASYNC_RPC
> > + endif
> > +=20
> > + ifeq ($(L2TP_FEATURE_RPC_MANAGEMENT),y)
> > +@@ -220,13 +220,13 @@ endif
> > +=20
> > + # Compile without -Wall because rpcgen-generated code is full of warn=
ings.
> > + %_xdr.o:		%_xdr.c
> > +-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
> > ++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
> > +=20
> > + %_client.o:		%_client.c
> > +-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
> > ++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
> > +=20
> > + %_server.o:		%_server.c
> > +-			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(CPPFLAGS) $<
> > ++			$(CC) -I. -MMD -w $(CFLAGS.optimize) -c $(ADD_CPPFLAGS) $<
> > +=20
> > + %_xdr.c:		%.x
> > + 			-$(RM) $@
> > +@@ -272,7 +272,7 @@ l2tpconfig:		$(L2TPCONFIG_SRCS.o)
> > + 			$(CC) -o $@ $^ $(LDFLAGS.l2tpconfig)
> > +=20
> > + %.o:	%.c
> > +-			$(CC) -c $(CFLAGS) $< -o $@
> > ++			$(CC) -c $(CFLAGS) $(ADD_CFLAGS) $< -o $@
> > +=20
> > + l2tp_options.h:	FORCE
> > + 	@rm -f $@.tmp
> > +@@ -325,7 +325,7 @@ install:		install-all
> > + install-all:		all install-daemon install-app
> > +=20
> > + install-daemon:
> > +-			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS=
) EXTRA_CFLAGS=3D"$(CPPFLAGS)" install; if [ $$? -ne 0 ]; then exit 1; fi; =
done
> > ++			@for d in $(filter-out usl,$(SUBDIRS)); do $(MAKE) -C $$d $(MFLAGS=
) EXTRA_CFLAGS=3D"$(CPPFLAGS) $(ADD_CPPFLAGS)" install; if [ $$? -ne 0 ]; t=
hen exit 1; fi; done
> > + 			$(INSTALL) -d $(DESTDIR)/usr/sbin
> > + 			$(INSTALL) openl2tpd $(DESTDIR)/usr/sbin
> > +=20
> > +diff --git a/plugins/Makefile b/plugins/Makefile
> > +index 5be996d..6810236 100644
> > +--- a/plugins/Makefile
> > ++++ b/plugins/Makefile
> > +@@ -1,7 +1,7 @@
> > +-CFLAGS	:=3D $(CFLAGS.optimize) -MMD -Wall \
> > ++ADD_CFLAGS	:=3D $(CFLAGS.optimize) -MMD -Wall \
> > + 	-isystem ../include \
> > + 	-I. -I.. -I../usl -fPIC $(EXTRA_CFLAGS)
> > +-LDFLAGS	:=3D -shared
> > ++ADD_LDFLAGS	:=3D -shared
> > +=20
> > + PLUGINS.c:=3D	ppp_unix.c ppp_null.c ipsec.c event_sock.c
> > +=20
> > +@@ -21,7 +21,7 @@ clean:
> > + 		$(RM) $(PLUGINS.so) $(wildcard *.o) $(wildcard *.d) $(SRC.generated)
> > +=20
> > + %.so: %.c
> > +-		$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $<
> > ++		$(CC) -o $@ $(LDFLAGS) $(ADD_LDFLAGS) $(CFLAGS) $(ADD_CFLAGS) $<
> > +=20
> > + install:	all
> > + 		$(INSTALL) -d $(DESTDIR)$(SYS_LIBDIR)/openl2tp
> > +--=20
> > +1.8.4.2
> > +
> > diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb=
 b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> > new file mode 100644
> > index 0000000..77f19ed
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY =3D "An L2TP client/server, designed for VPN use."
> > +DESCRIPTION =3D "OpenL2TP is an open source L2TP client / server, writ=
ten \
> > +specifically for Linux. It has been designed for use as an enterprise \
> > +L2TP VPN server or in commercial, Linux-based, embedded networking \
> > +products and is able to support hundreds of sessions, each with \
> > +different configuration. It is used by several ISPs to provide \
> > +L2TP services and by corporations to implement L2TP VPNs."
> > +HOMEPAGE =3D "http://www.openl2tp.org/"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "GPL-2.0"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9d9259cbbf00945adc25a470c1=
d3585"
> > +DEPENDS =3D "popt flex readline"
> > +
> > +SRC_URI =3D "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/$=
{PV}/${BP}.tar.gz \
> > +           file://Makefile-modify-CFLAGS-to-aviod-build-error.patch"
> > +SRC_URI[md5sum] =3D "e3d08dedfb9e6a9a1e24f6766f6dadd0"
> > +SRC_URI[sha256sum] =3D "1c97704d4b963a87fbc0e741668d4530933991515ae9ab=
0dffd11b5444f4860f"
> > +
> > +inherit autotools-brokensep pkgconfig
> > +EXTRA_OEMAKE =3D 'CFLAGS=3D"${CFLAGS} -Wno-nused-but-set-variable"'
> > +
> > +do_compile_prepend() {
> > +    sed -i -e "s:SYS_LIBDIR=3D.*:SYS_LIBDIR=3D${libdir}:g" \
> > +        -e 's:$(CROSS_COMPILE)as:${AS}:g' \
> > +        -e 's:$(CROSS_COMPILE)ld:${LD}:g' \
> > +        -e 's:$(CROSS_COMPILE)gcc:${CC}:g' \
> > +        -e 's:$(CROSS_COMPILE)ar:${AR}:g' \
> > +        -e 's:$(CROSS_COMPILE)nm:${NM}:g' \
> > +        -e 's:$(CROSS_COMPILE)strip:${STRIP}:g' \
> > +        -e 's:$(CROSS_COMPILE)install:install:g' \
> > +        ${S}/Makefile
> > +}
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
--=20
-Joe MacDonald.
:wq

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUqvY9AAoJEEn8ffcsOfaWluQH/RRaD0fo6Wbom2ce/pY3SqRU
PoKvzMTjZDmZhs3EtTAtdx3tM+IorC8XMKoBFVKZA2y7P3y+L5CvzsDt9LzeXBSJ
2/Pv9QCar9/eLyZBj52q8KhwchwHljMTW21CM4f0E3bjhEboGv3zj036z8AfHUha
D6VqinYQpdLW2sEegdaXVCBmm9+AlanB4a+3P/IbNsddWkwMeJjPZEFIznRuySfV
C5HKTXkEPBcb6ZGf9c/i1MZp6U1Rz8pz6EWomVAOL6wqpRzIMQLA9xQHPZseBlye
X8oCirprp9gVIX8+flIc0/wUh2XoRrBsW3n/pFLrhmcHnkRmtG7kQExAi2aLUJM=
=gwcy
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
