Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HCAuQ-0005RT-I3
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 09:33:38 +0100
Received: from [130.89.6.46] (vpn006046.vpn.utwente.nl [130.89.6.46])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0V8XXox005151 for <openembedded-devel@openembedded.org>;
	Wed, 31 Jan 2007 09:33:34 +0100
Message-ID: <45C0545B.3080202@dominion.kabel.utwente.nl>
Date: Wed, 31 Jan 2007 09:33:31 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
In-Reply-To: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Trouble with building "libbonoboui" ?
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
X-List-Received-Date: Wed, 31 Jan 2007 08:33:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

zechao wang schreef:
> Hello everyone, i get some trouble when building the package of "libbonoboui"!
> At first, i build a old version (2.10.0) of "libbonoboui", and i get the Error Message: ' .../staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: error: parse error before "GMemChunk" '
> 
> I search the reason, some one said that it's caused by "glib-2.0", for the "glib-2.0" is too new. Glib is a basic package, and i couldn't change it. 
> 
> So i rebuild the libbonoboui with a new version(2.14.0), but the Error is still.
> 
> Please help, thanks very much...
> 
> --------------------------------------------------------------------------------------------------------------------------
> Log of "libbonoboui_2.14.0.bb" : 
> 
> BB>>
> BB>>
> BB>> build libbonoboui
> SHELL: Building libbonoboui
> NOTE: Resolving missing task queue dependencies
> NOTE: multiple providers are available for virtual/arm-poky-linux-libc-for-gcc (glibc, glibc-intermediate);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-poky-linux-libc-for-gcc
> NOTE: multiple providers are available for virtual/libx11 (libx11, diet-x11);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/libx11
> NOTE: Preparing Runqueue
> NOTE: Executing runqueue
> NOTE: package libbonoboui-2.14.0: started
> NOTE: package libbonoboui-2.14.0-r0: task do_compile: started
> ERROR: function do_compile failed
> ERROR: log data follows (/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/temp/log.do_compile.19885)
> | NOTE: make
> | make  all-recursive
> | make[1]: Entering directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0'
> | Making all in bonobo
> | make[2]: Entering directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo'| if /bin/sh ../arm-poky-linux-libtool --tag=CC --mode=compile ccache arm-poky-linux-gcc -march=armv5te -mtune=arm926ejs -DHAVE_CONFIG_H -I. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo -I.. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0 -I.. -Wall -Wmissing-prototypes  -DORBIT2=1 -pthread -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnomecanvas-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libart-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/pango-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/freetype2
>  -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/glib-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/glib-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gtk-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/atk-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libbonobo-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/orbit-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/bonobo-activation-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnome-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gconf/2 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gnome-vfs-2.0
>  -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gnome-vfs-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/dbus-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/dbus-1.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libxml2   -DPREFIX=\""/usr"\" -DPLUGIN_DIR=\"""\" -DBONOBO_UI_INTERNAL -DBONOBO_UIDIR=\""/usr/share/gnome-2.0/ui/"\" -DBONOBO_LIBDIR=\""/usr/lib"\" -DBONOBO_DATADIR=\""/usr/share"\" -DBONOBO_PIXMAPDIR=\""/usr/share/pixmaps"\" -DBONOBO_BINDIR=\""/usr/bin"\" -DBONOBO_LOCALSTATEDIR=\""/var"\" -DBONOBO_LOCALEDIR=\""/usr/share/locale"\" -DG_DISABLE_DEPRECATED -DGDK_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRECATED -DGDK_MULTIHEAD_SAFE -DGTK_DISABLE_DEPRECATED -DGNOME_DISABLE_DEPRECATED -DBONOBO_DISABLE_DEPRECATED -DG_LOG_DOMAIN=\"Bonobo\" -DVERSION=\"2.14.0\" -DBONOBO_EXPLICIT_TRANSLATION_DOMAIN=\"libbonoboui-2.0\" 
>  -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include  -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -MT bonobo-dock.lo -MD -MP -MF ".deps/bonobo-dock.Tpo" -c -o bonobo-dock.lo bonobo-dock.c; \
> | then mv -f ".deps/bonobo-dock.Tpo" ".deps/bonobo-dock.Plo"; else rm -f ".deps/bonobo-dock.Tpo"; exit 1; fi
> |  ccache arm-poky-linux-gcc -march=armv5te -mtune=arm926ejs -DHAVE_CONFIG_H -I. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo -I.. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0 -I.. -Wall -Wmissing-prototypes -DORBIT2=1 -pthread -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnomecanvas-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libart-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/pango-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/freetype2 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/glib-2.0
>  -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/glib-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gtk-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/atk-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libbonobo-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/orbit-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/bonobo-activation-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnome-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gconf/2 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gnome-vfs-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gnome-vfs-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/dbus-1.0
>  -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/dbus-1.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libxml2 -DPREFIX=\"/usr\" -DPLUGIN_DIR=\"\" -DBONOBO_UI_INTERNAL -DBONOBO_UIDIR=\"/usr/share/gnome-2.0/ui/\" -DBONOBO_LIBDIR=\"/usr/lib\" -DBONOBO_DATADIR=\"/usr/share\" -DBONOBO_PIXMAPDIR=\"/usr/share/pixmaps\" -DBONOBO_BINDIR=\"/usr/bin\" -DBONOBO_LOCALSTATEDIR=\"/var\" -DBONOBO_LOCALEDIR=\"/usr/share/locale\" -DG_DISABLE_DEPRECATED -DGDK_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRECATED -DGDK_MULTIHEAD_SAFE -DGTK_DISABLE_DEPRECATED -DGNOME_DISABLE_DEPRECATED -DBONOBO_DISABLE_DEPRECATED -DG_LOG_DOMAIN=\"Bonobo\" -DVERSION=\"2.14.0\" -DBONOBO_EXPLICIT_TRANSLATION_DOMAIN=\"libbonoboui-2.0\" -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
>  -MT bonobo-dock.lo -MD -MP -MF .deps/bonobo-dock.Tpo -c bonobo-dock.c  -fPIC -DPIC -o .libs/bonobo-dock.o
> | In file included from /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtk.h:152,
> |                  from bonobo-dock.c:28:
> | /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: error: parse error before "GMemChunk"
> | /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: warning: no semicolon at end of struct or union
> | /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:82: error: parse error before '}' token
> | bonobo-dock.c: In function `drag_new':
> | bonobo-dock.c:753: warning: ignoring return value of `g_list_append', declared with attribute warn_unused_result
> | bonobo-dock.c:755: warning: ignoring return value of `g_list_prepend', declared with attribute warn_unused_result
> | make[2]: *** [bonobo-dock.lo] Error 1
> | make[2]: Leaving directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed: /home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/temp/log.do_compile.19885
> NOTE: package libbonoboui-2.14.0-r0: task do_compile: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package libbonoboui-2.14.0: failed
> ERROR: Build of /home/zwang/gpe-practice/poky/meta/packages/gnome/libbonoboui_2.14.0.bb do_compile failed
> ERROR: Task 0 (/home/zwang/gpe-practice/poky/meta/packages/gnome/libbonoboui_2.14.0.bb, do_compile) failed
> ERROR: '/home/zwang/gpe-practice/poky/meta/packages/gnome/libbonoboui_2.14.0.bb' failed


Let me give a more articulate answer to all your questions:

1) you have tried to mix and match OE recipes with poky recipes, which in itself, isn't a
problem, but you have to watchout for:
 a) using deprecated glib and gtk stuff, since poky wants to have a up-to-date gtk stack
 b) using GPE stuff in poky, o-hand has worked hard to remove or replace gpe stuff with
their own inventions
 c) using bonobo and orbit, since o-hand has worked hard to remove those and replace them
with d-bus

2) You haven't given a single reason why you don't use OE's .dev even when multiple people
have told you to use that

3) You seem to be very good at finding bugs in your poky base + OE extras that have
already been fixed in .dev

4) For poky support, you need to contact o-hand

To summarize: Use .dev or stop bothering us and contact o-hand.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFwFRbMkyGM64RGpERAjsHAKCm+aaD7rOiC+1PHSoDQE/wQZFKrACgsPxm
FnqgPBUIxDctsAgEEqJPCu4=
=KRb7
-----END PGP SIGNATURE-----


