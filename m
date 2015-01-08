Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id EFC8C72BAE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 11:36:01 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so2628348wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2015 03:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mCJAIwuMHXNdtxewUM3TFVv/FA8geqp0DC6aKbGWdPE=;
	b=qgjdlI6nTstetmgT+dfDQRBpxNxJiTpi0P6O1tt/7fseJJnO9LQy4RJ1mopQGSSoMw
	yPKMZMQgW65NON2ByujauPkjzz1GSRV+sWdXhrEtpYg6L7Tho2vAFcVta1FGiW0G2XA6
	oc9rr/WBOUY6O73jUIuRvBz7ZdDeI4UgNlZyBwWBFgJb2McKebLh1YI6MINNk4YAHGcb
	5fvHkOOF31GzhcYTWGeK4tz0t7LrEQS2QahtGipXBPWnE+ZvoGnAefV5enuHZ54h+cxI
	wPbSaTZaKJ40+NP7y2ZYEzfPozVsrTZqfnr1+S0yJ18ZCCazKNuH0VCy5QQ1ZnZpJyB0
	RdSw==
X-Received: by 10.180.75.176 with SMTP id d16mr18538034wiw.77.1420716962247;
	Thu, 08 Jan 2015 03:36:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hl1sm5791682wjc.18.2015.01.08.03.36.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 03:36:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 12:36:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150108113605.GF3972@jama>
References: <BLU437-SMTP294FCF66D64C1A0B462E0AC2460@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU437-SMTP294FCF66D64C1A0B462E0AC2460@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: Re: [meta-qt5][PATCH] qttranslations: adding recipes for qt specific translations
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
X-List-Received-Date: Thu, 08 Jan 2015 11:36:05 -0000
X-Groupsio-MsgNum: 53765
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline

--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 03:05:15PM -0500, kkelly87 wrote:
> The meta-qt5 layer is missing a recipe for the qttranslation submodule so=
 qt specific items like
> the OK or Cancel button had no associated translations. This submission i=
s for master while my previous patch
>  will work as a backport to dizzy.
>=20
> Signed-off-by: Kevin Kelly <kaneda18@hotmail.com>
> ---
>  recipes-qt/qt5/qttranslations.inc      | 85 ++++++++++++++++++++++++++++=
++++++
>  recipes-qt/qt5/qttranslations_5.4.0.bb |  5 ++
>  recipes-qt/qt5/qttranslations_git.bb   |  4 ++
>  3 files changed, 94 insertions(+)
>  create mode 100644 recipes-qt/qt5/qttranslations.inc
>  create mode 100644 recipes-qt/qt5/qttranslations_5.4.0.bb
>  create mode 100644 recipes-qt/qt5/qttranslations_git.bb
>=20
> diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttransla=
tions.inc
> new file mode 100644
> index 0000000..1aca7e2
> --- /dev/null
> +++ b/recipes-qt/qt5/qttranslations.inc
> @@ -0,0 +1,85 @@
> +require qt5.inc
> +
> +DEPENDS +=3D "qtbase"
> +
> +# older copyright year than what e.g. qtbase is using now

This comment isn't correct for 5.4, will fix when cherry-picking to
master-next.

> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2=
c17a64252e7 \
> +                    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc=
8120425f \
> +                    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c=
139dfb268fb6"=20
> +
> +PACKAGES =3D. "${PN}-assistant \
> +             ${PN}-designer \
> +             ${PN}-linguist \
> +             ${PN}-qmlviewer \
> +             ${PN}-qtconnectivity \
> +             ${PN}-qtmultimedia \
> +             ${PN}-qtlocation \
> +             ${PN}-qtdeclarative \
> +             ${PN}-qtxmlpatterns \
> +             ${PN}-qtconfig \
> +             ${PN}-qtquick1 \
> +             ${PN}-qtscript \
> +             ${PN}-qtbase \
> +             ${PN}-qthelp \
> +             ${PN}-qt \
> +             "
> +
> +FILES_${PN}-assistant =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/assistant_*.qm \
> +            "

I've also fixed indentation (to use 4 spaces and " as first character)

> +
> +FILES_${PN}-designer =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/designer_*.qm \
> +            "
> +
> +FILES_${PN}-linguist =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/linguist_*.qm \
> +            "
> +
> +FILES_${PN}-qmlviewer =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qmlviewer_*.qm \
> +            "
> +
> +FILES_${PN}-qtconnectivity =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtconnectivity_*.qm \
> +            "
> +
> +FILES_${PN}-qtmultimedia =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtmultimedia_*.qm \
> +            "
> +
> +FILES_${PN}-qtlocation =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtlocation_*.qm \
> +            "
> +
> +FILES_${PN}-qtdeclarative =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtdeclarative_*.qm \
> +            "
> +
> +FILES_${PN}-qtxmlpatterns =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
> +            "
> +
> +FILES_${PN}-qtconfig =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtconfig_*.qm \
> +            "
> +
> +FILES_${PN}-qtquick1 =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
> +            "
> +
> +FILES_${PN}-qtscript =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtscript_*.qm \
> +            "
> +
> +FILES_${PN}-qtbase =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qtbase_*.qm \
> +            "
> +
> +FILES_${PN}-qthelp =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_help_*.qm \
> +            "
> +
> +FILES_${PN}-qt =3D " \
> +                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
> +            "
> diff --git a/recipes-qt/qt5/qttranslations_5.4.0.bb b/recipes-qt/qt5/qttr=
anslations_5.4.0.bb
> new file mode 100644
> index 0000000..2e3a284
> --- /dev/null
> +++ b/recipes-qt/qt5/qttranslations_5.4.0.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "6462eeefae00f048418ed6e4571c4cc9"
> +SRC_URI[sha256sum] =3D "aca78d9178481a21a7af8571beb9109b38f0f71ba75cf3b8=
9ddf705962a3f98b"
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttran=
slations_git.bb
> new file mode 100644
> index 0000000..211b211
> --- /dev/null
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -0,0 +1,4 @@
> +require qt5-git.inc
> +require ${PN}.inc
> +
> +SRCREV =3D "3aad4ab4718d4bf952275a07e406e93eb6a22eed"

This revision isn't in 5.4 branch but from 5.4.0, will change it to
b9481cffeb41ceb9363b7be850bd9cd172b313be to fix do_fetch.

Similar changes will be needed in dizzy version.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSua6UACgkQN1Ujt2V2gByklQCfXyqZqtVZGNevzuwKlaMkyXvO
/MAAn0pSDDjsPCKP6AaiODWq12dlSBOB
=xNGL
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
