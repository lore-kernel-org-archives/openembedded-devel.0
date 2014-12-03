Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 21C3165E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:49:33 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so32278438wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 09:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j0JLvyqLNudfffJL+rY2SQGSKL7Qg7vroQtJ5xii2w0=;
	b=VGKwPTiuS4v0nkgAlJJSBFl4gYgR+dJpicISoHFOmeWqilJr9VITYblvjENKf2zcj3
	/AAZjpJv9h636l25AAE9UVHr0+6WShegQIQhuicxs0+A04qQuwzdz+dliw45XYUdGMXS
	JQ8GI0VKs06e26PtJlO1JksQFCM+nCgIryPGloThpk1EkCPkyQXTjUiFsP9qBALYivcE
	KR6g6QP+LHSLOEKHxhkHCmRwAwEjOGCOUUSJZo1BU05Es4FAxnCBQF/mo6mfSF1Oe+po
	OykaFxkxHFpz2TpAhBqaVOM2+A5ZcX55GQ4uU9N/NmLWqr0UFCvueflPxAxml7N8K6E8
	j6DA==
X-Received: by 10.180.198.164 with SMTP id jd4mr100963509wic.42.1417628973810; 
	Wed, 03 Dec 2014 09:49:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m6sm28509841wix.10.2014.12.03.09.49.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 09:49:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Dec 2014 18:49:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141203174933.GC2455@jama>
References: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
	<1417152844-23643-2-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417152844-23643-2-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 03 Dec 2014 17:49:34 -0000
X-Groupsio-MsgNum: 53168
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline

--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2014 at 09:34:03PM -0800, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

Subject should start with "netkit-rsh: "

Use netkit-rsh instead of files for slightly faster lookup.

This applies to more patches you recently sent, I'll update them this
time when cherry-picking to master-next, but please check that next
time.

> ---
>  .../files/rsh-redone_link_order_file.patch         | 64 ++++++++++++++++=
++++++
>  .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 61 ++++++++++++++++=
+++++
>  2 files changed, 125 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/files/rsh-r=
edone_link_order_file.patch
>  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_=
0.17.bb
>=20
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_l=
ink_order_file.patch b/meta-networking/recipes-netkit/netkit-rsh/files/rsh-=
redone_link_order_file.patch
> new file mode 100644
> index 0000000..bded510
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_ord=
er_file.patch
> @@ -0,0 +1,64 @@
> +This fixes a build issue caused by linking order.
> +
> +Upstream-Status: Inappropriate
> +Most distos have there own verison of this fix. This was derived by
> +* Fix link order to list libraries after the objects that require them
> +(LP: #771080).
> +
> +-- Colin Watson <cjwatson@ubuntu.com>  Tue, 13 Sep 2011 10:07:08 +0100
> +
> +
> +signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Index: netkit-rsh-0.17/rsh/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netkit-rsh-0.17.orig/rsh/Makefile
> ++++ netkit-rsh-0.17/rsh/Makefile
> +@@ -6,7 +6,7 @@ include ../MRULES
> + OBJS =3D rsh.o
> +=20
> + rsh: $(OBJS)
> +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> +=20
> + install: rsh
> + 	install -o root -m$(SUIDMODE) rsh $(INSTALLROOT)$(BINDIR)
> +Index: netkit-rsh-0.17/rshd/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netkit-rsh-0.17.orig/rshd/Makefile
> ++++ netkit-rsh-0.17/rshd/Makefile
> +@@ -11,7 +11,7 @@ LIBS +=3D -ldl -lpam
> + endif
> +=20
> + rshd: $(OBJS)
> +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> +=20
> + install: rshd
> + 	install -m$(DAEMONMODE) rshd $(INSTALLROOT)$(SBINDIR)/in.rshd
> +Index: netkit-rsh-0.17/rlogin/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netkit-rsh-0.17.orig/rlogin/Makefile
> ++++ netkit-rsh-0.17/rlogin/Makefile
> +@@ -7,7 +7,7 @@ PROG=3Drlogin
> + OBJS=3Drlogin.o
> +=20
> + $(PROG): $(OBJS)
> +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)=20
> +=20
> + install: $(PROG)
> + 	install -o root -m$(SUIDMODE) $(PROG) $(INSTALLROOT)$(BINDIR)
> +Index: netkit-rsh-0.17/rlogind/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netkit-rsh-0.17.orig/rlogind/Makefile
> ++++ netkit-rsh-0.17/rlogind/Makefile
> +@@ -13,7 +13,7 @@ LIBS +=3D -ldl -lpam -lpam_misc
> + endif
> +=20
> + rlogind: $(OBJS)
> +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> +=20
> + rlogind.o: pathnames.h logwtmp.h rlogind.h ../version.h
> + logwtmp.o: logwtmp.h
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb=
 b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> new file mode 100644
> index 0000000..6874950
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "netkit-rsh includes the rsh daemon and client."
> +SECTION =3D "networking"
> +HOMEPAGE=3D"ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> +LICENSE =3D "BSD"
> +DEPENDS =3D "libpam libgcrypt"
> +
> +LIC_FILES_CHKSUM =3D "file://rsh/rsh.c;beginline=3D2;endline=3D3;md5=3D2=
5737e9d21d9df251dd26b7dcbd8ee29"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.ta=
r.gz;name=3Darchive \
> +            ${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}-15.diff.=
gz;name=3Dpatch15 \
> +            file://rsh-redone_link_order_file.patch \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "65f5f28e2fe22d9ad8b17bb9a10df096"
> +SRC_URI[archive.sha256sum] =3D "edcac7fa18015f0bc04e573f3f54ae3b638d7133=
5df1ad7dae692779914ad669"
> +SRC_URI[patch15.md5sum] =3D "655efc0d541b03ca5de0ae506c805ea3"
> +SRC_URI[patch15.sha256sum] =3D "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b=
1798694d9874733293bc2aa9"
> +
> +inherit distro_features_check
> +
> +CFLAGS +=3D " -D_GNU_SOURCE -Wno-deprecated-declarations"
> +LDFLAGS +=3D " -lutil"
> +
> +do_configure () {
> +    ./configure --prefix=3D${prefix}
> +    echo "USE_PAM=3D1" >> MCONFIG
> +    echo "LDFLAGS=3D${LDFLAGS}" >> MCONFIG
> +
> +    # didn't want to patch these next changes
> +    sed -i 's/netkit-//' ${S}/rsh/pathnames.h
> +    sed -i 's/netkit-//' ${S}/rcp/pathnames.h
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}${sbindir}
> +    install -d ${D}${mandir}/man1
> +    install -d ${D}${mandir}/man8
> +    install -d ${D}${sysconfdir}/pam.d
> +
> +    oe_runmake 'INSTALLROOT=3D${D}' 'BINMODE=3D0755' \
> +    'DAEMONMODE=3D0755' 'MANMODE=3D0644' \
> +    'SUIDMODE=3D4755' \
> +    'BINDIR=3D${bindir}' 'SBINDIR=3D${sbindir}' \
> +    'MANDIR=3D${mandir}' install
> +
> +    install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
> +    install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
> +    install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
> +    install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
> +}
> +
> +PACKAGES =3D "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
> +FILES_${PN}-client =3D "${bindir}/*"
> +FILES_${PN}-server =3D "${sbindir}/* ${sysconfdir}"
> +FILES_${PN}-doc =3D "${mandir}"
> +FILES_${PN}-dbg =3D "${prefix}/src/debug \
> +                   ${sbindir}/.debug ${bindir}/.debug"
> +
> +RDEPENDS_${PN} =3D "libpam"
> +REQUIRED_DISTRO_FEATURES ?=3D "pam"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR/TS0ACgkQN1Ujt2V2gBzjFwCfQ2eTO/vGFF8smhu6YV8URjwq
2+IAn3brZidDRx4fNexHtVdVahTd4Qfx
=Lz0s
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
