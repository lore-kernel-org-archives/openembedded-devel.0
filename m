Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B482E7339E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:23:29 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YLkNH-00059I-AH from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2015 19:23:31 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 19:23:30 -0800
Received: by burninator (Postfix, from userid 1000)	id 3CB5C581332; Wed, 11
	Feb 2015 22:23:30 -0500 (EST)
Date: Wed, 11 Feb 2015 22:23:30 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150212032329.GP30457@mentor.com>
References: <1423449560-11909-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1423449560-11909-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] proftpd: add systemd support
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
X-List-Received-Date: Thu, 12 Feb 2015 03:23:29 -0000
X-Groupsio-MsgNum: 54202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Content-Disposition: inline

--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Roy.  I corrected the whitespace issue I noticed while I
was there.

-J.

[[oe] [meta-networking][PATCH] proftpd: add systemd support] On 15.02.09 (M=
on 10:39) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../recipes-daemons/proftpd/files/proftpd.service         |  7 +++++++
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb  | 15 +++++++++=
++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd=
=2Eservice
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd.servic=
e b/meta-networking/recipes-daemons/proftpd/files/proftpd.service
> new file mode 100644
> index 0000000..ba97f8e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/proftpd.service
> @@ -0,0 +1,7 @@
> +[Unit]
> +Description=3Dproftpd Daemon
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D-@SBINDIR@/proftpd -c @SYSCONFDIR@/proftpd.conf
> +StandardError=3Dsyslog
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/m=
eta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> index cba39e8..ca629be 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> @@ -11,12 +11,13 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${B=
PN}-${PV}.tar.gz \
>             file://close-RequireValidShell-check.patch \
>             file://contrib.patch  \
>             file://build_fixup.patch \
> -           "
> +           file://proftpd.service \
> +		   "
> =20
>  SRC_URI[md5sum] =3D "aff1bff40e675244d72c4667f203e5bb"
>  SRC_URI[sha256sum] =3D "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2e=
a2cc4e08ccb87715"
> =20
> -inherit autotools-brokensep useradd update-rc.d
> +inherit autotools-brokensep useradd update-rc.d systemd
> =20
>  PACKAGECONFIG ??=3D "sia shadow"
>  PACKAGECONFIG +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ip=
v6', '', d)}"
> @@ -87,11 +88,21 @@ do_install () {
>      # create the pub directory
>      mkdir -p ${D}/home/${FTPUSER}/pub/
>      chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
> +
> +    install -d ${D}/${systemd_unitdir}/system
> +    install -m 644 ${WORKDIR}/proftpd.service ${D}/${systemd_unitdir}/sy=
stem
> +    sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
> +        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +        -e 's,@SBINDIR@,${sbindir},g' \
> +        -i ${D}${systemd_unitdir}/system/*.service
>  }
> =20
>  INITSCRIPT_NAME =3D "proftpd"
>  INITSCRIPT_PARAM =3D "defaults 85 15"
> =20
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "proftpd.service"
> +
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "--system ${FTPGROUP}"
>  USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} --home-dir /var/lib/${F=
TPUSER} --no-create-home \
> --=20
> 2.1.0
>=20
--=20
-Joe MacDonald.
:wq

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU3ByxAAoJEEn8ffcsOfaWTCIH/0k975G3jvALElmaDJ0G+3Oy
9FgeXbfWFQQMspyxgRmoXkdBLUCeapxCxo7uDDr7SxXePcVRZsx57wET3xvsZHOz
gdU/G4Gu1cpbONENyQnsHJ1PyVkSimIt3MJJ+LM/M2Uw81sxnyVTjwAULzf4nb/g
OFTiEZZL2tWmOnuwrm/B0XVtCZrLJviiH30ukTAfXXCMqkg8vpsSx4Zv9iFtRzyC
qvfcEZewS4q5Tkc3KC6Jympl3B4ytbj6I68u8HG4OAXc8Cu1+zTkoXRJ+DzNileQ
ygmY/80APNQm+764koptn9HggmgTM8EfzZdkKhWI/v3BnJbhhFrFCnP+vAh3UIQ=
=sqAR
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--
