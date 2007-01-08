Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H3wIX-000423-C7
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 16:20:29 +0100
Received: (qmail 12583 invoked by uid 813007); 8 Jan 2007 15:18:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 8 Jan 2007 15:18:49 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Jan 2007 16:18:46 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
X-Length: 7702
Organization: OpenEmbedded
X-UID: 34
Message-Id: <200701081618.46665.openembedded@hrw.one.pl>
Subject: Status of ARM machines in OE
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
X-List-Received-Date: Mon, 08 Jan 2007 15:20:29 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable


During weekend I build 'task-base' for all ARM (armv4t and better)=20
machines and =C3=85ngstr=C3=B6m distribution. The list included:

a1200 a780 amsdelta compulab-pxa270 devkitidp-pxa255 ep93xx h1910 h1940=20
h2200 h3900 h4000 h5000 h6300 htcblueangel htcuniversal hx2000 hx4700=20
ks8695 logicpd-pxa270 magician mainstone mtx-3 mx21ads mx31ads=20
navman-icn330 netbook-pro nokia770 omap1510inn omap1610h2 omap1710h3=20
omap2420h4 omap5912osk palmld palmtx rokr-e2 rx3000 smdk2440 xxs1500

This week ARM 'broken' machines are:

a1200 - lack of kernel config - bug #1766
omap1710h3 - lack of kernel config - bug #1736
omap2420h4 - lack of kernel config - bug #1744
xxs1500 - unfetchable kernel - bug #1737

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

compulab-pxa270 - use binary driver for flash so only hardfloat=20
distributions
can use this machine:

arm-angstrom-linux-gnueabi-ld: ERROR: drivers/block/cl_flash/CL_FlashDrv us=
es FPA instructions, whereas drivers/block/cl_flash/fdrv.o does not
arm-angstrom-linux-gnueabi-ld: failed to merge target specific data of file=
 drivers/block/cl_flash/CL_FlashDrv

=46ull log:=20
http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=3D177&logfile=
=3D20070107145519.log

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

h1910 - kernel broken:
arch/arm/mach-pxa/built-in.o: In function `h4000_set_led':
dma_needs_bounce.c:(.text+0x1ca0): undefined reference to `ipaq_asic3_set_l=
ed'
dma_needs_bounce.c:(.text+0x1cd0): undefined reference to `ipaq_asic3_set_l=
ed'
dma_needs_bounce.c:(.text+0x1ce4): undefined reference to `ipaq_asic3_set_l=
ed'
dma_needs_bounce.c:(.text+0x1d04): undefined reference to `ipaq_asic3_set_l=
ed'
dma_needs_bounce.c:(.text+0x1d18): undefined reference to `ipaq_asic3_set_l=
ed'
make: *** [.tmp_vmlinux1] Error 1

=46ull log:=20
http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=3D177&logfile=
=3D20070107150654.log

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

htcblueangel - kernel broken is same place as h1910

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

rx3000 - kernel broken is same place as h1910

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

htcuniversal - kernel broken:
In file included from lib/audit.c:8:
include/asm-generic/audit_dir_write.h:9: error: '__NR_mkdirat' undeclared h=
ere (not in a function)
include/asm-generic/audit_dir_write.h:10: error: '__NR_mknodat' undeclared =
here (not in a function)
include/asm-generic/audit_dir_write.h:11: error: '__NR_unlinkat' undeclared=
 here (not in a function)
include/asm-generic/audit_dir_write.h:12: error: '__NR_renameat' undeclared=
 here (not in a function)
include/asm-generic/audit_dir_write.h:13: error: '__NR_linkat' undeclared h=
ere (not in a function)
include/asm-generic/audit_dir_write.h:14: error: '__NR_symlinkat' undeclare=
d here (not in a function)

=46ull log:=20
http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=3D177&logfile=
=3D20070107173621.log

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

magician is OK - builds without problem. But as this is HTC Magician then
maybe we should rename it to htcmagician to follow other htc phones
(htcblueangel, htcuniversal) which are in OE?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

mtx-3 is problematic. According to machine config file this is config of
experimental machine which is not released in hardware yet. In that file
it has enabled optimalizations for XScale but kernel config is for arm926
family.=20

So does it it XScale or arm926? Instead of doing optimalizations by
hand it should require proper conf/machine/include/tune-* config (which=20
also set proper PACKAGE_ARCH instead of plain 'arm' one).

But there is a problem with arm926 family. Or rather GCC has problem with
it. In gcc 3.x it was '-mtune=3Darm926ejs' but in gcc 4.x it is=20
'-mtune=3Darm926ej-s'.

As effect I prefer to leave fixing config to someone who is familiar with
this machine as I do not know does they use gcc 3.x or gcc 4.x for their
development.

I will skip this machine in my future ARM testing until this config will
get fixed.

It use u-boot but does not provide machine config for it.=20

Kernel build fails:

arch/arm/mach-at91sam9260/devices.c:43: error: static declaration of 'dbgu_=
resources' follows non-static declaration
include/asm/arch/board.h:37: error: previous declaration of 'dbgu_resources=
' was here
make[1]: *** [arch/arm/mach-at91sam9260/devices.o] Error 1

=46ull log: http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=3D=
177&logfile=3D20070108132854.log

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

omap1610h2 use 2.6.9 kernel which cannot be built using gcc 4.1.1:

cc1: error: unrecognized command line option "-mapcs-32"
cc1: error: unrecognized command line option "-mshort-load-bytes"

omap1510inn, omap1610h2, omap1710h3 and omap2420h4 machines in OE are not
maintained since Chris 'kergoth' Larson stopped working for TI.=20

I would like to schedule them for removal.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

gumstix - this machine needs config cleanup:

1. not yet converted to 'task-base' format
2. has PACKAGE_ARCH set to 'arm' instead of 'armv5te' (XScale default)
3. use own optimalizations - such stuff belongs to distro config rather then
   machine one

Anyway this one builds 'task-base' but resulting rootfs will lack needed
utils.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Maintainers of 'broken' machines - would be nice if you will try to fix
those problems. I will try to do such builds in future.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  Never argue with an idiot, they'll just bring you down to their level=20
  and beat you with experience.




