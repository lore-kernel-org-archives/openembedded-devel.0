Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEBE6DD0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:14:25 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so3011995ead.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2013 18:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S/cYYYpYa5+JXP5yHCzO1gpkNxw/CsXegp3YoT3lCqo=;
	b=qhb2ccn1gT2iRifAmFBwQw+1cQPCSg14/e821Oq6+NG0d1frdv+A+o6ougg5xaHchv
	jmBiYvg2rD5GW+DWH2lc1ZNjist3WtP/LntFvqqdn/Q8b4BbTrwD1zON+8q4eUg+CFTu
	RABXu/r/OEfljZ+5xV7CXp5zO/tyDseyScnzBKyczFADwAQLWGuHTZnwKtjpQgxRu6qO
	rSUkUaRlNQHbw8yUny2/kidGlk1WmmTB/n8sN86ppOyl68jah0MOdbRDV7Jp6y5000f1
	+yZqFynRY5e9E8Cz8m6HGqxs+wf0wpOHSMAm0jVK57Jpgp1uPi+TPOsOUEAf7AGO+yeY
	kNCg==
X-Received: by 10.15.68.133 with SMTP id w5mr153187eex.111.1385432064460;
	Mon, 25 Nov 2013 18:14:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm4317754eea.10.2013.11.25.18.14.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Nov 2013 18:14:23 -0800 (PST)
Date: Tue, 26 Nov 2013 03:14:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131126021426.GL2870@jama>
References: <1385430478-31824-1-git-send-email-denis@denix.org>
	<1385430478-31824-3-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1385430478-31824-3-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qttools: add nativesdk version of qttools necessary for SDK tools
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
X-List-Received-Date: Tue, 26 Nov 2013 02:14:26 -0000
X-Groupsio-MsgNum: 47257
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Content-Disposition: inline

--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 08:47:58PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/nativesdk-qttools.inc      | 32 +++++++++++++++++++++++++=
++++++
>  recipes-qt/qt5/nativesdk-qttools_5.1.1.bb | 12 ++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 recipes-qt/qt5/nativesdk-qttools.inc
>  create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb

There is alternative pull-request on github, but this one looks a lot
simpler and cleaner.

>=20
> diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/native=
sdk-qttools.inc
> new file mode 100644
> index 0000000..30bb357
> --- /dev/null
> +++ b/recipes-qt/qt5/nativesdk-qttools.inc
> @@ -0,0 +1,32 @@
> +# doesnt have GFDL-1.3 like qtbase, LICENSE files are missing in 5.0.0 a=
nd 5.0.1, this is for 5.0.2 and git
> +LICENSE =3D "LGPL-2.1 | GPL-3.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1e=
e66161de \
> +                    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> +                    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c=
139dfb268fb6 \
> +"
> +
> +DEPENDS =3D "nativesdk-qtbase qtbase-native"
> +
> +QT_MODULE =3D "qttools"
> +
> +require nativesdk-qt5.inc
> +
> +SRC_URI +=3D "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.=
patch"
> +
> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> +
> +FILES_${PN}-dbg =3D " \
> +    ${OE_QMAKE_PATH_BINS}/.debug \
> +"
> +
> +FILES_${PN} =3D " \
> +    ${OE_QMAKE_PATH_BINS}/* \
> +"
> +
> +do_configure() {
> +    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=3Dlinguis=
tonly
> +}
> +
> +do_install() {
> +    oe_runmake install INSTALL_ROOT=3D${D}
> +}
> diff --git a/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb b/recipes-qt/qt5/n=
ativesdk-qttools_5.1.1.bb
> new file mode 100644
> index 0000000..8aca56e
> --- /dev/null
> +++ b/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
> @@ -0,0 +1,12 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +# LICENSE files are missing in 5.0.0 and 5.0.1
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=3D1a6d26=
8fd218675ffea8be556788b780 \
> +                    file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=3Dc79ff39f1=
9dfec6d293b95dea7b07891 \
> +"

Looks like I've forgot to remove LIC_FILES_CHKSUM from .bb when
upgrading to 5.1.1, can you check if the checksums in .inc are matching
and if yes, remove it here and in recipes-qt/qt5/qttools-native_5.1.1.bb
?

Thanks
> +
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qttools-${PV}:"
> +
> +SRC_URI[md5sum] =3D "022073d32ff9d408de0182b5d1f01781"
> +SRC_URI[sha256sum] =3D "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3=
cc449ee0e95462b6"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKUBAIACgkQN1Ujt2V2gBz3bACdGlBo+ay0nQ8aLXYOFo2bUtNI
av4An2TIX8VmYPRrwgll0aezoSLulISz
=nft0
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
