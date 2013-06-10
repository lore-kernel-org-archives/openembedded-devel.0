Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D455D61FB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 15:17:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5AFHgKo029809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 08:17:42 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 10 Jun 2013 08:17:41 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 256507FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 11:17:31 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 284AF4049F; Mon,
	10 Jun 2013 11:17:41 -0400 (EDT)
Date: Mon, 10 Jun 2013 11:17:41 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130610151740.GE9561@windriver.com>
References: <m6pg8v2p8pw3.fsf@cisco.com>
MIME-Version: 1.0
In-Reply-To: <m6pg8v2p8pw3.fsf@cisco.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2] net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos
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
X-List-Received-Date: Mon, 10 Jun 2013 15:17:42 -0000
X-Groupsio-MsgNum: 44991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline

--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v2] net-snmp: Backport fix for NETSNMP_NO_SYS=
TEMD typos] On 13.06.04 (Tue 18:36) Thomas Fitzsimmons wrote:

> Added Signed-off-by for backport patch refresh.  Bumped PR.

Merged, thanks.

-J.

>=20
> Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
> ---
>  .../net-snmp/net-snmp/systemd-support.patch        |    6 ++++--
>  .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |    2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-=
support.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd=
-support.patch
> index 18955f2..e19153b 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support=
=2Epatch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support=
=2Epatch
> @@ -7,12 +7,14 @@ fef6cddfdb94da1a6b1fb768af62918b80f11fd3
>  0641e43c694c485cbbffef0556efc4641bd3ff50
>  76530a89f1c8bbd0b63acce63e10d5d4812a1a16 (conflict resolved)
>  bf108d7f1354f6276fc43c129963f2c49b9fc242
> +3692875172352f72cf3afd0d35f355e83d7e421b
>  74412748067c685e1d8ab6ed3bcc3ca9c2774844
>  86132e3f1e6ef7b4e0b96d8fa24e37c81b71b0e0
>  63557cf8986a33dba1d4429b583a901361052c4f
> =20
>  Upstream-Status: Backport
> =20
> +Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
>  diff --git a/README.systemd b/README.systemd
>  new file mode 100644
>  index 0000000..f731851
> @@ -89,10 +91,10 @@ index b177d5b..08bdfc7 100644
>   #endif
>  =20
>   #ifndef WIN32
> -+#ifndef NETSNMP_NO_SYSYSTEMD
> ++#ifndef NETSNMP_NO_SYSTEMD
>  +    /* check if systemd has sockets for us and don't close them */
>  +    prepared_sockets =3D netsnmp_sd_listen_fds(0);
> -+#endif /* NETSNMP_NO_SYSYSTEMD */
> ++#endif /* NETSNMP_NO_SYSTEMD */
>  +
>       /*
>        * close all non-standard file descriptors we may have
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> index 4c3939a..d21995a 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=
=3D8;md5=3D7f7f00ba639ac8e8deb5
> =20
>  DEPENDS =3D "openssl libnl pciutils"
> =20
> +PR =3D "r1"
> +
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>          file://init \
>          file://snmpd.conf \
--=20
-Joe MacDonald.
:wq

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlG17hQACgkQPN8S4W6ZZncVDgCfcKSVQFQzpoLxv1YkV19TBD4K
1u0AniGV5FAPEYek2xa2LaLfjIIszdO9
=xyKU
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
