Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 97A7F6FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:13:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f206so220701356wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 08:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f54KvXdNA0eCerIi8lCdZrJNO0fbqW9npQBPVUMtZsQ=;
	b=vlsPJB/CdXe+SeJup57O/9zM51ZMQdTxgXXFMnCwOBqG8BWau6libhla2HCZdznRKR
	OOd5FBTt8sfw8T0U8uDG74NHUxgib2aeKVrIdkHaugDk4IRsXLGPSmazkoLfKuxTSVBr
	4sqsEyEhJhlvu/0R8XuuOTDJU38TA5lcIPiXNtAwYisgY69IZEE+zD27j2CFG+ju4HgS
	NFnkZOC/UcSmg+NFnX41DCAVbf4oKJYeJM+TJuZIG9WXNz+UjV7EJYgSAnC66ycvprik
	xVDa1vdajrxoXWBPYyOFEIpd6UtKHAjyByEbR0iz44R9fLXHiuJ90TriHMj4ALdwRJs6
	p1Rw==
X-Received: by 10.194.47.231 with SMTP id g7mr98131407wjn.42.1451923987787;
	Mon, 04 Jan 2016 08:13:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i3sm42665346wja.47.2016.01.04.08.13.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 08:13:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 17:17:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104161718.GA2378@jama>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
In-Reply-To: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][master][jethro][PATCH] qtconnectivity, qtsystems: fix bluetooth support
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
X-List-Received-Date: Mon, 04 Jan 2016 16:13:11 -0000
X-Groupsio-MsgNum: 59315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 04:59:54PM +0100, Javier Viguera wrote:
> QMAKE_CACHE_EVAL is only used in qtwebengine and qtwebkit, but not in
> the rest of the QT5 packages, so use EXTRA_QMAKEVARS_PRE to pass the
> packageconfig options to the do_configure task.
>=20
> Also generalize bluetooth support so it can be used not only with bluez4
> but with bluez5 as well.

Is it deterministic?

Will it always pick bluez4 when BLUEZ is set to bluez4, but there is
bluez5 is already in the sysroot as well?

config.tests/bluez/bluez.pro is only using pkgconfig to find bluez, so
I'm not sure which one will win.

> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>  recipes-qt/qt5/qtconnectivity_git.bb | 9 ++++++---
>  recipes-qt/qt5/qtsystems_git.bb      | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconn=
ectivity_git.bb
> index b1e155e2b48d..f677f7107465 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -13,11 +13,14 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> =20
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[bluez4] =3D "OE_BLUEZ_ENABLED,,bluez4"
> +inherit bluetooth
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez', '', d)}"
> +PACKAGECONFIG[bluez] =3D "CONFIG+=3DOE_BLUEZ_ENABLED,,${BLUEZ}"
> +
> +EXTRA_QMAKEVARS_PRE +=3D "${EXTRA_OECONF}"
> =20
>  do_configure_prepend() {
> -    export QMAKE_CACHE_EVAL=3D"CONFIG+=3D${EXTRA_OECONF}"
>      # disable bluez test if it isn't enabled by PACKAGECONFIG
>      sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez=
)/g' ${S}/qtconnectivity.pro
>  }
> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_g=
it.bb
> index 27d2bff37b51..9d9d245d2d09 100644
> --- a/recipes-qt/qt5/qtsystems_git.bb
> +++ b/recipes-qt/qt5/qtsystems_git.bb
> @@ -11,11 +11,14 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative udev gconf"
> =20
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[bluez4] =3D "OE_BLUEZ_ENABLED,,bluez4"
> +inherit bluetooth
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez', '', d)}"
> +PACKAGECONFIG[bluez] =3D "CONFIG+=3DOE_BLUEZ_ENABLED,,${BLUEZ}"
> +
> +EXTRA_QMAKEVARS_PRE +=3D "${EXTRA_OECONF}"
> =20
>  do_configure_prepend() {
> -    export QMAKE_CACHE_EVAL=3D"CONFIG+=3D${EXTRA_OECONF}"
>      # disable bluez test if it isn't enabled by PACKAGECONFIG
>      sed -i 's/^    qtCompileTest(bluez)/    OE_BLUEZ_ENABLED:qtCompileTe=
st(bluez)/g' ${S}/qtsystems.pro
>  }
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKmw4ACgkQN1Ujt2V2gBySYwCeLzsEZmK0pd8QlIpzWv68qTY6
W7QAn0Fb+Iw4AnxqtLnbXuVLZajMdE4i
=xDcz
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
