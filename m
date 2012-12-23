Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmjFA-0006Xa-Bk
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 11:57:23 +0100
Received: by mail-ee0-f51.google.com with SMTP id d4so3081219eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=vp8xcjmCM8lYMtPszhzfps4ccCyqQaSejB1hNHEYxCI=;
	b=vBVIE0ACyjJ8ESqN9MCEnW6J6Os680H7XgUwHrVwBOd6Zh7K2FKQ6MqQQeeHF9RbBj
	1A1ZfA1YCGNZj9ooKX7D3I/OQ29+Cd9LrH7cwyBRBAx1ZlHUNpEPRcYI9xapzqomrSCY
	L7GURwl0ddfCCNQuMzOgVV9T0/iuetMnxnz8GP/kXy4VzkMFLyiXeBzr6Sz7Mqm+IiEY
	aGP3Fkj9pidIypfYbbIeglW4TQ5kEB/R0tw40goexX5dUYqFrw3O1HtxRQIBQg8w55s2
	RI59+6ZI+TyZksDS6WtwGHhhifvsx0j4QTIsB5DHeVu15qkQ1qywZO2BWlI1dGGyuHNj
	DiSA==
X-Received: by 10.14.194.4 with SMTP id l4mr47341035een.42.1356259351870;
	Sun, 23 Dec 2012 02:42:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm34050994eed.10.2012.12.23.02.42.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 02:42:31 -0800 (PST)
Date: Sun, 23 Dec 2012 11:42:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121223104231.GG8988@jama.palm1.palmone.com>
References: <1356172826-24392-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1356172826-24392-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/2] x264: add git version
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
X-List-Received-Date: Sun, 23 Dec 2012 10:57:23 -0000
X-Groupsio-MsgNum: 42328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m972NQjnE83KvVa/"
Content-Disposition: inline

--m972NQjnE83KvVa/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 22, 2012 at 11:40:25AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

This depends on yasm-native from meta-intel, can we get yasm somewhere
else? And please fix tabs in EXTRA_OECONF (--cross-prefix=3D line).

Cheers,

> ---
>  meta-oe/recipes-multimedia/x264/x264_git.bb |   38 +++++++++++++++++++++=
++++++
>  1 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipe=
s-multimedia/x264/x264_git.bb
> new file mode 100644
> index 0000000..79e4988
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
> +		--cross-prefix=3D${TARGET_PREFIX} \
> +                --sysroot=3D${STAGING_DIR_TARGET} \
> +                --enable-shared \
> +                --enable-static \
> +                --disable-lavf \
> +                ${X264_DISABLE_ASM} \
> +               '
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
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m972NQjnE83KvVa/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDW4BcACgkQN1Ujt2V2gBzTSACgtkGadfz1s3zOCRbM4AZOEqf/
TFwAoKS9+b2SOtdTEmMcT2LoUozk+zXU
=MEqs
-----END PGP SIGNATURE-----

--m972NQjnE83KvVa/--
