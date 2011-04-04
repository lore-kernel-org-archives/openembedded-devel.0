Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q6qjH-0006RM-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 22:50:31 +0200
Received: by bwz5 with SMTP id 5so4514801bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VanK/lt0m5aq5S0HSWX4+W+Z3kcMOSQ9swWsiOlnKSM=;
	b=A8BV0eD2yUKDZR2eYVS2dkioZP4rptlZqQA1Fu86GFBLkMNAVkeygdY8eG1lhUZKHT
	0v4jWy2UzGPhGSZTleqA/z8x5TAehpVRmnIrab6nkje5zGGVBrbf02ZaMWY0D1U2ZX4u
	KXeNu1K9vLoqWAss/KCk1l6ThZcqfHZK6iRms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Vdpg8IVL125dCTbZM9LhGEJVv4UEIgK3dLWzoHeIYkQb/8GIYxMGd4cb4JyD3ocAWw
	mQtW0N9yh05SYdwC27Pe+YPQMziyc+r2ld8WZsdRRQILDWKWqKuKvaO9QoXrJlhm2rGh
	Wqj/05KB9ot6WrUD5KwFFtruixe3Trd1cLIms=
Received: by 10.204.228.130 with SMTP id je2mr426494bkb.166.1301950103744;
	Mon, 04 Apr 2011 13:48:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm3337735bkc.2.2011.04.04.13.48.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 13:48:22 -0700 (PDT)
Date: Mon, 4 Apr 2011 22:48:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110404204815.GB30816@jama.jama.net>
References: <1301949631-6761-1-git-send-email-philippedeswert@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1301949631-6761-1-git-send-email-philippedeswert@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] 1/2] eio: new recipe and include file for eio
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
X-List-Received-Date: Mon, 04 Apr 2011 20:50:32 -0000
X-Groupsio-MsgNum: 30908
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2011 at 11:40:30PM +0300, Philippe De Swert wrote:
> Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
> ---
>  recipes/efl1/eio.inc    |    8 ++++++++
>  recipes/efl1/eio_svn.bb |   13 +++++++++++++
>  2 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/efl1/eio.inc
>  create mode 100644 recipes/efl1/eio_svn.bb
>=20
> diff --git a/recipes/efl1/eio.inc b/recipes/efl1/eio.inc
> new file mode 100644
> index 0000000..d7ccdca
> --- /dev/null
> +++ b/recipes/efl1/eio.inc
> @@ -0,0 +1,8 @@
> +DESCRIPTION =3D "Enlightenment Input Output Library"
> +LICENSE =3D "LGPL2.1"

we usually use LGPLv2.1

will fix while pusing it (when it gets available on patchwork)=20

> +DEPENDS =3D "ecore eina"
> +
> +inherit efl
> +
> +BBCLASSEXTEND =3D "native"
> +INC_PR =3D "r0"
> diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
> new file mode 100644
> index 0000000..6a12dcf
> --- /dev/null
> +++ b/recipes/efl1/eio_svn.bb
> @@ -0,0 +1,13 @@
> +require eio.inc
> +
> +SRCREV =3D "${EFL_SRCREV}"
> +PV =3D "0.1.0+svnr${SRCPV}"
> +PR =3D "${INC_PR}.0"
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D403f20cf42c847686ac2956f14bfa=
30f"
> +
> +SRC_URI =3D "\
> +  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +"
> +S =3D "${WORKDIR}/${SRCNAME}"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2aLo4ACgkQN1Ujt2V2gByItQCgjXyaNAxPK9gnI4FbiuMlFuWw
yEsAnRNyX3kMivErUknBi0OYF094+ElI
=QTwN
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
