Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1QBtRN-0005DH-B3
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 20:44:54 +0200
Received: from homiemail-a75.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 6C78917DDF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:42:34 -0700 (PDT)
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id 4DAB05EC085
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:42:31 -0700 (PDT)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:content-type:
	content-transfer-encoding; q=dns; s=gumstix.com; b=Ztw2Q4u8Tc/L9
	x5ouSD9h4Rdgdg9fzyqmOkWqofRdzteYIPfsqKUfIOSikKk+3FlrRIFo4hC2im8B
	ZrImwUfPlq9kVZB1gf/vUcNekcxx5SOE7Qf0uhA4TWvf/FABUwWQHvO12RuWl43Q
	xa31qvXKI3QfpTIt7RQsJZez4wGsy0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:content-type:
	content-transfer-encoding; s=gumstix.com; bh=eFvp/T6NJy9D2GjOWS6
	YH0nM3yM=; b=gx2MKLAT+k3+GGrzi0f13m0Ls8YQPv5PO5BAfHaVPBZA8Mu5+iN
	828+J0461mRD6Xpeit2XDPQjMGGZKRpx4hSAdsfmLngFSJe20Nb1if20FEV7UoPZ
	apwovslAOpYzD3AmkpoCbb3cqM7qmRdaSQLBvn4D58zze8HZEYZnwzks=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id 1A5D65EC081
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:42:31 -0700 (PDT)
Message-ID: <4DAC8618.8000303@gumstix.com>
Date: Mon, 18 Apr 2011 11:42:32 -0700
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: empathy warnings being treated as errors
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
X-List-Received-Date: Mon, 18 Apr 2011 18:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm running into these two errors when I build empathy

> | arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -I. -I.. -I.. -DDATADIR=\"/usr/share\" -DLOCALEDIR=\"/usr/share/locale\" -DG_LOG_DOMAIN=\"empathy\" -pthread -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gio-unix-2.0/ -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/telepathy-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/neil/overo-
oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -pthread -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -Wall -Wunused -Wmissing-prototypes -Wmissing-declarations -Wchar-subscripts -Wnested-externs -Wpointer-arith -Wno-sign-compare -Wno-pointer-sign -Wformat -Werror -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT empathy-log-store-empathy.lo -MD -MP -MF .deps/empathy-log-store-empathy.T
po -c empathy-log-store-empathy.c  -fPIC -DPIC -o .libs/empathy-log-store-empathy.o
> | cc1: warnings being treated as errors
> | empathy-log-store-empathy.c: In function 'log_store_empathy_get_messages_for_date':
> | empathy-log-store-empathy.c:500:13: error: 'cm_id' may be used uninitialized in this function
> | make[3]: *** [empathy-log-store-empathy.lo] Error 1

I get past this by removing -Werror from WARN_CFLAGS in 
libempathy/Makefile and then hit

> | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..  -I.. -DG_LOG_DOMAIN=\"empathy\" -pthread -DORBIT2=1 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/home/neil/overo-oe/tmp-unstable/
sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/evolution-data-server-2.26 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gconf/2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libsoup-2.4 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/orbit-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-
angstrom-linux-gnueabi/usr/include/telepathy-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/unique-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gnome-keyring-1   -pthread -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a
-angstrom-linux-gnueabi/usr/include/atk-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12     -pthread -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/webkit-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/
usr/include/libsoup-2.4 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12 -I/home/neil/overo-oe/tmp-unstable/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2   -Wall -Wunused -Wmissing-prototypes -Wmissing-declarations -Wchar-subscripts -Wnested-externs -Wpointer-arith -Wno-sign-compare -Wno-pointer-sign -Wformat -Werror   -fexpensive-optimizations -fomit-frame-
pointer -frename-registers -O2 -ggdb2 -MT empathy-call-window.o -MD -MP -MF .deps/empathy-call-window.Tpo -c -o empathy-call-window.o empathy-call-window.c
> | cc1: warnings being treated as errors
> | empathy-call-window.c: In function 'empathy_call_window_request_resource_cb':
> | empathy-call-window.c:1197:12: error: comparison between 'FsMediaType' and 'enum <anonymous>'
> | make[3]: *** [empathy-call-window.o] Error 1


Which I work around by removing -Werror from WARN_CFLAGS in src/Makefile

Empathy hasn't changed but I just switched to gcc-4.5 from 4.3.3 so I 
suspect this is where the problem originates. Looking at an old log I 
can see that -Werror was set there too.

--
Neil


