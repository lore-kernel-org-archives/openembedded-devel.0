Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5c7S-0004aI-Nx for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 13:02:22 +0200
Received: from f053035217.adsl.alicedsl.de ([78.53.35.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5c5X-0002i2-QZ for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 11:00:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 01 Apr 2011 13:00:22 +0200
Message-ID: <1301655622.3951.64.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: minimal-uclibc: Set `PREFERRED_PROVIDER_ffmpeg` to `ffmpeg` or `libav`
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
X-List-Received-Date: Fri, 01 Apr 2011 11:02:22 -0000
X-Groupsio-MsgNum: 30837
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-b3tvzYavX6I8MwB+Zmqf"

--=-b3tvzYavX6I8MwB+Zmqf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


with the fork of the FFmpeg [1] there is now also Libav [2]. With commit
692d43ee [3]

        commit 692d43eeb6596df52b5984ae1bd14739f9ec9e0f
        Author: Koen Kooi <koen@openembedded.org>
        Date:   Mon Mar 28 15:47:23 2011 +0200
       =20
            libav: add proper recipe for git version
            omapfbplay: switch to libav
           =20
            Signed-off-by: Koen Kooi <koen@openembedded.org>

`bitbake -k e-image` using minimal-uclibc fails with the following
message, since `libav` also provides `ffmpeg`.

        NOTE: multiple providers are available for ffmpeg (ffmpeg,
        libav)
        NOTE: consider defining a PREFERRED_PROVIDER entry to match
        ffmpeg

So a decision needs to be made what program minimal-uclibc prefers.
(Strangely (plain) minimal does not fail for me.)


Thanks,

Paul


[1] http://www.ffmpeg.org/
[2] http://www.libav.org/
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D692d43e=
eb6596df52b5984ae1bd14739f9ec9e0f

--=-b3tvzYavX6I8MwB+Zmqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2VsEYACgkQPX1aK2wOHVgm9QCfZ4A92Zy2mpmGCisQZ2n6CtBT
ow0An3U6KNx+T/Iwxrd3iReo9PSAZb+P
=cjMo
-----END PGP SIGNATURE-----

--=-b3tvzYavX6I8MwB+Zmqf--
