Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RJP5Q-0000DX-Ns
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 14:29:32 +0200
Received: by wwf10 with SMTP id 10so3414331wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2011 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h/GVJ4FED4We95WkeDEUOE0MytFB0bxEeHi8E1GlERY=;
	b=GWP+f2P1aPdGuYJxV8PUN3SNyAdQXEPovnQ7nDWS8VgPeNa62doVyywfwGjuB0ZADs
	Dcd64iyttqFUfNqEFSuPOAgnZwbYRTmU1aPear34D9MEOxR1oOwMIUtoheCbknpWWt0F
	CXLqwphuZIwOTsLLkp1QzRh+lk6McB3VkaMR0=
Received: by 10.227.208.149 with SMTP id gc21mr15746427wbb.10.1319718212639;
	Thu, 27 Oct 2011 05:23:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b5sm9081809wbh.4.2011.10.27.05.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Oct 2011 05:23:31 -0700 (PDT)
Date: Thu, 27 Oct 2011 14:23:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111027122325.GB12609@jama.jama.net>
References: <cover.1319713297.git.Imran_Mehmood@mentor.com>
	<e47e61f0299e7aeb267452a50cde4441ad72118f.1319713297.git.Imran_Mehmood@mentor.com>
MIME-Version: 1.0
In-Reply-To: <e47e61f0299e7aeb267452a50cde4441ad72118f.1319713297.git.Imran_Mehmood@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: Re: [meta-oe][PATCH v2 1/1] xclock: Add version 1.0.5 (initial recipe)
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
X-List-Received-Date: Thu, 27 Oct 2011 12:29:33 -0000
X-Groupsio-MsgNum: 35035
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline

--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 04:28:35PM +0500, Mehmood, Imran wrote:
> From: Imran Mehmood <Imran_Mehmood@mentor.com>
>=20
>     * Imported from oe.dev commit id 6e7e35679200cd55264fae308cd5dec7ef2d=
1d29
>=20
> Signed-off-by: Imran Mehmood <Imran_Mehmood@mentor.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb b/meta-oe/=
recipes-graphics/xorg-app/xclock_1.0.5.bb
> new file mode 100644
> index 0000000..f50b74e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
> @@ -0,0 +1,12 @@
> +require recipes-graphics/xorg-app/xorg-app-common.inc
> +
> +DESCRIPTION =3D "analog / digital clock for X"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D857759ade8f2ddde5c7b32ef7356e=
a36"
> +
> +DEPENDS +=3D " libxaw libxrender libxft libxkbfile libxt"
> +
> +SRC_URI[md5sum] =3D "eaf124bbc9d13e1a12a29faaa2ed3612"
> +SRC_URI[sha256sum] =3D "53a9169e24f3814fbfcfee3ca0b98637840a3156ed7c7e36=
ae03940fabae4c9a"



> +FILES_${PN} +=3D " /usr/share/X11/app-defaults/"

sorry I haven't noticed before, but this is already included by .inc
file, so you can remove it here

Regards,

> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6pTT0ACgkQN1Ujt2V2gBwzfACfYB9IYcSdDYVxVUTjpAxCrCeY
rG4AnRJteXbvBsnUXHp4qCRHCPiKkIPq
=qA28
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
