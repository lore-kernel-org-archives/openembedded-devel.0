Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6714D60655
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2013 12:03:26 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id e11so116056wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jun 2013 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yY3TuuCubgAOKStSLWJnWkYDhi6XfrBv80rrm8NX2cI=;
	b=iE4kGZOT+zXoslK1gsW4R3p+p8SIAZFHTAAj9cuyC2nDqu4mHtvKH7IfFY3K0Dj+GR
	maAM0SQWG2gLwKXXmRwIXYwRP6ZD2p9cjflLyFDEOI/D9y7kckf9zu6Gd/6UD79glySZ
	QUzizvZxa9Ut1cxVXHY/B6VlzNtYqDT202S7rmp66VC9AvCyJ8c9dfPUSG+MglrbooEp
	C9e9lsOBQzSXv91aZKLRBh12mf3YCzlXduBiI9e9uIvIkVw8qQ7/KY8VNq8Qo40guADk
	0UiEfn+Hc6ZI/JD0WfRcZCHS8OASIR5cyWm9ZcZpsycihmbMr3uF1ND2S0EK1Fu69aKc
	wN6Q==
X-Received: by 10.180.198.49 with SMTP id iz17mr1072974wic.39.1370347407140;
	Tue, 04 Jun 2013 05:03:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fz8sm2225102wib.2.2013.06.04.05.03.26 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 05:03:26 -0700 (PDT)
Date: Tue, 4 Jun 2013 14:03:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130604120343.GE3279@jama>
References: <20130528094347.GG3192@jama>
MIME-Version: 1.0
In-Reply-To: <20130528094347.GG3192@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-efl][dylan][PATCH] 2 backports
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
X-List-Received-Date: Tue, 04 Jun 2013 12:03:26 -0000
X-Groupsio-MsgNum: 44967
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline

--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 11:43:47AM +0200, Martin Jansa wrote:
> Hi Eric,
>=20
> please backport 2 commits from meta-efl
>=20
> It's minor upgrade (I know we shouldn't backport upgrades, but this=20
> is from stable bugfix-only branch) and together with following patch
> fixes evas segfaults).
>=20
> commit 8b94591a585e4fb261599a9796f4199d650e24a5
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Wed May 22 13:54:06 2013 +0200
>=20
>     evas: Add patch to fix segfaults
>    =20
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> commit 4514f8ca26dac646e7e26fc1585e70304d9ef8ae
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Tue May 14 22:20:31 2013 +0200
>=20
>     meta-efl: upgrade efl to 1.7.7, e-wm to 0.17.3
>    =20
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

And one more for meta-oe

commit 2cab9ba0d4d72496633b92b67ac1a63f605c5ada
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Sat Jun 1 14:59:02 2013 +0200

    claws-plugins-*: Update SRC_URI
   =20
    * modules are now in one bigger tarball on sourceforge
      http://sourceforge.net/projects/sylpheed-claws/files/extra%20plugins/
    * old tarballs are still available in plugins_obsolete directory
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGt158ACgkQN1Ujt2V2gBzSUACcDjpTBv6gYa2b7QsNv8d/3210
a9sAn3j/w/K5nmxzOjN3ZfjkeJ2eTNgV
=ikdW
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
