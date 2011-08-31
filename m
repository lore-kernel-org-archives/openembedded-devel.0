Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QyhrH-0004NQ-T8 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 12:17:23 +0200
Received: from f053046058.adsl.alicedsl.de ([78.53.46.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qyhmd-0001vo-Ox; Wed, 31 Aug 2011 10:12:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 12:12:30 +0200
In-Reply-To: <1314776993-9258-1-git-send-email-tasskjapp@gmail.com>
References: <1314776993-9258-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314785551.3769.28.camel@mattotaupa>
Mime-Version: 1.0
Cc: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Subject: Re: [PATCH] Removed patch that prevented board from waking after suspend
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
X-List-Received-Date: Wed, 31 Aug 2011 10:17:24 -0000
X-Groupsio-MsgNum: 33926
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-sQX8US+z6qVJttD/cZ8p"

--=-sQX8US+z6qVJttD/cZ8p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tasslehoff,


(I am CCing you so you can keep the threading if you still get the daily
digest.)

Thank you for your patch.

Am Mittwoch, den 31.08.2011, 09:49 +0200 schrieb Tasslehoff Kjappfot:

Please read our policies [1]. The commit summary should be

        linux-omap_2.6.39: Remove patch that prevented board from waking up=
 after suspend

(=C2=BBresume=C2=AB would be even a better word.)

Additionally could you please add more information about the issue. Did
you get any error message. Do you know the cause, why the patch prevents
to resume correctly?

Please resend the patch as described in our Wiki [2].

> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
> ---
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


Thanks,

Paul


[1] http://openembedded.org/index.php/Category:Policy
[2] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

--=-sQX8US+z6qVJttD/cZ8p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5eCQ4ACgkQPX1aK2wOHViEuACfQdDeDPXFzLZHR0G9sct/yWSy
WeQAnAnajtyzeASuSRqAFOONiKMeCOYO
=NPWf
-----END PGP SIGNATURE-----

--=-sQX8US+z6qVJttD/cZ8p--
