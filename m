Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GIS1N-0003JT-K4 for openembedded-devel@lists.openembedded.org;
	Wed, 30 Aug 2006 17:30:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B17C7401B3E; Wed, 30 Aug 2006 08:08:22 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060830150822.B17C7401B3E@tinman.treke.net>
Date: Wed, 30 Aug 2006 08:08:22 -0700 (PDT)
Subject: [Bug 1373] New: gpe-bluetooth-0.54 doesn't build for Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2006 15:30:30 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1373

           Summary: gpe-bluetooth-0.54 doesn't build for Angstrom
           Product: Openembedded
           Version: Angstrom
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: liam.girdwood@wolfsonmicro.com
         QAContact: tinderbox-oe@gmx.net


gpe-bluetooth-0.54 build fails with the following error

| if arm-angstrom-linux-gnueabi-gcc -march=armv6 -mtune=arm1136jf-s -mfpu=vfp
-DPACKAGE_NAME=\"gpe-bluetooth\" -DPACKAGE_TARNAME=\"gpe-bluetooth\"
-DPACKAGE_VERSION=\"0.54\" -DPACKAGE_STRING=\"gpe-bluetooth\ 0.54\"
-DPACKAGE_BUGREPORT=\"gpe@handhelds.org\" -DPACKAGE=\"gpe-bluetooth\"
-DVERSION=\"0.54\" -DSTDC_HEADERS=1 -DGETTEXT_PACKAGE=\"gpe-bluetooth\"
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -DHAVE_LOCALE_H=1 -DHAVE_LC_MESSAGES=1
-DHAVE_BIND_TEXTDOMAIN_CODESET=1 -DHAVE_GETTEXT=1 -DHAVE_DCGETTEXT=1
-DENABLE_NLS=1 -DHAVE_DBUS_MESSAGE_ITER_GET_BASIC=1  -I.
-I/home/liam/oe/imx31ads-vfp/work/armv6-linux-gnueabi/gpe-bluetooth-0.54-r1/gpe-bluetooth-0.54
-pthread
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/gtk-2.0
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/lib/gtk-2.0/include
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/atk-1.0
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/cairo
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/pango-1.0
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/glib-2.0
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/lib/glib-2.0/include
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/freetype2
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/libpng12
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/lib/../include
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/mimedir-1.0
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/dbus-1.0
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/lib/dbus-1.0/include
-I/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include/libglade-2.0
 
-I/home/liam/oe/imx31ads-vfp/work/armv6-linux-gnueabi/gpe-bluetooth-0.54-r1/gpe-bluetooth-0.54/gpe
-I/home/liam/oe/imx31ads-vfp/work/armv6-linux-gnueabi/gpe-bluetooth-0.54-r1/gpe-bluetooth-0.54
-DPREFIX=\"/usr\" -D_GNU_SOURCE -DGPE_BLUETOOTH -DDBUS_API_SUBJECT_TO_CHANGE
-DPACKAGE_LOCALE_DIR=\"/usr/share/locale\" 
-isystem/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include 
-isystem/home/liam/oe/imx31ads-vfp/staging/arm-angstrom-linux-gnueabi/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT
pin-ui.o -MD -MP -MF ".deps/pin-ui.Tpo" -c -o pin-ui.o pin-ui.c; \
| then mv -f ".deps/pin-ui.Tpo" ".deps/pin-ui.Po"; else rm -f
".deps/pin-ui.Tpo"; exit 1; fi
| In file included from rfcomm.c:23:
| main.h:41: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or
‘__attribute__’ before ‘*’ token
| make[1]: *** [rfcomm.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory
`/home/liam/oe/imx31ads-vfp/work/armv6-linux-gnueabi/gpe-bluetooth-0.54-r1/gpe-bluetooth-0.54'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/liam/oe/imx31ads-vfp/work/armv6-linux-gnueabi/gpe-bluetooth-0.54-r1/temp/log.do_compile.5063
NOTE: package gpe-bluetooth-0.54-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gpe-bluetooth-0.54: failed
ERROR: Build of gpe-image failed


It looks like main.h is missing an external header that defines the typedef
below:- 

extern sdp_session_t *sdp_session;


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


