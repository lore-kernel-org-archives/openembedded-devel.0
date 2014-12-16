Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 59FD072614
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 21:51:20 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Y101Y-0001en-8D from Joe_MacDonald@mentor.com ;
	Tue, 16 Dec 2014 13:51:20 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 16 Dec 2014 13:51:11 -0800
Received: by burninator (Postfix, from userid 1000)	id 102FC581DE4; Tue, 16
	Dec 2014 16:51:19 -0500 (EST)
Date: Tue, 16 Dec 2014 16:51:19 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20141216215118.GP6113@mentor.com>
References: <1418288042-39086-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418288042-39086-1-git-send-email-biannm@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] drbd: Add recipes
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
X-List-Received-Date: Tue, 16 Dec 2014 21:51:25 -0000
X-Groupsio-MsgNum: 53347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BnCwdHgQ2ZomtW9r"
Content-Disposition: inline

--BnCwdHgQ2ZomtW9r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH v2] drbd: Add recipes] On 14.12.11 (Thu 16:54=
) Bian Naimeng wrote:

> DRBD is a block device which is designed to build high availability clust=
ers.
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../recipes-support/drbd/drbd/drbd.service         | 12 +++++
>  meta-networking/recipes-support/drbd/drbd_8.4.4.bb | 55 ++++++++++++++++=
++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-networking/recipes-support/drbd/drbd/drbd.service
>  create mode 100644 meta-networking/recipes-support/drbd/drbd_8.4.4.bb
>=20
> diff --git a/meta-networking/recipes-support/drbd/drbd/drbd.service b/met=
a-networking/recipes-support/drbd/drbd/drbd.service
> new file mode 100644
> index 0000000..3543999
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd/drbd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DDRBD Service
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Doneshot
> +RemainAfterExit=3Dyes
> +ExecStart=3D@LIBEXECDIR@/drbd-helper start
> +ExecStop=3D@LIBEXECDIR@/drbd-helper stop
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-ne=
tworking/recipes-support/drbd/drbd_8.4.4.bb
> new file mode 100644
> index 0000000..e2df3f9
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> @@ -0,0 +1,55 @@
> +SUMMARY =3D "BD driver for Linux"
> +DESCRIPTION =3D "DRBD mirrors a block device over the network to another=
 machine.\
> +DRBD mirrors a block device over the network to another machine.\
> +Think of it as networked raid 1. It is a building block for\
> +setting up high availability (HA) clusters."
> +
> +HOMEPAGE =3D "http://www.drbd.org/"
> +SECTION =3D "kernel/userland"
> +
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb=
018"
> +
> +SRC_URI =3D "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
> +           file://drbd.service \
> +          "
> +
> +SRC_URI[md5sum] =3D "b51815343c1a9151e2936b3b97520388"
> +SRC_URI[sha256sum] =3D "a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178=
f2ef4c15604288f0"
> +
> +inherit autotools-brokensep systemd
> +
> +EXTRA_OECONF =3D "--with-utils                  \
> +                --without-km                  \
> +                --with-initdir=3D/etc/init.d    \
> +                --without-pacemaker           \
> +                --without-rgmanager           \
> +                --without-bashcompletion      \
> +                --with-distro debian          \
> +               "
> +
> +do_configure (){
> +    oe_runconf
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "drbd.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +do_install_append() {
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}/${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/drbd.service ${D}/${systemd_unitdir}/s=
ystem
> +        install -d ${D}/${libexecdir}
> +        install -m 755 ${D}/${sysconfdir}/init.d/drbd ${D}/${libexecdir}=
/drbd-helper
> +
> +        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
> +            ${D}${systemd_unitdir}/system/drbd.service
> +    fi
> +}
> +
> +RDEPENDS_${PN} +=3D "bash perl"
> +
> +FILES_${PN} +=3D "/run"
> +FILES_${PN} +=3D "${base_libdir}/drbd"
> +FILES_${PN}-dbg +=3D "${base_libdir}/drbd/.debug"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--BnCwdHgQ2ZomtW9r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUkKlWAAoJEEn8ffcsOfaW0q4IAKSShPsAWSxnN9WQhX5Ww+F6
obI7Amf6yDC/wUXe93fJcs4tR64ZiE66NS7THLHvaWR+vQoQpEoG46PHVyL544o4
ge32oC5GohZVKwlJaQDF+F+ApsQoPTjSj5GxZWtZEubzbbxmK3abgs11PuLOMHmj
jchVJ2W4RLwvCGiDJqzjvtCzI1m5iAuVx8Hw4SDAeMoTqyc28EtDKcEKfg0ODBi8
tEVdL43a6PQAdoL6xlWQVG67WHiW752y/e3AlLJNP60vIKiLUKmSQXaTcCCplGAQ
CS9mboqHUL1qcSsARUPLgYmPW9gE/duqTJqrwElIsqDNIboVhRiHfjh84/AiI08=
=f2EU
-----END PGP SIGNATURE-----

--BnCwdHgQ2ZomtW9r--
