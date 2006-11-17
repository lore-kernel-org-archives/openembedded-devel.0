Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1Gl52E-00005U-IT
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 15:49:42 +0100
Received: by ug-out-1314.google.com with SMTP id e2so625428ugf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 06:47:20 -0800 (PST)
Received: by 10.78.204.7 with SMTP id b7mr1974257hug.1163774839282;
	Fri, 17 Nov 2006 06:47:19 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Fri, 17 Nov 2006 06:47:19 -0800 (PST)
Message-ID: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
Date: Fri, 17 Nov 2006 08:47:19 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Problem building dbus-glib-0.72
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
X-List-Received-Date: Fri, 17 Nov 2006 14:49:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm getting some errors building gpe-image, specifically on the
dbus-glib-0.72 package, that seem to be related to include path
problems.

My local.conf has these settings:
MACHINE = "compulab-pxa270"
DISTRO = "familiar-unstable"

And the log leading up to the error is:
NOTE: package dbus-glib-0.72: started
NOTE: package dbus-glib-0.72-r0: task do_compile: started
NOTE: SITE files
/home/packet/OpenEmbedded/org.openembedded.dev/site/endian-little
/home/packet/OpenEmbedded/org.openembedded.dev/site/arm-linux
ERROR: function do_compile failed
ERROR: log data follows
(/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/temp/log.do_compile.7567)
| NOTE: make
| make  all-recursive
| make[1]: Entering directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72'
| Making all in dbus
| make[2]: Entering directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
| make  all-recursive
| make[3]: Entering directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
| Making all in .
| make[4]: Entering directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
| if /bin/sh ../arm-linux-libtool --tag=CC --mode=compile
arm-linux-gcc -march=armv5te -mtune=xscale -DHAVE_CONFIG_H -I.
-I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus
-I.. -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72
-I..  -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/glib-2.0
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/glib-2.0/include
   -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"
-DDBUS_API_SUBJECT_TO_CHANGE=1
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal
-Wsign-compare -MT dbus-glib.lo -MD -MP -MF ".deps/dbus-glib.Tpo" -c
-o dbus-glib.lo dbus-glib.c; \
|       then mv -f ".deps/dbus-glib.Tpo" ".deps/dbus-glib.Plo"; else
rm -f ".deps/dbus-glib.Tpo"; exit 1; fi
|  arm-linux-gcc -march=armv5te -mtune=xscale -DHAVE_CONFIG_H -I.
-I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus
-I.. -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72
-I.. -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/glib-2.0
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/glib-2.0/include
-DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"
-DDBUS_API_SUBJECT_TO_CHANGE=1
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal
-Wsign-compare -MT dbus-glib.lo -MD -MP -MF .deps/dbus-glib.Tpo -c
dbus-glib.c  -fPIC -DPIC -o .libs/dbus-glib.o
| In file included from dbus-glib.c:25:
| dbus-glib.h:28:30: dbus/dbus-shared.h: No such file or directory

<...and a bunch more of these...>


Sure enough, the missing files aren't in the -I paths:
packet@linuxdev0:~/OpenEmbedded/build/$ find tmp -name dbus-shared.h
tmp/work/i686-linux/dbus-native-0.94-r0/dbus-0.94/dbus/dbus-shared.h
tmp/work/armv5te-linux/dbus-0.92-r1/dbus-0.92/dbus/dbus-shared.h
tmp/work/armv5te-linux/dbus-0.92-r1/install/dbus-dev/usr/include/dbus-1.0/dbus/dbus-shared.h
tmp/staging/i686-linux/include/dbus-1.0/dbus/dbus-shared.h
tmp/staging/arm-linux/include/dbus-1.0/dbus/dbus-shared.h


I'm new to this so I would really appreciate some guidance.


