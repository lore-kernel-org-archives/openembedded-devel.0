Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrVeP-0005c2-Vi for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 13:13:34 +0100
Received: from f053036046.adsl.alicedsl.de ([78.53.36.46]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrVbV-0002Eq-Hw for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 12:10:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Tue, 16 Mar 2010 13:10:32 +0100
Message-ID: <1268741432.3701.32.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Tue, 16 Mar 2010 12:13:34 -0000
X-Groupsio-MsgNum: 17729
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-wDNrusTEuGd6fp63K6iy"

--=-wDNrusTEuGd6fp63K6iy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 16.03.2010, 12:42 +0100 schrieb Enrico Scholz:
> This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
> this patch, it is possible to do
>=20
> | EXTRA_OECONF =3D "--with-build-cflags=3D'${BUILD_CFLAGS}'"
>=20
> where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.
>=20
> Such flags can be also passed to oe_runconf() directly:
>=20
> | oe_runconf --with-build-cflags=3D"${BUILD_CFLAGS}"
>=20
> This patch might create incompatibilities for recipes which workaround th=
e
> current limitations.
>=20
> As a sideeffect, 'set -x' debug output is now much nicer because
> superflous whitespaces in the configure call are removed.

Why did not it work before? (Sorry, I do not know much about shell
scripting.)

> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  classes/autotools.bbclass |   11 +++++------
>  1 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index c53583b..508bd58 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -40,7 +40,7 @@ def autotools_set_crosscompiling(d):
> =20
>  oe_runconf () {
>  	if [ -x ${S}/configure ] ; then
> -		cfgcmd=3D"${S}/configure \
> +		set -- ${S}/configure \
>  		    --build=3D${BUILD_SYS} \
>  		    --host=3D${HOST_SYS} \
>  		    --target=3D${TARGET_SYS} \
> @@ -57,11 +57,10 @@ oe_runconf () {
>  		    --includedir=3D${includedir} \
>  		    --oldincludedir=3D${oldincludedir} \
>  		    --infodir=3D${infodir} \
> -		    --mandir=3D${mandir} \
> -			${EXTRA_OECONF} \
> -		    $@"
> -		oenote "Running $cfgcmd..."
> -		$cfgcmd || oefatal "oe_runconf failed"=20
> +		    --mandir=3D${mandir}	\

You added a white space before the =C2=BB\=C2=AB so the diff is bigger as n=
eeded.

> +		    ${EXTRA_OECONF} "$@"
> +		oenote "Running $*..."
> +		"$@" || oefatal "oe_runconf failed"
>  	else
>  		oefatal "no configure script found"
>  	fi


Thanks,

Paul

--=-wDNrusTEuGd6fp63K6iy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkufdTgACgkQPX1aK2wOHVi/1wCff1kRtyborXTZqb9MeObC08bL
YVgAnR4ZYCe75grseP+xrOY70441TpVG
=m4oy
-----END PGP SIGNATURE-----

--=-wDNrusTEuGd6fp63K6iy--
