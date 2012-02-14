Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anton.komarov@gmail.com>) id 1RxPNG-0001Fa-EQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 21:53:18 +0100
Received: by wgbdr13 with SMTP id dr13so273031wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=bgcg00fL9y3AGJrWZPrKvhpiJ2A94IFF4LWZAF/qUP4=;
	b=w2j+T+ryLmutswylji1LRIGlKnO8wUz+Asc5sYItClUJaj03mId/OmYKlOtTffz5GK
	V4S7nPUL6wXvoui2junVj/e4h77AkEUku7HfMZpO4TuMynN2IB4r/4Oc1i7qoLKIB0JA
	yelzSoe/IeHPRws9l/1JPoKPIzhJiFr0RRtvw=
Received: by 10.180.79.229 with SMTP id m5mr31385933wix.6.1329252307431; Tue,
	14 Feb 2012 12:45:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.18.205 with HTTP; Tue, 14 Feb 2012 12:44:47 -0800 (PST)
From: Anton Komarov <anton.komarov@gmail.com>
Date: Wed, 15 Feb 2012 00:44:47 +0400
Message-ID: <CAHKdsmR9A4UMA4Q2cwvnvg6WxnQjO13mydJ-u2D=qxPxFYACQw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Recipe for libmp3splt failed to make packages
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
X-List-Received-Date: Tue, 14 Feb 2012 20:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

I tried to build libmp3splt library with this recipe, but gets
following error. I just cannot understand - what am i doing wron?


recipe:

DESCRIPTION = "Mp3splt-project is a utility to split mp3 and ogg files
selecting a begin and an end time position, without decoding."
HOMEPAGE = "http://mp3splt.sourceforge.net/mp3splt_page/about.php"
BUGTRACKER = "http://sourceforge.net/tracker/?atid=476061&group_id=55130&func=browse"
SECTION = "libs"
LICENSE = "GPLv2"

DEPENDS="libmad"

LIC_FILES_CHKSUM = "file://COPYING;md5=678a5e287e539ce6c24384c512373a53"

PR = "r26"

S = "${WORKDIR}/libmp3splt-${PV}"

SRC_URI = "${SOURCEFORGE_MIRROR}/mp3splt/libmp3splt-${PV}.tar.gz"

SRC_URI[md5sum] = "1c982db15bba4efb42a5a227ce87a575"
SRC_URI[sha256sum] =
"7b3d485690cd0f076395917bf566314e05babbd7c02a7a99bbc40dcf1ea3ca96"

inherit autotools pkgconfig gettext

PACKAGES =+ "libsplt_mp3 libsplt_ogg"
FILES_${PN}-dev = "${libdir}/libmp3splt.so ${libdir}/libmp3splt.la
${libdir}/libmp3splt.a ${libdir}/libmp3splt/*.so*"
FILES_libsplt_mp3-staticdev="${libdir}/libmp3splt/libsplt_mp3.a"
FILES_libsplt_ogg-staticdev="${libdir}/libmp3splt/libsplt_ogg.a"

errors:

WARNING: For recipe libmp3splt, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/share
WARNING:   /usr/include
WARNING:   /usr/share/aclocal
WARNING:   /usr/share/aclocal/mp3splt.m4
WARNING:   /usr/include/libmp3splt
WARNING:   /usr/include/libmp3splt/mp3splt.h
WARNING: libmp3splt: The compile log indicates that host include
and/or library paths were used.  Please check the log
'/stuff/work/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/temp/log.do_compile'
for more information.
WARNING: QA Issue: non -staticdev package contains static .a library:
libmp3splt path
'/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.a'
WARNING: QA Issue: non -staticdev package contains static .a library:
libmp3splt path
'/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.a'
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: libmp3splt path
'/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/libmp3splt/usr/lib/libmp3splt/libsplt_mp3.so'
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: libmp3splt path
'/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/libmp3splt/usr/lib/libmp3splt/libsplt_ogg.so'
WARNING: QA Issue: non -staticdev package contains static .a library:
libmp3splt-dev path
'/work/armv7a-angstrom-linux-gnueabi/libmp3splt-0.5.6-r27/packages-split/libmp3splt-dev/usr/lib/libmp3splt.a'


