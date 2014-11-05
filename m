Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECCB6017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Nov 2014 14:25:40 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ex7so2135982wid.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Nov 2014 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uP+KJRjm5jgINhXfFZAk+rFFRFybP9sVg85wgmC+VL8=;
	b=JdspgaQYAW6g3EZqesNP9Mf454pM4/+4ts0/3b2xIzy5RMi5m6+HD7HcA/y17ea8tP
	a49BSr8f41eGGkUwVwCP7pMJ7QHdmPnDgZqeJDhCgP0jAYtd0O89Lj/xvzgLrpY98MQ9
	GC20ObjQY/awOh/y62cL4RHnoKtZcAbh3HYXvwa+z0VEs6SjJAhhVTixHRdXQTlfZC4N
	Q+P59AvaBAf+AF3e0NCyPzW99F0GlbgWn3RiKtxh6BJI1e4Nce+oyUZRaVaE/PrriANQ
	NKAGNc5F1sNZMVG35J2k/TD0+L+Zrgut/VlO7/LSctB5UrEIssurTJwPIhRfXzOZKtAA
	+EJQ==
X-Received: by 10.194.172.131 with SMTP id bc3mr43291477wjc.64.1415197540303; 
	Wed, 05 Nov 2014 06:25:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u13sm4769871wiv.10.2014.11.05.06.25.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Nov 2014 06:25:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Nov 2014 15:25:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141105142541.GB2457@jama>
References: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
	<10fd3d410b8a453f9df7b32114add897@BLUPR05MB037.namprd05.prod.outlook.com>
	<12704febfbdc48c5bc9470e90312770b@BLUPR05MB037.namprd05.prod.outlook.com>
	<7571365.1nZ3Uh4ESC@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <7571365.1nZ3Uh4ESC@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Subject: Re: php: museum.php.net is broken - change recipe SRC_URI?
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
X-List-Received-Date: Wed, 05 Nov 2014 14:25:51 -0000
X-Groupsio-MsgNum: 52741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 01:32:08PM +0000, Paul Eggleton wrote:
> On Wednesday 05 November 2014 13:20:48 Bryan Evenson wrote:
> > There hasn't been any follow-up on this thread for a couple days.  I'd =
like
> > to know if there would be an acceptable solution for this issue.  I'd
> > propose changing the SRC_URI for php-5.4.14 to
> > http://git.php.net/?p=3Dweb/php-distributions.git;a=3Dblob;f=3Dphp-5.4.=
14.tar.bz2
> > ;h=3D0d950f179d586bb1d0e879e0d4aa3a5140e8d5f5;hb=3D3dd2f12609fc8a730d7c=
f341a932f
> > 6c7b241f03c, which will directly pull only the tarball we need directly=
 from
> > the PHP Git repository.  I believe it's the only path that would be
> > guaranteed to work long term.
>=20
> Presumably if we did that we will need to keep updating the hash as well=
=20
> though?
>=20
> Looking at the bug there are at least two mirrors mentioned, although tho=
se=20
> may not be reliable on a permanent basis there should be others (e.g. dis=
tros=20
> often provide copies of the upstream sources they use). We could leave th=
e=20
> museum.php.net URL in place since it does appear it will eventually retur=
n,=20
> and add MIRRORS values to cover the situation while it's unavailable.
>=20
> Does this sound like a workable plan?

We can also send the archive to Tom King to put in in
http://sources.openembedded.org/
(like
http://lists.openembedded.org/pipermail/openembedded-devel/2014-June/096444=
=2Ehtml)

We're not changing php version so often, so keeping the tarball there
won't cause so big maintenance burden.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRaM2UACgkQN1Ujt2V2gBz04ACfXKEn/yvNKOWkMMXOmkfUqAE6
qUcAnRL8FZn9GJA3E6vRkADGMNdleg8c
=CGfc
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
