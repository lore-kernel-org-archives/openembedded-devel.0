Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 366FE7274C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 12:47:17 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so24112444wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=spaDullEuFOp66VyOd50gEWikUhTmhkvErZX0SEAu5Q=;
	b=GHZpx4RuN52dGdmLInVyCtzip6Xcc/OWuMsMjfljWpCcQiRjxiZHtrrbSOFGbQ0x+t
	q3j4wB6IvQ9q/aeKffExQQ7RSAUVtjEdDkRBccyG3yjTw8CH206E54V2pg4bIocReLxD
	RTPNIXOhqohX+ejKty4XP7WmLctC6Gph+OXdrHqsshbLn1xnHQPdr+QJS2sFZ5jcBwJX
	OSZaS227T45YjxOdunwvBg9LpQHlJRmTSKsT4J+ZHWMXJaZK6GrvMR/ONJz1gyu3vBso
	3ESuQ82gz+7Y38A1kIiDFf0GDcBWdN1/2ScebuBxzx6b5cNWk41B/b9XH+qxCjww6cII
	gY/Q==
X-Received: by 10.180.7.201 with SMTP id l9mr130866163wia.80.1420202838027;
	Fri, 02 Jan 2015 04:47:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wz5sm64517125wjc.29.2015.01.02.04.47.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 04:47:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Jan 2015 13:47:21 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150102124721.GG2469@jama>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
	<3f651d7b200c06d29a1e236f613d2f8f745a5a03.1420190530.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <3f651d7b200c06d29a1e236f613d2f8f745a5a03.1420190530.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 06/11] uw-imap: make libpam dependency dependent on DISTRO_FEATURES
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
X-List-Received-Date: Fri, 02 Jan 2015 12:47:20 -0000
X-Groupsio-MsgNum: 53564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline

--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 02, 2015 at 09:32:01AM +0000, Paul Eggleton wrote:
> If pam is not in DISTRO_FEATURES, we shouldn't be building it.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/=
recipes-devtools/uw-imap/uw-imap_2007f.bb
> index e1a9877..867c2d0 100644
> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> @@ -4,7 +4,7 @@ SECTION =3D "devel"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da6a4ddbb7cd2999f6827ee143=
f6fcd97"
> =20
> -DEPENDS =3D "openssl libpam"
> +DEPENDS =3D "openssl"
> =20
>  SRC_URI =3D "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
>             file://quote_cctype.patch \
> @@ -17,13 +17,17 @@ SRC_URI[sha256sum] =3D "53e15a2b5c1bc80161d42e9f69792=
a3fa18332b7b771910131004eb520
> =20
>  S =3D "${WORKDIR}/imap-${PV}"
> =20
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)}"
> +PACKAGECONFIG[pam] =3D ",,libpam"
> +
> +#EXTRA_OEMAKE =3D "CC=3D'${CC}' ${@bb.utils.contains('PACKAGECONFIG', 'p=
am', '', 'PAMLDFLAGS=3D CHECKPW=3Dpsx', d)}"

^ is this needed to prevent autodetecting it from sysroot?

>  EXTRA_OEMAKE =3D "CC=3D'${CC}'"
> =20
>  HEADERS =3D "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-clie=
nt/linkage.c c-client/linkage.h c-client/osdep.h"
> =20
>  do_compile() {
>      echo "SSLINCLUDE=3D${STAGING_INCDIR} SSLLIB=3D${STAGING_LIBDIR}" > $=
{S}/SPECIALS
> -    oe_runmake lnp
> +    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'lnp', 'slx'=
, d)}
>  }
> =20
>  do_install() {
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSmk1kACgkQN1Ujt2V2gBxsPACgmavGtW7t3B1y/FYzEGegI43f
e6wAni1+3wsvM8V7nwPCEQ0qEuEanQ+6
=db8G
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
