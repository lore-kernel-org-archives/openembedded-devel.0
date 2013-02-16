Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6aP8-0005YV-Rw
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 06:33:54 +0100
Received: by mail-da0-f53.google.com with SMTP id w3so1709598dad.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 21:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8C/eq0YJBYK1DARFlxYgLPPG05RhdMrRXbfLE3s6ZlE=;
	b=mxIcRlE8ow475+qCFhXCrUCEdtyPjuau5GSze/kGkRWl2x1lIYp8rT4yReLQ3Lfp3k
	B2tOj8ylV80nNgTz0vKBUiHs01hnGxfKytIhQVI6VxVtb9jNikIP6jgrpvr2/1YdVS4w
	kROBOSxQ4CDoBXetJ38y/tgdLobZx+1/YlBozHZU6MM+EuIExWkrtC080jzTf6Bmnk54
	l4hByR+dHIEu2clYb6OAAfK1RqQKnWeNtwYTuuprK8i5S+yb39a/TDeCH4D+YljVqjOT
	gSGCqRIShN8iscVDxTjdZSW1GyF9frefEmev6vyER96WaWCm7+xZaMcsZxly5ZD1bf4R
	ddFg==
X-Received: by 10.68.213.200 with SMTP id nu8mr11823541pbc.46.1360991857642;
	Fri, 15 Feb 2013 21:17:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q4sm95905245paz.20.2013.02.15.21.17.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 21:17:36 -0800 (PST)
Date: Sat, 16 Feb 2013 06:17:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216051735.GT3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-8-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-8-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 7/8] libmemcrypt: add 2.5.8
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
X-List-Received-Date: Sat, 16 Feb 2013 05:33:57 -0000
X-Groupsio-MsgNum: 43194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yypaS3FvPkEUiGyo"
Content-Disposition: inline

--yypaS3FvPkEUiGyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:51:02AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Commit message should be libmcrypt:

> ---
>  .../recipes-support/libmcrypt/libmcrypt_2.5.8.bb   | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
>=20
> diff --git a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb b/meta-=
oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
> new file mode 100644
> index 0000000..0cbe189
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Replacement for the old crypt() package and crypt(1) co=
mmand, with extensions."
> +HOMEPAGE =3D "http://mcrypt.sourceforge.net/"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee8=
02b37ff"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcr=
ypt-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "0821830d930a86a5c69110837c55b7da"
> +SRC_URI[sha256sum] =3D "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18c=
a9c9ef34d27a373e"
> +
> +inherit autotools gettext binconfig
> +
> +do_configure() {
> +	gnu-configize --force
> +#	libtoolize --force --copy
> +	autoconf
> +	oe_runconf
> +}
> +
> +do_install_append() {
> +	rm ${D}${libdir}/libmcrypt -r
> +}
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yypaS3FvPkEUiGyo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEfFm8ACgkQN1Ujt2V2gByvYACbBsFDQ62AFh5AP1eIM0NdyWIF
sskAmwWrp5BEGH7XSUN+gXiP48Znf8lL
=WOXI
-----END PGP SIGNATURE-----

--yypaS3FvPkEUiGyo--
