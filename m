Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4ZBd-0004SN-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:14:37 +0200
Received: by fxi1 with SMTP id 1so1801181fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=95N9wIgI8pXoRxJ4nG7yQrMz1qzSPFd1fnpweRQZqu0=;
	b=nHgF5oW1gSrevjaQ+tbdpyqG+uBzs4cChUmipT3FXt6hELEVB9VPGva+GOFSJ3xWsp
	jSmwHppP7brmjk5qMxROD0pJmUchMfdT76wiw4c7A5JAGzf80UvoImjLQ8j+JLKl/UMA
	RNxYtyczk3eBmTHS13PIuwBjcOhjoiuIEwjs8=
Received: by 10.223.50.143 with SMTP id z15mr2492752faf.73.1316182163592;
	Fri, 16 Sep 2011 07:09:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm6136401fac.14.2011.09.16.07.09.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 07:09:22 -0700 (PDT)
Date: Fri, 16 Sep 2011 16:09:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110916140915.GL7445@jama.jama.net>
References: <cover.1316179051.git.Imran_Mehmood@mentor.com>
	<3e2bb3146eeaf47a13bc10edc83cf4cb667ab9db.1316179051.git.Imran_Mehmood@mentor.com>
MIME-Version: 1.0
In-Reply-To: <3e2bb3146eeaf47a13bc10edc83cf4cb667ab9db.1316179051.git.Imran_Mehmood@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: Re: [meta-oe][PATCH v2 1/1] twm: Add version 1.0.6 (initial recipe)
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
X-List-Received-Date: Fri, 16 Sep 2011 14:14:37 -0000
X-Groupsio-MsgNum: 34305
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iK/wEI4vkfDmI6Zw"
Content-Disposition: inline

--iK/wEI4vkfDmI6Zw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 06:29:15PM +0500, Mehmood, Imran wrote:
> From: Imran Mehmood <Imran_Mehmood@mentor.com>
>=20
>  * Imported from oe.dev commit id d90ee2735e9aa9d1a8dd7d0eb6a5917030a233d3

Can you change it to use xorg-app-common.inc from oe-core?

something like
http://patches.openembedded.org/patch/11585/

Regards,

>=20
> Signed-off-by: Imran Mehmood <Imran_Mehmood@mentor.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/rec=
ipes-graphics/xorg-app/twm_1.0.6.bb
> new file mode 100644
> index 0000000..458670b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
> @@ -0,0 +1,17 @@
> +require xorg-app-common.inc
> +DESCRIPTION =3D "tiny window manager"
> +DEPENDS +=3D " libxext libxt libxmu"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4c6d42ef60e8166aa26606524c0b9=
586"
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "952d06a0c2ec34687b536c7b619fc671"
> +SRC_URI[archive.sha256sum] =3D "e7dccad7879a7570442f0cd9df0b9064e926466b=
5a52b710fca8cfb167f294e9"
> +
> +FILES_${PN} +=3D "${datadir}/X11/twm/system.twmrc"
> +ALTERNATIVE_NAME =3D "x-window-manager"
> +ALTERNATIVE_PATH =3D "${bindir}/twm"
> +ALTERNATIVE_LINK =3D "${bindir}/x-window-manager"
> +ALTERNATIVE_PRIORITY =3D "1"
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

--iK/wEI4vkfDmI6Zw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5zWIsACgkQN1Ujt2V2gBxCoACgq+s8GYsaZ8oHMQHRiJVEiPgr
dR0AmgITrYSLv+l9TPZnxDMfIOEpD4Uz
=Vf6A
-----END PGP SIGNATURE-----

--iK/wEI4vkfDmI6Zw--
