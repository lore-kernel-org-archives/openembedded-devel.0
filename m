Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 846306DAF9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 11:40:36 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id b15so1353376eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ysekrihocB2MzCCiCmZrIcDf+RkcbhBNmtMXCWwWBac=;
	b=ADl03ajuhIlFAs7pB0IST3wp7IAEchqepJNCt6ZFhTI3JS60IiIealbAMug1jjOToX
	m5bkBh0SBfuy+5OLatNHEoja0Trdpj2yEn4wyTTS5rIHoUpv+zwxOyxo7PNFjDfi2T/I
	nGn+DusmZD5ErrCc7C3ZR2VFd3JXq5c6t2mQt7KEHEgD0VADONPAhLe/tmK4nU/kGvP6
	6JclOqrooMr5Qc6Pz2EgfTDVSu0FSrEzOBFmyNrH7z2dMEMRK0tzbKjL9NWJKHyBujSr
	014YFU+iAxLLl8zyrcauyLtwvmKXjE+PGWc7jYtLY0mcwhZyvdP4Nwgx2jaHXI26kPYy
	UTew==
X-Received: by 10.14.182.5 with SMTP id n5mr12929038eem.68.1393501237097;
	Thu, 27 Feb 2014 03:40:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g1sm15805401eet.6.2014.02.27.03.40.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 03:40:36 -0800 (PST)
Date: Thu, 27 Feb 2014 12:40:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140227114037.GA26981@jama>
References: <1393485271-24402-1-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393485271-24402-1-git-send-email-ticotimo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH] libmusicbrainz: workaround for build-native/do_configure
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
X-List-Received-Date: Thu, 27 Feb 2014 11:40:37 -0000
X-Groupsio-MsgNum: 48398
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZaJdQhC3kSAeqBrs"
Content-Disposition: inline

--ZaJdQhC3kSAeqBrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2014 at 11:14:31PM -0800, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> * drop PR
> * default cmake_do_configure deletes build/ which wipes out build-native
> * workaround to stash build-native first
> * <ugly>hack</ugly>

I've just noticed libmusicbraniz failing like this:

NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r1: task do_configu=
re: Started
ERROR: Function failed: do_configure (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libm=
usicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/temp/log.do_configure.2213)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libmusicbrainz/5.0.1+gitAUTO=
INC+0749dd0a35-r1/temp/log.do_configure.2213
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| fatal: Not a git repository (or any parent up to mount parent /home/jenki=
ns/oe/shr-core-branches/shr-core)
| Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
| WARNING: exit code 128 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/li=
bmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/temp/log.do_configure.2213)
NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r1: task do_configu=
re: Failed

Is it fix for this problem? or have you seen this?


>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../musicbrainz/libmusicbrainz_git.bb              | 49 ++++++++++++++++=
+++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index f6a8f53..b4d1ad3 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc0939018=
57fcd118f065f900982c24"
>  DEPENDS =3D "expat neon"
> =20
>  PV =3D "5.0.1+git${SRCPV}"
> -PR =3D "r1"

This would make the whole package version going backwards, so please
remove it only when incrementing PV/PE/SRCREV.

>  SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> @@ -30,9 +29,55 @@ do_configure_prepend() {
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
> =20
>  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:PATH=3D${libdir} \
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZaJdQhC3kSAeqBrs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPJDUACgkQN1Ujt2V2gBxumACcDi0sC9GCO+oEKxzxpi85FBhi
f7MAn0+nzcWUSTMr7UTtYs4B4yMca0y7
=fJSq
-----END PGP SIGNATURE-----

--ZaJdQhC3kSAeqBrs--
