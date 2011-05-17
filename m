Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMS5V-000670-J9 for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:45:57 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMS2l-0002J1-Dz for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 21:43:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305664937-20683-1-git-send-email-christian.charreyre@cioinfoindus.fr>
References: <1305664937-20683-1-git-send-email-christian.charreyre@cioinfoindus.fr>
Date: Tue, 17 May 2011 23:43:04 +0200
Message-ID: <1305668584.4260.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] libsdl-pango: new recipe for version 0.1.2
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
X-List-Received-Date: Tue, 17 May 2011 21:45:57 -0000
X-Groupsio-MsgNum: 32169
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/jLlo6YrIoZQkI1dH80a"

--=-/jLlo6YrIoZQkI1dH80a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Dienstag, den 17.05.2011, 22:42 +0200 schrieb Christian Charreyre:
> This patches creates a new recipe for libsdl-pango.

=C2=BBThis patch =E2=80=A6=C2=AB is most of the time redundant in a commit =
message. You
could read [1].

> It uses debian patches, unless rebootstrap.patch which is very big and do=
esn't=20
> seem necessary for the recipe.

Please add the link/URL of the Debian patches.

What machine and distribution (custom right) did you use?

> Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
> ---
>  .../libsdl-pango-0.1.2/am_maintainer_mode.patch    |   10 ++
>  .../libsdl/libsdl-pango-0.1.2/api_additions.patch  |  128 ++++++++++++++=
+++++
>  .../libsdl/libsdl-pango-0.1.2/blit_overflow.patch  |   32 +++++
>  .../libsdl/libsdl-pango-0.1.2/fillrect_crash.patch |   15 +++
>  .../libsdl-pango-0.1.2/matrix_declarations.patch   |  131 ++++++++++++++=
++++++
>  recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch |   13 ++
>  recipes/libsdl/libsdl-pango_0.1.2.bb               |   27 ++++
>  7 files changed, 356 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/am_maintainer_mode.=
patch
>  create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/api_additions.patch
>  create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/blit_overflow.patch
>  create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/fillrect_crash.patc=
h
>  create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/matrix_declarations=
.patch
>  create mode 100644 recipes/libsdl/libsdl-pango-0.1.2/sans-serif.patch
>  create mode 100644 recipes/libsdl/libsdl-pango_0.1.2.bb

[=E2=80=A6]

> --- /dev/null
> +++ b/recipes/libsdl/libsdl-pango_0.1.2.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "Simple DirectMedia Layer Pango library."
> +SECTION =3D "libs/network"
> +PRIORITY =3D "optional"
> +DEPENDS =3D "virtual/libsdl pango"
> +LICENSE =3D "LGPL"

Please sort those according to the style guide [2]. Setting `HOMEPAGE`
would be nice too.

> +
> +SRC_URI =3D "http://freefr.dl.sourceforge.net/project/sdlpango/SDL_Pango=
/${PV}/SDL_Pango-${PV}.tar.gz \

You should use `SOURCEFORGE_MIRROR`.

	git grep SOURCEFORGE_MIRROR

> +	file://am_maintainer_mode.patch \
> +	file://api_additions.patch \
> +	file://matrix_declarations.patch \
> +	file://sans-serif.patch \
> +	file://fillrect_crash.patch \
> +	file://blit_overflow.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "85bbf9bb7b1cee0538154dadd045418c"
> +SRC_URI[sha256sum] =3D "7f75d3b97acf707c696ea126424906204ebfa07660162de9=
25173cdd0257eba4"
> +
> +S =3D "${WORKDIR}/SDL_Pango-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/sdl-config"
> +
> +do_stage() {
> +	autotools_stage_all
> +}

As Henning wrote already, `do_stage()` should not be used anymore [3].
Probably the documentation you used is outdated.

Unfortunately trying to build this recipe task patch fails with the
following error message using `angstrom-2010.x` for `MACHINE =3D
"beagleboard"`.

	NOTE: package libsdl-pango-0.1.2-r0: task do_patch: Started
	ERROR: Execution of 'quilt --quiltrc=3D/oe/build-angstrom-next/angstrom-de=
v/sysroots/i686-linux/usr/bin/quiltrc push' failed with exit code 1:
	Applying patch am_maintainer_mode.patch
	patching file configure.in
	Hunk #1 FAILED at 1.
	1 out of 1 hunk FAILED -- rejects in file configure.in
	Patch am_maintainer_mode.patch does not apply (enforce with -f)

	NOTE: package libsdl-pango-0.1.2-r0: task patch_do_patch: Failed


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032692=
.html
[2] http://openembedded.org/index.php/Styleguide
[3] http://openembedded.org/index.php/Legacy_staging

--=-/jLlo6YrIoZQkI1dH80a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3S690ACgkQPX1aK2wOHVhNPQCfYbEJoye6IzYN97soagq7VJAk
R1EAn0tG/q6IfEvR0fygUHXuj/cyHbjz
=TQiS
-----END PGP SIGNATURE-----

--=-/jLlo6YrIoZQkI1dH80a--
