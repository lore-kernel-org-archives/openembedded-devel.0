Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2qFo-00007P-UW
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 22:40:37 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so253499dak.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 13:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hOqpD3xEBRT+zXDPWBSyqjYOK7H0SVBlu4YeIoqWcd4=;
	b=JIAX3PrLFkKcakEvU7IogXiGz4ovCv+Jfmv2SQgtjCdc+XDtbkWwfiE2+6WpkrmlW3
	upGwIDDiNgrCW3MrW4eWTTOaO6kAlehdZiW3y4ejuTL9w+nkRQZTI9UqVWwba7m2XRlM
	eHNEDDs04oI2mN8AhxdA4+WzuNaHhZ9QAY+7zr7EXeJD+6ZBdWX/me4bQgEUJCq9yHZF
	7ka0eWPtIaopVcEBVhfyxty1dAV/JEAXyoHEl4gvkef/Y/JytD+HRF3bP9CeTssmMlmR
	9IPMx0JoXSnVn5QWNP9n1VwvO5Gcwpiftg8cNnVC3yuy34dODPzAWAgmxb0RBsSdrHzo
	GSXw==
X-Received: by 10.66.87.67 with SMTP id v3mr68219299paz.63.1360099485738;
	Tue, 05 Feb 2013 13:24:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi2sm32173505pab.18.2013.02.05.13.24.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 13:24:44 -0800 (PST)
Date: Tue, 5 Feb 2013 22:24:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205212435.GQ3271@jama>
References: <1360090767-15512-1-git-send-email-mario@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1360090767-15512-1-git-send-email-mario@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] mg: add recipe for version 20110905
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
X-List-Received-Date: Tue, 05 Feb 2013 21:40:38 -0000
X-Groupsio-MsgNum: 43015
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eGLW8NzjjVmDHwQh"
Content-Disposition: inline

--eGLW8NzjjVmDHwQh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2013 at 04:59:27PM -0200, Mario Domenech Goulart wrote:
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  meta-oe/recipes-support/mg/mg_20110905.bb |   21 +++++++++++++++++++++
>  1 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/mg/mg_20110905.bb
>=20
> diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-=
support/mg/mg_20110905.bb
> new file mode 100644
> index 0000000..8d6907e
> --- /dev/null
> +++ b/meta-oe/recipes-support/mg/mg_20110905.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "A portable version of the mg maintained by the OpenBSD =
team"
> +HOMEPAGE =3D "http://homepage.boetes.org/software/mg/"
> +LICENSE =3D "Public Domain"

Please use PD and move LIC_FILES_CHKSUM next to it.

> +DEPENDS =3D "ncurses"
> +SECTION =3D "console/editors"
> +
> +SRC_URI =3D "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "2de35316fa8ebafe6003efaae70b723e"
> +SRC_URI[sha256sum] =3D "1cd37d7e6a3eecc890a5718c38b8f38495057ba93856762a=
756ccee2f9618229"
> +
> +LIC_FILES_CHKSUM =3D "file://version.c;md5=3D811e1b67a5cd60c12b218a2b7c1=
adbf2"
> +
> +do_configure () {
> +    sed -i Makefile.in -e 's,^prefix=3D.*,prefix=3D${prefix},'
> +    ./configure
> +}
> +
> +do_install () {
> +    oe_runmake install DESTDIR=3D${D}
> +}
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

--eGLW8NzjjVmDHwQh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEReJMACgkQN1Ujt2V2gBxiVACfTO4x9aPWhL1pS5F00QfMjNyi
5o4Amwa3z2LzYfsJADF8n77bsV20T6FE
=Pexq
-----END PGP SIGNATURE-----

--eGLW8NzjjVmDHwQh--
