Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxEo4-0000P9-2c
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 11:41:23 +0100
Received: by mail-wi0-f175.google.com with SMTP id hm11so6986510wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aH+qH+6CfFycUHX6o2CUQFdGVAmQRB6J3hwMD2IIaCU=;
	b=pW2bvaHweCe+yBSsNUQ2ohH0kw6SkgkZNVj9NJ96IrU1UTSB7z+4Vsm7yY94aXjRay
	1vOvlxdDY6KEmO8duhYoho5dXu4op6ilAiaxiBmT/rkUr4HI5oWJtk+/U4ZMAIi6ACrb
	QNFEyizhq9+MNZrNCBxryKhCjYyat9Jv+/GWmlzsFVgR2By7LrldDmRYr0ketWKImVIT
	1ubX9hU8PiZCKqjNSvaehvIu6lfgT0LHUEPnZAQkvujb9NmjyWO6mvv593kQ3AOZkXt0
	Uy7w2BhspZbVPZncV0yhkYRJKKAJw0DV0u4UgUmpH67IQCDZZ/yIrRt0cjb0+KnwxHMO
	/idw==
X-Received: by 10.180.80.230 with SMTP id u6mr14248844wix.20.1358763918211;
	Mon, 21 Jan 2013 02:25:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l5sm17966206wia.10.2013.01.21.02.25.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 02:25:17 -0800 (PST)
Date: Mon, 21 Jan 2013 11:25:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130121102520.GM29386@jama.palm1.palmone.com>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
	<1358681528-19761-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1358681528-19761-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][meta-multimedia][PATCH v2 2/7] x264: add git version
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
X-List-Received-Date: Mon, 21 Jan 2013 10:41:33 -0000
X-Groupsio-MsgNum: 42772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GoZzJvFfKjxI3RhA"
Content-Disposition: inline

--GoZzJvFfKjxI3RhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 20, 2013 at 12:32:03PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-multimedia/x264/x264_git.bb | 38 +++++++++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipe=
s-multimedia/x264/x264_git.bb
> new file mode 100644
> index 0000000..8199a83
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "x264 is a free software library and application for encodin=
g video streams into the H.264/MPEG-4 AVC format"
> +HOMEPAGE =3D "http://www.videolan.org/developers/x264.html"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "yasm-native"
> +
> +SRC_URI =3D "git://git.videolan.org/x264.git"
> +SRCREV =3D "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> +
> +PV =3D "r2230+git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit lib_package pkgconfig
> +
> +EXTRA_OECONF =3D '--prefix=3D${prefix} \
> +                --host=3D${HOST_SYS} \
> +                --cross-prefix=3D${TARGET_PREFIX} \
> +                --sysroot=3D${STAGING_DIR_TARGET} \
> +                --enable-shared \
> +                --enable-static \
> +                --disable-lavf \
> +                ${X264_DISABLE_ASM} \
> +               '

Did you forget to initialize X264_DISABLE_ASM?

| You specified a pre-ARMv6 or Thumb-1 CPU in your CFLAGS.
| If you really want to run on such a CPU, configure with --disable-asm.
| ERROR: Function failed: do_configure (see
/OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/x264/r2230+git-r0/te=
mp/log.do_configure.369
for further information)

Cheers,

> +
> +do_configure() {
> +	./configure ${EXTRA_OECONF}
> +}
> +
> +# Get rid of -e
> +EXTRA_OEMAKE =3D ""
> +AS =3D "${TARGET_PREFIX}gcc"
> +
> +do_install() {
> +	oe_runmake install DESTDIR=3D${D}
> +}
> --=20
> 1.8.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GoZzJvFfKjxI3RhA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD9F5AACgkQN1Ujt2V2gBy7MACeMySfvx9kRGV1MCHpHxmOeGDU
kNYAnj8h3XBMUdePGl5lI1Pvx+nMQUlU
=7qn5
-----END PGP SIGNATURE-----

--GoZzJvFfKjxI3RhA--
