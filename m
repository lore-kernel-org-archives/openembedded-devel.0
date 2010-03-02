Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmWke-0000j7-Qz
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 19:23:34 +0100
Received: by iwn10 with SMTP id 10so439478iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 10:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=esCKs0M3fN5W2BgdL2G4omLgnVSnWdDU0kDUKP91caM=;
	b=GAas67scpCRP/tFpei7RdzV88oDaSgRdnmy9qKSeN07mxgilnoc8yz83+Xy4hi7AA2
	brSMyjEnvSeIY80TUW9c8JoAVV4lnfpNcDB/SL7Peh2YAHW4FyG8t4fhHXCLTC826ASb
	lvp0YfRjWfmd3ZXEZ6g65pd+e3DmU4e5sOa8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iK5Utd2mzxRhqoVcxLZ1FfvUKjwQrIagoNK94gFx2wDmCrBovCmJ3HoyL88grJyLq8
	/nl98slqPnDRS1gKZsA7OacgUiAtZXzFMDrTfH79oe2P74dgq9MQGpI35QzKl08uLN5t
	NiJcgCfZWPAF240p8gwar4WfcZ060az+8hYbY=
MIME-Version: 1.0
Received: by 10.231.153.141 with SMTP id k13mr341051ibw.95.1267554032082; Tue, 
	02 Mar 2010 10:20:32 -0800 (PST)
In-Reply-To: <1267553457.4739.324.camel@trini-m4400>
References: <1267553457.4739.324.camel@trini-m4400>
Date: Tue, 2 Mar 2010 10:20:32 -0800
Message-ID: <19c1b8a91003021020w3d4cabb7je39bc9f51eb0b0bc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Firefox cleanups
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
X-List-Received-Date: Tue, 02 Mar 2010 18:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 2, 2010 at 10:10 AM, Tom Rini <tom_rini@mentor.com> wrote:
> firefox: Perform a number of cleanups and consistency issues.
>
> - parallel builds need to happen via MOZ_MAKE_FLAGS and it gripes if
> still passed -jN, so keep the old value before we clear it.
> - Move the HOST_LIBIDL stuff into configure, otherwise bad things happen
> when you don't have pkg-config on the build host.
> - Prior to 3.6, wireless-tools can be, or not be built already and the
> Necko wifi options deals. =A0With how 3.6 is configured, it must be
> disabled or DEPENDED on. =A0For consistency, turn it off.
> - In 3.5 and newer, libnotify can be used, add it to DEPENDS (could be
> disabled).
> - Because of both of the above, bump PR.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> diff --git a/classes/mozilla.bbclass b/classes/mozilla.bbclass
> index c9a3966..4e3054b 100644
> --- a/classes/mozilla.bbclass
> +++ b/classes/mozilla.bbclass
> @@ -6,10 +6,12 @@ SRC_URI +=3D "file://mozconfig"
>
> =A0inherit gettext pkgconfig
>
> +# Parallel make is special in mozilla.
> +OLD_PARALLEL_MAKE :=3D "${PARALLEL_MAKE}"
> +PARALLEL_MAKE =3D ""
> +
> =A0EXTRA_OECONF =3D "--target=3D${TARGET_SYS} --host=3D${BUILD_SYS} \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--build=3D${BUILD_SYS} --prefix=3D${prefix=
}"
> -EXTRA_OEMAKE =3D "'HOST_LIBIDL_LIBS=3D${HOST_LIBIDL_LIBS}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 'HOST_LIBIDL_CFLAGS=3D${HOST_LIBIDL_CFLAGS}=
'"
> =A0SELECTED_OPTIMIZATION =3D "-Os -fsigned-char -fno-strict-aliasing"
>
> =A0export CROSS_COMPILE =3D "1"
> @@ -17,9 +19,6 @@ export MOZCONFIG =3D "${WORKDIR}/mozconfig"
> =A0export MOZ_OBJDIR =3D "${S}"
>
> =A0export CONFIGURE_ARGS =3D "${EXTRA_OECONF}"
> -export HOST_LIBIDL_CFLAGS =3D "`${HOST_LIBIDL_CONFIG} --cflags`"
> -export HOST_LIBIDL_LIBS =3D "`${HOST_LIBIDL_CONFIG} --libs`"
> -export HOST_LIBIDL_CONFIG =3D "PKG_CONFIG_PATH=3D
> ${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
> =A0export HOST_CC =3D "${BUILD_CC}"
> =A0export HOST_CXX =3D "${BUILD_CXX}"
> =A0export HOST_CFLAGS =3D "${BUILD_CFLAGS}"
> @@ -38,7 +37,22 @@ mozilla_do_configure() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0`dirname $cg`/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done
> =A0 =A0 =A0 =A0)
> - =A0 =A0 =A0 if [ -e ${MOZ_OBJDIR}/Makefile ] ; then
> +
> + =A0 =A0 =A0 # Put PARALLEL_MAKE into mozconfig
> + =A0 =A0 =A0 if [ ! -z "${OLD_PARALLEL_MAKE}" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo mk_add_options MOZ_MAKE_FLAGS=3D\"${OL=
D_PARALLEL_MAKE}\" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 >> ${MOZCONFIG}
> + =A0 =A0 =A0 fi
> +
> + =A0 =A0 =A0 # Set the host libIDL stuff correctly.
> + =A0 =A0 =A0 export HOST_LIBIDL_CONFIG=3D"PKG_CONFIG_PATH=3D
> ${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
> + =A0 =A0 =A0 # Due to sysroot we need to sed out references to the targe=
t staging
> + =A0 =A0 =A0 # when building the native version of xpidl Symptons of the=
 failure
> + =A0 =A0 =A0 # include "gthread.h:344: error: size of array 'type name' =
is
> negative"
> + =A0 =A0 =A0 export HOST_LIBIDL_CFLAGS=3D"`${HOST_LIBIDL_CONFIG} --cflag=
s | sed -e s:
> ${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}:g`"
> + =A0 =A0 =A0 export HOST_LIBIDL_LIBS=3D"`${HOST_LIBIDL_CONFIG} --libs`"
> +
> + =A0 =A0 =A0 if [ -e ${MOZ_OBJDIR}/Makefile ] ; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oe_runmake -f client.mk ${MOZ_OBJDIR}/Make=
file \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0${MOZ_OBJDIR}/config.status
> =A0 =A0 =A0 =A0fi
> diff --git a/recipes/mozilla/fennec_hg.bb b/recipes/mozilla/fennec_hg.bb
> index ef4cedd..ada5fa8 100644
> --- a/recipes/mozilla/fennec_hg.bb
> +++ b/recipes/mozilla/fennec_hg.bb
> @@ -19,8 +19,6 @@ require firefox.inc
>
> =A0DEPENDS +=3D "libnotify autoconf213-native cairo alsa-lib sqlite3"
>
> -PARALLEL_MAKE =3D ""
> -
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0export LIBXUL_DIST=3D"${S}/objdir/xulrunner/dist/"
> diff --git a/recipes/mozilla/firefox-3.5.2/mozconfig
> b/recipes/mozilla/firefox-3.5.2/mozconfig
> index d8d3f39..7e2ade0 100644
> --- a/recipes/mozilla/firefox-3.5.2/mozconfig
> +++ b/recipes/mozilla/firefox-3.5.2/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> =A0ac_add_options --disable-installer
> =A0ac_add_options --disable-xprint
> =A0ac_add_options --disable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
> =A0ac_add_options --disable-updater
>
> =A0# configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox-3.5.4/mozconfig
> b/recipes/mozilla/firefox-3.5.4/mozconfig
> index d8d3f39..7e2ade0 100644
> --- a/recipes/mozilla/firefox-3.5.4/mozconfig
> +++ b/recipes/mozilla/firefox-3.5.4/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> =A0ac_add_options --disable-installer
> =A0ac_add_options --disable-xprint
> =A0ac_add_options --disable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
> =A0ac_add_options --disable-updater
>
> =A0# configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox-3.5.5/mozconfig
> b/recipes/mozilla/firefox-3.5.5/mozconfig
> index d8d3f39..7e2ade0 100644
> --- a/recipes/mozilla/firefox-3.5.5/mozconfig
> +++ b/recipes/mozilla/firefox-3.5.5/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> =A0ac_add_options --disable-installer
> =A0ac_add_options --disable-xprint
> =A0ac_add_options --disable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
> =A0ac_add_options --disable-updater
>
> =A0# configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox-3.6/mozconfig
> b/recipes/mozilla/firefox-3.6/mozconfig
> index b561f06..883a396 100644
> --- a/recipes/mozilla/firefox-3.6/mozconfig
> +++ b/recipes/mozilla/firefox-3.6/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> =A0ac_add_options --disable-installer
> =A0ac_add_options --disable-xprint
> =A0ac_add_options --enable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
> =A0ac_add_options --disable-updater
>
> =A0# configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox.inc b/recipes/mozilla/firefox.inc
> index b0e79f9..cf429f0 100644
> --- a/recipes/mozilla/firefox.inc
> +++ b/recipes/mozilla/firefox.inc
> @@ -2,7 +2,6 @@ DESCRIPTION ?=3D "Browser made by mozilla"
> =A0DEPENDS +=3D "alsa-lib"
> =A0SRC_URI +=3D "file://mozilla-${PN}.png file://mozilla-${PN}.desktop"
>
> -PARALLEL_MAKE =3D ""
> =A0ARM_INSTRUCTION_SET =3D "arm"
>
> =A0MOZPV ?=3D "${PV}"
> @@ -31,13 +30,6 @@ FILES_${PN}-dbg +=3D " ${libdir}/${PN}-*/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${bindir}/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> -
> -# Due to sysroot we need to sed out references to the target staging
> when building the native version of xpidl
> -# Symptons of the failure include "gthread.h:344: error: size of array
> 'type name' is negative"
> -export HOST_LIBIDL_CFLAGS =3D "`${HOST_LIBIDL_CONFIG} --cflags | sed -e
> s:${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}:g`"
> -
> -
> =A0do_install() {
> =A0 =A0 =A0 =A0oe_runmake DESTDIR=3D"${D}" destdir=3D"${D}" install
> =A0 =A0 =A0 =A0install -d ${D}${datadir}/applications
> diff --git a/recipes/mozilla/firefox_3.0.1.bb
> b/recipes/mozilla/firefox_3.0.1.bb
> index ee60fc0..72c72bd 100644
> --- a/recipes/mozilla/firefox_3.0.1.bb
> +++ b/recipes/mozilla/firefox_3.0.1.bb
> @@ -23,7 +23,6 @@ S =3D "${WORKDIR}/mozilla"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.0.4.bb
> b/recipes/mozilla/firefox_3.0.4.bb
> index 7cfebfc..f783000 100644
> --- a/recipes/mozilla/firefox_3.0.4.bb
> +++ b/recipes/mozilla/firefox_3.0.4.bb
> @@ -23,7 +23,6 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.0.8.bb
> b/recipes/mozilla/firefox_3.0.8.bb
> index 541a542..5ce6f95 100644
> --- a/recipes/mozilla/firefox_3.0.8.bb
> +++ b/recipes/mozilla/firefox_3.0.8.bb
> @@ -23,7 +23,6 @@ S =3D "${WORKDIR}/mozilla"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.1b1.bb
> b/recipes/mozilla/firefox_3.1b1.bb
> index 7a41491..54113f4 100644
> --- a/recipes/mozilla/firefox_3.1b1.bb
> +++ b/recipes/mozilla/firefox_3.1b1.bb
> @@ -17,7 +17,6 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_configure_prepend() {
> diff --git a/recipes/mozilla/firefox_3.1b2.bb
> b/recipes/mozilla/firefox_3.1b2.bb
> index 2d661ea..7be8baa 100644
> --- a/recipes/mozilla/firefox_3.1b2.bb
> +++ b/recipes/mozilla/firefox_3.1b2.bb
> @@ -16,7 +16,6 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_configure_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5.2.bb
> b/recipes/mozilla/firefox_3.5.2.bb
> index 3d940d7..b6e265b 100644
> --- a/recipes/mozilla/firefox_3.5.2.bb
> +++ b/recipes/mozilla/firefox_3.5.2.bb
> @@ -1,5 +1,6 @@
> -DEPENDS +=3D "cairo sqlite3"
> -PR =3D "r3"
> +DEPENDS +=3D "cairo sqlite3 libnotify"
> +
> +PR =3D "r4"
>
> =A0SRC_URI =3D
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fire=
fox-${PV}-source.tar.bz2 \
> =A0 =A0 =A0 =A0file://jsautocfg.h \
> @@ -25,7 +26,6 @@ require firefox.inc
> =A0EXTRA_OECONF +=3D " --enable-official-branding "
>
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5.4.bb
> b/recipes/mozilla/firefox_3.5.4.bb
> index 8ba6ba1..b1b2af3 100644
> --- a/recipes/mozilla/firefox_3.5.4.bb
> +++ b/recipes/mozilla/firefox_3.5.4.bb
> @@ -1,6 +1,6 @@
> -DEPENDS +=3D "cairo sqlite3"
> +DEPENDS +=3D "cairo sqlite3 libnotify"
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fire=
fox-${PV}.source.tar.bz2 \
> =A0 =A0 =A0 =A0file://jsautocfg.h \
> @@ -26,7 +26,6 @@ require firefox.inc
> =A0EXTRA_OECONF +=3D " --enable-official-branding "
>
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5.5.bb
> b/recipes/mozilla/firefox_3.5.5.bb
> index da54872..ea3d4fc 100644
> --- a/recipes/mozilla/firefox_3.5.5.bb
> +++ b/recipes/mozilla/firefox_3.5.5.bb
> @@ -1,6 +1,6 @@
> -DEPENDS +=3D "cairo sqlite3"
> +DEPENDS +=3D "cairo sqlite3 libnotify"
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fire=
fox-${PV}.source.tar.bz2 \
> =A0 =A0 =A0 =A0file://jsautocfg.h \
> @@ -26,7 +26,6 @@ require firefox.inc
> =A0EXTRA_OECONF +=3D " --enable-official-branding --disable-crashreporter=
"
>
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5b4.bb
> b/recipes/mozilla/firefox_3.5b4.bb
> index 4a12329..0418c3b 100644
> --- a/recipes/mozilla/firefox_3.5b4.bb
> +++ b/recipes/mozilla/firefox_3.5b4.bb
> @@ -1,8 +1,8 @@
> -DEPENDS +=3D "cairo sqlite"
> +DEPENDS +=3D "cairo sqlite libnotify"
>
> =A0PV =3D "3.0.1+3.5b4"
> =A0MOZPV =3D "3.5b4"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D
> "http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/${MOZPV}-candidat=
es/build1/source/firefox-${MOZPV}-source.tar.bz2 \
> =A0 =A0 =A0 =A0file://jsautocfg.h \
> @@ -16,7 +16,6 @@ DEFAULT_PREFERENCE =3D "-10"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_configure_prepend() {
> diff --git a/recipes/mozilla/firefox_3.6.bb
> b/recipes/mozilla/firefox_3.6.bb
> index 82e92be..43e42b7 100644
> --- a/recipes/mozilla/firefox_3.6.bb
> +++ b/recipes/mozilla/firefox_3.6.bb
> @@ -1,6 +1,6 @@
> -DEPENDS +=3D "cairo sqlite3"
> +DEPENDS +=3D "cairo sqlite3 libnotify"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fire=
fox-${PV}.source.tar.bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://jsautocfg.h \
> @@ -28,7 +28,6 @@ require firefox.inc
> =A0EXTRA_OECONF +=3D " --enable-official-branding --disable-crashreporter=
"
>
>
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_hg.bb
> b/recipes/mozilla/firefox_hg.bb
> index 17a46ee..37bb260 100644
> --- a/recipes/mozilla/firefox_hg.bb
> +++ b/recipes/mozilla/firefox_hg.bb
> @@ -17,8 +17,6 @@ S =3D "${WORKDIR}/mozilla-central"
> =A0inherit mozilla
> =A0require firefox.inc
>
> -PARALLEL_MAKE =3D ""
> -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>
> =A0export LIBXUL_DIST=3D"${S}/objdir/xulrunner/dist/"
>
>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


