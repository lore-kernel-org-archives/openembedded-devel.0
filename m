Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Oiz9s-0003mi-0H
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 02:27:43 +0200
Received: (qmail 10871 invoked by uid 1003); 11 Aug 2010 00:27:02 -0000
Received: from localhost (HELO ?192.168.1.148?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 11 Aug 2010 00:26:55 -0000
Message-ID: <4C61EE40.5020201@balister.org>
Date: Tue, 10 Aug 2010 17:26:40 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C61E523.7070405@gmail.com>
In-Reply-To: <4C61E523.7070405@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 00:27:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2010 04:47 PM, Graham Gower wrote:
> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([ \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;

Shouldn't DISTRO's decide on a per DISTRO decision whether or not their 
preferred versions are weak?

I;m not entirely opposed to make the assignment weak for Angstrom, but I 
am very opposed to making all DISTRO's use the same policy.

It is a real nuisance trying to debug someone's Angstrom build, only to 
fins out they have loads of local overrides.

Philip

>
> Signed-off-by: Graham Gower<graham.gower@gmail.com>
> ---
>   conf/distro/amsdelta-oe.conf                       |    2 +-
>   conf/distro/angstrom-2008.1.conf                   |   10 +-
>   conf/distro/celinux-test.conf                      |   14 +-
>   conf/distro/chinook-compat.conf                    |  128 ++--
>   conf/distro/foonas.conf                            |    8 +-
>   conf/distro/gmustix.conf                           |   16 +-
>   .../include/angstrom-2008-preferred-versions.inc   |  114 ++--
>   ...gstrom-codec-engine-2.25-preferred-versions.inc |   22 +-
>   ...rom-codec-engine-2.25.01-preferred-versions.inc |   66 +-
>   ...rom-codec-engine-2.25.02-preferred-versions.inc |   66 +-
>   ...trom-codec-engine-latest-preferred-versions.inc |   66 +-
>   ...-engine-latestproduction-preferred-versions.inc |   66 +-
>   conf/distro/include/angstrom-jalimo.conf           |   20 +-
>   .../include/kaeilos-2009-preferred-versions.inc    |  116 ++--
>   conf/distro/include/maemo-preferred.inc            |   12 +-
>   conf/distro/include/oplinux.inc                    |    2 +-
>   conf/distro/include/preferred-gpe-versions-2.7.inc |    2 +-
>   conf/distro/include/preferred-om-2009-versions.inc |   54 +-
>   .../distro/include/preferred-opie-cvs-versions.inc |    2 +-
>   .../include/preferred-opie-versions-1.2.3.inc      |  384 ++++++------
>   .../include/preferred-opie-versions-1.2.4.inc      |  382 ++++++------
>   conf/distro/include/preferred-opie-versions.inc    |  382 ++++++------
>   conf/distro/include/preferred-shr-versions.inc     |   74 ++--
>   conf/distro/include/preferred-slugos-versions.inc  |    2 +-
>   .../include/preferred-xorg-versions-X11R7.0.inc    |  618 ++++++++++----------
>   conf/distro/include/sane-toolchain-java.inc        |    4 +-
>   conf/distro/include/sane-toolchain.inc             |    6 +-
>   conf/distro/jlime-2010.1.conf                      |   28 +-
>   conf/distro/kaeilos-2010.conf                      |    2 +-
>   conf/distro/kaeilos.conf                           |    8 +-
>   conf/distro/maemo5-compat.conf                     |  116 ++--
>   conf/distro/mamona.conf                            |   10 +-
>   conf/distro/nylon.conf                             |   50 +-
>   conf/distro/openprotium.conf                       |    6 +-
>   conf/distro/oplinux-uclibc.conf                    |    2 +-
>   conf/distro/sharprom-compatible.conf               |    4 +-
>   conf/distro/ucslugc.conf                           |    8 +-
>   conf/distro/wrt54oe.conf                           |   10 +-
>   conf/machine/am3517-evm.conf                       |    2 +-
>   conf/machine/am37x-evm.conf                        |    2 +-
>   conf/machine/amsdelta.conf                         |    2 +-
>   conf/machine/asus730.conf                          |    2 +-
>   conf/machine/at32stk1000.conf                      |    4 +-
>   conf/machine/at91-l9260.conf                       |    2 +-
>   conf/machine/at91cap9adk.conf                      |    4 +-
>   conf/machine/at91sam9260ek.conf                    |    4 +-
>   conf/machine/at91sam9261ek.conf                    |    4 +-
>   conf/machine/at91sam9263ek.conf                    |    4 +-
>   conf/machine/at91sam9g20ek.conf                    |    4 +-
>   conf/machine/at91sam9rlek.conf                     |    4 +-
>   conf/machine/atngw100.conf                         |    2 +-
>   conf/machine/aximx50.conf                          |    2 +-
>   conf/machine/bd-neon.conf                          |    2 +-
>   conf/machine/boc01.conf                            |    2 +-
>   conf/machine/bug20.conf                            |    2 +-
>   conf/machine/canyonlands.conf                      |    4 +-
>   conf/machine/cm-t35.conf                           |    2 +-
>   conf/machine/davinci-sffsdr.conf                   |    2 +-
>   conf/machine/devkitidp-pxa255.conf                 |    2 +-
>   conf/machine/dht-walnut.conf                       |    2 +-
>   conf/machine/dm37x-evm.conf                        |    2 +-
>   conf/machine/ea3250.conf                           |    2 +-
>   conf/machine/em-x270.conf                          |    2 +-
>   conf/machine/fsg3be.conf                           |    4 +-
>   conf/machine/ghi270.conf                           |    2 +-
>   conf/machine/hipox.conf                            |    2 +-
>   conf/machine/hx2000.conf                           |    2 +-
>   conf/machine/hx4700.conf                           |    2 +-
>   conf/machine/include/AT91.inc                      |    6 +-
>   conf/machine/include/collie-2.4.inc                |    2 +-
>   conf/machine/include/orion.inc                     |    2 +-
>   conf/machine/include/simpad-2.4.inc                |    2 +-
>   conf/machine/jornada6xx.conf                       |    2 +-
>   conf/machine/kilauea.conf                          |    2 +-
>   conf/machine/kixrp435.conf                         |    2 +-
>   conf/machine/logicpd-pxa270.conf                   |    2 +-
>   conf/machine/lsmipsel.conf                         |    2 +-
>   conf/machine/magicbox.conf                         |    2 +-
>   conf/machine/magician.conf                         |    2 +-
>   conf/machine/micro2440.conf                        |    2 +-
>   conf/machine/mini2440.conf                         |    2 +-
>   conf/machine/mpc8313e-rdb.conf                     |    2 +-
>   conf/machine/mpc8323e-rdb.conf                     |    2 +-
>   conf/machine/mtx-1.conf                            |    2 +-
>   conf/machine/mtx-2.conf                            |    2 +-
>   conf/machine/mtx-3.conf                            |   16 +-
>   conf/machine/mtx-3a.conf                           |   16 +-
>   conf/machine/n1200.conf                            |    2 +-
>   conf/machine/n2100.conf                            |    2 +-
>   conf/machine/netvista.conf                         |    2 +-
>   conf/machine/neuros-osd.conf                       |    2 +-
>   conf/machine/neuros-osd2.conf                      |    2 +-
>   conf/machine/omap2420h4.conf                       |    2 +-
>   conf/machine/omap2430sdp.conf                      |    2 +-
>   conf/machine/omap3-pandora.conf                    |    4 +-
>   conf/machine/omap3-touchbook.conf                  |    2 +-
>   conf/machine/omap3evm.conf                         |    2 +-
>   conf/machine/omap4430-sdp.conf                     |    2 +-
>   conf/machine/omapzoom.conf                         |    2 +-
>   conf/machine/omapzoom2.conf                        |    2 +-
>   conf/machine/omapzoom36x.conf                      |    4 +-
>   conf/machine/palmpre.conf                          |    2 +-
>   conf/machine/sarge-at91.conf                       |    4 +-
>   conf/machine/sequoia.conf                          |    2 +-
>   conf/machine/stamp9g20evb.conf                     |    2 +-
>   conf/machine/storcenter.conf                       |    4 +-
>   conf/machine/tx25.conf                             |    2 +-
>   conf/machine/tx27.conf                             |    2 +-
>   conf/machine/xilinx-ml507.conf                     |    2 +-
>   conf/machine/xilinx-virtex4.conf                   |    2 +-
>   conf/machine/xilinx-virtex5.conf                   |    2 +-
>   111 files changed, 1543 insertions(+), 1543 deletions(-)
>
> diff --git a/conf/distro/amsdelta-oe.conf b/conf/distro/amsdelta-oe.conf
> index fb20689..03b19ae 100644
> --- a/conf/distro/amsdelta-oe.conf
> +++ b/conf/distro/amsdelta-oe.conf
> @@ -14,7 +14,7 @@ DISTRO_TYPE = "debug"
>   #
>
>   PREFERRED_PROVIDERS += " virtual/libqpe:libqpe-opie"
> -PREFERRED_VERSION_qte = "2.3.10"
> +PREFERRED_VERSION_qte ?= "2.3.10"
>
>   OPIE_VERSION = "1.2.1"
>   require conf/distro/include/preferred-opie-versions.inc
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index c62ae62..9c66618 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -82,8 +82,8 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
>
>   #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
>   LINUX_LIBC_HEADERS_VERSION ?= "2.6.31"
> -PREFERRED_VERSION_linux-libc-headers = "${LINUX_LIBC_HEADERS_VERSION}"
> -PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
> +PREFERRED_VERSION_linux-libc-headers ?= "${LINUX_LIBC_HEADERS_VERSION}"
> +PREFERRED_VERSION_linux-libc-headers-native ?= "${LINUX_LIBC_HEADERS_VERSION}"
>
>   #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>   PREFERRED_VERSION_glibc 			?= "2.9"
> @@ -130,9 +130,9 @@ PREFERRED_VERSION_gcc-cross-initial      ?= "${ANGSTROM_GCC_VERSION}"
>   PREFERRED_VERSION_gcc-cross-intermediate ?= "${ANGSTROM_GCC_VERSION}"
>
>   #avr32 only has patches for binutils 2.17 in OE
> -PREFERRED_VERSION_binutils_avr32 = "2.17"
> -PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
> -PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
> +PREFERRED_VERSION_binutils_avr32 ?= "2.17"
> +PREFERRED_VERSION_binutils-cross_avr32 ?= "2.17"
> +PREFERRED_VERSION_binutils-cross-sdk_avr32 ?= "2.17"
>
>   # Toolchain virtuals:
>   require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> diff --git a/conf/distro/celinux-test.conf b/conf/distro/celinux-test.conf
> index fbc96e1..58b56ce 100644
> --- a/conf/distro/celinux-test.conf
> +++ b/conf/distro/celinux-test.conf
> @@ -40,17 +40,17 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
>   PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
>   PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
>
> -PREFERRED_VERSION_binutils = "2.16"
> -PREFERRED_VERSION_binutils-cross = "2.16"
> +PREFERRED_VERSION_binutils ?= "2.16"
> +PREFERRED_VERSION_binutils-cross ?= "2.16"
>
> -PREFERRED_VERSION_gcc = "3.4.4"
> -PREFERRED_VERSION_gcc-cross = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
> +PREFERRED_VERSION_gcc ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-initial ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "3.4.4"
>
>   LIBC = "glibc"
>   require conf/distro/include/${LIBC}.inc
> -PREFERRED_VERSION_glibc = "2.3.5+cvs20050627"
> +PREFERRED_VERSION_glibc ?= "2.3.5+cvs20050627"
>
>   #
>   # omap5912osk settings
> diff --git a/conf/distro/chinook-compat.conf b/conf/distro/chinook-compat.conf
> index ca1e3ce..43822a5 100644
> --- a/conf/distro/chinook-compat.conf
> +++ b/conf/distro/chinook-compat.conf
> @@ -62,63 +62,63 @@ PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
>   PREFERRED_PROVIDER_util-linux = "util-linux"
>
>
> -PREFERRED_VERSION_automake-native = "1.9.6"
> +PREFERRED_VERSION_automake-native ?= "1.9.6"
>
> -PREFERRED_VERSION_binutils = "2.17.50.0.12"
> -PREFERRED_VERSION_binutils-cross    = "2.18"
> +PREFERRED_VERSION_binutils ?= "2.17.50.0.12"
> +PREFERRED_VERSION_binutils-cross    ?= "2.18"
>
> -PREFERRED_VERSION_gcc = "3.4.4cs2005q3.2"
> -PREFERRED_VERSION_gcc-cross = "3.4.4cs2005q3.2"
> -PREFERRED_VERSION_gcc-cross-initial = "4.1.1"
> -PREFERRED_VERSION_gcc-cross-intermediate = "4.1.1"
> +PREFERRED_VERSION_gcc ?= "3.4.4cs2005q3.2"
> +PREFERRED_VERSION_gcc-cross ?= "3.4.4cs2005q3.2"
> +PREFERRED_VERSION_gcc-cross-initial ?= "4.1.1"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.1"
>
>   #PREFERRED_VERSION_gcc-cross-initial = "3.4.4cs2005q3.2"
>
>   # Use recent enough version of the headers to let HAL build successfully.
> -PREFERRED_VERSION_linux-libc-headers = "2.6.20"
> +PREFERRED_VERSION_linux-libc-headers ?= "2.6.20"
>
> -PREFERRED_VERSION_glibc = "2.5"
> -PREFERRED_VERSION_glibc-initial = "2.5"
> +PREFERRED_VERSION_glibc ?= "2.5"
> +PREFERRED_VERSION_glibc-initial ?= "2.5"
>
> -PREFERRED_VERSION_libtool-native = "1.5.10"
> -PREFERRED_VERSION_libtool-cross = "1.5.10"
> -PREFERRED_VERSION_libtool = "1.5.6"
> +PREFERRED_VERSION_libtool-native ?= "1.5.10"
> +PREFERRED_VERSION_libtool-cross ?= "1.5.10"
> +PREFERRED_VERSION_libtool ?= "1.5.6"
>
>   require conf/distro/include/sane-srcrevs.inc
>
> -PREFERRED_VERSION_fontconfig       = "2.4.1"
> -PREFERRED_VERSION_freetype         = "2.2.1"
> -PREFERRED_VERSION_freetype-native  = "2.2.1"
> -PREFERRED_VERSION_cairo            = "1.4.10"
> -PREFERRED_VERSION_glib-2.0         = "2.12.12"
> -PREFERRED_VERSION_pango            = "1.16.4"
> -PREFERRED_VERSION_atk              = "1.18.0"
> -PREFERRED_VERSION_gtk+             = "2.10.14"
> -PREFERRED_VERSION_libpng           = "1.2.12"
> -PREFERRED_VERSION_expat            = "1.95.7"
> +PREFERRED_VERSION_fontconfig       ?= "2.4.1"
> +PREFERRED_VERSION_freetype         ?= "2.2.1"
> +PREFERRED_VERSION_freetype-native  ?= "2.2.1"
> +PREFERRED_VERSION_cairo            ?= "1.4.10"
> +PREFERRED_VERSION_glib-2.0         ?= "2.12.12"
> +PREFERRED_VERSION_pango            ?= "1.16.4"
> +PREFERRED_VERSION_atk              ?= "1.18.0"
> +PREFERRED_VERSION_gtk+             ?= "2.10.14"
> +PREFERRED_VERSION_libpng           ?= "1.2.12"
> +PREFERRED_VERSION_expat            ?= "1.95.7"
>
>   # only dbus-glib 0.74 works with older dbus 1.0.x
> -PREFERRED_VERSION_dbus             = "1.0.3"
> -PREFERRED_VERSION_dbus-glib        = "0.74"
> +PREFERRED_VERSION_dbus             ?= "1.0.3"
> +PREFERRED_VERSION_dbus-glib        ?= "0.74"
>
> -PREFERRED_VERSION_gnome-vfs        = "2.22.0"
> +PREFERRED_VERSION_gnome-vfs        ?= "2.22.0"
>
>   # 3.9.1 would be correct
> -PREFERRED_VERSION_gtkhtml-3.8      = "3.8.2"
> -PREFERRED_VERSION_libxml2          = "2.7.2"
> +PREFERRED_VERSION_gtkhtml-3.8      ?= "3.8.2"
> +PREFERRED_VERSION_libxml2          ?= "2.7.2"
>   # 2.16 would be correct
> -PREFERRED_VERSION_gconf            = "2.6.1"
> +PREFERRED_VERSION_gconf            ?= "2.6.1"
>
>   # gstreamer
>   # 0.10.13 would be correct (+ maemo patches)
> -PREFERRED_VERSION_gstreamer        = "0.10.17"
> -PREFERRED_VERSION_gst-plugins-good = "0.10.6"
> +PREFERRED_VERSION_gstreamer        ?= "0.10.17"
> +PREFERRED_VERSION_gst-plugins-good ?= "0.10.6"
>   # 0.10.13 would be correct (+ maemo patches)
> -PREFERRED_VERSION_gst-plugins-base = "0.10.14"
> +PREFERRED_VERSION_gst-plugins-base ?= "0.10.14"
>   # 0.11.3 would be correct ( + maemo patches)
> -PREFERRED_VERSION_gst-ffmpeg       = "0.10.2"
> +PREFERRED_VERSION_gst-ffmpeg       ?= "0.10.2"
>
> -PREFERRED_VERSION_bluez-libs            = "3.33"
> +PREFERRED_VERSION_bluez-libs            ?= "3.33"
>
>   PREFERRED_PROVIDER_virtual/db           = "db"
>   PREFERRED_PROVIDER_virtual/db-native    = "db-native"
> @@ -126,19 +126,19 @@ PREFERRED_PROVIDER_virtual/xserver      = "xserver-kdrive"
>
>   # This is a hack to avoid building mesa which crashes the compiler
>   PREFERRED_PROVIDER_virtual/libsdl       = "libsdl-directfb"
> -PREFERRED_VERSION_libsdl-directfb       = "1.2.11"
> -PREFERRED_VERSION_libsdl-image          = "1.2.3"
> -PREFERRED_VERSION_libsdl-mixer          = "1.2.6"
> +PREFERRED_VERSION_libsdl-directfb       ?= "1.2.11"
> +PREFERRED_VERSION_libsdl-image          ?= "1.2.3"
> +PREFERRED_VERSION_libsdl-mixer          ?= "1.2.6"
>
>   PREFERRED_PROVIDER_xserver          = "xserver-kdrive"
>
> -PREFERRED_VERSION_xserver-kdrive    = "1.3.0.0"
> -PREFERRED_VERSION_libxrandr         = "1.2.1"
> -PREFERRED_VERSION_xrandr            = "1.2.0"
> -PREFERRED_VERSION_randrproto        = "1.2.1"
> -PREFERRED_VERSION_libx11			= "1.1.5"
> +PREFERRED_VERSION_xserver-kdrive    ?= "1.3.0.0"
> +PREFERRED_VERSION_libxrandr         ?= "1.2.1"
> +PREFERRED_VERSION_xrandr            ?= "1.2.0"
> +PREFERRED_VERSION_randrproto        ?= "1.2.1"
> +PREFERRED_VERSION_libx11			?= "1.1.5"
>
> -PREFERRED_VERSION_libgnomeui         = "2.18.1"
> +PREFERRED_VERSION_libgnomeui         ?= "2.18.1"
>
>   PREFERRED_PROVIDER_gtk+                   = "gtk+"
>   PREFERRED_PROVIDER_gdk-pixbuf-loader-ani  = "gtk+"
> @@ -157,32 +157,32 @@ PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  = "gtk+"
>
>   PREFERRED_PROVIDER_gconf                  = "gconf-dbus"
>
> -PREFERRED_VERSION_pixman                  = "0.9.6"
> +PREFERRED_VERSION_pixman                  ?= "0.9.6"
>
>   PREFERRED_PROVIDER_virtual/libqte2	  = "qte-mt"
>   PREFERRED_PROVIDER_avahi		  = "avahi"
>
> -PREFERRED_VERSION_avahi = "0.6.20"
> +PREFERRED_VERSION_avahi ?= "0.6.20"
>
> -PREFERRED_VERSION_libsoup = "2.2.7"
> -PREFERRED_VERSION_libglade = "2.4.2"
> -PREFERRED_VERSION_gnutls = "1.4.5"
> -PREFERRED_VERSION_libgpg-error = "1.4"
> -PREFERRED_VERSION_libgcrypt = "1.4.0"
> +PREFERRED_VERSION_libsoup ?= "2.2.7"
> +PREFERRED_VERSION_libglade ?= "2.4.2"
> +PREFERRED_VERSION_gnutls ?= "1.4.5"
> +PREFERRED_VERSION_libgpg-error ?= "1.4"
> +PREFERRED_VERSION_libgcrypt ?= "1.4.0"
>
> -PREFERRED_VERSION_gpe-scap = "1.3"
> +PREFERRED_VERSION_gpe-scap ?= "1.3"
>
>   # various Maemo4 specific libraries
> -PREFERRED_VERSION_mce-dev = "1.6.3"
> -PREFERRED_VERSION_libosso = "2.13"
> -PREFERRED_VERSION_libhildon = "1.99.0"
> -PREFERRED_VERSION_libhildonmime = "1.10.0"
> -PREFERRED_VERSION_libhildonfm = "1.9.46"
> -PREFERRED_VERSION_hildon-thumbnail = "0.14"
> -PREFERRED_VERSION_osso-gwconnect = "1.0.12"
> -PREFERRED_VERSION_osso-gnome-vfs2 = "2.16.3"
> +PREFERRED_VERSION_mce-dev ?= "1.6.3"
> +PREFERRED_VERSION_libosso ?= "2.13"
> +PREFERRED_VERSION_libhildon ?= "1.99.0"
> +PREFERRED_VERSION_libhildonmime ?= "1.10.0"
> +PREFERRED_VERSION_libhildonfm ?= "1.9.46"
> +PREFERRED_VERSION_hildon-thumbnail ?= "0.14"
> +PREFERRED_VERSION_osso-gwconnect ?= "1.0.12"
> +PREFERRED_VERSION_osso-gnome-vfs2 ?= "2.16.3"
>
> -PREFERRED_VERSION_shared-mime-info = "0.22"
> +PREFERRED_VERSION_shared-mime-info ?= "0.22"
>
>   # Java stuff
>   PREFERRED_PROVIDER_midpath = "midpath-maemo"
> @@ -194,16 +194,16 @@ PREFERRED_PROVIDER_virtual/java-initial ?= "jamvm-initial"
>   PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>
>   PREFERRED_PROVIDER_classpath = "classpath"
> -PREFERRED_VERSION_classpath = "0.98"
> +PREFERRED_VERSION_classpath ?= "0.98"
>
>   PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk-hildon"
> -PREFERRED_VERSION_swt3.4-gtk-hildon = "3.4"
> +PREFERRED_VERSION_swt3.4-gtk-hildon ?= "3.4"
>
>   # Does not build with later versions
> -PREFERRED_VERSION_fakeroot-native = "1.9.6"
> +PREFERRED_VERSION_fakeroot-native ?= "1.9.6"
>
>   # newer Versions needs newer autotools we cant relay on
> -PREFERRED_VERSION_guile-native = "1.8.2"
> +PREFERRED_VERSION_guile-native ?= "1.8.2"
>
>   # WARNING: If you change these values after the respective package has
>   # been built the change will have no effect. Edit the package's file in
> diff --git a/conf/distro/foonas.conf b/conf/distro/foonas.conf
> index 57d73a0..b302850 100644
> --- a/conf/distro/foonas.conf
> +++ b/conf/distro/foonas.conf
> @@ -42,10 +42,10 @@ IMAGE_POSTPROCESS_COMMAND += "${MACHINE}_pack_image;"
>   IMAGE_DEVICE_TABLE = "${@bb.which(bb.data.getVar('BBPATH', d, 1), 'files/device_table-slugos.txt')}"
>
>   require conf/distro/include/sane-srcdates.inc
> -PREFERRED_VERSION_openlink = "svn"
> -PREFERRED_VERSION_dtc = "20070216"
> -PREFERRED_VERSION_dtc-native = "20070216"
> -PREFERRED_VERSION_udev = "097"
> +PREFERRED_VERSION_openlink ?= "svn"
> +PREFERRED_VERSION_dtc ?= "20070216"
> +PREFERRED_VERSION_dtc-native ?= "20070216"
> +PREFERRED_VERSION_udev ?= "097"
>
>   # Various defines for QNAP Turbostation
>   #FOONAS_KERNEL_turbostation = "kernel-module-ext3 kernel-module-minix \
> diff --git a/conf/distro/gmustix.conf b/conf/distro/gmustix.conf
> index 5dd519d..390d079 100644
> --- a/conf/distro/gmustix.conf
> +++ b/conf/distro/gmustix.conf
> @@ -18,14 +18,14 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
>
>   PREFERRED_PROVIDER_classpath = "classpath-minimal"
>
> -PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
> -PREFERRED_VERSION_gcc-cross = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-sdk = "3.4.4"
> -PREFERRED_VERSION_gcc = "3.4.4"
> -
> -PREFERRED_VERSION_ipkg-native = "0.99.160"
> -PREFERRED_VERSION_qemu-native = "0.8.0"
> +PREFERRED_VERSION_gcc-cross-initial ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-sdk ?= "3.4.4"
> +PREFERRED_VERSION_gcc ?= "3.4.4"
> +
> +PREFERRED_VERSION_ipkg-native ?= "0.99.160"
> +PREFERRED_VERSION_qemu-native ?= "0.8.0"
>
>   DISTRO_VERSION = "uno"
>
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index 93678f3..088c7c6 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -3,68 +3,68 @@ CE_VERSION ?= "2.25.01"
>
>   require conf/distro/include/angstrom-codec-engine-${CE_VERSION}-preferred-versions.inc
>
> -PREFERRED_VERSION_autoconf = "2.65"
> -PREFERRED_VERSION_autoconf-native = "2.65"
> -PREFERRED_VERSION_automake = "1.11.1"
> -PREFERRED_VERSION_automake-native = "1.11.1"
> -PREFERRED_VERSION_busybox 	= "1.13.2"
> -PREFERRED_VERSION_cairo		= "1.8.10"
> -PREFERRED_VERSION_dbus 		= "1.2.24"
> -PREFERRED_VERSION_dropbear      = "0.51"
> -PREFERRED_VERSION_fontconfig	= "2.8.0"
> -PREFERRED_VERSION_glib-2.0 	= "2.24.1"
> -PREFERRED_VERSION_glib-2.0-native = "2.24.1"
> -PREFERRED_VERSION_glibmm = "2.24.0"
> -PREFERRED_VERSION_gst-pulse 	= "0.9.7"
> -PREFERRED_VERSION_gtk+		= "2.20.1"
> -PREFERRED_VERSION_gtk+-native	= "2.20.1"
> -PREFERRED_VERSION_gtkmm		= "2.20.0"
> -PREFERRED_VERSION_hal		= "0.5.14"
> -PREFERRED_VERSION_libgemwidget	= "1.0"
> -PREFERRED_VERSION_libgpephone	= "0.4"
> -PREFERRED_VERSION_libsdl-x11	= "1.2.14"
> -PREFERRED_VERSION_libtool 	= "2.2.6b"
> -PREFERRED_VERSION_libtool-native = "2.2.6b"
> -PREFERRED_VERSION_libtool-cross	= "2.2.6b"
> -PREFERRED_VERSION_libtool-sdk	= "2.2.6b"
> -PREFERRED_VERSION_lighttpd      = "1.4.26"
> -PREFERRED_VERSION_mesa          = "7.6"
> -PREFERRED_VERSION_mesa-dri      = "7.6"
> -PREFERRED_VERSION_mesa-xlib     = "7.6"
> -PREFERRED_VERSION_mythplugins   = "0.22"
> -PREFERRED_VERSION_myththemes    = "0.22"
> -PREFERRED_VERSION_mythtv        = "0.22"
> -PREFERRED_VERSION_mplayer       = "0.0+1.0rc3+svnr30165"
> -PREFERRED_VERSION_network-manager-applet = "0.8"
> -PREFERRED_VERSION_networkmanager = "0.8"
> -PREFERRED_VERSION_pango 	= "1.24.4"
> -PREFERRED_VERSION_pango-native     = "1.24.4"
> +PREFERRED_VERSION_autoconf ?= "2.65"
> +PREFERRED_VERSION_autoconf-native ?= "2.65"
> +PREFERRED_VERSION_automake ?= "1.11.1"
> +PREFERRED_VERSION_automake-native ?= "1.11.1"
> +PREFERRED_VERSION_busybox 	?= "1.13.2"
> +PREFERRED_VERSION_cairo		?= "1.8.10"
> +PREFERRED_VERSION_dbus 		?= "1.2.24"
> +PREFERRED_VERSION_dropbear      ?= "0.51"
> +PREFERRED_VERSION_fontconfig	?= "2.8.0"
> +PREFERRED_VERSION_glib-2.0 	?= "2.24.1"
> +PREFERRED_VERSION_glib-2.0-native ?= "2.24.1"
> +PREFERRED_VERSION_glibmm ?= "2.24.0"
> +PREFERRED_VERSION_gst-pulse 	?= "0.9.7"
> +PREFERRED_VERSION_gtk+		?= "2.20.1"
> +PREFERRED_VERSION_gtk+-native	?= "2.20.1"
> +PREFERRED_VERSION_gtkmm		?= "2.20.0"
> +PREFERRED_VERSION_hal		?= "0.5.14"
> +PREFERRED_VERSION_libgemwidget	?= "1.0"
> +PREFERRED_VERSION_libgpephone	?= "0.4"
> +PREFERRED_VERSION_libsdl-x11	?= "1.2.14"
> +PREFERRED_VERSION_libtool 	?= "2.2.6b"
> +PREFERRED_VERSION_libtool-native ?= "2.2.6b"
> +PREFERRED_VERSION_libtool-cross	?= "2.2.6b"
> +PREFERRED_VERSION_libtool-sdk	?= "2.2.6b"
> +PREFERRED_VERSION_lighttpd      ?= "1.4.26"
> +PREFERRED_VERSION_mesa          ?= "7.6"
> +PREFERRED_VERSION_mesa-dri      ?= "7.6"
> +PREFERRED_VERSION_mesa-xlib     ?= "7.6"
> +PREFERRED_VERSION_mythplugins   ?= "0.22"
> +PREFERRED_VERSION_myththemes    ?= "0.22"
> +PREFERRED_VERSION_mythtv        ?= "0.22"
> +PREFERRED_VERSION_mplayer       ?= "0.0+1.0rc3+svnr30165"
> +PREFERRED_VERSION_network-manager-applet ?= "0.8"
> +PREFERRED_VERSION_networkmanager ?= "0.8"
> +PREFERRED_VERSION_pango 	?= "1.24.4"
> +PREFERRED_VERSION_pango-native     ?= "1.24.4"
>   #PREFERRED_VERSION_pixman	= "0.13.2"
> -PREFERRED_VERSION_pkgconfig	= "0.23"
> -PREFERRED_VERSION_pkgconfig-native = "0.23"
> -PREFERRED_VERSION_pulseaudio 	= "0.9.15"
> -PREFERRED_VERSION_python = "2.6.4"
> -PREFERRED_VERSION_python-pycairo = "1.8.0"
> -PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-embedded = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-embedded-gles = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-x11-free = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-x11-free-gles = "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_pkgconfig	?= "0.23"
> +PREFERRED_VERSION_pkgconfig-native ?= "0.23"
> +PREFERRED_VERSION_pulseaudio 	?= "0.9.15"
> +PREFERRED_VERSION_python ?= "2.6.4"
> +PREFERRED_VERSION_python-pycairo ?= "1.8.0"
> +PREFERRED_VERSION_qt4-tools-native ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-tools-sdk ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-embedded ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-embedded-gles ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-x11-free ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-x11-free-gles ?= "${ANGSTROM_QT_VERSION}"
>
> -PREFERRED_VERSION_samba		= "3.3.9"
> -PREFERRED_VERSION_tiff 		= "3.9.2+4.0.0beta5"
> +PREFERRED_VERSION_samba		?= "3.3.9"
> +PREFERRED_VERSION_tiff 		?= "3.9.2+4.0.0beta5"
>
> -PREFERRED_VERSION_udev 		= "151"
> -PREFERRED_VERSION_udev_libc-uclibc = "141"
> +PREFERRED_VERSION_udev 		?= "151"
> +PREFERRED_VERSION_udev_libc-uclibc ?= "141"
>   UDEV_GE_141 = "1"
>
> -PREFERRED_VERSION_usbutils = "0.86"
> -PREFERRED_VERSION_wpa-supplicant = "0.6.9"
> -PREFERRED_VERSION_wget = "1.11.4"
> -PREFERRED_VERSION_xserver-common = "1.33"
> -PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
> -PREFERRED_VERSION_xserver-xorg = "1.7.4"
> +PREFERRED_VERSION_usbutils ?= "0.86"
> +PREFERRED_VERSION_wpa-supplicant ?= "0.6.9"
> +PREFERRED_VERSION_wget ?= "1.11.4"
> +PREFERRED_VERSION_xserver-common ?= "1.33"
> +PREFERRED_VERSION_xserver-kdrive ?= "1.4.0.90"
> +PREFERRED_VERSION_xserver-xorg ?= "1.7.4"
>
>   #
>   # meta-moblin package SRCREVs
> diff --git a/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc
> index 3c3480c..67c3920 100644
> --- a/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-2.25-preferred-versions.inc
> @@ -1,14 +1,14 @@
>   # Codec engine needs a specific set of version of its dependencies, so we specify them here:
>
> -PREFERRED_VERSION_ti-codec-engine = "2_25_00_05"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_00_05"
>
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_9"
> -PREFERRED_VERSION_ti-dspbios = "5_41_02_14"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_02"
> -PREFERRED_VERSION_ti-framework-components = "2_25_00_04"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_01_06"
> -PREFERRED_VERSION_ti-lpm-module = "2_24_01"
> -PREFERRED_VERSION_ti-xdais = "6_25_00_07"
> -PREFERRED_VERSION_ti-xdctools = "3_16_01_27"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_9"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_02_14"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_02"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_00_04"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_01_06"
> +PREFERRED_VERSION_ti-lpm-module ?= "2_24_01"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_00_07"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_01_27"
> diff --git a/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc
> index 5a16f2c..2a9a8ce 100644
> --- a/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc
> @@ -1,41 +1,41 @@
>   # Codec engine needs a specific set of version of its dependencies, so we specify them here:
>   # - using edma-lld 01.11.00.03 (instead of 01.11.00.02) to fix installer issue.
>
> -PREFERRED_VERSION_ti-codec-engine = "2_25_01_06"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_01_06"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_01_06"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_01_06"
>
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_9"
> -PREFERRED_VERSION_ti-dspbios = "5_41_02_14"
> -PREFERRED_VERSION_ti-dsplink = "1_64"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_64"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_01_06"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_01"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_01"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_01"
> -PREFERRED_VERSION_ti-xdais = "6_25_01_08"
> -PREFERRED_VERSION_ti-xdctools = "3_16_01_27"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_9"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_02_14"
> +PREFERRED_VERSION_ti-dsplink ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_01_06"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_01"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_01"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_01"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_01_08"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_01_27"
>
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>
>   # PREFERRED_VERSION_ti-dmai = ""
>   # PREFERRED_VERSION_ti-dmai-apps = ""
> diff --git a/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc
> index 920263a..e533dc7 100644
> --- a/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc
> @@ -1,41 +1,41 @@
>   # Codec engine needs a specific set of version of its dependencies, so we specify them here:
>   # - using edma-lld 01.11.00.03 (instead of 01.11.00.02) to fix installer issue.
>
> -PREFERRED_VERSION_ti-codec-engine = "2_25_02_11"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_02_11"
>
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_5"
> -PREFERRED_VERSION_ti-dspbios = "5_41_00_06"
> -PREFERRED_VERSION_ti-dsplink = "1_64"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_64"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_02_08"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais = "6_25_02_11"
> -PREFERRED_VERSION_ti-xdctools = "3_16_00_18"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_5"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_00_06"
> +PREFERRED_VERSION_ti-dsplink ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_02_08"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_02_11"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_00_18"
>
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_01"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>
>   # PREFERRED_VERSION_ti-dmai = ""
>   # PREFERRED_VERSION_ti-dmai-apps = ""
> diff --git a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
> index 3de327b..2936abf 100644
> --- a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
> @@ -1,41 +1,41 @@
>   # This is the latest set of TI components
>   #
>
> -PREFERRED_VERSION_ti-codec-engine = "2_25_02_11"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_02_11"
>
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_14"
> -PREFERRED_VERSION_ti-dspbios = "5_41_03_17"
> -PREFERRED_VERSION_ti-dsplink = "1_65_00_02"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_65_00_02"
> -PREFERRED_VERSION_ti-dsplink-module = "1_65_00_02"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_02_08"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais = "6_25_02_11"
> -PREFERRED_VERSION_ti-xdctools = "3_16_03_36"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_14"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_03_17"
> +PREFERRED_VERSION_ti-dsplink ?= "1_65_00_02"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_65_00_02"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_65_00_02"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_02_08"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_02_11"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_03_36"
>
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_01"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>
>   # PREFERRED_VERSION_ti-dmai = ""
>   # PREFERRED_VERSION_ti-dmai-apps = ""
> diff --git a/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc
> index c736208..c42b232 100644
> --- a/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc
> @@ -1,41 +1,41 @@
>   # This is the latest set of 'GA'd (Production Release) TI components
>   #
>
> -PREFERRED_VERSION_ti-codec-engine = "2_25_02_11"
> -PREFERRED_VERSION_ti-codec-engine-examples = "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine ?= "2_25_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples ?= "2_25_02_11"
>
> -PREFERRED_VERSION_ti-biosutils = "1_02_02"
> -PREFERRED_VERSION_ti-cgt6x = "6_1_14"
> -PREFERRED_VERSION_ti-dspbios = "5_41_03_17"
> -PREFERRED_VERSION_ti-dsplink = "1_64"
> -PREFERRED_VERSION_ti-dsplink-examples = "1_64"
> -PREFERRED_VERSION_ti-dsplink-module = "1_64"
> -PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components = "2_25_01_05"
> -PREFERRED_VERSION_ti-linuxutils = "2_25_02_08"
> -PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
> -PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais = "6_25_02_11"
> -PREFERRED_VERSION_ti-xdctools = "3_16_03_36"
> +PREFERRED_VERSION_ti-biosutils ?= "1_02_02"
> +PREFERRED_VERSION_ti-cgt6x ?= "6_1_14"
> +PREFERRED_VERSION_ti-dspbios ?= "5_41_03_17"
> +PREFERRED_VERSION_ti-dsplink ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-examples ?= "1_64"
> +PREFERRED_VERSION_ti-dsplink-module ?= "1_64"
> +PREFERRED_VERSION_ti-edma3lld ?= "01_11_00_03"
> +PREFERRED_VERSION_ti-framework-components ?= "2_25_01_05"
> +PREFERRED_VERSION_ti-linuxutils ?= "2_25_02_08"
> +PREFERRED_VERSION_ti-local-power-manager ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-module ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-lpm-utils ?= "1_24_02_09"
> +PREFERRED_VERSION_ti-xdais ?= "6_25_02_11"
> +PREFERRED_VERSION_ti-xdctools ?= "3_16_03_36"
>
> -PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
> -PREFERRED_VERSION_ti-codecs-dm365 = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm365-server = "3_10_00_02"
> -PREFERRED_VERSION_ti-codecs-dm6446 = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6446-server = "2_05_00_00"
> -PREFERRED_VERSION_ti-codecs-dm6467 = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-dm6467-server = "1_00_00_03"
> -PREFERRED_VERSION_ti-codecs-omap3530 = "1_00_01"
> -PREFERRED_VERSION_ti-codecs-omap3530-server = "1_00_01"
> -PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl137-server = "1_00_00"
> -PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
> -PREFERRED_VERSION_ti-codecs-omapl138-server = "1_00_00"
> -PREFERRED_VERSION_ti-dm355mm-module = "1_13"
> -PREFERRED_VERSION_ti-dm365mm-module = "1_0_3"
> -PREFERRED_VERSION_ti-dvsdk-demos = "3_10_00_11"
> +PREFERRED_VERSION_ti-codecs-dm355 ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm355-server ?= "1_13_000"
> +PREFERRED_VERSION_ti-codecs-dm365 ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm365-server ?= "3_10_00_02"
> +PREFERRED_VERSION_ti-codecs-dm6446 ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6446-server ?= "2_05_00_00"
> +PREFERRED_VERSION_ti-codecs-dm6467 ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-dm6467-server ?= "1_00_00_03"
> +PREFERRED_VERSION_ti-codecs-omap3530 ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs-omap3530-server ?= "1_00_01"
> +PREFERRED_VERSION_ti-codecs_omapl137 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl137-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs_omapl138 ?= "1_00_00"
> +PREFERRED_VERSION_ti-codecs-omapl138-server ?= "1_00_00"
> +PREFERRED_VERSION_ti-dm355mm-module ?= "1_13"
> +PREFERRED_VERSION_ti-dm365mm-module ?= "1_0_3"
> +PREFERRED_VERSION_ti-dvsdk-demos ?= "3_10_00_11"
>
>   # PREFERRED_VERSION_ti-dmai = ""
>   # PREFERRED_VERSION_ti-dmai-apps = ""
> diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
> index 2aed63b..dabcccd 100644
> --- a/conf/distro/include/angstrom-jalimo.conf
> +++ b/conf/distro/include/angstrom-jalimo.conf
> @@ -1,29 +1,29 @@
>   # Put a 'require conf/distro/include/angstrom-jalimo.conf' in your local.conf if you want to build from the jalimo overlay
>
>   # initial stuff
> -PREFERRED_VERSION_jamvm-initial = "1.4.5"
> -PREFERRED_VERSION_classpath-initial = "0.93"
> +PREFERRED_VERSION_jamvm-initial ?= "1.4.5"
> +PREFERRED_VERSION_classpath-initial ?= "0.93"
>
>   # Native VM
>   PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> -PREFERRED_VERSION_jamvm-native = "1.5.3"
> +PREFERRED_VERSION_jamvm-native ?= "1.5.3"
>   #PREFERRED_VERSION_cacao-native = "0.99.3"
> -PREFERRED_VERSION_classpath-native = "0.98"
> +PREFERRED_VERSION_classpath-native ?= "0.98"
>
>   # Native compiler settings
>   PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> -PREFERRED_VERSION_libecj-bootstrap = "3.6"
> +PREFERRED_VERSION_libecj-bootstrap ?= "3.6"
>
>   # Target VM
> -PREFERRED_VERSION_cacao = "0.99.3"
> -PREFERRED_VERSION_cacaoh-native = "0.99.3"
> +PREFERRED_VERSION_cacao ?= "0.99.3"
> +PREFERRED_VERSION_cacaoh-native ?= "0.99.3"
>
> -PREFERRED_VERSION_jamvm = "1.5.2"
> +PREFERRED_VERSION_jamvm ?= "1.5.2"
>   PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
>   PREFERRED_PROVIDER_classpath = "classpath"
>
> -PREFERRED_VERSION_openjdk-6-jre = "6b18-1.8"
> -PREFERRED_VERSION_icedtea6-native = "1.7.3"
> +PREFERRED_VERSION_openjdk-6-jre ?= "6b18-1.8"
> +PREFERRED_VERSION_icedtea6-native ?= "1.7.3"
>
>   # Stage JAR files not into ARCH related dirs
>   STAGING_DIR_JAVA = "${STAGING_DIR}/java"
> diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/conf/distro/include/kaeilos-2009-preferred-versions.inc
> index a63359d..e12aa35 100644
> --- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
> +++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
> @@ -10,73 +10,73 @@
>   # Product website : http://www.KaeilOS.com
>   #@--------------------------------------------------------------------
>
> -PREFERRED_VERSION_autoconf = "2.65"
> -PREFERRED_VERSION_autoconf-native = "2.65"
> -PREFERRED_VERSION_automake = "1.11.1"
> -PREFERRED_VERSION_automake-native = "1.11.1"
> -PREFERRED_VERSION_busybox 	= "1.13.2"
> -PREFERRED_VERSION_cairo		= "1.8.10"
> -PREFERRED_VERSION_dbus 		= "1.2.24"
> -PREFERRED_VERSION_dropbear      = "0.51"
> -PREFERRED_VERSION_fontconfig	= "2.8.0"
> -PREFERRED_VERSION_glib-2.0 	= "2.24.0"
> -PREFERRED_VERSION_glib-2.0-native = "2.24.0"
> -PREFERRED_VERSION_glibmm = "2.24.0"
> -PREFERRED_VERSION_gst-pulse 	= "0.9.7"
> -PREFERRED_VERSION_gtk+		= "2.20.0"
> -PREFERRED_VERSION_gtk+-native	= "2.20.0"
> -PREFERRED_VERSION_gtkmm		= "2.20.0"
> -PREFERRED_VERSION_hal		= "0.5.14"
> -PREFERRED_VERSION_libgemwidget	= "1.0"
> -PREFERRED_VERSION_libgpephone	= "0.4"
> -PREFERRED_VERSION_libsdl-x11	= "1.2.14"
> -PREFERRED_VERSION_libtool 	= "2.2.6b"
> -PREFERRED_VERSION_libtool-native = "2.2.6b"
> -PREFERRED_VERSION_libtool-cross	= "2.2.6b"
> -PREFERRED_VERSION_libtool-sdk	= "2.2.6b"
> -PREFERRED_VERSION_lighttpd      = "1.4.26"
> -PREFERRED_VERSION_mesa          = "7.6"
> -PREFERRED_VERSION_mesa-dri      = "7.6"
> -PREFERRED_VERSION_mesa-xlib     = "7.6"
> -PREFERRED_VERSION_mythplugins   = "0.22"
> -PREFERRED_VERSION_myththemes    = "0.22"
> -PREFERRED_VERSION_mythtv        = "0.22"
> -PREFERRED_VERSION_mplayer       = "0.0+1.0rc3+svnr30165"
> -PREFERRED_VERSION_network-manager-applet = "0.8"
> -PREFERRED_VERSION_networkmanager = "0.8"
> -PREFERRED_VERSION_pango 	= "1.24.4"
> -PREFERRED_VERSION_pango-native     = "1.24.4"
> +PREFERRED_VERSION_autoconf ?= "2.65"
> +PREFERRED_VERSION_autoconf-native ?= "2.65"
> +PREFERRED_VERSION_automake ?= "1.11.1"
> +PREFERRED_VERSION_automake-native ?= "1.11.1"
> +PREFERRED_VERSION_busybox 	?= "1.13.2"
> +PREFERRED_VERSION_cairo		?= "1.8.10"
> +PREFERRED_VERSION_dbus 		?= "1.2.24"
> +PREFERRED_VERSION_dropbear      ?= "0.51"
> +PREFERRED_VERSION_fontconfig	?= "2.8.0"
> +PREFERRED_VERSION_glib-2.0 	?= "2.24.0"
> +PREFERRED_VERSION_glib-2.0-native ?= "2.24.0"
> +PREFERRED_VERSION_glibmm ?= "2.24.0"
> +PREFERRED_VERSION_gst-pulse 	?= "0.9.7"
> +PREFERRED_VERSION_gtk+		?= "2.20.0"
> +PREFERRED_VERSION_gtk+-native	?= "2.20.0"
> +PREFERRED_VERSION_gtkmm		?= "2.20.0"
> +PREFERRED_VERSION_hal		?= "0.5.14"
> +PREFERRED_VERSION_libgemwidget	?= "1.0"
> +PREFERRED_VERSION_libgpephone	?= "0.4"
> +PREFERRED_VERSION_libsdl-x11	?= "1.2.14"
> +PREFERRED_VERSION_libtool 	?= "2.2.6b"
> +PREFERRED_VERSION_libtool-native ?= "2.2.6b"
> +PREFERRED_VERSION_libtool-cross	?= "2.2.6b"
> +PREFERRED_VERSION_libtool-sdk	?= "2.2.6b"
> +PREFERRED_VERSION_lighttpd      ?= "1.4.26"
> +PREFERRED_VERSION_mesa          ?= "7.6"
> +PREFERRED_VERSION_mesa-dri      ?= "7.6"
> +PREFERRED_VERSION_mesa-xlib     ?= "7.6"
> +PREFERRED_VERSION_mythplugins   ?= "0.22"
> +PREFERRED_VERSION_myththemes    ?= "0.22"
> +PREFERRED_VERSION_mythtv        ?= "0.22"
> +PREFERRED_VERSION_mplayer       ?= "0.0+1.0rc3+svnr30165"
> +PREFERRED_VERSION_network-manager-applet ?= "0.8"
> +PREFERRED_VERSION_networkmanager ?= "0.8"
> +PREFERRED_VERSION_pango 	?= "1.24.4"
> +PREFERRED_VERSION_pango-native     ?= "1.24.4"
>   #PREFERRED_VERSION_pixman	= "0.13.2"
> -PREFERRED_VERSION_pkgconfig	= "0.23"
> -PREFERRED_VERSION_pkgconfig-native = "0.23"
> -PREFERRED_VERSION_pulseaudio 	= "0.9.15"
> -PREFERRED_VERSION_python = "2.6.4"
> -PREFERRED_VERSION_python-pycairo = "1.8.0"
> +PREFERRED_VERSION_pkgconfig	?= "0.23"
> +PREFERRED_VERSION_pkgconfig-native ?= "0.23"
> +PREFERRED_VERSION_pulseaudio 	?= "0.9.15"
> +PREFERRED_VERSION_python ?= "2.6.4"
> +PREFERRED_VERSION_python-pycairo ?= "1.8.0"
>
>   KAEILOS_WX_VERSION ?= "2.8.10"
> -PREFERRED_VERSION_wxwidgets = "${KAEILOS_WX_VERSION}"
> +PREFERRED_VERSION_wxwidgets ?= "${KAEILOS_WX_VERSION}"
>
>   KAEILOS_QT_VERSION ?= "4.6.2"
> -PREFERRED_VERSION_qt4-tools-native = "${KAEILOS_QT_VERSION}"
> -PREFERRED_VERSION_qt4-tools-sdk = "${KAEILOS_QT_VERSION}"
> -PREFERRED_VERSION_qt4-embedded = "${KAEILOS_QT_VERSION}"
> -PREFERRED_VERSION_qt4-embedded-gles = "${KAEILOS_QT_VERSION}"
> -PREFERRED_VERSION_qt4-x11-free = "${KAEILOS_QT_VERSION}"
> -PREFERRED_VERSION_qt4-x11-free-gles = "${KAEILOS_QT_VERSION}"
> +PREFERRED_VERSION_qt4-tools-native ?= "${KAEILOS_QT_VERSION}"
> +PREFERRED_VERSION_qt4-tools-sdk ?= "${KAEILOS_QT_VERSION}"
> +PREFERRED_VERSION_qt4-embedded ?= "${KAEILOS_QT_VERSION}"
> +PREFERRED_VERSION_qt4-embedded-gles ?= "${KAEILOS_QT_VERSION}"
> +PREFERRED_VERSION_qt4-x11-free ?= "${KAEILOS_QT_VERSION}"
> +PREFERRED_VERSION_qt4-x11-free-gles ?= "${KAEILOS_QT_VERSION}"
>
> -PREFERRED_VERSION_samba		= "3.3.9"
> -PREFERRED_VERSION_tiff 		= "3.9.2+4.0.0beta5"
> +PREFERRED_VERSION_samba		?= "3.3.9"
> +PREFERRED_VERSION_tiff 		?= "3.9.2+4.0.0beta5"
>
> -PREFERRED_VERSION_udev 		= "151"
> -PREFERRED_VERSION_udev_libc-uclibc = "141"
> +PREFERRED_VERSION_udev 		?= "151"
> +PREFERRED_VERSION_udev_libc-uclibc ?= "141"
>   UDEV_GE_141 = "1"
>
> -PREFERRED_VERSION_usbutils = "0.86"
> -PREFERRED_VERSION_wpa-supplicant = "0.6.9"
> -PREFERRED_VERSION_wget = "1.11.4"
> -PREFERRED_VERSION_xserver-common = "1.33"
> -PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
> -PREFERRED_VERSION_xserver-xorg = "1.7.4"
> +PREFERRED_VERSION_usbutils ?= "0.86"
> +PREFERRED_VERSION_wpa-supplicant ?= "0.6.9"
> +PREFERRED_VERSION_wget ?= "1.11.4"
> +PREFERRED_VERSION_xserver-common ?= "1.33"
> +PREFERRED_VERSION_xserver-kdrive ?= "1.4.0.90"
> +PREFERRED_VERSION_xserver-xorg ?= "1.7.4"
>
>   #
>   # meta-moblin package SRCREVs
> diff --git a/conf/distro/include/maemo-preferred.inc b/conf/distro/include/maemo-preferred.inc
> index 3b31837..787db63 100644
> --- a/conf/distro/include/maemo-preferred.inc
> +++ b/conf/distro/include/maemo-preferred.inc
> @@ -1,10 +1,10 @@
>   PREFERRED_PROVIDER_gconf = "gconf-osso"
>   PREFERRED_PROVIDER_tslib = "tslib-maemo"
> -PREFERRED_VERSION_dbus = "0.23.1-osso5"
> -PREFERRED_VERSION_audiofile = "0.2.6-3osso4"
> +PREFERRED_VERSION_dbus ?= "0.23.1-osso5"
> +PREFERRED_VERSION_audiofile ?= "0.2.6-3osso4"
>   PREFERRED_PROVIDER_esd = "osso-esd"
> -PREFERRED_VERSION_gtk+ = "2.6.4-1.osso7"
> -PREFERRED_VERSION_glib-2.0 = "2.6.4"
> -PREFERRED_VERSION_pango = "1.8.2"
> -PREFERRED_VERSION_atk = "1.9.0"
> +PREFERRED_VERSION_gtk+ ?= "2.6.4-1.osso7"
> +PREFERRED_VERSION_glib-2.0 ?= "2.6.4"
> +PREFERRED_VERSION_pango ?= "1.8.2"
> +PREFERRED_VERSION_atk ?= "1.9.0"
>   PREFERRED_VERSION_diet-x11 ?= "6.2.1"
> diff --git a/conf/distro/include/oplinux.inc b/conf/distro/include/oplinux.inc
> index 36eca58..ec47c55 100644
> --- a/conf/distro/include/oplinux.inc
> +++ b/conf/distro/include/oplinux.inc
> @@ -102,7 +102,7 @@ FEED_ARCH_at32stk100    = "avr32"
>   #
>   #Preferred versions of packages we need
>   #
> -PREFERRED_VERSION_busybox = "1.2.1"
> +PREFERRED_VERSION_busybox ?= "1.2.1"
>   PREFERRED_VERSION_u-boot ?= "1.1.4"
>   PREFERRED_VERSION_fakeroot ?= "1.7.1"
>   PREFERRED_VERSION_fakeroot-native ?= "1.7.1"
> diff --git a/conf/distro/include/preferred-gpe-versions-2.7.inc b/conf/distro/include/preferred-gpe-versions-2.7.inc
> index cbdaec0..296a453 100644
> --- a/conf/distro/include/preferred-gpe-versions-2.7.inc
> +++ b/conf/distro/include/preferred-gpe-versions-2.7.inc
> @@ -40,7 +40,7 @@ PREFERRED_VERSION_gtk2-theme-angelistic ?= "0.3"
>   PREFERRED_VERSION_xst ?= "0.15"
>   PREFERRED_PROVIDER_xextensions = "xextensions"
>   PREFERRED_VERSION_xextensions ?= "1.0.1"
> -PREFERRED_VERSION_xserver-kdrive = "0.0+cvs20050207"
> +PREFERRED_VERSION_xserver-kdrive ?= "0.0+cvs20050207"
>   PREFERRED_VERSION_xprop ?= "0.0+cvs${SRCDATE}"
>   PREFERRED_VERSION_xhost ?= "0.0+cvs20040413"
>   PREFERRED_VERSION_xrdb ?= "0.0+cvs${SRCDATE}"
> diff --git a/conf/distro/include/preferred-om-2009-versions.inc b/conf/distro/include/preferred-om-2009-versions.inc
> index c65750d..c72871b 100644
> --- a/conf/distro/include/preferred-om-2009-versions.inc
> +++ b/conf/distro/include/preferred-om-2009-versions.inc
> @@ -1,27 +1,27 @@
> -PREFERRED_VERSION_automake-native = "1.10"
> -PREFERRED_VERSION_busybox       = "1.11.3"
> -PREFERRED_VERSION_cairo         = "1.8.0"
> -PREFERRED_VERSION_fontconfig    = "2.6.0"
> -PREFERRED_VERSION_glib-2.0      = "2.18.3"
> -PREFERRED_VERSION_glib-2.0-native = "2.18.0"
> -PREFERRED_VERSION_glibmm = "2.18.0"
> -PREFERRED_VERSION_glproto       = "1.4.9"
> -PREFERRED_VERSION_gst-pulse     = "0.9.7"
> -PREFERRED_VERSION_gtk+          = "2.14.2"
> -PREFERRED_VERSION_gtkmm         = "2.14.1"
> -PREFERRED_VERSION_libgemwidget  = "1.0"
> -PREFERRED_VERSION_libgpephone   = "0.4"
> -PREFERRED_VERSION_libosip2      = "2.2.2"
> -PREFERRED_VERSION_libsdl-x11    = "1.2.11"
> -PREFERRED_VERSION_libtool       = "2.2.4"
> -PREFERRED_VERSION_libtool-native = "2.2.4"
> -PREFERRED_VERSION_libtool-cross = "2.2.4"
> -PREFERRED_VERSION_libtool-sdk   = "2.2.4"
> -PREFERRED_VERSION_pango         = "1.22.0"
> -PREFERRED_VERSION_pixman        = "0.12.0"
> -PREFERRED_VERSION_pkgconfig     = "0.23"
> -PREFERRED_VERSION_pkgconfig-native = "0.23"
> -PREFERRED_VERSION_pulseaudio    = "0.9.10"
> -PREFERRED_VERSION_tiff          = "3.8.2+4.0.0beta2"
> -PREFERRED_VERSION_udev          = "124"
> -PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
> +PREFERRED_VERSION_automake-native ?= "1.10"
> +PREFERRED_VERSION_busybox       ?= "1.11.3"
> +PREFERRED_VERSION_cairo         ?= "1.8.0"
> +PREFERRED_VERSION_fontconfig    ?= "2.6.0"
> +PREFERRED_VERSION_glib-2.0      ?= "2.18.3"
> +PREFERRED_VERSION_glib-2.0-native ?= "2.18.0"
> +PREFERRED_VERSION_glibmm ?= "2.18.0"
> +PREFERRED_VERSION_glproto       ?= "1.4.9"
> +PREFERRED_VERSION_gst-pulse     ?= "0.9.7"
> +PREFERRED_VERSION_gtk+          ?= "2.14.2"
> +PREFERRED_VERSION_gtkmm         ?= "2.14.1"
> +PREFERRED_VERSION_libgemwidget  ?= "1.0"
> +PREFERRED_VERSION_libgpephone   ?= "0.4"
> +PREFERRED_VERSION_libosip2      ?= "2.2.2"
> +PREFERRED_VERSION_libsdl-x11    ?= "1.2.11"
> +PREFERRED_VERSION_libtool       ?= "2.2.4"
> +PREFERRED_VERSION_libtool-native ?= "2.2.4"
> +PREFERRED_VERSION_libtool-cross ?= "2.2.4"
> +PREFERRED_VERSION_libtool-sdk   ?= "2.2.4"
> +PREFERRED_VERSION_pango         ?= "1.22.0"
> +PREFERRED_VERSION_pixman        ?= "0.12.0"
> +PREFERRED_VERSION_pkgconfig     ?= "0.23"
> +PREFERRED_VERSION_pkgconfig-native ?= "0.23"
> +PREFERRED_VERSION_pulseaudio    ?= "0.9.10"
> +PREFERRED_VERSION_tiff          ?= "3.8.2+4.0.0beta2"
> +PREFERRED_VERSION_udev          ?= "124"
> +PREFERRED_VERSION_xserver-kdrive ?= "1.4.0.90"
> diff --git a/conf/distro/include/preferred-opie-cvs-versions.inc b/conf/distro/include/preferred-opie-cvs-versions.inc
> index 79fc56c..bb5803f 100644
> --- a/conf/distro/include/preferred-opie-cvs-versions.inc
> +++ b/conf/distro/include/preferred-opie-cvs-versions.inc
> @@ -206,4 +206,4 @@ SRCDATE_opie-zkbapplet ?= "${OPIE_VERSION}"
>   SRCDATE_opie-zlines ?= "${OPIE_VERSION}"
>   SRCDATE_opie-zsafe ?= "${OPIE_VERSION}"
>   SRCDATE_opie-zsame ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_konqueror-embedded = "20070316"
> +PREFERRED_VERSION_konqueror-embedded ?= "20070316"
> diff --git a/conf/distro/include/preferred-opie-versions-1.2.3.inc b/conf/distro/include/preferred-opie-versions-1.2.3.inc
> index 56bb4fb..f0b47de 100644
> --- a/conf/distro/include/preferred-opie-versions-1.2.3.inc
> +++ b/conf/distro/include/preferred-opie-versions-1.2.3.inc
> @@ -10,202 +10,202 @@ PALMTOP_USE_MULTITHREADED_QT ?= "yes"
>   #
>   PREFERRED_PROVIDER_virtual/libqte2 = '${@base_conditional("PALMTOP_USE_MULTITHREADED_QT", "yes", "qte-mt", "qte", d)}'
>   PREFERRED_PROVIDER_virtual/libqpe1 = "libqpe-opie"
> -PREFERRED_VERSION_qte-mt = "${QTE_VERSION}"
> -PREFERRED_VERSION_qte = "${QTE_VERSION}"
> +PREFERRED_VERSION_qte-mt ?= "${QTE_VERSION}"
> +PREFERRED_VERSION_qte ?= "${QTE_VERSION}"
>   PREFERRED_VERSION_libopie2 ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_libopieobex0 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libopietooth1 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libqpe-opie = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libqtaux2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libmailwrapper = "${OPIE_VERSION}"
> +PREFERRED_VERSION_libopieobex0 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libopietooth1 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libqpe-opie ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libqtaux2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libmailwrapper ?= "${OPIE_VERSION}"
>   #
>   # Opie applications
>   #
> -PREFERRED_VERSION_opie-aboutapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-addressbook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-advancedfm = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-alarm = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-appearance = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-aqpkg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-autorotateapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-backgammon = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-backup = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-bartender = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-batteryapplet = "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-aboutapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-addressbook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-advancedfm ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-alarm ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-appearance ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-aqpkg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-autorotateapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-backgammon ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-backup ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-bartender ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-batteryapplet ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluepin ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluetoothapplet ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluetoothmanager ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-bounce = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-brightnessapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-button-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-buzzword = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-calculator = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-calibrate = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-camera = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-cardmon = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-checkbook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-citytime = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clipboardapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clockapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clock = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-confeditor = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-console = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dagger = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dasher = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-chrisholidayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-nationalholidayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-birthdayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-flat = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-liquid = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-polished = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-doctab = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-drawpad = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dvorak = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-embeddedkonsole = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-euroconv = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-examples-python = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-examples = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-eye = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-fifteen = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-formatter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-freetype = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-ftplib = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-ftp = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-go = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-gutenbrowser = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-handwriting = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-helpbrowser = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-help-en = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-homeapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-i18n = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lrelease-native = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lupdate-native = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-icon-reload = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-irc = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-irdaapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-jumpx = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kbill = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kcheckers = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keyboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keypebble = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keytabs = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keyview = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kjumpx = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kpacman = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-language = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-launcher-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-libqrsync = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-light-and-power = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lockapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-login = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-logoutapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mailapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mail = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libmadplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libmodplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libwavplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-core = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-default = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-pod = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-techno = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediummount = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-memoryapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mindbreaker = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-minesweep = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mobilemsg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-multikeyapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-multikey = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-networkapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-networksettings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-notesapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-odict = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-osearch = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-oxygen = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-oyatzee = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-packagemanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-parashoot = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pcmciaapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-performance = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pickboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pics = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pimconverter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-powerchord = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pyquicklaunchapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qasteroids = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qcop = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-quicklauncher = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qss = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-rdesktop = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-reader = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-recorder = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-remote = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-rotateapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-screenshotapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-search = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-security = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-blueping = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-dummy = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-notice = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-pin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sfcave = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sheet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sh = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-showimg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-snake = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-solitaire = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sshkeys = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-flat = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-fresh = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-liquid = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-metal = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-phase = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-web = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sounds = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-suspendapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-symlinker = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sysinfo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-systemtime = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tableviewer = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tabmanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-taskbar = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-taskbar-images = "${OPIE_VERSION}+cvs20070922"
> -PREFERRED_VERSION_opie-tetrix = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-textedit = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-theme = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tictac = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tinykate = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-addressbookplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-datebookplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-fortuneplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-mailplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-stocktickerplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-todolistplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-weatherplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-todo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tonleiter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-unikeyboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-usermanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vmemo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vmemo-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-volumeapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vtapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wellenreiter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wirelessapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wordgame = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-write = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zkbapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zlines = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zsafe = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zsame = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sh-snes = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-stumbler = "${OPIE_VERSION}"
> -PREFERRED_VERSION_konqueror-embedded = "20070316"
> +PREFERRED_VERSION_opie-bounce ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-brightnessapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-button-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-buzzword ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-calculator ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-calibrate ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-camera ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-cardmon ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-checkbook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-citytime ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clipboardapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clockapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clock ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-confeditor ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-console ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dagger ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dasher ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-chrisholidayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-nationalholidayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-birthdayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-flat ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-liquid ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-polished ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-doctab ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-drawpad ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dvorak ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-embeddedkonsole ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-euroconv ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-examples-python ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-examples ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-eye ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-fifteen ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-formatter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-freetype ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-ftplib ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-ftp ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-go ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-gutenbrowser ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-handwriting ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-helpbrowser ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-help-en ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-homeapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-i18n ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lrelease-native ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lupdate-native ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-icon-reload ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-irc ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-irdaapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-jumpx ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kbill ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kcheckers ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keyboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keypebble ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keytabs ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keyview ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kjumpx ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kpacman ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-language ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-launcher-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-libqrsync ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-light-and-power ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lockapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-login ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-logoutapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mailapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mail ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libmadplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libmodplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libwavplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-core ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-default ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-pod ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-techno ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediummount ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-memoryapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mindbreaker ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-minesweep ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mobilemsg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-multikeyapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-multikey ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-networkapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-networksettings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-notesapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-odict ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-osearch ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-oxygen ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-oyatzee ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-packagemanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-parashoot ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pcmciaapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-performance ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pickboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pics ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pimconverter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-powerchord ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pyquicklaunchapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qasteroids ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qcop ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-quicklauncher ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qss ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-rdesktop ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-reader ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-recorder ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-remote ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-rotateapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-screenshotapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-search ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-security ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-blueping ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-dummy ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-notice ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-pin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sfcave ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sheet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sh ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-showimg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-snake ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-solitaire ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sshkeys ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-flat ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-fresh ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-liquid ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-metal ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-phase ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-web ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sounds ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-suspendapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-symlinker ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sysinfo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-systemtime ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tableviewer ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tabmanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-taskbar ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-taskbar-images ?= "${OPIE_VERSION}+cvs20070922"
> +PREFERRED_VERSION_opie-tetrix ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-textedit ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-theme ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tictac ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tinykate ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-addressbookplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-datebookplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-fortuneplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-mailplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-stocktickerplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-todolistplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-weatherplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-todo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tonleiter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-unikeyboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-usermanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vmemo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vmemo-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-volumeapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vtapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wellenreiter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wirelessapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wordgame ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-write ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zkbapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zlines ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zsafe ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zsame ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sh-snes ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-stumbler ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_konqueror-embedded ?= "20070316"
> diff --git a/conf/distro/include/preferred-opie-versions-1.2.4.inc b/conf/distro/include/preferred-opie-versions-1.2.4.inc
> index cc5dbd5..8e7553a 100644
> --- a/conf/distro/include/preferred-opie-versions-1.2.4.inc
> +++ b/conf/distro/include/preferred-opie-versions-1.2.4.inc
> @@ -10,201 +10,201 @@ PALMTOP_USE_MULTITHREADED_QT ?= "yes"
>   #
>   PREFERRED_PROVIDER_virtual/libqte2 = '${@base_conditional("PALMTOP_USE_MULTITHREADED_QT", "yes", "qte-mt", "qte", d)}'
>   PREFERRED_PROVIDER_virtual/libqpe1 = "libqpe-opie"
> -PREFERRED_VERSION_qte-mt = "${QTE_VERSION}"
> -PREFERRED_VERSION_qte = "${QTE_VERSION}"
> +PREFERRED_VERSION_qte-mt ?= "${QTE_VERSION}"
> +PREFERRED_VERSION_qte ?= "${QTE_VERSION}"
>   PREFERRED_VERSION_libopie2 ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_libopieobex0 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libopietooth1 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libqpe-opie = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libqtaux2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libmailwrapper = "${OPIE_VERSION}"
> +PREFERRED_VERSION_libopieobex0 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libopietooth1 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libqpe-opie ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libqtaux2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libmailwrapper ?= "${OPIE_VERSION}"
>   #
>   # Opie applications
>   #
> -PREFERRED_VERSION_opie-aboutapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-addressbook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-advancedfm = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-alarm = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-appearance = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-aqpkg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-autorotateapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-backgammon = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-backup = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-bartender = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-batteryapplet = "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-aboutapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-addressbook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-advancedfm ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-alarm ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-appearance ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-aqpkg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-autorotateapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-backgammon ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-backup ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-bartender ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-batteryapplet ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluepin ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluetoothapplet ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluetoothmanager ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-bounce = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-brightnessapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-button-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-buzzword = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-calculator = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-calibrate = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-camera = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-cardapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-checkbook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-citytime = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clipboardapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clockapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clock = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-confeditor = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-console = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dagger = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dasher = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-chrisholidayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-nationalholidayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-birthdayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-flat = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-liquid = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-polished = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-doctab = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-drawpad = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dvorak = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-embeddedkonsole = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-euroconv = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-examples-python = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-examples = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-eye = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-fifteen = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-formatter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-freetype = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-ftplib = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-ftp = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-go = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-gutenbrowser = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-handwriting = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-helpbrowser = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-help-en = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-homeapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-i18n = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lrelease-native = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lupdate-native = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-icon-reload = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-irc = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-irdaapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-jumpx = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kbill = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kcheckers = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keyboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keypebble = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keytabs = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keyview = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kjumpx = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kpacman = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-language = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-launcher-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-libqrsync = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-light-and-power = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lockapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-login = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-logoutapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mailapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mail = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libmadplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libmodplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libwavplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-core = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-default = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-pod = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-techno = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediummount = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-memoryapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mindbreaker = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-minesweep = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mobilemsg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-multikeyapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-multikey = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-networkapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-networksettings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-notesapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-odict = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-osearch = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-oxygen = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-oyatzee = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-packagemanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-parashoot = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-performance = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pickboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pics = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pimconverter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-powerchord = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pyquicklaunchapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qasteroids = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qcop = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-quicklauncher = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qss = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-rdesktop = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-reader = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-recorder = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-remote = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-rotateapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-screenshotapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-search = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-security = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-blueping = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-dummy = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-notice = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-pin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sfcave = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sheet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sh = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-showimg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-snake = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-solitaire = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sshkeys = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-flat = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-fresh = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-liquid = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-metal = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-phase = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-web = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sounds = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-suspendapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-symlinker = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sysinfo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-systemtime = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tableviewer = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tabmanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-taskbar = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-taskbar-images = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tetrix = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-textedit = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-theme = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tictac = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tinykate = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-addressbookplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-datebookplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-fortuneplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-mailplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-stocktickerplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-todolistplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-weatherplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-todo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tonleiter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-unikeyboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-usermanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vmemo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vmemo-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-volumeapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vtapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wellenreiter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wirelessapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wordgame = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-write = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zkbapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zlines = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zsafe = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zsame = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sh-snes = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-stumbler = "${OPIE_VERSION}"
> -PREFERRED_VERSION_konqueror-embedded = "20070316"
> +PREFERRED_VERSION_opie-bounce ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-brightnessapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-button-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-buzzword ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-calculator ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-calibrate ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-camera ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-cardapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-checkbook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-citytime ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clipboardapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clockapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clock ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-confeditor ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-console ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dagger ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dasher ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-chrisholidayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-nationalholidayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-birthdayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-flat ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-liquid ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-polished ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-doctab ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-drawpad ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dvorak ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-embeddedkonsole ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-euroconv ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-examples-python ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-examples ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-eye ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-fifteen ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-formatter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-freetype ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-ftplib ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-ftp ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-go ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-gutenbrowser ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-handwriting ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-helpbrowser ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-help-en ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-homeapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-i18n ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lrelease-native ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lupdate-native ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-icon-reload ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-irc ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-irdaapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-jumpx ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kbill ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kcheckers ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keyboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keypebble ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keytabs ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keyview ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kjumpx ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kpacman ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-language ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-launcher-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-libqrsync ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-light-and-power ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lockapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-login ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-logoutapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mailapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mail ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libmadplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libmodplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libwavplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-core ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-default ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-pod ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-techno ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediummount ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-memoryapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mindbreaker ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-minesweep ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mobilemsg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-multikeyapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-multikey ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-networkapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-networksettings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-notesapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-odict ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-osearch ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-oxygen ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-oyatzee ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-packagemanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-parashoot ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-performance ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pickboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pics ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pimconverter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-powerchord ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pyquicklaunchapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qasteroids ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qcop ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-quicklauncher ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qss ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-rdesktop ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-reader ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-recorder ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-remote ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-rotateapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-screenshotapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-search ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-security ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-blueping ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-dummy ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-notice ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-pin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sfcave ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sheet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sh ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-showimg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-snake ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-solitaire ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sshkeys ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-flat ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-fresh ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-liquid ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-metal ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-phase ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-web ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sounds ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-suspendapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-symlinker ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sysinfo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-systemtime ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tableviewer ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tabmanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-taskbar ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-taskbar-images ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tetrix ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-textedit ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-theme ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tictac ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tinykate ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-addressbookplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-datebookplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-fortuneplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-mailplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-stocktickerplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-todolistplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-weatherplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-todo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tonleiter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-unikeyboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-usermanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vmemo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vmemo-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-volumeapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vtapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wellenreiter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wirelessapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wordgame ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-write ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zkbapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zlines ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zsafe ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zsame ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sh-snes ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-stumbler ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_konqueror-embedded ?= "20070316"
> diff --git a/conf/distro/include/preferred-opie-versions.inc b/conf/distro/include/preferred-opie-versions.inc
> index 84c0b21..7b4f544 100644
> --- a/conf/distro/include/preferred-opie-versions.inc
> +++ b/conf/distro/include/preferred-opie-versions.inc
> @@ -10,201 +10,201 @@ PALMTOP_USE_MULTITHREADED_QT ?= "yes"
>   #
>   PREFERRED_PROVIDER_virtual/libqte2 = '${@base_conditional("PALMTOP_USE_MULTITHREADED_QT", "yes", "qte-mt", "qte", d)}'
>   PREFERRED_PROVIDER_virtual/libqpe1 = "libqpe-opie"
> -PREFERRED_VERSION_qte-mt = "${QTE_VERSION}"
> -PREFERRED_VERSION_qte = "${QTE_VERSION}"
> +PREFERRED_VERSION_qte-mt ?= "${QTE_VERSION}"
> +PREFERRED_VERSION_qte ?= "${QTE_VERSION}"
>   PREFERRED_VERSION_libopie2 ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_libopieobex0 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libopietooth1 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libqpe-opie = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libqtaux2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_libmailwrapper = "${OPIE_VERSION}"
> +PREFERRED_VERSION_libopieobex0 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libopietooth1 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libqpe-opie ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libqtaux2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_libmailwrapper ?= "${OPIE_VERSION}"
>   #
>   # Opie applications
>   #
> -PREFERRED_VERSION_opie-aboutapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-addressbook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-advancedfm = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-alarm = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-appearance = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-aqpkg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-autorotateapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-backgammon = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-backup = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-bartender = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-batteryapplet = "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-aboutapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-addressbook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-advancedfm ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-alarm ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-appearance ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-aqpkg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-autorotateapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-backgammon ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-backup ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-bartender ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-batteryapplet ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluepin ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluetoothapplet ?= "${OPIE_VERSION}"
>   PREFERRED_VERSION_opie-bluetoothmanager ?= "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-bounce = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-brightnessapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-button-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-buzzword = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-calculator = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-calibrate = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-camera = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-cardmon = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-checkbook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-citytime = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clipboardapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clockapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-clock = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-confeditor = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-console = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dagger = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dasher = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-chrisholidayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-nationalholidayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-datebook-birthdayplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-flat = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-liquid = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-deco-polished = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-doctab = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-drawpad = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-dvorak = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-embeddedkonsole = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-euroconv = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-examples-python = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-examples = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-eye = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-fifteen = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-formatter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-freetype = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-ftplib = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-ftp = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-go = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-gutenbrowser = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-handwriting = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-helpbrowser = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-help-en = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-homeapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-i18n = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lrelease-native = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lupdate-native = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-icon-reload = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-irc = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-irdaapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-jumpx = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kbill = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kcheckers = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keyboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keypebble = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keytabs = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-keyview = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kjumpx = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-kpacman = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-language = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-launcher-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-libqrsync = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-light-and-power = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-lockapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-login = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-logoutapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mailapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mail = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libmadplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libmodplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-libwavplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1-core = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer1 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-default = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-pod = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediaplayer2-skin-techno = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mediummount = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-memoryapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mindbreaker = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-minesweep = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-mobilemsg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-multikeyapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-multikey = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-networkapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-networksettings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-notesapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-odict = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-osearch = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-oxygen = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-oyatzee = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-packagemanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-parashoot = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pcmciaapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-performance = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pickboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pics = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pimconverter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-powerchord = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-pyquicklaunchapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qasteroids = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qcop = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-quicklauncher = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-qss = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-rdesktop = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-reader = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-recorder = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-remote = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet2 = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-restartapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-rotateapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-screenshotapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-search = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-security = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-blueping = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-dummy = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-notice = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-securityplugin-pin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sfcave = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sheet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sh = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-showimg = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-snake = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-solitaire = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sshkeys = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-flat = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-fresh = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-liquid = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-metal = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-phase = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-style-web = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sounds = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-suspendapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-symlinker = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sysinfo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-systemtime = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tableviewer = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tabmanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-taskbar = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tetrix = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-textedit = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-theme = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tictac = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tinykate = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-addressbookplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-datebookplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-fortuneplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-mailplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-stocktickerplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-todolistplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-today-weatherplugin = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-todo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-tonleiter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-unikeyboard = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-usermanager = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vmemo = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vmemo-settings = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-volumeapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-vtapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wellenreiter = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wirelessapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-wordgame = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-write = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zkbapplet = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zlines = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zsafe = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-zsame = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-sh-snes = "${OPIE_VERSION}"
> -PREFERRED_VERSION_opie-stumbler = "${OPIE_VERSION}"
> -PREFERRED_VERSION_konqueror-embedded = "20060404"
> +PREFERRED_VERSION_opie-bounce ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-brightnessapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-button-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-buzzword ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-calculator ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-calibrate ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-camera ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-cardmon ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-checkbook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-citytime ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clipboardapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clockapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-clock ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-confeditor ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-console ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dagger ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dasher ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-chrisholidayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-nationalholidayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-datebook-birthdayplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-flat ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-liquid ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-deco-polished ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-doctab ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-drawpad ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-dvorak ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-embeddedkonsole ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-euroconv ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-examples-python ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-examples ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-eye ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-fifteen ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-formatter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-freetype ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-ftplib ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-ftp ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-go ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-gutenbrowser ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-handwriting ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-helpbrowser ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-help-en ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-homeapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-i18n ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lrelease-native ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lupdate-native ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-icon-reload ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-irc ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-irdaapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-jumpx ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kbill ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kcheckers ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keyboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keypebble ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keytabs ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-keyview ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kjumpx ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-kpacman ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-language ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-launcher-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-libqrsync ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-light-and-power ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-lockapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-login ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-logoutapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mailapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mail ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libmadplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libmodplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libtremorplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-libwavplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1-core ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer1 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-default ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-default-landscape ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-pod ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediaplayer2-skin-techno ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mediummount ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-memoryapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mindbreaker ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-minesweep ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-mobilemsg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-multikeyapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-multikey ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-networkapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-networksettings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-notesapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-odict ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-osearch ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-oxygen ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-oyatzee ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-packagemanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-parashoot ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pcmciaapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-performance ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pickboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pics ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pimconverter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-powerchord ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-pyquicklaunchapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qasteroids ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qcop ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-quicklauncher ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-qss ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-rdesktop ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-reader ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-recorder ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-remote ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet2 ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-restartapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-rotateapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-screenshotapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-search ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-security ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-blueping ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-dummy ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-notice ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-securityplugin-pin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sfcave ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sheet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sh ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-showimg ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-snake ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-solitaire ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sshkeys ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-flat ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-fresh ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-liquid ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-metal ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-phase ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-style-web ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sounds ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-suspendapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-symlinker ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sysinfo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-systemtime ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tableviewer ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tabmanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-taskbar ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tetrix ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-textedit ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-theme ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tictac ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tinykate ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-addressbookplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-datebookplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-fortuneplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-mailplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-stocktickerplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-todolistplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-today-weatherplugin ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-todo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-tonleiter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-unikeyboard ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-usermanager ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vmemo ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vmemo-settings ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-volumeapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-vtapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wellenreiter ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wirelessapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-wordgame ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-write ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zkbapplet ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zlines ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zsafe ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-zsame ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-sh-snes ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_opie-stumbler ?= "${OPIE_VERSION}"
> +PREFERRED_VERSION_konqueror-embedded ?= "20060404"
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
> index 9b9dd09..209e2a0 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -1,22 +1,22 @@
>   # Upgraded
>   # use newer version then preferred by default
> -PREFERRED_VERSION_dbus = "1.3.1"
> -PREFERRED_VERSION_autoconf = "2.65"
> -PREFERRED_VERSION_autoconf-native = "2.65"
> -PREFERRED_VERSION_automake = "1.11.1"
> -PREFERRED_VERSION_automake-native = "1.11.1"
> -PREFERRED_VERSION_libmikmod = "3.2.0-beta2"
> -PREFERRED_VERSION_mtd-utils-native = "1.2.0+git"
> -PREFERRED_VERSION_strace = "4.5.15"
> -PREFERRED_VERSION_emacs-x11 = "23.1"
> -PREFERRED_VERSION_ncurses = "5.7"
> -PREFERRED_VERSION_ncurses-native = "5.7"
> +PREFERRED_VERSION_dbus ?= "1.3.1"
> +PREFERRED_VERSION_autoconf ?= "2.65"
> +PREFERRED_VERSION_autoconf-native ?= "2.65"
> +PREFERRED_VERSION_automake ?= "1.11.1"
> +PREFERRED_VERSION_automake-native ?= "1.11.1"
> +PREFERRED_VERSION_libmikmod ?= "3.2.0-beta2"
> +PREFERRED_VERSION_mtd-utils-native ?= "1.2.0+git"
> +PREFERRED_VERSION_strace ?= "4.5.15"
> +PREFERRED_VERSION_emacs-x11 ?= "23.1"
> +PREFERRED_VERSION_ncurses ?= "5.7"
> +PREFERRED_VERSION_ncurses-native ?= "5.7"
>
>   # we need new headers for libc, now OLDEST_KERNEL_linux-gnueabi = "2.6.24"
>   # and 2.6.31 for fsodeviced
>   LINUX_LIBC_HEADERS_VERSION ?= "2.6.32"
> -PREFERRED_VERSION_linux-libc-headers = "${LINUX_LIBC_HEADERS_VERSION}"
> -PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
> +PREFERRED_VERSION_linux-libc-headers ?= "${LINUX_LIBC_HEADERS_VERSION}"
> +PREFERRED_VERSION_linux-libc-headers-native ?= "${LINUX_LIBC_HEADERS_VERSION}"
>
>   # override EFL_SRCREV from sane-srcrevs.inc
>   # EFL_SRCREV ?= "44424"
> @@ -24,36 +24,36 @@ PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
>   # specifically set an openssh version
>   # NOTE: whenever changing the version here make sure
>   #       to check we won't loose our specific config !!!
> -PREFERRED_VERSION_openssh = "5.2p1"
> +PREFERRED_VERSION_openssh ?= "5.2p1"
>
>   # upgrades used in Angstrom
> -PREFERRED_VERSION_xserver-common = "1.33"
> -PREFERRED_VERSION_xserver-nodm-init = "2.0"
> -PREFERRED_VERSION_gtk+          = "2.20.1"
> -PREFERRED_VERSION_gtk+-native   = "2.20.1"
> -PREFERRED_VERSION_hal           = "0.5.13"
> -PREFERRED_VERSION_libtool       = "2.2.6b"
> -PREFERRED_VERSION_libtool-native = "2.2.6b"
> -PREFERRED_VERSION_libtool-cross = "2.2.6b"
> -PREFERRED_VERSION_libtool-sdk   = "2.2.6b"
> -PREFERRED_VERSION_udev          = "151"
> -PREFERRED_VERSION_usbutils      = "0.86"
> -PREFERRED_VERSION_wpa-supplicant = "0.6.9"
> -PREFERRED_VERSION_glib-2.0      = "2.24.1"
> -PREFERRED_VERSION_glib-2.0-native = "2.24.1"
> +PREFERRED_VERSION_xserver-common ?= "1.33"
> +PREFERRED_VERSION_xserver-nodm-init ?= "2.0"
> +PREFERRED_VERSION_gtk+          ?= "2.20.1"
> +PREFERRED_VERSION_gtk+-native   ?= "2.20.1"
> +PREFERRED_VERSION_hal           ?= "0.5.13"
> +PREFERRED_VERSION_libtool       ?= "2.2.6b"
> +PREFERRED_VERSION_libtool-native ?= "2.2.6b"
> +PREFERRED_VERSION_libtool-cross ?= "2.2.6b"
> +PREFERRED_VERSION_libtool-sdk   ?= "2.2.6b"
> +PREFERRED_VERSION_udev          ?= "151"
> +PREFERRED_VERSION_usbutils      ?= "0.86"
> +PREFERRED_VERSION_wpa-supplicant ?= "0.6.9"
> +PREFERRED_VERSION_glib-2.0      ?= "2.24.1"
> +PREFERRED_VERSION_glib-2.0-native ?= "2.24.1"
>   UDEV_GE_141 = "1"
>
> -PREFERRED_VERSION_postgresql = "8.4.4"
> +PREFERRED_VERSION_postgresql ?= "8.4.4"
>   ANGSTROM_QT_VERSION ?= "4.6.2+4.7.0-beta1"
> -PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-embedded = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-embedded-gles = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-x11-free = "${ANGSTROM_QT_VERSION}"
> -PREFERRED_VERSION_qt4-x11-free-gles = "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-tools-native ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-tools-sdk ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-embedded ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-embedded-gles ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-x11-free ?= "${ANGSTROM_QT_VERSION}"
> +PREFERRED_VERSION_qt4-x11-free-gles ?= "${ANGSTROM_QT_VERSION}"
>
>   # epdf needs>  0.12, but recipes have D_P = -1
> -PREFERRED_VERSION_poppler = "0.12.3"
> +PREFERRED_VERSION_poppler ?= "0.12.3"
>
>   # Downgraded
> -PREFERRED_VERSION_pulseaudio = "0.9.15"
> +PREFERRED_VERSION_pulseaudio ?= "0.9.15"
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index a8909d0..d5ae8de 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -11,7 +11,7 @@
>   # This *must* be removed after initial testing is completed.  MJW 08-Dec-2008
>   #
>   SRCREV_pn-linux-ixp4xx ?= "1090"
> -PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV_pn-linux-ixp4xx}"
> +PREFERRED_VERSION_linux-ixp4xx ?= "2.6.27.8+svnr${SRCREV_pn-linux-ixp4xx}"
>   #
>   #===============================================================================#
>   #===============================================================================#
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.0.inc b/conf/distro/include/preferred-xorg-versions-X11R7.0.inc
> index 158ad0f..ed494b1 100644
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.0.inc
> +++ b/conf/distro/include/preferred-xorg-versions-X11R7.0.inc
> @@ -30,313 +30,313 @@ PREFERRED_PROVIDER_xrandr = "xrandr"
>   PREFERRED_PROVIDER_xserver = "xserver-xorg"
>   PREFERRED_PROVIDER_virtual/xorg = "xserver-xorg"
>
> -PREFERRED_VERSION_task-xorg = "X11R7.0"
> +PREFERRED_VERSION_task-xorg ?= "X11R7.0"
>
> -PREFERRED_VERSION_appres = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_bdftopcf-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_bdftopcf = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_beforelight = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_bitmap = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_editres = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_fonttosfnt = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_fslsfonts = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_fstobdf = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_iceauth = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_ico = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_lbxproxy = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_listres = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_luit = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_mkcfm = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_mkfontdir-native = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_mkfontdir = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_mkfontscale-native = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_mkfontscale = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_oclock = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_proxymngr = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_rgb = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_rstart = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_scripts = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_sessreg = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_setxkbmap = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_showfont = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_smproxy = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_twm = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_viewres = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_x11perf = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xauth = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xbiff = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xcalc = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xclipboard = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xclock = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xcmsdb = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xconsole = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xcursorgen = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xdbedizzy = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xditview = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xdm = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xdpyinfo = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xdriinfo = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xedit = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xev = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xeyes = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xf86dga = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xfd = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xfindproxy = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xfontsel = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xfs = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xfsinfo = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xfwp = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xgamma = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xgc = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xhost = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xinit = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xkbcomp = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xkbevd = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xkbprint = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xkbutils = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xkill = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xload = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xlogo = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xlsatoms = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xlsclients = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xlsfonts = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xmag = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xman = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xmessage = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xmh = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xmodmap = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xmore = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xphelloworld = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xplsprinters = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xpr = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xprehashprinterlist = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xprop = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xrandr = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xrdb = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xrefresh = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xrx = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xset = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xsetmode = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xsetpointer = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xsetroot = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xsm = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xstdcmap = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xtrap = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xvidtune = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xvinfo = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xwd = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xwininfo = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xwud = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xbitmaps = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xcursor-themes = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xkbdata = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xorg-docs = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xorg-sgml-doctools = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xf86-input-acecad = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-aiptek = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-calcomp = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-citron = "X11R7.0-2.1.1.5"
> -PREFERRED_VERSION_xf86-input-digitaledge = "X11R7.0-1.0.1.3"
> -PREFERRED_VERSION_xf86-input-dmc = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-dynapro = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-elo2300 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-elographics = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-evdev = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-fpit = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-hyperpen = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-jamstudio = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-joystick = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-keyboard = "X11R7.0-1.0.1.3"
> -PREFERRED_VERSION_xf86-input-magellan = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-magictouch = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-microtouch = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-mouse = "X11R7.0-1.0.3.1"
> -PREFERRED_VERSION_xf86-input-mutouch = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-palmax = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-penmount = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-spaceorb = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-summa = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-tek4957 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-ur98 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-input-void = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-apm = "X11R7.0-1.0.1.5"
> -PREFERRED_VERSION_xf86-video-ark = "X11R7.0-0.5.0.5"
> -PREFERRED_VERSION_xf86-video-ati = "X11R7.0-6.5.7.3"
> -PREFERRED_VERSION_xf86-video-chips = "X11R7.0-1.0.1.3"
> -PREFERRED_VERSION_xf86-video-cirrus = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-cyrix = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-dummy = "X11R7.0-0.1.0.5"
> -PREFERRED_VERSION_xf86-video-fbdev = "X11R7.0-0.1.0.5"
> -PREFERRED_VERSION_xf86-video-glint = "X11R7.0-1.0.1.3"
> -PREFERRED_VERSION_xf86-video-i128 = "X11R7.0-1.1.0.5"
> -PREFERRED_VERSION_xf86-video-i740 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-i810 = "X11R7.0-1.4.1.3"
> -PREFERRED_VERSION_xf86-video-imstt = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-mga = "X11R7.0-1.2.1.3"
> -PREFERRED_VERSION_xf86-video-neomagic = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-newport = "X11R7.0-0.1.4.1"
> -PREFERRED_VERSION_xf86-video-nsc = "X11R7.0-2.7.6.5"
> -PREFERRED_VERSION_xf86-video-nv = "X11R7.0-1.0.1.5"
> -PREFERRED_VERSION_xf86-video-rendition = "X11R7.0-4.0.1.3"
> -PREFERRED_VERSION_xf86-video-s3 = "X11R7.0-0.3.5.5"
> -PREFERRED_VERSION_xf86-video-s3virge = "X11R7.0-1.8.6.5"
> -PREFERRED_VERSION_xf86-video-savage = "X11R7.0-2.0.2.3"
> -PREFERRED_VERSION_xf86-video-siliconmotion = "X11R7.0-1.3.1.5"
> -PREFERRED_VERSION_xf86-video-sis = "X11R7.0-0.8.1.3"
> -PREFERRED_VERSION_xf86-video-sisusb = "X11R7.0-0.7.1.3"
> -PREFERRED_VERSION_xf86-video-sunbw2 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-suncg14 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-suncg3 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-suncg6 = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-sunffb = "X11R7.0-1.0.1.3"
> -PREFERRED_VERSION_xf86-video-sunleo = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-suntcx = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-tdfx = "X11R7.0-1.1.1.3"
> -PREFERRED_VERSION_xf86-video-tga = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-trident = "X11R7.0-1.0.1.2"
> -PREFERRED_VERSION_xf86-video-tseng = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_xf86-video-v4l = "X11R7.0-0.0.1.5"
> -PREFERRED_VERSION_xf86-video-vesa = "X11R7.0-1.0.1.3"
> -PREFERRED_VERSION_xf86-video-vga = "X11R7.0-4.0.0.5"
> -PREFERRED_VERSION_xf86-video-via = "X11R7.0-0.1.33.2"
> -PREFERRED_VERSION_xf86-video-vmware = "X11R7.0-10.11.1.3"
> -PREFERRED_VERSION_xf86-video-voodoo = "X11R7.0-1.0.0.5"
> -PREFERRED_VERSION_encodings = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-adobe-100dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-adobe-75dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-adobe-utopia-100dpi = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_font-adobe-utopia-75dpi = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_font-adobe-utopia-type1 = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_font-alias = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_font-arabic-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bh-100dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bh-75dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bh-ttf = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bh-type1 = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bitstream-100dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bitstream-75dpi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bitstream-speedo = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-bitstream-type1 = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-cronyx-cyrillic = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-cursor-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-daewoo-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-dec-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-ibm-type1 = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-isas-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-jis-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-micro-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-misc-cyrillic = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-misc-ethiopic = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-misc-meltho = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-misc-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-mutt-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-schumacher-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-screen-cyrillic = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-sony-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-sun-misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-util-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-util = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-winitzki-cyrillic = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_font-xfree86-type1 = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_diet-x11 = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libapplewm = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libdmx = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libfontenc-native = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libfontenc = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libfs = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libice = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_liblbxutil = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_liboldx = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libsm = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libwindowswm = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libx11-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libx11 = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxau-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxau = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxaw = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxcomposite = "X11R7.0-0.2.2.2"
> -PREFERRED_VERSION_libxcursor = "X11R7.0-1.1.5.2"
> -PREFERRED_VERSION_libxdamage = "X11R7.0-1.0.2.2"
> -PREFERRED_VERSION_libxdmcp-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxdmcp = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxevie = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxext = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxfixes = "X11R7.0-3.0.1.2"
> -PREFERRED_VERSION_libxfont-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxfont = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxfontcache = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxft = "X11R7.0-2.1.8.2"
> -PREFERRED_VERSION_libxi = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxinerama = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxkbfile = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxkbui = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxmu = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxp = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxpm = "X11R7.0-3.5.4.2"
> -PREFERRED_VERSION_libxprintapputil = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxprintutil = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxrandr = "X11R7.0-1.1.0.2"
> -PREFERRED_VERSION_libxrender = "X11R7.0-0.9.0.2"
> -PREFERRED_VERSION_libxres = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxscrnsaver = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxt = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxtrap = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxtst = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxv = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxvmc = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_libxxf86dga = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxxf86misc = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_libxxf86vm = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xtrans-native = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_xtrans = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_applewmproto = "X11R7.0-1.0.3"
> -PREFERRED_VERSION_bigreqsproto-native = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_bigreqsproto = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_compositeproto = "X11R7.0-0.2.2"
> -PREFERRED_VERSION_damageproto = "X11R7.0-1.0.3"
> -PREFERRED_VERSION_dmxproto = "X11R7.0-2.2.2"
> -PREFERRED_VERSION_evieext = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_fixesproto = "X11R7.0-3.0.2"
> -PREFERRED_VERSION_fontcacheproto-native = "X11R7.0-0.1.2"
> -PREFERRED_VERSION_fontcacheproto = "X11R7.0-0.1.2"
> -PREFERRED_VERSION_fontsproto-native = "X11R7.0-2.0.2"
> -PREFERRED_VERSION_fontsproto = "X11R7.0-2.0.2"
> -PREFERRED_VERSION_glproto = "X11R7.0-1.4.3"
> -PREFERRED_VERSION_inputproto-native = "X11R7.0-1.3.2"
> -PREFERRED_VERSION_inputproto = "X11R7.0-1.3.2"
> -PREFERRED_VERSION_kbproto-native = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_kbproto = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_printproto = "X11R7.0-1.0.3"
> -PREFERRED_VERSION_randrproto = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_recordproto = "X11R7.0-1.13.2"
> -PREFERRED_VERSION_renderproto = "X11R7.0-0.9.2"
> -PREFERRED_VERSION_resourceproto = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_scrnsaverproto = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_trapproto = "X11R7.0-3.4.3"
> -PREFERRED_VERSION_videoproto = "X11R7.0-2.2.2"
> -PREFERRED_VERSION_windowswmproto = "X11R7.0-1.0.3"
> -PREFERRED_VERSION_xcmiscproto-native = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_xcmiscproto = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_xextproto-native = "X11R7.0-7.0.2"
> -PREFERRED_VERSION_xextproto = "X11R7.0-7.0.2"
> -PREFERRED_VERSION_xf86bigfontproto-native = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_xf86bigfontproto = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_xf86dgaproto = "X11R7.0-2.0.2"
> -PREFERRED_VERSION_xf86driproto = "X11R7.0-2.0.3"
> -PREFERRED_VERSION_xf86miscproto = "X11R7.0-0.9.2"
> -PREFERRED_VERSION_xf86rushproto = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_xf86vidmodeproto = "X11R7.0-2.2.2"
> -PREFERRED_VERSION_xineramaproto = "X11R7.0-1.1.2"
> -PREFERRED_VERSION_xproto-native = "X11R7.0-7.0.4"
> -PREFERRED_VERSION_xproto = "X11R7.0-7.0.4"
> -PREFERRED_VERSION_xproxymanagementprotocol = "X11R7.0-1.0.2"
> -PREFERRED_VERSION_gccmakedep = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_imake = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_lndir = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_makedepend = "X11R7.0-1.0.0"
> -PREFERRED_VERSION_util-macros-native = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_util-macros = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xorg-cf-files = "X11R7.0-1.0.1"
> -PREFERRED_VERSION_xserver-xorg = "X11R7.0-1.0.1"
> +PREFERRED_VERSION_appres ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_bdftopcf-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_bdftopcf ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_beforelight ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_bitmap ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_editres ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_fonttosfnt ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_fslsfonts ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_fstobdf ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_iceauth ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_ico ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_lbxproxy ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_listres ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_luit ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_mkcfm ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_mkfontdir-native ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_mkfontdir ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_mkfontscale-native ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_mkfontscale ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_oclock ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_proxymngr ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_rgb ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_rstart ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_scripts ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_sessreg ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_setxkbmap ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_showfont ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_smproxy ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_twm ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_viewres ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_x11perf ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xauth ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xbiff ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xcalc ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xclipboard ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xclock ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xcmsdb ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xconsole ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xcursorgen ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xdbedizzy ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xditview ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xdm ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xdpyinfo ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xdriinfo ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xedit ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xev ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xeyes ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xf86dga ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xfd ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xfindproxy ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xfontsel ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xfs ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xfsinfo ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xfwp ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xgamma ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xgc ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xhost ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xinit ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xkbcomp ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xkbevd ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xkbprint ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xkbutils ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xkill ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xload ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xlogo ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xlsatoms ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xlsclients ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xlsfonts ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xmag ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xman ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xmessage ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xmh ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xmodmap ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xmore ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xphelloworld ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xplsprinters ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xpr ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xprehashprinterlist ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xprop ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xrandr ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xrdb ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xrefresh ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xrx ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xset ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xsetmode ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xsetpointer ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xsetroot ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xsm ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xstdcmap ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xtrap ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xvidtune ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xvinfo ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xwd ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xwininfo ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xwud ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xbitmaps ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xcursor-themes ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xkbdata ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xorg-docs ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xorg-sgml-doctools ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xf86-input-acecad ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-aiptek ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-calcomp ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-citron ?= "X11R7.0-2.1.1.5"
> +PREFERRED_VERSION_xf86-input-digitaledge ?= "X11R7.0-1.0.1.3"
> +PREFERRED_VERSION_xf86-input-dmc ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-dynapro ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-elo2300 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-elographics ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-evdev ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-fpit ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-hyperpen ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-jamstudio ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-joystick ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-keyboard ?= "X11R7.0-1.0.1.3"
> +PREFERRED_VERSION_xf86-input-magellan ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-magictouch ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-microtouch ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-mouse ?= "X11R7.0-1.0.3.1"
> +PREFERRED_VERSION_xf86-input-mutouch ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-palmax ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-penmount ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-spaceorb ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-summa ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-tek4957 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-ur98 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-input-void ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-apm ?= "X11R7.0-1.0.1.5"
> +PREFERRED_VERSION_xf86-video-ark ?= "X11R7.0-0.5.0.5"
> +PREFERRED_VERSION_xf86-video-ati ?= "X11R7.0-6.5.7.3"
> +PREFERRED_VERSION_xf86-video-chips ?= "X11R7.0-1.0.1.3"
> +PREFERRED_VERSION_xf86-video-cirrus ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-cyrix ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-dummy ?= "X11R7.0-0.1.0.5"
> +PREFERRED_VERSION_xf86-video-fbdev ?= "X11R7.0-0.1.0.5"
> +PREFERRED_VERSION_xf86-video-glint ?= "X11R7.0-1.0.1.3"
> +PREFERRED_VERSION_xf86-video-i128 ?= "X11R7.0-1.1.0.5"
> +PREFERRED_VERSION_xf86-video-i740 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-i810 ?= "X11R7.0-1.4.1.3"
> +PREFERRED_VERSION_xf86-video-imstt ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-mga ?= "X11R7.0-1.2.1.3"
> +PREFERRED_VERSION_xf86-video-neomagic ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-newport ?= "X11R7.0-0.1.4.1"
> +PREFERRED_VERSION_xf86-video-nsc ?= "X11R7.0-2.7.6.5"
> +PREFERRED_VERSION_xf86-video-nv ?= "X11R7.0-1.0.1.5"
> +PREFERRED_VERSION_xf86-video-rendition ?= "X11R7.0-4.0.1.3"
> +PREFERRED_VERSION_xf86-video-s3 ?= "X11R7.0-0.3.5.5"
> +PREFERRED_VERSION_xf86-video-s3virge ?= "X11R7.0-1.8.6.5"
> +PREFERRED_VERSION_xf86-video-savage ?= "X11R7.0-2.0.2.3"
> +PREFERRED_VERSION_xf86-video-siliconmotion ?= "X11R7.0-1.3.1.5"
> +PREFERRED_VERSION_xf86-video-sis ?= "X11R7.0-0.8.1.3"
> +PREFERRED_VERSION_xf86-video-sisusb ?= "X11R7.0-0.7.1.3"
> +PREFERRED_VERSION_xf86-video-sunbw2 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-suncg14 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-suncg3 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-suncg6 ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-sunffb ?= "X11R7.0-1.0.1.3"
> +PREFERRED_VERSION_xf86-video-sunleo ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-suntcx ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-tdfx ?= "X11R7.0-1.1.1.3"
> +PREFERRED_VERSION_xf86-video-tga ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-trident ?= "X11R7.0-1.0.1.2"
> +PREFERRED_VERSION_xf86-video-tseng ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_xf86-video-v4l ?= "X11R7.0-0.0.1.5"
> +PREFERRED_VERSION_xf86-video-vesa ?= "X11R7.0-1.0.1.3"
> +PREFERRED_VERSION_xf86-video-vga ?= "X11R7.0-4.0.0.5"
> +PREFERRED_VERSION_xf86-video-via ?= "X11R7.0-0.1.33.2"
> +PREFERRED_VERSION_xf86-video-vmware ?= "X11R7.0-10.11.1.3"
> +PREFERRED_VERSION_xf86-video-voodoo ?= "X11R7.0-1.0.0.5"
> +PREFERRED_VERSION_encodings ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-adobe-100dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-adobe-75dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-adobe-utopia-100dpi ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_font-adobe-utopia-75dpi ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_font-adobe-utopia-type1 ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_font-alias ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_font-arabic-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bh-100dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bh-75dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bh-ttf ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bh-type1 ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bitstream-100dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bitstream-75dpi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bitstream-speedo ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-bitstream-type1 ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-cronyx-cyrillic ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-cursor-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-daewoo-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-dec-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-ibm-type1 ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-isas-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-jis-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-micro-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-misc-cyrillic ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-misc-ethiopic ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-misc-meltho ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-misc-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-mutt-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-schumacher-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-screen-cyrillic ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-sony-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-sun-misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-util-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-util ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-winitzki-cyrillic ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_font-xfree86-type1 ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_diet-x11 ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libapplewm ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libdmx ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libfontenc-native ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libfontenc ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libfs ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libice ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_liblbxutil ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_liboldx ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libsm ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libwindowswm ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libx11-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libx11 ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxau-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxau ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxaw ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxcomposite ?= "X11R7.0-0.2.2.2"
> +PREFERRED_VERSION_libxcursor ?= "X11R7.0-1.1.5.2"
> +PREFERRED_VERSION_libxdamage ?= "X11R7.0-1.0.2.2"
> +PREFERRED_VERSION_libxdmcp-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxdmcp ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxevie ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxext ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxfixes ?= "X11R7.0-3.0.1.2"
> +PREFERRED_VERSION_libxfont-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxfont ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxfontcache ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxft ?= "X11R7.0-2.1.8.2"
> +PREFERRED_VERSION_libxi ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxinerama ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxkbfile ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxkbui ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxmu ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxp ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxpm ?= "X11R7.0-3.5.4.2"
> +PREFERRED_VERSION_libxprintapputil ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxprintutil ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxrandr ?= "X11R7.0-1.1.0.2"
> +PREFERRED_VERSION_libxrender ?= "X11R7.0-0.9.0.2"
> +PREFERRED_VERSION_libxres ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxscrnsaver ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxt ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxtrap ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxtst ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxv ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxvmc ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_libxxf86dga ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxxf86misc ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_libxxf86vm ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xtrans-native ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_xtrans ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_applewmproto ?= "X11R7.0-1.0.3"
> +PREFERRED_VERSION_bigreqsproto-native ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_bigreqsproto ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_compositeproto ?= "X11R7.0-0.2.2"
> +PREFERRED_VERSION_damageproto ?= "X11R7.0-1.0.3"
> +PREFERRED_VERSION_dmxproto ?= "X11R7.0-2.2.2"
> +PREFERRED_VERSION_evieext ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_fixesproto ?= "X11R7.0-3.0.2"
> +PREFERRED_VERSION_fontcacheproto-native ?= "X11R7.0-0.1.2"
> +PREFERRED_VERSION_fontcacheproto ?= "X11R7.0-0.1.2"
> +PREFERRED_VERSION_fontsproto-native ?= "X11R7.0-2.0.2"
> +PREFERRED_VERSION_fontsproto ?= "X11R7.0-2.0.2"
> +PREFERRED_VERSION_glproto ?= "X11R7.0-1.4.3"
> +PREFERRED_VERSION_inputproto-native ?= "X11R7.0-1.3.2"
> +PREFERRED_VERSION_inputproto ?= "X11R7.0-1.3.2"
> +PREFERRED_VERSION_kbproto-native ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_kbproto ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_printproto ?= "X11R7.0-1.0.3"
> +PREFERRED_VERSION_randrproto ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_recordproto ?= "X11R7.0-1.13.2"
> +PREFERRED_VERSION_renderproto ?= "X11R7.0-0.9.2"
> +PREFERRED_VERSION_resourceproto ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_scrnsaverproto ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_trapproto ?= "X11R7.0-3.4.3"
> +PREFERRED_VERSION_videoproto ?= "X11R7.0-2.2.2"
> +PREFERRED_VERSION_windowswmproto ?= "X11R7.0-1.0.3"
> +PREFERRED_VERSION_xcmiscproto-native ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_xcmiscproto ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_xextproto-native ?= "X11R7.0-7.0.2"
> +PREFERRED_VERSION_xextproto ?= "X11R7.0-7.0.2"
> +PREFERRED_VERSION_xf86bigfontproto-native ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_xf86bigfontproto ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_xf86dgaproto ?= "X11R7.0-2.0.2"
> +PREFERRED_VERSION_xf86driproto ?= "X11R7.0-2.0.3"
> +PREFERRED_VERSION_xf86miscproto ?= "X11R7.0-0.9.2"
> +PREFERRED_VERSION_xf86rushproto ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_xf86vidmodeproto ?= "X11R7.0-2.2.2"
> +PREFERRED_VERSION_xineramaproto ?= "X11R7.0-1.1.2"
> +PREFERRED_VERSION_xproto-native ?= "X11R7.0-7.0.4"
> +PREFERRED_VERSION_xproto ?= "X11R7.0-7.0.4"
> +PREFERRED_VERSION_xproxymanagementprotocol ?= "X11R7.0-1.0.2"
> +PREFERRED_VERSION_gccmakedep ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_imake ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_lndir ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_makedepend ?= "X11R7.0-1.0.0"
> +PREFERRED_VERSION_util-macros-native ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_util-macros ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xorg-cf-files ?= "X11R7.0-1.0.1"
> +PREFERRED_VERSION_xserver-xorg ?= "X11R7.0-1.0.1"
> diff --git a/conf/distro/include/sane-toolchain-java.inc b/conf/distro/include/sane-toolchain-java.inc
> index a0f5792..13c5cc4 100644
> --- a/conf/distro/include/sane-toolchain-java.inc
> +++ b/conf/distro/include/sane-toolchain-java.inc
> @@ -2,5 +2,5 @@
>
>   PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
>   PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> -PREFERRED_VERSION_classpath-native = "0.98"
> -PREFERRED_VERSION_classpath = "0.98"
> +PREFERRED_VERSION_classpath-native ?= "0.98"
> +PREFERRED_VERSION_classpath ?= "0.98"
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
> index de73922..533db1a 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -34,9 +34,9 @@ PREFERRED_VERSION_binutils-cross     ?= "${PREFERRED_BINUTILS}"
>   PREFERRED_VERSION_binutils-cross-sdk ?= "${PREFERRED_BINUTILS}"
>
>   # Avr32 only has patches for binutils 2.17 in OE
> -PREFERRED_VERSION_binutils_avr32 =           "2.17"
> -PREFERRED_VERSION_binutils-cross_avr32 =     "2.17"
> -PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
> +PREFERRED_VERSION_binutils_avr32 ?=           "2.17"
> +PREFERRED_VERSION_binutils-cross_avr32 ?=     "2.17"
> +PREFERRED_VERSION_binutils-cross-sdk_avr32 ?= "2.17"
>
>   # Compiler versions
>   PREFERRED_VERSION_gcc                    ?= "${PREFERRED_GCC_VERSION}"
> diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
> index f62ca99..1226bf0 100644
> --- a/conf/distro/jlime-2010.1.conf
> +++ b/conf/distro/jlime-2010.1.conf
> @@ -67,13 +67,13 @@ PREFERRED_PROVIDER_gtk+ = "gtk+"
>   PREFERRED_PROVIDER_virtual/libqte2 = "qte-mt-static"
>   PREFERRED_PROVIDER_bluez-libs = "bluez-libs"
>
> -PREFERRED_VERSION_gcc = "4.4.2"
> -PREFERRED_VERSION_gcc-cross = "4.4.2"
> -PREFERRED_VERSION_gcc-cross-initial = "4.4.2"
> -PREFERRED_VERSION_gcc-cross-intermediate = "4.4.2"
> -PREFERRED_VERSION_binutils = "2.20"
> -PREFERRED_VERSION_binutils-cross = "2.20"
> -PREFERRED_VERSION_coreutils-native = "7.2"
> +PREFERRED_VERSION_gcc ?= "4.4.2"
> +PREFERRED_VERSION_gcc-cross ?= "4.4.2"
> +PREFERRED_VERSION_gcc-cross-initial ?= "4.4.2"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "4.4.2"
> +PREFERRED_VERSION_binutils ?= "2.20"
> +PREFERRED_VERSION_binutils-cross ?= "2.20"
> +PREFERRED_VERSION_coreutils-native ?= "7.2"
>
>   #
>   # Target OS&  FPU system
> @@ -89,9 +89,9 @@ TARGET_FPU_mips = "soft"
>   LIBC = "glibc"
>   require conf/distro/include/${LIBC}.inc
>
> -PREFERRED_VERSION_linux-libc-headers = "2.6.31"
> -PREFERRED_VERSION_glibc-initial = "2.9"
> -PREFERRED_VERSION_glibc = "2.9"
> +PREFERRED_VERSION_linux-libc-headers ?= "2.6.31"
> +PREFERRED_VERSION_glibc-initial ?= "2.9"
> +PREFERRED_VERSION_glibc ?= "2.9"
>
>   #
>   # Bootstrap&  Init
> @@ -109,13 +109,13 @@ PREFERRED_PROVIDER_virtual/libx11-native = "libx11-native"
>   PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
>   PREFERRED_PROVIDER_virtual/libgl = "mesa-xlib"
>   PREFERRED_PROVIDER_tslib = "tslib"
> -PREFERRED_VERSION_mesa = "7.6"
> -PREFERRED_VERSION_mesa-dri = "7.6"
> -PREFERRED_VERSION_mesa-xlib = "7.6"
> +PREFERRED_VERSION_mesa ?= "7.6"
> +PREFERRED_VERSION_mesa-dri ?= "7.6"
> +PREFERRED_VERSION_mesa-xlib ?= "7.6"
>   SERVER ?= " xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mousexf86-video-fbdev "
>
>   #
>   # General Userspace
>   #
>   require conf/distro/include/preferred-opie-versions-1.2.4.inc
> -PREFERRED_VERSION_cdparanoia  = "10.2"
> +PREFERRED_VERSION_cdparanoia  ?= "10.2"
> diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.conf
> index 4828dce..b126e01 100644
> --- a/conf/distro/kaeilos-2010.conf
> +++ b/conf/distro/kaeilos-2010.conf
> @@ -69,7 +69,7 @@ IPKG_VARIANT = "opkg"
>
>
>   #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
>
>   # see into glibc-package.bbclass : added KaeilOS hack supporting glibc 2.9
>   LIBC ?= "eglibc"
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index 78a69f1..e890e24 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -74,7 +74,7 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
>   #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
>
>   #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
>
>   # see into glibc-package.bbclass : added KaeilOS hack supporting glibc 2.9
>   PREFERRED_VERSION_glibc 		?= "2.9"
> @@ -118,9 +118,9 @@ PREFERRED_VERSION_gcc-cross-initial      ?= "${ANGSTROM_GCC_VERSION}"
>   PREFERRED_VERSION_gcc-cross-intermediate ?= "${ANGSTROM_GCC_VERSION}"
>
>   #avr32 only has patches for binutils 2.17 in OE
> -PREFERRED_VERSION_binutils_avr32 = "2.17"
> -PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
> -PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
> +PREFERRED_VERSION_binutils_avr32 ?= "2.17"
> +PREFERRED_VERSION_binutils-cross_avr32 ?= "2.17"
> +PREFERRED_VERSION_binutils-cross-sdk_avr32 ?= "2.17"
>
>   # Toolchain virtuals:
>   require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> diff --git a/conf/distro/maemo5-compat.conf b/conf/distro/maemo5-compat.conf
> index b3e5da0..1048060 100644
> --- a/conf/distro/maemo5-compat.conf
> +++ b/conf/distro/maemo5-compat.conf
> @@ -59,78 +59,78 @@ PREFERRED_PROVIDER_virtual/libx11-native = "libx11-native"
>   PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
>   PREFERRED_PROVIDER_util-linux = "util-linux"
>
> -PREFERRED_VERSION_autoconf-native = "2.63"
> -PREFERRED_VERSION_automake-native = "1.11.1"
> +PREFERRED_VERSION_autoconf-native ?= "2.63"
> +PREFERRED_VERSION_automake-native ?= "1.11.1"
>
> -PREFERRED_VERSION_binutils 	    = "2.18.50.0.7"
> -PREFERRED_VERSION_binutils-cross    = "2.18.50.0.7"
> +PREFERRED_VERSION_binutils 	    ?= "2.18.50.0.7"
> +PREFERRED_VERSION_binutils-cross    ?= "2.18.50.0.7"
>
>   GCCVERSION = "4.2.1+csl-arm-2007q3-53"
> -PREFERRED_VERSION_gcc = "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-cross = "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-cross-initial = "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-cross-intermediate = "${GCCVERSION}"
> +PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
> +PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
> +PREFERRED_VERSION_gcc-cross-initial ?= "${GCCVERSION}"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "${GCCVERSION}"
>
>   # Use recent enough version of the headers to let HAL build successfully.
> -PREFERRED_VERSION_linux-libc-headers = "2.6.25"
> +PREFERRED_VERSION_linux-libc-headers ?= "2.6.25"
>
> -PREFERRED_VERSION_glibc = "2.5"
> -PREFERRED_VERSION_glibc-initial = "2.5"
> +PREFERRED_VERSION_glibc ?= "2.5"
> +PREFERRED_VERSION_glibc-initial ?= "2.5"
>
> -PREFERRED_VERSION_libtool-native = "2.2.6b"
> -PREFERRED_VERSION_libtool-cross = "2.2.6b"
> -PREFERRED_VERSION_libtool = "2.2.6b"
> +PREFERRED_VERSION_libtool-native ?= "2.2.6b"
> +PREFERRED_VERSION_libtool-cross ?= "2.2.6b"
> +PREFERRED_VERSION_libtool ?= "2.2.6b"
>
>   require conf/distro/include/sane-srcrevs.inc
>
> -PREFERRED_VERSION_fontconfig       = "2.6.0"
> -PREFERRED_VERSION_freetype         = "2.3.6"
> -PREFERRED_VERSION_freetype-native  = "2.3.6"
> -PREFERRED_VERSION_cairo            = "1.8.0"
> -PREFERRED_VERSION_glib-2.0         = "2.20.3"
> -PREFERRED_VERSION_pango            = "1.24.4"
> -PREFERRED_VERSION_atk              = "1.20.0"
> -PREFERRED_VERSION_gtk+             = "2.14.2"
> -PREFERRED_VERSION_libpng           = "1.2.37"
> -PREFERRED_VERSION_expat            = "1.95.7"
> +PREFERRED_VERSION_fontconfig       ?= "2.6.0"
> +PREFERRED_VERSION_freetype         ?= "2.3.6"
> +PREFERRED_VERSION_freetype-native  ?= "2.3.6"
> +PREFERRED_VERSION_cairo            ?= "1.8.0"
> +PREFERRED_VERSION_glib-2.0         ?= "2.20.3"
> +PREFERRED_VERSION_pango            ?= "1.24.4"
> +PREFERRED_VERSION_atk              ?= "1.20.0"
> +PREFERRED_VERSION_gtk+             ?= "2.14.2"
> +PREFERRED_VERSION_libpng           ?= "1.2.37"
> +PREFERRED_VERSION_expat            ?= "1.95.7"
>
>   # only dbus-glib 0.74 works with older dbus 1.0.x
> -PREFERRED_VERSION_dbus             = "1.2.3"
> -PREFERRED_VERSION_dbus-glib        = "0.78"
> +PREFERRED_VERSION_dbus             ?= "1.2.3"
> +PREFERRED_VERSION_dbus-glib        ?= "0.78"
>
> -PREFERRED_VERSION_gnome-vfs        = "2.22.0"
> +PREFERRED_VERSION_gnome-vfs        ?= "2.22.0"
>
>   # 3.9.1 would be correct
> -PREFERRED_VERSION_gtkhtml-3.8      = "3.8.2"
> -PREFERRED_VERSION_libxml2          = "2.7.3"
> +PREFERRED_VERSION_gtkhtml-3.8      ?= "3.8.2"
> +PREFERRED_VERSION_libxml2          ?= "2.7.3"
>   # 2.16 would be correct
> -PREFERRED_VERSION_gconf            = "2.6.1"
> +PREFERRED_VERSION_gconf            ?= "2.6.1"
>
>   # gstreamer
> -PREFERRED_VERSION_gstreamer        = "0.10.25"
> -PREFERRED_VERSION_gst-plugins-good = "0.10.15"
> -PREFERRED_VERSION_gst-plugins-base = "0.10.25"
> -PREFERRED_VERSION_gst-plugins-bad  = "0.10.14"
> +PREFERRED_VERSION_gstreamer        ?= "0.10.25"
> +PREFERRED_VERSION_gst-plugins-good ?= "0.10.15"
> +PREFERRED_VERSION_gst-plugins-base ?= "0.10.25"
> +PREFERRED_VERSION_gst-plugins-bad  ?= "0.10.14"
>
> -PREFERRED_VERSION_bluez-libs            = "4.56"
> +PREFERRED_VERSION_bluez-libs            ?= "4.56"
>
>   PREFERRED_PROVIDER_virtual/db           = "db"
>   PREFERRED_PROVIDER_virtual/db-native    = "db-native"
>   PREFERRED_PROVIDER_virtual/xserver      = "xserver-xorg"
>
>   PREFERRED_PROVIDER_virtual/libsdl       = "libsdl-x11"
> -PREFERRED_VERSION_libsdl-x11	        = "1.2.11"
> -PREFERRED_VERSION_libsdl-image          = "1.2.3"
> -PREFERRED_VERSION_libsdl-mixer          = "1.2.6"
> +PREFERRED_VERSION_libsdl-x11	        ?= "1.2.11"
> +PREFERRED_VERSION_libsdl-image          ?= "1.2.3"
> +PREFERRED_VERSION_libsdl-mixer          ?= "1.2.6"
>
>   PREFERRED_PROVIDER_xserver          = "xserver-kdrive"
>
> -PREFERRED_VERSION_libxrandr         = "1.2.1"
> -PREFERRED_VERSION_xrandr            = "1.2.0"
> -PREFERRED_VERSION_randrproto        = "1.2.1"
> +PREFERRED_VERSION_libxrandr         ?= "1.2.1"
> +PREFERRED_VERSION_xrandr            ?= "1.2.0"
> +PREFERRED_VERSION_randrproto        ?= "1.2.1"
>
> -PREFERRED_VERSION_libgnomeui         = "2.18.1"
> -PREFERRED_VERSION_gnomevfs           = "2.16.3"
> +PREFERRED_VERSION_libgnomeui         ?= "2.18.1"
> +PREFERRED_VERSION_gnomevfs           ?= "2.16.3"
>
>   PREFERRED_PROVIDER_gtk+                   = "gtk+"
>   PREFERRED_PROVIDER_gdk-pixbuf-loader-ani  = "gtk+"
> @@ -149,26 +149,26 @@ PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  = "gtk+"
>
>   PREFERRED_PROVIDER_gconf                  = "gconf-dbus"
>
> -PREFERRED_VERSION_pixman                  = "0.13.2"
> +PREFERRED_VERSION_pixman                  ?= "0.13.2"
>
>   PREFERRED_PROVIDER_virtual/libqte2	  = "qte-mt"
>   PREFERRED_PROVIDER_avahi		  = "avahi"
>
> -PREFERRED_VERSION_avahi = "0.6.20"
> +PREFERRED_VERSION_avahi ?= "0.6.20"
>
> -PREFERRED_VERSION_libglade = "2.6.2"
> +PREFERRED_VERSION_libglade ?= "2.6.2"
>
> -PREFERRED_VERSION_gpe-scap = "1.4"
> +PREFERRED_VERSION_gpe-scap ?= "1.4"
>
>   # various Maemo4 specific libraries
> -PREFERRED_VERSION_mce-dev = "1.8.15"
> -PREFERRED_VERSION_libosso = "2.23"
> -PREFERRED_VERSION_libhildon = "2.2.0"
> -PREFERRED_VERSION_libhildonmime = "2.1.3"
> -PREFERRED_VERSION_libhildonfm = "2.28"
> -PREFERRED_VERSION_hildon-thumbnail = "3.0.41"
> +PREFERRED_VERSION_mce-dev ?= "1.8.15"
> +PREFERRED_VERSION_libosso ?= "2.23"
> +PREFERRED_VERSION_libhildon ?= "2.2.0"
> +PREFERRED_VERSION_libhildonmime ?= "2.1.3"
> +PREFERRED_VERSION_libhildonfm ?= "2.28"
> +PREFERRED_VERSION_hildon-thumbnail ?= "3.0.41"
>
> -PREFERRED_VERSION_shared-mime-info = "0.30"
> +PREFERRED_VERSION_shared-mime-info ?= "0.30"
>
>   # Java stuff
>   PREFERRED_PROVIDER_midpath = "midpath-maemo"
> @@ -180,16 +180,16 @@ PREFERRED_PROVIDER_virtual/java-initial ?= "jamvm-initial"
>   PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>
>   PREFERRED_PROVIDER_classpath = "classpath"
> -PREFERRED_VERSION_classpath = "0.98"
> +PREFERRED_VERSION_classpath ?= "0.98"
>
>   PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk-hildon"
> -PREFERRED_VERSION_swt3.4-gtk-hildon = "3.4"
> +PREFERRED_VERSION_swt3.4-gtk-hildon ?= "3.4"
>
>   # Does not build with later versions
> -PREFERRED_VERSION_fakeroot-native = "1.9.6"
> +PREFERRED_VERSION_fakeroot-native ?= "1.9.6"
>
>   # newer Versions needs newer autotools we cant relay on
> -PREFERRED_VERSION_guile-native = "1.8.2"
> +PREFERRED_VERSION_guile-native ?= "1.8.2"
>
>   # WARNING: If you change these values after the respective package has
>   # been built the change will have no effect. Edit the package's file in
> diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
> index 31d6c36..8db5a37 100644
> --- a/conf/distro/mamona.conf
> +++ b/conf/distro/mamona.conf
> @@ -28,7 +28,7 @@ MACHINE_KERNEL_VERSION = "2.6"
>   PREFERRED_VERSION_linux-omap1 ?= "2.6.22-omap1"
>   PREFERRED_VERSION_linux-libc-headers ?= "2.6.22"
>   PREFERRED_VERSION_linux ?= "2.6.22"
> -PREFERRED_VERSION_linux-libc-headers_nokia770 = "2.6.16.osso7"
> +PREFERRED_VERSION_linux-libc-headers_nokia770 ?= "2.6.16.osso7"
>   PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
>
>   # Toolchain
> @@ -76,9 +76,9 @@ PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
>   PREFERRED_PROVIDER_avahi = "avahi"
>   PREFERRED_PROVIDER_gconf = "gconf-dbus"
>
> -PREFERRED_VERSION_apt = "0.7.6"
> +PREFERRED_VERSION_apt ?= "0.7.6"
>   PREFERRED_VERSION_gpsd ?= "2.33"
> -PREFERRED_VERSION_hal_nokia770 = "0.5.7"
> +PREFERRED_VERSION_hal_nokia770 ?= "0.5.7"
>   PREFERRED_VERSION_networkmanager ?= "0.6.6"
>
>   # Mplayer
> @@ -86,8 +86,8 @@ PREFERRED_VERSION_mplayer_nokia770 ?= "1.0maemo0"
>   PREFERRED_VERSION_mplayer_nokia800 ?= "1.0maemo0"
>
>   # Network
> -PREFERRED_VERSION_wpa-supplicant = "0.5.7"
> +PREFERRED_VERSION_wpa-supplicant ?= "0.5.7"
>
>   # Mozilla
>   PREFERRED_PROVIDER_gtk+ = "gtk+"
> -PREFERRED_VERSION_gtk+ = "2.10.14"
> +PREFERRED_VERSION_gtk+ ?= "2.10.14"
> diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
> index ae8d064..9c1d07d 100644
> --- a/conf/distro/nylon.conf
> +++ b/conf/distro/nylon.conf
> @@ -57,33 +57,33 @@ IPKGBUILDCMD = "stage-manager-ipkg-build -o 0 -g 0"
>   #############################################################################
>   # PREFERRED VERSIONS
>   #############################################################################
> -PREFERRED_VERSION_busybox = "1.7.2"
> -PREFERRED_VERSION_glibc = "2.3.3"
> -PREFERRED_VERSION_glibc-initial = "2.3.2"
> -PREFERRED_VERSION_shorewall = "2.0.9-monolithic"
> -PREFERRED_VERSION_ppp-dsl = "0.1-monolithic"
> -PREFERRED_VERSION_mtd-utils = "1.1.0"
> -PREFERRED_VERSION_kismet = "2005-01-R1"
> -PREFERRED_VERSION_automake-native = "1.10.2"
> -PREFERRED_VERSION_pkgconfig-native = "0.23"
> -PREFERRED_VERSION_netperf = "2.3"
> +PREFERRED_VERSION_busybox ?= "1.7.2"
> +PREFERRED_VERSION_glibc ?= "2.3.3"
> +PREFERRED_VERSION_glibc-initial ?= "2.3.2"
> +PREFERRED_VERSION_shorewall ?= "2.0.9-monolithic"
> +PREFERRED_VERSION_ppp-dsl ?= "0.1-monolithic"
> +PREFERRED_VERSION_mtd-utils ?= "1.1.0"
> +PREFERRED_VERSION_kismet ?= "2005-01-R1"
> +PREFERRED_VERSION_automake-native ?= "1.10.2"
> +PREFERRED_VERSION_pkgconfig-native ?= "0.23"
> +PREFERRED_VERSION_netperf ?= "2.3"
>
> -PREFERRED_VERSION_gcc-cross-initial = "3.3.4"
> -PREFERRED_VERSION_gcc-cross-intermediate = "3.3.4"
> -PREFERRED_VERSION_gcc-cross = "3.3.4"
> -PREFERRED_VERSION_gcc-cross-sdk = "3.3.4"
> -PREFERRED_VERSION_gcc = "3.3.4"
> -PREFERRED_VERSION_binutils-cross = "2.14.90.0.7"
> -PREFERRED_VERSION_binutils-cross-sdk = "2.14.90.0.7"
> -PREFERRED_VERSION_binutils = "2.16"
> -PREFERRED_VERSION_linux-libc-headers = "2.6.18"
> -PREFERRED_VERSION_prism54-firmware = "1.0.3.0"
> +PREFERRED_VERSION_gcc-cross-initial ?= "3.3.4"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "3.3.4"
> +PREFERRED_VERSION_gcc-cross ?= "3.3.4"
> +PREFERRED_VERSION_gcc-cross-sdk ?= "3.3.4"
> +PREFERRED_VERSION_gcc ?= "3.3.4"
> +PREFERRED_VERSION_binutils-cross ?= "2.14.90.0.7"
> +PREFERRED_VERSION_binutils-cross-sdk ?= "2.14.90.0.7"
> +PREFERRED_VERSION_binutils ?= "2.16"
> +PREFERRED_VERSION_linux-libc-headers ?= "2.6.18"
> +PREFERRED_VERSION_prism54-firmware ?= "1.0.3.0"
>   #PREFERRED_VERSION_udev = "089"
> -PREFERRED_VERSION_udev = "100"
> -PREFERRED_VERSION_madwifi-modules = "0.9.3"
> -PREFERRED_VERSION_madwifi-tools = "0.9.3"
> -PREFERRED_VERSION_e2fsprogs-libs = "1.41.8"
> -PREFERRED_VERSION_dbus = "1.2.1"
> +PREFERRED_VERSION_udev ?= "100"
> +PREFERRED_VERSION_madwifi-modules ?= "0.9.3"
> +PREFERRED_VERSION_madwifi-tools ?= "0.9.3"
> +PREFERRED_VERSION_e2fsprogs-libs ?= "1.41.8"
> +PREFERRED_VERSION_dbus ?= "1.2.1"
>
>   PREFERRED_PROVIDER_hotplug = "linux-hotplug"
>   PREFERRED_PROVIDER_opkg = "opkg"
> diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
> index 4e0f472..945d654 100644
> --- a/conf/distro/openprotium.conf
> +++ b/conf/distro/openprotium.conf
> @@ -47,10 +47,10 @@ PREFERRED_VERSION_gcc-cross-sdk ?= "4.1.2"
>   PREFERRED_VERSION_gcc-cross-initial ?= "4.1.2"
>   PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.2"
>
> -PREFERRED_VERSION_glibc		     = "2.6.1"
> -PREFERRED_VERSION_glibc-initial      = "2.6.1"
> +PREFERRED_VERSION_glibc		     ?= "2.6.1"
> +PREFERRED_VERSION_glibc-initial      ?= "2.6.1"
>
> -PREFERRED_VERSION_linux-libc-headers = "2.6.11.1"
> +PREFERRED_VERSION_linux-libc-headers ?= "2.6.11.1"
>
>   #
>   # Providers...
> diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc.conf
> index 480602b..0136aec 100644
> --- a/conf/distro/oplinux-uclibc.conf
> +++ b/conf/distro/oplinux-uclibc.conf
> @@ -56,7 +56,7 @@ PREFERRED_VERSION_binutils-cross ?= "2.17.50.0.5"
>
>
>   #PREFERRED_VERSION_linux-libc-headers   = "2.6.15.99"
> -PREFERRED_VERSION_linux-libc-headers    = "2.6.11.1"
> +PREFERRED_VERSION_linux-libc-headers    ?= "2.6.11.1"
>
>   SRCDATE_uclibc ?= "20061128"
>   PREFERRED_VERSION_uclibc ?= "0.9.28+svn${SRCDATE_uclibc}"
> diff --git a/conf/distro/sharprom-compatible.conf b/conf/distro/sharprom-compatible.conf
> index caee288..163cec5 100644
> --- a/conf/distro/sharprom-compatible.conf
> +++ b/conf/distro/sharprom-compatible.conf
> @@ -53,8 +53,8 @@ PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
>   PREFERRED_PROVIDER_virtual/arm-linux-gcc-initial = "sharprom-toolchain-native"
>   PREFERRED_PROVIDER_virtual/arm-linux-gcc-intermediate = "sharprom-toolchain-native"
>
> -PREFERRED_VERSION_glibc = "2.2.5"
> -PREFERRED_VERSION_linux-libc-headers = "2.4.18"
> +PREFERRED_VERSION_glibc ?= "2.2.5"
> +PREFERRED_VERSION_linux-libc-headers ?= "2.4.18"
>
>   IPKGBUILDCMD = "ipkg-build -c -o 0 -g 0"
>   #PACKAGE_STRIP = "no"
> diff --git a/conf/distro/ucslugc.conf b/conf/distro/ucslugc.conf
> index df8cde8..1b254ec 100644
> --- a/conf/distro/ucslugc.conf
> +++ b/conf/distro/ucslugc.conf
> @@ -11,10 +11,10 @@ TARGET_OS = "linux-uclibc"
>   LIBC = "uclibc"
>   require conf/distro/include/${LIBC}.inc
>
> -PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
> -PREFERRED_VERSION_gcc-cross = "3.4.4"
> -PREFERRED_VERSION_gcc = "3.4.4"
> +PREFERRED_VERSION_gcc-cross-initial ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross ?= "3.4.4"
> +PREFERRED_VERSION_gcc ?= "3.4.4"
>
>   require conf/distro/include/slugos.inc
>
> diff --git a/conf/distro/wrt54oe.conf b/conf/distro/wrt54oe.conf
> index 0cea349..7321129 100644
> --- a/conf/distro/wrt54oe.conf
> +++ b/conf/distro/wrt54oe.conf
> @@ -20,11 +20,11 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-inte
>   PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
>   PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
>
> -PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
> -PREFERRED_VERSION_gcc-cross = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-sdk = "3.4.4"
> -PREFERRED_VERSION_gcc = "3.4.4"
> +PREFERRED_VERSION_gcc-cross-initial ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-intermediate ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-sdk ?= "3.4.4"
> +PREFERRED_VERSION_gcc ?= "3.4.4"
>
>   IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}_${BUILDNAME}"
>   KERNEL_IMAGE_NAME = "kernel-${KV}-${MACHINE}_${BUILDNAME}"
> diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> index 05eb2c5..6561057 100644
> --- a/conf/machine/am3517-evm.conf
> +++ b/conf/machine/am3517-evm.conf
> @@ -26,7 +26,7 @@ USE_VT = "2"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
>
>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   UBOOT_ARCH = "arm"
>   UBOOT_MACHINE = "am3517_evm_config"
> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> index 096d9e0..860200e 100644
> --- a/conf/machine/am37x-evm.conf
> +++ b/conf/machine/am37x-evm.conf
> @@ -25,7 +25,7 @@ SERIAL_CONSOLE = "115200 ttyS0"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
>
>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   UBOOT_ARCH = "arm"
>   UBOOT_MACHINE = "omap3_evm_config"
> diff --git a/conf/machine/amsdelta.conf b/conf/machine/amsdelta.conf
> index e1ad289..7fd17a6 100644
> --- a/conf/machine/amsdelta.conf
> +++ b/conf/machine/amsdelta.conf
> @@ -17,7 +17,7 @@ EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
>
>   GUI_MACHINE_CLASS="smallscreen"
>
> -PREFERRED_VERSION_u-boot = "1.1.4"
> +PREFERRED_VERSION_u-boot ?= "1.1.4"
>
>   require conf/machine/include/tune-arm920t.inc
>
> diff --git a/conf/machine/asus730.conf b/conf/machine/asus730.conf
> index d471203..1fa9eb8 100644
> --- a/conf/machine/asus730.conf
> +++ b/conf/machine/asus730.conf
> @@ -29,7 +29,7 @@ PCMCIA_MANAGER = "pcmciautils"
>   MODUTILS = "26"	
>   XSERVER = "xserver-kdrive"
>
> -PREFERRED_VERSION_orinoco-modules = "0.15rc1"
> +PREFERRED_VERSION_orinoco-modules ?= "0.15rc1"
>
>
>   #
> diff --git a/conf/machine/at32stk1000.conf b/conf/machine/at32stk1000.conf
> index d821d66..09d03eb 100644
> --- a/conf/machine/at32stk1000.conf
> +++ b/conf/machine/at32stk1000.conf
> @@ -5,7 +5,7 @@
>   TARGET_ARCH = "avr32"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
>   #don't try to access tty1
> @@ -22,7 +22,7 @@ ROOT_FLASH_SIZE = "8"
>   EXTRA_IMAGECMD_jffs2 = " --big-endian --pagesize=4096 --eraseblock=65536"
>
>   KERNEL_IMAGETYPE = "uImage"
> -PREFERRED_VERSION_u-boot = "2009.01"
> +PREFERRED_VERSION_u-boot ?= "2009.01"
>
>   UBOOT_MACHINE = "atstk1002_config"
>   UBOOT_ENTRYPOINT = "0x90000000"
> diff --git a/conf/machine/at91-l9260.conf b/conf/machine/at91-l9260.conf
> index 3dbbc0a..c376531 100644
> --- a/conf/machine/at91-l9260.conf
> +++ b/conf/machine/at91-l9260.conf
> @@ -5,7 +5,7 @@
>   TARGET_ARCH = "arm"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.25"
> +PREFERRED_VERSION_linux ?= "2.6.25"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
>   KERNEL_IMAGETYPE = "uImage"
> diff --git a/conf/machine/at91cap9adk.conf b/conf/machine/at91cap9adk.conf
> index 87311e9..b88091e 100644
> --- a/conf/machine/at91cap9adk.conf
> +++ b/conf/machine/at91cap9adk.conf
> @@ -5,13 +5,13 @@
>   TARGET_ARCH = "arm"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE = "at91cap9adk_config"
>
> -PREFERRED_VERSION_at91bootstrap = "2.10"
> +PREFERRED_VERSION_at91bootstrap ?= "2.10"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/at91sam9260ek.conf b/conf/machine/at91sam9260ek.conf
> index 3fdfce4..c24f60d 100644
> --- a/conf/machine/at91sam9260ek.conf
> +++ b/conf/machine/at91sam9260ek.conf
> @@ -6,12 +6,12 @@ TARGET_ARCH = "arm"
>   #PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE = "at91sam9260ek_config"
>
> -PREFERRED_VERSION_at91bootstrap = "2.10"
> +PREFERRED_VERSION_at91bootstrap ?= "2.10"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/at91sam9261ek.conf b/conf/machine/at91sam9261ek.conf
> index 79f275f..0b08d55 100644
> --- a/conf/machine/at91sam9261ek.conf
> +++ b/conf/machine/at91sam9261ek.conf
> @@ -6,13 +6,13 @@ TARGET_ARCH = "arm"
>   #PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE = "at91sam9261ek_config"
>
> -PREFERRED_VERSION_at91bootstrap = "2.10"
> +PREFERRED_VERSION_at91bootstrap ?= "2.10"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/at91sam9263ek.conf b/conf/machine/at91sam9263ek.conf
> index f052170..9dbd818 100644
> --- a/conf/machine/at91sam9263ek.conf
> +++ b/conf/machine/at91sam9263ek.conf
> @@ -6,13 +6,13 @@ TARGET_ARCH = "arm"
>   #PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE = "at91sam9263ek_config"
>
> -PREFERRED_VERSION_at91bootstrap = "2.10"
> +PREFERRED_VERSION_at91bootstrap ?= "2.10"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/at91sam9g20ek.conf b/conf/machine/at91sam9g20ek.conf
> index 59c5a42..a98e53d 100644
> --- a/conf/machine/at91sam9g20ek.conf
> +++ b/conf/machine/at91sam9g20ek.conf
> @@ -5,12 +5,12 @@
>   TARGET_ARCH = "arm"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE = "at91sam9g20ek_config"
>
> -PREFERRED_VERSION_at91bootstrap = "2.10"
> +PREFERRED_VERSION_at91bootstrap ?= "2.10"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/at91sam9rlek.conf b/conf/machine/at91sam9rlek.conf
> index de26926..a7054e1 100644
> --- a/conf/machine/at91sam9rlek.conf
> +++ b/conf/machine/at91sam9rlek.conf
> @@ -6,13 +6,13 @@ TARGET_ARCH = "arm"
>   #PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
>   KERNEL_IMAGETYPE = "uImage"
>   UBOOT_MACHINE = "at91sam9rlek_config"
>
> -PREFERRED_VERSION_at91bootstrap = "2.10"
> +PREFERRED_VERSION_at91bootstrap ?= "2.10"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/atngw100.conf b/conf/machine/atngw100.conf
> index f82d446..fd85c0e 100644
> --- a/conf/machine/atngw100.conf
> +++ b/conf/machine/atngw100.conf
> @@ -21,7 +21,7 @@ ROOT_FLASH_SIZE = "8"
>   EXTRA_IMAGECMD_jffs2 = " --big-endian --pagesize=4096 --eraseblock=65536"
>
>   KERNEL_IMAGETYPE = "uImage"
> -PREFERRED_VERSION_u-boot = "2009.01"
> +PREFERRED_VERSION_u-boot ?= "2009.01"
>
>   UBOOT_MACHINE = "atngw100_config"
>   UBOOT_ENTRYPOINT = "0x90000000"
> diff --git a/conf/machine/aximx50.conf b/conf/machine/aximx50.conf
> index 6247c83..56d66cf 100644
> --- a/conf/machine/aximx50.conf
> +++ b/conf/machine/aximx50.conf
> @@ -29,7 +29,7 @@ PCMCIA_MANAGER = "pcmciautils"
>   MODUTILS = "26"	
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
> -PREFERRED_VERSION_orinoco-modules = "0.15rc1"
> +PREFERRED_VERSION_orinoco-modules ?= "0.15rc1"
>
>   MACHINE_EXTRA_RDEPENDS = "tiinit acx-firmware"
>   MACHINE_EXTRA_RRECOMMENDS = "\
> diff --git a/conf/machine/bd-neon.conf b/conf/machine/bd-neon.conf
> index 9578389..83673ea 100644
> --- a/conf/machine/bd-neon.conf
> +++ b/conf/machine/bd-neon.conf
> @@ -29,7 +29,7 @@ UBOOT_ENTRYPOINT = "a0008000"
>   MODUTILS = "26"	
>   XSERVER = "xserver-kdrive-fbdev"
>
> -PREFERRED_VERSION_u-boot = "1.1.2"
> +PREFERRED_VERSION_u-boot ?= "1.1.2"
>
>   EXTRA_IMAGEDEPENDS =" mtd-utils"
>
> diff --git a/conf/machine/boc01.conf b/conf/machine/boc01.conf
> index 7c8182a..348c2a0 100644
> --- a/conf/machine/boc01.conf
> +++ b/conf/machine/boc01.conf
> @@ -10,7 +10,7 @@ MACHINE_FEATURES = "kernel26 usbhost pci ext2 uboot"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> -PREFERRED_VERSION_u-boot = "1.3.2"
> +PREFERRED_VERSION_u-boot ?= "1.3.2"
>   UBOOT_MACHINE = "MPC8313ERDB_33_config"
>   UBOOT_ENTRYPOINT = "0"
>   UBOOT_LOADADDRESS = "0"
> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
> index 2979c7e..f0f2a8b 100644
> --- a/conf/machine/bug20.conf
> +++ b/conf/machine/bug20.conf
> @@ -43,7 +43,7 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
>   # UBI: sub-page size:              512
>   UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   # and sdio
>   MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
> diff --git a/conf/machine/canyonlands.conf b/conf/machine/canyonlands.conf
> index 0a9446f..f7d303f 100644
> --- a/conf/machine/canyonlands.conf
> +++ b/conf/machine/canyonlands.conf
> @@ -8,12 +8,12 @@
>   TARGET_ARCH = "powerpc"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.26"
> +PREFERRED_VERSION_linux ?= "2.6.26"
>   KERNEL_IMAGETYPE = "uImage"
>
>   MACHINE_FEATURES = "kernel26 usbhost"
>
> -PREFERRED_VERSION_u-boot = "1.3.2"
> +PREFERRED_VERSION_u-boot ?= "1.3.2"
>   UBOOT_MACHINE = "canyonlands_config"
>   UBOOT_ENTRYPOINT = "0"
>   UBOOT_LOADADDRESS = "0"
> diff --git a/conf/machine/cm-t35.conf b/conf/machine/cm-t35.conf
> index ccb9f95..c318637 100644
> --- a/conf/machine/cm-t35.conf
> +++ b/conf/machine/cm-t35.conf
> @@ -24,7 +24,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
>   SERIAL_CONSOLE = "115200 ttyS2"
>
>   UBOOT_MACHINE = "cm_t35_config"
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   # do ubiattach /dev/ubi_ctrl -m 4
>   # From dmesg:
> diff --git a/conf/machine/davinci-sffsdr.conf b/conf/machine/davinci-sffsdr.conf
> index 63fc2ca..d265536 100644
> --- a/conf/machine/davinci-sffsdr.conf
> +++ b/conf/machine/davinci-sffsdr.conf
> @@ -9,7 +9,7 @@ HOTPLUG = "udev"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
>   PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   UBOOT_MACHINE = "davinci_sffsdr_config"
>
>   KERNEL_IMAGETYPE = "uImage"
> diff --git a/conf/machine/devkitidp-pxa255.conf b/conf/machine/devkitidp-pxa255.conf
> index 65f6584..d28877f 100644
> --- a/conf/machine/devkitidp-pxa255.conf
> +++ b/conf/machine/devkitidp-pxa255.conf
> @@ -8,7 +8,7 @@ GUI_MACHINE_CLASS = "bigscreen"
>
>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
>   PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}"
> -PREFERRED_VERSION_u-boot = "1.1.6"
> +PREFERRED_VERSION_u-boot ?= "1.1.6"
>   UBOOT_MACHINE = "pxa255_idp_config"
>
>   require conf/machine/include/tune-xscale.inc
> diff --git a/conf/machine/dht-walnut.conf b/conf/machine/dht-walnut.conf
> index a033de1..36b70bb 100644
> --- a/conf/machine/dht-walnut.conf
> +++ b/conf/machine/dht-walnut.conf
> @@ -18,7 +18,7 @@ USE_VT = "0"
>
>   SERIAL_CONSOLE = "115200 ttyS0"
>
> -PREFERRED_VERSION_u-boot = "1.1.4"
> +PREFERRED_VERSION_u-boot ?= "1.1.4"
>   KERNEL_IMAGETYPE = "uImage"
>
>   #tune for the 405 cpu
> diff --git a/conf/machine/dm37x-evm.conf b/conf/machine/dm37x-evm.conf
> index 35fef88..8a3b50a 100644
> --- a/conf/machine/dm37x-evm.conf
> +++ b/conf/machine/dm37x-evm.conf
> @@ -25,7 +25,7 @@ SERIAL_CONSOLE = "115200 ttyS0"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
>
>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   UBOOT_ARCH = "arm"
>   UBOOT_MACHINE = "omap3_evm_config"
> diff --git a/conf/machine/ea3250.conf b/conf/machine/ea3250.conf
> index 50099a2..a07a1b4 100644
> --- a/conf/machine/ea3250.conf
> +++ b/conf/machine/ea3250.conf
> @@ -16,7 +16,7 @@ USE_DEVFS = "0"
>
>   PREFERRED_PROVIDER_virtual/bootloader = ""
>   PREFERRED_PROVIDER_virtual/kernel = "linux-ea3250"
> -PREFERRED_VERSION_linux-ea3250 = "2.6.27.8"
> +PREFERRED_VERSION_linux-ea3250 ?= "2.6.27.8"
>
>   IMAGE_DEVICE_TABLES = "files/device_table-slugos.txt"
>   IMAGE_FSTYPES = "tar.gz"
> diff --git a/conf/machine/em-x270.conf b/conf/machine/em-x270.conf
> index efcf104..37713f3 100644
> --- a/conf/machine/em-x270.conf
> +++ b/conf/machine/em-x270.conf
> @@ -43,7 +43,7 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa bluetooth wifi usbhost usbgadg
>   #
>
>   #PCMCIA_MANAGER = "pcmciautils"
> -PREFERRED_VERSION_linux = "2.6.23"
> +PREFERRED_VERSION_linux ?= "2.6.23"
>   MODUTILS = "26"	
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>
> diff --git a/conf/machine/fsg3be.conf b/conf/machine/fsg3be.conf
> index a2ca95b..575d2bd 100644
> --- a/conf/machine/fsg3be.conf
> +++ b/conf/machine/fsg3be.conf
> @@ -12,10 +12,10 @@ OVERRIDES = "local:${MACHINE}:ixp4xxbe:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_AR
>
>   # Match the vendor's latest kernel
>   PREFERRED_PROVIDER_virtual/kernel ?= "fsg3-kernel"
> -PREFERRED_VERSION_fsg3-kernel = "2.6.18"
> +PREFERRED_VERSION_fsg3-kernel ?= "2.6.18"
>   KERNEL_CCSUFFIX = "-3.4.4+csl-arm-2005q3"
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-3.4.4+csl-arm-2005q3 = "gcc-cross-kernel-3.4.4"
> -PREFERRED_VERSION_virtual/${TARGET_PREFIX}gcc-3.4.4+csl-arm-2005q3 = "csl-arm-2005q3"
> +PREFERRED_VERSION_virtual/${TARGET_PREFIX}gcc-3.4.4+csl-arm-2005q3 ?= "csl-arm-2005q3"
>
>   require conf/machine/include/ixp4xx.inc
>
> diff --git a/conf/machine/ghi270.conf b/conf/machine/ghi270.conf
> index af4ddea..3373951 100644
> --- a/conf/machine/ghi270.conf
> +++ b/conf/machine/ghi270.conf
> @@ -27,7 +27,7 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usb
>   # Software/packages selection
>   #
>   PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
> -PREFERRED_VERSION_linux-handhelds-2.6               = "2.6.21-hh11"
> +PREFERRED_VERSION_linux-handhelds-2.6               ?= "2.6.21-hh11"
>
>   PCMCIA_MANAGER = "pcmciautils"
>   MODUTILS = "26"
> diff --git a/conf/machine/hipox.conf b/conf/machine/hipox.conf
> index 7a2ac6f..1646611 100644
> --- a/conf/machine/hipox.conf
> +++ b/conf/machine/hipox.conf
> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> -PREFERRED_VERSION_u-boot = "2009.03"
> +PREFERRED_VERSION_u-boot ?= "2009.03"
>   UBOOT_LOADADDRESS = "0x48008000"
>   UBOOT_ENTRYPOINT = "0x48008000"
>   UBOOT_ARCH = "arm"
> diff --git a/conf/machine/hx2000.conf b/conf/machine/hx2000.conf
> index c9957e2..25a953c 100644
> --- a/conf/machine/hx2000.conf
> +++ b/conf/machine/hx2000.conf
> @@ -7,7 +7,7 @@ PACKAGE_EXTRA_ARCHS += "iwmmxt"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-rp"
>
> -PREFERRED_VERSION_orinoco-modules = "0.15rc1"
> +PREFERRED_VERSION_orinoco-modules ?= "0.15rc1"
>
>   ROOT_FLASH_SIZE = "80"
>
> diff --git a/conf/machine/hx4700.conf b/conf/machine/hx4700.conf
> index 474454a..3cdb21c 100644
> --- a/conf/machine/hx4700.conf
> +++ b/conf/machine/hx4700.conf
> @@ -35,7 +35,7 @@ MODUTILS = "26"
>
>   XSERVER = "xserver-kdrive-w100"
>
> -PREFERRED_VERSION_orinoco-modules = "0.15rc1"
> +PREFERRED_VERSION_orinoco-modules ?= "0.15rc1"
>
>   MACHINE_EXTRA_RDEPENDS = "tiinit acx-firmware"
>   MACHINE_EXTRA_RRECOMMENDS = "\
> diff --git a/conf/machine/include/AT91.inc b/conf/machine/include/AT91.inc
> index 6c0f8f0..bd491de 100644
> --- a/conf/machine/include/AT91.inc
> +++ b/conf/machine/include/AT91.inc
> @@ -5,7 +5,7 @@ TARGET_ARCH = "arm"
>   CPU_FAMILY = "at91"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.32"
> +PREFERRED_VERSION_linux ?= "2.6.32"
>
>   #PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
>   #PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive-1300"
> @@ -18,10 +18,10 @@ PREFERRED_VERSION_linux = "2.6.32"
>   #PREFERRED_VERSION_xserver-kdrive = "1.6.1"
>
>   PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
> -PREFERRED_VERSION_at91bootstrap = "2.13"
> +PREFERRED_VERSION_at91bootstrap ?= "2.13"
>
>   PREFERRED_PROVIDER_u-boot = "u-boot_2009.08"
> -PREFERRED_VERSION_u-boot = "2009.08"
> +PREFERRED_VERSION_u-boot ?= "2009.08"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> diff --git a/conf/machine/include/collie-2.4.inc b/conf/machine/include/collie-2.4.inc
> index eed8de9..bb79782 100644
> --- a/conf/machine/include/collie-2.4.inc
> +++ b/conf/machine/include/collie-2.4.inc
> @@ -18,4 +18,4 @@ MACHINE_EXTRA_RRECOMMENDS = "kernel-module-net-fd kernel-module-sa1100-bi \
>   # kernel-module-collie-ssp kernel-module-collie-tc35143af if buzzer.patch applied
>
>   # Later versions are broken on kernel 2.4
> -PREFERRED_VERSION_orinoco-modules = "0.13e"
> +PREFERRED_VERSION_orinoco-modules ?= "0.13e"
> diff --git a/conf/machine/include/orion.inc b/conf/machine/include/orion.inc
> index 9e16805..5fc5511 100644
> --- a/conf/machine/include/orion.inc
> +++ b/conf/machine/include/orion.inc
> @@ -10,7 +10,7 @@ USE_DEVFS = "0"
>
>   PREFERRED_PROVIDER_virtual/bootloader = ""
>   PREFERRED_PROVIDER_virtual/kernel = "linux-orion"
> -PREFERRED_VERSION_linux-orion = "2.6.28.4"
> +PREFERRED_VERSION_linux-orion ?= "2.6.28.4"
>
>   IMAGE_DEVICE_TABLES = "files/device_table-slugos.txt"
>   IMAGE_FSTYPES = "tar.gz"
> diff --git a/conf/machine/include/simpad-2.4.inc b/conf/machine/include/simpad-2.4.inc
> index 06f12f5..8f2bebe 100644
> --- a/conf/machine/include/simpad-2.4.inc
> +++ b/conf/machine/include/simpad-2.4.inc
> @@ -10,5 +10,5 @@ USE_DEVFS = "1"
>   PREFERRED_PROVIDER_hostap-modules = "hostap-modules"
>
>   # Later versions are broken on kernel 2.4
> -PREFERRED_VERSION_orinoco-modules = "0.13e"
> +PREFERRED_VERSION_orinoco-modules ?= "0.13e"
>
> diff --git a/conf/machine/jornada6xx.conf b/conf/machine/jornada6xx.conf
> index f709f51..9a89cce 100644
> --- a/conf/machine/jornada6xx.conf
> +++ b/conf/machine/jornada6xx.conf
> @@ -10,7 +10,7 @@ MACHINE_FEATURES = "kernel26 alsa pcmcia irda keyboard touchscreen screen vfat"
>   MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada6xx"
> -PREFERRED_VERSION_linux-jlime-jornada6xx = "2.6.32"
> +PREFERRED_VERSION_linux-jlime-jornada6xx ?= "2.6.32"
>
>   PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>   XSERVER = "xserver-xorg \
> diff --git a/conf/machine/kilauea.conf b/conf/machine/kilauea.conf
> index 883448c..648c606 100644
> --- a/conf/machine/kilauea.conf
> +++ b/conf/machine/kilauea.conf
> @@ -10,7 +10,7 @@ MACHINE_FEATURES = "kernel26"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> -PREFERRED_VERSION_u-boot = "1.3.2"
> +PREFERRED_VERSION_u-boot ?= "1.3.2"
>   UBOOT_MACHINE = "kilauea_config"
>   UBOOT_ENTRYPOINT = "0"
>   UBOOT_LOADADDRESS = "0"
> diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
> index 8259127..e6f0f06 100644
> --- a/conf/machine/kixrp435.conf
> +++ b/conf/machine/kixrp435.conf
> @@ -10,7 +10,7 @@ PACKAGE_EXTRA_ARCHS = "armv5e ixp4xxle"
>   OVERRIDES = "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.30"
> +PREFERRED_VERSION_linux ?= "2.6.30"
>   ROOT_FLASH_SIZE ?= "32"
>
>   MACHINE_FEATURES ?= "kernel26 usbhost pci ext2 vfat redboot pcmcia"
> diff --git a/conf/machine/logicpd-pxa270.conf b/conf/machine/logicpd-pxa270.conf
> index 01bd1e2..c78a867 100644
> --- a/conf/machine/logicpd-pxa270.conf
> +++ b/conf/machine/logicpd-pxa270.conf
> @@ -3,7 +3,7 @@
>   #@DESCRIPTION: Machine configuration for LogicPD PXA270 Zoom Development Platform
>   #OLDEST_KERNEL = "2.6.17-rc5"
>   TARGET_ARCH = "arm"
> -PREFERRED_VERSION_logicpd-pxa270 = "2.6.19.2"
> +PREFERRED_VERSION_logicpd-pxa270 ?= "2.6.19.2"
>   GUI_MACHINE_CLASS = "smallscreen"
>
>   PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}"
> diff --git a/conf/machine/lsmipsel.conf b/conf/machine/lsmipsel.conf
> index 2ceb0ca..64a78ca 100644
> --- a/conf/machine/lsmipsel.conf
> +++ b/conf/machine/lsmipsel.conf
> @@ -13,7 +13,7 @@ USE_DEVFS = "0"
>
>   PREFERRED_PROVIDER_virtual/kernel 		= "linux-lsmipsel"
>   PREFERRED_PROVIDER_virtual/bootloader 		= ""
> -PREFERRED_VERSION_linux-lsmipsel	 	= "2.6.23.17"
> +PREFERRED_VERSION_linux-lsmipsel	 	?= "2.6.23.17"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/magicbox.conf b/conf/machine/magicbox.conf
> index bd29837..1866df3 100644
> --- a/conf/machine/magicbox.conf
> +++ b/conf/machine/magicbox.conf
> @@ -17,7 +17,7 @@ OLDEST_KERNEL = "2.6.18"
>
>   SERIAL_CONSOLE = "115200 ttyS0"
>
> -PREFERRED_VERSION_u-boot = "1.1.2"
> +PREFERRED_VERSION_u-boot ?= "1.1.2"
>   EXTRA_IMAGECMD_jffs2 = "-pad --big-endian --squash -e 0x10000"
>   EXTRA_IMAGECMD_squashfs = " -be -all-root -nopad -noappend -root-owned"
>   EXTRA_IMAGECMD_squashfs-lzma = " -be -all-root -nopad -noappend -root-owned"
> diff --git a/conf/machine/magician.conf b/conf/machine/magician.conf
> index 66b1f96..9457a08 100644
> --- a/conf/machine/magician.conf
> +++ b/conf/machine/magician.conf
> @@ -31,7 +31,7 @@ MODUTILS = "26"
>   XSERVER = "xserver-kdrive-fbdev"
>   PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
>
> -PREFERRED_VERSION_orinoco-modules = "0.15rc1"
> +PREFERRED_VERSION_orinoco-modules ?= "0.15rc1"
>
>   MACHINE_EXTRA_RRECOMMENDS = " \
>   	kernel-module-i2c-pxa \
> diff --git a/conf/machine/micro2440.conf b/conf/machine/micro2440.conf
> index 37311ad..2309e4c 100644
> --- a/conf/machine/micro2440.conf
> +++ b/conf/machine/micro2440.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH = "arm"
>   IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
>                          files/device_table_add-s3c_serial.txt"
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   UBOOT_MACHINE = "mini2440_config"
>   UBOOT_ENTRYPOINT = "30008000"
>
> diff --git a/conf/machine/mini2440.conf b/conf/machine/mini2440.conf
> index f4fc17c..07cc1c0 100644
> --- a/conf/machine/mini2440.conf
> +++ b/conf/machine/mini2440.conf
> @@ -5,7 +5,7 @@
>
>   TARGET_ARCH = "arm"
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   UBOOT_ENTRYPOINT = "30008000"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-mini2440"
>
> diff --git a/conf/machine/mpc8313e-rdb.conf b/conf/machine/mpc8313e-rdb.conf
> index ed2579c..5143c38 100644
> --- a/conf/machine/mpc8313e-rdb.conf
> +++ b/conf/machine/mpc8313e-rdb.conf
> @@ -10,7 +10,7 @@ MACHINE_FEATURES = "kernel26 usbhost pci ext2 uboot"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> -PREFERRED_VERSION_u-boot = "1.3.2"
> +PREFERRED_VERSION_u-boot ?= "1.3.2"
>   UBOOT_MACHINE = "MPC8313ERDB_33_config"
>   UBOOT_ENTRYPOINT = "0"
>   UBOOT_LOADADDRESS = "0"
> diff --git a/conf/machine/mpc8323e-rdb.conf b/conf/machine/mpc8323e-rdb.conf
> index e01aeaa..d6da2fa 100644
> --- a/conf/machine/mpc8323e-rdb.conf
> +++ b/conf/machine/mpc8323e-rdb.conf
> @@ -10,7 +10,7 @@ MACHINE_FEATURES = "kernel26 usbhost pci ext2 uboot"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> -PREFERRED_VERSION_u-boot = "1.1.6"
> +PREFERRED_VERSION_u-boot ?= "1.1.6"
>   UBOOT_MACHINE = "MPC8323ERDB_config"
>
>   EXTRA_IMAGECMD_jffs2 = "--pad --big-endian --eraseblock=0x20000"
> diff --git a/conf/machine/mtx-1.conf b/conf/machine/mtx-1.conf
> index 7db1969..344cecf 100644
> --- a/conf/machine/mtx-1.conf
> +++ b/conf/machine/mtx-1.conf
> @@ -22,7 +22,7 @@ SERIAL_CONSOLE = "115200 tts/0 vt100"
>
>   BOOTSTRAP_EXTRA_RDEPENDS += "kernel-module-usb-storage kernel-module-scsi-mod kernel-module-sd-mod kernel-module-fat kernel-module-vfat kernel-module-usbnet kernel-module-mii"
>
> -PREFERRED_VERSION_yamon = "2.17"
> +PREFERRED_VERSION_yamon ?= "2.17"
>
>   # create srec files
>   IMAGE_POSTPROCESS_COMMAND += "\
> diff --git a/conf/machine/mtx-2.conf b/conf/machine/mtx-2.conf
> index 67cc5bf..f44bf8b 100644
> --- a/conf/machine/mtx-2.conf
> +++ b/conf/machine/mtx-2.conf
> @@ -20,7 +20,7 @@ SERIAL_CONSOLE = "115200 tts/0 vt100"
>
>   BOOTSTRAP_EXTRA_RDEPENDS += "kernel-module-usb-storage kernel-module-scsi-mod kernel-module-sd-mod kernel-module-fat kernel-module-vfat kernel-module-usbnet kernel-module-mii"
>
> -PREFERRED_VERSION_yamon = "2.24"
> +PREFERRED_VERSION_yamon ?= "2.24"
>
>   # create srec files
>   IMAGE_POSTPROCESS_COMMAND += "\
> diff --git a/conf/machine/mtx-3.conf b/conf/machine/mtx-3.conf
> index f6e9e8a..86ad419 100644
> --- a/conf/machine/mtx-3.conf
> +++ b/conf/machine/mtx-3.conf
> @@ -12,14 +12,14 @@ require conf/machine/include/tune-arm926ejs.inc
>
>   # begin overrides mtx-3
>   #PREFERRED_VERSION_glibc_mtx-3 = "2.3.5+cvs20050627"
> -PREFERRED_VERSION_gcc-cross-initial_mtx-3 = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-intermediate_mtx-3 = "3.4.4"
> -PREFERRED_VERSION_gcc-cross_mtx-3 = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-sdk_mtx-3 = "3.4.4"
> -PREFERRED_VERSION_gcc_mtx-3 = "3.4.4"
> -PREFERRED_VERSION_binutils-cross_mtx-3 = "2.15.94.0.1"
> -PREFERRED_VERSION_binutils-cross-sdk_mtx-3 = "2.15.94.0.1"
> -PREFERRED_VERSION_binutils_mtx-3 = "2.16"
> +PREFERRED_VERSION_gcc-cross-initial_mtx-3 ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-intermediate_mtx-3 ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross_mtx-3 ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-sdk_mtx-3 ?= "3.4.4"
> +PREFERRED_VERSION_gcc_mtx-3 ?= "3.4.4"
> +PREFERRED_VERSION_binutils-cross_mtx-3 ?= "2.15.94.0.1"
> +PREFERRED_VERSION_binutils-cross-sdk_mtx-3 ?= "2.15.94.0.1"
> +PREFERRED_VERSION_binutils_mtx-3 ?= "2.16"
>
>   KERNEL_VERSION_mtx-3 = "2.6.15.4"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-mtx-3"
> diff --git a/conf/machine/mtx-3a.conf b/conf/machine/mtx-3a.conf
> index d3adce3..5dbd7b2 100644
> --- a/conf/machine/mtx-3a.conf
> +++ b/conf/machine/mtx-3a.conf
> @@ -5,14 +5,14 @@
>   include conf/machine/mtx-3.conf
>
>   #PREFERRED_VERSION_glibc_mtx-3a = "2.3.5+cvs20050627"
> -PREFERRED_VERSION_gcc-cross-initial_mtx-3a = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-intermediate_mtx-3a = "3.4.4"
> -PREFERRED_VERSION_gcc-cross_mtx-3a = "3.4.4"
> -PREFERRED_VERSION_gcc-cross-sdk_mtx-3a = "3.4.4"
> -PREFERRED_VERSION_gcc_mtx-3a = "3.4.4"
> -PREFERRED_VERSION_binutils-cross_mtx-3a = "2.15.94.0.1"
> -PREFERRED_VERSION_binutils-cross-sdk_mtx-3a = "2.15.94.0.1"
> -PREFERRED_VERSION_binutils_mtx-3a = "2.16"
> +PREFERRED_VERSION_gcc-cross-initial_mtx-3a ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-intermediate_mtx-3a ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross_mtx-3a ?= "3.4.4"
> +PREFERRED_VERSION_gcc-cross-sdk_mtx-3a ?= "3.4.4"
> +PREFERRED_VERSION_gcc_mtx-3a ?= "3.4.4"
> +PREFERRED_VERSION_binutils-cross_mtx-3a ?= "2.15.94.0.1"
> +PREFERRED_VERSION_binutils-cross-sdk_mtx-3a ?= "2.15.94.0.1"
> +PREFERRED_VERSION_binutils_mtx-3a ?= "2.16"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-mtx-3a"
>   KERNEL_VERSION_mtx-3a = "2.6.16.6"
> diff --git a/conf/machine/n1200.conf b/conf/machine/n1200.conf
> index 3563c54..038a6af 100644
> --- a/conf/machine/n1200.conf
> +++ b/conf/machine/n1200.conf
> @@ -12,7 +12,7 @@ MACHINE_EXTRA_RRECOMMENDS       = "temper u-boot-utils"
>   USE_DEVFS = "0"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-n1200"
> -PREFERRED_VERSION_linux-n1200 = "2.6.27-rc9+git"
> +PREFERRED_VERSION_linux-n1200 ?= "2.6.27-rc9+git"
>
>   #don't try to access tty1
>   USE_VT = "0"
> diff --git a/conf/machine/n2100.conf b/conf/machine/n2100.conf
> index a86a8db..4ba30d7 100644
> --- a/conf/machine/n2100.conf
> +++ b/conf/machine/n2100.conf
> @@ -13,7 +13,7 @@ MODUTILS=26
>   MACHINE_FEATURES = "kernel26 usbhost ext2 redboot"
>   MACHINE_EXTRA_RDEPENDS = "temper"
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.20"
> +PREFERRED_VERSION_linux ?= "2.6.20"
>
>   # We want udev support in the image
>   udevdir = "/dev"
> diff --git a/conf/machine/netvista.conf b/conf/machine/netvista.conf
> index 2653b05..25b1b08 100644
> --- a/conf/machine/netvista.conf
> +++ b/conf/machine/netvista.conf
> @@ -4,7 +4,7 @@
>
>   TARGET_ARCH = "i486"
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.23"
> +PREFERRED_VERSION_linux ?= "2.6.23"
>
>   XSERVER = "xserver-kdrive-fbdev"
>
> diff --git a/conf/machine/neuros-osd.conf b/conf/machine/neuros-osd.conf
> index 5f96528..a192853 100644
> --- a/conf/machine/neuros-osd.conf
> +++ b/conf/machine/neuros-osd.conf
> @@ -12,7 +12,7 @@ KERNEL_IMAGETYPE = "uImage"
>   UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   #UBOOT_MACHINE = "davinci_dvevm_config"
>
>   SERIAL_CONSOLE ?= "115200 ttyS0"
> diff --git a/conf/machine/neuros-osd2.conf b/conf/machine/neuros-osd2.conf
> index 9b552a4..48af860 100644
> --- a/conf/machine/neuros-osd2.conf
> +++ b/conf/machine/neuros-osd2.conf
> @@ -12,7 +12,7 @@ KERNEL_IMAGETYPE = "uImage"
>   UBOOT_ENTRYPOINT = "0x80008000"
>   UBOOT_LOADADDRESS = "0x80008000"
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   UBOOT_MACHINE = "davinci_ntosd_644xA_config"
>
>   SERIAL_CONSOLE ?= "115200 ttyS0"
> diff --git a/conf/machine/omap2420h4.conf b/conf/machine/omap2420h4.conf
> index 9483259..8e57e16 100644
> --- a/conf/machine/omap2420h4.conf
> +++ b/conf/machine/omap2420h4.conf
> @@ -5,7 +5,7 @@
>   TARGET_ARCH = "arm"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-omap2"
> -PREFERRED_VERSION_u-boot = "1.1.4"
> +PREFERRED_VERSION_u-boot ?= "1.1.4"
>
>   SERIAL_CONSOLE ?= "115200 ttyS0"
>   IMAGE_FSTYPES ?= "jffs2"
> diff --git a/conf/machine/omap2430sdp.conf b/conf/machine/omap2430sdp.conf
> index 7b1f8ab..f0a044c 100644
> --- a/conf/machine/omap2430sdp.conf
> +++ b/conf/machine/omap2430sdp.conf
> @@ -5,7 +5,7 @@
>   TARGET_ARCH = "arm"
>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-omap2"
> -PREFERRED_VERSION_u-boot = "1.1.4"
> +PREFERRED_VERSION_u-boot ?= "1.1.4"
>
>   SERIAL_CONSOLE ?= "115200 ttyS0"
>   IMAGE_FSTYPES ?= "jffs2"
> diff --git a/conf/machine/omap3-pandora.conf b/conf/machine/omap3-pandora.conf
> index b504723..9153398 100644
> --- a/conf/machine/omap3-pandora.conf
> +++ b/conf/machine/omap3-pandora.conf
> @@ -65,8 +65,8 @@ UBOOT_MACHINE = "omap3_pandora_config"
>
>   PREFERRED_PROVIDER_u-boot = "u-boot-omap3pandora"
>   PREFERRED_PROVIDER_x-load = "x-load-omap3pandora"
> -PREFERRED_VERSION_u-boot-omap3pandora = "git"
> -PREFERRED_VERSION_x-load-omap3pandora = "git"
> +PREFERRED_VERSION_u-boot-omap3pandora ?= "git"
> +PREFERRED_VERSION_x-load-omap3pandora ?= "git"
>   EXTRA_IMAGEDEPENDS += "u-boot x-load"
>
>   MACHINE_FEATURES = "kernel26 apm usbgadget usbhost keyboard vfat ext2 screen touchscreen alsa bluetooth wifi sdio"
> diff --git a/conf/machine/omap3-touchbook.conf b/conf/machine/omap3-touchbook.conf
> index 52d1908..3a49b3a 100644
> --- a/conf/machine/omap3-touchbook.conf
> +++ b/conf/machine/omap3-touchbook.conf
> @@ -44,7 +44,7 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
>   UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
>
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   # and sdio
>   MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa touchscreen"
> diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
> index 7bbc821..d5594b0 100644
> --- a/conf/machine/omap3evm.conf
> +++ b/conf/machine/omap3evm.conf
> @@ -26,7 +26,7 @@ USE_VT = "0"
>   PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
>
>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   UBOOT_ARCH = "arm"
>   UBOOT_MACHINE = "omap3_evm_config"
> diff --git a/conf/machine/omap4430-sdp.conf b/conf/machine/omap4430-sdp.conf
> index efa9c81..5a426ae 100644
> --- a/conf/machine/omap4430-sdp.conf
> +++ b/conf/machine/omap4430-sdp.conf
> @@ -43,7 +43,7 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
>   UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
>
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   # and sdio
>   MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
> diff --git a/conf/machine/omapzoom.conf b/conf/machine/omapzoom.conf
> index ab0612f..1ce2f96 100644
> --- a/conf/machine/omapzoom.conf
> +++ b/conf/machine/omapzoom.conf
> @@ -46,7 +46,7 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
>   UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
>
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   #EXTRA_IMAGEDEPENDS += "u-boot x-load"
>
>   # and sdio
> diff --git a/conf/machine/omapzoom2.conf b/conf/machine/omapzoom2.conf
> index 698b241..4fab732 100644
> --- a/conf/machine/omapzoom2.conf
> +++ b/conf/machine/omapzoom2.conf
> @@ -48,7 +48,7 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
>   UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
>
>
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>   #EXTRA_IMAGEDEPENDS += "u-boot x-load"
>
>   MACHINE_EXTRA_RRECOMMENDS = ""
> diff --git a/conf/machine/omapzoom36x.conf b/conf/machine/omapzoom36x.conf
> index 88b39f4..e2a51a1 100644
> --- a/conf/machine/omapzoom36x.conf
> +++ b/conf/machine/omapzoom36x.conf
> @@ -30,8 +30,8 @@ UBOOT_LOADADDRESS = "0x80008000"
>   UBOOT_MACHINE = "omap3630zoom3_config"
>   XLOAD_MACHINE = "omap3630zoom3_config"
>
> -PREFERRED_VERSION_u-boot = "git"
> -PREFERRED_VERSION_x-load = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
> +PREFERRED_VERSION_x-load ?= "git"
>   EXTRA_IMAGEDEPENDS += "u-boot x-load"
>
>   MACHINE_EXTRA_RRECOMMENDS = ""
> diff --git a/conf/machine/palmpre.conf b/conf/machine/palmpre.conf
> index dccc892..664e194 100644
> --- a/conf/machine/palmpre.conf
> +++ b/conf/machine/palmpre.conf
> @@ -25,6 +25,6 @@ IMAGE_FSTYPES += "tar.bz2"
>
>   # Let's keep the following three from the beagleboard machine config
>   UBOOT_MACHINE = "omap3_beagle_config"
> -PREFERRED_VERSION_u-boot = "git"
> +PREFERRED_VERSION_u-boot ?= "git"
>
>   MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa phone bluetooth touchscreen keyboard wifi"
> diff --git a/conf/machine/sarge-at91.conf b/conf/machine/sarge-at91.conf
> index fb8882f..f8ee42c 100644
> --- a/conf/machine/sarge-at91.conf
> +++ b/conf/machine/sarge-at91.conf
> @@ -18,7 +18,7 @@ require conf/machine/include/tune-arm920t.inc
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
>
>   # device has own patchset for u-boot 1.1.6
> -PREFERRED_VERSION_u-boot = "1.1.6"
> -PREFERRED_VERSION_linux  = "2.6.21"
> +PREFERRED_VERSION_u-boot ?= "1.1.6"
> +PREFERRED_VERSION_linux  ?= "2.6.21"
>
>   KERNEL_IMAGETYPE = "uImage"
> diff --git a/conf/machine/sequoia.conf b/conf/machine/sequoia.conf
> index 309c813..941349d 100644
> --- a/conf/machine/sequoia.conf
> +++ b/conf/machine/sequoia.conf
> @@ -12,7 +12,7 @@ KERNEL_IMAGETYPE = "uImage"
>
>   MACHINE_FEATURES = "kernel26 usbhost"
>
> -PREFERRED_VERSION_u-boot = "1.3.2"
> +PREFERRED_VERSION_u-boot ?= "1.3.2"
>   UBOOT_MACHINE = "sequoia_config"
>   UBOOT_ENTRYPOINT = "0"
>   UBOOT_LOADADDRESS = "0"
> diff --git a/conf/machine/stamp9g20evb.conf b/conf/machine/stamp9g20evb.conf
> index 7310d8a..9c769c3 100644
> --- a/conf/machine/stamp9g20evb.conf
> +++ b/conf/machine/stamp9g20evb.conf
> @@ -6,7 +6,7 @@
>   TARGET_ARCH = "arm"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.29"
> +PREFERRED_VERSION_linux ?= "2.6.29"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> diff --git a/conf/machine/storcenter.conf b/conf/machine/storcenter.conf
> index f7fabdc..e61f381 100644
> --- a/conf/machine/storcenter.conf
> +++ b/conf/machine/storcenter.conf
> @@ -13,8 +13,8 @@ USE_DEVFS = "0"
>   BOOTSTRAP_EXTRA_RDEPENDS 		= "udev module-init-tools"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-storcenter"
> -PREFERRED_VERSION_linux-storcenter = "2.6.27.7"
> -PREFERRED_VERSION_u-boot = "1.2.0"
> +PREFERRED_VERSION_linux-storcenter ?= "2.6.27.7"
> +PREFERRED_VERSION_u-boot ?= "1.2.0"
>
>   #don't try to access tty1
>   USE_VT="0"
> diff --git a/conf/machine/tx25.conf b/conf/machine/tx25.conf
> index 8ec67b0..b5fc9fe 100644
> --- a/conf/machine/tx25.conf
> +++ b/conf/machine/tx25.conf
> @@ -9,7 +9,7 @@ MACHINE_FEATURES = "kernel26 apm alsa ext2 pcmcia usbhost usbgadget screen camer
>   GUI_MACHINE_CLASS = "bigscreen"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.29+2.6.30-rc4"
> +PREFERRED_VERSION_linux ?= "2.6.29+2.6.30-rc4"
>   PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
>   XSERVER = "xserver-kdrive-fbdev"
>
> diff --git a/conf/machine/tx27.conf b/conf/machine/tx27.conf
> index a3e784c..e8b3279 100644
> --- a/conf/machine/tx27.conf
> +++ b/conf/machine/tx27.conf
> @@ -9,7 +9,7 @@ MACHINE_FEATURES = "kernel26 apm alsa ext2 pcmcia usbhost usbgadget screen camer
>   GUI_MACHINE_CLASS = "bigscreen"
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux"
> -PREFERRED_VERSION_linux = "2.6.28"
> +PREFERRED_VERSION_linux ?= "2.6.28"
>   PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
>   XSERVER = "xserver-kdrive-fbdev"
>
> diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
> index 8c888b2..b600945 100644
> --- a/conf/machine/xilinx-ml507.conf
> +++ b/conf/machine/xilinx-ml507.conf
> @@ -22,7 +22,7 @@ UBOOT_ARCH = "ppc"
>   UBOOT_MACHINE = "ml507_config"
>   UBOOT_ENTRYPOINT ?= "0x00000000"
>   UBOOT_LOADADDRESS ?= "0x00000000"
> -PREFERRED_VERSION_u-boot_xilinx-ml507 = "git"
> +PREFERRED_VERSION_u-boot_xilinx-ml507 ?= "git"
>
>   # Xilinx EDK override hardware  definitions for xilinx-bsp
>   # Include in your local.conf
> diff --git a/conf/machine/xilinx-virtex4.conf b/conf/machine/xilinx-virtex4.conf
> index eeea44e..222599f 100644
> --- a/conf/machine/xilinx-virtex4.conf
> +++ b/conf/machine/xilinx-virtex4.conf
> @@ -13,7 +13,7 @@ TARGET_FPU  = "soft"
>   require conf/machine/include/tune-ppc405.inc
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
> -PREFERRED_VERSION_u-boot_xilinx-virtex4 = "u-boot-xilinx"
> +PREFERRED_VERSION_u-boot_xilinx-virtex4 ?= "u-boot-xilinx"
>
>   KERNEL_IMAGETYPE = "uImage"
>
> diff --git a/conf/machine/xilinx-virtex5.conf b/conf/machine/xilinx-virtex5.conf
> index 2e11b96..f982f0f 100644
> --- a/conf/machine/xilinx-virtex5.conf
> +++ b/conf/machine/xilinx-virtex5.conf
> @@ -12,7 +12,7 @@ TARGET_FPU  = "soft"
>   require conf/machine/include/tune-ppc440.inc
>
>   PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
> -PREFERRED_VERSION_u-boot_xilinx-virtex5 = "u-boot-xilinx"
> +PREFERRED_VERSION_u-boot_xilinx-virtex5 ?= "u-boot-xilinx"
>
>   KERNEL_IMAGETYPE = "uImage"
>


