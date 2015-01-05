Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id A76A4601F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:00:03 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id k11so7355690wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aY//+JSq4Rdjf0Szo1IvFXSJuP0b7KWuB+5lQF64FUk=;
	b=bx1nxmaxe6l3keq+qObFKY2kfZT7XKWmGrkc+A90J6fyi2JVwreeKg9eHNgL43YlEp
	mgzG6YH8F+QjGZLVhPd3o3Ba5li3YYSkbJCVjohq2ISxmghPLtItmia8EvvJtGKhTemu
	qKFtT7XfR73d7zflT8golu9vFZQaRz8nUgGhjgnlOy5LJefJNUx6D1uUh2gWrm0xI+x3
	fZyYp3BxrxZvwXtL0xcrKjBQh1jDV0M9KX10YE133AMjYpP8ZBTVVElMS1aq6woZZdiX
	6Q9b+1hKm+d1040kaFL2MoeeWL9/jrXSRnS7vaGCbPSDeMkMbzH2epFjm07Z0aZys87C
	MdXA==
X-Received: by 10.180.82.137 with SMTP id i9mr23999771wiy.38.1420448404230;
	Mon, 05 Jan 2015 01:00:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cs8sm9075697wib.1.2015.01.05.01.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 01:00:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 10:00:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105090004.GB2484@jama>
References: <1420442394-39127-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420442394-39127-2-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420442394-39127-2-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/3] libqb: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 09:00:11 -0000
X-Groupsio-MsgNum: 53611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline

--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 03:19:52PM +0800, leimaohui wrote:
> From: leimh <leimaohui@cn.fujitsu.com>
>=20
> An IPC library for high performance servers
>=20
> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/libqb/libqb_0.17.1.bb | 26 ++++++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libqb/libqb_0.17.1.bb
>=20
> diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb b/meta-oe/rec=
ipes-extended/libqb/libqb_0.17.1.bb
> new file mode 100644
> index 0000000..283f1d1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "An IPC library for high performance servers"
> +DESCRIPTION =3D "libqb is a library with the primary purpose of providin=
g high performance client server reusable features. \
> +It provides high performance logging, tracing, ipc, and poll."
> +
> +HOMEPAGE =3D "https://github.com/clusterlabs/libqb/wiki"
> +
> +SECTION =3D "libs"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "https://fedorahosted.org/releases/q/u/quarterback/libqb-${P=
V}.tar.xz \
> +          "

libqb-${PV} -> ${BP}

> +
> +SRC_URI[md5sum] =3D "5770b343baa4528f6fec90120ec55048"
> +SRC_URI[sha256sum] =3D "7a2115f83bfe20eaa5f2e4ed235e8f2994235d3b87e3e5ca=
41ba47b320f12e29"
> +
> +LICENSE =3D "LGPL-2.1"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D321bf41f280cf805086dd5a720b37=
785"
> +
> +do_configure_prepend() {
> +    ( cd ${S}
> +      ${S}/autogen.sh )
> +}
> +
> +
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqUpQACgkQN1Ujt2V2gBx6XgCeJU2/OUn+vF2CQ7m/nCnxybFP
kswAniOcDdNG00ePhigU1gf3YCsZJUvK
=NH6m
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--
