Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 172A37760C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:03:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so7786249wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wjh2znoTQIUoXny7bGQCrQ3bz0++M7oFGYVc0+dio8Q=;
	b=TDvzTPz/tL0+OpSWarBYXzpIOGFQwIgPgJ6iOtXPbq2XWLouQoamycqlzrSHhcT/4v
	daFRUFc/hnP0yXvVLOEiLFQkeEsvU9HzExE7kEaI78yB/g1LNRFnSfGHJxSqjiMEEeLJ
	+ghMVY3AN1PJ6A51Sg/vOu2PB51zBAWSHOywd7zNbzsCUN9d4g2/M9tvK6EO3dGsX6Iv
	34R81Y3AjH/rNFlkjGa/iW2qNmM5FYdBrTnlBu/oKHxhhq7HRmoP9XWHEnBAgm7FIfCd
	Kl55uZdIMeSAz8aeTzszZ1m3CJ2YJ140/o8RKzfbd02h3fs4DQdAvHJ0ysP3kUUrIiBm
	X3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wjh2znoTQIUoXny7bGQCrQ3bz0++M7oFGYVc0+dio8Q=;
	b=CR6O5dr0ny9FORalOtg5Cpiqdabcy0lSeAaLm1/qKjd3fWP3S1GrZO0AN+q5I4Vo7a
	hva9xQQ1JHgLP82VuksChiRh6l3xpxtaIxDLul7byHXEm0a1GGRuErN25J0HURsgak4U
	TGOalFU6msHe5HbRJCNf+QC9+tt6t1mdNE0Fx0AOgkQQZb7fAs/y2AJ5xeYT7cMYfHk4
	zJW1t9wC1jpmLTVf5uhACDRbi3J65EeE9WI9OMqmatLg7Cyr6ZtqnYFJgb2+VvZW7adk
	zQ/dUYmbFgovNikRWt1qxYhfpMVmVUAAshx72cJTAknqEyAIcoQFHqntsobKy5mR1qqb
	VLFw==
X-Gm-Message-State: AE9vXwOe2JNL+dwc+Fe6i8PyavkHAgC+NXdC8/2Cp0WkldjeE9VdL80TXnYcP/dDDtEtxQ==
X-Received: by 10.194.235.69 with SMTP id uk5mr36126336wjc.53.1473174191516;
	Tue, 06 Sep 2016 08:03:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	yj3sm18220400wjb.43.2016.09.06.08.03.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Sep 2016 08:03:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Sep 2016 17:03:09 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160906150309.GA2645@jama>
References: <cover.1473153229.git.hongxu.jia@windriver.com>
	<6f2b25d00c6cdfbafa49e5d5b3e2802279556200.1473153229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6f2b25d00c6cdfbafa49e5d5b3e2802279556200.1473153229.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] add PACKAGECONFIG for lvm thin provisioning
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
X-List-Received-Date: Tue, 06 Sep 2016 15:03:12 -0000
X-Groupsio-MsgNum: 62979
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 05:15:15AM -0400, Hongxu Jia wrote:
> The thin provisioning tools is runtime dependency,
> so disable build time detection.
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Next time start the summary with component name.

> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index e2feeb3..d66daf8 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -18,10 +18,13 @@ S =3D "${WORKDIR}/LVM2.${PV}"
> =20
>  inherit autotools-brokensep pkgconfig systemd
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', =
'selinux', '', d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', =
'selinux', '', d)} \
> +                   thin-provisioning-tools \
> +"
> =20
>  PACKAGECONFIG[readline] =3D "--enable-readline,--disable-readline,readli=
ne"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
> +PACKAGECONFIG[thin-provisioning-tools] =3D "--with-thin=3Dinternal,--wit=
h-thin=3Dnone,,thin-provisioning-tools"
> =20
>  # Unset user/group to unbreak install.
>  EXTRA_OECONF =3D "--with-user=3D \
> @@ -38,6 +41,11 @@ EXTRA_OECONF =3D "--with-user=3D \
>                  --with-udev-prefix=3D \
>                  --with-usrlibdir=3D${libdir} \
>                  --with-systemdsystemunitdir=3D${systemd_system_unitdir} \
> +                --disable-thin_check_needs_check \
> +                --with-thin-check=3D${sbindir}/thin_check \
> +                --with-thin-dump=3D${sbindir}/thin_dump \
> +                --with-thin-repair=3D${sbindir}/thin_repair \
> +                --with-thin-restore=3D${sbindir}/thin_restore \
>  "
> =20
>  CACHED_CONFIGUREVARS +=3D "MODPROBE_CMD=3D${base_sbindir}/modprobe"
> @@ -66,6 +74,6 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>  FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_libdir}/udev"
>  FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
> =20
> -RDEPENDS_${PN} =3D "bash thin-provisioning-tools"
> +RDEPENDS_${PN} =3D "bash"
> =20
>  CONFFILES_${PN} +=3D "${sysconfdir}/lvm/lvm.conf"
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfO2l8ACgkQN1Ujt2V2gBzbtgCfUyLacruVqCc6Zm3ZXkm6HNux
CA8AoLnAWiVgJ8z3TGu8QFF8BmA2brfQ
=yDCQ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
