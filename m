Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYxjK-0002tE-VD
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 11:31:03 +0100
Received: by eekb15 with SMTP id b15so1470701eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 02:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U4SgnCovXEmOCwSodlNUaz/0pLleAGFBcxRvaIFwekc=;
	b=hjSIJWMC72j7yYBNc5F+uw2EGEkNF0wKwefrbbCFbRIdXYbtL6ILn50MFSIbKz/PzA
	V9fbg//zqWi3HECVmB6DNTFw9AZPCktI/ixmn+dojUq/qjtrNmKO/s8R2R6O2KJ1jQsM
	H+nsbjP+3IK3/n0qamaVgsLUZFGvWbe+r4i8M=
Received: by 10.14.15.207 with SMTP id f55mr797676eef.6.1323426252500;
	Fri, 09 Dec 2011 02:24:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 53sm29406038eef.2.2011.12.09.02.24.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:24:11 -0800 (PST)
Date: Fri, 9 Dec 2011 11:24:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111209102409.GE3848@jama.jama.net>
References: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
	<1323419602-13546-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1323419602-13546-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-efl 2/2] expedite: update runtime dependencies to match evas update
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
X-List-Received-Date: Fri, 09 Dec 2011 10:31:03 -0000
X-Groupsio-MsgNum: 35991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline

--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2011 at 09:33:22AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-efl/recipes-efl/e17/expedite_svn.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-=
efl/e17/expedite_svn.bb
> index ee91c98..dfcbcde 100644
> --- a/meta-efl/recipes-efl/e17/expedite_svn.bb
> +++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
> @@ -1,9 +1,10 @@
>  DESCRIPTION =3D "Expedite is a comprehensive benchmarking suite for Evas"
>  DEPENDS =3D "eet evas"
> -RDEPENDS_${PN} =3D "expedite-themes evas-engine-buffer evas-engine-fb ev=
as-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas=
-loader-png"
>  LICENSE =3D "MIT BSD"
> +
>  SRCREV =3D "${EFL_SRCREV_1.1.0}"
>  PV =3D "1.1.0+svnr${SRCPV}"
> +PR =3D "r1"
> =20
>  inherit e
>  SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> @@ -27,3 +28,5 @@ EXTRA_OECONF =3D "\
>  "
> =20
>  FILES_${PN} +=3D "${datadir}"
> +RDEPENDS_${PN} =3D "expedite-themes evas-engine-fb evas-engine-software-=
generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
> +
> --=20
> 1.7.2.5

not using expedite here, but makes sense wrt evas changes so

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7h4ckACgkQN1Ujt2V2gBzizACgrULlHKFHQ2MEXmAbKKXlqHYu
SLEAnjcz+PL3kQvSNbD90qt7nbQ6h63B
=r6OO
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
