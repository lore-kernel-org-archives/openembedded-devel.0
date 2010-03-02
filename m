Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmZJr-0000Vy-8G for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 22:08:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmZH6-0000Pi-OJ for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 22:05:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 22:05:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 22:05:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Mar 2010 22:02:03 +0100
Message-ID: <hmjucb$9v9$1@dough.gmane.org>
References: <1267553457.4739.324.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1267553457.4739.324.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 02 Mar 2010 21:08:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-03-10 19:10, Tom Rini wrote:
> firefox: Perform a number of cleanups and consistency issues.

What are your thoughts on building things like xul and nss seperately so
things like chromium can use them?

regards,

Koen

> 
> - parallel builds need to happen via MOZ_MAKE_FLAGS and it gripes if
> still passed -jN, so keep the old value before we clear it.
> - Move the HOST_LIBIDL stuff into configure, otherwise bad things happen
> when you don't have pkg-config on the build host.
> - Prior to 3.6, wireless-tools can be, or not be built already and the
> Necko wifi options deals.  With how 3.6 is configured, it must be
> disabled or DEPENDED on.  For consistency, turn it off.
> - In 3.5 and newer, libnotify can be used, add it to DEPENDS (could be
> disabled).
> - Because of both of the above, bump PR.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> diff --git a/classes/mozilla.bbclass b/classes/mozilla.bbclass
> index c9a3966..4e3054b 100644
> --- a/classes/mozilla.bbclass
> +++ b/classes/mozilla.bbclass
> @@ -6,10 +6,12 @@ SRC_URI += "file://mozconfig"
>  
>  inherit gettext pkgconfig
>  
> +# Parallel make is special in mozilla.
> +OLD_PARALLEL_MAKE := "${PARALLEL_MAKE}"
> +PARALLEL_MAKE = ""
> +
>  EXTRA_OECONF = "--target=${TARGET_SYS} --host=${BUILD_SYS} \
>  		--build=${BUILD_SYS} --prefix=${prefix}"
> -EXTRA_OEMAKE = "'HOST_LIBIDL_LIBS=${HOST_LIBIDL_LIBS}' \
> -		'HOST_LIBIDL_CFLAGS=${HOST_LIBIDL_CFLAGS}'"
>  SELECTED_OPTIMIZATION = "-Os -fsigned-char -fno-strict-aliasing"
>  
>  export CROSS_COMPILE = "1"
> @@ -17,9 +19,6 @@ export MOZCONFIG = "${WORKDIR}/mozconfig"
>  export MOZ_OBJDIR = "${S}"
>  
>  export CONFIGURE_ARGS = "${EXTRA_OECONF}"
> -export HOST_LIBIDL_CFLAGS = "`${HOST_LIBIDL_CONFIG} --cflags`"
> -export HOST_LIBIDL_LIBS = "`${HOST_LIBIDL_CONFIG} --libs`"
> -export HOST_LIBIDL_CONFIG = "PKG_CONFIG_PATH=
> ${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
>  export HOST_CC = "${BUILD_CC}"
>  export HOST_CXX = "${BUILD_CXX}"
>  export HOST_CFLAGS = "${BUILD_CFLAGS}"
> @@ -38,7 +37,22 @@ mozilla_do_configure() {
>  			`dirname $cg`/
>  		done
>  	)
> -	if [ -e ${MOZ_OBJDIR}/Makefile ] ; then 
> +
> +	# Put PARALLEL_MAKE into mozconfig
> +	if [ ! -z "${OLD_PARALLEL_MAKE}" ] ; then
> +		echo mk_add_options MOZ_MAKE_FLAGS=\"${OLD_PARALLEL_MAKE}\" \
> +			>> ${MOZCONFIG}
> +	fi
> +
> +	# Set the host libIDL stuff correctly.
> +	export HOST_LIBIDL_CONFIG="PKG_CONFIG_PATH=
> ${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
> +	# Due to sysroot we need to sed out references to the target staging
> +	# when building the native version of xpidl Symptons of the failure
> +	# include "gthread.h:344: error: size of array 'type name' is
> negative"
> +	export HOST_LIBIDL_CFLAGS="`${HOST_LIBIDL_CONFIG} --cflags | sed -e s:
> ${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}:g`"
> +	export HOST_LIBIDL_LIBS="`${HOST_LIBIDL_CONFIG} --libs`"
> +
> +	if [ -e ${MOZ_OBJDIR}/Makefile ] ; then
>  		oe_runmake -f client.mk ${MOZ_OBJDIR}/Makefile \
>  					${MOZ_OBJDIR}/config.status
>  	fi
> diff --git a/recipes/mozilla/fennec_hg.bb b/recipes/mozilla/fennec_hg.bb
> index ef4cedd..ada5fa8 100644
> --- a/recipes/mozilla/fennec_hg.bb
> +++ b/recipes/mozilla/fennec_hg.bb
> @@ -19,8 +19,6 @@ require firefox.inc
>  
>  DEPENDS += "libnotify autoconf213-native cairo alsa-lib sqlite3"
>  
> -PARALLEL_MAKE = ""
> -
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  export LIBXUL_DIST="${S}/objdir/xulrunner/dist/"
> diff --git a/recipes/mozilla/firefox-3.5.2/mozconfig
> b/recipes/mozilla/firefox-3.5.2/mozconfig
> index d8d3f39..7e2ade0 100644
> --- a/recipes/mozilla/firefox-3.5.2/mozconfig
> +++ b/recipes/mozilla/firefox-3.5.2/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
>  ac_add_options --disable-installer
>  ac_add_options --disable-xprint
>  ac_add_options --disable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
>  ac_add_options --disable-updater
>  
>  # configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox-3.5.4/mozconfig
> b/recipes/mozilla/firefox-3.5.4/mozconfig
> index d8d3f39..7e2ade0 100644
> --- a/recipes/mozilla/firefox-3.5.4/mozconfig
> +++ b/recipes/mozilla/firefox-3.5.4/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
>  ac_add_options --disable-installer
>  ac_add_options --disable-xprint
>  ac_add_options --disable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
>  ac_add_options --disable-updater
>  
>  # configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox-3.5.5/mozconfig
> b/recipes/mozilla/firefox-3.5.5/mozconfig
> index d8d3f39..7e2ade0 100644
> --- a/recipes/mozilla/firefox-3.5.5/mozconfig
> +++ b/recipes/mozilla/firefox-3.5.5/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
>  ac_add_options --disable-installer
>  ac_add_options --disable-xprint
>  ac_add_options --disable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
>  ac_add_options --disable-updater
>  
>  # configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox-3.6/mozconfig
> b/recipes/mozilla/firefox-3.6/mozconfig
> index b561f06..883a396 100644
> --- a/recipes/mozilla/firefox-3.6/mozconfig
> +++ b/recipes/mozilla/firefox-3.6/mozconfig
> @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
>  ac_add_options --disable-installer
>  ac_add_options --disable-xprint
>  ac_add_options --enable-necko-disk-cache
> +ac_add_options --disable-necko-wifi
>  ac_add_options --disable-updater
>  
>  # configure necko to allocate smaller network buffers
> diff --git a/recipes/mozilla/firefox.inc b/recipes/mozilla/firefox.inc
> index b0e79f9..cf429f0 100644
> --- a/recipes/mozilla/firefox.inc
> +++ b/recipes/mozilla/firefox.inc
> @@ -2,7 +2,6 @@ DESCRIPTION ?= "Browser made by mozilla"
>  DEPENDS += "alsa-lib"
>  SRC_URI += "file://mozilla-${PN}.png file://mozilla-${PN}.desktop"
>  
> -PARALLEL_MAKE = ""
>  ARM_INSTRUCTION_SET = "arm"
>  
>  MOZPV ?= "${PV}"
> @@ -31,13 +30,6 @@ FILES_${PN}-dbg += "	${libdir}/${PN}-*/.debug \
>  			${bindir}/.debug \
>  			"
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
> -
> -# Due to sysroot we need to sed out references to the target staging
> when building the native version of xpidl
> -# Symptons of the failure include "gthread.h:344: error: size of array
> 'type name' is negative"
> -export HOST_LIBIDL_CFLAGS = "`${HOST_LIBIDL_CONFIG} --cflags | sed -e
> s:${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}:g`"
> -
> -
>  do_install() {
>  	oe_runmake DESTDIR="${D}" destdir="${D}" install
>  	install -d ${D}${datadir}/applications
> diff --git a/recipes/mozilla/firefox_3.0.1.bb
> b/recipes/mozilla/firefox_3.0.1.bb
> index ee60fc0..72c72bd 100644
> --- a/recipes/mozilla/firefox_3.0.1.bb
> +++ b/recipes/mozilla/firefox_3.0.1.bb
> @@ -23,7 +23,6 @@ S = "${WORKDIR}/mozilla"
>  inherit mozilla
>  require firefox.inc
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.0.4.bb
> b/recipes/mozilla/firefox_3.0.4.bb
> index 7cfebfc..f783000 100644
> --- a/recipes/mozilla/firefox_3.0.4.bb
> +++ b/recipes/mozilla/firefox_3.0.4.bb
> @@ -23,7 +23,6 @@ DEFAULT_PREFERENCE = "-1"
>  inherit mozilla
>  require firefox.inc
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.0.8.bb
> b/recipes/mozilla/firefox_3.0.8.bb
> index 541a542..5ce6f95 100644
> --- a/recipes/mozilla/firefox_3.0.8.bb
> +++ b/recipes/mozilla/firefox_3.0.8.bb
> @@ -23,7 +23,6 @@ S = "${WORKDIR}/mozilla"
>  inherit mozilla
>  require firefox.inc
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.1b1.bb
> b/recipes/mozilla/firefox_3.1b1.bb
> index 7a41491..54113f4 100644
> --- a/recipes/mozilla/firefox_3.1b1.bb
> +++ b/recipes/mozilla/firefox_3.1b1.bb
> @@ -17,7 +17,6 @@ DEFAULT_PREFERENCE = "-1"
>  inherit mozilla
>  require firefox.inc
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_configure_prepend() {
> diff --git a/recipes/mozilla/firefox_3.1b2.bb
> b/recipes/mozilla/firefox_3.1b2.bb
> index 2d661ea..7be8baa 100644
> --- a/recipes/mozilla/firefox_3.1b2.bb
> +++ b/recipes/mozilla/firefox_3.1b2.bb
> @@ -16,7 +16,6 @@ DEFAULT_PREFERENCE = "-1"
>  inherit mozilla
>  require firefox.inc
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_configure_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5.2.bb
> b/recipes/mozilla/firefox_3.5.2.bb
> index 3d940d7..b6e265b 100644
> --- a/recipes/mozilla/firefox_3.5.2.bb
> +++ b/recipes/mozilla/firefox_3.5.2.bb
> @@ -1,5 +1,6 @@
> -DEPENDS += "cairo sqlite3"
> -PR = "r3"
> +DEPENDS += "cairo sqlite3 libnotify"
> +
> +PR = "r4"
>  
>  SRC_URI =
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}-source.tar.bz2 \
>  	file://jsautocfg.h \
> @@ -25,7 +26,6 @@ require firefox.inc
>  EXTRA_OECONF += " --enable-official-branding "
>  
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5.4.bb
> b/recipes/mozilla/firefox_3.5.4.bb
> index 8ba6ba1..b1b2af3 100644
> --- a/recipes/mozilla/firefox_3.5.4.bb
> +++ b/recipes/mozilla/firefox_3.5.4.bb
> @@ -1,6 +1,6 @@
> -DEPENDS += "cairo sqlite3"
> +DEPENDS += "cairo sqlite3 libnotify"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI =
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2 \
>  	file://jsautocfg.h \
> @@ -26,7 +26,6 @@ require firefox.inc
>  EXTRA_OECONF += " --enable-official-branding "
>  
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5.5.bb
> b/recipes/mozilla/firefox_3.5.5.bb
> index da54872..ea3d4fc 100644
> --- a/recipes/mozilla/firefox_3.5.5.bb
> +++ b/recipes/mozilla/firefox_3.5.5.bb
> @@ -1,6 +1,6 @@
> -DEPENDS += "cairo sqlite3"
> +DEPENDS += "cairo sqlite3 libnotify"
>  
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI =
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2 \
>  	file://jsautocfg.h \
> @@ -26,7 +26,6 @@ require firefox.inc
>  EXTRA_OECONF += " --enable-official-branding --disable-crashreporter"
>  
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_3.5b4.bb
> b/recipes/mozilla/firefox_3.5b4.bb
> index 4a12329..0418c3b 100644
> --- a/recipes/mozilla/firefox_3.5b4.bb
> +++ b/recipes/mozilla/firefox_3.5b4.bb
> @@ -1,8 +1,8 @@
> -DEPENDS += "cairo sqlite"
> +DEPENDS += "cairo sqlite libnotify"
>  
>  PV = "3.0.1+3.5b4"
>  MOZPV = "3.5b4"
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI =
> "http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/${MOZPV}-candidates/build1/source/firefox-${MOZPV}-source.tar.bz2 \
>  	file://jsautocfg.h \
> @@ -16,7 +16,6 @@ DEFAULT_PREFERENCE = "-10"
>  inherit mozilla
>  require firefox.inc
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_configure_prepend() {
> diff --git a/recipes/mozilla/firefox_3.6.bb
> b/recipes/mozilla/firefox_3.6.bb
> index 82e92be..43e42b7 100644
> --- a/recipes/mozilla/firefox_3.6.bb
> +++ b/recipes/mozilla/firefox_3.6.bb
> @@ -1,6 +1,6 @@
> -DEPENDS += "cairo sqlite3"
> +DEPENDS += "cairo sqlite3 libnotify"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI =
> "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
>  	file://jsautocfg.h \
> @@ -28,7 +28,6 @@ require firefox.inc
>  EXTRA_OECONF += " --enable-official-branding --disable-crashreporter"
>  
>  
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  do_compile_prepend() {
> diff --git a/recipes/mozilla/firefox_hg.bb
> b/recipes/mozilla/firefox_hg.bb
> index 17a46ee..37bb260 100644
> --- a/recipes/mozilla/firefox_hg.bb
> +++ b/recipes/mozilla/firefox_hg.bb
> @@ -17,8 +17,6 @@ S = "${WORKDIR}/mozilla-central"
>  inherit mozilla
>  require firefox.inc
>  
> -PARALLEL_MAKE = ""
> -export HOST_LIBIDL_CONFIG = "${STAGING_BINDIR_NATIVE}/libIDL-config-2"
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
>  
>  export LIBXUL_DIST="${S}/objdir/xulrunner/dist/"
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjXzLMkyGM64RGpERAkzkAJ9drWWVHCSMuHXJIu61JBrNo7zyWgCeLoH0
8TbZpBGWsiWX79vJeES1PnY=
=EUW5
-----END PGP SIGNATURE-----



