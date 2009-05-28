Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M9hzU-0003li-Tg
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 17:58:01 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M9hrL-000246-6p
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 16:49:37 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M9hrJ-0004Te-TS
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 16:49:33 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A1EAFEF.8010902@dls.net>
References: <87d49uaq9f.wl%peter@chubb.wattle.id.au> <4A1EAFEF.8010902@dls.net>
Date: Thu, 28 May 2009 16:49:33 +0100
Message-Id: <1243525773.14104.118.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: console-image trying to build X?
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
X-List-Received-Date: Thu, 28 May 2009 15:58:01 -0000
X-Groupsio-MsgNum: 10802
Content-Type: multipart/mixed; boundary="=-Sw5C0j/GFtQq6HGoV5WO"

--=-Sw5C0j/GFtQq6HGoV5WO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-28 at 10:38 -0500, Mike Westerhof (mwester) wrote:
> This has been a topic of discussion from time-to-time.  In all
> likelihood, X is being pulled in to satisfy dbus or bluez (I don't
> recall which off the top of my head).  You probably will not end up with
> the full X packages on your resulting image; OE just need to build that
> in order to satisfy some very specific build-time dependencies.
> 
> As a side note, I have been meaning for some time to create a "no-X"
> version of the particular package that causes this, to suit my own
> needs; once that gets done there might be an easy way to do a build that
> won't have this dependency.

It's probably bluez4, which currently has a massive dependency stack
including GStreamer and countless other things.

The right way to fix this, I think, is to split the current monolithic
bluez4 package back into bluez-libs and bluez-apps (i.e. how it used to
be packaged in bluez3 days).  It's only the apps part that has the
monstrous dependencies: the libs are more-or-less self-contained, so
this way people who only want to link with the libs can avoid building
all the app prerequisities.

I did check in a bluez-libs_4.40 recipe last week sometime, which builds
just the library half of the package, but I didn't yet get time to
finish the apps part of the equation.  I've attached a work-in-progress
draft of an apps recipe in case anybody else is enthused enough to
finish it off.

In the slightly longer term it might even be worth going further than
that and splitting up bluez-apps into yet smaller recipes.  Taking
GStreamer as an example again, this is only required by one part of the
apps package (the bluez-gstreamer plugin) and I suspect this particular
plugin is of somewhat fringe interest: there are certainly plenty of
useful things you can do without it.

p.


--=-Sw5C0j/GFtQq6HGoV5WO
Content-Disposition: attachment; filename=bluez-apps_4.40.bb
Content-Type: text/plain; name=bluez-apps_4.40.bb; charset=UTF-8
Content-Transfer-Encoding: 7bit

DESCRIPTION = "Linux Bluetooth Stack Userland V4"
SECTION = "net"
PRIORITY = "optional"
DEPENDS = "gst-plugins-base alsa-lib libusb-compat dbus-glib bluez-libs"
HOMEPAGE = "http://www.bluez.org"
LICENSE = "GPL"

DEFAULT_PREFERENCE = "-1"

FILESPATHPKG .= ":bluez4"

SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
          file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
  file://sbc-thumb.patch;patch=1 \
  file://bluetooth.conf \
  file://separate-libs.patch;patch=1;pnum=0 \
"

S = "${WORKDIR}/bluez-${PV}"

inherit autotools_stage
AUTOTOOLS_STAGE_PKGCONFIG = "1"

EXTRA_OECONF = " \
  --enable-alsa \
  --enable-usb \
  --enable-netlink \
  --enable-tools \
  --enable-bccmd \
  --enable-hid2hci \
  --enable-dfutool \
  --enable-hidd \
  --enable-pandd \
  --enable-dund \
  --disable-cups \
  --enable-test \
  --enable-manpages \
  --enable-configfiles \
  --enable-initscripts \
  --disable-pcmciarules \
"

do_configure_prepend() {
        sed 's/ include / /;s/ lib / /' <Makefile.am >Makefile.am.new
        mv Makefile.am.new Makefile.am
}

do_install_append() {
        install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
        install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
        install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
        # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
        install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
}

PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"

FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
FILES_${PN}-dev += "\
  ${libdir}/bluetooth/plugins/*.la \
  ${libdir}/alsa-lib/*.la \
  ${libdir}/gstreamer-0.10/*.la \
"

FILES_${PN}-dbg += "\
  ${libdir}/bluetooth/plugins/.debug \
  ${libdir}/*/.debug \
"

--=-Sw5C0j/GFtQq6HGoV5WO
Content-Disposition: attachment; filename=separate-libs.patch
Content-Type: text/x-patch; name=separate-libs.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- acinclude.m4.old	2009-05-22 16:38:04.000000000 +0100
+++ acinclude.m4	2009-05-22 16:38:24.000000000 +0100
@@ -324,9 +324,6 @@
 		AC_DEFINE(HAVE_LIBUSB, 1, [Define to 1 if you have USB library.])
 	fi
 
-	AC_SUBST([BLUEZ_CFLAGS], ['-I$(top_builddir)/include'])
-	AC_SUBST([BLUEZ_LIBS], ['$(top_builddir)/lib/libbluetooth.la'])
-
 	AC_SUBST([GDBUS_CFLAGS], ['-I$(top_srcdir)/gdbus'])
 	AC_SUBST([GDBUS_LIBS], ['$(top_builddir)/gdbus/libgdbus.la'])
 
--- configure.ac.old	2009-05-22 16:38:30.000000000 +0100
+++ configure.ac	2009-05-22 16:38:35.000000000 +0100
@@ -7,6 +7,7 @@
 AM_MAINTAINER_MODE
 
 AC_INIT_BLUEZ
+AM_PATH_BLUEZ
 
 COMPILER_FLAGS
 

--=-Sw5C0j/GFtQq6HGoV5WO--
