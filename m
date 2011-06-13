Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWGGV-0003jS-F7 for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 01:09:51 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWGEF-0002hy-U8 for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 23:07:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307991574-6143-1-git-send-email-pespin.shar@gmail.com>
References: <1307991574-6143-1-git-send-email-pespin.shar@gmail.com>
Date: Tue, 14 Jun 2011 01:06:27 +0200
Message-ID: <1308006387.4081.77.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] enjoy: add alsa and autodetect gst modules.
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
X-List-Received-Date: Mon, 13 Jun 2011 23:09:51 -0000
X-Groupsio-MsgNum: 32645
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-l1qqCCIhwdmC2lzRRerM"

--=-l1qqCCIhwdmC2lzRRerM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 13.06.2011, 20:59 +0200 schrieb Pau Espin Pedrol:
> Without autodetect, enjoy segfaults. Without alsa, no sound is played.
>=20
> That happens because emotion needs them to play as shown in its source co=
de:
> emotion_gstreamer_pipeline.c:   sink =3D gst_element_factory_make("autoau=
diosink", "audiosink");

Thank you for resending the patch!

> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
>
> ---
>  recipes/e17/enjoy_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

[=E2=80=A6]

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I will give the others folks a day or two for reviewing and commit your
patch afterward.


Thanks,

Paul

--=-l1qqCCIhwdmC2lzRRerM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk32l/MACgkQPX1aK2wOHViNvACfcCqaQiKsf6JB6sRcYkqG9O3N
94MAn0aV0UTmHeqNX74pSpZymamfXLeF
=UETl
-----END PGP SIGNATURE-----

--=-l1qqCCIhwdmC2lzRRerM--
