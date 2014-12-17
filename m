Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7B93765D3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 18:16:47 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so17881137wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dLrydVNkc7G1NpWIE9/mvhOfCtqi7T0fSNE3iczwNec=;
	b=E7+OF1X9mQotZmklef7icyjxtcK7gvMNeTdZ3SU2avCD+ZDQWIMiA19wFpBM9Tvtol
	2tIZ7orjZxcPiIP6U0GSHNi65XKPW05cWmZ0qml5A0PSNEu1Ho5wbUMUAaCDYwt1m15W
	2tqx7hxEG0nEUcb9LkBE0P+MtbXrG3uyTRqpnH6uNS2YLJg+DTnHNzlWVdMXFqWP80Dh
	SvJyXo1Mxvb003IMTu6/pl09BkvRU6EHjBxQCgs2WuLHYMy69PugD4WFvttibXklT6wk
	XT8z/46Fht/XrkxKxJYZLboQNs9FD7/i79vsAqc3g0116025m+sMh1Uh0aQEmgSUG0Xj
	D4QQ==
X-Received: by 10.194.156.202 with SMTP id wg10mr59283768wjb.59.1418840207507; 
	Wed, 17 Dec 2014 10:16:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q7sm1238862wiv.8.2014.12.17.10.16.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Dec 2014 10:16:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Dec 2014 19:16:49 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141217181649.GB12489@jama>
References: <1418493812-17585-1-git-send-email-akuster808@gmail.com>
	<20141217163527.GA12489@jama> <5491C19F.9080307@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5491C19F.9080307@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH V2] netkit-tftp: new package
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
X-List-Received-Date: Wed, 17 Dec 2014 18:16:51 -0000
X-Groupsio-MsgNum: 53362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2014 at 09:47:11AM -0800, akuster808 wrote:
>=20
> ok. thanks for the feedback.

FYI: I've also fixed it in master-next.

I've shortened the DESCRIPTION a bit, if you want package specific
description it could be set with package qualifier.

I've removed V2: .. from commit message (I guess you wanted to include
it bellow ---.

I've dropped leading space from DEPENDS.

> On 12/17/2014 08:35 AM, Martin Jansa wrote:
> > On Sat, Dec 13, 2014 at 10:03:32AM -0800, Armin Kuster wrote:
> >> V2: fix license
> >>      moved xinent.d config to file
> >>      remove INSANE
> >
> > Missing line-feed before LICENSE variable, doesn't even parse because
> > bitbake doesn't see LICENSE..
> >
> > ERROR: This recipe does not have the LICENSE field set (netkit-tftp)
> > ERROR: Failed to parse recipe: /home/jenkins/oe/world/shr-core/meta-ope=
nembedded/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> > ETA:  00:01:48
> >
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>   .../netkit-tftp/netkit-tftp/tftp.conf              | 11 +++++
> >>   .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 54 ++++++++++++=
++++++++++
> >>   2 files changed, 65 insertions(+)
> >>   create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit=
-tftp/tftp.conf
> >>   create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit=
-tftp_0.17.bb
> >>
> >> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tf=
tp.conf b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
> >> new file mode 100644
> >> index 0000000..7bc6ca9
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
> >> @@ -0,0 +1,11 @@
> >> +service tftp
> >> +{
> >> +    disable        =3D no
> >> +    socket_type    =3D dgram
> >> +    port           =3D 69
> >> +    protocol       =3D udp
> >> +    wait           =3D yes
> >> +    user           =3D nobody
> >> +    server         =3D /usr/sbin/in.tftpd
> >> +    server_args    =3D /tftpboot
> >> +}
> >> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.=
17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> >> new file mode 100644
> >> index 0000000..43075d7
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> >> @@ -0,0 +1,54 @@
> >> +DESCRIPTION =3D " tftp - Trivial file transfer protocol client \
> >> +    tftpd- Trivial file transfer protocol server "
> >> +SECTION =3D "networking" LICENSE =3D "BSD-4-Clause"
> >> +DEPENDS =3D " tcp-wrappers"
> >> +
> >> +LIC_FILES_CHKSUM =3D "file://tftp/tftp.c;beginline=3D2;endline=3D3;md=
5=3D84d2cfe1e60863a7d82648734ba4d30c"
> >> +
> >> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;=
name=3Darchive \
> >> +        ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=
=3Dpatch18 \
> >> +        file://tftp.conf \
> >> +"
> >> +
> >> +SRC_URI[archive.md5sum] =3D "b7262c798e2ff50e29c2ff50dfd8d6a8"
> >> +SRC_URI[archive.sha256sum] =3D "3a43c0010d4e61f412563fd83769d4667d8b8=
e82903526d21cb9205fe55ad14d"
> >> +SRC_URI[patch18.md5sum] =3D "cb29e7a33dd85105ba6e6ec4f971e42c"
> >> +SRC_URI[patch18.sha256sum] =3D "092437d27b4fa88c044ef6290372fee5ce06d=
223607f0e22a6e527065c8930e7"
> >> +
> >> +inherit autotools-brokensep
> >> +
> >> +do_configure () {
> >> +    ./configure --prefix=3D${prefix}
> >> +    echo "CFLAGS=3D${CFLAGS}" > MCONFIG
> >> +}
> >> +
> >> +do_compile () {
> >> +    oe_runmake 'CC=3D${CC}' 'LD=3D${LD}' 'LDFLAGS=3D${LDFLAGS}' 'CFLA=
GS=3D${CFLAGS}'
> >> +}
> >> +
> >> +do_install () {
> >> +    install -d ${D}${bindir}
> >> +    install -d ${D}${sbindir}
> >> +    install -d ${D}${mandir}/man1
> >> +    install -d ${D}${mandir}/man8
> >> +    install -d ${D}${sysconfdir}/xinetd.d
> >> +
> >> +    sed -i 's/install -s/install/' tftp/Makefile
> >> +    sed -i 's/install -s/install/' tftpd/Makefile
> >> +
> >> +    oe_runmake 'INSTALLROOT=3D${D}' 'BINMODE=3D0755' \
> >> +    'DAEMONMODE=3D0755' 'MANMODE=3D0644' \
> >> +    'BINDIR=3D${bindir}' 'SBINDIR=3D${sbindir}' \
> >> +    'MANDIR=3D${mandir}' install
> >> +
> >> +    install ${WORKDIR}/tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
> >> +}
> >> +
> >> +PACKAGES =3D "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
> >> +FILES_${PN}-client =3D "${bindir}/*"
> >> +FILES_${PN}-server =3D "${sbindir}/* ${sysconfdir}/xinetd.d/*"
> >> +FILES_${PN}-doc =3D "${mandir}"
> >> +FILES_${PN}-dbg =3D "${prefix}/src/debug \
> >> +            ${bindir}/.debug ${sbindir}/.debug"
> >> +
> >> +RDEPENDS_${PN}-server =3D "tcp-wrappers xinetd"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSRyJEACgkQN1Ujt2V2gBxgzwCeI+Qmntk8ENc3mvUwQ15hgrI8
4Y0An0SobKk8E77DcqLpA/TaeMrlO2+w
=VO5u
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
