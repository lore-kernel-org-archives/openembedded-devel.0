Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id BD3136B282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 21:22:10 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1279133eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G2lYQrj4bRcSnAul969JNCK8rNcjOgHolzGy/QSpbSg=;
	b=ZWEnRVHb8UFJXSFC8eLyhYYrBt7+3M2cLevw/996wa8PwPMpkbFnLhaRvDLHxfWw0q
	q5URTEWFMKHij5lxadMCBhlUT6FFujlbJbDd9TaU2/u7GT4G8xmLan8mwMpNQ95VgK9z
	XmxGd1p5FJFuNFOeQYR/yf+bC8Y9YuPluHr8eU1ULShwzVtB8Q0pIro2MscE+PqyIRPe
	omgX3aV3x5TKIJnFHENpft5MnaLgf4T+Zo5d0uLIvlmJmdpdAXQe3+KCyuvvisA+kohs
	u2pRTEoXzKv9co2MdKAUq2jROLyBPbvi1GyXuOvMU2wZ8nMSc9Zg64/KFPKExDiAfqBw
	WavQ==
X-Received: by 10.14.149.3 with SMTP id w3mr2951213eej.84.1375219331033;
	Tue, 30 Jul 2013 14:22:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm113473229eeh.15.2013.07.30.14.22.09 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 14:22:10 -0700 (PDT)
Date: Tue, 30 Jul 2013 23:22:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130730212243.GG3280@jama>
References: <1374848729-19835-1-git-send-email-mihai.prica@intel.com>
	<20130726174345.GE3280@jama> <4071302.P2cxlv2fxA@helios>
MIME-Version: 1.0
In-Reply-To: <4071302.P2cxlv2fxA@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] lvm2: Add dependency on bash
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
X-List-Received-Date: Tue, 30 Jul 2013 21:22:11 -0000
X-Groupsio-MsgNum: 45527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Content-Disposition: inline

--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2013 at 12:15:19PM +0100, Paul Eggleton wrote:
> On Friday 26 July 2013 19:43:45 Martin Jansa wrote:
> > On Fri, Jul 26, 2013 at 05:25:29PM +0300, Mihai Prica wrote:
> > > Fixes rootfs generation error if bash is not included in the image.
> >=20
> > With rpm right?
>=20
> If it's what you're suggesting technically it's broken with any package=
=20
> backend, to some degree.

Agreed, I was just commenting on it because "rootfs generation error if
bash is not included" is quite vague and it could be also bashism in
postinst script.

> > Find which script it has in shebang and add bash only to that package
> > RDEPENDS, if it's something which isn't always needed put it in separate
> > package.
>=20
> Or if practical patch the script(s) to remove the bashisms and change the=
=20
> shebang to #!/bin/sh instead.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH4LqMACgkQN1Ujt2V2gBzpTQCfdvEtRgzEejG63GpB732/H6Z4
bAQAoLekkZhk+PQ2crRmcPBDWIvKH6KA
=7xGD
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--
