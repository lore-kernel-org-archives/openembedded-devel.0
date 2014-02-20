Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3245F6E92F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 12:17:35 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so42202eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 04:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CB3/7iAQIANhnr1uoehW3+wOqQ5sORN0WxlkUNoesb4=;
	b=NBp0LC7BsiyUUwXf7t2CFdmOLze97zz1QrPVBxE80tVWtxpiEY/X7zGWjbENk8MbUK
	XfvFmyld0XhDe3Ld6o7ySO+0xXbglyFQ5aPQzxFRFupDO8AIXU2pMIRxWRaWNhEsnjjG
	LtYTw9oVRmMuQlc2DxbUReUuu8rMjDEvW6H8EB3s1NfiXwVwVyP8ynaZAQGfVOENXlhZ
	+kjZ2dks+iaKRhn5X5JHLtifA5zOeW4YZBI9OIMF5KeGHALQJSwuUPUcq34odAokxJp4
	uAfybCCy2uripTPUhdO8Hd5iB6XhBnqGAvY9wpcT/LgIzs++cAFyTFavmR8YcgeML/CA
	yFVA==
X-Received: by 10.15.22.142 with SMTP id f14mr1407086eeu.113.1392898655337;
	Thu, 20 Feb 2014 04:17:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g1sm13151853eet.6.2014.02.20.04.17.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 04:17:34 -0800 (PST)
Date: Thu, 20 Feb 2014 13:18:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140220121807.GD3854@jama>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Thu, 20 Feb 2014 12:17:39 -0000
X-Groupsio-MsgNum: 48236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline

--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 12:22:36AM -0300, Otavio Salvador wrote:
> When looking for Qt5 components and files we ought to use the Qt5
> specific path. In case the distribution wants to have a flat tree it
> can set QT_DIR_NAME and it will still works as expected.

NAK

I don't think this is good idea, end-user applications shouldn't install
their data, archdata, examples etc in qt5 subdirectories.

https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-include=
-paths-and-build-failing-to-find-qt5-headers

If you don't care about qt4/qt5 separation just set empty QT_DIR_NAME
and all qtmodules will fold into default directories and you won't need

OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"

listed in above wiki.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> I have built two image and the SDK from scratch using this with no
> issues. Could someone also give this a try?
>=20
>  classes/qmake5_base.bbclass |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 3861cd0..ec0267a 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -57,20 +57,20 @@ do_generate_qt_config_file() {
>      cat > ${QT_CONF_PATH} <<EOF
>  [Paths]
>  Prefix =3D ${OE_QMAKE_PATH_PREFIX}
> -Headers =3D ${OE_QMAKE_PATH_HEADERS}
> +Headers =3D ${OE_QMAKE_PATH_QT_HEADERS}
>  Libraries =3D ${OE_QMAKE_PATH_LIBS}
> -ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
> -Data =3D ${OE_QMAKE_PATH_DATA}
> +ArchData =3D ${OE_QMAKE_PATH_QT_ARCHDATA}
> +Data =3D ${OE_QMAKE_PATH_QT_DATA}
>  Binaries =3D ${OE_QMAKE_PATH_BINS}
>  LibraryExecutables =3D ${OE_QMAKE_PATH_LIBEXECS}
>  Plugins =3D ${OE_QMAKE_PATH_PLUGINS}
>  Imports =3D ${OE_QMAKE_PATH_IMPORTS}
>  Qml2Imports =3D ${OE_QMAKE_PATH_QML}
> -Translations =3D ${OE_QMAKE_PATH_TRANSLATIONS}
> -Documentation =3D ${OE_QMAKE_PATH_DOCS}
> -Settings =3D ${OE_QMAKE_PATH_SETTINGS}
> -Examples =3D ${OE_QMAKE_PATH_EXAMPLES}
> -Tests =3D ${OE_QMAKE_PATH_TESTS}
> +Translations =3D ${OE_QMAKE_PATH_QT_TRANSLATIONS}
> +Documentation =3D ${OE_QMAKE_PATH_QT_DOCS}
> +Settings =3D ${OE_QMAKE_PATH_QT_SETTINGS}
> +Examples =3D ${OE_QMAKE_PATH_QT_EXAMPLES}
> +Tests =3D ${OE_QMAKE_PATH_QT_TESTS}
>  HostBinaries =3D ${OE_QMAKE_PATH_HOST_BINS}
>  HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
>  HostLibraries =3D ${OE_QMAKE_PATH_HOST_LIBS}
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMF8n8ACgkQN1Ujt2V2gByO/wCeJSkDDy0Kdy8QT3MHhLaFGQx3
riAAn26OMA9Qv3yvWnxESZf16KDFzra1
=2Pw3
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
