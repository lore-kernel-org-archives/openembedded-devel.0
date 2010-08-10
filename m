Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oin6H-0004E2-OY for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 13:34:34 +0200
Received: from f053040061.adsl.alicedsl.de ([78.53.40.61]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oin69-0004QL-Be for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 11:34:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281379938-24296-1-git-send-email-jkridner@beagleboard.org>
References: <1281379938-24296-1-git-send-email-jkridner@beagleboard.org>
Date: Tue, 10 Aug 2010 13:34:22 +0200
Message-ID: <1281440062.3888.5.camel@mattotaupa>
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
Subject: Re: [PATCH] angstrom-uboot-scripts: debugged beagleboard validation boot/user scripts
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
X-List-Received-Date: Tue, 10 Aug 2010 11:34:35 -0000
X-Groupsio-MsgNum: 22044
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xuk2pcD32efukTfc8Pva"

--=-xuk2pcD32efukTfc8Pva
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.08.2010, 13:52 -0500 schrieb Jason Kridner:
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>

[=E2=80=A6]

I know this has already been committed in
9eab7a12e4a94efbb53e5e43beeb67d15ae9eab5 [1].

But I do not like the commit summary. Is this script developed in a
repository somewhere else? Maybe put a link to the revision there.

> ---
>  recipes/angstrom/angstrom-uboot-scripts.bb         |    2 +-
>  .../beagleboard-validation-boot.cmd                |   15 +++++++-------=
-
>  .../beagleboard-validation-user.cmd                |   15 +++++++-------=
-
>  3 files changed, 15 insertions(+), 17 deletions(-)

[=E2=80=A6]
=20
> diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validati=
on-boot.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validatio=
n-boot.cmd
> index 50a82a6..71d314c 100644
> --- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot=
.cmd
> +++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot=
.cmd
> @@ -1,14 +1,13 @@
> -setenv dvimode 'hd720'
> -setenv vram '16M omapfb.vram=3D0:8M,1:4M,2:4M'
> +# On xM: bootargs=3Dconsole=3DttyS2,115200n8 mem=3D80M@0x80000000 mem=3D=
384M@0x88000000 mpurate=3D1000 buddy=3Dnone camera=3Dlbcm3m1 vram=3D16M oma=
pfb.vram=3D0:8M,1:4M,2:4M omapfb.mode=3Ddvi:hd720 omapdss.def_disp=3Ddvi ro=
ot=3D/dev/mmcblk0p2 rw rootfstype=3Dext3 rootwait
> +mmc init
> +setenv dvimode hd720
> +setenv vram 16M omapfb.vram=3D0:8M,1:4M,2:4M

Also a note would have been nice, why the =C2=BB'=C2=AB were removed.

[=E2=80=A6]


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9eab7a1=
2e4a94efbb53e5e43beeb67d15ae9eab5

--=-xuk2pcD32efukTfc8Pva
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxhOTEACgkQPX1aK2wOHVjNbACfc539vo7VWIbMN2KGvG2pqJ9G
8LYAn1h+58SfTA/AsZXbwclbDi5HUwXV
=whlX
-----END PGP SIGNATURE-----

--=-xuk2pcD32efukTfc8Pva--
