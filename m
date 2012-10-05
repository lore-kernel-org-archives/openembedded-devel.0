Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK50H-0000gB-GU
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 12:19:33 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so909146wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hiWLEUoEieuyGaiqWkQkijTUZZEtpWoq1IcxootIc38=;
	b=wYJ47bDDTMZQjo4PanA77zAlsh9RIn4H6jEV+HKaIlpw3LJ9jUial253v1HdyHcXaP
	0z5Tw6zCKFwFKAQhEyWLJCaPSP0n4mHTTtXmtkqnWptFAKhmlwkDLp2kCnVW+YmqAWjo
	sEsPqa4127tbl3MCo0/nIIwJ6YckIgpMEZ5AEio/OGuaAFk47c+NsWCH1annTcMjgY97
	Jt3vwibG1HJFpemSgfwfs5Eqs51Vd+/u3fjFgmmAbikCtziZcwMHteabBLUuYUDaQvBg
	rhYtWgaJ/CxG4WdJsiX1E24zVQolrMA6YA4xfeWFmCmTaQdTY4khwD5V3XFIf6yjLfRX
	ssag==
Received: by 10.216.70.13 with SMTP id o13mr5369122wed.184.1349431591495;
	Fri, 05 Oct 2012 03:06:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j8sm1555370wiy.9.2012.10.05.03.06.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 03:06:30 -0700 (PDT)
Date: Fri, 5 Oct 2012 12:06:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121005100634.GA3542@jama.jama.net>
References: <1349431340-8045-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1349431340-8045-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] python-numpy 1.4.1: update hack to find the new location for python-native
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
X-List-Received-Date: Fri, 05 Oct 2012 10:19:33 -0000
X-Groupsio-MsgNum: 40930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2012 at 12:02:20PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta=
-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> index c1923f7..bb4e78a 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> @@ -24,7 +24,7 @@ inherit distutils
>  # This is a ugly, ugly hack - Koen
>  do_compile_prepend() {
>           BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUIL=
D_ARGS} || \
> +         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${=
DISTUTILS_BUILD_ARGS} || \

does it work if you inherit pythonnative and call python without path?

Cheers,

>           true
>  	 cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/c=
ore/include/numpy/
>  }
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBusSoACgkQN1Ujt2V2gBzDsACcCgHfINXoWyUKe1MTew7VUY1B
71YAnA0lcmHEGvhAHQlvG43d8G9M4UB3
=kB/y
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
