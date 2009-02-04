Received: from [85.33.31.84] (helo=smtpout084B.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1LUk0v-0003h9-Nq
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 16:50:09 +0100
Received: from FBCMFE02B20.fbc.local ([192.168.31.245]) by
	smtpout084B.attiva.biz with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 4 Feb 2009 16:50:04 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B20.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 4 Feb 2009 16:48:35 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <gmbu7j$f7s$1@ger.gmane.org>
References: <1233059140.7818.4.camel@ubuntu2> <497F0D92.4040904@gmail.com>
	<1233136141.7444.3.camel@ubuntu2> <49802D8A.6020208@gmail.com>
	<1233227644.6517.5.camel@ubuntu2> <49832BE7.6090801@gmail.com>
	<1233586679.6429.5.camel@ubuntu2> <49871B9D.3040202@gmail.com>
	<1233739630.6176.4.camel@ubuntu2>  <gmbu7j$f7s$1@ger.gmane.org>
Date: Wed, 04 Feb 2009 16:48:53 +0100
Message-Id: <1233762533.6176.9.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 04 Feb 2009 15:48:35.0470 (UTC)
	FILETIME=[09F642E0:01C986E0]
Subject: Re: Build problems
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
X-List-Received-Date: Wed, 04 Feb 2009 15:50:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

OK, changed DASH to BASH.
Compiled libtool-cross OK.

compiling gtk+ (bitbake gtk+), fails.

Regards,
Paolo


NOTE: package libxft-2.1.13: completed
NOTE: Running task 1114 of 1553 (ID:
7, /home/paolo/oe/stuff/openembedded/packages/gtk+/gtk+_2.14.2.bb,
do_compile)
NOTE: package gtk+-2.14.2: started
NOTE: package gtk+-2.14.2-r1: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/temp/log.do_compile.15854)
| NOTE: make
| make  all-recursive
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2'
| Making all in po
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/po'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/po'
| Making all in po-properties
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/po-properties'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/po-properties'
| Making all in gdk-pixbuf
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make  all-recursive
| make[3]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| Making all in pixops
| make[4]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf/pixops'
| make[4]: Nothing to be done for `all'.
| make[4]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf/pixops'
| make[4]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| /bin/bash ../i586-angstrom-linux-libtool --tag=3DCC   --mode=3Dlink ccach=
e
i586-angstrom-linux-gcc -march=3Dpentium  -DGDK_PIXBUF_DISABLE_DEPRECATED
-isystem/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/incl=
ude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -=
Wall  -version-info 1400:2:1400 -export-symbols-regex "^[^_].*"   -L/home/p=
aolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib -Wl,-rpath-link=
,/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib -Wl,-O1=
 -Wl,--hash-style=3Dgnu -o libgdk_pixbuf-2.0.la -rpath /usr/lib gdk-pixbuf.=
lo gdk-pixbuf-animation.lo gdk-pixbuf-data.lo gdk-pixbuf-io.lo gdk-pixbuf-l=
oader.lo gdk-pixbuf-scale.lo gdk-pixbuf-simple-anim.lo gdk-pixbuf-scaled-an=
im.lo gdk-pixbuf-util.lo gdk-pixdata.lo gdk-pixbuf-enum-types.lo pixops/lib=
pixops.la  -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -lm
| i586-angstrom-linux-libtool: link: rm
-fr  .libs/libgdk_pixbuf-2.0.exp .libs/libgdk_pixbuf-2.0.ver
| i586-angstrom-linux-libtool:
link: /home/paolo/oe/stuff/build/tmp/cross/i586/bin/i586-angstrom-linux-nm =
-B  .libs/gdk-pixbuf.o .libs/gdk-pixbuf-animation.o .libs/gdk-pixbuf-data.o=
 .libs/gdk-pixbuf-io.o .libs/gdk-pixbuf-loader.o .libs/gdk-pixbuf-scale.o .=
libs/gdk-pixbuf-simple-anim.o .libs/gdk-pixbuf-scaled-anim.o .libs/gdk-pixb=
uf-util.o .libs/gdk-pixdata.o .libs/gdk-pixbuf-enum-types.o   pixops/.libs/=
libpixops.a | sed -n -e 's/^.*[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([=
_A-Za-z][_A-Za-z0-9]*\)$/=01 =02 =02/p' | /bin/sed 's/.* //' | sort | uniq =
> .libs/libgdk_pixbuf-2.0.exp
| i586-angstrom-linux-libtool: link: /bin/grep -E -e "^[^_].*"
".libs/libgdk_pixbuf-2.0.exp" > ".libs/libgdk_pixbuf-2.0.expT"
| i586-angstrom-linux-libtool: link: mv -f
".libs/libgdk_pixbuf-2.0.expT" ".libs/libgdk_pixbuf-2.0.exp"
| i586-angstrom-linux-libtool: link: echo "{ global:"
> .libs/libgdk_pixbuf-2.0.ver
| i586-angstrom-linux-libtool: link:  cat .libs/libgdk_pixbuf-2.0.exp |
sed -e "s/\(.*\)/=01;/" >> .libs/libgdk_pixbuf-2.0.ver
| i586-angstrom-linux-libtool: link:  echo "local: *; };"
>> .libs/libgdk_pixbuf-2.0.ver
| i586-angstrom-linux-libtool: link:  ccache i586-angstrom-linux-gcc
-march=3Dpentium
-shared  .libs/gdk-pixbuf.o .libs/gdk-pixbuf-animation.o .libs/gdk-pixbuf-d=
ata.o .libs/gdk-pixbuf-io.o .libs/gdk-pixbuf-loader.o .libs/gdk-pixbuf-scal=
e.o .libs/gdk-pixbuf-simple-anim.o .libs/gdk-pixbuf-scaled-anim.o .libs/gdk=
-pixbuf-util.o .libs/gdk-pixdata.o .libs/gdk-pixbuf-enum-types.o  -Wl,--who=
le-archive pixops/.libs/libpixops.a -Wl,--no-whole-archive  -Wl,-rpath -Wl,=
/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib -L/home/=
paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib/.libs -L/home/=
paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib /home/paolo/oe=
/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib/libgio-2.0.so /home/pa=
olo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib/libgobject-2.0.s=
o /home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib/libgmo=
dule-2.0.so -ldl /home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux=
/usr/lib/libglib-2.0.so -lm  -march=3Dpentium -Wl,-rpath-link -Wl,/home/pao=
lo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib -Wl,-O1 -Wl,--has=
h-style=3Dgnu   -Wl,-soname -Wl,libgdk_pixbuf-2.0.so.0 -Wl,-version-script =
-Wl,.libs/libgdk_pixbuf-2.0.ver -o .libs/libgdk_pixbuf-2.0.so.0.1400.2
| /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux/4.2=
.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2: ig=
noring invalid character `\001' in script
| /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux/4.2=
.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2: sy=
ntax error in VERSION script
| collect2: ld returned 1 exit status
| make[4]: *** [libgdk_pixbuf-2.0.la] Error 1
| make[4]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task
failed: /home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/temp/log.do_compile.15854
NOTE: package gtk+-2.14.2-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gtk+-2.14.2: failed
ERROR: Build of /home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
+_2.14.2.bb do_compile failed
ERROR: Task 7 (/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
+_2.14.2.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 1113 tasks of which 972 didn't need to be
rerun and 1 failed.
ERROR: '/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk+_2.14.2.bb'
failed
NOTE: build 200902041611: completed


On mer, 2009-02-04 at 12:29 +0100, Koen Kooi wrote:
> On 04-02-09 10:27, Paolo Cremonese wrote:
> > Sorry, don't know...
> >
> > Now the image works !
> >
> > Then I try to build a gpe-image, but i get an error at the last step.
>=20
> Don't use dash as /bin/sh, use bash and rebuild libtool-cross and gtk+
>=20
> regards,
>=20
> Koen
>=20
> >
> > Thanks in advance,
> >
> > Paolo
> >
> >
> >
> > | /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux=
/4.2.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2=
: ignoring invalid character `\001' in script
> > | /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux=
/4.2.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2=
: syntax error in VERSION script
> > | collect2: ld returned 1 exit status
> > | make[4]: *** [libgdk_pixbuf-2.0.la] Error 1
> > | make[4]: Leaving directory
> > `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> > +-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
> > | make[3]: *** [all-recursive] Error 1
> > | make[3]: Leaving directory
> > `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> > +-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
> > | make[2]: *** [all] Error 2
> > | make[2]: Leaving directory
> > `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> > +-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
> > | make[1]: *** [all-recursive] Error 1
> > | make[1]: Leaving directory
> > `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> > +-2.14.2-r1/gtk+-2.14.2'
> > | make: *** [all] Error 2
> > | FATAL: oe_runmake failed
> > NOTE: Task
> > failed: /home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> > +-2.14.2-r1/temp/log.do_compile.22403
> > NOTE: package gtk+-2.14.2-r1: task do_compile: failed
> > ERROR: TaskFailed event exception, aborting
> > NOTE: package gtk+-2.14.2: failed
> > ERROR: Build of /home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
> > +_2.14.2.bb do_compile failed
> > ERROR: Task 951 (/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
> > +_2.14.2.bb, do_compile) failed
> > NOTE: Tasks Summary: Attempted 1003 tasks of which 788 didn't need to b=
e
> > rerun and 1 failed.
> > ERROR: '/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk+_2.14.2.bb'
> > failed
> > NOTE: build 200902040809: completed
> >
> >
> >
> >
> >
> >
> > On lun, 2009-02-02 at 17:13 +0100, Marco Cavallini wrote:
> >> Paolo Cremonese ha scritto:
> >>> Fine, waiting for GRUB patch. (what is "hrw" ?)
> >>>
> >>> My target has not hard disk, only CF.
> >>> To run the image, do I need a RAMFS ?
> >>> And in this case, I have to add it to the GRUB "menu.lst" ?
> >> Paolo,
> >> hrw is Marcin Juszkiewicz, an OE developer and mantainer.
> >> GRUB patch was pushed this morning and is ready for use into git mains=
tream.
> >>
> >> Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
> >> --
> >> Marco Cavallini | KOAN sas | Bergamo - Italia
> >>   embedded and real-time software engineering
> >>     Atmel third party certified consultant
> >> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
> >>        http://www.KoanSoftware.com
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



