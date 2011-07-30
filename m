Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QnHPh-00043W-C9 for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 23:49:41 +0200
Received: from f053040092.adsl.alicedsl.de ([78.53.40.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QnHMj-0007TV-Pt for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 21:46:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1312042461-5212-1-git-send-email-user@server.WORKGROUP>
References: <1312042461-5212-1-git-send-email-user@server.WORKGROUP>
Date: Sat, 30 Jul 2011 23:45:22 +0200
Message-ID: <1312062322.3650.64.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [?PATCH] mplayer: fix linker error
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
X-List-Received-Date: Sat, 30 Jul 2011 21:49:41 -0000
X-Groupsio-MsgNum: 33419
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pWGP8cJYudsx40yMOl19"

--=-pWGP8cJYudsx40yMOl19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Josua,


thank you for your patch. A couple of remarks.

Am Samstag, den 30.07.2011, 18:14 +0200 schrieb Josua Mayer:
> From: =3D <=3D>

1. Please fix this line above.
2. If there are several recipe versions, also note in the commit summary
which version you changed.

	mplayer_git: fix linker error

> * use already existing patch fix-emu_qtx_api.diff

3. Your Signed-off-by line is missing. Please read our commit policy
[1]. Please also read the other policies and howtos [3][4].
4. Somehow a question mark slipped into the patch tag in the
subject/commit summary: `[?PATCH]`. Please resend your patch with a
correct line, so that our patch queue can pick your patch up [2].
5. One question regarding your patch. What build configuration do you
use? With `angstrom-2010.x` for `MACHINE =3D "beagleboard"` it works fine.
For `minimal` with the same machine it fails with the following error.

| Checking for LIVE555 Streaming Media libraries ... yes
| Checking for FFmpeg (libavutil libavcodec libavformat libswscale libpostp=
roc) ...
| Error: Unable to find development files for some of the FFmpeg libraries =
above. Aborting. If you really mean to compile without FFmpeg support use -=
-disable-ffmpeg.
|
| Check "config.log" if you do not understand why it failed.

So I am wondering why you experience this error.

> ---
>  recipes/mplayer/mplayer_git.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git=
.bb
> index 259ce99..5f15618 100644
> --- a/recipes/mplayer/mplayer_git.bb
> +++ b/recipes/mplayer/mplayer_git.bb
> @@ -8,6 +8,7 @@ DEPENDS =3D "libvpx live555 libdvdread libtheora virtual/=
libsdl ffmpeg xsp zlib li
>  RDEPENDS_${PN} =3D "mplayer-common"
>  LICENSE =3D "GPL"
>  SRC_URI =3D "git://repo.or.cz/mplayer/glamo.git;protocol=3Dgit;branch=3D=
mplayer2 \
> +	file://fix-emu_qtx_api.diff \
>     "
> =20
>  SRC_URI_append_armv7a =3D " \


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://patches.openembedded.org/project/oe/list/
[3] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
[4] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines

--=-pWGP8cJYudsx40yMOl19
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk40e3IACgkQPX1aK2wOHViwLACgjJFporQF0ch0M2LB+1QhDE1L
99EAoIaYXuY6OB3zCk4m+Mno9CvPjY05
=MVPx
-----END PGP SIGNATURE-----

--=-pWGP8cJYudsx40yMOl19--
