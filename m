Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id B71CE600A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:26:48 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so4637244eei.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4kk/cWo6BvjMN72FCxqd6nUKqg9gostn1K8JsaW/Mkg=;
	b=GqI4iEJagWT2RPM9irMlhB/bcLjiWuGrkdRcPOkYRL4UhtnWcygQxSVkZ4CLBwi+yb
	IrKB+2Vw4pzO5pryvir/b7/tdfelHMiWTb+l+vbgC3ytaX/qnYsRwB0X1QiTdZQ8af1w
	En5HMWJGblhJrXCSSlmC4JgmAfqKyVRYJ/zhzM6YOZzATR/iWKpsPzQ4IhpbRVtNKrqc
	yue22+I79QHJKR9JRDmg4iGK7rtlbNu+XPdEMRSl80KgiPCxFbUbkdC2s6w37G/hOClp
	bTYJDlzY2jXBbeeuoTNXRfA4OUhEeiHvYpeKBqx4FSSQIMTAGNqovLi2gkQfZ6f2GlWr
	fuiw==
X-Received: by 10.15.33.132 with SMTP id c4mr12609582eev.2.1376461608348;
	Tue, 13 Aug 2013 23:26:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm72339104eem.1.2013.08.13.23.26.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 23:26:47 -0700 (PDT)
Date: Wed, 14 Aug 2013 08:27:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130814062738.GP17945@jama>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
	<43bf3e59f6a19386136dba15dd745f6f6c8c715c.1376432969.git.paul.eggleton@linux.intel.com>
	<520ABE96.40008@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <520ABE96.40008@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/3] libav: remove
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
X-List-Received-Date: Wed, 14 Aug 2013 06:26:49 -0000
X-Groupsio-MsgNum: 45665
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FbmEh7Ek6NM6xKh/"
Content-Disposition: inline

--FbmEh7Ek6NM6xKh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 05:17:42PM -0600, Gary Thomas wrote:
> On 2013-08-13 16:30, Paul Eggleton wrote:
> > This is now in OE-Core.
>=20
> As of what commit?  I don't see it in Poky/Yocto as of this morning:
>    commit 0c0ac7dd3af04610ca740817224d8c57ccd2fba5
>    Author: Scott Rifenbark <scott.m.rifenbark@intel.com>
>    Date:   Tue Aug 13 15:15:55 2013 +0300

http://git.openembedded.org/openembedded-core/commit/?id=3D9a670f780b1f1204=
d426017ff9a95842ad85800e
>=20
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >   .../0001-configure-enable-pic-for-AArch64.patch    |  27 -----
> >   meta-oe/recipes-multimedia/libav/libav.inc         | 127 ------------=
---------
> >   meta-oe/recipes-multimedia/libav/libav_0.8.4.bb    |  28 -----
> >   meta-oe/recipes-multimedia/libav/libav_git.bb      |  23 ----
> >   4 files changed, 205 deletions(-)
> >   delete mode 100644 meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-=
configure-enable-pic-for-AArch64.patch
> >   delete mode 100644 meta-oe/recipes-multimedia/libav/libav.inc
> >   delete mode 100644 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
> >   delete mode 100644 meta-oe/recipes-multimedia/libav/libav_git.bb
> >
> > diff --git a/meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configur=
e-enable-pic-for-AArch64.patch b/meta-oe/recipes-multimedia/libav/libav-0.8=
=2E4/0001-configure-enable-pic-for-AArch64.patch
> > deleted file mode 100644
> > index 5f2df43..0000000
> > --- a/meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configure-enabl=
e-pic-for-AArch64.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
> > -From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > -Date: Thu, 10 Jan 2013 12:42:19 +0100
> > -Subject: [PATCH] configure: enable pic for AArch64
> > -
> > -Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > -
> > -Upstream-Status: Backport
> > ----
> > - configure |    2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > ---- git.orig/configure
> > -+++ git/configure
> > -@@ -2390,11 +2390,11 @@ EOF
> > -
> > - check_host_cflags -std=3Dc99
> > - check_host_cflags -Wall
> > -
> > - case "$arch" in
> > --    alpha|ia64|mips|parisc|sparc)
> > -+    alpha|ia64|mips|parisc|sparc|aarch64)
> > -         spic=3D$shared
> > -     ;;
> > -     x86)
> > -         subarch=3D"x86_32"
> > -         check_cc <<EOF && subarch=3D"x86_64"
> > diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recip=
es-multimedia/libav/libav.inc
> > deleted file mode 100644
> > index 0155b4b..0000000
> > --- a/meta-oe/recipes-multimedia/libav/libav.inc
> > +++ /dev/null
> > @@ -1,127 +0,0 @@
> > -DESCRIPTION =3D "Libav is a complete, cross-platform solution to recor=
d, convert and stream audio and video."
> > -HOMEPAGE =3D "http://libav.org/"
> > -SECTION =3D "libs"
> > -LICENSE =3D "GPLv2+"
> > -
> > -# Provides ffmpeg compat, see http://libav.org/about.html
> > -PROVIDES =3D "ffmpeg"
> > -
> > -ARM_INSTRUCTION_SET =3D "arm"
> > -
> > -# faac faad2 lame schroedinger libgsm
> > -DEPENDS =3D "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheor=
a"
> > -
> > -INC_PR =3D "r8"
> > -
> > -inherit autotools pkgconfig
> > -
> > -#    --enable-libgsm
> > -#    --enable-libmp3lame
> > -#    --enable-libschroedinger
> > -#    --enable-libvpx
> > -
> > -B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> > -
> > -FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-p=
ointer -O4 -ffast-math"
> > -BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> > -
> > -EXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"
> > -EXTRA_FFCONF ?=3D ""
> > -
> > -PACKAGECONFIG ??=3D "bzip2"
> > -PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,=
jack"
> > -PACKAGECONFIG[bzip2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
> > -
> > -EXTRA_OECONF =3D " \
> > -    --enable-shared \
> > -    --enable-pthreads \
> > -    --enable-gpl \
> > -    --enable-avfilter \
> > -    \
> > -    --cross-prefix=3D${TARGET_PREFIX} \
> > -    --prefix=3D${prefix} \
> > -    \
> > -    --enable-avserver \
> > -    --enable-avplay \
> > -    --enable-x11grab \
> > -    --enable-libtheora  \
> > -    --enable-libvorbis \
> > -    --enable-libx264 \
> > -    --arch=3D${TARGET_ARCH} \
> > -    --target-os=3D"linux" \
> > -    --enable-cross-compile \
> > -    --extra-cflags=3D"${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTI=
ONS}" \
> > -    --extra-ldflags=3D"${TARGET_LDFLAGS}" \
> > -    --sysroot=3D"${STAGING_DIR_TARGET}" \
> > -    --enable-hardcoded-tables \
> > -    ${EXTRA_FFCONF} \
> > -"
> > -
> > -#| yasm not found, use --disable-yasm for a crippled build
> > -EXTRA_OECONF_append_x86-64 =3D " --disable-yasm"
> > -EXTRA_OECONF_append_x86 =3D " --disable-yasm"
> > -
> > -do_configure() {
> > -    # We don't have TARGET_PREFIX-pkgconfig
> > -    sed -i '/pkg_config_default=3D"${cross_prefix}${pkg_config_default=
}"/d' ${S}/configure
> > -    mkdir -p ${B}
> > -    cd ${B}
> > -    ${S}/configure ${EXTRA_OECONF}
> > -    sed -i -e s:Os:O4:g ${B}/config.h
> > -}
> > -
> > -do_install_append() {
> > -    install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
> > -}
> > -
> > -FFMPEG_LIBS =3D "libavcodec libavdevice libavformat \
> > -               libavutil libpostproc libswscale libavfilter"
> > -
> > -PACKAGES +=3D "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> > -
> > -RSUGGESTS_${PN} =3D "mplayer"
> > -FILES_${PN} =3D "${bindir}"
> > -FILES_${PN}-dev =3D "${includedir}/${PN}"
> > -
> > -FILES_${PN}-vhook =3D "${libdir}/vhook"
> > -FILES_${PN}-vhook-dbg +=3D "${libdir}/vhook/.debug"
> > -
> > -FILES_ffmpeg-x264-presets =3D "${datadir}/*.avpreset"
> > -
> > -LEAD_SONAME =3D "libavcodec.so"
> > -
> > -FILES_${PN}-dev =3D "${includedir}"
> > -
> > -python populate_packages_prepend() {
> > -    av_libdir =3D d.expand('${libdir}')
> > -    av_pkgconfig =3D d.expand('${libdir}/pkgconfig')
> > -
> > -    # Runtime package
> > -    do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
> > -                      output_pattern=3D'lib%s',
> > -                      description=3D'libav %s library',
> > -                      extra_depends=3D'',
> > -                      prepend=3DTrue,
> > -                      allow_links=3DTrue)
> > -
> > -    # Development packages (-dev, -staticdev)
> > -    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
> > -                      output_pattern=3D'lib%s-dev',
> > -                      description=3D'libav %s development package',
> > -                      extra_depends=3D'${PN}-dev',
> > -                      prepend=3DTrue,
> > -                      allow_links=3DTrue)
> > -    do_split_packages(d, av_pkgconfig, '^lib(.*)\.pc$',
> > -                      output_pattern=3D'lib%s-dev',
> > -                      description=3D'libav %s development package',
> > -                      extra_depends=3D'${PN}-dev',
> > -                      prepend=3DTrue)
> > -    do_split_packages(d, av_libdir, '^lib(.*)\.a$',
> > -                      output_pattern=3D'lib%s-staticdev',
> > -                      description=3D'libav %s development package - st=
atic library',
> > -                      extra_depends=3D'${PN}-dev',
> > -                      prepend=3DTrue,
> > -                      allow_links=3DTrue)
> > -}
> > -
> > -PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|postpr=
oc).*"
> > diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb b/meta-oe/=
recipes-multimedia/libav/libav_0.8.4.bb
> > deleted file mode 100644
> > index b48ae96..0000000
> > --- a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -require libav.inc
> > -
> > -EXTRA_OECONF +=3D " \
> > -    --enable-postproc \
> > -"
> > -
> > -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/libav-0.8.4:"
> > -
> > -SRC_URI_append =3D " \
> > -    file://0001-configure-enable-pic-for-AArch64.patch \
> > -"
> > -LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \
> > -                    file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80=
d47fae504 \
> > -                    file://COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cb=
d79d7bd3a379 \
> > -                    file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983=
680233ad02"
> > -
> > -PV =3D "0.8.4+git${SRCPV}"
> > -PR =3D "${INC_PR}.0"
> > -
> > -# When bumping SRCREV make sure you bump PR here and in dependant
> > -# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
> > -# changes
> > -SRCREV =3D "2c8ce46250ff78191fe6565876ddc4bc03fdf519"
> > -SRC_URI =3D "git://git.libav.org/libav.git;protocol=3Dgit;branch=3Drel=
ease/0.8"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -
> > diff --git a/meta-oe/recipes-multimedia/libav/libav_git.bb b/meta-oe/re=
cipes-multimedia/libav/libav_git.bb
> > deleted file mode 100644
> > index d12bd9d..0000000
> > --- a/meta-oe/recipes-multimedia/libav/libav_git.bb
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -require libav.inc
> > -
> > -LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \
> > -                    file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80=
d47fae504 \
> > -                    file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c=
18d1b79df004 \
> > -                    file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983=
680233ad02"
> > -
> > -DEPENDS +=3D "libpostproc"
> > -PV =3D "0.8.99+git${SRCPV}"
> > -PR =3D "${INC_PR}.0"
> > -
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -# When bumping SRCREV make sure you bump PR here and in dependant
> > -# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
> > -# changes
> > -SRCREV =3D "4673a5a761f329af0aa56fc84f34ed898188bfa2"
> > -SRC_URI =3D "git://git.libav.org/libav.git;protocol=3Dgit"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -# postproc has been split
> > -EXTRA_OECONF :=3D "${@oe_filter_out('--enable-postproc', '${EXTRA_OECO=
NF}', d)}"
> >
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FbmEh7Ek6NM6xKh/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILI1oACgkQN1Ujt2V2gBwglwCgr1JWVKbrWTsEtpvBN/b2xlb6
t3sAn1iHpOt2Kg8uuFNZIU9E1pgPbEyD
=j0M0
-----END PGP SIGNATURE-----

--FbmEh7Ek6NM6xKh/--
