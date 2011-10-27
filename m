Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RJMSA-0003hY-4O
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 11:40:50 +0200
Received: by eyd9 with SMTP id 9so2344212eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2011 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5nnAYvmog+PGTqnv1suKUD9ceCrOwsSDGccv9HvKc+o=;
	b=jcgv8QmYzQF8Ad72KCtcuSbiG26koyauzOuO0L0V7+xpQ2g+wArP1vDehpnOM7SxiC
	wRa772XoVRRjpemf9aPBsKHSxXZNgVejvsVmp//klnssuEXkayyn4A5C356MrqrQMLnU
	WVd0ci2cGJTF35Hvv3AirRbMmZKvxWWxjrHss=
Received: by 10.213.3.145 with SMTP id 17mr374437ebn.50.1319708085818;
	Thu, 27 Oct 2011 02:34:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w58sm13262318eeb.4.2011.10.27.02.34.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Oct 2011 02:34:44 -0700 (PDT)
Date: Thu, 27 Oct 2011 11:34:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111027093439.GA12609@jama.jama.net>
References: <cover.1319650935.git.Imran_Mehmood@mentor.com>
	<3ed003aaae2d2fba52e5b3fa951ed1b125f97455.1319650935.git.Imran_Mehmood@mentor.com>
MIME-Version: 1.0
In-Reply-To: <3ed003aaae2d2fba52e5b3fa951ed1b125f97455.1319650935.git.Imran_Mehmood@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: Re: [meta-oe][PATCH 1/1] xclock: Add version 1.0.5 (initial recipe)
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
X-List-Received-Date: Thu, 27 Oct 2011 09:40:50 -0000
X-Groupsio-MsgNum: 35029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 02:13:53PM +0500, Mehmood, Imran wrote:
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
> index 0000000..b7939db
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
> +SRC_URI[archive.md5sum] =3D "eaf124bbc9d13e1a12a29faaa2ed3612"
> +SRC_URI[archive.sha256sum] =3D "53a9169e24f3814fbfcfee3ca0b98637840a3156=
ed7c7e36ae03940fabae4c9a"

there is no name=3Darchive in xorg-app-common.inc, please remove 'archive.'=
 here

Regards.

> +FILES_${PN} +=3D " /usr/share/X11/app-defaults/"
> +
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

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6pJa8ACgkQN1Ujt2V2gBzyawCdEVBLnDtNuSQAOj6Om/a9ivao
HJIAnRxSGfh2zgM7Vw9kI7tFEXMg+kaC
=LrvP
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
