Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYxi3-0002m4-I8
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 11:29:44 +0100
Received: by eekb15 with SMTP id b15so1470319eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 02:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5VYqlgitoZlh7+238+BsWPSDe18B20g8fa2jlAx767g=;
	b=CE/6+gar+4WNBTyUFagM/3lcxE2QNRHrTHIWlb011uYD3BEk7RT5alEkum3NefBaIb
	rSN/3YzvDkCC4kHaHqzRUnV8/Ut4VsCgB1LwslfuN0mZ8PUQkYdbJKRrJlJCNNJIbSig
	SAaGt+9dhRCx3kIycmdJaA4Tr9oJCs5H4dTcs=
Received: by 10.14.4.9 with SMTP id 9mr569720eei.8.1323426172945;
	Fri, 09 Dec 2011 02:22:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm29382544eeb.4.2011.12.09.02.22.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:22:51 -0800 (PST)
Date: Fri, 9 Dec 2011 11:22:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111209102239.GD3848@jama.jama.net>
References: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-efl 1/2] evas: build in buffer engine and eet loader statically
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
X-List-Received-Date: Fri, 09 Dec 2011 10:29:44 -0000
X-Groupsio-MsgNum: 35990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline

--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2011 at 09:33:21AM +0100, Koen Kooi wrote:
> These two are always needed according to http://trac.enlightenment.org/e/=
wiki/Compilation
>=20
> This should also avoid errors like this:
>=20
> ERR<1829>:ecore_evas ecore_evas_buffer.c:623 ecore_evas_buffer_allocfunc_=
new() evas_engine_info_set() init engine 'buffer' failed.

Looks good

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-efl/recipes-efl/efl/evas.inc |    9 ++++-----
>  1 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl=
/evas.inc
> index 1328309..fd644de 100644
> --- a/meta-efl/recipes-efl/efl/evas.inc
> +++ b/meta-efl/recipes-efl/efl/evas.inc
> @@ -8,7 +8,7 @@ DEPENDS_virtclass-native =3D "freetype-native libxext-nat=
ive libpng-native jpeg-na
>  inherit efl
> =20
>  BBCLASSEXTEND =3D "native"
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>  FILESPATHPKG =3D. "${BPN}-${PV}:${BPN}:"
> =20
>  python populate_packages_prepend () {
> @@ -32,7 +32,6 @@ FILES_${PN}-dbg +=3D "${libdir}/evas/modules/*/*/*/.deb=
ug/"
>  PACKAGES_DYNAMIC =3D "evas-engine-* evas-loader-* evas-saver-*"
> =20
>  RRECOMMENDS_${PN} =3D " \
> -  evas-engine-buffer \
>    evas-engine-fb \
>    evas-engine-software-generic \
>    evas-engine-software-x11 \
> @@ -42,7 +41,6 @@ RRECOMMENDS_${PN} =3D " \
>   \
>    evas-loader-png \
>    evas-loader-jpeg \
> -  evas-loader-eet \
>    evas-loader-gif \
>    evas-loader-svg \
>  "
> @@ -87,13 +85,14 @@ EVAS_OECONF =3D " \
>                  --enable-fb \
>                  --disable-directfb \
>                  --disable-sdl \
> -                --enable-buffer \
> +                --enable-buffer=3Dstatic \
> +                --enable-static-software-generic \
>                  --disable-software-ddraw \
>                  --disable-software-qtopia \
>                  --disable-software-xcb \
>                  --disable-xrender-xcb \
>                  --disable-glitz-x11 \
> -                --enable-image-loader-eet \
> +                --enable-image-loader-eet=3Dstatic \
>                  --disable-image-loader-edb \
>                  --enable-image-loader-png \
>                  --enable-image-loader-jpeg \
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

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7h4W8ACgkQN1Ujt2V2gBzUDgCbBYFCjW+jLZ/lPTXMqwK2dYT0
posAmwWdSCsnjyIuGsLOLwlug/bR5bdb
=NWC2
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
