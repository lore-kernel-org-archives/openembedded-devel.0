Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PGq7H-0001Sg-P2 for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 10:40:49 +0100
Received: from f053037250.adsl.alicedsl.de ([78.53.37.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PGq6L-00061j-46 for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 09:39:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1289521460-13782-1-git-send-email-angelox.123@gmail.com>
References: <angelox.123@gmail.com>
	<1289521460-13782-1-git-send-email-angelox.123@gmail.com>
Date: Fri, 12 Nov 2010 10:39:19 +0100
Message-ID: <1289554759.4282.19.camel@mattotaupa>
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
Subject: Re: [PATCH] metano.conf - Added on image file name the IMAGE_BASENAME
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
X-List-Received-Date: Fri, 12 Nov 2010 09:40:49 -0000
X-Groupsio-MsgNum: 26083
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mNIBQJp7fx+Tap9ML1CJ"

--=-mNIBQJp7fx+Tap9ML1CJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

According to the commit policy [1] a colon goes after the changed file.

        [PATCH] metano.conf: add IMAGE_BASENAME to IMAGE_NAME

Am Donnerstag, den 11.11.2010, 22:24 -0200 schrieb angelox_123:

Sorry for nitpicking the commit message. Since you are going to send
further patches, I think it is beneficial since you can consider these
rules in the future. The commit messages of Git are normally very well
written and can serve as an example [2]. Also beware that I am no native
speaker either so my remarks could be wrong.

>  * Added IMAGE_BASENAME on Metano Distro configuration file on IMAGE_NAME

Add IMAGE_BASENAME to IMAGE_NAME in Metano=E2=80=99s configuration file.

(Use present tense in the commit message.)

>  * This will help we to identify the names of our images :)

s/we/me/

>  * By: angelox_123 (from IRC #metano_linux),developer and mainteiner of M=
etano Distro

maint*a*iner

> Signed-off-by: angelox_123 <angelox.123@gmail.com>

Since non of your patches have been pushed yet (?), is it on purpose you
are using your IRC nick name in the SOB line? I would prefer your real
name but it is no requirement as far as I know. For the statistics you
should decide what you are going to use and stick to it.

> ---
>  conf/distro/metano.conf |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
>=20
> diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
> index 9bab8d9..ae29e7d 100644
> --- a/conf/distro/metano.conf
> +++ b/conf/distro/metano.conf
> @@ -56,7 +56,7 @@ IPKG_VARIANT =3D "opkg"
>  ########################################################################=
#####
>  # IMAGES CONFIGURATION
>  ########################################################################=
#####
> -IMAGE_NAME =3D "Metano_Linux-PD.Edition-${DISTRO_VERSION}-${MACHINE}"
> +IMAGE_NAME =3D "Metano_Linux-PD.Edition-${IMAGE_BASENAME}-${DISTRO_VERSI=
ON}-${MACHINE}"
> =20
>  CACHE =3D "${TMPDIR}/cache/${LIBC}/${MACHINE}"
>  DEPLOY_DIR ?=3D "${TMPDIR}/deploy/${LIBC}"
> @@ -119,12 +119,9 @@ DISTRO_EXTRA_RRECOMMENDS +=3D " \
>      kernel-module-ext2 \
>      kernel-module-ext3 \
>      kernel-module-af-packet \
> -    mplayer \
>      alsa-lib \
>      alsa-utils \
>      nano \
> -    gpe-filemanager \
> -    gpe-mini-browser \
>      ${XSERVER} \
>      avahi-daemon \
>      avahi-autoipd \

The removal of these programs are not mentioned in the commit message
and should be in a separate patch. You can use `git rebase -i HEAD~4`
and `git add --patch` to split this up.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://git.kernel.org/?p=3Dgit/git.git;a=3Dlog

--=-mNIBQJp7fx+Tap9ML1CJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkzdC0cACgkQPX1aK2wOHVivfgCYj6GFZiGpcHOwedlJPMoJCZzk
fwCfeAlBPDXyV8ey8j+aj5L96A0u+gA=
=wPBS
-----END PGP SIGNATURE-----

--=-mNIBQJp7fx+Tap9ML1CJ--
