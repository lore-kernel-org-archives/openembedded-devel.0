Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Mh1C3-0000EJ-5V
	for openembedded-devel@openembedded.org; Fri, 28 Aug 2009 15:08:39 +0200
Received: (qmail 14212 invoked by uid 813007); 28 Aug 2009 12:50:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Aug 2009 12:50:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Aug 2009 14:50:01 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <E1MgfbN-0005E3-EZ@melo.openembedded.org>
In-Reply-To: <E1MgfbN-0005E3-EZ@melo.openembedded.org>
MIME-Version: 1.0
Message-Id: <200908281450.34613.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Pratheesh Gangadhar : glib-2.0 2.21.4: add armv6 atomic ops, this fixes 100% utilization hangs when doing DSP based GStreamer playback
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
X-List-Received-Date: Fri, 28 Aug 2009 13:08:39 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 27 sierpnia 2009 o 16:05:21 git version control napisa=C5=82=
(a):
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 1eb89aacbc6830fe242eac36ba8bcb61d98807f5
> URL: =20
>  http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D1eb8=
9aacbc68
>30fe242eac36ba8bcb61d98807f5
>
> Author: Pratheesh Gangadhar <pratheesh.gangadhar@gmail.com>
> Date:   Thu Aug 27 02:51:00 2009 +0530
>
> glib-2.0 2.21.4: add armv6 atomic ops, this fixes 100% utilization hangs
> when doing DSP based GStreamer playback
>
> GLIB by default uses ARMV5 instructions for emulating atomic operations a=
nd
> this patch (derived from
> https://stage.maemo.org/svn/maemo/projects/haf/trunk/glib/debian/patches/=
25
>-gatomic.patch) make use ARMV6 atomic instructions instead. CPU goes into
> "sched_yield" while loop during hang - due to a race condition triggered =
by
>  high rate context switching while running DSP plugins.

1. Your change reverted PR from r4 (set in glib.inc) to r1
2. This is not buildable for arm <6:

| arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-g=
nueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thum=
b -D
HAVE_CONFIG_H -I. -I.. -I.. -DG_LOG_DOMAIN=3D\"GLib\" -DG_DISABLE_CAST_CHEC=
KS -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DG_DISABLE_DEPRECATED -DGLIB_COMP=
IL
ATION -DPCRE_STATIC -isystem/home/hrw/devel/build/angstrom/tmp/staging/armv=
5te-angstrom-linux-gnueabi/usr/include -DG_DISABLE_SINGLE_INCLUDES -pthread
 -isystem/home/hrw/devel/build/angstrom/tmp/staging/armv5te-angstrom-linux-=
gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-fra=
me-
pointer -O2 -ggdb3 -Wall -mno-thumb -isystem/home/hrw/devel/build/angstrom/=
tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimiza=
tions -
frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall -MT libgatomic_la-g=
atomic.lo -MD -MP -MF .deps/libgatomic_la-gatomic.Tpo -c gatomic.c  -fPIC -=
DPIC -o=20
=2Elibs/libgatomic_la-gatomic.o
| /tmp/ccEqvIUs.s: Assembler messages:
| /tmp/ccEqvIUs.s:9449: Error: selected processor does not support `ldrex r=
0,[r2]'
| /tmp/ccEqvIUs.s:9451: Error: selected processor does not support `strex r=
3,ip,[r2]'
| /tmp/ccEqvIUs.s:9477: Error: selected processor does not support `ldrex r=
2,[r0]'
| /tmp/ccEqvIUs.s:9479: Error: selected processor does not support `strex r=
3,r2,[r0]'
| /tmp/ccEqvIUs.s:9504: Error: selected processor does not support `ldrex r=
3,[r0]'
| /tmp/ccEqvIUs.s:9507: Error: selected processor does not support `strexeq=
 ip,r2,[r0]'
| /tmp/ccEqvIUs.s:9532: Error: selected processor does not support `ldrex r=
3,[r0]'
| /tmp/ccEqvIUs.s:9535: Error: selected processor does not support `strexeq=
 ip,r2,[r0]'
| /tmp/ccEqvIUs.s:9577: Error: selected processor does not support `ldrex r=
3,[r0]'
| /tmp/ccEqvIUs.s:9578: Error: selected processor does not support `strex r=
3,r1,[r0]'
| /tmp/ccEqvIUs.s:9620: Error: selected processor does not support `ldrex r=
3,[r0]'
| /tmp/ccEqvIUs.s:9621: Error: selected processor does not support `strex r=
3,r1,[r0]'
| make[4]: *** [libgatomic_la-gatomic.lo] Error 1
| make[4]: *** Waiting for unfinished jobs....



Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




