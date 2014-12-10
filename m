Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id CD7FC60809
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:39:24 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so3331176wgg.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8kMknsG6TckSZ8fllZ+2XSOit21yjIwMAfWBstWOmCs=;
	b=YOrCL0Kq+irzyDwbVygtWJTazSLDkWeOI877LQFzu+KECq5eZ1fny83KPAzu2IpBiM
	2VS94K/g1pzOxeJLJdjzBKvSsMCSO+gn70s3+9pWfkoWeULzLm6s059Om3IdpLA8X4Wn
	Z5uLpmXDhYpuY71bWd6aVwAsJNcdNGiKhYZilVy5mUgb0jF9t9QH+HhtAHvaK1DxLzhH
	jn1rf65be2oc/tfJzqqZBhEt+6kQRB4r9pO+2Jtg0C+dFgri11gHIiABo9ROgIomM1an
	qUnZAUNz45fm3z2HWuGWaLvO5438tjeU6X8q72nXgaTWliIloryjox1coZhCFiWZroXh
	UKDw==
X-Received: by 10.180.81.70 with SMTP id y6mr12800047wix.6.1418211563868;
	Wed, 10 Dec 2014 03:39:23 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nj9sm5987462wic.10.2014.12.10.03.39.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 03:39:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Dec 2014 12:39:26 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141210113926.GA2473@jama>
References: <1418202088-36649-1-git-send-email-biannm@cn.fujitsu.com>
	<1418202088-36649-2-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418202088-36649-2-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/1] drbd: add recipe
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
X-List-Received-Date: Wed, 10 Dec 2014 11:39:32 -0000
X-Groupsio-MsgNum: 53260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 05:01:28PM +0800, Bian Naimeng wrote:
> DRBD is a block device which is designed to build high availability clust=
ers.

drbd wasn't merged to meta-oe yet, so this should be adding it to
meta-networking, not moving it.

>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../recipes-support/drbd/drbd/drbd.service         | 12 +++++
>  meta-networking/recipes-support/drbd/drbd_8.4.4.bb | 58 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/drbd/drbd_8.4.4.bb        | 57 ----------------=
-----
>  meta-oe/recipes-extended/drbd/files/drbd.service   | 12 -----
>  4 files changed, 70 insertions(+), 69 deletions(-)
>  create mode 100644 meta-networking/recipes-support/drbd/drbd/drbd.service
>  create mode 100644 meta-networking/recipes-support/drbd/drbd_8.4.4.bb
>  delete mode 100644 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
>  delete mode 100644 meta-oe/recipes-extended/drbd/files/drbd.service
>=20
> diff --git a/meta-networking/recipes-support/drbd/drbd/drbd.service b/met=
a-networking/recipes-support/drbd/drbd/drbd.service
> new file mode 100644
> index 0000000..6b6ab30
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
> +ExecStart=3D@LIBEXECDIR@/drbd-helper startxxx
> +ExecStop=3D@LIBEXECDIR@/drbd-helper stop
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-ne=
tworking/recipes-support/drbd/drbd_8.4.4.bb
> new file mode 100644
> index 0000000..abf4554
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> @@ -0,0 +1,58 @@
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
> +RDEPENDS_${PN} +=3D "bash perl"
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
> +#SRC_URI[md5sum] =3D "ef4e6db51cda1898c597a3d61fcb9e1e"
> +#SRC_URI[sha256sum] =3D "7c1558459614fbdc1b3209f1b9e5767a443d9bdfe681a49=
c652b5f392799d58d"

Why do you keep this comment?

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
> +FILES_${PN} +=3D "run"
> +FILES_${PN} +=3D "${base_libdir}/drbd"
> +FILES_${PN}-dbg +=3D "${base_libdir}/drbd/.debug"
> diff --git a/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb b/meta-oe/recipe=
s-extended/drbd/drbd_8.4.4.bb
> deleted file mode 100644
> index 5439bac..0000000
> --- a/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -SUMMARY =3D "BD driver for Linux"
> -DESCRIPTION =3D "DRBD mirrors a block device over the network to another=
 machine.\
> -DRBD mirrors a block device over the network to another machine.\
> -Think of it as networked raid 1. It is a building block for\
> -setting up high availability (HA) clusters."
> -
> -HOMEPAGE =3D "http://www.drbd.org/"
> -
> -SECTION =3D "kernel/userland"
> -
> -LICENSE =3D "GPLv2+"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb=
018"
> -
> -PR =3D "r0"
> -#PR =3D "r1001"
> -
> -SRC_URI =3D "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
> -           file://drbd.service \
> -          "
> -
> -#SRC_URI[md5sum] =3D "ef4e6db51cda1898c597a3d61fcb9e1e"
> -#SRC_URI[sha256sum] =3D "7c1558459614fbdc1b3209f1b9e5767a443d9bdfe681a49=
c652b5f392799d58d"
> -
> -SRC_URI[md5sum] =3D "b51815343c1a9151e2936b3b97520388"
> -SRC_URI[sha256sum] =3D "a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178=
f2ef4c15604288f0"
> -
> -inherit autotools-brokensep systemd
> -
> -EXTRA_OECONF =3D "--with-utils                  \
> -                --without-km                  \
> -                --with-initdir=3D/etc/init.d    \
> -                --without-pacemaker           \
> -                --without-rgmanager           \
> -                --without-bashcompletion      \
> -                --with-distro debian          \
> -               "
> -
> -do_configure (){
> -    oe_runconf
> -}
> -
> -SYSTEMD_SERVICE_${PN} =3D "drbd.service"
> -SYSTEMD_AUTO_ENABLE =3D "disable"
> -
> -do_install_append() {
> -    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> -        install -d ${D}/${systemd_unitdir}/system
> -        install -m 644 ${WORKDIR}/drbd.service ${D}/${systemd_unitdir}/s=
ystem
> -        install -d ${D}/${libexecdir}
> -        install -m 755 ${D}/etc/init.d/drbd ${D}/${libexecdir}/drbd-help=
er
> -    fi
> -}
> -
> -FILES_${PN} +=3D "run"
> -FILES_${PN} +=3D "${base_libdir}/drbd"
> -FILES_${PN}-dbg +=3D "${base_libdir}/drbd/.debug"
> diff --git a/meta-oe/recipes-extended/drbd/files/drbd.service b/meta-oe/r=
ecipes-extended/drbd/files/drbd.service
> deleted file mode 100644
> index 22f853f..0000000
> --- a/meta-oe/recipes-extended/drbd/files/drbd.service
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -[Unit]
> -Description=3DDRBD Service
> -After=3Dnetwork.target
> -
> -[Service]
> -Type=3Doneshot
> -RemainAfterExit=3Dyes
> -ExecStart=3D/usr/lib/drbd/drbd-helper start
> -ExecStop=3D/usr/lib/drbd/drbd-helper stop
> -
> -[Install]
> -WantedBy=3Dmulti-user.target
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

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSIMO4ACgkQN1Ujt2V2gBwwSACfRPaHPlz1VNWnYyNJpdsgla6I
x1AAoLCSe6ep6yW31AIfS9kKARcwYUmr
=PGBH
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
