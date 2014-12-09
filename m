Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 206A86017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:17:08 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so362827wgh.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s4sKwMrZ0mnDHsLmACyeehiu9t/BOtvvlChYXPa0Pko=;
	b=Yosk5P7KVEQljgckXf5LCYDgWuIFTmNxLaOXBCzghxWJp6hXxVG8lt9JX0CqH0GPft
	bmvp2Y4GvJzVG3zRTz26pacFkX3B/Qmc2hxs4uMFPazLO4eZpb0/kwm2ibsT5n7Xfyp4
	YP+pcobymR6LQnn5ObYVAdtonBs3MSbCLpWfzZSfCnRqPfqzI0k5P954px0NZ5pOyPa8
	sitDICq9UStYyFcsjYtNfRcIr5yGFaZN3s5DdIuRrCdWvteodCV7pYayV8zgSSvs71Ch
	JPTi7mqrAA8llipeR1DJJOR0a/TcAI9F2tZvOwBVXy7A8MOhRImuQ90c6bkYh3Zl6ZSM
	nOvA==
X-Received: by 10.180.76.231 with SMTP id n7mr2979666wiw.80.1418120228646;
	Tue, 09 Dec 2014 02:17:08 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi5sm1102356wjd.26.2014.12.09.02.17.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:17:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:17:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209101708.GB2470@jama>
References: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
	<1417164585-46087-4-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417164585-46087-4-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 3/3] [meta-oe] drbd: add recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 10:17:10 -0000
X-Groupsio-MsgNum: 53229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 04:49:45PM +0800, Bian Naimeng wrote:
> DRBD is a block device which is designed to build high availability clust=
ers.
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/drbd/drbd_8.4.4.bb      | 57 ++++++++++++++++++=
++++++
>  meta-oe/recipes-extended/drbd/files/drbd.service | 12 +++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
>  create mode 100644 meta-oe/recipes-extended/drbd/files/drbd.service

Causes 2 new QA warnings:

drbd-8.4.4: drbd requires /bin/bash, /usr/bin/perl, but no providers in
its RDEPENDS [file-rdeps]
drbd-8.4.4: drbd requires /usr/bin/perl, /bin/bash, but no providers in
its RDEPENDS [file-rdeps]

>=20
> diff --git a/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb b/meta-oe/recipe=
s-extended/drbd/drbd_8.4.4.bb
> new file mode 100644
> index 0000000..5439bac
> --- /dev/null
> +++ b/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
> @@ -0,0 +1,57 @@
> +SUMMARY =3D "BD driver for Linux"
> +DESCRIPTION =3D "DRBD mirrors a block device over the network to another=
 machine.\
> +DRBD mirrors a block device over the network to another machine.\
> +Think of it as networked raid 1. It is a building block for\
> +setting up high availability (HA) clusters."
> +
> +HOMEPAGE =3D "http://www.drbd.org/"
> +
> +SECTION =3D "kernel/userland"
> +
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb=
018"
> +
> +PR =3D "r0"
> +#PR =3D "r1001"
> +
> +SRC_URI =3D "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
> +           file://drbd.service \
> +          "
> +
> +#SRC_URI[md5sum] =3D "ef4e6db51cda1898c597a3d61fcb9e1e"
> +#SRC_URI[sha256sum] =3D "7c1558459614fbdc1b3209f1b9e5767a443d9bdfe681a49=
c652b5f392799d58d"
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
> +        install -m 755 ${D}/etc/init.d/drbd ${D}/${libexecdir}/drbd-help=
er
> +    fi
> +}
> +
> +FILES_${PN} +=3D "run"
> +FILES_${PN} +=3D "${base_libdir}/drbd"
> +FILES_${PN}-dbg +=3D "${base_libdir}/drbd/.debug"
> diff --git a/meta-oe/recipes-extended/drbd/files/drbd.service b/meta-oe/r=
ecipes-extended/drbd/files/drbd.service
> new file mode 100644
> index 0000000..22f853f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/drbd/files/drbd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DDRBD Service
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Doneshot
> +RemainAfterExit=3Dyes
> +ExecStart=3D/usr/lib/drbd/drbd-helper start
> +ExecStop=3D/usr/lib/drbd/drbd-helper stop
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
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

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGzCQACgkQN1Ujt2V2gBzxQwCfRGdvEBO/L6j12rXvQt30ORxf
MkcAnix6emLoHaiRUCuFbQw6GOnI9/Eo
=iWmh
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
