Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qz32E-0001Mq-M4 for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 10:54:06 +0200
Received: from f053042166.adsl.alicedsl.de ([78.53.42.166]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qz2xa-0006mc-R5 for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 08:49:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 01 Sep 2011 10:48:52 +0200
In-Reply-To: <1314812479-17337-1-git-send-email-tasskjapp@gmail.com>
References: <1314812479-17337-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314866951.20962.4.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2] linux-omap_2.6.39: remove patch that prevented board from resuming from suspend.
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
X-List-Received-Date: Thu, 01 Sep 2011 08:54:06 -0000
X-Groupsio-MsgNum: 33975
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-br3l8lVjg1kaDIuJjKBI"

--=-br3l8lVjg1kaDIuJjKBI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tasslehoff,


Am Mittwoch, den 31.08.2011, 19:41 +0200 schrieb Tasslehoff Kjappfot:
> From: Tasslehoff Kjappfot tasskjapp@gmail.com>
>=20
> Running on a board similar to Beagleboard C3 (but without NAND) I could n=
ot resume from suspend with the patch.
> The console output when suspending was as expected, but neither console i=
nput nor a timer would wake the board.
> Without the patch, everything works as it should.
>=20
> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>

Tasslehoff thank you for sending this iteration (no full stop at the end
of the summary please next time) and thank you Koen for pushing this
[1].

> ---

Next time, please add below the =C2=BB---=C2=AB what you changed in v2 or o=
ther
iterations.

>  recipes/linux/linux-omap_2.6.39.bb |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/linux/linux-omap_2.6.39.bb b/recipes/linux/linux-oma=
p_2.6.39.bb
> index 8370e58..3880aa1 100644
> --- a/recipes/linux/linux-omap_2.6.39.bb
> +++ b/recipes/linux/linux-omap_2.6.39.bb
> @@ -27,7 +27,6 @@ SRC_URI_append =3D " \
>             file://sakoman/0010-Revert-omap2_mcspi-Flush-posted-writes.pa=
tch \
>             file://sakoman/0011-Revert-omap_hsmmc-improve-interrupt-synch=
ronisation.patch \
>             file://sakoman/0012-Don-t-turn-SDIO-cards-off-to-save-power.-=
Doing-so-wi.patch \
> -           file://sakoman/0013-Enable-the-use-of-SDIO-card-interrupts.pa=
tch \
>             file://sakoman/0014-soc-codecs-Enable-audio-capture-by-defaul=
t-for-twl40.patch \
>             file://sakoman/0015-soc-codecs-twl4030-Turn-on-mic-bias-by-de=
fault.patch \
>             file://sakoman/0016-RTC-add-support-for-backup-battery-rechar=
ge.patch \

Koen, do you know why that patch breaks resume? I guess when applying
those you had tested suspend and resume and it worked for you. Maybe we
should contact the patch author [2]?

Additionally should the patch file be removed from the tree too as no
other recipe is using it?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D8deb969=
7d85388af845e1dda193d9149f55b07f5
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/l=
inux-omap-2.6.39/sakoman/0013-Enable-the-use-of-SDIO-card-interrupts.patch?=
id=3D8deb9697d85388af845e1dda193d9149f55b07f5

--=-br3l8lVjg1kaDIuJjKBI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5fRvQACgkQPX1aK2wOHVjL4ACfYr/H3UDXkZPyfmdnoVYL8zrq
eTkAn3CT21jBzAGkY3Yv0aR8QYIf+PxK
=Da6m
-----END PGP SIGNATURE-----

--=-br3l8lVjg1kaDIuJjKBI--
