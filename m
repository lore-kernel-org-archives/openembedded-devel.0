Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyRV-0007or-Ac
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:39:22 +0100
Received: by mail-da0-f48.google.com with SMTP id p8so2151878dan.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WP4plzNvHoLn9K0wklhps2as2VBrTH6E6x6ExthNRUk=;
	b=aOsgE/x6GQz0u0B0DYcBgGKVmpJ9/ArxInghdPvIjYBGOM0Zz20/fQtaGynLtUxS4a
	fjkN38teXQx5FvNPyvkEK48ZcDwlQBj3yCicwu9C7BCLWtZpy657A4GNhfWnPOB9/mII
	XgxAs4G2XJBh0QUrhXTJ6k+8pPPk2bdhXcSg5wIasoUSYIn99mJ2jOkvN4CC3Fw/+Qvr
	PaRFxfIm8+6+sXlUgaPe7Hav1Hs/PMna2k3X8nk3qQMLm+8bwxfi8SVLRq5oRltKeV8F
	8O4B2GhC+Qk+J3ELXxStP9REXOf6Qr5yk3SpgpGfG3eolCRwamZet7ANI7sjEvWYb7hA
	P3vw==
X-Received: by 10.68.134.227 with SMTP id pn3mr1543596pbb.90.1363944146994;
	Fri, 22 Mar 2013 02:22:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id lb8sm2274924pab.13.2013.03.22.02.22.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:22:25 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:22:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092218.GL3219@jama>
References: <1363279557-5861-1-git-send-email-stefan@herbrechtsmeier.net>
MIME-Version: 1.0
In-Reply-To: <1363279557-5861-1-git-send-email-stefan@herbrechtsmeier.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libtinyxml: Add native support and use relative paths
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
X-List-Received-Date: Fri, 22 Mar 2013 09:39:22 -0000
X-Groupsio-MsgNum: 43653
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NPWyolIJAVLYbHY6"
Content-Disposition: inline

--NPWyolIJAVLYbHY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2013 at 05:45:57PM +0100, Stefan Herbrechtsmeier wrote:
> Replace CXXFLAGS +=3D "-fPIC" with EXTRA_CXXFLAGS to allow native
> build and use relative paths to simplify recipe.

Applied, thanks!

>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
> ---
>  .../recipes-support/libtinyxml/libtinyxml_2.6.2.bb |   18 ++++++++++----=
----
>  1 files changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/met=
a-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> index fdadebd..8670fac 100644
> --- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> +++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> @@ -16,20 +16,21 @@ SRC_URI[sha256sum] =3D "15bdfdcec58a7da30adc87ac2b078=
e4417dbe5392f3afb719f9ba6d062
> =20
>  S =3D "${WORKDIR}/tinyxml"
> =20
> -CXXFLAGS +=3D "-fPIC"
> +EXTRA_CXXFLAGS =3D "-I. -fPIC"
> =20
>  do_compile() {
> -    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxml.o ${S}/tinyxml.cpp
> -    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlerror.o ${S}/tinyxmlerro=
r.cpp
> -    ${CXX} ${CXXFLAGS} -I${S} -c -o ${S}/tinyxmlparser.o ${S}/tinyxmlpar=
ser.cpp
> +    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml.o tinyxml.cpp
> +    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxmlerror.o tinyxmlerr=
or.cpp
> +    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxmlparser.o tinyxmlpa=
rser.cpp
>      ${CXX} ${CXXFLAGS} \
>              -shared \
>              -Wl,-soname,libtinyxml.so.${PV} \
> -            -o ${S}/libtinyxml.so.${PV} \
> +            -o libtinyxml.so.${PV} \
>              ${LDFLAGS} \
> -            ${S}/tinyxml.o \
> -            ${S}/tinyxmlparser.o \
> -            ${S}/tinyxmlerror.o
> +            tinyxml.o \
> +            tinyxmlparser.o \
> +            tinyxmlerror.o
> +
>  }
> =20
>  do_install() {
> @@ -41,3 +42,4 @@ do_install() {
>      install -m 0644 ${S}/tinyxml.h ${D}${includedir}
>  }
> =20
> +BBCLASSEXTEND +=3D "native"
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

--NPWyolIJAVLYbHY6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIsoACgkQN1Ujt2V2gBxmSgCePZ3LNj3svLbontDZHwiQ26OL
I7QAoK2FwT3vEZIBZk1WP5iVcioQdeTo
=LZFs
-----END PGP SIGNATURE-----

--NPWyolIJAVLYbHY6--
