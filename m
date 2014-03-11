Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id A9BE26F7BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:26:26 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so4381904ead.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rzxDME+UrWdbKkHh7oHHW7ghXnLoo7GHJEpDvbNwbHo=;
	b=B6cePuwAKoMJvqk48nvS0Asc8PXUsHfmpMQw8bv4Sg++WJ6R53keDUpC6hZnZR9TYs
	ZfdaDKB020kftJm67siIeeTDx1KeagJEIej74rD/omut3kijSu4AX9CYm5tMclisxBKE
	enn1/SqU4lyiZhT0b/o6HNq/i8qw23gGoy8IJzZm0A6z+pXdx7Wn8MEhTmwWiGUxdz7U
	XL9GyGgZoX893ZXUq46UhkzKc9b4UPBEj65yMhvfTXqUR63mqH1xpr5a1NsoJOgKjFwO
	REscgglBUDcj9uWNf67A7WdVBB43Exam2jhBLmkfp4zb6FOXIIvbY4EcVobfZQA8ELx5
	rqKA==
X-Received: by 10.15.75.200 with SMTP id l48mr630312eey.113.1394547987684;
	Tue, 11 Mar 2014 07:26:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm58065531eeh.13.2014.03.11.07.26.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 07:26:26 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:26:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311142639.GE2137@jama>
References: <1393516986-25391-1-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393516986-25391-1-git-send-email-ticotimo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH v2] libmusicbrainz: workaround for build-native/do_configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2014 14:26:28 -0000
X-Groupsio-MsgNum: 48595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 08:03:06AM -0800, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> Changes in v2:
>     bump PR to r2 rather than drop (doh!)
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../musicbrainz/libmusicbrainz_git.bb              | 50 ++++++++++++++++=
+++++-
>  1 file changed, 48 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index f6a8f53..2928587 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc0939018=
57fcd118f065f900982c24"
>  DEPENDS =3D "expat neon"
> =20
>  PV =3D "5.0.1+git${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> @@ -30,9 +30,55 @@ do_configure_prepend() {
>            -DCMAKE_C_COMPILER=3D${BUILD_CC} \
>            -DCMAKE_CXX_FLAGS=3D${BUILD_CXXFLAGS} \
>            -DCMAKE_CXX_COMPILER=3D${BUILD_CXX} \
> -          ..
> +          ${S}=20
>      make make-c-interface
>      cd ..
> +
> +    # the first thing cmake_do_configure does is delete ${B}
> +    # stash it first
> +    cp -r build-native ..
> +}
> +
> +# recreate default here, with work around for build-native
> +cmake_do_configure() {
> +	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
> +		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BU=
ILDPATH.  The default behaviour is now out-of-tree builds with B=3DWORKDIR/=
build."
> +	fi
> +
> +	if [ "${S}" !=3D "${B}" ]; then
> +		rm -rf ${B}
> +		mkdir -p ${B}
> +		cd ${B}
> +	fi
> +
> +	# bring build-native back into build/
> +	mv ../build-native .
> +
> +	# Just like autotools cmake can use a site file to cache result that ne=
ed generated binaries to run
> +	if [ -e ${WORKDIR}/site-file.cmake ] ; then
> +		OECMAKE_SITEFILE=3D" -C ${WORKDIR}/site-file.cmake"
> +	else
> +		OECMAKE_SITEFILE=3D""
> +	fi
> +
> +	cmake \
> +	  ${OECMAKE_SITEFILE} \
> +	  ${S} \
> +	  -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
> +	  -DCMAKE_INSTALL_BINDIR:PATH=3D${bindir} \
> +	  -DCMAKE_INSTALL_SBINDIR:PATH=3D${sbindir} \
> +	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=3D${libexecdir} \
> +	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=3D${sysconfdir} \
> +	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D${sharedstatedir} \
> +	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D${localstatedir} \
> +	  -DCMAKE_INSTALL_LIBDIR:PATH=3D${libdir} \
> +	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=3D${includedir} \
> +	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=3D${datadir} \
> +	  -DCMAKE_INSTALL_SO_NO_EXE=3D0 \
> +	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
> +	  -DCMAKE_VERBOSE_MAKEFILE=3D1 \
> +	  ${EXTRA_OECMAKE} \
> +	  -Wno-dev
>  }

There is still some issue with this patch applied:

ERROR: Function failed: do_configure (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicbra=
inz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/core2-64-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+074=
9dd0a35-r2/temp/log.do_configure.20744
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| fatal: Not a git repository (or any parent up to mount parent /home/jenki=
ns/oe/shr-core-branches/shr-core)
| Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
| WARNING: exit code 128 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicb=
rainz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744)
NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r2: task do_configu=
re: Failed
ERROR: Task 1242 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembe=
dded/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb, =
do_configure) failed with exit code '1'

(link to full log in last State of bitbake world, Failed tasks 2014-03-11 e=
-mail)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfHR8ACgkQN1Ujt2V2gBzE5ACghYTeF0VaO/Szxedx6h20LKj/
EOcAnA/MW8+Kggm9TxzmE+zQEGh/iIHL
=k0CV
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
