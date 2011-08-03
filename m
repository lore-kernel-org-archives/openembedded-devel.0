Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QoZUh-0003iu-L8 for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 13:20:11 +0200
Received: from f053043040.adsl.alicedsl.de ([78.53.43.40]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QoZQZ-0008Ma-WA for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 11:15:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1312311949-3788-1-git-send-email-josua.mayer97@googlemail.com>
References: <1312311949-3788-1-git-send-email-josua.mayer97@googlemail.com>
Date: Wed, 03 Aug 2011 13:15:50 +0200
Message-ID: <1312370150.19311.163.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] mplayer_git: Fix linker error on x86 machines
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
X-List-Received-Date: Wed, 03 Aug 2011 11:20:11 -0000
X-Groupsio-MsgNum: 33490
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5K5EK92IVcV2YHEguwr1"

--=-5K5EK92IVcV2YHEguwr1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Josua,


thank you for sending a patch iteration with my comments addressed. Just
a side note, you can use `git commit --amend` to edit the commit message
of the last commit. I do not know if you used that since the date looks
different from your initial patch.

Am Dienstag, den 02.08.2011, 21:05 +0200 schrieb Josua Mayer:
> * fix undefined references  in loader/module.o:
>   module.c:(.text+0xd60): undefined reference to `report_entry'
>   module.c:(.text+0xd6a): undefined reference to `report_ret'
>   module.c:(.text+0xd74): undefined reference to `wrapper_target'
>   module.c:(.text+0xd7a): undefined reference to `wrapper'
>   and more of these
> * Apply already existing patch fix-emu_qtx_api.diff
>   This patch was already used in mplayer_svn but is needed
>   for the git version too.
>=20
> Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
> ---
>  recipes/mplayer/mplayer_git.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git=
.bb
> index 259ce99..995884b 100644
> --- a/recipes/mplayer/mplayer_git.bb
> +++ b/recipes/mplayer/mplayer_git.bb
> @@ -8,7 +8,8 @@ DEPENDS =3D "libvpx live555 libdvdread libtheora virtual/=
libsdl ffmpeg xsp zlib li
>  RDEPENDS_${PN} =3D "mplayer-common"
>  LICENSE =3D "GPL"
>  SRC_URI =3D "git://repo.or.cz/mplayer/glamo.git;protocol=3Dgit;branch=3D=
mplayer2 \
> -   "
> +           file://fix-emu_qtx_api.diff \
> +          "
> =20
>  SRC_URI_append_armv7a =3D " \
>  	   file://0001-video-out-for-omapfb-support.patch \

Long story short I should have looked right away at the commit log for
the patch file [1]. Reading that it would have been clear that this is
needed for x86 targets which the ION seems to be. I thought SHR is
primarily used for ARM mobile devices [2].

Therefore I always want to have the build configuration output from
BitBake pasted in messages and commit messages.

It would be great if you could bring that patch upstream somehow.

I committed your patch with an improved commit message and a `PR` bump
(I hope done correctly) in 1a91fc4b [3].

Unfortunately I could not test this because using `DISTRO =3D "shr"` and
`MACHINE =3D "ion"` fails with the following error message.

        Error, Your PACKAGE_ARCHS field contains duplicates. Perhaps you se=
t PACKAGE_EXTRA_ARCHS twice accidently through some tune file?

So please remember to be as elaborate as possible and to provide all
files for others to reproduce your problem. I know looking at the
archive and commit log not everyone follows this rule but it would have
saved me quite some time.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dff57f14=
c99a6ff61ffb7f1c533523e3e934f96e5
[2] http://shr-project.org/trac
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1a91fc4=
b705b0c4f45eb088a2f7aea01ebc9c98e

--=-5K5EK92IVcV2YHEguwr1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk45LeAACgkQPX1aK2wOHVjrUACfbymqYzRBF1vcVmJDk3OhcJKB
xpMAniDJGAqo2dP0TlPu+MG7Yc62vs0b
=Trp9
-----END PGP SIGNATURE-----

--=-5K5EK92IVcV2YHEguwr1--
