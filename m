Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvrwN-0005zd-2e
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 17:31:27 +0200
Received: by bkcik5 with SMTP id ik5so2202948bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rjtZ+tlCnVtKJ9Lhzb+zHHzMJl7dAx2gkpH5U7nmh4k=;
	b=Da7U5Jp/pCF3gDVQq/6ZqnexkkVR8MKQxyM0fVoznKznvlHQ7fv5WFuEjxErKjEKPp
	SDj70+0vS/l8A0Dg1yuwtvCqXALwnfD9nVP/5/7y+MA8oZTea8lipx26Y3kNQ2V50BMo
	sxU/0qJuK/XcezX9lgTb3MK1B8O7gvsEepg1rl+yxh6aprlngGop07zcOZzD3h171/o2
	jvAt9yb5HeAJj3e+Q93o6AhhOW9gnNWyQKzAW8/Zp3+ofcMWxiMNhOUFiF3tHL0ofTbB
	S1PEmixE1v6ODw8f7Ujwh52ZETAIJ4qmlGxkwovmZbobNNKuO7uu/strfieO7pVqw5qw
	ejRg==
Received: by 10.204.152.145 with SMTP id g17mr4000759bkw.120.1343661578603;
	Mon, 30 Jul 2012 08:19:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm4014040bkg.2.2012.07.30.08.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 08:19:37 -0700 (PDT)
Date: Mon, 30 Jul 2012 17:19:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120730151932.GL3261@jama.jama.net>
References: <1343660648-20358-1-git-send-email-gary@mlbassoc.com>
	<1343660648-20358-2-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1343660648-20358-2-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] [meta-oe] libxml++: New recipe
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
X-List-Received-Date: Mon, 30 Jul 2012 15:31:28 -0000
X-Groupsio-MsgNum: 39931
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Content-Disposition: inline

--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2012 at 09:04:08AM -0600, Gary Thomas wrote:
> Library for C++ bindings to libxml
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-core/libxml/libxml++_2.35.3.bb |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
>=20
> diff --git a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb b/meta-oe/rec=
ipes-core/libxml/libxml++_2.35.3.bb
> new file mode 100644
> index 0000000..ca9388c
> --- /dev/null
> +++ b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "C++ wrapper for libxml library"
> +DESCRIPTION =3D "C++ wrapper for libxml library"
> +HOMEPAGE =3D "http://libxmlplusplus.sourceforge.net"
> +BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml%2=
B%2B"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2"
> +
> +SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.35/libxml=
++-2.35.3.tar.xz"

Use something like:
SHRT_VER =3D "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True).=
split('.')[1]}"
SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"

> +SRC_URI[md5sum] =3D "196a2dcdc84ab987fe3852b3f29cafd7"
> +SRC_URI[sha256sum] =3D "715a4214bbff90365cc8406a28e427febd90461006d608fb=
dcdcea7fc9891eaf"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34 "
> +
> +DEPENDS =3D "libxml2 glibmm"
> +
> +inherit autotools pkgconfig
> +
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAWpgQACgkQN1Ujt2V2gBwVrACeMO8MlPJh3fehv+3ymfzpNPSD
xkAAnR90pMadmqHPIYFrBe9e39jcUk9j
=TnJl
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--
