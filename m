Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id EEED26D14A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:43:15 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z10so4480277ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 05:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sgGJHLrm0B+kIbW396NqmRBx/mKy7I4UK8W77gz4xCQ=;
	b=LHS5PjKdHz4tfYzXfyercWUE7NuUGhsJD/UE3EtzaisQFKEw0oq4/8tU0JxyJ6Ue3F
	DgwN2wqIlSH3oXY+jwyuaY0I7OXX4a8t5KmTVMTcCAh7hisnK/DTeLpPh6xl/Hv7v6U5
	tkNznB2C45c7NvGcMlUPvqQ3ceNV61GvPx0NwQJhSR9EnloAKf07H1tQcg+z2b2PewzG
	rTtOQRFvLn9A6VwvZfQcahJIjlSwqV5DBoemzrqW7GCmHeBFdOxQ35m8sCiDsobIymZK
	H/RrImn/vsqFIgltw0Fgkw3bjMFErVVXDNS4VBsnrRMeScRN2rbNz/j0myxncJMY3Jyn
	MVsw==
X-Received: by 10.14.93.199 with SMTP id l47mr8958766eef.58.1392730996391;
	Tue, 18 Feb 2014 05:43:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v6sm70140998eef.2.2014.02.18.05.43.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 05:43:15 -0800 (PST)
Date: Tue, 18 Feb 2014 14:43:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Michael Burgett -X (burgetm - CLEARPATH WORKFORCE MANAGEMENT INC@Cisco)" <burgetm@cisco.com>
Message-ID: <20140218134347.GK4067@jama>
References: <2890E9321F60574296094E33AB39D3C320EFC4E5@xmb-aln-x09.cisco.com>
MIME-Version: 1.0
In-Reply-To: <2890E9321F60574296094E33AB39D3C320EFC4E5@xmb-aln-x09.cisco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] qmake5_base.bbclass question
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
X-List-Received-Date: Tue, 18 Feb 2014 13:43:16 -0000
X-Groupsio-MsgNum: 48198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rf72Gf+bfLC8kxKs"
Content-Disposition: inline

--rf72Gf+bfLC8kxKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 01:05:10PM +0000, Michael Burgett -X (burgetm - CLE=
ARPATH WORKFORCE MANAGEMENT INC at Cisco) wrote:
> Hello Martin,

Hello Michael,

> I'm working on incorporating the meta-qt5 layer in a yocto tree here at C=
isco, and have run into an issue. Being new to Yocto and Qt, I don't trust =
myself to know if I'm correctly analyzing my problem, and hope you don't mi=
nd the intrusion.

Please use openembedded-devel@lists.openembedded.org for generic
questions like this, use [meta-qt5] tag (like README suggests for
sending patches).

> The symptom I am getting is that when I build qt apps in yocto, after the=
 qt5 stuff has all been built, it looks in the wrong place for the include =
files.  It's searching in the sysroot /usr/include, instead of sysroot/usr/=
include/qt5.
>=20
> I changed a line in qmake5_base.bbclass:
>=20
> Headers =3D ${OE_QMAKE_PATH_HEADERS}  =3D> Headers =3D ${OE_QMAKE_PATH_QT=
_HEADERS}
>=20
> so the line in the created qt.conf would be=20
>=20
> Headers =3D /usr/include/qt5  instead of Headers =3D /usr/include
>=20
> and this solves my problem. =20
>=20
> Is this line incorrect, or do I have another configuration problem somewh=
ere, causing this problem?

It's correct, the reason is that not every qmake built project actually
needs to use Qt headers, so they are not included by default, see
https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-include=
-paths-and-build-failing-to-find-qt5-headers

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rf72Gf+bfLC8kxKs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMDY5MACgkQN1Ujt2V2gBwqcQCfbdpucY/FI6KCUWmJMX59AMy9
zB0AoKtIcYiKX8uIsgMi1PCpHgss8M/K
=RIO/
-----END PGP SIGNATURE-----

--rf72Gf+bfLC8kxKs--
