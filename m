Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwK0e-0005jL-6A
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 23:02:04 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so2355296pac.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 13:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OzPWgkr++lmTMfPoXGY94dK3Saz359zIbFPdI8Oy6YE=;
	b=EpoJ6mwuxn1GVyccreWWkBVPcUtcG7M6NGQEQYUcJGPEkg2fpTcxXTPRv0GRYcsvG9
	S7hgkyaJ0f3jNy4AqQ4C06iPpZmiEtTKhT77glA5PvdtYqwde8706hMxU/8ajEBY3GfK
	wVbnuivFGAz4S3DadbC9OAaA1Z7HiYn151TgQho8dFNQ3eBzU7cT5Pt6YICy4AUZoIsH
	XSOHweKubig3eDGHjCn0qcM4zdFJhMmjpFOjmH4aY+lH88llQhVNJCQSFnwa9I8mXFl4
	7rshVtt2nMJinCMgCnifBimDVDRfvfzb8KwexcBAPFoT3MCooTY3n0MxGW5InOUF9rq/
	ZcoQ==
X-Received: by 10.68.251.136 with SMTP id zk8mr27706761pbc.82.1358545594587;
	Fri, 18 Jan 2013 13:46:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gv9sm3738928pbc.21.2013.01.18.13.46.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 13:46:33 -0800 (PST)
Date: Fri, 18 Jan 2013 22:46:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130118214629.GD29386@jama.palm1.palmone.com>
References: <50F9BED9.8020504@emagii.com>
MIME-Version: 1.0
In-Reply-To: <50F9BED9.8020504@emagii.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: What determines the build location "OE_DIR/tmp/work/*" ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 22:02:04 -0000
X-Groupsio-MsgNum: 42749
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 10:30:01PM +0100, Ulf Samuelsson wrote:
> I am building a driver which will load firmware at runtime.
> For development purposes, I have defined two machines,
> which will be used to build two different versions of the driver.
>=20
> Have a separate recipe for the firmware.
> Each machine defines FW_VERSION which is used to select
> a subtree containing the firmware, so the same recipe is used for both=20
> machines.
>=20
> The driver gets built in "$OE_DIR/tmp/work/<machine>-angstrom-linux/gnuea=
bi"
> but the firmware gets built in "$OE_DIR/tmp/work/armv7a-none-linux-gnueab=
i".
> This means that the same tree is used for both machines,
> which of course does not work.
>=20
> Is there a way to define that the recipe should be built in
> "$OE_DIR/tmp/work/<machine>-angstrom-linux/gnueabi"?
>=20
> Otherwise, I guess I have to use two different recipes.

PACKAGE_ARCH =3D "${MACHINE_ARCH}"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5wrUACgkQN1Ujt2V2gBwbmACfUBiFcgstQb5ff6x0adzEhuEB
RYoAoIYTkZKtE1Vw4IhXIXxS1CIIl66Y
=udtF
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
