Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 03AD572458;
	Wed, 25 Mar 2015 00:11:03 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so8588516wgb.0;
	Tue, 24 Mar 2015 17:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CzONmbNiXzbKt152067q+ZsJ0r730EXZIrVlzTRGGwU=;
	b=KPLQpxwB/wciqdBVhrmut3T53H6gofjucigv4IFV7+kRpNXF8NSFwm9qbLdWIRtUXh
	g3czfy1zCEe7QZbw4NOMQ5054PaYJni+4SfPd28FF/tb1Ub+wixFTSkZV1AsGkShsO4x
	gLonWclGBEND6xxIzIIprWYwM/evHnlS93vgiR0xGDOvtGARo+r1lyQ9kS3faxPykxDC
	oEXQ6CGtFTT5U5rUwTE5k9+SQaTgkY8oXdMzNzSw+2NSG5FuYgHDsTNmzTeyninFJn8d
	ZByBNASAYVDhYFzo7S9IRMQ7tOxr1/1ZL7w+PpDnxg0vMXhZPw6U32sex4xUQd7NEHas
	yU+Q==
X-Received: by 10.194.201.2 with SMTP id jw2mr12410483wjc.158.1427242264250;
	Tue, 24 Mar 2015 17:11:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eo1sm1696980wib.16.2015.03.24.17.11.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Mar 2015 17:11:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Mar 2015 01:11:17 +0100
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20150325001117.GI3904@jama>
References: <CAMKF1spUz8OsY5b50tCXE==Na=iPicbg-zUZt-NH91gjn6XbdQ@mail.gmail.com>
	<1427240923-7428-1-git-send-email-ashcharles@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1427240923-7428-1-git-send-email-ashcharles@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] mpd: Add build dependency on samba
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
X-List-Received-Date: Wed, 25 Mar 2015 00:11:05 -0000
X-Groupsio-MsgNum: 54870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline

--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2015 at 04:48:43PM -0700, Ash Charles wrote:
> Version 0.19 [1], adds the smbclient plugins for storage and input so
> needs samba when building with the --enable-samba option.
>=20
> [1] http://git.musicpd.org/cgit/master/mpd.git/plain/NEWS?h=3Dv0.19
>=20
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> index feec985..f6152a6 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> @@ -20,6 +20,7 @@ EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', =
'systemd', '--with-systemds
>  PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[id3tag] =3D "--enable-id3,--disable-id3,libid3tag"
>  PACKAGECONFIG[lame] =3D "--enable-lame-encoder,--disable-lame-encoder,la=
me"
> +PACKAGECONFIG[smb] =3D "--enable-smbclient,--disable-smbclient,samba,sam=
ba"

You don't need to repeat samba in 4th parameter.

> =20
>  do_install_append() {
>      install -d ${D}/${localstatedir}/lib/mpd/music
> --=20
> 2.1.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUR/SUACgkQN1Ujt2V2gBwNbgCgsebCm08UxhOVFTL1Am1VB1Xc
FfIAn2mxSVWEGmAUwfHb2TVZRvFsrijA
=oyK3
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
