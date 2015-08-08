Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 61C27767F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 19:29:40 +0000 (UTC)
Received: by pdco4 with SMTP id o4so56751450pdc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7Dvc8KnNYaNTbkDAhy+BA4Tl7JbeYkvgTe9GAIZIaVE=;
	b=YbpNL6P8xkfX/3EF61JS+cplnCSN42gPoRVkpFhkJR6W/ZWSdZcgU+zG47gzPHZfiM
	bx7WCpAOvBpZgxtbXBG26UZ/kKi439+L7NS/wgzyZylL+kzcn+sG1ktOcja0zmVfAFLW
	irqbz24mj9Ip2xHMBlOqPoRqUA7K+JfNWllRIsTo9hZNpwMrC8KTSGHOZCje7Q+N4fFR
	C3lHIy55Z+m5TaUeNlFPunyrqne7H250+Ef9vLHpnEXpf2k7bduR7yItqYhHyv8N5x3v
	o5jYkELecmZzNEmQb14SGe2dDE/PiPWtsT7aypaZpVQnPteqBrSiZgaI72z7wzz4fFUG
	fCaQ==
X-Received: by 10.70.16.67 with SMTP id e3mr28769903pdd.98.1439062180892;
	Sat, 08 Aug 2015 12:29:40 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id fy3sm896054pac.37.2015.08.08.12.29.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 12:29:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1438950796-21610-1-git-send-email-marek.belisko@gmail.com>
Date: Sat, 8 Aug 2015 12:29:36 -0700
Message-Id: <A9C0F3F9-583B-4FCA-940C-495C7CA0D198@gmail.com>
References: <1438950796-21610-1-git-send-email-marek.belisko@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: otavio@ossystems.com.br
Subject: Re: [meta-qt5][PATCH] qt5.inc: Fix packaging of qtquickcontrols
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
X-List-Received-Date: Sat, 08 Aug 2015 19:29:44 -0000
X-Groupsio-MsgNum: 56605
Content-Type: multipart/signed;
	boundary="Apple-Mail=_682FDA8E-3C87-47DC-97C0-45599B9F896D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_682FDA8E-3C87-47DC-97C0-45599B9F896D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 7, 2015, at 5:33 AM, Marek Belisko <marek.belisko@gmail.com> =
wrote:
>=20
> Fixes following:
> ERROR: QA Issue: qtquickcontrols: Files/directories were installed but =
not shipped
>   /usr/lib/qt5/qml/QtQuick/Controls/Styles/Flat/.debug
>   =
/usr/lib/qt5/qml/QtQuick/Controls/Styles/Flat/.debug/libqtquickextrasflatp=
lugin.so
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/qtquickextras.metainfo
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/gauge-icon.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/statusindicator-icon16.png=

>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/dial-icon.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/statusindicator-icon.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/delaybutton-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/piemenu-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/piemenu-icon16.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/togglebutton-icon16.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/circulargauge-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/picture-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/picture-icon16.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/togglebutton-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/delaybutton-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/dial-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/tumbler-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/gauge-icon16.png
>   =
/usr/lib/qt5/qml/QtQuick/Extras/designer/images/circulargauge-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/tumbler-icon.png
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
>=20
> Signed-off-by: Marek Belisko <marek.belisko@gmail.com>
> ---
>=20
> This patch is against jansa/master as I was trying to build Qt5.5
>=20
> recipes-qt/qt5/qt5.inc |    3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 2fc5367..d0309ae 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -52,6 +52,7 @@ FILES_${PN}-qmlplugins-dbg =3D " \
>     ${OE_QMAKE_PATH_QML}/*/.debug \
>     ${OE_QMAKE_PATH_QML}/*/*/.debug \
>     ${OE_QMAKE_PATH_QML}/*/*/*/.debug \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/*/.debug \
>     ${OE_QMAKE_PATH_IMPORTS}/*/.debug \
>     ${OE_QMAKE_PATH_IMPORTS}/*/*/.debug \
>     ${OE_QMAKE_PATH_IMPORTS}/*/*/*/.debug \
> @@ -80,10 +81,12 @@ FILES_${PN}-qmlplugins =3D " \
>     ${OE_QMAKE_PATH_QML}/*/*/*.js \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
>     ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/images \

this seems not right. png files should go into proper packages not into =
dbg


>     ${OE_QMAKE_PATH_QML}/*/*/*/*.qmltypes \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*.qml \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*.js \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/*.metainfo \

this as well.

>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*${SOLIBSDEV} \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
>     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_682FDA8E-3C87-47DC-97C0-45599B9F896D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGWKMACgkQuwUzVZGdMxQ9NQCdF4H4MaOXjvEcTeA+7CGrsk9T
vSkAniJVCiV2YbvbkbZ/IQrb+cuIhBbA
=KHgH
-----END PGP SIGNATURE-----

--Apple-Mail=_682FDA8E-3C87-47DC-97C0-45599B9F896D--
