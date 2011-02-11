Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnsNk-00010j-8a for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:45:52 +0100
Received: from f053036141.adsl.alicedsl.de ([78.53.36.141]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnsMi-0001Y6-QZ for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 12:44:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1297424493-25116-1-git-send-email-sledz@dresearch.de>
References: <1297424493-25116-1-git-send-email-sledz@dresearch.de>
Date: Fri, 11 Feb 2011 13:44:47 +0100
Message-ID: <1297428287.3785.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] testscript.sh: be able to use branches other that testing-next
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
X-List-Received-Date: Fri, 11 Feb 2011 12:45:52 -0000
X-Groupsio-MsgNum: 29038
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Xmp9GJrvoNDeYHP3QlOF"

--=-Xmp9GJrvoNDeYHP3QlOF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 11.02.2011, 12:41 +0100 schrieb Steffen Sledz:

There is a typo in the commit summary: `s/that/than/`.

> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  contrib/testing/testscript.sh |   22 ++++++++++++++--------
>  1 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/contrib/testing/testscript.sh b/contrib/testing/testscript.s=
h
> index 7ae2bd5..23c244b 100755
> --- a/contrib/testing/testscript.sh
> +++ b/contrib/testing/testscript.sh
> @@ -1,21 +1,27 @@
>  # this script can be used for testing purposes.
>  # see also http://wiki.openembedded.net/index.php/TestingScript
> =20
> -# you can define your machine/distro/recipe below (remove the #)=20
> -# or you can pick them up from the environment
> -#MACHINE=3D"beagleboard"
> -#DISTRO=3D"minimal"
> -#TARGET_RECIPE=3D"console-image"
> +# you can set your machine/distro/recipe/branch in the environment
> +# or use these defaults
> +[ -n "${MACHINE}" ] || MACHINE=3D"beagleboard"
> +[ -n "${DISTRO}" ] || DISTRO=3D"minimal"
> +[ -n "${TARGET_RECIPE}" ] || TARGET_RECIPE=3D"console-image"
> +[ -n "${TESTING_BRANCH}" ] || TESTING_BRANCH=3D"testing-next"
> =20
>  # test if we have an openembedded dir, clone it if it does not exist
>  if [ ! -d openembedded ]
>  then
>      (git clone git://git.openembedded.org/openembedded)
> -    (cd openembedded; git checkout -b testing-next origin/testing-next)
> +else
> +    # fetch latest objects and refs
> +    (cd openembedded; git fetch)

I always use `git remote update` but it looks like there is no
difference [1][2]. Although I could not find in `git help fetch` what
remote is used by default by `git fetch` if none is provided.

>  fi
> =20
> +# create local testing branch if it does not exist yet
> +(cd openembedded; git branch --set-upstream ${TESTING_BRANCH} origin/${T=
ESTING_BRANCH})
> +
>  # switch to the testing branch
> -(cd openembedded; git checkout testing-next)
> +(cd openembedded; git checkout ${TESTING_BRANCH})
> =20
>  # test if bitbake exist; if not; fetch it and untar it
>  if [ ! -d bitbake-1.10.2 ]
> @@ -80,7 +86,7 @@ export BBPATH=3D${TOPDIR}/openembedded
>  rm -rf ${TOPDIR}/tmp
> =20
>  # add an echo about the vars so we can see what has been done in a log f=
ile
> -echo $MACHINE $DISTRO $TARGET_RECIPE
> +echo ${MACHINE} ${DISTRO} ${TARGET_RECIPE} ${TESTING_BRANCH} `(cd openem=
bedded;git --no-pager log --max-count=3D1 --pretty=3Dformat:%H)`
> =20
>  # and do the actual work.
>  bitbake ${TARGET_RECIPE}

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://www.kernel.org/pub/software/scm/git-core/docs/gitworkflows.html=
=20
[2] http://stackoverflow.com/questions/2688251/what-is-the-difference-betwe=
en-git-fetch-origin-and-git-remote-update-origin

--=-Xmp9GJrvoNDeYHP3QlOF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1VLz8ACgkQPX1aK2wOHVi2ngCeM46xqY3p5diwUCOpU+dLgziz
KuUAn15Ivp1eMZhhqU4HKmixS5PjAN/y
=Tmgi
-----END PGP SIGNATURE-----

--=-Xmp9GJrvoNDeYHP3QlOF--
