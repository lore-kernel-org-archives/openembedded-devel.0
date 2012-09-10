Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TB42P-00082p-9j
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 15:28:29 +0200
Received: by eaad12 with SMTP id d12so809359eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sXR6obEK1Z/wzHjCZ9gMdJOYCSWsfUIYgAGqlMdKuLQ=;
	b=hN+u0zyUlkB69r921UNL8N4QFfd5GRzFE/8D9Q5plHmkhWGPJOl+OB2nCRWQK2aBor
	j22OU2m1zzBBF3+OVNKtUGDVEMsmZbywfDvP1l/oVlImy8N7VuPuowe4Q7JWlknthfZX
	dH0e02Jmi8RAu9gRTmBK5YH1EyIzZKpKbznH7yQ7vP7yVN1AoF/c7qn/GqOPzRaJWczu
	R2DfH9LylXe3iklElgBnFymImp+XDMsSltnOHwYqiazd+kbPTaWW6iMwytebAej9JDaA
	xZvzIzsUFjdUtL+5G4OjbxDoRcy9Amm0etx0l4nrtJAARUKuOO3cxPa0CdBR4TMswDrm
	lZvg==
Received: by 10.205.134.137 with SMTP id ic9mr3885412bkc.57.1347282959700;
	Mon, 10 Sep 2012 06:15:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gq2sm7121181bkc.13.2012.09.10.06.15.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 06:15:58 -0700 (PDT)
Date: Mon, 10 Sep 2012 15:15:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120910131556.GC3502@jama.jama.net>
References: <504DE45C.2010202@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <504DE45C.2010202@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Couple of autotools configure problems
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
X-List-Received-Date: Mon, 10 Sep 2012 13:28:29 -0000
X-Groupsio-MsgNum: 40595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline

--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2012 at 02:00:12PM +0100, Jack Mitchell wrote:
> First off:
>=20
> | automake: warnings are treated as errors
> | lib/Makefile.am:22: warning: ':=3D'-style assignments are not portable
> | lib/Makefile.am:23: warning: ':=3D'-style assignments are not portable
> | autoreconf: automake failed with exit status: 1
> | ERROR: autoreconf execution failed.
>=20
> What is a portable version of ':=3D', maybe '+=3D'? I can't get anything =
but=20
> unrelated hits from Google.
>=20
> Secondly:
>=20
> | autoreconf: running: aclocal -I=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x=
86_64-linux/usr/share/aclocal-1.12=20
> -I=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/armv7=
a-vfp-neon-poky-linux-gnueabi/libwebsockets-0.0.0-r0/git/aclocal-copy/=20
> -I=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x=
86_64-linux/usr/share/aclocal-1.12=20
> -I=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/armv7=
a-vfp-neon-poky-linux-gnueabi/libwebsockets-0.0.0-r0/git/aclocal-copy/=20
> --force --warnings=3Dcross
> | aclocal: warning: unknown warning category 'cross'
>=20
> Where does this warning=3Dcross come from and how come it doesn't effect=
=20
> any other autotool builds?
>=20
> I am attempting to compile libwebsockets which is located at:=20
> http://git.warmcat.com/cgi-bin/cgit/libwebsockets/tree/
>=20
> Cheers,

See this thread
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/02910=
8.html

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBN6AwACgkQN1Ujt2V2gBxXAwCePrWlevUaZFsdeT/BUz6QapGB
iIkAoLcIbUsYZeu1KgMq7akvr+tX0amn
=pvVC
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
