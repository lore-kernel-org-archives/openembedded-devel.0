Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3666028A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2014 23:29:25 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so1764214eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 15:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r2l1BfnsyaaakwY9TY2O/Knah85GYV+Tj5KL+pZIXgo=;
	b=UQbw72qgBh+oACvqbRb0boT9RJKrRjlieWCt4LgysflbxfEUngkUrD6BYuA7MwggGn
	bEMz+tUtVUx4BIc7zxCz+iBA81TqIdYwabZcb0g8TySsOoT+Gr1QT6pROSGbj7Zw3IWu
	Q2bFzP3NCu2jWivlfzuo1gZvCmT4g6jrc4d3WyTlDcqJlo4k01+054DYGZ34MGddP0bj
	IzxsQ3N2fOkv9aS209WjDoLxeWyFngwwMyMtMk7VXLeSoB7z4BoNh5HRNW8OJCXAALeZ
	Hz8VMhRUtpQBcbfR4JEGPanHIjm4uCUk8gQO64DbvXNV8lRzIM0PEhVViMH8CbrkDGC8
	MXbQ==
X-Received: by 10.14.206.133 with SMTP id l5mr46642eeo.115.1389310165974;
	Thu, 09 Jan 2014 15:29:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm9761445eeg.4.2014.01.09.15.29.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 15:29:25 -0800 (PST)
Date: Fri, 10 Jan 2014 00:29:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140109232937.GM3709@jama>
References: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
	<1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch
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
X-List-Received-Date: Thu, 09 Jan 2014 23:29:26 -0000
X-Groupsio-MsgNum: 47673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HtrkgkD3uBADSQLK"
Content-Disposition: inline

--HtrkgkD3uBADSQLK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 05:48:26PM +0100, Andreas M=FCller wrote:
> libraries based on cmake and depending on qt5qml failed to configure with:
>=20
> |   The imported target "Qt5::DBus" references the file
> |
> |      "/home/a.mueller/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/=
qt5/qdbusxml2xml"

Thanks, it's typo only in 5.2.0, there was extra bindir in paths and
when I was fixing it I've noticed that OE_QMAKE_PATH_EXTERNAL_HOST_BINS
wasint used for qdbus*.

Last thing I want to fix in 5.2.0 before merge to master are wrong
(mostly empty) PRIVATE_INCLUDE_DIRS variables in cmake - that's what
prevents me to switch webos-ports to 5.2.0 now.

A bit longer description is now included in
https://github.com/meta-qt5/qtbase/blob/stable/oe-patches.txt
=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch     =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_B=
INS-to-determine-pa.patch b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EX=
TERNAL_HOST_BINS-to-determine-pa.patch
> index e3f1b72..ea3364e 100644
> --- a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-=
determine-pa.patch
> +++ b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-=
determine-pa.patch
> @@ -54,7 +54,7 @@ index 1d94715..617efa8 100644
>       set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR=
}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
>   !!ELSE
>  -    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SU=
FFIX\")
> -+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxm=
l2xml$$CMAKE_BIN_SUFFIX\")
> ++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscp=
p2xml$$CMAKE_BIN_SUFFIX\")
>   !!ENDIF
>       _qt5_DBus_check_file_exists(${imported_location})
>  =20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HtrkgkD3uBADSQLK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLPMOEACgkQN1Ujt2V2gBy2GACfchIn0YgjOgjmUkD/nV5NXewa
YAsAoJ3RI4N9qW7HiOipKHMxT2rWv398
=H0CO
-----END PGP SIGNATURE-----

--HtrkgkD3uBADSQLK--
