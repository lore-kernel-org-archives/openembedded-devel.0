Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTs2P-0005eN-Rx for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 10:53:25 +0200
Received: from f053039014.adsl.alicedsl.de ([78.53.39.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTrzy-000100-Cl; Tue, 07 Jun 2011 08:50:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF02E499@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF02E499@MBX20.4emm.local>
Date: Tue, 07 Jun 2011 10:50:04 +0200
Message-ID: <1307436604.4064.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: James Limbouris <james@digitalmatter.com.au>
Subject: Re: [PATCH] Modified populate-volatile.sh to atomically update volatile.cache, to avoid power loss issues. Signed-off-by: jameslimbouris <james@digitalmatter.com.au>
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
X-List-Received-Date: Tue, 07 Jun 2011 08:53:25 -0000
X-Groupsio-MsgNum: 32535
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ftDrh0pu8SX6oqXJxfb7"

--=-ftDrh0pu8SX6oqXJxfb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear James,


thank you for your patch.

I am also putting you into CC not knowing if you read the list
regularly. (I am reading the list.)

Am Dienstag, den 07.06.2011, 02:58 +0000 schrieb James Limbouris:

please resend your patch [2], as the commit message ended up in the
subject line/commit summary. Please also prefix the commit summary with
the recipe name [1] and format your name correctly in the Signed-off-by
line. You can take the following one as a starting point and please
adapt/improve it.

8<-------------------------------------------------------------------->8
initscripts: Modify `populate-volatile.sh` to atomically update `volatile.c=
ache`

When power is lost during boot it could happen that
`/etc/volatile.cache` is written too and lays around during the next
boot causing the following problems.

Using a temporary file and renaming it at once avoids those issues.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
8<-------------------------------------------------------------------->8

> ---
>  .../initscripts-1.0/populate-volatile.sh           |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes/initscripts/initscripts-1.0/populate-volatile.sh b/r=
ecipes/initscripts/initscripts-1.0/populate-volatile.sh
> index 3bb3d94..e355680 100755
> --- a/recipes/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/recipes/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -14,7 +14,7 @@ create_file() {
>  	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- fo=
r -$1-.\" >/dev/tty0 2>&1;=20
>  	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >=
/dev/tty0 2>&1 "=20
> =20
> -	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.=
cache
> +	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.=
cache.build
> =20
>  	[ -e "$1" ] && {
>  	  [ "${VERBOSE}" !=3D "no" ] && echo "Target already exists. Skipping."
> @@ -29,7 +29,7 @@ mk_dir() {
>  	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- fo=
r -$1-.\" >/dev/tty0 2>&1;=20
>  	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >=
/dev/tty0 2>&1 "
> =20
> -	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.=
cache
> +	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.=
cache.build
>  =09
>  	[ -e "$1" ] && {
>  	  [ "${VERBOSE}" !=3D "no" ] && echo "Target already exists. Skipping."
> @@ -41,7 +41,7 @@ mk_dir() {
>  link_file() {
>  	EXEC=3D"test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1"=
=20
> =20
> -	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "	$EXEC" >> /etc/volatile=
.cache
> +	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "	$EXEC" >> /etc/volatile=
.cache.build
>  =09
>  	[ -e "$2" ] && {
>  	  echo "Cannot create link over existing -${TNAME}-." >&2
> @@ -164,8 +164,10 @@ if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_=
CACHE" =3D "yes" -a "x$1" !=3D "
>  then
>  	sh /etc/volatile.cache
>  else=09
> -	rm -f /etc/volatile.cache
> +	rm -f /etc/volatile.cache /etc/volatile.cache.build
>  	for file in `ls -1 "${CFGDIR}" | sort`; do
>  		apply_cfgfile "${CFGDIR}/${file}"
>  	done
> +=09
> +	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.buil=
d /etc/volatile.cache
>  fi

Does not `/etc/volatile.cache.build` need to be removed during the next
boot up?


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

--=-ftDrh0pu8SX6oqXJxfb7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3t5jcACgkQPX1aK2wOHVj5nwCgg3wJv5QO9dPieemhE+zZ2zJV
cA0An2JTWe8Fydhcbabtf3HKUfzz2RER
=QTCb
-----END PGP SIGNATURE-----

--=-ftDrh0pu8SX6oqXJxfb7--
