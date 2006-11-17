Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1Gl7nt-0001jM-U1
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 18:47:05 +0100
Received: by ug-out-1314.google.com with SMTP id e2so670754ugf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 09:44:43 -0800 (PST)
Received: by 10.78.185.7 with SMTP id i7mr2134978huf.1163785482647;
	Fri, 17 Nov 2006 09:44:42 -0800 (PST)
Received: by 10.78.175.4 with HTTP; Fri, 17 Nov 2006 09:44:42 -0800 (PST)
Message-ID: <74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
Date: Fri, 17 Nov 2006 18:44:42 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
	<41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>
	<d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>
Subject: Re: Problem building dbus-glib-0.72
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
X-List-Received-Date: Fri, 17 Nov 2006 17:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/17/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> On 11/17/06, Jim Rayner <oe@jrayner.com> wrote:
> > On 11/17/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> > > I'm getting some errors building gpe-image, specifically on the
> > > dbus-glib-0.72 package, that seem to be related to include path
> > > problems.
> >
> > Maybe lacking
> >
> > export DBUS_CFLAGS = " -I${STAGING_DIR}/${TARGET_SYS}/include/dbus-1.0"
> >
> > or something similar from the dbus-glib-0.72.bb file
>
> I added the following line to the dbus-glib-0.72.bb file:
>
> export DBUS_CFLAGS = " -I${STAGING_DIR}/${TARGET_SYS}/include/dbus-1.0
> -I${STAGING_DIR}/${TARGET_SYS}/lib/dbus-1.0/include"
>
>
> This allowed a little more progress before failure:
>
> | if /bin/sh ../arm-linux-libtool --tag=CC --mode=compile
> arm-linux-gcc -march=armv5te -mtune=xscale -DHAVE_CONFIG_H -I.
> -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus
> -I.. -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72
> -I.. -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/dbus-1.0
> -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/dbus-1.0/include
> -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/glib-2.0
> -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/glib-2.0/include
>    -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"
> -DDBUS_API_SUBJECT_TO_CHANGE=1
> -isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
> -isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
> -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
> -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal
> -Wsign-compare -MT dbus-gobject.lo -MD -MP -MF
> ".deps/dbus-gobject.Tpo" -c -o dbus-gobject.lo dbus-gobject.c; \
> |       then mv -f ".deps/dbus-gobject.Tpo" ".deps/dbus-gobject.Plo";
> else rm -f ".deps/dbus-gobject.Tpo"; exit 1; fi
> |  arm-linux-gcc -march=armv5te -mtune=xscale -DHAVE_CONFIG_H -I.
> -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus
> -I.. -I/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72
> -I.. -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/dbus-1.0
> -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/dbus-1.0/include
> -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include/glib-2.0
> -I/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/lib/glib-2.0/include
> -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"
> -DDBUS_API_SUBJECT_TO_CHANGE=1
> -isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
> -isystem/home/packet/OpenEmbedded/build/tmp/staging/arm-linux/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
> -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes
> -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal
> -Wsign-compare -MT dbus-gobject.lo -MD -MP -MF .deps/dbus-gobject.Tpo
> -c dbus-gobject.c  -fPIC -DPIC -o .libs/dbus-gobject.o
> | dbus-gobject.c: In function `invoke_object_method':
> | dbus-gobject.c:997: warning: cast increases required alignment of target type
> | dbus-gobject.c:1137: warning: cast increases required alignment of target type
> | dbus-gobject.c:1230: warning: cast increases required alignment of target type
> | In file included from dbus-gobject.c:1539:
> | dbus-glib-error-switch.h: In function `dbus_error_to_gerror_code':
> | dbus-glib-error-switch.h:41: error: `DBUS_ERROR_FILE_EXISTS'
> undeclared (first use in this function)
> | dbus-glib-error-switch.h:41: error: (Each undeclared identifier is
> reported only once
> | dbus-glib-error-switch.h:41: error: for each function it appears in.)
> | dbus-glib-error-switch.h:65: error:
> `DBUS_ERROR_INVALID_FILE_CONTENT' undeclared (first use in this
> function)
> | dbus-gobject.c: In function `dbus_g_object_register_marshaller':
> | dbus-gobject.c:1907: warning: cast increases required alignment of target type
> | dbus-gobject.c: In function `dbus_g_method_return':
> | dbus-gobject.c:2040: warning: cast increases required alignment of target type
> | make[4]: *** [dbus-gobject.lo] Error 1
> | make[4]: Leaving directory
> `/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
> | make[3]: *** [all-recursive] Error 1
> | make[3]: Leaving directory
> `/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
> | make[2]: *** [all] Error 2
> | make[2]: Leaving directory
> `/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72/dbus'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/dbus-glib-0.72'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/packet/OpenEmbedded/build/tmp/work/armv5te-linux/dbus-glib-0.72-r0/temp/log.do_compile.27174
> NOTE: package dbus-glib-0.72-r0: task do_compile: failed
>
>
> It appears that dbus-glib is trying to use defines from dbus 1.0, but
> version 0.92 is what is being installed.

I think dbus-glib 0.72 needs dbus >= 0.94.
The dbus-1.0 in the include path only denotes the protocol version.

regards
Philipp


