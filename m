Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 78E686E3EC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 17:37:45 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so3879033ead.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2014 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZY2IdoRbFUQ0kN4rzDCaD/a7kkqGGquil2lyHvKH7jY=;
	b=kzExD+W4Y5jYMsI1HtyaccBnHg0P7eVXkyxCvp+Dlk0KEgUgflJUrRMMhnaB9Ooced
	dWwoviN+orYlmNF0UF1DawTuHp+knbrdVprHbug+cu8/3crOEsaXuLfHXlPBHRS96ml9
	xxpRtwo7yFTLDG+LsEkqr7Suuy1UxSrmpIfHxibVrHFnQ2uMcsgPfmtQpagc0EXKpZ3R
	oUYgi/lnxcikrunXY2MUplYGUWfkDf9HQXF3dYqUav///noOUsp4zuJrVAv3F81dVq2i
	FSUpLk87NtYujldIWOytibdTzTLk0SciKXVcA8vQ/TZtK+J/lG/bQW8QpieKomXR6CE9
	SaPg==
X-Received: by 10.14.101.5 with SMTP id a5mr4387705eeg.63.1391449065445;
	Mon, 03 Feb 2014 09:37:45 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o43sm77671074eef.12.2014.02.03.09.37.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 09:37:44 -0800 (PST)
Date: Mon, 3 Feb 2014 18:37:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Kevyn-Alexandre =?iso-8859-1?Q?Par=E9?= <kapare.rogue@gmail.com>
Message-ID: <20140203173755.GE3698@jama>
References: <CACgAsMeiKrLgjPnsZwOJtncRJ4nKExvjtS23VXNXcwyMsWtaDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMeiKrLgjPnsZwOJtncRJ4nKExvjtS23VXNXcwyMsWtaDw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-qt5
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
X-List-Received-Date: Mon, 03 Feb 2014 17:37:45 -0000
X-Groupsio-MsgNum: 48033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Content-Disposition: inline

--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2014 at 12:07:30PM -0500, Kevyn-Alexandre Par=E9 wrote:
> Morning Martin,

morning,

> I found your email from here:
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-qt5/
>=20
> I'm searching for help on that package/doc
>=20
> If you prefer I can send my question to a specific mailing list if you
> pin point me where?

openembedded-devel@lists.openembedded.org is better place (see README
file)

> So my goal is to run qt5 on my OMAP3 board by using yocto.
>=20
> I have fallow :
> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
> and &
> http://gpupowered.org/node/20
>=20
> Try to run this:
> root@overo:/# export QT_DEBUG_BACKINGSTORE=3D1
> root@overo:/# export QT_QPA_PLATFORM=3Dminimal
> root@overo:/# Qt5_CinematicExperience -plugin tslib
> libpng warning: iCCP: known incorrect sRGB profile
> libpng warning: iCCP: known incorrect sRGB profile
> This plugin does not support createPlatformOpenGLContext!
> QtQuick: failed to create OpenGL context
> This plugin does not support createPlatformOpenGLContext!
> QtQuick: failed to create OpenGL context
>=20
> Result:
> nothing is visible on my LCD except the console...
>=20
> So do you have any idea where I should start digging to simply start
> by making a qt5 example run on my board?

I've no experience with wandaboard, but few people asked about it with
relation to qt5, so maybe someone will respond on ML.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLv0/MACgkQN1Ujt2V2gBwJMACff3IYdjj+Ou55VmIBHrLM0KvW
2YAAnRgd2HcmkvN2yuek6PuDdF/seki1
=r6YS
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--
