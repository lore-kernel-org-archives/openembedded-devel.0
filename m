Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Daniele.Bosi@mta.it>) id 1QJhg8-0004VD-Ef
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 09:48:24 +0200
Received: from mail.mta.it (mail.mta.it [91.143.207.180])
	by rly21a.srv.mailcontrol.com (MailControl) with ESMTP id
	p4A7jPYa001166 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 08:45:25 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mail.mta.it with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 10 May 2011 09:45:06 +0200
Received: from mta-digimail.MTA.INT ([172.26.10.14]) by mta-digicas.MTA.INT
	([172.26.10.13]) with mapi; Tue, 10 May 2011 09:45:06 +0200
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 May 2011 09:45:06 +0200
Thread-Topic: [oe] something strange compiling MAD-FCL
Thread-Index: AcwOmeZwjEbFUK2MS96oyR2Y8B+5XgAS6+uA
Message-ID: <531B6536C9F737458807DF75064873C801ED5F36E7B5@mta-digimail.MTA.INT>
In-Reply-To: <BANLkTinEXA6oH_331wx2uXS6SjUopKQ-dw@mail.gmail.com>
Accept-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: it-IT
MIME-Version: 1.0
X-OriginalArrivalTime: 10 May 2011 07:45:06.0899 (UTC)
	FILETIME=[2E4D5A30:01CC0EE6]
X-Scanned-By: MailControl A_10_80_00 (www.mailcontrol.com) on 10.65.0.131
Subject: Re: something strange compiling MAD-FCL
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
X-List-Received-Date: Tue, 10 May 2011 07:48:24 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Andrea,
I don't know why your MAD-FCL doesn't work, but if your goal is only to tra=
nsfer files through the network to other devices, you should use dropbear t=
hat is a ssh client / server.
If dropbear is not built for your machine, just add it on your local.conf f=
ile.

Bye Daniele




-----Messaggio originale-----
Da: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-=
devel-bounces@lists.openembedded.org] Per conto di Alberto Carrozzo
Inviato: marted=EC 10 maggio 2011 0.39
A: openembedded-devel@lists.openembedded.org
Oggetto: [oe] something strange compiling MAD-FCL

Hello you all... I need (for my thesis) to find something that allows
to send files over IP and, at the same time, something to receive
them... Running many search on Google i find out MAD-FCL
(http://mad.cs.tut.fi/index.php?content=3Ddownload) so I tried to
compile it for OE (Angstrom).
Also trying to compile it on Ubuntu, it gives several errors so I had to:

1) modify all makefiles deleting "CC =3D g++" or "CC =3D gcc" to use the
angstrom toolchain
2) modify the main makefile in order to not compile flute_unittest (it
gives some errors and I don't need it)
3) delete the multithread options in my local.conf file
      BB_NUMBER_THREADS =3D "2"
      PARALLEL_MAKE =3D "-j 2"
4) create a file "needed.h" that has to be included from
"/alclib/alc_channel.h" containing just 2 structures copied bu
"usr/include/netinet/in.h"

_______needed.h___________________________________
struct ip_mreq
  {
    /* IP multicast address of group.  */
    struct in_addr imr_multiaddr;

    /* Local IP address of interface.  */
    struct in_addr imr_interface;
  };

struct ip_mreq_source
  {
    /* IP multicast address of group.  */
    struct in_addr imr_multiaddr;

    /* IP address of source.  */
    struct in_addr imr_interface;

    /* IP address of interface.  */
    struct in_addr imr_sourceaddr;
  };
___________________________________________________


5) create a recipe called madfcl_1.0.0.bb to use it
___________________________________________________
DESCRIPTION =3D "flute"

DEPENDS =3D "expat openssl curl zlib cppunit"

SRC_URI =3D "file://mad_fcl_v1.7_src.tar.gz\
"

S =3D "${WORKDIR}/mad_fcl_v1.7_src"

do_install(){
        install -m 0755 -d ${D}${bindir} ${S}${docdir}/mad_fcl_v1.7_src
}

FILES_${PN} +=3D "${bindir}/flute"
_____________________________________________________



Only after all this it can cross-compile and i can find the executable
in the folder
~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/madfcl-1.0.0-r0/mad_fcl_v1.7_sr=
c/bin

but... I don't know why, in the folder
      ~/oe/tmp/deploy/glibc/ipk/armv7a
i can find
      madfcl-dbg_1.0.0-r0.6_armv7a.ipk
and
      madfcl-dev_1.0.0-r0.6_armv7a.ipk
but there's not the file madfcl_1.0.0-r0.6_armv7a.ipk that I need to
install it... In addition, trying to include the recipe madfcl in the
x11-image recipes using ANGSTROM_EXTRA_INSTALL ?=3D "madfcl", i have a
worrying error: it compiles all the whole image without errors but, in
the end i have:


____________________________________________________
........
| Configuring task-base-extended.
| Configuring tinylogin.
| Configuring dvbsnoop.
| Configuring psplash-angstrom.
| Configuring dvb-apps.
| Configuring locale-base-en-us.
| Configuring itkeyboard.
| Configuring sysvinit.
| Collected errors:
|  * opkg_install_cmd: Cannot install package madfcl.
|  * resolve_conffiles: Existing conffile
/home/XXX/oe/tmp/rootfs/MYimage/etc/device_table is different from the
conffile in the new package. The new conffile will be placed at
/home/XXX/oe/tmp/rootfs/MYimage/etc/device_table-opkg.
| ERROR: Function do_rootfs failed
NOTE: package MYimage-1.0-r0: task do_rootfs: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/XXX/oe/openembedded/recipes/images/MYimage.bb
do_rootfs failed
ERROR: Task 14 (/home/XXX/oe/openembedded/recipes/images/MYimage.bb,
do_rootfs) failed with 256
ERROR: '/home/XXX/oe/openembedded/recipes/images/MYimage.bb' failed
_____________________________________________________



Why this??? the two files above are indeed different:


oe/tmp/rootfs/MYimage/etc/device_table
___________________________________________________________________________=
__________________
#<path> <type> <mode>   <uid>   <gid>   <major> <minor> <start> <inc>   <co=
unt>
#/dev/mem    c      640      0       0       1       1       0        0    =
    -
#
#type can be one of:
#    f  A regular file
#    d  Directory
#    c  Character special device file
#    b  Block special device file
#    p  Fifo (named pipe)

/dev            d       755     0       0       -       -       -       -  =
     -
/dev/initctl    p       600     0       0       -       -       -       -  =
     -
/dev/apm_bios   c       660     0       46      10      134     -       -  =
     -
/dev/fb0        c       600     0       0       29      0       -       -  =
     -
/dev/hda        b       660     0       6       3       0       -       -  =
     -
/dev/hda        b       660     0       6       3       1       1       1  =
     19
/dev/kmem       c       640     0       15      1       2       -       -  =
     -
/dev/mem        c       640     0       15      1       1       -       -  =
     -
/dev/null       c       666     0       0       1       3       -       -  =
     -
/dev/ram        b       640     0       0       1       0       0       1  =
     4
/dev/tty        c       662     0       5       5       0       -       -  =
     -
/dev/tty        c       666     0       5       4       0       0       1  =
     9
/dev/ttyS       c       640     0       5       4       64      0       1  =
     1
/dev/ttySA      c       640     0       5       204     5       0       1  =
     1
/dev/zero       c       644     0       0       1       5       -       -  =
     -
/dev/mtd        c       660     0       6       90      0       0       2  =
     8
/dev/mtdblock   b       640     0       0       31      0       0       1  =
     8
/dev/console    c       662     0       5       5       1       -       -  =
     -
/dev/random     c       644     0       0       1       8       -       -  =
     -
/dev/urandom    c       644     0       0       1       9       -       -  =
     -
/dev/ptmx       c       644     0       0       5       2       -       -  =
     -

# Input stuff
/dev/input      d       755     0       0       -       -       -       -  =
     -
/dev/input/event c      660     0       0       13      64      0       1  =
     8

/dev/mmcblk0    b       660     0       6       179     0       -       -  =
     -
/dev/mmcblk0p   b       660     0       6       179     1       1       1  =
     7

# for older kernels before 2.6.22
# mmc numbers are assigned dynamicly so if you have other dynamic
assigned block devices it may be wrong
#
#/dev/mmcblk0    b       660     0       6       254     0       -
  -       -
#/dev/mmcblk0p   b       660     0       6       254     1       1
  1       7
___________________________________________________________________________=
__________________



and

oe/tmp/rootfs/MYimage/etc/device_table-opkg
___________________________________________________________________________=
__________________
#/dev/          d       775     0       0       -       -       -       -  =
     -
#/dev/msys      d       775     0       0       -       -       -       -  =
     -
#/dev/pts       d       775     0       0       -       -       -       -  =
     -
#/var           d       775     0       0       -       -       -       -  =
     -
/boot/var/empty d       755     0       3       -       -       -       -
/dev/apm_bios   c       660     0       46      10      134     -       -  =
     -
/dev/audio      c       660     0       29      14      4       -       -  =
     -
/dev/audio1     c       660     0       29      14      20      -       -  =
     -
/dev/audio2     c       660     0       29      14      36      -       -  =
     -
/dev/audio3     c       660     0       29      14      52      -       -  =
     -
/dev/bty        c       644     0       0       60      0       0       1  =
     5
/dev/sharp_fl   c       640     0       44      254     0       -       -  =
     -
/dev/console    c       660     0       5       5       1       -       -
/dev/cusa0      c       640     0       0       205     5       -       -  =
     -
/dev/cusa1      c       640     0       0       205     6       -       -  =
     -
/dev/cusa2      c       640     0       0       205     7       -       -  =
     -
/dev/dsp        c       660     0       29      14      3       -       -  =
     -
/dev/dsp1       c       660     0       29      14      19      -       -  =
     -
/dev/dsp2       c       660     0       29      14      35      -       -  =
     -
/dev/dsp3       c       660     0       29      14      51      -       -  =
     -
/dev/fb         c       660     0       44      29      0       0       32 =
     2
/dev/fb0autodetect      c       660     0       44      29      1       -  =
     -       -
/dev/fb0current c       660     0       44      29      0       -       -  =
     -
#/dev/fb1       c       660     0       44      29      32      -       -  =
     -
/dev/fb1autodetect      c       660     0       44      29      33      -  =
     -       -
/dev/fb1current c       660     0       44      29      32      -       -  =
     -
/dev/full       c       666     0       7       -       -       -
/dev/hda        b       660     0       6       3       0       -       -  =
     -
/dev/hda        b       660     0       6       3       1       1       1  =
     20
/dev/hdb        b       660     0       6       3       64      -       -  =
     -
/dev/hdb        b       660     0       6       3       65      1       1  =
     20
/dev/hdc        b       660     0       6       22      0       -       -  =
     -
/dev/hdc        b       660     0       6       22      1       1       1  =
     20
/dev/initctl    p       600     0       0       -       -       -       -
/dev/i2c0       c       660     0       0       89      0       -       -  =
     -
/dev/inportbm   c       660     0       0       10      2       -       -  =
     -
/dev/input/event c      660     0       0       13      64      0       1  =
     20
/dev/ircomm0    c       640     0       0       161     0       -       -  =
     -
/dev/jbm        c       660     0       0       10      4       -       -  =
     -
/dev/kmem       c       640     0       15      1       2       -       -  =
     -
/dev/lirc       c       660     0       5       61      0       -       -  =
     -
/dev/logibm     c       660     0       0       10      0       -       -  =
     -
/dev/loop0      b       660     0       11      7       0       -       -  =
     -
/dev/loop1      b       660     0       11      7       1       -       -  =
     -
/dev/mem        c       640     0       15      1       1       -       -  =
     -
/dev/mixer      c       666     0       0       14      0       -       -  =
     -
/dev/mixer1     c       666     0       0       14      16      -       -  =
     -
/dev/mixer2     c       666     0       0       14      32      -       -  =
     -
/dev/mixer3     c       666     0       0       14      48      -       -  =
     -
/dev/mmcda      b       640     0       0       60      0       -       -  =
     -
/dev/mmcda1     b       640     0       0       60      1       -       -  =
     -
/dev/mmcda2     b       640     0       0       60      2       -       -  =
     -
/dev/msys/fla   b       660     0       11      100     0       -       -  =
     -
/dev/msys/fla1  b       660     0       11      100     1       -       -  =
     -
/dev/msys/fla2  b       660     0       11      100     2       -       -  =
     -
/dev/msys/fla3  b       660     0       11      100     3       -       -  =
     -
/dev/msys/fla4  b       660     0       11      100     4       -       -  =
     -
/dev/msys/flb   b       660     0       11      100     64      -       -  =
     -
/dev/msys/flb1  b       660     0       11      100     65      -       -  =
     -
/dev/msys/flb2  b       660     0       11      100     66      -       -  =
     -
/dev/msys/flb3  b       660     0       11      100     67      -       -  =
     -
/dev/msys/flb4  b       660     0       11      100     68      -       -  =
     -
/dev/mtd        c       660     0       6       90      0       0       2  =
     8
/dev/mtdblock   b       640     0       0       31      0       0       1  =
     8
/dev/nst0       c       664     0       11      9       128     -       -  =
     -
/dev/nst0a      c       664     0       11      9       224     -       -  =
     -
/dev/nst0l      c       664     0       11      9       160     -       -  =
     -
/dev/nst0m      c       664     0       11      9       192     -       -  =
     -
/dev/nst1       c       664     0       11      9       129     -       -  =
     -
/dev/nst1a      c       664     0       11      9       225     -       -  =
     -
/dev/nst1l      c       664     0       11      9       161     -       -  =
     -
/dev/nst1m      c       664     0       11      9       193     -       -  =
     -
/dev/null       c       666     0       0       1       3       -       -  =
     -
/dev/par0       c       660     0       7       6       0       -       -  =
     -
/dev/par1       c       660     0       7       6       1       -       -  =
     -
/dev/par2       c       660     0       7       6       2       -       -  =
     -
/dev/port       c       640     0       15      1       4       -       -  =
     -
/dev/ppp        c       640     0       0       108     0       -       -  =
     -
/dev/psaux      c       660     0       0       10      1       -       -  =
     -
/dev/ptmx       c       666     0       5       5       2       -       -  =
     -
/dev/ptya0      c       660     0       5       2       176     -       -  =
     -
/dev/ptya1      c       660     0       5       2       177     -       -  =
     -
/dev/ptya2      c       660     0       5       2       178     -       -  =
     -
/dev/ptya3      c       660     0       5       2       179     -       -  =
     -
/dev/ptya4      c       660     0       5       2       180     -       -  =
     -
/dev/ptya5      c       660     0       5       2       181     -       -  =
     -
/dev/ptya6      c       660     0       5       2       182     -       -  =
     -
/dev/ptya7      c       660     0       5       2       183     -       -  =
     -
/dev/ptya8      c       660     0       5       2       184     -       -  =
     -
/dev/ptya9      c       660     0       5       2       185     -       -  =
     -
/dev/ptyaa      c       660     0       5       2       186     -       -  =
     -
/dev/ptyab      c       660     0       5       2       187     -       -  =
     -
/dev/ptyac      c       660     0       5       2       188     -       -  =
     -
/dev/ptyad      c       660     0       5       2       189     -       -  =
     -
/dev/ptyae      c       660     0       5       2       190     -       -  =
     -
/dev/ptyaf      c       660     0       5       2       191     -       -  =
     -
/dev/ram        b       640     0       0       1       0       0       1  =
     4
/dev/random     c       444     0       0       1       8       -       -  =
     -
/dev/rfcomm0    c       660     0       0       216     0       -       -  =
     -
/dev/rfcomm1    c       660     0       0       216     1       -       -  =
     -
/dev/rfcomm2    c       660     0       0       216     2       -       -  =
     -
/dev/rfcomm3    c       660     0       0       216     3       -       -  =
     -
/dev/rfcomm4    c       660     0       0       216     4       -       -  =
     -
/dev/rfcomm5    c       660     0       0       216     5       -       -  =
     -
/dev/rfcomm6    c       660     0       0       216     6       -       -  =
     -
/dev/rfcomm7    c       660     0       0       216     7       -       -  =
     -
/dev/rfcomm8    c       660     0       0       216     8       -       -  =
     -
/dev/rfcomm9    c       660     0       0       216     9       -       -  =
     -
/dev/rfcomm10   c       660     0       0       216     10      -       -  =
     -
/dev/rfcomm11   c       660     0       0       216     11      -       -  =
     -
/dev/rfcomm12   c       660     0       0       216     12      -       -  =
     -
/dev/rfcomm13   c       660     0       0       216     13      -       -  =
     -
/dev/rfcomm14   c       660     0       0       216     14      -       -  =
     -
/dev/rfcomm15   c       660     0       0       216     15      -       -  =
     -
/dev/rmidi0     c       660     0       0       35      64      -       -  =
     -
/dev/rmidi1     c       660     0       0       35      65      -       -  =
     -
/dev/rmidi2     c       660     0       0       35      66      -       -  =
     -
/dev/rmidi3     c       660     0       0       35      67      -       -  =
     -
/dev/rtc        c       660     0       47      10      135     -       -  =
     -
/dev/scd0       b       660     0       6       11      0       -       -  =
     -
/dev/scd1       b       660     0       6       11      1       -       -  =
     -
/dev/sda        b       660     0       6       8       0       -       -  =
     -
/dev/sda1       b       660     0       6       8       1       -       -  =
     -
/dev/sda2       b       660     0       6       8       2       -       -  =
     -
/dev/sda3       b       660     0       6       8       3       -       -  =
     -
/dev/sda4       b       660     0       6       8       4       -       -  =
     -
/dev/sda5       b       660     0       6       8       5       -       -  =
     -
/dev/sda6       b       660     0       6       8       6       -       -  =
     -
/dev/sda7       b       660     0       6       8       7       -       -  =
     -
/dev/sda8       b       660     0       6       8       8       -       -  =
     -
/dev/sda9       b       660     0       6       8       9       -       -  =
     -
/dev/sdb        b       660     0       6       8       16      -       -  =
     -
/dev/sdb1       b       660     0       6       8       17      -       -  =
     -
/dev/sdb2       b       660     0       6       8       18      -       -  =
     -
/dev/sdb3       b       660     0       6       8       19      -       -  =
     -
/dev/sdb4       b       660     0       6       8       20      -       -  =
     -
/dev/sdb5       b       660     0       6       8       21      -       -  =
     -
/dev/sdb6       b       660     0       6       8       22      -       -  =
     -
/dev/sdb7       b       660     0       6       8       23      -       -  =
     -
/dev/sdb8       b       660     0       6       8       24      -       -  =
     -
/dev/sdb9       b       660     0       6       8       25      -       -  =
     -
/dev/sdc        b       660     0       6       8       32      -       -  =
     -
/dev/sdc1       b       660     0       6       8       33      -       -  =
     -
/dev/sdc2       b       660     0       6       8       34      -       -  =
     -
/dev/sdc3       b       660     0       6       8       35      -       -  =
     -
/dev/sdc4       b       660     0       6       8       36      -       -  =
     -
/dev/sdc5       b       660     0       6       8       37      -       -  =
     -
/dev/sdc6       b       660     0       6       8       38      -       -  =
     -
/dev/sdc7       b       660     0       6       8       39      -       -  =
     -
/dev/sdc8       b       660     0       6       8       40      -       -  =
     -
/dev/sdc9       b       660     0       6       8       41      -       -  =
     -
/dev/sd_slotstat        c       660     0       6       10      240     -  =
     -       -
/dev/sharp_audioctl     c       660     0       29      10      213     -  =
     -       -
/dev/sharp_buz  c       660     0       29      10      211     -       -  =
     -
/dev/sharp_kbdctl       c       660     0       45      10      214     -  =
     -       -
/dev/sharp_led  c       660     0       48      10      210     -       -  =
     -
/dev/sharp_ts   c       640     0       45      11      0       -       -  =
     -
/dev/smtpe0     c       640     0       0       35      128     -       -  =
     -
/dev/smtpe1     c       640     0       0       35      129     -       -  =
     -
/dev/smtpe2     c       640     0       0       35      130     -       -  =
     -
/dev/smtpe3     c       640     0       0       35      131     -       -  =
     -
/dev/sndstat    c       660     0       29      14      6       -       -  =
     -
/dev/snd/seq    c       660     0       0       116     1       -       -  =
     -
/dev/snd/timer  c       660     0       0       116     33      -       -  =
     -
/dev/snd/controlC0      c       660     0       0       116     0       -  =
     -       -
/dev/snd/controlC1      c       660     0       0       116     32      -  =
     -       -
/dev/snd/controlC2      c       660     0       0       116     64      -  =
     -       -
/dev/snd/controlC3      c       660     0       0       116     96      -  =
     -       -
/dev/snd/hwC0D0 c       660     0       0       116     4       -       -  =
     -
/dev/snd/hwC0D1 c       660     0       0       116     5       -       -  =
     -
/dev/snd/hwC0D2 c       660     0       0       116     6       -       -  =
     -
/dev/snd/hwC0D3 c       660     0       0       116     7       -       -  =
     -
/dev/snd/pcmC0D0c       c       660     0       0       116     24      -  =
     -       -
/dev/snd/pcmC0D0p       c       660     0       0       116     16      -  =
     -       -
/dev/snd/pcmC0D1c       c       660     0       0       116     25      -  =
     -       -
/dev/snd/pcmC0D1p       c       660     0       0       116     17      -  =
     -       -
/dev/snd/pcmC0D2c       c       660     0       0       116     26      -  =
     -       -
/dev/snd/pcmC0D2p       c       660     0       0       116     18      -  =
     -       -
/dev/snd/pcmC0D3c       c       660     0       0       116     27      -  =
     -       -
/dev/snd/pcmC0D3p       c       660     0       0       116     19      -  =
     -       -
/dev/st0        c       660     0       11      9       0       -       -  =
     -
/dev/st0a       c       660     0       11      9       96      -       -  =
     -
/dev/st0l       c       660     0       11      9       32      -       -  =
     -
/dev/st0m       c       660     0       11      9       64      -       -  =
     -
/dev/st1        c       660     0       11      9       1       -       -  =
     -
/dev/st1a       c       660     0       11      9       97      -       -  =
     -
/dev/st1l       c       660     0       11      9       33      -       -  =
     -
/dev/st1m       c       660     0       11      9       65      -       -  =
     -
/dev/tty        c       664     0       5       5       0       -       -  =
     -
/dev/tty        c       666     0       5       4       0       0       1  =
     9
/dev/ttyS       c       640     0       5       4       64      0       1  =
     4
/dev/ttySA      c       640     0       5       204     5       0       1  =
     4
/dev/ttyUSB     c       660     0       5       188     0       0       1  =
     2
/dev/urandom    c       644     0       0       1       9       -       -  =
     -
/dev/usbmouse   c       640     0       45      10      32      -       -  =
     -
/dev/zero       c       644     0       0       1       5       -       -  =
     -
/dev/input/mice c       660     0       0       13      63      -       -  =
     -
___________________________________________________________________________=
____________


I really don't know how can i use it... furthermonre, simply copying
the bin file on the SD containing the image, it doesn't work
properly...


LAST QUESTION: do you know something that allows (like flute) to send
file and receive them, working on OE??? the idea is this:

Sender-->HUB (NO SWITCH) ----> multiple receivers

Sender (IP 192.168.1.50): Send A.txt to 192.168.1.10
Receiver 192.168.1.10: Receive file from 192.168.1.50

Can somebody help me??? Thank you all

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


