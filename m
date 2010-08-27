Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OovDs-0007yH-5l for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 11:27:45 +0200
Received: from f053040121.adsl.alicedsl.de ([78.53.40.121]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OovDR-0001Nu-Oc for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 09:27:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimQ6vdijXjgq+ct5T2h5-WeDa4dnR2NiKrnUUBf@mail.gmail.com>
References: <AANLkTinDA-hgVagfF0add1ONi8Z-=sBha7mnit-Ui7bp@mail.gmail.com>
	<AANLkTimQ6vdijXjgq+ct5T2h5-WeDa4dnR2NiKrnUUBf@mail.gmail.com>
Date: Fri, 27 Aug 2010 11:27:14 +0200
Message-ID: <1282901234.3882.3.camel@mattotaupa>
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
Subject: Re: Openembedded and Gstreamer
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
X-List-Received-Date: Fri, 27 Aug 2010 09:27:45 -0000
X-Groupsio-MsgNum: 22722
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bolfNWmDxnZgwUqFFow1"

--=-bolfNWmDxnZgwUqFFow1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 27.08.2010, 11:11 +0200 schrieb Alberto Milla:
> I try
>=20
> #gst-launch --gst-debug=3D*:3 audiotestsrc ! audioconvert ! alsasink
>=20
> and I obtain the next output: http://pastebin.com/EVQjRVqS
>=20
> where I can see 3 warning at lines 57, 58 and 59:
>=20
> alsa gstalsa.c:124:gst_alsa_detect_formats:<alsasink0> skipping non-int f=
ormat
> alsa conf.c:3952:snd_config_expand: alsalib error: Unknown parameters
> {AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}
> alsa pcm.c:2202:snd_pcm_open_noupdate: alsalib error: Unknown PCM
> iec958:{AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}
>=20
> and from the line 75 I get a dump that starts with a:
>=20
> 0:00:02.183681854   953    0x15050 INFO   GST_EVENT
> gstevent.c:1091:gst_event_new_latenUnable to handle kernel paging
> request at virtual address aafaaaae
>=20
> Can it be an alsa problem?

I do not know that. But this list is more about packaging programs for
OE. I guess you could get faster and more knowledgeable help asking your
question on a GStreamer list [1].


Thanks and good luck,

Paul


[1] http://gstreamer.freedesktop.org/lists/

--=-bolfNWmDxnZgwUqFFow1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx3hOwACgkQPX1aK2wOHVhmiACeNC5xlIxzMJU+WscQJX+T9h1u
skYAoIYXB/jZs/Bq5dPYU83KAQT2XKC/
=0moQ
-----END PGP SIGNATURE-----

--=-bolfNWmDxnZgwUqFFow1--
