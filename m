Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3A07E72F8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:22:37 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1cgE98-0001Ma-PG from Joe_MacDonald@mentor.com ;
	Tue, 21 Feb 2017 09:22:38 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Feb 2017 09:22:38 -0800
Received: by burninator (Postfix, from userid 1000)	id 7DC8158044A; Tue, 21
	Feb 2017 12:22:37 -0500 (EST)
Date: Tue, 21 Feb 2017 12:22:37 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Ray Kinsella <ray.kinsella@intel.com>
Message-ID: <20170221172236.GT8436@mentor.com>
References: <1487697210-29779-1-git-send-email-ray.kinsella@intel.com>
MIME-Version: 1.0
In-Reply-To: <1487697210-29779-1-git-send-email-ray.kinsella@intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-networking] ddclient: new package
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
X-List-Received-Date: Tue, 21 Feb 2017 17:22:40 -0000
X-Groupsio-MsgNum: 65423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nuX4E7Vid9I2gnPU"
Content-Disposition: inline

--nuX4E7Vid9I2gnPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH]  [meta-networking] ddclient: new package] On 17.02.21 (Tue 17=
:13) Ray Kinsella wrote:

> Adding the package ddclient. DDClient updates Dynamic DNS servers with an=
 IP address.
> Recipe is based on the original OE recipe found here.
>=20
> http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclient_=
3.6.3.bb
>=20
> DDClient version has been updated to 3.8.3.
>=20
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45 ++++++++++++++++=
++++++
>  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8=
=2E3.bb
>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
>=20
> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b=
/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> new file mode 100644
> index 0000000..723eb67
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> @@ -0,0 +1,45 @@
> +SECTION =3D "net/misc"
> +DESCRIPTION =3D "Ddclient is a Perl client used to update dynamic DNS en=
tries for accounts on Dynamic DNS Network Services"
> +HOMEPAGE =3D "http://ddclient.sourceforge.net/"
> +LICENSE =3D "GPLv2"
> +PR =3D "r4"

We don't need explicit PRs anymore.

> +SRC_URI =3D "\
> +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
> +    file://ip-up"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +RDEPENDS_${PN} =3D "\
> +    perl-module-getopt-long \
> +    perl-module-sys-hostname \
> +    perl-module-io-socket \
> +    perl-module-vars \
> +    perl-module-overload \
> +    perl-module-overloading \
> +    perl-module-config \
> +    perl-module-integer \
> +    perl-module-exporter-heavy \
> +    perl-module-symbol \
> +    perl-module-selectsaver \
> +    bash \
> +    perl \
> +    libio-socket-ssl-perl"

I haven't looked at the download, but I did briefly read the SF documentati=
on
and it seems like maybe these would be appropriate as well:

do_configure[noexec] =3D "1"
do_compile[noexec] =3D "1"

> +do_install() {
> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdi=
r}/init.d
> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/d=
dclient
> +    install -m 755 ${S}/ddclient ${D}${sbindir}
> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddc=
lient.conf
> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclie=
nt
> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/sam=
ple-etc_rc.d_init.d_ddclient > ${S}/rc_init
> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
> +    install ${S}/README* ${D}${docdir}/ddclient
> +    install ${S}/COPY* ${D}${docdir}/ddclient
> +    install ${S}/sample* ${D}${docdir}/ddclient
> +}
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/ddclient/ddclient.conf"
> +
> +SRC_URI[md5sum] =3D "3b426ae52d509e463b42eeb08fb89e0b"
> +SRC_URI[sha256sum] =3D "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a88=
6b8c71e44d819591"
> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/meta-=
networking/recipes-daemons/ddclient/files/ip-up
> new file mode 100644
> index 0000000..52a44f8
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
> +ddclient -daemon=3D0 -syslog -use=3Dif -if=3D$PPP_IFACE >/dev/null 2>&1
> \ No newline at end of file

That's odd.  :-)

Anyway, I'll have a look at this in more detail when it loops through
master-next.

--=20
-Joe MacDonald.
:wq

--nuX4E7Vid9I2gnPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYrHdcAAoJEEn8ffcsOfaW1AoH/RpA0ByAvkQZmHnT9IdZVtk0
WuROinagVK057VDM3AdczZ45wfmqczPSI7/nt9YwuYV1Ctdw0EYLrr/YGtG4KAg6
qwZY5xvbnereOwCL/TgYXsl0EXD+zIkbz9wpIZR9Lyy6FjDo9zj/5PDU2JXVlRNr
mGz6lvZpimrMaDG4KoYs/PmsaP7ez5lwshbjKb7oydWLsS9GLPUdbdgvOg3sek3u
CAS0JeU+uL+JckJW72KA8sweKS+cFmYWguTTwQ5WLwg/TUfBqZyni1P27zGnfRAn
KHqA3WuY664K2HHZaCkM8QR1x0lbv1EsUmsZu6h5wLq8k6wvkJcszwDjUh7okes=
=KnMb
-----END PGP SIGNATURE-----

--nuX4E7Vid9I2gnPU--
