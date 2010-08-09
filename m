Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiRh1-0003HM-QI for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 14:43:04 +0200
Received: from f053041140.adsl.alicedsl.de ([78.53.41.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiRgu-0005x1-Bq for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 12:42:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6B@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6B@deimsg40.de.net.world>
Date: Mon, 09 Aug 2010 14:42:54 +0200
Message-ID: <1281357774.3767.34.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2 2/2] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Mon, 09 Aug 2010 12:43:04 -0000
X-Groupsio-MsgNum: 22000
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ebmHYuXQfsdw6oPclvqd"

--=-ebmHYuXQfsdw6oPclvqd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.08.2010, 14:19 +0200 schrieb Hauser, Wolfgang (external):
> busybox: revision change

(Please also adapt the message subject to the commit summary.)

But this will not be necessary, as I overlooked that this is the only
change. To get packages rebuild, when something changes (your patch 1/2)
such changes should be incorporated into the changes.

So please squash this patch. (`git rebase -i HEAD~4`, where =C2=BB4=C2=AB i=
s the
number on how many commits you have to go back.)

> Signed-off-by: Wolfgang Hauser <wolfgang.hauser.external@eads.com>
> ---
>  recipes/busybox/busybox.inc       |    2 +-
>  recipes/busybox/busybox_1.16.2.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index b4663f0..f77613e 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE =3D "GPLv2"
>  SECTION =3D "base"
>  PRIORITY =3D "required"
> =20
> -INC_PR =3D "r32"
> +INC_PR =3D "r33"
> =20
>  SRC_URI =3D "\
>    file://busybox-cron \
> diff --git a/recipes/busybox/busybox_1.16.2.bb
> b/recipes/busybox/busybox_1.16.2.bb
> index 6401bfa..0e6a250 100644
> --- a/recipes/busybox/busybox_1.16.2.bb
> +++ b/recipes/busybox/busybox_1.16.2.bb
> @@ -1,5 +1,5 @@
>  require busybox.inc
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"

That is not necessary as increasing of the INC_PR will have the PR
increased along the way.

[=E2=80=A6]

I am sorry and I hope the formal stuff will be alright when you
resubmit. (Should be v3.)


Thanks,

Paul

--=-ebmHYuXQfsdw6oPclvqd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxf984ACgkQPX1aK2wOHVgZlgCfZiZV4Mw7Rgdk3hCy8cuH58tb
5EIAmwVCgVMj0nCwQoq6rHH2j3apmgCN
=KkHY
-----END PGP SIGNATURE-----

--=-ebmHYuXQfsdw6oPclvqd--
