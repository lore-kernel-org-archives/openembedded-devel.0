Received: from [202.165.105.136] (helo=web15206.mail.cnb.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <wzc0066@yahoo.com.cn>) id 1HCA4T-0003Ac-17
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 08:39:58 +0100
Received: (qmail 36870 invoked by uid 60001); 31 Jan 2007 06:08:31 -0000
X-YMail-OSG: 5k.L5MgVM1nQv.jLYoXRceckCKfhrD.9D7gBUqfFMYTeZwGuNxnqgK3J7VBqTkcO_GvBFYJK7c7.WIoQX3t4Pl.sdkG8FTiDWJixvagSwEbJ_FygMuCZPg--
Received: from [221.221.147.139] by web15206.mail.cnb.yahoo.com via HTTP;
	Wed, 31 Jan 2007 14:08:31 CST
Date: Wed, 31 Jan 2007 14:08:31 +0800 (CST)
From: zechao wang <wzc0066@yahoo.com.cn>
To: oe list <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Message-ID: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Trouble with building "libbonoboui" ?
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
X-List-Received-Date: Wed, 31 Jan 2007 07:39:58 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit

Hello everyone, i get some trouble when building the package of "libbonoboui"!
At first, i build a old version (2.10.0) of "libbonoboui", and i get the Error Message: ' .../staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: error: parse error before "GMemChunk" '

I search the reason, some one said that it's caused by "glib-2.0", for the "glib-2.0" is too new. Glib is a basic package, and i couldn't change it. 

So i rebuild the libbonoboui with a new version(2.14.0), but the Error is still.

Please help, thanks very much...

--------------------------------------------------------------------------------------------------------------------------
Log of "libbonoboui_2.14.0.bb" : 

BB>>
BB>>
BB>> build libbonoboui
SHELL: Building libbonoboui
NOTE: Resolving missing task queue dependencies
NOTE: multiple providers are available for virtual/arm-poky-linux-libc-for-gcc (glibc, glibc-intermediate);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-poky-linux-libc-for-gcc
NOTE: multiple providers are available for virtual/libx11 (libx11, diet-x11);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libx11
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: package libbonoboui-2.14.0: started
NOTE: package libbonoboui-2.14.0-r0: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows (/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/temp/log.do_compile.19885)
| NOTE: make
| make  all-recursive
| make[1]: Entering directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0'
| Making all in bonobo
| make[2]: Entering directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo'| if /bin/sh ../arm-poky-linux-libtool --tag=CC --mode=compile ccache arm-poky-linux-gcc -march=armv5te -mtune=arm926ejs -DHAVE_CONFIG_H -I. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo -I.. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0 -I.. -Wall -Wmissing-prototypes  -DORBIT2=1 -pthread -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnomecanvas-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libart-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/pango-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/freetype2
 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/glib-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/glib-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gtk-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/atk-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libbonobo-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/orbit-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/bonobo-activation-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnome-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gconf/2 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gnome-vfs-2.0
 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gnome-vfs-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/dbus-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/dbus-1.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libxml2   -DPREFIX=\""/usr"\" -DPLUGIN_DIR=\"""\" -DBONOBO_UI_INTERNAL -DBONOBO_UIDIR=\""/usr/share/gnome-2.0/ui/"\" -DBONOBO_LIBDIR=\""/usr/lib"\" -DBONOBO_DATADIR=\""/usr/share"\" -DBONOBO_PIXMAPDIR=\""/usr/share/pixmaps"\" -DBONOBO_BINDIR=\""/usr/bin"\" -DBONOBO_LOCALSTATEDIR=\""/var"\" -DBONOBO_LOCALEDIR=\""/usr/share/locale"\" -DG_DISABLE_DEPRECATED -DGDK_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRECATED -DGDK_MULTIHEAD_SAFE -DGTK_DISABLE_DEPRECATED -DGNOME_DISABLE_DEPRECATED -DBONOBO_DISABLE_DEPRECATED -DG_LOG_DOMAIN=\"Bonobo\" -DVERSION=\"2.14.0\" -DBONOBO_EXPLICIT_TRANSLATION_DOMAIN=\"libbonoboui-2.0\" 
 -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include  -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -MT bonobo-dock.lo -MD -MP -MF ".deps/bonobo-dock.Tpo" -c -o bonobo-dock.lo bonobo-dock.c; \
| then mv -f ".deps/bonobo-dock.Tpo" ".deps/bonobo-dock.Plo"; else rm -f ".deps/bonobo-dock.Tpo"; exit 1; fi
|  ccache arm-poky-linux-gcc -march=armv5te -mtune=arm926ejs -DHAVE_CONFIG_H -I. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo -I.. -I/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0 -I.. -Wall -Wmissing-prototypes -DORBIT2=1 -pthread -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnomecanvas-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libart-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/pango-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/freetype2 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/glib-2.0
 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/glib-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gtk-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/atk-1.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libbonobo-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/orbit-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/bonobo-activation-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libgnome-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gconf/2 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gnome-vfs-2.0 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/gnome-vfs-2.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/dbus-1.0
 -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/lib/dbus-1.0/include -I/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/libxml2 -DPREFIX=\"/usr\" -DPLUGIN_DIR=\"\" -DBONOBO_UI_INTERNAL -DBONOBO_UIDIR=\"/usr/share/gnome-2.0/ui/\" -DBONOBO_LIBDIR=\"/usr/lib\" -DBONOBO_DATADIR=\"/usr/share\" -DBONOBO_PIXMAPDIR=\"/usr/share/pixmaps\" -DBONOBO_BINDIR=\"/usr/bin\" -DBONOBO_LOCALSTATEDIR=\"/var\" -DBONOBO_LOCALEDIR=\"/usr/share/locale\" -DG_DISABLE_DEPRECATED -DGDK_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRECATED -DGDK_MULTIHEAD_SAFE -DGTK_DISABLE_DEPRECATED -DGNOME_DISABLE_DEPRECATED -DBONOBO_DISABLE_DEPRECATED -DG_LOG_DOMAIN=\"Bonobo\" -DVERSION=\"2.14.0\" -DBONOBO_EXPLICIT_TRANSLATION_DOMAIN=\"libbonoboui-2.0\" -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -isystem/home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
 -MT bonobo-dock.lo -MD -MP -MF .deps/bonobo-dock.Tpo -c bonobo-dock.c  -fPIC -DPIC -o .libs/bonobo-dock.o
| In file included from /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtk.h:152,
|                  from bonobo-dock.c:28:
| /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: error: parse error before "GMemChunk"
| /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: warning: no semicolon at end of struct or union
| /home/zwang/gpe-practice/poky/build/tmp/staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:82: error: parse error before '}' token
| bonobo-dock.c: In function `drag_new':
| bonobo-dock.c:753: warning: ignoring return value of `g_list_append', declared with attribute warn_unused_result
| bonobo-dock.c:755: warning: ignoring return value of `g_list_prepend', declared with attribute warn_unused_result
| make[2]: *** [bonobo-dock.lo] Error 1
| make[2]: Leaving directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0/bonobo'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/libbonoboui-2.14.0'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/zwang/gpe-practice/poky/build/tmp/work/armv5te-poky-linux/libbonoboui-2.14.0-r0/temp/log.do_compile.19885
NOTE: package libbonoboui-2.14.0-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package libbonoboui-2.14.0: failed
ERROR: Build of /home/zwang/gpe-practice/poky/meta/packages/gnome/libbonoboui_2.14.0.bb do_compile failed
ERROR: Task 0 (/home/zwang/gpe-practice/poky/meta/packages/gnome/libbonoboui_2.14.0.bb, do_compile) failed
ERROR: '/home/zwang/gpe-practice/poky/meta/packages/gnome/libbonoboui_2.14.0.bb' failed
BB>>
BB>>
BB>>




 		
---------------------------------
 Mp3疯狂搜-新歌热歌高速下   
From mickey@vanille-media.de Wed Jan 31 08:45:47 2007
Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HCAA7-0003Ho-Gx
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Jan 2007 08:45:47 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id A84EC28C013; Wed, 31 Jan 2007 08:40:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180132203.adsl.alicedsl.de [85.180.132.203])
	by srv043.dedi23.de (Postfix) with ESMTP id 83D9628C012;
	Wed, 31 Jan 2007 08:40:56 +0100 (CET)
Date: Wed, 31 Jan 2007 08:43:43 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <942646368.20070131084343@vanille-media.de>
To: zechao wang <wzc0066@yahoo.com.cn>
In-Reply-To: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
References: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: oe list <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Trouble with building "libbonoboui" ?
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
X-List-Received-Date: Wed, 31 Jan 2007 07:45:47 -0000

zechao wang wrote:
> Hello everyone, i get some trouble when building the package of "libbonoboui"!
> At first, i build a old version (2.10.0) of "libbonoboui", and i
> get the Error Message: '
> .../staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68:
Hmm... poky-linux? :)

> error: parse error before "GMemChunk" '
Update your OE repository. I recently commited a patch to gtk+2.6.10 that
fixes this problem.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



