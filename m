Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9442B6E268
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 23:02:50 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so201003291wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mQu/ZCxNnoaZbRpO3VxYaqnPoBlCkXHgxK9ty0UQmL8=;
	b=OFTHUt/KseSb9n+lueF56plDvlsg0TOqIdwxGfRd5ZXBkLDEvXUZBGt9Cwi77Acm4W
	AJhpGUd33KO9KNfpP7NuJV0UP/kny1q5jYuOY8bVNF24BtjaaCmKZiI33iy0v9NXn2BD
	j2EtIGwcqXUN/ED31BNJp17zlzN1K2r9UlRv/XrmPzEFP/hMAX8/Tysbp6EnPXwjke11
	7NhCDOKzw7GEQ67OZpkk0v38CFIByUKtLPOZGTWhMhB1RZ3YATeJYX6RVROtCrhvfB6G
	HR86yV8xfzxgu8GsYcacng1JwTlE3laany5Jvlhm8ua0wpfQ4mYeUJxcfnMNGItZepXr
	a4nw==
X-Received: by 10.194.205.162 with SMTP id lh2mr38198502wjc.61.1447714970201; 
	Mon, 16 Nov 2015 15:02:50 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h7sm36755698wjz.7.2015.11.16.15.02.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 15:02:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 23:03:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151116220304.GH2240@jama>
References: <1446816009-14836-1-git-send-email-samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <1446816009-14836-1-git-send-email-samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCHv2] qtbase: support oe-device-extra.pri in configure
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
X-List-Received-Date: Mon, 16 Nov 2015 23:02:51 -0000
X-Groupsio-MsgNum: 58679
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y9PDtDHaFrXNoMPU"
Content-Disposition: inline

--y9PDtDHaFrXNoMPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2015 at 03:20:09PM +0200, Samuli Piippo wrote:
> configure parses through the mkspec, but does not handle conditions
> at all, so oe-device-extra.pri was not included at configure phase.
> For example QT_QPA_DEFAULT_PLATFORM had no effect for configure.
> With include() on a separate line, oe-device-extra.pri is correctly
> included also in configure.

Please resend version applicable for 5.6 in master branch (this will be
merged to jethro after more testing in master branch).

> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>  recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/r=
ecipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index a9c448d..0826ba1 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -45,9 +45,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
>   configure                            |  70 +++++++++++++++---------
>   mkspecs/features/configure.prf       |   4 +-
> - mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
> + mkspecs/linux-oe-g++/qmake.conf      |  44 +++++++++++++++
>   mkspecs/linux-oe-g++/qplatformdefs.h | 100 ++++++++++++++++++++++++++++=
+++++++
> - 4 files changed, 188 insertions(+), 28 deletions(-)
> + 4 files changed, 190 insertions(+), 28 deletions(-)
>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> =20
> @@ -200,7 +200,7 @@ new file mode 100644
>  index 0000000..d0a4166
>  --- /dev/null
>  +++ b/mkspecs/linux-oe-g++/qmake.conf
> -@@ -0,0 +1,42 @@
> +@@ -0,0 +1,44 @@
>  +#
>  +# qmake configuration for linux-g++ with modifications for building wit=
h OpenEmbedded
>  +#
> @@ -240,7 +240,9 @@ index 0000000..d0a4166
>  +# for the SDK
>  +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
>  +
> -+exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
> ++exists(../oe-device-extra.pri) {
> ++  include(../oe-device-extra.pri)
> ++}
>  +
>  +load(qt_config)
>  diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++=
/qplatformdefs.h
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

--y9PDtDHaFrXNoMPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKUpcACgkQN1Ujt2V2gBzlvwCgt30qDIX+gwwANM1WZbetwN8w
PqgAoJhWvEvAXdleCFC+jZNIBC1a130o
=KmvQ
-----END PGP SIGNATURE-----

--y9PDtDHaFrXNoMPU--
