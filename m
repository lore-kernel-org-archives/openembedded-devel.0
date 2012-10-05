Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK7Ap-0003Mt-CT
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 14:38:35 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so459639wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HqJsQofzjCyKUZyvOsP9Fe85tTd1IYoGrocEQ/RRRus=;
	b=OTpsuLIH7OogEHrvIKrtnLnfZetsDzPjy3X6/pY9H8T0U84hRabdYotpP1rPK+3Z6t
	y2nURGz167MNNf5FYBgOBM2DJZHpzrmtmEp5f2o9k5torynNeWKV7c2GKA8f9IDM3Y8p
	m9PH6mweXR/jHobdI+hje6iIy0AQwhjcAEGRks45FH4gWOv7zH7Lg+Row3D52HcMsxtR
	sMzVIKIp9LrTH2IPQAg2HeF9HvKZQ5bdRHiVh7lUXgOXHxusAxIPhsPzaxmwr/491XPr
	NeyhfdLQwOeYt83XMLrCQLGDbga26/62FlzNconrSLI0sJ/cmyZ+7oNJyPKy5EkqTcHq
	rNgA==
Received: by 10.180.24.4 with SMTP id q4mr3041982wif.19.1349439933140;
	Fri, 05 Oct 2012 05:25:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm2399395wib.10.2012.10.05.05.25.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:25:31 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:25:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121005122535.GB3542@jama.jama.net>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
	<1349323389-16520-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1349323389-16520-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/9] libav: Convert to use dynamic packages to split libraries
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
X-List-Received-Date: Fri, 05 Oct 2012 12:38:35 -0000
X-Groupsio-MsgNum: 40934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 04, 2012 at 01:03:01AM -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-multimedia/libav/libav.inc |   76 ++++++++++++----------=
------
>  1 files changed, 33 insertions(+), 43 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes=
-multimedia/libav/libav.inc
> index fc0b021..21b57b7 100644
> --- a/meta-oe/recipes-multimedia/libav/libav.inc
> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
> @@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET =3D "arm"
>  # faac faad2 lame schroedinger libgsm
>  DEPENDS =3D "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@ba=
se_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
> =20
> +PACKAGES_DYNAMIC =3D "lib*"

Please limit this a bit

NOTE: multiple providers are available for runtime libpurple-protocol-msn (=
libav, pidgin)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-proto=
col-msn
NOTE: multiple providers are available for runtime libpurple-protocol-icq (=
libav, pidgin)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-proto=
col-icq
NOTE: multiple providers are available for runtime libpurple-plugin-ssl-gnu=
tls (libav, pidgin)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-plugi=
n-ssl-gnutls
NOTE: multiple providers are available for runtime libpurple-protocol-irc (=
libav, pidgin)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-proto=
col-irc
NOTE: multiple providers are available for runtime libpurple-protocol-xmpp =
(libav, pidgin)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-proto=
col-xmpp

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBu0b8ACgkQN1Ujt2V2gBwqNwCfVXIfF75/6Z3tQy2rj+UojjNz
z2kAn3W2u1B6fAIkA2NGspWLMoKQz/l6
=wyda
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
