Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3F74A6B181
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:14:49 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so4732907wes.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/16d8Wrs+aKDA2kIL8hjV+Ch3Dlw/t+okGKjwN4FXSg=;
	b=vLEsazMEvk4d+MkH+pB32mT6zXgVE4NBKsFLKo/AUS3M9jxomm2K2knQGwJFbRAkT9
	KST7UySxrgXb6CH20atipVE8T672H8xOB0o7sS3kcfyQnJJGcC3a2C/VpCC9oFg0cKH/
	I2zIo+f7bj447KYf6Kni5BmS/+i6rBbrKetHseFC+znkt8qWWRIqjuXoTrVLf5nr2Mpl
	FRDycY7V2EK7Yn/TG9oFYJauaFFMBrfgQNJEdZAoBw5MU3hvbXZUezWPpOlu6vyo3Urj
	ga2mGu72y1TQgPK5NBjtr7YDpAxJZQ7apcFKGOaiuQaeos2jljiiuIUYFPoZ2DbJRe5i
	fUrQ==
X-Received: by 10.180.219.66 with SMTP id pm2mr11905037wic.60.1396268089758;
	Mon, 31 Mar 2014 05:14:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm32682902ees.3.2014.03.31.05.14.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 05:14:48 -0700 (PDT)
Date: Mon, 31 Mar 2014 14:14:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Message-ID: <20140331121447.GD2425@jama>
References: <14e2a65afdb24b6f96f3b87a5cb04881@BLUPR05MB037.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <14e2a65afdb24b6f96f3b87a5cb04881@BLUPR05MB037.namprd05.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: php: Backport PHP SRC_URI update patch to dylan?
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
X-List-Received-Date: Mon, 31 Mar 2014 12:14:54 -0000
X-Groupsio-MsgNum: 48918
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline

--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 12:02:48PM +0000, Bryan Evenson wrote:
> I'm on the dylan branch, I recently had to do a complete rebuild of my im=
age to recover from a mistake I'd made.  During the rebuild, it failed to f=
etch php until I applied this patch: http://git.openembedded.org/meta-opene=
mbedded/patch/?id=3D2c63ef6da286e528a23509a87d55c79098e1c2b7.   I see this =
patch has been applied to dora and master, but it is not present in dylan. =
 Could this patch get backported to dylan?  Without it, anyone on the dylan=
 branch can't fetch php.

Yes, please check README and send patch with [dylan] tag and Cc to dylan
maintainer.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM5XDcACgkQN1Ujt2V2gBw+2wCdEn8Q+N8GsEU8rwGbM5SIYYC3
OKwAoIgvaLzBU8ZfPwH2VE5vW9dOKgeh
=wgEt
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
