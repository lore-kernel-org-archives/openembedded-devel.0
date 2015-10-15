Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 071E2770E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:47:04 +0000 (UTC)
Received: by wijp11 with SMTP id p11so25369010wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kDn0MuAiWCKTLUxe6Nt4K0PqkrxF1S0aLtsLs5xH3Qg=;
	b=YDTMXSDHgSmaBavBwKmzeAFLd9K//LeYTHmXdwDOMqXukSo+aTUhsz+mzXofbdnxtI
	FyCBXZH8d8v2XCx8AJWCXyzqLo2tjoh88R6bqz7iDxI/9JAe3JEJ4xItzsyLgw/06e+J
	jqntfPNIIV51yJglT2CEPSFLx+d84AxLTHNulUrilwot3lwomRiTyNeog5e4AnRnQuRF
	AxO5efUmgECT7n4pg4PIxmavviy+UQP15LCNRs90Zgv3pijkhJP7gYmiwL7jy6JlpIDl
	ibpX4AvKtR23UpwoNK1iPS9IMFhnmOxf9s9qejkOH7VE0mJa3zfk3MgZrIjCGwMdihW3
	9aIw==
X-Received: by 10.180.93.168 with SMTP id cv8mr35339542wib.54.1444909624819;
	Thu, 15 Oct 2015 04:47:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hs5sm23303175wib.6.2015.10.15.04.47.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 04:47:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2015 13:47:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151015114726.GC2588@jama>
References: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] qt5: use extra .pri file from linux-oe-g++ mkspec
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
X-List-Received-Date: Thu, 15 Oct 2015 11:47:06 -0000
X-Groupsio-MsgNum: 57841
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline

--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 01:00:31PM +0300, Samuli Piippo wrote:
> Load additional oe-device-extra.pri in the default linux-oe-g++ mkspec to
> allow simple changing of target dependent values. This is useful for any
> target that needs to specify e.g., QMAKE_LIBS_EGL or other additional con=
figs.

Looks good, but people using this need to be aware that it will cause
qtbase and everything depending on it MACHINE_ARCH which is very
unfortunate considering the time needed to build things like
qtwebengine/qtwebkit.

> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>  recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/r=
ecipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index e67df40..91bb9f3 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -45,9 +45,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
>   configure                            |  70 +++++++++++++++---------
>   mkspecs/features/configure.prf       |   4 +-
> - mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
> + mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
>   mkspecs/linux-oe-g++/qplatformdefs.h | 100 ++++++++++++++++++++++++++++=
+++++++
> - 4 files changed, 186 insertions(+), 28 deletions(-)
> + 4 files changed, 188 insertions(+), 28 deletions(-)
>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> =20
> @@ -197,10 +197,10 @@ index 6b37a04..dcf6025 100644
>               write_file($$QMAKE_CONFIG_LOG, msg, append)
>  diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmak=
e.conf
>  new file mode 100644
> -index 0000000..2ad2810
> +index 0000000..d0a4166
>  --- /dev/null
>  +++ b/mkspecs/linux-oe-g++/qmake.conf
> -@@ -0,0 +1,40 @@
> +@@ -0,0 +1,42 @@
>  +#
>  +# qmake configuration for linux-g++ with modifications for building wit=
h OpenEmbedded
>  +#
> @@ -240,6 +240,8 @@ index 0000000..2ad2810
>  +# for the SDK
>  +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
>  +
> ++exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
> ++
>  +load(qt_config)
>  diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++=
/qplatformdefs.h
>  new file mode 100644
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

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYfkk0ACgkQN1Ujt2V2gBzEkACdGhERkH0SlgZYxTZs6HSIJeyR
sxcAnAnxNgcDt66ToXy7yWTHn1nHf2Ir
=m8BE
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
