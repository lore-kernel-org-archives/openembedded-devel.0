Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtbO4-00029y-Rg for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 10:22:08 +0200
Received: from f053037177.adsl.alicedsl.de ([78.53.37.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtbJi-0003Zj-0p for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:17:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313556715-28652-2-git-send-email-pespin.shar@gmail.com>
References: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
	<1313556715-28652-2-git-send-email-pespin.shar@gmail.com>
Date: Wed, 17 Aug 2011 10:17:31 +0200
Message-ID: <1313569051.4294.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/2] enjoy: make it work with shr-core
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
X-List-Received-Date: Wed, 17 Aug 2011 08:22:09 -0000
X-Groupsio-MsgNum: 33663
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Jtw+Ff30W52VhZmvQGqS"

--=-Jtw+Ff30W52VhZmvQGqS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Pau,


thank you for your patches.

Am Mittwoch, den 17.08.2011, 06:51 +0200 schrieb Pau Espin Pedrol:
> * added LIC_FILES_CHKSUM

Please always use present tense in commit messages.

> * added virtual/gettext as it seems it is needed now (it didn't build fin=
e without it)

What is the exact error? It built fine in oe.dev as far as I remember.
Additionally should `inherit gettext` be used?

> * RDEPENDS: added new gstreamer module gst-plugins-good-autodetect needed=
 for enjoy to be able to play files
> * RDEPENDS: updated all other module names because they changed in shr-co=
re

Please always send one patch for one change, which makes it easier to
review. It would be great if you could resend your patch as three
patches (license, build fix and if feasible each RDEPENDS).

> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
> ---
>  meta-efl/recipes-efl/e17/enjoy_svn.bb |   13 ++++++++-----
>  1 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl=
/e17/enjoy_svn.bb
> index eab81b4..c6394c7 100644
> --- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
> +++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
> @@ -5,7 +5,10 @@ SRCREV =3D "${EFL_SRCREV}"
>  PV =3D "0.0+svnr${SRCPV}"
>  PR =3D "r4"
> =20
> -DEPENDS +=3D "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', =
'1', '', 'gst-plugins-ugly', d)}"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0f507c68d42d1cc0fcb507d007112=
bf2"

Please look at the style guide where to add such fields. In this case it
is not listed directly but it should go right below `LICENSE`.

> +
> +
> +DEPENDS +=3D "virtual/gettext gst-plugins-good ${@base_conditional('ENTE=
RPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
> =20
>  #1st needed for all formats
>  #2nd needed for mp3 playback
> @@ -13,10 +16,10 @@ DEPENDS +=3D "gst-plugins-good ${@base_conditional('E=
NTERPRISE_DISTRO', '1', '', '
>  #4th needed for flac playback
>  #5th needed binary to create db
>  RDEPENDS +=3D "\
> -	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-p=
lugin-decodebin2  \
> -	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad gst-p=
lugin-id3demux', d)} \
> -	gst-plugin-ogg gst-plugin-ivorbisdec \
> -	gst-plugin-flac \
> +	gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins=
-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
> +	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad=
 gst-plugins-good-id3demux', d)} \
> +	gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
> +	gst-plugins-good-flac \
>  	lightmediascanner-test \
>  	"


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Styleguide

--=-Jtw+Ff30W52VhZmvQGqS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5LeRsACgkQPX1aK2wOHVgXmwCcDytkmKuFtH7BwMSaJyEKoSXk
AP4AnionSpI+KpZGV+3n2cggW1rB6WtM
=mIgu
-----END PGP SIGNATURE-----

--=-Jtw+Ff30W52VhZmvQGqS--
