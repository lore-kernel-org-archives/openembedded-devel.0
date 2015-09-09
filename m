Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id E2195763F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2015 18:01:45 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so30944128wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2015 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V3BWEcPl3CTEshp3hFRqR4B8r0jBhqlRxbQYMhELn+A=;
	b=qpczHYcWlyhPsVTGloTa7JUaAfriPSKs42r08XJJQvP5BFD1W1EGohUG12WxBq80iF
	PYYrRbBgFq/YcUq4urgrfz3Ih9rfvSj8UD4xYnNxi/QdyoXSZJDWtzuyF/60N3eXU69u
	okCD1jQPhEihyszUA305IEK6mutdwJz3o579cq1keDQNdStPmP7aahUWpfVcMTfofOPI
	d2VYmsdU6JOIiBax4re8GBNk4zRWKNuL2ABUYf9W+LTHPB6TIdDgtPilKB2pRJU+7XNI
	LbEfGgnMJePsp9YroeccHSsAsmd9orJngyT7yai/1F88RUlKgE6uRijHjr4dxdtboVNN
	Yi7w==
X-Received: by 10.194.171.200 with SMTP id aw8mr59061318wjc.62.1441821705021; 
	Wed, 09 Sep 2015 11:01:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ul1sm11413206wjc.30.2015.09.09.11.01.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 11:01:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Sep 2015 20:02:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150909180237.GC2390@jama>
References: <1441186359-14111-1-git-send-email-samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <1441186359-14111-1-git-send-email-samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] qt5: package Qt Quick Designer files separately
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
X-List-Received-Date: Wed, 09 Sep 2015 18:01:46 -0000
X-Groupsio-MsgNum: 57283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline

--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 12:32:39PM +0300, Samuli Piippo wrote:
> Some modules (at least Qt Quick Controls and Qt Canvas 3d) have extra
> files for Qt Quick Designer integration, which are not needed in the imag=
e.
> Create new ${PN}-qmldesigner package that includes those files instead of
> ${PN}-qmlplugins.

This breaks qtwebkit:

ERROR: Nothing RPROVIDES 'qtwebkit-qmldesigner' (but
/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtwebkit_git.bb
RDEPENDS on or otherwise requires it)

NOTE: Runtime target 'qtwebkit-qmldesigner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qtwebkit-qmldesigner']

NOTE: Runtime target 'qtquick1-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qtquick1-dev',
'qtwebkit', 'qtwebkit-qmldesigner']
=2E..

it's caused by qtwebkit redefinition of PACKAGES variable:
# remove default ${PN}-examples-dbg ${PN}-examples set in qt5.inc,
# because it conflicts with ${PN} from separate webkit-examples recipe
PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg
${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins
${PN}-mkspecs "


Can you change qtwebkit_git.bb to use PACKAGES_remove and resend tested
patch?

Regards,

> ---
>  recipes-qt/qt5/qt5.inc | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 4c58ad6..17d8fd7 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -45,7 +45,7 @@ INSANE_SKIP_${PN}-examples +=3D "libdir"
>  INSANE_SKIP_${PN}-examples-dbg +=3D "libdir"
>  INSANE_SKIP_${PN}-examples-dev +=3D "libdir"
> =20
> -PACKAGES =3D. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${=
PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev $=
{PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
> +PACKAGES =3D. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${=
PN}-qmldesigner ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${=
PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples=
 "
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
>  ALLOW_EMPTY_${PN}-dbg =3D "1"
> @@ -58,6 +58,7 @@ RRECOMMENDS_${PN}_class-target =3D " \
>  RRECOMMENDS_${PN}-dev =3D " \
>      ${PN} \
>      ${PN}-mkspecs \
> +    ${PN}-qmldesigner \
>      "
> =20
>  RRECOMMENDS_${PN}-dbg =3D " \
> @@ -85,6 +86,11 @@ FILES_${PN}-plugins-dbg =3D " \
>  "
> =20
>  # extra packages
> +FILES_${PN}-qmldesigner +=3D " \
> +    ${OE_QMAKE_PATH_QML}/*/designer \
> +    ${OE_QMAKE_PATH_QML}/*/*/designer \
> +"
> +
>  # qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
>  FILES_${PN}-qmlplugins =3D " \
>      ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
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

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXwdD0ACgkQN1Ujt2V2gByo7QCeP1NGZIOYEcUBLGlKHjQCp33G
OGoAnjVxPMto7SdRkaWRVtUlV6l/nxwd
=Q2Lr
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
