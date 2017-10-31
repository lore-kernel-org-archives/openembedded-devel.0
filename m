Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CCE2E78218
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 13:35:32 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e9Wha-0005BX-4P from Joe_MacDonald@mentor.com ;
	Tue, 31 Oct 2017 06:35:34 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 31 Oct 2017 06:35:33 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	7CDB4592670; Tue, 31 Oct 2017 09:35:32 -0400 (EDT)
Date: Tue, 31 Oct 2017 09:35:32 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20171031133532.qjfwz7omq5qan6ho@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-2-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1spKpcdiGpxLcFhUniOULxWeiST-d20r85pkOepo_7awNw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spKpcdiGpxLcFhUniOULxWeiST-d20r85pkOepo_7awNw@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/6] ddclient: new package
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
X-List-Received-Date: Tue, 31 Oct 2017 13:35:32 -0000
X-Groupsio-MsgNum: 69411
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eve6tq2ufecmwrwt"
Content-Disposition: inline

--eve6tq2ufecmwrwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/6] ddclient: new package] On 17.10.30 (=
Mon 16:14) Khem Raj wrote:

> On Mon, Oct 30, 2017 at 11:11 AM, Joe MacDonald
> <joe_macdonald@mentor.com> wrote:
> > From: "Kinsella, Ray" <ray.kinsella@intel.com>
> >
> > Adding the package ddclient. DDClient updates Dynamic DNS servers with =
an IP address.
> > Recipe is based on the original OE recipe found here.
> >
> > http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclien=
t_3.6.3.bb
> >
> > with modifications based on the recipe at:
> >
> > https://github.com/cshoredaniel/meta-cshored/blob/master/recipes-connec=
tivity/ddclient/ddclient_3.8.3.bb
> >
> > DDClient version has been updated to 3.8.3.
> >
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 44 ++++++++++++++=
++++++++
> >  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
> >  .../recipes-daemons/ddclient/files/persistent      |  1 +
> >  3 files changed, 49 insertions(+)
> >  create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3=
=2E8.3.bb
> >  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
> >  create mode 100644 meta-networking/recipes-daemons/ddclient/files/pers=
istent
> >
> > diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb=
 b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> > new file mode 100644
> > index 0000000..d83a4d4
> > --- /dev/null
> > +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> > @@ -0,0 +1,44 @@
> > +SECTION =3D "net/misc"
> > +DESCRIPTION =3D "Ddclient is a Perl client used to update dynamic DNS =
entries for accounts on Dynamic DNS Network Services"
> > +HOMEPAGE =3D "http://ddclient.sourceforge.net/"
> > +LICENSE =3D "GPLv2"
> > +
> > +SRC_URI =3D "\
> > +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
> > +    file://ip-up"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    perl-module-getopt-long \
> > +    perl-module-sys-hostname \
> > +    perl-module-io-socket \
> > +    perl-module-vars \
> > +    perl-module-overload \
> > +    perl-module-overloading \
> > +    perl-module-config \
> > +    perl-module-integer \
> > +    perl-module-exporter-heavy \
> > +    perl-module-symbol \
> > +    perl-module-selectsaver \
> > +    bash \
> > +    perl \
> > +    libio-socket-ssl-perl"
> > +
> > +do_install() {
> > +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconf=
dir}/init.d
> > +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}=
/ddclient
> > +    install -m 755 ${S}/ddclient ${D}${sbindir}
> > +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/d=
dclient.conf
> > +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddcl=
ient
> > +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/s=
ample-etc_rc.d_init.d_ddclient > ${S}/rc_init
> > +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
> > +    install ${S}/README* ${D}${docdir}/ddclient
> > +    install ${S}/COPY* ${D}${docdir}/ddclient
> > +    install ${S}/sample* ${D}${docdir}/ddclient
> > +}
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/ddclient/ddclient.conf"
> > +
> > +SRC_URI[md5sum] =3D "3b426ae52d509e463b42eeb08fb89e0b"
> > +SRC_URI[sha256sum] =3D "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a=
886b8c71e44d819591"
> > diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/met=
a-networking/recipes-daemons/ddclient/files/ip-up
> > new file mode 100644
> > index 0000000..4411db9
> > --- /dev/null
> > +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
> > @@ -0,0 +1,4 @@
> > +#!/bin/sh
> > +
> > +logger -t ddclient $PPP_IFACE $PPP_LOCAL
> > +ddclient -daemon=3D0 -syslog -use=3Dif -if=3D$PPP_IFACE >/dev/null 2>&1
> > diff --git a/meta-networking/recipes-daemons/ddclient/files/persistent =
b/meta-networking/recipes-daemons/ddclient/files/persistent
> > new file mode 100644
> > index 0000000..b721272
> > --- /dev/null
> > +++ b/meta-networking/recipes-daemons/ddclient/files/persistent
> > @@ -0,0 +1 @@
> > +l root root 0644 /etc/ddclient.conf /var/persistent/etc/ddclient.conf
>=20
> this file seems to be unused. Can we delete it if no needed.

Actually, that appears to be an oversight, it was supposed to be
installed in this style:

   https://github.com/cshoredaniel/meta-cshored/blob/master/recipes-connect=
ivity/ddclient/ddclient_3.8.3.bb#L31

Corrected in the next version.

--=20
-Joe MacDonald.
:wq

--eve6tq2ufecmwrwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAln4fCQACgkQSfx99yw5
9pZnKgf/dOsSKaJ82EA5ceIpm/M/qczHfn0Pc19Hg5jSYyIdVG5uZt/ny535BtC8
y7d7nhyVyP2jRXvxp32aqKFWfUgytRpVrIPfPUTwbAqO8yQBzftAdd6dg8w2TDT7
c2XYeII1TyhGIDZs13n+0D7bXwiXgAhF+Pf+5WxuiDgXXrO0d4T353ilFqi6ohk9
9QiiBU6gsS9swVv13f35pOwqLI0PmyUI2Up9ZxFiYsj6BWmW0EturoZBMtT/5lml
WJAWYsXhcKrH+Abzl8mCO1ap695NUavjTaOqCylByPUZj5DX5UwgYkRc6i9Td48c
9ofgu0KKDwjcZBrNHkTeynostb+8pg==
=iHbu
-----END PGP SIGNATURE-----

--eve6tq2ufecmwrwt--
