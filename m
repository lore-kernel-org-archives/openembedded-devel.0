Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3D01177045
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 17:42:29 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so25207557wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h5eaPb+gmwLAZT03BoiAHuiYnYSUikr31C/u6/WJApA=;
	b=huMHjN60THhOuGKSb6TxZqwo/u1dOcbaoF7ZYybh2xtLJVnHqX+YJAkEIhIOhZrZ2p
	weWJU5IaZI2YLA1y9jrc+ZWNPzBCVqwUWnPOe2A0TROTD18n05Is7oSvv1Z8fVQTBEaf
	dR0R5LQYJK8pcapXaPAz1E1UQsWP4R4ELrHy99FWhEKfnujT3cy2eMqKeeRD9usu5L9M
	koWDCvFkBd+nx2aXQd7Zf+h33Mh+NnGzfWeK/wL1G9HrIye5ndNJgNl51ys21KjCGYNE
	H1OYfWahqGMwUxfJXWX0jGZoPXIfTYIIa6KtAdCdAD6FCwhR6zEg8f8rw4ktGrKf85o5
	zryQ==
X-Received: by 10.194.187.79 with SMTP id fq15mr9454387wjc.142.1441388549351; 
	Fri, 04 Sep 2015 10:42:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i7sm5404491wib.15.2015.09.04.10.42.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 10:42:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Sep 2015 19:43:01 +0200
To: Steffen Sledz <sledz@zone42.org>
Message-ID: <20150904174301.GD2457@jama>
References: <55E9C13C.9070308@zone42.org>
MIME-Version: 1.0
In-Reply-To: <55E9C13C.9070308@zone42.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5] install problem for qtbase
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
X-List-Received-Date: Fri, 04 Sep 2015 17:42:32 -0000
X-Groupsio-MsgNum: 57203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline

--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 06:05:16PM +0200, Steffen Sledz wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> We've a big problem building qtbase (from fido branch) for two machines w=
ith the same SoC in one workspace.
>=20
> It seems that the do_install of the run for the second machine (which fai=
ls) destroys the image subdirectory totally. :(

the image subdirectory is only temporary and removed before do_install
starts

permanent files are always installed in MACHINE sysroot (or as packages
in deploy directory)

use bitbake-diffsigs to find out why do_install is re-executed for your
secondmachine after it was finished for firstmachine.

> Here's what we see after a clean build:
>=20
> - -----------------------------------------------------------------------=
--------------
> MACHINE=3Dfirstmachine bitbake qtbase
>=20
> # tree -d -L 3 tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux=
-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
> tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase=
/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
> =E2=94=94=E2=94=80=E2=94=80 usr
>     =E2=94=9C=E2=94=80=E2=94=80 bin
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 qt5
>     =E2=94=9C=E2=94=80=E2=94=80 include
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 qt5
>     =E2=94=9C=E2=94=80=E2=94=80 lib
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 cmake
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fonts
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pkgconfig
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 qt5
>     =E2=94=94=E2=94=80=E2=94=80 share
>         =E2=94=9C=E2=94=80=E2=94=80 doc
>         =E2=94=94=E2=94=80=E2=94=80 qt5
>=20
> 13 directories
> # tree -d -L 3 tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC=
+2cb17c1fb9-r0/image/
> tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/=
image/
> =E2=94=94=E2=94=80=E2=94=80 home
>     =E2=94=94=E2=94=80=E2=94=80 sledz
>         =E2=94=94=E2=94=80=E2=94=80 work
>=20
> 3 directories
>=20
> - -----------------------------------------------------------------------=
--------------
> MACHINE=3Dsecondmachine bitbake qtbase
>=20
> # tree -d -L 3 tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux=
-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
> tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase=
/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/
> =E2=94=9C=E2=94=80=E2=94=80 home
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sledz
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 work
> =E2=94=94=E2=94=80=E2=94=80 usr
>     =E2=94=9C=E2=94=80=E2=94=80 bin
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 qt5
>     =E2=94=94=E2=94=80=E2=94=80 lib
>=20
> 7 directories
> # tree -d -L 3 tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC=
+2cb17c1fb9-r0/image/
> tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/=
image/
> =E2=94=94=E2=94=80=E2=94=80 home
>     =E2=94=94=E2=94=80=E2=94=80 sledz
>         =E2=94=94=E2=94=80=E2=94=80 work
>=20
> 3 directories
>=20
> - -----------------------------------------------------------------------=
--------------
>=20
> Additionally after the second run some files are in the wrong subdirector=
ies, e.g. the font files are located in image/usr/lib/ instead of image/usr=
/lib/fonts.
>=20
> - --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>=20
> iQIcBAEBAgAGBQJV6cE7AAoJEBIsfIC8WuIYUfoP/RwcE6mnRiCaMfH5DjXvGcQw
> y4YpdLAukbew3cSVGZaUGykD8IKalMPcpaEvibMVXwRWRCognYmW6lgLhhMnURH1
> fFWn7w++9o1HR+pFMP3nVf7ql+Y3FnYZfX2hJ1nJLOXvW7ZvsyzmhS6T8qJ/1mYw
> UrUqNSiGq9fW4hVDMbGiaDAaq40tzAkncIx7I0lw3tw2Dzfy0CThU3nXH9dwkrLX
> 94bNub5QLjz+DHwYQjOCYtbsIpormVg5iK7NqlBf68TrNvqZ8nfOaiQTYedoHwGj
> K8O4QZM0gfWKQrA8SC7VMhytYeyDKD/BoZJAFu7VoKI8/931IS2pgBzikTI4qsOL
> LJYNN5eGE1UjosP5pUiAWyJL3+Fw8VdCwMFBD2C2c71ZJC2mbCLNqBOq9b9QG3UP
> xIDDaScDXLnHb1oBly1afzAuA9GgJONExP8HWUwMBqGKN/QRkhacLFC+Co7f7HOS
> B/QLSwUI4f5cFSYL6XA88jOBJ15Cni2Q9M+DCxiVTNF25KyzTO9bfXYoT7r/dtLx
> u2hocNVibWVNK02P3nJEx3bb8CgiWNSsFW5O95jHm5ns3I59ffLhuutmkst3YWC4
> hwid/pkC5TkPJ56Gs19T7aD471cPnuiV2Hu31UvcNbw0GBn3YmW/CTkN7PgYpvr+
> PncY5IhX69dkKpcokBDR
> =3DJUCc
> -----END PGP SIGNATURE-----

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXp2CQACgkQN1Ujt2V2gBwglQCgtflXgK0AdkbMfS54ODFZU141
cQcAmgLq0rJIgMmaRXwz0BhiG4+Vwu3i
=Unok
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
