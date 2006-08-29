Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GI6U5-0003wH-PJ for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 18:30:44 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id ECD99401B3E; Tue, 29 Aug 2006 09:08:44 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060829160844.ECD99401B3E@tinman.treke.net>
Date: Tue, 29 Aug 2006 09:08:44 -0700 (PDT)
Subject: [Bug 1371] New: dbus-glib-native-0.71-r0 fails to build
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
X-List-Received-Date: Tue, 29 Aug 2006 16:30:46 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1371

           Summary: dbus-glib-native-0.71-r0 fails to build
           Product: Openembedded
           Version: Angstrom
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: liam.girdwood@wolfsonmicro.com
         QAContact: tinderbox-oe@gmx.net


It looks like dbus-glib-native is missing some headers e.g.

dbus/dbus-shared.h

This is from a clean tmpdir and with dbus-0.91.

I've cleaned and rebuilt dbus, dbus-glib and attempted dbus-glib-native but I
still get the following.


|  gcc -DHAVE_CONFIG_H -I.
-I/home/liam/oe/mainstone/work/i686-linux/dbus-glib-native-0.71-r0/dbus-glib-0.71/dbus
-I..
-I/home/liam/oe/mainstone/work/i686-linux/dbus-glib-native-0.71-r0/dbus-glib-0.71
-I/home/liam/oe/mainstone/staging/i686-linux/include/glib-2.0
-I/home/liam/oe/mainstone/staging/i686-linux/lib/glib-2.0/include
-DDBUS_COMPILATION=1
-DDBUS_LOCALEDIR=\"/home/liam/oe/mainstone/staging/share/locale\"
-DDBUS_API_SUBJECT_TO_CHANGE=1
-isystem/home/liam/oe/mainstone/staging/i686-linux/include
-isystem/home/liam/oe/mainstone/staging/i686-linux/include -Os -Wall
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes -Wnested-externs
-Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -MT dbus-gmain.lo -MD
-MP -MF .deps/dbus-gmain.Tpo -c dbus-gmain.c  -fPIC -DPIC -o .libs/dbus-gmain.o
|  gcc -DHAVE_CONFIG_H -I.
-I/home/liam/oe/mainstone/work/i686-linux/dbus-glib-native-0.71-r0/dbus-glib-0.71/dbus
-I..
-I/home/liam/oe/mainstone/work/i686-linux/dbus-glib-native-0.71-r0/dbus-glib-0.71
-I/home/liam/oe/mainstone/staging/i686-linux/include/glib-2.0
-I/home/liam/oe/mainstone/staging/i686-linux/lib/glib-2.0/include
-DDBUS_COMPILATION=1
-DDBUS_LOCALEDIR=\"/home/liam/oe/mainstone/staging/share/locale\"
-DDBUS_API_SUBJECT_TO_CHANGE=1
-isystem/home/liam/oe/mainstone/staging/i686-linux/include
-isystem/home/liam/oe/mainstone/staging/i686-linux/include -Os -Wall
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes -Wnested-externs
-Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -MT dbus-glib.lo -MD
-MP -MF .deps/dbus-glib.Tpo -c dbus-glib.c  -fPIC -DPIC -o .libs/dbus-glib.o
| In file included from dbus-gmain.c:26:
| ../dbus/dbus-glib.h:28:30: error: dbus/dbus-shared.h: No such file or
directory
| In file included from dbus-gmain.c:26:
| ../dbus/dbus-glib.h:74: error: expected ')' before 'type'
| In file included from dbus-glib.c:25:
| dbus-glib.h:28:30: error: dbus/dbus-shared.h: No such file or directory
| In file included from dbus-glib.c:25:
| dbus-glib.h:74: error: expected ')' before 'type'
| In file included from dbus-gmain.c:27:
| ../dbus/dbus-glib-lowlevel.h:28:23: error: dbus/dbus.h: No such file or
directory
| In file included from dbus-gmain.c:27:
| ../dbus/dbus-glib-lowlevel.h:33: error: expected declaration specifiers or
'...' before 'DBusError'
| ../dbus/dbus-glib-lowlevel.h:42: error: expected ')' before '*' token
| ../dbus/dbus-glib-lowlevel.h:44: error: expected ')' before '*' token
| ../dbus/dbus-glib-lowlevel.h:48: error: expected declaration specifiers or
'...' before 'DBusMessage'
| ../dbus/dbus-glib-lowlevel.h:49: error: expected declaration specifiers or
'...' before 'dbus_uint32_t'
| ../dbus/dbus-glib-lowlevel.h:51: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| ../dbus/dbus-glib-lowlevel.h:52: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| ../dbus/dbus-glib-lowlevel.h:62: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| ../dbus/dbus-glib-lowlevel.h:65: error: expected declaration specifiers or
'...' before 'DBusMessage'
| In file included from dbus-gmain.c:30:
| dbus-gvalue.h:5:33: error: dbus/dbus-signature.h: No such file or directory
| In file included from dbus-gmain.c:30:
| dbus-gvalue.h:23: error: expected declaration specifiers or '...' before
'DBusMessageIter'In file included from dbus-glib.c:26:
| dbus-glib-lowlevel.h:28:23: error: dbus/dbus.h: No such file or directory
| dbus-gvalue.h:33: error: expected declaration specifiers or '...' before
'DBusMessage'
| In file included from dbus-glib.c:26:
| dbus-glib-lowlevel.h:33: error: expected declaration specifiers or '...'
before 'DBusError'
| dbus-gvalue.h:38: error: expected ')' before '*' token
| dbus-glib-lowlevel.h:42: error: expected ')' before '*' token
| dbus-glib-lowlevel.h:44: error: expected ')' before '*' token
| dbus-glib-lowlevel.h:48: error: expected declaration specifiers or '...'
before 'DBusMessage'
| dbus-glib-lowlevel.h:49: error: expected declaration specifiers or '...'
before 'dbus_uint32_t'
| dbus-glib-lowlevel.h:51: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| dbus-glib-lowlevel.h:52: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| dbus-glib-lowlevel.h:62: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| dbus-glib-lowlevel.h:65: error: expected declaration specifiers or '...'
before 'DBusMessage'
| In file included from dbus-gmain.c:33:
| dbus-gsignature.h:13: error: expected ')' before '*' token
| In file included from dbus-glib.c:29:
| dbus-gobject.h:27:33: error: dbus/dbus-signature.h: No such file or
directory| dbus-gmain.c:69: error: expected specifier-qualifier-list before
'DBusConnection'
| dbus-gmain.c: In function 'message_queue_prepare':
| dbus-gmain.c:90: error: 'DBusConnection' undeclared (first use in this
function)
| dbus-glib.c: In function 'dbus_g_connection_flush':
| dbus-glib.c:49: warning: implicit declaration of function
'dbus_connection_flush'dbus-gmain.c:90: error: for each function it appears
in.)dbus-glib.c:49: warning: nested extern declaration of
'dbus_connection_flush'
| dbus-gmain.c:90: error: 'connection' undeclared (first use in this function)
| dbus-glib.c:49: error: 'DBusConnection' undeclared (first use in this
function)
| dbus-glib.c:49: error: (Each undeclared identifier is reported only once
| dbus-glib.c:49: error: for each function it appears in.)
| dbus-glib.c:49: error: expected expression before ')' token
| dbus_connection_get_dispatch_status'
| dbus-gmain.c:94: warning: nested extern declaration of
'dbus_connection_get_dispatch_status'
| dbus-gmain.c:94: error: 'DBUS_DISPATCH_DATA_REMAINS' undeclared (first use in
this function)
| dbus-glib.c: In function 'dbus_g_connection_ref':
| dbus-glib.c:61: error: 'DBusConnection' undeclared (first use in this
function)
| dbus-glib.c:61: error: 'c' undeclared (first use in this function)
| dbus-glib.c:63: error: expected expression before '
| dbus-gmain.c:108: error: 'DBusConnection' undeclared (first use in this
function)
| dbus-glib.c:64: warning: implicit declaration of function
'dbus_connection_ref'dbus-gmain.c:108: error: 'connection' undeclared (first
use in this function)dbus-glib.c:64: warning: nested extern declaration of
'dbus_connection_ref'
| dbus-gmain.c:108: error: 'DBusGMessageQueue' has no member named
'connection'| dbus-gmain.c:110: warning: implicit declaration of function
'dbus_connection_ref'
| dbus-gmain.c:110: warning: nested extern declaration of
'dbus_connection_ref'| dbus-gmain.c:113: warning: implicit declaration of
| dbus-glib.c:77: error: 'DBusConnection' undeclared (first use in this
function)
| dbus-glib.c:77: error: 'c' undeclared (first use in this
function)dbus-gmain.c:115: warning: nested extern declaration of
'dbus_connection_unref'
| dbus-glib.c:79: error: expected expression before ')' token
| dbus-glib.c:80: warning: implicit declaration of function
'dbus_connection_unref'
| dbus-gmain.c: At top level:
| dbus-gmain.c:125: error: expected specifier-qualifier-list before
'DBusConnection'


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


