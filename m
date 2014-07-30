Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2675365DB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:52:28 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so7351450wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U60SlTVbJpQldqI1gOUB5fn+JnXivE336HM0Ec9UPK0=;
	b=wXqP9odxJ+Hzibf6RjofImKJT1GuOK/8J+PwQdJrW1YII3o7phYVYAKoQ+mRU7aAjC
	Ltlrh7o3salIdlVGVZVK7ONAwi58RRhKuf+4fBQ1Ln0da+htMny3Dh+IvGdhUr/XLLk0
	PdGhenE3FhpEg0MhxC3seWrd9JiqC4eF50OcLAaSaWXeUuFZb3gO7iQVDe+0erak2JzY
	bsC6P/0xID0O79afNDu2foLRguOONCJw4/VTmRbK+0J49kL1x2csTvgyCHJQyHUE2zLN
	lWIsqGAlRYmf4axUIAeHNy6dvwRTi9faWA+HGQBHj7TMsU+KRoRcTNtDHM5U+QH5UUQh
	y4AA==
X-Received: by 10.180.80.133 with SMTP id r5mr5747261wix.62.1406717549789;
	Wed, 30 Jul 2014 03:52:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	rw4sm4622184wjb.44.2014.07.30.03.52.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 03:52:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 12:52:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730105252.GM16445@jama>
References: <1406706254-7799-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1406706254-7799-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2][meta-python] python-slip-dbus: add recipe
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
X-List-Received-Date: Wed, 30 Jul 2014 10:52:31 -0000
X-Groupsio-MsgNum: 51320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVcb4xucqmsYUpQy"
Content-Disposition: inline

--kVcb4xucqmsYUpQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 03:44:13PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../python/python-slip-dbus_0.6.0.bb               |   27 ++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-python/recipes-python/python/python-slip-dbus_0.=
6.0.bb
>=20
> diff --git a/meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb =
b/meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb
> new file mode 100644
> index 0000000..d091336
> --- /dev/null
> +++ b/meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Convenience functions for dbus services in Python 2.x"
> +HOMEPAGE =3D "http://nphilipp.fedorapeople.org/python-slip/"
> +DESCRIPTION =3D "\
> +The Simple Library for Python 2.x packages contain miscellaneous code fo=
r \
> +convenience, extension and workaround purposes. \
> +\
> +This package provides slip.dbus.service.Object, which is a dbus.service.=
Object \
> +derivative that ends itself after a certain time without being used and/=
or if \
> +there are no clients anymore on the message bus, as well as convenience \
> +functions and decorators for integrating a dbus service with PolicyKit."
> +
> +SECTION =3D "devel/python"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb=
018"
> +SRCNAME =3D "python-slip"
> +
> +SRC_URI =3D "https://fedorahosted.org/released/python-slip/${SRCNAME}-${=
PV}.tar.bz2"

I've replaced also 2nd "python-slip" with ${SRCNAME} and I've moved both
new recipes to recipes-devtools when cherry-picking this to master-next.

> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +SRC_URI[md5sum] =3D "fb3299d75af1a67ca6679d96ce839da6"
> +SRC_URI[sha256sum] =3D "f47361ec52b608309b83c71905e692b6b363eaf3b8a7afde=
ff866cd94463ad5c"
> +
> +do_compile_prepend() {
> +    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
> +}
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kVcb4xucqmsYUpQy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYzoQACgkQN1Ujt2V2gBxj7ACfd2/WfgtFWH/KwPSxzo4/iQjI
EYMAnj2U5XVdcxfZjTEbD5Ri8mQUXIeR
=Tpdi
-----END PGP SIGNATURE-----

--kVcb4xucqmsYUpQy--
