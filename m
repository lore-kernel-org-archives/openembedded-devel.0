Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 794D7726C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 16:35:26 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so20792299wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 08:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1X8MEeIGPaoTlB5TyyH2kK7q6e6KHBPfAnZkFWqEZHE=;
	b=Sx98L7A3B1q5Jds9YDKWF9N0jIXxV3DF6CCWTVPwgcchFYIF7THJXfY2cxT+v98CI5
	uApOSjG5sDUSIue3i+U5x2nMkwv0GU96Sgu1D0JAeKuRI7nrHANtTeHzgj0EevkzFZ2Z
	k0DwJz96SSQSQAYXWsYnUIqB/5CUKYhYhiyL2+wjqXQQiHlDUXLoDnbA0rvfRBy+PErQ
	cP9lHY/Z+UFF7Cn1dVRxmpBezP/ZCO3ROApbhDf3xCTpmwkB/eqt5ZDzJZnOpXS+xOn2
	0hGrveRfVtImYDG32yll/vm4QKFOX+e2FPr/bRSpbgwa0DoFIvmkN5+gM7pPmAxySpLB
	lyGQ==
X-Received: by 10.180.216.36 with SMTP id on4mr15810452wic.27.1418834126681;
	Wed, 17 Dec 2014 08:35:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm6738081wic.16.2014.12.17.08.35.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Dec 2014 08:35:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Dec 2014 17:35:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141217163527.GA12489@jama>
References: <1418493812-17585-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1418493812-17585-1-git-send-email-akuster808@gmail.com>
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
X-List-Received-Date: Wed, 17 Dec 2014 16:35:29 -0000
X-Groupsio-MsgNum: 53360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2014 at 10:03:32AM -0800, Armin Kuster wrote:
> V2: fix license
>     moved xinent.d config to file
>     remove INSANE

Missing line-feed before LICENSE variable, doesn't even parse because
bitbake doesn't see LICENSE..

ERROR: This recipe does not have the LICENSE field set (netkit-tftp)
ERROR: Failed to parse recipe: /home/jenkins/oe/world/shr-core/meta-openemb=
edded/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
ETA:  00:01:48

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../netkit-tftp/netkit-tftp/tftp.conf              | 11 +++++
>  .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 54 ++++++++++++++++=
++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tft=
p/tftp.conf
>  create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tft=
p_0.17.bb
>=20
> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.=
conf b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
> new file mode 100644
> index 0000000..7bc6ca9
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
> @@ -0,0 +1,11 @@
> +service tftp
> +{
> +    disable        =3D no
> +    socket_type    =3D dgram
> +    port           =3D 69
> +    protocol       =3D udp
> +    wait           =3D yes
> +    user           =3D nobody
> +    server         =3D /usr/sbin/in.tftpd
> +    server_args    =3D /tftpboot
> +}
> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.=
bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> new file mode 100644
> index 0000000..43075d7
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> @@ -0,0 +1,54 @@
> +DESCRIPTION =3D " tftp - Trivial file transfer protocol client \
> +    tftpd- Trivial file transfer protocol server "
> +SECTION =3D "networking" LICENSE =3D "BSD-4-Clause"
> +DEPENDS =3D " tcp-wrappers"
> +
> +LIC_FILES_CHKSUM =3D "file://tftp/tftp.c;beginline=3D2;endline=3D3;md5=
=3D84d2cfe1e60863a7d82648734ba4d30c"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;nam=
e=3Darchive \
> +        ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=3Dpa=
tch18 \
> +        file://tftp.conf \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "b7262c798e2ff50e29c2ff50dfd8d6a8"
> +SRC_URI[archive.sha256sum] =3D "3a43c0010d4e61f412563fd83769d4667d8b8e82=
903526d21cb9205fe55ad14d"
> +SRC_URI[patch18.md5sum] =3D "cb29e7a33dd85105ba6e6ec4f971e42c"
> +SRC_URI[patch18.sha256sum] =3D "092437d27b4fa88c044ef6290372fee5ce06d223=
607f0e22a6e527065c8930e7"
> +
> +inherit autotools-brokensep
> +
> +do_configure () {
> +    ./configure --prefix=3D${prefix}
> +    echo "CFLAGS=3D${CFLAGS}" > MCONFIG
> +}
> +
> +do_compile () {
> +    oe_runmake 'CC=3D${CC}' 'LD=3D${LD}' 'LDFLAGS=3D${LDFLAGS}' 'CFLAGS=
=3D${CFLAGS}'
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}${sbindir}
> +    install -d ${D}${mandir}/man1
> +    install -d ${D}${mandir}/man8
> +    install -d ${D}${sysconfdir}/xinetd.d
> +
> +    sed -i 's/install -s/install/' tftp/Makefile
> +    sed -i 's/install -s/install/' tftpd/Makefile
> +
> +    oe_runmake 'INSTALLROOT=3D${D}' 'BINMODE=3D0755' \
> +    'DAEMONMODE=3D0755' 'MANMODE=3D0644' \
> +    'BINDIR=3D${bindir}' 'SBINDIR=3D${sbindir}' \
> +    'MANDIR=3D${mandir}' install
> +
> +    install ${WORKDIR}/tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
> +}
> +
> +PACKAGES =3D "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
> +FILES_${PN}-client =3D "${bindir}/*"
> +FILES_${PN}-server =3D "${sbindir}/* ${sysconfdir}/xinetd.d/*"
> +FILES_${PN}-doc =3D "${mandir}"
> +FILES_${PN}-dbg =3D "${prefix}/src/debug \
> +            ${bindir}/.debug ${sbindir}/.debug"
> +
> +RDEPENDS_${PN}-server =3D "tcp-wrappers xinetd"
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

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSRsM8ACgkQN1Ujt2V2gBythwCfSMVNHnSt4/ajs8mGLV34UxNT
iFoAniHNXKF76RFS5AmYyjczrX53ThVp
=AmHQ
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
