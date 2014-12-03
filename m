Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0007C60673
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 21:04:11 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XwH5n-0005wt-U0 from Joe_MacDonald@mentor.com ;
	Wed, 03 Dec 2014 13:04:11 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.181.6; Wed, 3 Dec 2014
	13:04:11 -0800
Received: by burninator (Postfix, from userid 1000)	id A0D8158172A; Wed,  3
	Dec 2014 16:04:10 -0500 (EST)
Date: Wed, 3 Dec 2014 16:04:10 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141203210410.GF6016@mentor.com>
References: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
	<1417152844-23643-2-git-send-email-akuster808@gmail.com>
	<20141203174933.GC2455@jama>
MIME-Version: 1.0
In-Reply-To: <20141203174933.GC2455@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] New package: netkit-rsh
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
X-List-Received-Date: Wed, 03 Dec 2014 21:04:14 -0000
X-Groupsio-MsgNum: 53172
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ULyIDA2m8JTe+TiX"
Content-Disposition: inline

--ULyIDA2m8JTe+TiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/2] New package: netkit-rsh] On 14.12.03=
 (Wed 18:49) Martin Jansa wrote:

> On Thu, Nov 27, 2014 at 09:34:03PM -0800, Armin Kuster wrote:
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
>=20
> Subject should start with "netkit-rsh: "
>=20
> Use netkit-rsh instead of files for slightly faster lookup.
>=20
> This applies to more patches you recently sent, I'll update them this
> time when cherry-picking to master-next, but please check that next
> time.

I've been working on the current netkit-* queue off-and-on yesterday and
today and done a bit of tweaking on them as well to better match the
appropriate style.  Thanks for sending out the reminder, though, I don't
mind doing whitespace cleanup in patches I merge, but it's always nice
if I don't have to.  :-)

-J.

>=20
> > ---
> >  .../files/rsh-redone_link_order_file.patch         | 64 ++++++++++++++=
++++++++
> >  .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 61 ++++++++++++++=
+++++++
> >  2 files changed, 125 insertions(+)
> >  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/files/rsh=
-redone_link_order_file.patch
> >  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rs=
h_0.17.bb
> >=20
> > diff --git a/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone=
_link_order_file.patch b/meta-networking/recipes-netkit/netkit-rsh/files/rs=
h-redone_link_order_file.patch
> > new file mode 100644
> > index 0000000..bded510
> > --- /dev/null
> > +++ b/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_o=
rder_file.patch
> > @@ -0,0 +1,64 @@
> > +This fixes a build issue caused by linking order.
> > +
> > +Upstream-Status: Inappropriate
> > +Most distos have there own verison of this fix. This was derived by
> > +* Fix link order to list libraries after the objects that require them
> > +(LP: #771080).
> > +
> > +-- Colin Watson <cjwatson@ubuntu.com>  Tue, 13 Sep 2011 10:07:08 +0100
> > +
> > +
> > +signed-off-by: Armin Kuster <akuster808@gmail.com>
> > +
> > +Index: netkit-rsh-0.17/rsh/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- netkit-rsh-0.17.orig/rsh/Makefile
> > ++++ netkit-rsh-0.17/rsh/Makefile
> > +@@ -6,7 +6,7 @@ include ../MRULES
> > + OBJS =3D rsh.o
> > +=20
> > + rsh: $(OBJS)
> > +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> > ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> > +=20
> > + install: rsh
> > + 	install -o root -m$(SUIDMODE) rsh $(INSTALLROOT)$(BINDIR)
> > +Index: netkit-rsh-0.17/rshd/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- netkit-rsh-0.17.orig/rshd/Makefile
> > ++++ netkit-rsh-0.17/rshd/Makefile
> > +@@ -11,7 +11,7 @@ LIBS +=3D -ldl -lpam
> > + endif
> > +=20
> > + rshd: $(OBJS)
> > +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> > ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> > +=20
> > + install: rshd
> > + 	install -m$(DAEMONMODE) rshd $(INSTALLROOT)$(SBINDIR)/in.rshd
> > +Index: netkit-rsh-0.17/rlogin/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- netkit-rsh-0.17.orig/rlogin/Makefile
> > ++++ netkit-rsh-0.17/rlogin/Makefile
> > +@@ -7,7 +7,7 @@ PROG=3Drlogin
> > + OBJS=3Drlogin.o
> > +=20
> > + $(PROG): $(OBJS)
> > +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> > ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)=20
> > +=20
> > + install: $(PROG)
> > + 	install -o root -m$(SUIDMODE) $(PROG) $(INSTALLROOT)$(BINDIR)
> > +Index: netkit-rsh-0.17/rlogind/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- netkit-rsh-0.17.orig/rlogind/Makefile
> > ++++ netkit-rsh-0.17/rlogind/Makefile
> > +@@ -13,7 +13,7 @@ LIBS +=3D -ldl -lpam -lpam_misc
> > + endif
> > +=20
> > + rlogind: $(OBJS)
> > +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> > ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> > +=20
> > + rlogind.o: pathnames.h logwtmp.h rlogind.h ../version.h
> > + logwtmp.o: logwtmp.h
> > diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.=
bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> > new file mode 100644
> > index 0000000..6874950
> > --- /dev/null
> > +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> > @@ -0,0 +1,61 @@
> > +DESCRIPTION =3D "netkit-rsh includes the rsh daemon and client."
> > +SECTION =3D "networking"
> > +HOMEPAGE=3D"ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> > +LICENSE =3D "BSD"
> > +DEPENDS =3D "libpam libgcrypt"
> > +
> > +LIC_FILES_CHKSUM =3D "file://rsh/rsh.c;beginline=3D2;endline=3D3;md5=
=3D25737e9d21d9df251dd26b7dcbd8ee29"
> > +
> > +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.=
tar.gz;name=3Darchive \
> > +            ${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}-15.dif=
f.gz;name=3Dpatch15 \
> > +            file://rsh-redone_link_order_file.patch \
> > +"
> > +
> > +SRC_URI[archive.md5sum] =3D "65f5f28e2fe22d9ad8b17bb9a10df096"
> > +SRC_URI[archive.sha256sum] =3D "edcac7fa18015f0bc04e573f3f54ae3b638d71=
335df1ad7dae692779914ad669"
> > +SRC_URI[patch15.md5sum] =3D "655efc0d541b03ca5de0ae506c805ea3"
> > +SRC_URI[patch15.sha256sum] =3D "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e=
9b1798694d9874733293bc2aa9"
> > +
> > +inherit distro_features_check
> > +
> > +CFLAGS +=3D " -D_GNU_SOURCE -Wno-deprecated-declarations"
> > +LDFLAGS +=3D " -lutil"
> > +
> > +do_configure () {
> > +    ./configure --prefix=3D${prefix}
> > +    echo "USE_PAM=3D1" >> MCONFIG
> > +    echo "LDFLAGS=3D${LDFLAGS}" >> MCONFIG
> > +
> > +    # didn't want to patch these next changes
> > +    sed -i 's/netkit-//' ${S}/rsh/pathnames.h
> > +    sed -i 's/netkit-//' ${S}/rcp/pathnames.h
> > +}
> > +
> > +do_install () {
> > +    install -d ${D}${bindir}
> > +    install -d ${D}${sbindir}
> > +    install -d ${D}${mandir}/man1
> > +    install -d ${D}${mandir}/man8
> > +    install -d ${D}${sysconfdir}/pam.d
> > +
> > +    oe_runmake 'INSTALLROOT=3D${D}' 'BINMODE=3D0755' \
> > +    'DAEMONMODE=3D0755' 'MANMODE=3D0644' \
> > +    'SUIDMODE=3D4755' \
> > +    'BINDIR=3D${bindir}' 'SBINDIR=3D${sbindir}' \
> > +    'MANDIR=3D${mandir}' install
> > +
> > +    install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
> > +    install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
> > +    install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
> > +    install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
> > +}
> > +
> > +PACKAGES =3D "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
> > +FILES_${PN}-client =3D "${bindir}/*"
> > +FILES_${PN}-server =3D "${sbindir}/* ${sysconfdir}"
> > +FILES_${PN}-doc =3D "${mandir}"
> > +FILES_${PN}-dbg =3D "${prefix}/src/debug \
> > +                   ${sbindir}/.debug ${bindir}/.debug"
> > +
> > +RDEPENDS_${PN} =3D "libpam"
> > +REQUIRED_DISTRO_FEATURES ?=3D "pam"
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--ULyIDA2m8JTe+TiX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUf3rKAAoJEEn8ffcsOfaWyNIH+QFnsYVYeYj2rTfQO14Lm7s3
0G4gC5GkTWVFiJjuQoFVqLH249z1jqUHsitxMrLYdexPtti8/Ke7Z0ALmvmMWAGP
d23DQ0u0ZxDaofRZ40+n7WqU6zzWbhzn7M4Uq3zdaA/xrDV/F5A3O6x6WWQ3BAbG
2mE5TmY1buk09MTB+WDtaCvGSzPujXL1P01hG3/awd6GcigA2m22kRymSTD1jygF
askI2O6k0wCZ1KRkpaT1ELpmj4frfc5ocE4QttdPqOWoEzWBuJdu54vu8H2ACkXq
51w5qmOBEc3rKFSBaX7cPqtfDCFn8U7eIqCJi0BBXoxJULM7FdYe53gQ/VrcW34=
=2Dk8
-----END PGP SIGNATURE-----

--ULyIDA2m8JTe+TiX--
