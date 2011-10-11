Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RDdSw-0007xB-1d for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 16:37:58 +0200
Received: from f053040232.adsl.alicedsl.de ([78.53.40.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RDdNV-00074P-2e; Tue, 11 Oct 2011 14:32:21 +0000
Message-ID: <1318343515.14384.8.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 16:31:55 +0200
In-Reply-To: <1318324122-16951-1-git-send-email-vitap@ti.com>
References: <1318324122-16951-1-git-send-email-vitap@ti.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
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
X-List-Received-Date: Tue, 11 Oct 2011 14:37:58 -0000
X-Groupsio-MsgNum: 34635
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Q2SG22psPGDAJGM9dPRU"

--=-Q2SG22psPGDAJGM9dPRU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vita,


thank you for your patch.

Am Dienstag, den 11.10.2011, 11:08 +0200 schrieb Vita Preskovsky:

Using

        bluez4: Add version 4.95

as the commit summary would be cleaner. Use `git commit --amend` to
change that.

Additionally you should elaborate more in the commit message what the
patch is doing.

1. Have you tested it? Is it just an upgrade because of or does version
4.91 in the repository have any short comings so that it should be
removed?

> Signed-off-by: Vita Preskovsky <vitap@ti.com>
> ---
>  recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/bluez/bluez4_4.95.bb
>=20
> diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb
> new file mode 100644
> index 0000000..a682d6a
> --- /dev/null
> +++ b/recipes/bluez/bluez4_4.95.bb
> @@ -0,0 +1,30 @@
> +require bluez4.inc
> +SRC_URI =3D "\
> +  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \

2. As far as I know kernel.org after the compromise presently does not
provide that archive. So the recipe will not build unless there is a
mirror somewhere. Do you know of a mirror?

> +  file://bluetooth.conf \
> +"
> +
> +SRC_URI[md5sum] =3D "341294b2849a04a4afff5c96bfbf30b2"
> +SRC_URI[sha256sum] =3D "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0c=
e6bebd27fa4120f6"
> +
> +DEFAULT_PREFERENCE =3D "-1"

3. Why?

> +DEFAULT_PREFERENCE_angstrom =3D "1"

4. Have you talked to the =C8=A6ngstr=C3=B6m maintainers?

> +
> +DEPENDS +=3D "libsndfile1"
> +
> +PR =3D "${INC_PR}.0"
> +
> +# Not all distros have a recent enough udev
> +BTUDEV =3D " --disable-udevrules"
> +BTUDEV_angstrom =3D " --enable-udevrules"
> +BTUDEV_shr =3D " --enable-udevrules"
> +
> +EXTRA_OECONF +=3D "${BTUDEV}"
> +do_configure_append(){
> +	echo "#define LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> ${S}/conf=
ig.h
> +}
> +
> +FILES_${PN}-dbg +=3D "\
> +  ${base_libdir}/udev/.debug \
> +  ${libdir}/*/.debug \
> +"

Otherwise this recipe looks good. Is it planned for branch
2011.03-maintenance?


Thanks,

Paul

--=-Q2SG22psPGDAJGM9dPRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6UU1sACgkQPX1aK2wOHVg1BACfTOMvNdT24lbO9mmWekrwapRN
kY8An3y4ROZd+gyhtlbJY4h40kWsSYjB
=FoxH
-----END PGP SIGNATURE-----

--=-Q2SG22psPGDAJGM9dPRU--
