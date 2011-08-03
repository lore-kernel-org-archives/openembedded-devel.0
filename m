Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <angweiyang@gmail.com>) id 1QoW9L-0000y9-Qq
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 09:45:56 +0200
Received: by vws2 with SMTP id 2so349202vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 00:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=sbWm0cWX9quMT41ddhg4KMw1vxlr/7XJwiM0YiGizyk=;
	b=bZHFVsh9bWNXWndZAQCvwOjoHkFjkAGF1n1YaAy5Pa7spMTxdTS4XTHOjvnVKsoobm
	2yCjALEFclC3uH6WPLsQS/dO9DluoCuWz7bRI8hwvIlNsyn8wVkx8Bco1hVZXlja4rDI
	HGN2m8OZ3ye0+1QSKkwt2qT+ViDesYAjG8OzQ=
MIME-Version: 1.0
Received: by 10.52.27.204 with SMTP id v12mr129304vdg.173.1312357289874; Wed,
	03 Aug 2011 00:41:29 -0700 (PDT)
Received: by 10.52.107.230 with HTTP; Wed, 3 Aug 2011 00:41:29 -0700 (PDT)
Date: Wed, 3 Aug 2011 15:41:29 +0800
Message-ID: <CAOy7-nNex4BDFyy39gWQWn5NOpPObDJccS5pAk8bziKoqW_YrA@mail.gmail.com>
From: James <angweiyang@gmail.com>
To: neil@gumstix.com, openembedded-devel@lists.openembedded.org
Subject: Re: empathy warnings being treated as errors
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
X-List-Received-Date: Wed, 03 Aug 2011 07:45:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Neil MacMunn <neil <at> gumstix.com> writes:

>
> I'm running into these two errors when I build empathy
>
> > | arm-angstrom-linux-gnueabi-libtool: compile:
arm-angstrom-linux-gnueabi-gcc -march=armv7-a
> -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> --sysroot=/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi
> -DHAVE_CONFIG_H -I. -I.. -I. -I.. -I.. -DDATADIR=\"/usr/share\"
> -DLOCALEDIR=\"/usr/share/locale\" -DG_LOG_DOMAIN=\"empathy\" -pthread
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gio-unix-2.0/
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2
-I/home/neil/overo-oe/tm
>  p-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/telepathy-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0
-I/home/neil/overo-
> oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10
> -pthread
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
> -Wall -Wunused -Wmissing-prototypes -Wmissing-declarations -Wchar-subscripts
-Wnested-externs
> -Wpointer-arith -Wno-sign-compare
>  -Wno-pointer-sign -Wformat -Werror -fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2 -ggdb2 -MT empathy-log-store-empathy.lo -MD -MP -MF
.deps/empathy-log-store-empathy.T
> po -c empathy-log-store-empathy.c  -fPIC -DPIC -o
.libs/empathy-log-store-empathy.o
> > | cc1: warnings being treated as errors
> > | empathy-log-store-empathy.c: In function
'log_store_empathy_get_messages_for_date':
> > | empathy-log-store-empathy.c:500:13: error: 'cm_id' may be used
uninitialized in this function
> > | make[3]: *** [empathy-log-store-empathy.lo] Error 1
>
> I get past this by removing -Werror from WARN_CFLAGS in
> libempathy/Makefile and then hit
>
> > | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp
> -mthumb-interwork -mno-thumb
> --sysroot=/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi
> -DHAVE_CONFIG_H -I. -I..  -I.. -DG_LOG_DOMAIN=\"empathy\" -pthread -DORBIT2=1
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0
-I/home/neil/overo-oe/tmp-unstab
>  le/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1
-I/home/neil/overo-oe/tmp-unstable/
> sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/evolution-data-server-2.26
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gconf/2
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libsoup-2.4
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angst
>  rom-linux-gnueabi/usr/include/orbit-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-
> angstrom-linux-gnueabi/usr/include/telepathy-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/unique-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gnome-keyring-1
>   -pthread
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstr
>  om-linux-gnueabi/usr/lib/dbus-1.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a
> -angstrom-linux-gnueabi/usr/include/atk-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12
>     -pthread
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/webkit-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr
>  /lib/glib-2.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/
> usr/include/libsoup-2.4
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12
>
-I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2
>   -Wall -Wunused
>   -Wmissing-prototypes -Wmissing-declarations -Wchar-subscripts
-Wnested-externs -Wpointer-arith
> -Wno-sign-compare -Wno-pointer-sign -Wformat -Werror
-fexpensive-optimizations -fomit-frame-
> pointer -frename-registers -O2 -ggdb2 -MT empathy-call-window.o -MD -MP -MF
> .deps/empathy-call-window.Tpo -c -o empathy-call-window.o empathy-call-window.c
> > | cc1: warnings being treated as errors
> > | empathy-call-window.c: In function 'empathy_call_window_request_resource_cb':
> > | empathy-call-window.c:1197:12: error: comparison between 'FsMediaType' and
'enum <anonymous>'
> > | make[3]: *** [empathy-call-window.o] Error 1
>
> Which I work around by removing -Werror from WARN_CFLAGS in src/Makefile
>
> Empathy hasn't changed but I just switched to gcc-4.5 from 4.3.3 so I
> suspect this is where the problem originates. Looking at an old log I
> can see that -Werror was set there too.
>
> --
> Neil
>


Hi Neil,

Do you have a patch file for the 2 errors that can be applied with a
modified empathy_2.28.2.bb to overcome this problem?

Thanks.

James.


