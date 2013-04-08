Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPIkY-0004wO-8J
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 22:33:12 +0200
Received: by mail-pa0-f44.google.com with SMTP id bi5so3425188pad.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 13:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kHJ/BHnQ3P0eQaI7AUHsjYkLqpacFXvEV5NV5p2YqJE=;
	b=zAq+LEvG6lJE8AR5liFFuOyGo8et038sQn6zy1tpwcjzPUpMJzsTwjUZ182DTpKTDN
	4M+wePgxtILbSIeJRxDCClpzMXaDIdYBGZEpley36QrOj0OnPHT6z6kdMYQEshr7xv2M
	+lZAgbKShf7vXGz7hABKmLFsehPyAB5XMLMIhFjJsvPCiZJqFuNb1V1cq4zlThRKckFM
	p8ULmzcUTY8rZWG0U/IolbtP3wAvJd931Ds1iL5ly/T9cWvW2xjWLWHzwPwQROFzsUNN
	4SrTG4KxxxL7e/YmAooC9wsdkx4WNW/Jvco2DvyZSUSILNGSi3JHT0muRvx89B8NlQ2j
	kzxw==
X-Received: by 10.66.49.38 with SMTP id r6mr39434847pan.212.1365452146916;
	Mon, 08 Apr 2013 13:15:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ak5sm22868826pac.4.2013.04.08.13.15.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 13:15:45 -0700 (PDT)
Date: Mon, 8 Apr 2013 22:15:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130408201539.GD2470@jama>
References: <5162B803.4090400@nedap.com> <20130408131717.GA2470@jama>
	<kjv77m$tt7$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <kjv77m$tt7$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: machinename with dash in it
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
X-List-Received-Date: Mon, 08 Apr 2013 20:33:14 -0000
X-Groupsio-MsgNum: 43974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2013 at 09:53:34PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 08-04-13 15:17, Martin Jansa schreef:
> > On Mon, Apr 08, 2013 at 02:28:51PM +0200, Jaap de Jong wrote:
> >> Hi All, something strange happens with my machinename with a dash in
> >> it: x-y If I bitbake some image it will end up that netbase is not
> >> found. Inspection of build/tmp-angstrom_v2012_12-eglibc/work shows 2
> >> variants of x-y: one with a dash and one where the dash is replaced by
> >> an underscore: x-y and x_y In x-y only netbase is found, rest of the
> >> machinespecific packages are in x_y
> >=20
> > MACHINE_ARCH is MACHINE with s/-/_/g (because rpm had issues with -) so
> > it's expected.
> >=20
> >> Creating the image fails with the message that netbase is not found...=
=20
> >> Any ideas?
> >=20
> > It's probably caused by=20
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102 do manual clea=
nup
> > described there and it should work fine.
>=20
> The root cause was this one:
> https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dcommit=
;h=3D30f353c072336ad764e9528ae3c508adb28fa4ad

Heh, I was expecting that all MACHINEs in PACKAGE_ARCH died long time
ago.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFjJWsACgkQN1Ujt2V2gByOBgCgq9znGODXvOrt84QpfQASvAYj
lnQAnj8RGfhpII2XogcIEqfIHJUdumEO
=4nlF
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
