Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R480O-0001Et-VQ for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:13:13 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R47vX-00039W-Dk for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 09:08:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:08:02 +0200
In-Reply-To: <1316012106-10277-1-git-send-email-sledz@dresearch-fe.de>
References: <1316010999.6686.108.camel@mattotaupa>
	<1316012106-10277-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316077683.4523.13.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Thu, 15 Sep 2011 09:13:13 -0000
X-Groupsio-MsgNum: 34240
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-mTSfi+vdGQhtszJzid22"

--=-mTSfi+vdGQhtszJzid22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 14.09.2011, 16:55 +0200 schrieb Steffen Sledz:

Please amend the commit before pushing to replace =C2=BBnewer=C2=AB with =
=C2=BB>=3D 3.82=C2=AB
and the typo below.

> GNU make >=3D 3.82 does not allow mixed implicit and normal rules
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/eglibc/eglibc-2.9/make-3.82.patch |   27 +++++++++++++++++++++++=
++++
>  recipes/eglibc/eglibc_2.9.bb              |    3 ++-
>  2 files changed, 29 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/eglibc/eglibc-2.9/make-3.82.patch
>=20
> diff --git a/recipes/eglibc/eglibc-2.9/make-3.82.patch b/recipes/eglibc/e=
glibc-2.9/make-3.82.patch
> new file mode 100644
> index 0000000..64cb270
> --- /dev/null
> +++ b/recipes/eglibc/eglibc-2.9/make-3.82.patch
> @@ -0,0 +1,27 @@
> +eglibc-2.9: allow building with newer GNU make
> +   =20
> +GNU make >=3D 3.82 does not allow mixed implicit and normal rules
> +
> +Because eglibc-2.9 is superseeded by newer versions it makes no sense

s/superseeded/superseded/

(I always make the same mistake.)

> +to submit this patch upstream.
> +
> +Upstream-Status: Inappropriate [other]
> +
> +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> +
> +diff -Nurd libc.orig//manual/Makefile libc/manual/Makefile
> +--- libc.orig//manual/Makefile	2011-09-13 14:49:57.428424088 +0200
> ++++ libc/manual/Makefile	2011-09-13 14:50:47.009620484 +0200

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-mTSfi+vdGQhtszJzid22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5xwHIACgkQPX1aK2wOHVgragCfRgtqQTwHseCMBxcEzag6RCT/
MgUAn16HnrgzjMgNiekMGnVg4/SxMtdc
=2rXA
-----END PGP SIGNATURE-----

--=-mTSfi+vdGQhtszJzid22--
