Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OYXvV-0006Ws-TA
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 07:21:08 +0200
Received: by iwn34 with SMTP id 34so5563690iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 22:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WDRdJAVxg1fCZWQX6oZbAqB2N4IPoyoE8TatwazEkCE=;
	b=gg/+Jpb1Vk8w+EmSEGOgm/yHfRsKmHVIBc3Da+Mx1yfs1EudjnOZzSLyyMt2rXs6mV
	XKaLtSJhrN1M6O/9fwiNmz4zxogEFJqnls1vWeiswhk3zofrAik9GzyFgram+vogUXsj
	ibB3ZwXKPZGZYKlPitZOWnjaomnQC3aN9zCAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jQ8G+ApzWKQCws992rxH4kXBiTDB/WiWXM6CAvjWbTS4MXHaSBBKDKgCmsgN8A3vFC
	wh+sRdRCQaTQKmGp0BIS/YEYCEfsBmxrwCGYskU0UyM6b3vSyeaEG8sxXZPVDtrTDX8Q
	aBblHnY/nZZQqT9W9/X6R28uIfWzB0+P9I9fQ=
MIME-Version: 1.0
Received: by 10.231.14.194 with SMTP id h2mr14906415iba.27.1278998169630; Mon, 
	12 Jul 2010 22:16:09 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Mon, 12 Jul 2010 22:16:09 -0700 (PDT)
In-Reply-To: <4C2ACDE8.7080801@gmail.com>
References: <4C2AC77A.70102@gmail.com>
	<4C2ACDE8.7080801@gmail.com>
Date: Tue, 13 Jul 2010 14:46:09 +0930
Message-ID: <AANLkTimjZRbz8vPEG4xJzzjuebgHitB3NdbqyCywWNdg@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Tue, 13 Jul 2010 05:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Bump.

On 30 June 2010 14:24, Graham Gower <graham.gower@gmail.com> wrote:
> None of the distros in OE appear to want/need gpg or curl support in opkg=
;
> so have opkg.inc remove them by default. This diff makes things more cons=
istent
> across all distros/tasks/images.
>
> The slugos recipe is kept intact and further divided from the more modern
> recipes. The opkg-native recipe is the sane-srcrev version even when buil=
ding
> slugos, which should allow for changes to opkg related bbclasses without
> breaking the slugos build.
>
> Build tested for qemumipsel/minimal-image and nslu2/slugos-image.
> minimal-image builds 10% quicker in my setup and is 1mb smaller.
> ---
>
> v2:
> =A0A stray missing double quote makes the last patch a no go.
>
> ---
> =A0conf/compatibility-providers.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A01 -
> =A0conf/distro/angstrom-2008.1.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A08 +-
> =A0conf/distro/include/preferred-slugos-versions.inc | =A0 10 ---
> =A0conf/distro/jlime-2010.1.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A02 +-
> =A0conf/distro/kaeilos-2010.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 10 ++--
> =A0conf/distro/kaeilos.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 10 ++--
> =A0conf/distro/micro.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A02 +-
> =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A08 +-
> =A0conf/distro/nylon.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A02 +-
> =A0recipes/angstrom/angstrom-feed-configs.bb =A0 =A0 =A0 =A0 | =A0 =A02 +=
-
> =A0recipes/images/minimal-gpe-image.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/images/nas-server-image.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/images/x11-sato-image.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/meta/meta-toolchain-arago.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/opkg/files/fix_endianness.patch =A0 =A0 =A0 =A0 =A0 | =A0 12 -=
---
> =A0recipes/opkg/files/isatty.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 64 +++++++++++++++++++++
> =A0recipes/opkg/files/opkg-intercept-cleanup.patch =A0 | =A0 47 +++++++++=
++++++
> =A0recipes/opkg/files/opkg-libdir.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
11 ----
> =A0recipes/opkg/opkg-native_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 11 +---
> =A0recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb =A0 =A0 =A0| =A0 29 +++++=
++---
> =A0recipes/opkg/opkg-nogpg-nocurl_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 15=
 -----
> =A0recipes/opkg/opkg-nogpg_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 25 --------
> =A0recipes/opkg/opkg-sdk_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/opkg/opkg.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 16 ++---
> =A0recipes/opkg/opkg/isatty.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 64 ---------------------
> =A0recipes/opkg/opkg/opkg-intercept-cleanup.patch =A0 =A0| =A0 47 -------=
--------
> =A0recipes/opkg/opkg_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A06 --
> =A0recipes/tasks/task-arago-toolchain-target.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/tasks/task-sdk-sbox.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
> =A029 files changed, 168 insertions(+), 248 deletions(-)
> =A0delete mode 100644 recipes/opkg/files/fix_endianness.patch
> =A0create mode 100644 recipes/opkg/files/isatty.patch
> =A0create mode 100644 recipes/opkg/files/opkg-intercept-cleanup.patch
> =A0delete mode 100644 recipes/opkg/files/opkg-libdir.patch
> =A0delete mode 100644 recipes/opkg/opkg-nogpg-nocurl_svn.bb
> =A0delete mode 100644 recipes/opkg/opkg-nogpg_svn.bb
> =A0delete mode 100644 recipes/opkg/opkg/isatty.patch
> =A0delete mode 100644 recipes/opkg/opkg/opkg-intercept-cleanup.patch
>
> diff --git a/conf/compatibility-providers.conf b/conf/compatibility-provi=
ders.conf
> index 350521a..58a0ad1 100644
> --- a/conf/compatibility-providers.conf
> +++ b/conf/compatibility-providers.conf
> @@ -46,7 +46,6 @@ PREFERRED_PROVIDER_libxss ?=3D "libxss"
> =A0PREFERRED_PROVIDER_ntp ?=3D "ntp"
> =A0PREFERRED_PROVIDER_openmoko-alsa-scenarios ?=3D "fsodeviced"
> =A0PREFERRED_PROVIDER_opkg ?=3D "opkg"
> -#PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg"
> =A0PREFERRED_PROVIDER_qemu-native ?=3D "qemu-native"
> =A0PREFERRED_PROVIDER_qt4-embedded ?=3D "qt4-embedded"
> =A0PREFERRED_PROVIDER_qt4-x11-free ?=3D "qt4-x11-free"
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008=
.1.conf
> index 7c70c84..e86ced3 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -139,7 +139,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYP=
E}.inc
>
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> -PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg-nogpg=
-nocurl"
> +PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg"
>
> =A0ANGSTROM_BLACKLIST_pn-bluez-libs =A0 =A0 =A0 =3D "bluez-libs 3.x has b=
een replaced by bluez4"
> =A0ANGSTROM_BLACKLIST_pn-bluez-utils =A0 =A0 =A0=3D "bluez-utils 3.x has =
been replaced by bluez4"
> @@ -151,12 +151,12 @@ require conf/distro/include/angstrom.inc
> =A0# Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .in=
c
> =A0DISTRO_FEED_CONFIGS =3D "${ANGSTROM_FEED_CONFIGS}"
>
> -# If we're using an .ipk based rootfs, we want to have opkg-nogpg instal=
led so postinst script can run
> +# If we're using an .ipk based rootfs, we want to have opkg installed so=
 postinst script can run
> =A0# We also take this opportunity to inject angstrom-version and the fee=
d configs into the rootfs
> -IPKG_VARIANT =3D "opkg-nogpg-nocurl angstrom-version ${ANGSTROM_FEED_CON=
FIGS}"
> +IPKG_VARIANT =3D "opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
>
> =A0# we need the same provider for opkg and u-a
> -PREFERRED_PROVIDER_virtual/update-alternatives =3D "opkg-nogpg-nocurl"
> +PREFERRED_PROVIDER_virtual/update-alternatives =3D "opkg"
>
> =A0# Select xserver-xorg as default, since kdrive has been EOL'ed
> =A0XSERVER ?=3D "xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-i=
nput-mouse xf86-video-fbdev"
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/dis=
tro/include/preferred-slugos-versions.inc
> index 84b1381..a8909d0 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -15,16 +15,6 @@ PREFERRED_VERSION_linux-ixp4xx =3D "2.6.27.8+svnr${SRC=
REV_pn-linux-ixp4xx}"
> =A0#
> =A0#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D#
> =A0#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D#
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOTE NOTE N=
OTE
> -#
> -# Override the sane-srcrev file with regard to the opkg versions - this =
should
> -# be removed as soon as opkg starts to work correctly again as newer opk=
g
> -# versions fix a number of bugs and add some desireable features.
> -#
> -OPKG_SRCREV =3D "160"
> -#
> -#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D#
> -#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D#
>
> =A0### Standard package preferred versions go here, sorted
> =A0### alphabetically. =A0Note that the main slugos.inc file
> diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.con=
f
> index 3ec3e86..f62ca99 100644
> --- a/conf/distro/jlime-2010.1.conf
> +++ b/conf/distro/jlime-2010.1.conf
> @@ -40,7 +40,7 @@ SPLASH =3D "psplash"
> =A0INHERIT +=3D "debian package_tar package_ipk src_distribute_local"
> =A0SRC_DIST_LOCAL ?=3D "symlink"
> =A0IMAGE_FSTYPES =3D "tar.gz tar.bz2 jffs2"
> -PREFERRED_PROVIDER_virtual/update-alternatives =3D "opkg-nogpg-nocurl"
> +PREFERRED_PROVIDER_virtual/update-alternatives =3D "opkg"
>
> =A0#
> =A0# Kernel
> diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.con=
f
> index 4bb637c..58d7a57 100644
> --- a/conf/distro/kaeilos-2010.conf
> +++ b/conf/distro/kaeilos-2010.conf
> @@ -64,7 +64,7 @@ require conf/distro/include/kaeilos-2010.inc
> =A0# Select packaging system
> =A0IMAGE_FSTYPES ?=3D "tar.gz jffs2"
> =A0PREFERRED_PKG_FORMAT =3D "ipk"
> -IPKG_VARIANT =3D "opkg-nogpg"
> +IPKG_VARIANT =3D "opkg"
>
>
>
> @@ -99,11 +99,11 @@ require conf/distro/include/sane-toolchain.inc
>
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> -PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg-nogpg=
-nocurl"
> +PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg"
>
> =A0# PREFERRED VERSIONS
> -PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg"
> -PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-nogpg"
> +PREFERRED_PROVIDER_opkg ?=3D "opkg"
> +PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
>
>
> =A0# Select xserver-xorg as default, since kdrive has been EOL'ed
> @@ -128,7 +128,7 @@ DEBUG_APPS +=3D '${@base_conditional("DISTRO_TYPE", "=
release", "", "strace procps"
> =A0DISTRO_EXTRA_RDEPENDS +=3D "\
> =A0 =A0 update-modules \
> =A0 =A0 kaeilos-version \
> - =A0 =A0opkg-nogpg opkg-collateral \
> + =A0 =A0opkg opkg-collateral \
> =A0 =A0 util-linux-ng-mount util-linux-ng-umount \
> =A0 =A0 ${DEBUG_APPS} \
> =A0 =A0 "
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index eb12d2e..c1c2e36 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -127,7 +127,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYP=
E}.inc
>
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> -PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg-nogpg=
-nocurl"
> +PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg"
>
> =A0# see recipes/bluez/bluez4*.bb for further dependencies of this settin=
g
> =A0ANGSTROM_BLACKLIST_pn-bluez-libs =A0 =A0 =A0 =3D "bluez-libs 3.x has b=
een replaced by bluez4"
> @@ -137,12 +137,12 @@ ANGSTROM_BLACKLIST_pn-fso-apm =A0 =A0 =A0 =3D "regu=
lar apmd is good enough"
>
> =A0require conf/distro/include/kaeilos.inc
>
> -# If we're using an .ipk based rootfs, we want to have opkg-nogpg instal=
led so postinst script can run
> +# If we're using an .ipk based rootfs, we want to have opkg installed so=
 postinst script can run
> =A0# We also take this opportunity to inject angstrom-version and the fee=
d configs into the rootfs
> -IPKG_VARIANT =3D "opkg-nogpg-nocurl angstrom-version ${ANGSTROM_FEED_CON=
FIGS}"
> +IPKG_VARIANT =3D "opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
>
> =A0# we need the same provider for opkg and u-a
> -PREFERRED_PROVIDER_virtual/update-alternatives =3D "opkg-nogpg-nocurl"
> +PREFERRED_PROVIDER_virtual/update-alternatives =3D "opkg"
>
> =A0# Select xserver-xorg as default, since kdrive has been EOL'ed
> =A0XSERVER ?=3D "xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-i=
nput-mouse xf86-video-fbdev"
> @@ -167,7 +167,7 @@ DEBUG_APPS +=3D '${@base_conditional("DISTRO_TYPE", "=
release", "", "strace procps"
> =A0DISTRO_EXTRA_RDEPENDS +=3D "\
> =A0 =A0 update-modules \
> =A0 =A0 kaeilos-version \
> - =A0 =A0opkg-nogpg opkg-collateral ${ANGSTROM_FEED_CONFIGS} \
> + =A0 =A0opkg opkg-collateral ${ANGSTROM_FEED_CONFIGS} \
> =A0 =A0 util-linux-ng-mount util-linux-ng-umount \
> =A0 =A0 ${DEBUG_APPS} angstrom-libc-fixup-hack \
> =A0 =A0 "
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 9885425..5c58ce2 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -32,7 +32,7 @@ INHERIT +=3D "debian"
> =A0######################################################################=
#######
> =A0# Select packaging system
> =A0PREFERRED_PKG_FORMAT =3D "ipk"
> -IPKG_VARIANT =3D "opkg-nogpg"
> +IPKG_VARIANT =3D "opkg"
>
> =A0require conf/distro/include/sane-feed.inc
> =A0require conf/distro/include/sane-feed-${PREFERRED_PKG_FORMAT}.inc
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 1e72efd..1fa3c5e 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -58,8 +58,8 @@ PREFERRED_PKG_FORMAT ?=3D "ipk"
> =A0INHERIT +=3D "src_distribute_local"
> =A0SRC_DIST_LOCAL ?=3D "symlink"
>
> -# If we're using an .ipk based rootfs, we want to have opkg-nogpg instal=
led so postinst script can run
> -IPKG_VARIANT =3D "opkg-nogpg"
> +# If we're using an .ipk based rootfs, we want to have opkg installed so=
 postinst script can run
> +IPKG_VARIANT =3D "opkg"
>
> =A0######################################################################=
#######
> =A0# IMAGES
> @@ -101,8 +101,8 @@ require conf/distro/include/preferred-e-versions.inc
> =A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> =A0require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>
> -PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg"
> -PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-nogpg"
> +PREFERRED_PROVIDER_opkg ?=3D "opkg"
> +PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
>
> =A0######################################################################=
#######
> =A0# CONTENTS
> diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
> index 7ab7b35..ae8d064 100644
> --- a/conf/distro/nylon.conf
> +++ b/conf/distro/nylon.conf
> @@ -86,4 +86,4 @@ PREFERRED_VERSION_e2fsprogs-libs =3D "1.41.8"
> =A0PREFERRED_VERSION_dbus =3D "1.2.1"
>
> =A0PREFERRED_PROVIDER_hotplug =3D "linux-hotplug"
> -PREFERRED_PROVIDER_opkg =3D "opkg-nogpg"
> +PREFERRED_PROVIDER_opkg =3D "opkg"
> diff --git a/recipes/angstrom/angstrom-feed-configs.bb b/recipes/angstrom=
/angstrom-feed-configs.bb
> index d25cba7..cad2b8b 100644
> --- a/recipes/angstrom/angstrom-feed-configs.bb
> +++ b/recipes/angstrom/angstrom-feed-configs.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Configuration files for online package repositories a=
ka feeds"
>
> -RRECOMMENDS_${PN} +=3D "opkg-nogpg-nocurl"
> +RRECOMMENDS_${PN} +=3D "opkg"
>
> =A0#PV =3D "${DISTRO_VERSION}"
> =A0PR =3D "r11"
> diff --git a/recipes/images/minimal-gpe-image.bb b/recipes/images/minimal=
-gpe-image.bb
> index c37225d..0c5c863 100644
> --- a/recipes/images/minimal-gpe-image.bb
> +++ b/recipes/images/minimal-gpe-image.bb
> @@ -17,7 +17,7 @@ IMAGE_INSTALL =3D "\
> =A0 =A0 matchbox-wm \
> =A0 =A0 gpe-terminal \
> =A0 =A0 angstrom-feed-configs \
> - =A0 =A0opkg-nogpg opkg-collateral \
> + =A0 =A0opkg opkg-collateral \
> =A0 =A0 ${SPLASH} \
> =A0 =A0 "
>
> diff --git a/recipes/images/nas-server-image.bb b/recipes/images/nas-serv=
er-image.bb
> index 85b2bae..61e8296 100644
> --- a/recipes/images/nas-server-image.bb
> +++ b/recipes/images/nas-server-image.bb
> @@ -20,7 +20,7 @@
> =A0# intended to be distro-agnostic.
>
> =A0DISTRO_SSH_DAEMON ?=3D "dropbear"
> -DISTRO_PACKAGE_MANAGER ?=3D "opkg-nogpg opkg-collateral"
> +DISTRO_PACKAGE_MANAGER ?=3D "opkg opkg-collateral"
>
> =A0DEPENDS =3D "\
> =A0 =A0 =A0 =A0task-boot \
> diff --git a/recipes/images/x11-sato-image.bb b/recipes/images/x11-sato-i=
mage.bb
> index 0a127f8..c2ed50e 100644
> --- a/recipes/images/x11-sato-image.bb
> +++ b/recipes/images/x11-sato-image.bb
> @@ -1,5 +1,5 @@
> =A0DISTRO_SSH_DAEMON ?=3D "dropbear"
> -DISTRO_PACKAGE_MANAGER ?=3D "opkg-nogpg opkg-collateral"
> +DISTRO_PACKAGE_MANAGER ?=3D "opkg opkg-collateral"
>
> =A0XSERVER ?=3D "xserver-kdrive-fbdev"
>
> diff --git a/recipes/meta/meta-toolchain-arago.bb b/recipes/meta/meta-too=
lchain-arago.bb
> index 0478e97..425af6d 100644
> --- a/recipes/meta/meta-toolchain-arago.bb
> +++ b/recipes/meta/meta-toolchain-arago.bb
> @@ -15,7 +15,7 @@ TOOLCHAIN_TARGET_EXCLUDE +=3D "\
> =A0 =A0 libthread-db1 \
> =A0 =A0 sln \
> =A0 =A0 curl \
> - =A0 =A0opkg-nogpg \
> + =A0 =A0opkg \
> =A0 =A0 alsa-conf-base \
> =A0 =A0 update-rc.d \
> =A0 =A0 update-rc.d-dev \
> diff --git a/recipes/opkg/files/fix_endianness.patch b/recipes/opkg/files=
/fix_endianness.patch
> deleted file mode 100644
> index 8632ce5..0000000
> --- a/recipes/opkg/files/fix_endianness.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -urN opkg.orig/configure.ac opkg/configure.ac
> ---- opkg.orig/configure.ac =A0 =A0 2008-03-20 13:29:09.000000000 +0100
> -+++ opkg/configure.ac =A02008-03-25 09:39:52.000000000 +0100
> -@@ -94,7 +94,7 @@
> - AC_CHECK_MEMBERS([struct stat.st_rdev])
> -
> - # Checks endianness
> --AC_C_BIGENDIAN(ENDIAN_CFLAGS=3D"-DWORDS_BIGENDIAN=3D1",)
> -+AC_C_BIGENDIAN(BIGENDIAN_CFLAGS=3D"-DWORDS_BIGENDIAN=3D1",)
> - AC_SUBST(BIGENDIAN_CFLAGS)
> -
> - # Don't do annoying tests that don't work when cross-compiling, just tr=
ust them.
> diff --git a/recipes/opkg/files/isatty.patch b/recipes/opkg/files/isatty.=
patch
> new file mode 100644
> index 0000000..c935f15
> --- /dev/null
> +++ b/recipes/opkg/files/isatty.patch
> @@ -0,0 +1,64 @@
> +Copyright (c) 2009 MontaVista Software, Inc. =A0All rights reserved.
> +
> +Don't prompt for user input from stdin if it's not a tty. =A0Fixes a min=
or
> +memory leak while we're at it, as the code was strdup'ing the malloc'd s=
tring
> +read from stdin without ever freeing the original.
> +---
> + libopkg/libopkg.c =A0 =A0 =A0| =A0 13 ++++++++-----
> + libopkg/opkg_install.c | =A0 =A03 +++
> + libopkg/user.c =A0 =A0 =A0 =A0 | =A0 10 +++++++---
> + 3 files changed, 18 insertions(+), 8 deletions(-)
> +
> +--- trunk.orig/libopkg/libopkg.c
> ++++ trunk/libopkg/libopkg.c
> +@@ -71,11 +71,14 @@ int default_opkg_status_callback(char *n
> + char* default_opkg_response_callback(char *question)
> + {
> + =A0 =A0 =A0char *response =3D NULL;
> +- =A0 =A0 printf("%s",question);
> +- =A0 =A0 fflush(stdout);
> +- =A0 =A0 do {
> +- =A0 =A0 =A0 =A0response =3D (char *)file_read_line_alloc(stdin);
> +- =A0 =A0 } while (response =3D=3D NULL);
> ++ =A0 =A0 if (isatty(fileno(stdin)))
> ++ =A0 =A0 {
> ++ =A0 =A0 =A0 =A0printf("%s",question);
> ++ =A0 =A0 =A0 =A0fflush(stdout);
> ++ =A0 =A0 =A0 =A0do {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 response =3D (char *)file_read_line_alloc(stdi=
n);
> ++ =A0 =A0 =A0 =A0} while (response =3D=3D NULL);
> ++ =A0 =A0 }
> + =A0 =A0 =A0return response;
> + }
> +
> +--- trunk.orig/libopkg/user.c
> ++++ trunk/libopkg/user.c
> +@@ -44,9 +44,13 @@ char *get_user_response(const char *form
> + =A0 =A0 =A0 =A0 len =3D vsnprintf(question,question_len,format,ap);
> + =A0 =A0 =A0 =A0 =A0 va_end(ap);
> + =A0 =A0 =A0} while (len > question_len);
> +- =A0 =A0 response =3D strdup(opkg_cb_response(question));
> +- =A0 =A0 str_chomp(response);
> +- =A0 =A0 str_tolower(response);
> ++
> ++ =A0 =A0 response =3D opkg_cb_response(question);
> ++ =A0 =A0 if (response)
> ++ =A0 =A0 {
> ++ =A0 =A0 =A0 =A0 str_chomp(response);
> ++ =A0 =A0 =A0 =A0 str_tolower(response);
> ++ =A0 =A0 }
> +
> + =A0 =A0 =A0return response;
> + }
> +--- trunk.orig/libopkg/opkg_install.c
> ++++ trunk/libopkg/opkg_install.c
> +@@ -1613,6 +1613,9 @@ static int user_prefers_old_conffile(con
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0" =A0 =A0 =A0 =A0 =A0D =A0 =A0 : show the differences between the versi=
ons (if diff is installed)\n"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0" =A0 =A0 The default action is to keep your current version.\n"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0" =A0 =A0*** %s (Y/I/N/O/D) [default=3DN] ? ", file_name, short_file_na=
me);
> ++ =A0 =A0 =A0 =A0if (!response)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> ++
> + =A0 =A0 =A0 =A0 if (strcmp(response, "y") =3D=3D 0
> + =A0 =A0 =A0 =A0 =A0 =A0 || strcmp(response, "i") =3D=3D 0
> + =A0 =A0 =A0 =A0 =A0 =A0 || strcmp(response, "yes") =3D=3D 0) {
> diff --git a/recipes/opkg/files/opkg-intercept-cleanup.patch b/recipes/op=
kg/files/opkg-intercept-cleanup.patch
> new file mode 100644
> index 0000000..12893e3
> --- /dev/null
> +++ b/recipes/opkg/files/opkg-intercept-cleanup.patch
> @@ -0,0 +1,47 @@
> +---
> + libopkg/opkg_cmd.c | =A0 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +--- trunk.orig/libopkg/opkg_cmd.c
> ++++ trunk/libopkg/opkg_cmd.c
> +@@ -19,6 +19,7 @@
> + #include "includes.h"
> + #include <dirent.h>
> + #include <glob.h>
> ++#include <unistd.h>
> +
> + #include "opkg_conf.h"
> + #include "opkg_cmd.h"
> +@@ -350,7 +351,6 @@ static opkg_intercept_t opkg_prep_interc
> +
> + static int opkg_finalize_intercepts(opkg_intercept_t ctx)
> + {
> +- =A0 =A0char *cmd;
> + =A0 =A0 DIR *dir;
> + =A0 =A0 int err =3D 0;
> +
> +@@ -376,6 +376,10 @@ static int opkg_finalize_intercepts(opkg
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D errno;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 perror (de->d_name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (unlink (path)) {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D errno;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perror (path);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 free (path);
> + =A0 =A0 =A0 }
> +@@ -383,9 +387,10 @@ static int opkg_finalize_intercepts(opkg
> + =A0 =A0 } else
> + =A0 =A0 =A0 perror (ctx->statedir);
> +
> +- =A0 =A0sprintf_alloc (&cmd, "rm -rf %s", ctx->statedir);
> +- =A0 =A0err =3D system (cmd);
> +- =A0 =A0free (cmd);
> ++ =A0 =A0if (rmdir (ctx->statedir)) {
> ++ =A0 =A0 =A0err =3D errno;
> ++ =A0 =A0 =A0perror (ctx->statedir);
> ++ =A0 =A0}
> +
> + =A0 =A0 free (ctx->statedir);
> + =A0 =A0 free (ctx);
> diff --git a/recipes/opkg/files/opkg-libdir.patch b/recipes/opkg/files/op=
kg-libdir.patch
> deleted file mode 100644
> index 1d48b9a..0000000
> --- a/recipes/opkg/files/opkg-libdir.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- trunk/utils/update-alternatives.orig =A0 =A0 =A0 2009-06-23 15:33:56=
.000000000 -0300
> -+++ trunk/utils/update-alternatives =A0 =A02009-06-23 15:34:10.000000000=
 -0300
> -@@ -21,7 +21,7 @@
> - set -e
> -
> - # admin dir
> --ad=3D"$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
> -+ad=3D"$OPKG_OFFLINE_ROOT/${libdir}/opkg/alternatives"
> -
> - usage() {
> - =A0 =A0 =A0 echo "update-alternatives: $*
> diff --git a/recipes/opkg/opkg-native_svn.bb b/recipes/opkg/opkg-native_s=
vn.bb
> index fe3ed4e..33d84ff 100644
> --- a/recipes/opkg/opkg-native_svn.bb
> +++ b/recipes/opkg/opkg-native_svn.bb
> @@ -1,19 +1,10 @@
> =A0require opkg.inc
>
> -DEPENDS =3D "curl-native openssl-native"
> =A0PR =3D "${INC_PR}"
> =A0PROVIDES =3D+ "virtual/update-alternatives-native"
>
> -SRC_URI +=3D "file://opkg-libdir.patch;maxrev=3D342"
> -
> =A0target_libdir :=3D "${libdir}"
>
> =A0inherit native
>
> -# The nogpg version isn't getting much love and has an unused variable w=
hich trips up -Werror
> -do_configure_prepend() {
> - =A0 =A0 =A0 =A0sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
> -}
> -
> -
> -EXTRA_OECONF +=3D "--with-opkglibdir=3D${target_libdir} --disable-gpg"
> +EXTRA_OECONF +=3D "--with-opkglibdir=3D${target_libdir}"
> diff --git a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb b/recipes/opkg/=
opkg-nogpg-nocurl-slugos_svn.bb
> index 4d49dff..cda5115 100644
> --- a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
> +++ b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
> @@ -2,7 +2,7 @@
> =A0# recipe, intended for temporary use by the SlugOS distro.
>
> =A0# DO NOT USE this recipe for anything other than SlugOS and svn versio=
n 160
> -# of the opkg sources. =A0Also note that This recipe will be removed wit=
hout
> +# of the opkg sources. =A0Also note that this recipe will be removed wit=
hout
> =A0# notice when the unfortunate commits to the original opkg-nogpg-nocur=
l_svn.bb
> =A0# recipe are repaired, the small-memory patches updated to a newer opk=
g svn
> =A0# version, and appropriate testing confirms that the resulting binary =
actually
> @@ -10,12 +10,23 @@
>
> =A0# DO NOT CHANGE THIS RECIPE!
>
> -require opkg.inc
> +DESCRIPTION =3D "Opkg Package Manager"
> +DESCRIPTION_libopkg =3D "Opkg Package Manager Library"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +SRCREV =3D "160"
> +PV =3D "0.1.6+svnr${SRCPV}"
> +PR =3D "r22"
>
> -DEPENDS =3D ""
> =A0PROVIDES +=3D "opkg"
> +S =3D "${WORKDIR}/trunk"
> +
> +inherit autotools pkgconfig
>
> =A0SRC_URI +=3D " \
> + =A0 =A0 =A0 =A0 =A0 svn://opkg.googlecode.com/svn;module=3Dtrunk;proto=
=3Dhttp \
> + =A0 =A0 =A0 =A0 =A0 file://opkg_unarchive.patch;maxrev=3D201 \
> + =A0 =A0 =A0 =A0 =A0 file://opkg-intercept-cleanup.patch;maxrev=3D241 \
> =A0 =A0 =A0 =A0 =A0 =A0file://isatty.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://opkg_wget.patch;maxrev=3D180 \
> =A0 =A0 =A0 =A0 =A0 =A0file://reduce-nogpg-noise.patch;maxrev=3D180 \
> @@ -23,11 +34,16 @@ SRC_URI +=3D " \
> =A0 =A0 =A0 =A0 =A0 =A0file://opkg_wget_nogpg_02_use_vfork_system.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://opkg_wget_nogpg_03_fix_tmpdirs.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://opkg_wget_nogpg_04_default_tmpdir.patch \
> + =A0 =A0 =A0 =A0 =A0 file://configure \
> =A0 =A0 =A0 =A0 =A0 "
> -PR =3D "${INC_PR}"
>
> =A0EXTRA_OECONF +=3D "--disable-gpg --enable-static --disable-shared"
>
> +do_install_prepend() {
> + =A0install -d ${D}${sysconfdir}/rcS.d
> + =A0install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S98conf=
igure
> +}
> +
> =A0# Not sure this is needed; needs to be investigated and removed if not
> =A0do_stage() {
> =A0 =A0 =A0 =A0autotools_stage_all
> @@ -44,11 +60,6 @@ FILES_libopkg-dev =3D "${libdir}/*.a ${libdir}/*.la ${=
libdir}/*.so"
> =A0# not happens automatically for opkg-nogpg:
> =A0FILES_${PN} +=3D "${datadir}/opkg/intercept"
>
> -# Define a variable to allow distros to run configure earlier.
> -# (for example, to enable loading of ethernet kernel modules before netw=
orking starts)
> -OPKG_INIT_POSITION =3D "98"
> -OPKG_INIT_POSITION_slugos =3D "41"
> -
> =A0pkg_postinst_${PN} () {
> =A0 update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 1=
00
> =A0}
> diff --git a/recipes/opkg/opkg-nogpg-nocurl_svn.bb b/recipes/opkg/opkg-no=
gpg-nocurl_svn.bb
> deleted file mode 100644
> index 66e8dbc..0000000
> --- a/recipes/opkg/opkg-nogpg-nocurl_svn.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require opkg-nogpg_svn.bb
> -
> -DEPENDS =3D ""
> -PROVIDES +=3D "opkg"
> -
> -PR =3D "${INC_PR}"
> -
> -EXTRA_OECONF +=3D " --disable-curl --enable-static --disable-shared"
> -
> -# The nogpg version isn't getting much love and has an unused variable w=
hich trips up -Werror
> -do_configure_prepend() {
> - =A0 =A0 =A0 sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
> -}
> -
> -DEFAULT_PREFERENCE =3D "-1"
> diff --git a/recipes/opkg/opkg-nogpg_svn.bb b/recipes/opkg/opkg-nogpg_svn=
.bb
> deleted file mode 100644
> index bee639f..0000000
> --- a/recipes/opkg/opkg-nogpg_svn.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -require opkg_svn.bb
> -
> -DEPENDS =3D "curl"
> -PROVIDES +=3D "opkg"
> -
> -PR =3D "${INC_PR}.1"
> -
> -EXTRA_OECONF +=3D " --disable-gpg \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-ssl-curl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-gpg=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-ssl-curl=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-openssl=3Dno"
> -
> -LDFLAGS_append =3D " -Wl,--as-needed"
> -
> -# The nogpg version isn't getting much love and has an unused variable w=
hich trips up -Werror
> -do_configure_prepend() {
> - =A0 =A0 =A0 sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
> -}
> -do_configure_prepend_nylon() {
> - =A0 =A0 =A0 LDFLAGS=3D"`echo "$LDFLAGS" | sed "s/ -Wl,--as-needed//"`"
> -}
> -
> -DEFAULT_PREFERENCE =3D "-1"
> diff --git a/recipes/opkg/opkg-sdk_svn.bb b/recipes/opkg/opkg-sdk_svn.bb
> index f7f9c9e..5970f8e 100644
> --- a/recipes/opkg/opkg-sdk_svn.bb
> +++ b/recipes/opkg/opkg-sdk_svn.bb
> @@ -5,4 +5,4 @@ PR =3D "${INC_PR}"
> =A0target_libdir :=3D "${libdir}"
> =A0inherit sdk
>
> -EXTRA_OECONF +=3D "--with-opkglibdir=3D${target_libdir} --disable-gpg"
> +EXTRA_OECONF +=3D "--with-opkglibdir=3D${target_libdir}"
> diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
> index 1149b72..b88ae4b 100644
> --- a/recipes/opkg/opkg.inc
> +++ b/recipes/opkg/opkg.inc
> @@ -2,20 +2,14 @@ DESCRIPTION =3D "Opkg Package Manager"
> =A0DESCRIPTION_libopkg =3D "Opkg Package Manager Library"
> =A0SECTION =3D "base"
> =A0LICENSE =3D "GPLv2"
> -DEPENDS =3D "curl gpgme openssl"
> =A0SRCREV =3D ${OPKG_SRCREV}
> -PV =3D "0.1.6+svnr${SRCPV}"
> -INC_PR =3D "r21"
> -
> -FILESPATHPKG =3D. "opkg:"
> +PV =3D "0.1.8+svnr${SRCPV}"
> +INC_PR =3D "r0"
>
> =A0SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtrunk;proto=3Dhttp=
 \
> - =A0 =A0 =A0 file://opkg_unarchive.patch;maxrev=3D201 \
> - =A0 =A0 =A0 file://opkg-intercept-cleanup.patch;maxrev=3D241 \
> + =A0 =A0 =A0 =A0 =A0file://configure \
> =A0"
>
> -SRC_URI +=3D "file://configure"
> -
> =A0S =3D "${WORKDIR}/trunk"
>
> =A0inherit autotools pkgconfig
> @@ -25,3 +19,7 @@ do_install_prepend() {
> =A0 install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S98confi=
gure
> =A0}
>
> +EXTRA_OECONF +=3D " --disable-gpg \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-ssl-curl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-curl"
> diff --git a/recipes/opkg/opkg/isatty.patch b/recipes/opkg/opkg/isatty.pa=
tch
> deleted file mode 100644
> index c935f15..0000000
> --- a/recipes/opkg/opkg/isatty.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -Copyright (c) 2009 MontaVista Software, Inc. =A0All rights reserved.
> -
> -Don't prompt for user input from stdin if it's not a tty. =A0Fixes a min=
or
> -memory leak while we're at it, as the code was strdup'ing the malloc'd s=
tring
> -read from stdin without ever freeing the original.
> ----
> - libopkg/libopkg.c =A0 =A0 =A0| =A0 13 ++++++++-----
> - libopkg/opkg_install.c | =A0 =A03 +++
> - libopkg/user.c =A0 =A0 =A0 =A0 | =A0 10 +++++++---
> - 3 files changed, 18 insertions(+), 8 deletions(-)
> -
> ---- trunk.orig/libopkg/libopkg.c
> -+++ trunk/libopkg/libopkg.c
> -@@ -71,11 +71,14 @@ int default_opkg_status_callback(char *n
> - char* default_opkg_response_callback(char *question)
> - {
> - =A0 =A0 =A0char *response =3D NULL;
> -- =A0 =A0 printf("%s",question);
> -- =A0 =A0 fflush(stdout);
> -- =A0 =A0 do {
> -- =A0 =A0 =A0 =A0response =3D (char *)file_read_line_alloc(stdin);
> -- =A0 =A0 } while (response =3D=3D NULL);
> -+ =A0 =A0 if (isatty(fileno(stdin)))
> -+ =A0 =A0 {
> -+ =A0 =A0 =A0 =A0printf("%s",question);
> -+ =A0 =A0 =A0 =A0fflush(stdout);
> -+ =A0 =A0 =A0 =A0do {
> -+ =A0 =A0 =A0 =A0 =A0 =A0 response =3D (char *)file_read_line_alloc(stdi=
n);
> -+ =A0 =A0 =A0 =A0} while (response =3D=3D NULL);
> -+ =A0 =A0 }
> - =A0 =A0 =A0return response;
> - }
> -
> ---- trunk.orig/libopkg/user.c
> -+++ trunk/libopkg/user.c
> -@@ -44,9 +44,13 @@ char *get_user_response(const char *form
> - =A0 =A0 =A0 =A0 len =3D vsnprintf(question,question_len,format,ap);
> - =A0 =A0 =A0 =A0 =A0 va_end(ap);
> - =A0 =A0 =A0} while (len > question_len);
> -- =A0 =A0 response =3D strdup(opkg_cb_response(question));
> -- =A0 =A0 str_chomp(response);
> -- =A0 =A0 str_tolower(response);
> -+
> -+ =A0 =A0 response =3D opkg_cb_response(question);
> -+ =A0 =A0 if (response)
> -+ =A0 =A0 {
> -+ =A0 =A0 =A0 =A0 str_chomp(response);
> -+ =A0 =A0 =A0 =A0 str_tolower(response);
> -+ =A0 =A0 }
> -
> - =A0 =A0 =A0return response;
> - }
> ---- trunk.orig/libopkg/opkg_install.c
> -+++ trunk/libopkg/opkg_install.c
> -@@ -1613,6 +1613,9 @@ static int user_prefers_old_conffile(con
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0" =A0 =A0 =A0 =A0 =A0D =A0 =A0 : show the differences between the versi=
ons (if diff is installed)\n"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0" =A0 =A0 The default action is to keep your current version.\n"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0" =A0 =A0*** %s (Y/I/N/O/D) [default=3DN] ? ", file_name, short_file_na=
me);
> -+ =A0 =A0 =A0 =A0if (!response)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> -+
> - =A0 =A0 =A0 =A0 if (strcmp(response, "y") =3D=3D 0
> - =A0 =A0 =A0 =A0 =A0 =A0 || strcmp(response, "i") =3D=3D 0
> - =A0 =A0 =A0 =A0 =A0 =A0 || strcmp(response, "yes") =3D=3D 0) {
> diff --git a/recipes/opkg/opkg/opkg-intercept-cleanup.patch b/recipes/opk=
g/opkg/opkg-intercept-cleanup.patch
> deleted file mode 100644
> index 12893e3..0000000
> --- a/recipes/opkg/opkg/opkg-intercept-cleanup.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> ----
> - libopkg/opkg_cmd.c | =A0 13 +++++++++----
> - 1 file changed, 9 insertions(+), 4 deletions(-)
> -
> ---- trunk.orig/libopkg/opkg_cmd.c
> -+++ trunk/libopkg/opkg_cmd.c
> -@@ -19,6 +19,7 @@
> - #include "includes.h"
> - #include <dirent.h>
> - #include <glob.h>
> -+#include <unistd.h>
> -
> - #include "opkg_conf.h"
> - #include "opkg_cmd.h"
> -@@ -350,7 +351,6 @@ static opkg_intercept_t opkg_prep_interc
> -
> - static int opkg_finalize_intercepts(opkg_intercept_t ctx)
> - {
> -- =A0 =A0char *cmd;
> - =A0 =A0 DIR *dir;
> - =A0 =A0 int err =3D 0;
> -
> -@@ -376,6 +376,10 @@ static int opkg_finalize_intercepts(opkg
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D errno;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 perror (de->d_name);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (unlink (path)) {
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D errno;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perror (path);
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 free (path);
> - =A0 =A0 =A0 }
> -@@ -383,9 +387,10 @@ static int opkg_finalize_intercepts(opkg
> - =A0 =A0 } else
> - =A0 =A0 =A0 perror (ctx->statedir);
> -
> -- =A0 =A0sprintf_alloc (&cmd, "rm -rf %s", ctx->statedir);
> -- =A0 =A0err =3D system (cmd);
> -- =A0 =A0free (cmd);
> -+ =A0 =A0if (rmdir (ctx->statedir)) {
> -+ =A0 =A0 =A0err =3D errno;
> -+ =A0 =A0 =A0perror (ctx->statedir);
> -+ =A0 =A0}
> -
> - =A0 =A0 free (ctx->statedir);
> - =A0 =A0 free (ctx);
> diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
> index 5138458..b193d7c 100644
> --- a/recipes/opkg/opkg_svn.bb
> +++ b/recipes/opkg/opkg_svn.bb
> @@ -8,14 +8,8 @@ PACKAGES =3D+ "libopkg-dev libopkg"
>
> =A0FILES_libopkg-dev =3D "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
> =A0FILES_libopkg =3D "${libdir}/*.so.*"
> -# not happens automatically for opkg-nogpg:
> =A0FILES_${PN} +=3D "${datadir}/opkg/intercept"
>
> -# Define a variable to allow distros to run configure earlier.
> -# (for example, to enable loading of ethernet kernel modules before netw=
orking starts)
> -OPKG_INIT_POSITION =3D "98"
> -OPKG_INIT_POSITION_slugos =3D "41"
> -
> =A0pkg_postinst_${PN} () {
> =A0 update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 1=
00
> =A0}
> diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks=
/task-arago-toolchain-target.bb
> index e22ac2b..8f85a89 100644
> --- a/recipes/tasks/task-arago-toolchain-target.bb
> +++ b/recipes/tasks/task-arago-toolchain-target.bb
> @@ -30,6 +30,6 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 zlib-dev \
> =A0 =A0 mtd-utils-dev \
> =A0 =A0 ncurses-dev \
> - =A0 =A0opkg-nogpg-dev \
> + =A0 =A0opkg-dev \
> =A0 =A0 sysvinit-dev \
> =A0 =A0 "
> diff --git a/recipes/tasks/task-sdk-sbox.bb b/recipes/tasks/task-sdk-sbox=
.bb
> index bf75402..25829cc 100644
> --- a/recipes/tasks/task-sdk-sbox.bb
> +++ b/recipes/tasks/task-sdk-sbox.bb
> @@ -8,6 +8,6 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 gdb \
> =A0 =A0 sbrsh \
> =A0 =A0 fakeroot \
> - =A0 =A0opkg-nogpg \
> + =A0 =A0opkg \
> =A0 =A0 opkg-utils \
> =A0 =A0 "
> --
> 1.7.1
>
>
>


