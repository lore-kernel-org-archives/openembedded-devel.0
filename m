Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1Gp7A7-00087z-V4
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Nov 2006 18:54:32 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1319016ugf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2006 09:54:18 -0800 (PST)
Received: by 10.78.185.16 with SMTP id i16mr1184863huf.1164736457475;
	Tue, 28 Nov 2006 09:54:17 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Tue, 28 Nov 2006 09:54:17 -0800 (PST)
Message-ID: <d46153c40611280954w12514252o8897ac47f706266c@mail.gmail.com>
Date: Tue, 28 Nov 2006 11:54:17 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0611221452u6d2a8e01i6df017ce235624a4@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611220800m4e715362v713c24f5853238@mail.gmail.com>
	<d46153c40611221320l1226d03dtb2948a8f42a04cdd@mail.gmail.com>
	<f96d234e0611221324o352521ddj229fb267b995396b@mail.gmail.com>
	<d46153c40611221336h2fcb9ae3rabf5776b260a494d@mail.gmail.com>
	<f96d234e0611221452u6d2a8e01i6df017ce235624a4@mail.gmail.com>
Subject: Re: Angstrom, compulab-pxa270, and gpe-image
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
X-List-Received-Date: Tue, 28 Nov 2006 17:54:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/22/06, Cliff Brake <cliff.brake@gmail.com> wrote:
> On 11/22/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> > On 11/22/06, Cliff Brake <cliff.brake@gmail.com> wrote:
> > > Things are working here with a non-EABI toolchain -- you may want to try that.
> > >
> >
> > Can you tell me how to do this?  Do I just make a change to the
> > local.conf or is it more involved than that?
>
> Try the generic distro.  I have not updated my tree in probably 2
> weeks, but it may work.
>
> Cliff

I just tried the "generic" distro and that fails to build in the same
way that my original Familiar build failed:

NOTE: package dbus-glib-0.72-r0: task do_compile: started
NOTE: SITE files
/home/packet/OpenEmbedded/org.openembedded.dev/site/endian-little
/home/packet/OpenEmbedded/org.openembedded.dev/site/arm-linux
ERROR: function do_compile failed
ERROR: log data follows
(/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/temp/log.do_compile.27914)
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
-I.. -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/dbus-1.0
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/dbus-1.0/include
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/glib-2.0
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/glib-2.0/include
   -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"
-DDBUS_API_SUBJECT_TO_CHANGE=1
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal
-Wsign-compare -MT dbus-gobject.lo -MD -MP -MF
".deps/dbus-gobject.Tpo" -c -o dbus-gobject.lo dbus-gobject.c; \
|       then mv -f ".deps/dbus-gobject.Tpo" ".deps/dbus-gobject.Plo";
else rm -f ".deps/dbus-gobject.Tpo"; exit 1; fi
|  arm-linux-gcc -march=armv5te -mtune=xscale -DHAVE_CONFIG_H -I.
-I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus
-I.. -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72
-I.. -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/dbus-1.0
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/dbus-1.0/include
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/glib-2.0
-I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/glib-2.0/include
-DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"
-DDBUS_API_SUBJECT_TO_CHANGE=1
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal
-Wsign-compare -MT dbus-gobject.lo -MD -MP -MF .deps/dbus-gobject.Tpo
-c dbus-gobject.c  -fPIC -DPIC -o .libs/dbus-gobject.o
| dbus-gobject.c: In function 'invoke_object_method':
| dbus-gobject.c:997: warning: cast increases required alignment of target type
| dbus-gobject.c:1137: warning: cast increases required alignment of target type
| dbus-gobject.c:1230: warning: cast increases required alignment of target type
| In file included from dbus-gobject.c:1539:
| dbus-glib-error-switch.h: In function 'dbus_error_to_gerror_code':
| dbus-glib-error-switch.h:41: error: 'DBUS_ERROR_FILE_EXISTS'
undeclared (first use in this function)
| dbus-glib-error-switch.h:41: error: (Each undeclared identifier is
reported only once
| dbus-glib-error-switch.h:41: error: for each function it appears in.)
| dbus-glib-error-switch.h:65: error:
'DBUS_ERROR_INVALID_FILE_CONTENT' undeclared (first use in this
function)
| dbus-gobject.c: In function 'dbus_g_object_register_marshaller':
| dbus-gobject.c:1907: warning: cast increases required alignment of target type
| dbus-gobject.c: In function 'dbus_g_method_return':
| dbus-gobject.c:2040: warning: cast increases required alignment of target type
| dbus-gobject.c: In function 'dbus_error_to_gerror_code':
| dbus-glib-error-switch.h:71: warning: control reaches end of non-void function
| make[4]: *** [dbus-gobject.lo] Error 1
| make[4]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/temp/log.do_compile.27914
NOTE: package dbus-glib-0.72-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package dbus-glib-0.72: failed
ERROR: Build of gpe-image failed

Any advice on how to proceed from here?  It seems like I need to make
the distribution choose a recent version of dbus and use non-EABI.  I
don't know what to modify to accomplish these tasks.


