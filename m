Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWBeD-0005Ac-Ic for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 20:14:01 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWBbx-0000Ic-Pu for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 18:11:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
Date: Mon, 13 Jun 2011 20:10:38 +0200
Message-ID: <1307988638.4081.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 18:14:02 -0000
X-Groupsio-MsgNum: 32635
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iqSoldqEoXBDoEzrQeI7"

--=-iqSoldqEoXBDoEzrQeI7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Pau,


thank you for your contribution.

Am Montag, den 13.06.2011, 19:52 +0200 schrieb Pau Espin Pedrol:

The commit summary is a bit long. Please add a blank line in between and
add your Signed-off-by line according to the commit policy [1].

Please also paste the important parts of the segfault into the commit
message.

What system did you use for testing?

> ---
>  recipes/e17/enjoy_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/e17/enjoy_svn.bb b/recipes/e17/enjoy_svn.bb
> index eab81b4..d709eb7 100644
> --- a/recipes/e17/enjoy_svn.bb
> +++ b/recipes/e17/enjoy_svn.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "LGPLv3"
>  DEPENDS =3D "evas ecore edje elementary emotion lightmediascanner"
>  SRCREV =3D "${EFL_SRCREV}"
>  PV =3D "0.0+svnr${SRCPV}"
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  DEPENDS +=3D "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', =
'1', '', 'gst-plugins-ugly', d)}"
> =20
> @@ -13,7 +13,7 @@ DEPENDS +=3D "gst-plugins-good ${@base_conditional('ENT=
ERPRISE_DISTRO', '1', '', '
>  #4th needed for flac playback
>  #5th needed binary to create db
>  RDEPENDS +=3D "\
> -	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-p=
lugin-decodebin2  \
> +	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-p=
lugin-decodebin2  gst-plugin-alsa gst-plugin-autodetect \
>  	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad gst-p=
lugin-id3demux', d)} \
>  	gst-plugin-ogg gst-plugin-ivorbisdec \
>  	gst-plugin-flac \

Otherwise this looks good. Please resend as =E2=80=9Cv2=E2=80=9D [2].


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

--=-iqSoldqEoXBDoEzrQeI7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk32Up0ACgkQPX1aK2wOHVhDVACfeZncFHwygnpCjdvA2pk3geJR
2AQAn3gz0x0k4GwvthuidCoAzFeZVp8b
=O4XJ
-----END PGP SIGNATURE-----

--=-iqSoldqEoXBDoEzrQeI7--
