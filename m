Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OVwh4-0008U2-9Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 03:11:28 +0200
Received: by pvg13 with SMTP id 13so645894pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 18:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=MWYwAtkX5qAVtiJlqR10JJFs7xMt9ijXG4NjIC6WZJw=;
	b=ZUFku7U5yCLwrMvBO4Ffyl6vNknBlK2gl7XdbLO/NmWXm9Q1BCEqrD8HiewKRzdj1L
	AjknbWsl3NQQ2VxY9fSCRwXooS8YODh4KeU/iv03K4ANrjsV6KkKFp8aCcYwmIsr4DbY
	WAk7J1u8C/xf1/zqzMqeOFjfuuNxiIKiD1F64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Jt9by+kUD4ofXl+D349r5e8YcXFQgFIpFPl1lnmQ9l1aLqiHvFrAm/Wp9l1SC4h9Lr
	No0aAwCctW3zkDmbaQ1Sg/tstaJ/r9igHLyg6J9235NF1x1NmXJEjgG1051E+kpvTCtp
	fTqQmUQEetsaSbV7gvwReYO8dAyC4lh7xG7g4=
Received: by 10.142.237.12 with SMTP id k12mr4520547wfh.319.1278378395712;
	Mon, 05 Jul 2010 18:06:35 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id t11sm5210226wfc.4.2010.07.05.18.06.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 05 Jul 2010 18:06:35 -0700 (PDT)
Message-ID: <4C328196.6020308@gmail.com>
Date: Tue, 06 Jul 2010 10:36:30 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C3137CF.8090503@gmail.com>
	<20100705214031.GA2879@rhein.zuhause.netz>
In-Reply-To: <20100705214031.GA2879@rhein.zuhause.netz>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gpsd_2.94.bb: fix CROSS COMPILE badness
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
X-List-Received-Date: Tue, 06 Jul 2010 01:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

configure.ac shouldn't check the host system for includes/libraries,
use pkg-config to find libusb instead.

Also, add libusb1 to DEPENDS.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gpsd/gpsd-2.94/configure-libusb.patch |  118 +++++++++++++++++++++++++
 recipes/gpsd/gpsd_2.94.bb                     |    7 +-
 2 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gpsd/gpsd-2.94/configure-libusb.patch

diff --git a/recipes/gpsd/gpsd-2.94/configure-libusb.patch b/recipes/gpsd/gpsd-2.94/configure-libusb.patch
new file mode 100644
index 0000000..d50f219
--- /dev/null
+++ b/recipes/gpsd/gpsd-2.94/configure-libusb.patch
@@ -0,0 +1,118 @@
+upstream: https://lists.berlios.de/pipermail/gpsd-dev/2010-July/008015.html
+status: pending
+diff -ru gpsd-2.94-orig/Makefile.am gpsd-2.94/Makefile.am
+--- gpsd-2.94-orig/Makefile.am	2010-04-20 19:07:21.000000000 +0930
++++ gpsd-2.94/Makefile.am	2010-07-06 10:03:02.000000000 +0930
+@@ -42,7 +42,7 @@
+ endif
+ 
+ # Conditional includes.
+-INCLUDES = $(INCUSB)
++INCLUDES = $(LIBUSB_CFLAGS)
+ if HAVE_DBUS
+ INCLUDES += $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) -DDBUS_API_SUBJECT_TO_CHANGE=1
+ endif
+@@ -105,13 +105,13 @@
+ #
+ gpsd_c_sources = gpsd_dbus.c gpsd.c
+ gpsd_SOURCES = $(gpsd_c_sources) gpsd_dbus.h
+-gpsd_LDADD = $(DBUS_LIBS) $(LIBM) libgpsd.la libgps.la -lm $(LIBPTHREAD) $(LIBUSB)
++gpsd_LDADD = $(DBUS_LIBS) $(LIBM) libgpsd.la libgps.la -lm $(LIBPTHREAD) $(LIBUSB_LIBS)
+ 
+ #
+ # Build gpsctl
+ #
+ gpsctl_SOURCES = gpsctl.c
+-gpsctl_LDADD = $(LIBM) libgpsd.la libgps.la -lm $(LIBPTHREAD) $(LIBUSB)
++gpsctl_LDADD = $(LIBM) libgpsd.la libgps.la -lm $(LIBPTHREAD) $(LIBUSB_LIBS)
+ 
+ #
+ # Build gpspipe
+@@ -131,13 +131,13 @@
+ gpsmon_SOURCES = gpsmon.c monitor_nmea.c monitor_sirf.c \
+ 	monitor_italk.c monitor_ubx.c monitor_superstar2.c \
+ 	monitor_oncore.c monitor_tnt.c
+-gpsmon_LDADD = $(LIBM) $(NCURSES_LIBS) libgpsd.la libgps.la -lm $(LIBPTHREAD)  $(LIBUSB)
++gpsmon_LDADD = $(LIBM) $(NCURSES_LIBS) libgpsd.la libgps.la -lm $(LIBPTHREAD)  $(LIBUSB_LIBS)
+ 
+ #
+ # Build gpsdecode
+ #
+ gpsdecode_SOURCES = gpsdecode.c
+-gpsdecode_LDADD = $(LIBM) libgpsd.la libgps.la -lm $(LIBPTHREAD)  $(LIBUSB)
++gpsdecode_LDADD = $(LIBM) libgpsd.la libgps.la -lm $(LIBPTHREAD)  $(LIBUSB_LIBS)
+ 
+ #
+ # Build shared libraries
+@@ -309,20 +309,20 @@
+ # Build test_gpsmm
+ #
+ test_gpsmm_SOURCES = test_gpsmm.cpp
+-test_gpsmm_LDADD = $(LIBC) libgps.la -lm  $(LIBUSB)
++test_gpsmm_LDADD = $(LIBC) libgps.la -lm  $(LIBUSB_LIBS)
+ endif
+ 
+ #
+ # Build test_bits tester
+ #
+ test_bits_SOURCES = test_bits.c
+-test_bits_LDADD = $(LIBC) libgpsd.la libgps.la  $(LIBUSB)
++test_bits_LDADD = $(LIBC) libgpsd.la libgps.la  $(LIBUSB_LIBS)
+ 
+ #
+ # Build packets tester
+ #
+ test_packet_SOURCES = test_packet.c
+-test_packet_LDADD = $(LIBC) libgpsd.la libgps.la -lm  $(LIBUSB)
++test_packet_LDADD = $(LIBC) libgpsd.la libgps.la -lm  $(LIBUSB_LIBS)
+ 
+ #
+ # Build geoid model tester
+@@ -495,7 +495,7 @@
+ 	$(CC) $(CFLAGS) -o libgps -lm -DTESTMAIN $(LIBPTHREAD) -g libgps_core.c .libs/libgps.a
+ 
+ # Report splint warnings
+-SPLINTOPTS = -I/usr/include/dbus-1.0/ $(INCUSB) +quiet
++SPLINTOPTS = -I/usr/include/dbus-1.0/ $(LIBUSB_CFLAGS) +quiet
+ splint: gpsd.h packet_names.h
+ 	@echo "Running splint on daemon and libraries..."
+ 	-splint $(SPLINTOPTS) -exportlocal -redef $(gpsd_c_sources) $(libgpsd_c_sources) $(libgps_c_sources)
+diff -ru gpsd-2.94-orig/configure.ac gpsd-2.94/configure.ac
+--- gpsd-2.94-orig/configure.ac	2010-04-21 03:25:08.000000000 +0930
++++ gpsd-2.94/configure.ac	2010-07-06 10:03:09.000000000 +0930
+@@ -233,30 +233,12 @@
+ 	AC_DEFINE([HAVE_LIBPTHREAD], [], [pthread libraries are present])])
+ AC_SUBST(LIBPTHREAD)
+ 
+-#
+-# We want libusb-1.x or later.  Checking for this is messy in 2010
+-# since many Linux systems ship with .0,1.x versions and that's 
+-# what you get if you check naively for -lusb.  
+-#
+-# We use the fact that the obsolete versions put their include file in
+-# /usr/include/usb.h, while the newer ones have it in 
+-# /usr/include/libusb-*/libusb.h
+-#
+-AC_MSG_CHECKING([for libusb version >= 1.0.0])
+-if test -f /usr/include/libusb-*/libusb.h ;
+-then
+-    usb=$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^lib//)
+-    AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
+-    LIBUSB=-l${usb}
+-    INCUSB=-I/usr/include/lib${usb}
+-    ac_libusb=yes
+-    AC_MSG_RESULT([found.])
+-else
+-    ac_libusb=yes
+-    AC_MSG_RESULT([not found.])
++PKG_CHECK_MODULES(LIBUSB, libusb-1.0 >= 1.0.0, [ac_libusb=yes], [ac_libusb=no])
++AC_SUBST(LIBUSB_LIBS)
++AC_SUBST(LIBUSB_CFLAGS)
++if test x"$ac_libusb" = x"yes" ; then
++	AC_DEFINE([HAVE_LIBUSB], 1, [libusb support])
+ fi
+-AC_SUBST(LIBUSB)
+-AC_SUBST(INCUSB)
+ 
+ AH_VERBATIM([_GNU_SOURCE],
+ 	  [/* Some libc's don't have strlcat/strlcpy. Local copies are provided */
diff --git a/recipes/gpsd/gpsd_2.94.bb b/recipes/gpsd/gpsd_2.94.bb
index 5cf8b2e..66bd559 100644
--- a/recipes/gpsd/gpsd_2.94.bb
+++ b/recipes/gpsd/gpsd_2.94.bb
@@ -1,9 +1,12 @@
 require gpsd.inc
 
-SRC_URI += "file://libtool.patch"
+DEPENDS += "libusb1"
+
+SRC_URI += "file://libtool.patch \
+	    file://configure-libusb.patch"
 SRC_URI[gpsd.md5sum] = "ce70bcd707ac1df861d4c72f503c09d1"
 SRC_URI[gpsd.sha256sum] = "1520b87d106d198aa42137db4b230615dbd0d06b04e6fcc84e010172fba2da41"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 PARALLEL_MAKE = ""
-- 
1.7.1




