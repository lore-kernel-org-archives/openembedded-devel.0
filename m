Received: from [93.186.196.80] (helo=mis07.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailings@hardware-datenbank.de>) id 1Mvynx-0004gc-Bm
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 21:37:40 +0200
Received: by mis07.de (Postfix, from userid 65534)
	id AD06C144E01C; Thu,  8 Oct 2009 21:36:48 +0200 (CEST)
Received: from pcvirus (p5DC8EB68.dip.t-dialin.net [93.200.235.104])
	by mis07.de (Postfix) with ESMTPA id A9C8411C6189
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 21:36:45 +0200 (CEST)
Message-ID: <A22F8CDABC6B406EA2FC80E3109602BD@pcvirus>
From: "rath" <mailings@hardware-datenbank.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Oct 2009 21:36:33 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5843
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-SA-Exim-Connect-IP: 93.186.196.80
X-SA-Exim-Mail-From: mailings@hardware-datenbank.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: build of libxrender failed
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
X-List-Received-Date: Thu, 08 Oct 2009 19:37:40 -0000
X-Groupsio-MsgNum: 13368
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0065_01CA485F.67A46340"

------=_NextPart_000_0065_01CA485F.67A46340
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I tried to build the x11-image but I get the following error:

NOTE: Running task 677 of 6868 (ID: 5327,
/home/administrator/oe/stable/openembedded/recipes/xorg-lib/libxrender_0.=
9.4.bb,
do_compile)
ERROR: function do_compile failed
ERROR: see log in
/home/administrator/oe/stable/tmp/work/armv7a-angstrom-linux-gnueabi/libx=
render-1_0.9.4-r1/temp/log.do_compile.7397
NOTE: Task failed:
/home/administrator/oe/stable/tmp/work/armv7a-angstrom-linux-gnueabi/libx=
render-1_0.9.4-r1/temp/log.do_compile.7397
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/administrator/oe/stable/openembedded/recipes/xorg-lib/libxrender_0.=
9.4.bb
do_compile failed
ERROR: Task 5327
(/home/administrator/oe/stable/openembedded/recipes/xorg-lib/libxrender_0=
.9.4.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 676 tasks of which 676 didn't need to be
rerun and 1 failed.
ERROR:
'/home/administrator/oe/stable/openembedded/recipes/xorg-lib/libxrender_0=
.9.4.bb'
failed


Attached the compile log. How can I solve this problem? I've checked out =
the stable branch.

Regards, Joern

------=_NextPart_000_0065_01CA485F.67A46340
Content-Type: application/octet-stream;
	name="log.do_compile.7397"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="log.do_compile.7397"

NOTE: make
make  all-recursive
make[1]: Entering directory `/home/administrator/oe/stable/tmp/work/armv7a-=
angstrom-linux-gnueabi/libxrender-1_0.9.4-r1/libXrender-0.9.4'
Making all in src
make[2]: Entering directory `/home/administrator/oe/stable/tmp/work/armv7a-=
angstrom-linux-gnueabi/libxrender-1_0.9.4-r1/libXrender-0.9.4/src'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I..   -isystem/home/=
administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/inclu=
de   -I.. -I../include/X11/extensions -DMALLOC_0_RETURNS_NULL -isystem/home=
/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/incl=
ude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -=
MT AddTrap.lo -MD -MP -MF .deps/AddTrap.Tpo -c -o AddTrap.lo AddTrap.c
arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-gnu=
eabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsof=
tfp -DHAVE_CONFIG_H -I. -I.. -isystem/home/administrator/oe/stable/tmp/stag=
ing/armv7a-angstrom-linux-gnueabi/usr/include -I.. -I../include/X11/extensi=
ons -DMALLOC_0_RETURNS_NULL -isystem/home/administrator/oe/stable/tmp/stagi=
ng/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fre=
name-registers -fomit-frame-pointer -O2 -MT AddTrap.lo -MD -MP -MF .deps/Ad=
dTrap.Tpo -c AddTrap.c  -fPIC -DPIC -o .libs/AddTrap.o
In file included from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlib.h:52,
                 from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlibint.h:43,
                 from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/sys/types.h:27:22: error: features.h: No such file or directory
In file included from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/bits/types.h:31,
                 from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/sys/types.h:31,
                 from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlib.h:52,
                 from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlibint.h:43,
                 from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-g=
nueabi/4.3.1/include/stddef.h:214: error: expected '=3D', ',', ';', 'asm' o=
r '__attribute__' before 'typedef'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/sys/types.h:133:18: error: time.h: No such file or directory
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/sys/types.h:158:20: error: missing binary operator before token "(=
"
In file included from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlib.h:60,
                 from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlibint.h:43,
                 from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:71: error: expected '=3D', ',', ';', 'asm' or '__attribute=
__' before 'typedef'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:101: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:102: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:105: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:107: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:108: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:109: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:110: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'GContext'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/X.h:111: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'KeySym'
In file included from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlibint.h:43,
                 from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:227: error: expected specifier-qualifier-list before 'P=
ixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:292: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:323: error: expected specifier-qualifier-list before 'P=
ixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:346: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:435: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:537: error: expected specifier-qualifier-list before 'X=
ID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:594: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:612: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:630: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:647: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:671: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:690: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:699: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:710: error: expected specifier-qualifier-list before 'D=
rawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:723: error: expected specifier-qualifier-list before 'D=
rawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:733: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:742: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:755: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:764: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:774: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:784: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:793: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:805: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:819: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:829: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:838: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:853: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:863: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:873: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:884: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:894: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:907: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:919: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:934: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:949: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:959: error: expected specifier-qualifier-list before 'X=
ID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:971: error: expected specifier-qualifier-list before 'W=
indow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1040: error: expected specifier-qualifier-list before '=
Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1064: error: expected specifier-qualifier-list before '=
Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1076: error: expected specifier-qualifier-list before '=
Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1364: error: expected specifier-qualifier-list before '=
Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1369: error: expected specifier-qualifier-list before '=
KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1404: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1410: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1461: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1471: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1551: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCopyColormapAndFree'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1555: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreateColormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1561: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreatePixmapCursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1570: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreateGlyphCursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1579: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreateFontCursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1583: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XLoadFont'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1589: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1593: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XGContextFromGC'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1600: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreatePixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1607: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreateBitmapFromData'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1614: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreatePixmapFromBitmapData'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1624: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreateSimpleWindow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1635: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XGetSelectionOwner'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1639: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XCreateWindow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1653: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '*' token
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1681: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1689: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XKeycodeToKeysym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1698: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XLookupKeysym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1702: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '*' token
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1712: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XStringToKeysym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1767: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XRootWindow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1771: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XDefaultRootWindow'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1774: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XRootWindowOfScreen'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1820: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XDefaultColormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1824: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'XDefaultColormapOfScreen'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1878: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1886: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1892: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1898: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1903: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1908: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1914: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1915: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1920: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1921: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1929: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1930: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1957: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1962: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1968: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1978: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:1992: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2036: error: expected declaration specifiers or '...' b=
efore 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2057: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2072: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2083: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2089: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2119: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2126: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2133: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2139: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2144: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2149: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2159: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2168: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2182: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2188: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2189: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2208: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2209: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2235: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2236: error: expected declaration specifiers or '...' b=
efore 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2241: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2247: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2252: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2306: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2318: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2326: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2336: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2346: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2356: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2365: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2373: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2382: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2392: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2400: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2408: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2418: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2428: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2438: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2457: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2463: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2475: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2483: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2493: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2503: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2524: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2529: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2537: error: expected declaration specifiers or '...' b=
efore 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2574: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2624: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2625: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2636: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2642: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2674: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2675: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2680: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2695: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2703: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2708: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2709: error: expected declaration specifiers or '...' b=
efore 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2716: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2724: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2733: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2738: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2739: error: expected declaration specifiers or '...' b=
efore 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2772: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2777: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2782: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2787: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2795: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2800: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2805: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2810: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2829: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2838: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2854: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2907: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2924: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2934: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2943: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2952: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2961: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2967: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2987: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2988: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2989: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:2999: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3010: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3021: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3022: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3023: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3024: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3030: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3035: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3039: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3055: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3056: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3064: error: expected declaration specifiers or '...' b=
efore 'Cursor'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3075: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3091: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3092: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3103: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3110: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3121: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3133: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3139: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3165: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3192: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3220: error: expected declaration specifiers or '...' b=
efore 'Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3249: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3255: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3297: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3313: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3332: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3337: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3343: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3344: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3349: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3355: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3356: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3361: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3367: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3368: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3386: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3392: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3399: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3405: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3450: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3451: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3456: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3461: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3468: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3475: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3494: error: expected declaration specifiers or '...' b=
efore 'Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3499: error: expected declaration specifiers or '...' b=
efore 'Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3504: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3509: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3518: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3519: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3538: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3546: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3734: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3744: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3754: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3764: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3775: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3786: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3797: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3808: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3819: error: expected declaration specifiers or '...' b=
efore 'Drawable'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3897: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3905: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3914: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlib.h:3923: error: expected declaration specifiers or '...' b=
efore 'KeySym'
In file included from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:62: error: expected specifier-qualifier-list before =
'GContext'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:78: error: expected specifier-qualifier-list before =
'XID'
In file included from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:221:19: error: errno.h: No such file or directory
In file included from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/Xlibint.h:223,
                 from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xfuncs.h:50:20: error: string.h: No such file or directory
In file included from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:231:20: error: stdlib.h: No such file or directory
In file included from Xrenderint.h:31,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:935: error: expected declaration specifiers or '...'=
 before 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:1022: error: expected '=3D', ',', ';', 'asm' or '__a=
ttribute__' before '_XAllocID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:1023: error: expected declaration specifiers or '...=
' before 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:1294: error: expected declaration specifiers or '...=
' before 'Font'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xlibint.h:1320: error: expected declaration specifiers or '...=
' before 'Window'
In file included from Xrenderint.h:32,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:118: error: expected specifier-qualifier-list before '=
Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:315: error: expected specifier-qualifier-list before '=
Colormap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:393: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:412: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:419: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:425: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:432: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:438: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:446: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:453: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:460: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:474: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:480: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:485: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:491: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:497: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:504: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:512: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:524: error: expected ')' before '*' token
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:532: error: expected declaration specifiers or '...' b=
efore 'KeySym'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:572: error: expected declaration specifiers or '...' b=
efore 'XID'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:579: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:585: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:592: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:598: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:606: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:613: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:616: error: expected declaration specifiers or '...' b=
efore 'Pixmap'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:624: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:631: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:637: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:643: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:649: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:655: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:661: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:673: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:685: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:697: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:710: error: expected declaration specifiers or '...' b=
efore 'Window'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/Xutil.h:717: error: expected declaration specifiers or '...' b=
efore 'Window'
In file included from /home/administrator/oe/stable/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr/include/X11/extensions/renderproto.h:30,
                 from Xrenderint.h:33,
                 from AddTrap.c:28:
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/extensions/render.h:29: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'Glyph'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/extensions/render.h:30: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'GlyphSet'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/extensions/render.h:31: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'Picture'
/home/administrator/oe/stable/tmp/staging/armv7a-angstrom-linux-gnueabi/usr=
/include/X11/extensions/render.h:32: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'PictFormat'
In file included from Xrenderint.h:34,
                 from AddTrap.c:28:
../include/X11/extensions/Xrender.h:47: error: expected specifier-qualifier=
-list before 'PictFormat'
../include/X11/extensions/Xrender.h:69: error: expected specifier-qualifier=
-list before 'Picture'
../include/X11/extensions/Xrender.h:100: error: expected specifier-qualifie=
r-list before 'GlyphSet'
../include/X11/extensions/Xrender.h:108: error: expected specifier-qualifie=
r-list before 'GlyphSet'
../include/X11/extensions/Xrender.h:116: error: expected specifier-qualifie=
r-list before 'GlyphSet'
../include/X11/extensions/Xrender.h:174: error: expected specifier-qualifie=
r-list before 'Cursor'
../include/X11/extensions/Xrender.h:241: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreatePicture'
../include/X11/extensions/Xrender.h:249: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:255: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:263: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:268: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:273: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:278: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:279: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:280: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:291: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateGlyphSet'
../include/X11/extensions/Xrender.h:294: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderReferenceGlyphSet'
../include/X11/extensions/Xrender.h:297: error: expected declaration specif=
iers or '...' before 'GlyphSet'
../include/X11/extensions/Xrender.h:301: error: expected declaration specif=
iers or '...' before 'GlyphSet'
../include/X11/extensions/Xrender.h:302: error: expected ';', ',' or ')' be=
fore '*' token
../include/X11/extensions/Xrender.h:310: error: expected declaration specif=
iers or '...' before 'GlyphSet'
../include/X11/extensions/Xrender.h:311: error: expected ';', ',' or ')' be=
fore '*' token
../include/X11/extensions/Xrender.h:317: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:318: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:320: error: expected declaration specif=
iers or '...' before 'GlyphSet'
../include/X11/extensions/Xrender.h:331: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:332: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:334: error: expected declaration specif=
iers or '...' before 'GlyphSet'
../include/X11/extensions/Xrender.h:345: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:346: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:348: error: expected declaration specif=
iers or '...' before 'GlyphSet'
../include/X11/extensions/Xrender.h:359: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:360: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:372: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:373: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:385: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:386: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:398: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:408: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:416: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:417: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:427: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:428: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:438: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:439: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:449: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:450: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:460: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:461: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:476: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateCursor'
../include/X11/extensions/Xrender.h:482: error: expected declaration specif=
iers or '...' before 'Drawable'
../include/X11/extensions/Xrender.h:486: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:492: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateAnimCursor'
../include/X11/extensions/Xrender.h:499: error: expected declaration specif=
iers or '...' before 'Picture'
../include/X11/extensions/Xrender.h:505: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateSolidFill'
../include/X11/extensions/Xrender.h:508: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateLinearGradient'
../include/X11/extensions/Xrender.h:514: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateRadialGradient'
../include/X11/extensions/Xrender.h:520: error: expected '=3D', ',', ';', '=
asm' or '__attribute__' before 'XRenderCreateConicalGradient'
AddTrap.c:34: error: expected declaration specifiers or '...' before 'Pictu=
re'
AddTrap.c: In function 'XRenderAddTraps':
AddTrap.c:44: error: 'Display' has no member named 'bigreq_size'
AddTrap.c:44: error: 'Display' has no member named 'bigreq_size'
AddTrap.c:44: error: 'Display' has no member named 'max_request_size'
AddTrap.c:47: error: 'Display' has no member named 'lock_fns'
AddTrap.c:47: error: 'Display' has no member named 'lock_fns'
AddTrap.c:50: error: 'Display' has no member named 'bufptr'
AddTrap.c:50: error: 'Display' has no member named 'bufmax'
AddTrap.c:50: error: 'Display' has no member named 'last_req'
AddTrap.c:50: error: 'Display' has no member named 'bufptr'
AddTrap.c:50: error: 'Display' has no member named 'bufptr'
AddTrap.c:50: error: 'Display' has no member named 'request'
AddTrap.c:53: error: 'picture' undeclared (first use in this function)
AddTrap.c:53: error: (Each undeclared identifier is reported only once
AddTrap.c:53: error: for each function it appears in.)
AddTrap.c:62: error: 'Display' has no member named 'bigreq_size'
AddTrap.c:62: warning: incompatible implicit declaration of built-in functi=
on 'memmove'
AddTrap.c:62: error: 'Display' has no member named 'bufptr'
AddTrap.c:62: error: 'Display' has no member named 'bufmax'
AddTrap.c:62: warning: incompatible implicit declaration of built-in functi=
on 'memcpy'
AddTrap.c:62: error: 'Display' has no member named 'bufptr'
AddTrap.c:62: error: 'Display' has no member named 'bufptr'
AddTrap.c:64: error: 'Display' has no member named 'bufptr'
AddTrap.c:64: error: 'Display' has no member named 'bufmax'
AddTrap.c:64: warning: incompatible implicit declaration of built-in functi=
on 'memcpy'
AddTrap.c:64: error: 'Display' has no member named 'bufptr'
AddTrap.c:64: error: 'Display' has no member named 'bufptr'
AddTrap.c:68: error: 'Display' has no member named 'lock_fns'
AddTrap.c:68: error: 'Display' has no member named 'lock_fns'
AddTrap.c:69: error: 'Display' has no member named 'synchandler'
AddTrap.c:69: error: 'Display' has no member named 'synchandler'
make[2]: *** [AddTrap.lo] Error 1
make[2]: Leaving directory `/home/administrator/oe/stable/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/libxrender-1_0.9.4-r1/libXrender-0.9.4/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/administrator/oe/stable/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/libxrender-1_0.9.4-r1/libXrender-0.9.4'
make: *** [all] Error 2
FATAL: oe_runmake failed

------=_NextPart_000_0065_01CA485F.67A46340--
