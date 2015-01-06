Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF88728F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 18:22:24 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so24033wiw.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V0m0EBk/yGbtDyi+ETOsB5Hzbm1jDxMwCjEMehq+6i0=;
	b=QC2/VtPv2rVryi5M0FdzXFnfDiEr3UfhyTf8JjKJloOs7y1EHt0SR8zpObqGvJwsW9
	svGT3JiXX+p9yN5tA35gwNMRQAriUrFNugcygBu6gQZl4NtGmGDOXpRPmBUxTKvDithy
	k9VZfLSdWq3rFPW2U01f/y83v2g5VNR+ze7bXtfAvzasOw/UP/XePtoXgQk1o+I5xnQi
	NODe3oXHvYKHU0xfUf97wmpKKpM9R93fqAtpYwP+xp277YeyGkpMk2h/K43pPmwo/pD6
	55746KwmqJZQxR5o+l7kaEHE5rHRy3zPbHRKbKYNImh1GA97Gvl6cK5B6Ot8koyMq/OG
	Ytvw==
X-Received: by 10.180.73.143 with SMTP id l15mr39271706wiv.24.1420568544409;
	Tue, 06 Jan 2015 10:22:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	je12sm14875211wic.22.2015.01.06.10.22.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 10:22:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 19:22:25 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150106182225.GB29986@jama>
References: <BLU436-SMTP224A703B53ECF80B0D6067DC2590@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP224A703B53ECF80B0D6067DC2590@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: Re: [meta-qt5][dizzy][PATCH] qttranslations: adding recipe for various qt translation ipks
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
X-List-Received-Date: Tue, 06 Jan 2015 18:22:33 -0000
X-Groupsio-MsgNum: 53703
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 12:29:30PM -0500, kkelly87 wrote:
> Since the layer does not have a specific recipe for the qttranslation sub=
module it was never being built
> and ui elements like the OK and Cancel buttons had no translations.

Can you please create version for master branch as well?

In general new features shouldn't go to release branches, but
I'm willing to make exception after it's more tested in master
branch.

>=20
> Signed-off-by: Kevin Kelly <kaneda18@hotmail.com>
> ---
>  recipes-qt/qt5/qttranslations.inc      | 85 ++++++++++++++++++++++++++++=
++++++
>  recipes-qt/qt5/qttranslations_5.3.2.bb |  5 ++
>  recipes-qt/qt5/qttranslations_git.bb   |  4 ++
>  3 files changed, 94 insertions(+)
>  create mode 100644 recipes-qt/qt5/qttranslations.inc
>  create mode 100644 recipes-qt/qt5/qttranslations_5.3.2.bb
>  create mode 100644 recipes-qt/qt5/qttranslations_git.bb
>=20
> diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttransla=
tions.inc
> new file mode 100644
> index 0000000..1fb242f
> --- /dev/null
> +++ b/recipes-qt/qt5/qttranslations.inc
> @@ -0,0 +1,85 @@
> +require qt5.inc
> +
> +DEPENDS +=3D "qtbase"
> +
> +# older copyright year than what e.g. qtbase is using now
> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1e=
e66161de \
> +                    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> +                    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c=
139dfb268fb6"
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
> diff --git a/recipes-qt/qt5/qttranslations_5.3.2.bb b/recipes-qt/qt5/qttr=
anslations_5.3.2.bb
> new file mode 100644
> index 0000000..01a1d87
> --- /dev/null
> +++ b/recipes-qt/qt5/qttranslations_5.3.2.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "f2332bedc9c1ac8e762c62cfa71aa640"
> +SRC_URI[sha256sum] =3D "29b648f005e9e588714c8e3c2115db65c7a944a6ba84baaf=
b84091d73213c5cd"
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttran=
slations_git.bb
> new file mode 100644
> index 0000000..6f1e0e4
> --- /dev/null
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -0,0 +1,4 @@
> +require qt5-git.inc
> +require ${PN}.inc
> +
> +SRCREV =3D "b9a22c997c1a988ff8e6b52893e4673e9ac69a2b"
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

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSsJ+EACgkQN1Ujt2V2gBzvnQCfdRlKDfZiUmaH9rWv3zL8uaM3
q74An0dyW2xldSMRARHuA+WDC6c8ZPB6
=OWcq
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
