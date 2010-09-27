Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P09ip-0002iQ-0t for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 11:10:07 +0200
Received: from f053041104.adsl.alicedsl.de ([78.53.41.104]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P09ih-0002O4-0o for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 09:09:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285456353-27457-13-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
	<1285456353-27457-13-git-send-email-raj.khem@gmail.com>
Date: Mon, 27 Sep 2010 11:09:57 +0200
Message-ID: <1285578597.11101.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 12/12] netbase: Add interface information for qemumips64 and qemumips64el
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
X-List-Received-Date: Mon, 27 Sep 2010 09:10:08 -0000
X-Groupsio-MsgNum: 24040
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-B+mwS56uPLo52PMVY2a1"

--=-B+mwS56uPLo52PMVY2a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


Am Samstag, den 25.09.2010, 16:12 -0700 schrieb Khem Raj:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/netbase/netbase/qemumips64/interfaces   |   13 +++++++++++++
>  recipes/netbase/netbase/qemumips64el/interfaces |   13 +++++++++++++
>  2 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/netbase/netbase/qemumips64/interfaces
>  create mode 100644 recipes/netbase/netbase/qemumips64el/interfaces
>=20
> diff --git a/recipes/netbase/netbase/qemumips64/interfaces b/recipes/netb=
ase/netbase/qemumips64/interfaces
> new file mode 100644
> index 0000000..1c6955e
> --- /dev/null
> +++ b/recipes/netbase/netbase/qemumips64/interfaces
> @@ -0,0 +1,13 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> +=20
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Wired or wireless interfaces
> +auto eth0
> +iface eth0 inet static
> +	address 192.168.1.107
> +	netmask 255.255.255.0
> +	network 192.168.1.264
> +	gateway 192.168.1.254
> diff --git a/recipes/netbase/netbase/qemumips64el/interfaces b/recipes/ne=
tbase/netbase/qemumips64el/interfaces
> new file mode 100644
> index 0000000..63a360b
> --- /dev/null
> +++ b/recipes/netbase/netbase/qemumips64el/interfaces
> @@ -0,0 +1,13 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> +=20
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Wired or wireless interfaces
> +auto eth0
> +iface eth0 inet static
> +	address 192.168.1.108
> +	netmask 255.255.255.0
> +	network 192.168.1.264
> +	gateway 192.168.1.254

is there a way to share one interfaces file for all qemu configurations?

If not, then this patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-B+mwS56uPLo52PMVY2a1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkygX2UACgkQPX1aK2wOHVirLgCffDuY9/XNAKAHmBUgcB1J15b0
5+8AnjlphpSCTVkQeKD2nLdCR0LqkfYL
=Uoh5
-----END PGP SIGNATURE-----

--=-B+mwS56uPLo52PMVY2a1--
