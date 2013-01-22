Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxgGT-0002y3-Kw
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:59:57 +0100
Received: by mail-pa0-f46.google.com with SMTP id kp14so2730474pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2JmK2kVhoe0VRoTv2xpJLypDpKuCvLF577ycXgTKsv8=;
	b=L/LFUgaFdusQo6rDZFbuXREkpnBQAPW/6pB0UzyeEMsVNQmZlmCCAFifjTb4u0PSlK
	sY5kiWruT8fHQuXW3jPV8gkhImf7HCchg151wiiA1YBwGu9n71JxhSwaZn/jsoQAtoCI
	P+lSKw50rDvSEU821h+eLQR0JguH5OD/pDS9K1q7AgODRAb0PnzXH2vv9r0HpRhrccpi
	f/VJWqxyWG7JIsPh0b9YcMi6mNofSd9uR/+qSf8vSozt02kSd7QuCGWImKEwNhYRj+t6
	OKfIthClR2QhoWQMplPp+dBc/lBAbm1UXffmqcFicHMv6F4nn/j4BUchx5ytzGPMsQR4
	EwyA==
X-Received: by 10.66.81.199 with SMTP id c7mr57289576pay.39.1358869466582;
	Tue, 22 Jan 2013 07:44:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ot3sm10943408pbb.38.2013.01.22.07.44.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 07:44:25 -0800 (PST)
Date: Tue, 22 Jan 2013 16:44:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122154425.GW29386@jama.palm1.palmone.com>
References: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
	<1358857259-11444-4-git-send-email-Martin.Jansa@gmail.com>
	<kdm9q1$hk5$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <kdm9q1$hk5$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe][meta-networking][meta-xfce 4/4] autofs: fix QA warnings
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
X-List-Received-Date: Tue, 22 Jan 2013 15:59:58 -0000
X-Groupsio-MsgNum: 42812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="reSNjdE3Iylkp4B8"
Content-Disposition: inline

--reSNjdE3Iylkp4B8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 04:04:36PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 22-01-13 13:20, Martin Jansa schreef:
> > autofs-5.0.7: autofs: Files/directories were installed but not shipped=
=20
> > /run
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 4 ++++ 1 file
> > changed, 4 insertions(+)
> >=20
> > diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> > b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb index
> > bf679b4..2bf03f1 100644 ---
> > a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb +++
> > b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb @@ -60,4 +60,8
> > @@ do_configure_prepend () { fi }
> >=20
> > +do_install_append () { +	test -d ${D}/run && rmdir ${D}/run +} +=20
> > INSANE_SKIP_${PN} =3D "dev-so"
>=20
> Missing PR bump

I know, but oe-core changes are now applied without PR bumps too and
upgrade paths are broken without PR service at least since Christmas..

So is it still worth it?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--reSNjdE3Iylkp4B8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+s9kACgkQN1Ujt2V2gBwIvQCePg5qopW7LjGN8ZlGaWhON0Ox
8YIAnRSIXmk+KCj+fs09naEMfUxsX7M6
=v9h5
-----END PGP SIGNATURE-----

--reSNjdE3Iylkp4B8--
