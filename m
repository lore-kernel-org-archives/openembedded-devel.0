Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1H5SKv-0007EF-4A
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jan 2007 20:45:19 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 6404F28C012; Fri, 12 Jan 2007 20:39:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180132211.adsl.alicedsl.de [85.180.132.211])
	by srv043.dedi23.de (Postfix) with ESMTP id 8575F28C011
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2007 20:39:00 +0100 (CET)
Date: Fri, 12 Jan 2007 20:43:08 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1888834532.20070112204308@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Gtk+ 2.6.10 w/ newer Glibs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jan 2007 19:45:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Since .dev upgraded gnome-vfs and removed gnome-vfs-dbus, gnome-vfs is
no longer buildable against an old (<=3D 2.9.4) glib. Gtk+ 2.6.10 (which is=
 still
in wide use today) again is not buildable against newer glib variants.

Any glib / Gtk+ experts to fix the problem? The first issue out is
here:

|  arm-linux-gcc -march=3Darmv4t -mtune=3Darm920t -DHAVE_CONFIG_H -I. -I/lo=
cal/pkg/openmoko/gta01/tmp/work/armv4t-linux/gtk+-2.6.10-r4/gtk+-2.6.10/mod=
ules/engines/pixbuf -I../../.. -I/local/pkg/openmoko/gta01/tmp/work/armv4t-=
linux/gtk+-2.6.10-r4/gtk+-2.6.10 -I/local/pkg/openmoko/gta01/tmp/work/armv4=
t-linux/gtk+-2.6.10-r4/gtk+-2.6.10/gdk -I../../../gdk -DG_DISABLE_DEPRECATE=
D -DGDK_PIXBUF_DISABLE_DEPRECATED -DGDK_DISABLE_DEPRECATED -pthread -I/loca=
l/pkg/openmoko/gta01/tmp/staging/arm-linux/include/glib-2.0 -I/local/pkg/op=
enmoko/gta01/tmp/staging/arm-linux/lib/glib-2.0/include -I/local/pkg/openmo=
ko/gta01/tmp/staging/arm-linux/include/pango-1.0 -I/local/pkg/openmoko/gta0=
1/tmp/staging/arm-linux/include -I/local/pkg/openmoko/gta01/tmp/staging/arm=
-linux/include/freetype2 -I/local/pkg/openmoko/gta01/tmp/staging/arm-linux/=
include/atk-1.0 -I/local/pkg/openmoko/gta01/tmp/staging/arm-linux/include -=
I/local/pkg/openmoko/gta01/tmp/staging/arm-linux/include -isystem/local/pkg=
/openmoko/gta01/tmp/staging/arm-linux/include -isystem/local/pkg/openmoko/g=
ta01/tmp/staging/arm-linux/include -fexpensive-optimizations -fomit-frame-p=
ointer -frename-registers -O2 -Wall -MT pixbuf-draw.lo -MD -MP -MF .deps/pi=
xbuf-draw.Tpo -c pixbuf-draw.c  -fPIC -DPIC -o .libs/pixbuf-draw.o
| In file included from ../../../gtk/gtk.h:60,
|                  from pixbuf.h:23,
|                  from pixbuf-draw.c:28:
| ../../../gtk/gtkclist.h:155: error: expected specifier-qualifier-list bef=
ore 'GMemChunk'
| In file included from ../../../gtk/gtk.h:152,
|                  from pixbuf.h:23,
|                  from pixbuf-draw.c:28:
| ../../../gtk/gtkstatusbar.h:68: error: expected specifier-qualifier-list =
before 'GMemChunk'
| make[4]: *** [pixbuf-draw.lo] Fehler 1
| make[4]: Leaving directory `/local/pkg/openmoko/gta01/tmp/work/armv4t-lin=
ux/gtk+-2.6.10-r4/gtk+-2.6.10/modules/engines/pixbuf'
| make[3]: *** [all-recursive] Fehler 1
| make[3]: Leaving directory `/local/pkg/openmoko/gta01/tmp/work/armv4t-lin=
ux/gtk+-2.6.10-r4/gtk+-2.6.10/modules/engines'
| make[2]: *** [all-recursive] Fehler 1
| make[2]: Leaving directory `/local/pkg/openmoko/gta01/tmp/work/armv4t-lin=
ux/gtk+-2.6.10-r4/gtk+-2.6.10/modules'
| make[1]: *** [all-recursive] Fehler 1
| make[1]: Leaving directory `/local/pkg/openmoko/gta01/tmp/work/armv4t-lin=
ux/gtk+-2.6.10-r4/gtk+-2.6.10'
| make: *** [all] Fehler 2
| FATAL: oe_runmake failed
NOTE: Task failed: /local/pkg/openmoko/gta01/tmp/work/armv4t-linux/gtk+-2.6=
.10-r4/temp/log.do_compile.30492
NOTE: package gtk+-2.6.10-r4: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gtk+-2.6.10: failed
ERROR: Build of 'gtk+' failed

Regards,

:M:
--=20
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



