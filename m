Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3mmA-0006Yc-2T for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 11:28:36 +0200
Received: from f053038231.adsl.alicedsl.de ([78.53.38.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3mlr-0002F5-00 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 09:28:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Oct 2010 11:28:13 +0200
Message-ID: <1286443693.3792.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xerces-c: Use recent `config.sub` to support building with uClibc.
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
X-List-Received-Date: Thu, 07 Oct 2010 09:28:37 -0000
X-Groupsio-MsgNum: 24471
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8KkX3pt3xd2UA0A/0BMA"

--=-8KkX3pt3xd2UA0A/0BMA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`xerces-c-2.8.0.bb` fails to build with uClibc. I tried to add a more
recent `config.sub` but `do_patch()` fails. Manually patching from the
work directory works though.

        minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/xerces-c-2.8.0-r=
1/xerces-c-src_2_8_0$ patch -p1 < /oe/openembedded/recipes/xerces-c/xerces-=
c-2.8.0/config.sub.patch
        patching file src/xercesc/config.sub

Could you please tell me what is wrong with my patch.


Thanks,

Paul


PS: You can apply my patch/message with `git am --scissors =E2=80=A6`.

8<-------------------------------------------------------------------->8
Date: Wed, 6 Oct 2010 15:51:23 +0200
Subject: [PATCH] xerces-c: Use recent `config.sub` to support building with=
 uClibc.

Xerces-C++ 2.8.0 includes an outdated `config.sub` (`timestamp=3D'2002-07-0=
3'`) which does not support uClibc.

	"Invalid configuration `arm-oe-linux-uclibceabi': machine `arm-oe-linux' n=
ot recognized"

Replace it with the current `config.sub` (`timestamp=3D'2008-01-16'`).

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xerces-c/xerces-c-2.8.0/config.sub.patch |  901 ++++++++++++++++++=
++++
 recipes/xerces-c/xerces-c_2.8.0.bb               |    1 +
 2 files changed, 902 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xerces-c/xerces-c-2.8.0/config.sub.patch

diff --git a/recipes/xerces-c/xerces-c-2.8.0/config.sub.patch b/recipes/xer=
ces-c/xerces-c-2.8.0/config.sub.patch
new file mode 100644
index 0000000..0fc2633
--- /dev/null
+++ b/recipes/xerces-c/xerces-c-2.8.0/config.sub.patch
@@ -0,0 +1,901 @@
+upstream: Xerces-C++ 2.8.0 is not supported anymore.
+comment: Use most recent `config.sub` taken from SVN r1361 [1] which inclu=
des support for uClibc.
+
+[1] http://cvs.savannah.gnu.org/viewvc/config/config/config.sub
+
+Index: xerces-c-src_2_8_0/src/xercesc/config.sub
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- xerces-c-src_2_8_0.orig/src/xercesc/config.sub	2007-08-28 20:44:56.000=
000000 +0200
++++ xerces-c-src_2_8_0/src/xercesc/config.sub	2010-10-06 15:37:52.00000000=
0 +0200
+@@ -1,9 +1,10 @@
+-#!/bin/sh
++#! /bin/sh
+ # Configuration validation subroutine script.
+ #   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
+-#   2000, 2001, 2002 Free Software Foundation, Inc.
++#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
++#   Free Software Foundation, Inc.
+=20
+-timestamp=3D'2002-07-03'
++timestamp=3D'2008-01-16'
+=20
+ # This file is (in principle) common to ALL GNU software.
+ # The presence of a machine in this file suggests that SOME GNU software
+@@ -21,14 +22,15 @@
+ #
+ # You should have received a copy of the GNU General Public License
+ # along with this program; if not, write to the Free Software
+-# Foundation, Inc., 59 Temple Place - Suite 330,
+-# Boston, MA 02111-1307, USA.
+-
++# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
++# 02110-1301, USA.
++#
+ # As a special exception to the GNU General Public License, if you
+ # distribute this file as part of a program that contains a
+ # configuration script generated by Autoconf, you may include it under
+ # the same distribution terms that you use for the rest of that program.
+=20
++
+ # Please send patches to <config-patches@gnu.org>.  Submit a context
+ # diff and a properly formatted ChangeLog entry.
+ #
+@@ -70,8 +72,8 @@
+ version=3D"\
+ GNU config.sub ($timestamp)
+=20
+-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
+-Free Software Foundation, Inc.
++Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
++2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
+=20
+ This is free software; see the source for copying conditions.  There is N=
O
+ warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E."
+@@ -83,11 +85,11 @@
+ while test $# -gt 0 ; do
+   case $1 in
+     --time-stamp | --time* | -t )
+-       echo "$timestamp" ; exit 0 ;;
++       echo "$timestamp" ; exit ;;
+     --version | -v )
+-       echo "$version" ; exit 0 ;;
++       echo "$version" ; exit ;;
+     --help | --h* | -h )
+-       echo "$usage"; exit 0 ;;
++       echo "$usage"; exit ;;
+     -- )     # Stop option processing
+        shift; break ;;
+     - )	# Use stdin as input.
+@@ -99,7 +101,7 @@
+     *local*)
+        # First pass through any local machine types.
+        echo $1
+-       exit 0;;
++       exit ;;
+=20
+     * )
+        break ;;
+@@ -118,7 +120,9 @@
+ # Here we must recognize all the valid KERNEL-OS combinations.
+ maybe_os=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+ case $maybe_os in
+-  nto-qnx* | linux-gnu* | freebsd*-gnu* | storm-chaos* | os2-emx* | windo=
ws32-* | rtmk-nova*)
++  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* =
| \
++  uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbs=
d*-gnu* | \
++  storm-chaos* | os2-emx* | rtmk-nova*)
+     os=3D-$maybe_os
+     basic_machine=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
+     ;;
+@@ -144,7 +148,7 @@
+ 	-convergent* | -ncr* | -news | -32* | -3600* | -3100* | -hitachi* |\
+ 	-c[123]* | -convex* | -sun | -crds | -omron* | -dg | -ultra | -tti* | \
+ 	-harris | -dolphin | -highlevel | -gould | -cbm | -ns | -masscomp | \
+-	-apple | -axis)
++	-apple | -axis | -knuth | -cray)
+ 		os=3D
+ 		basic_machine=3D$1
+ 		;;
+@@ -169,6 +173,10 @@
+ 	-hiux*)
+ 		os=3D-hiuxwe2
+ 		;;
++	-sco6)
++		os=3D-sco5v6
++		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
++		;;
+ 	-sco5)
+ 		os=3D-sco3.2v5
+ 		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
+@@ -185,6 +193,10 @@
+ 		# Don't forget version if it is 3.2v4 or newer.
+ 		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
+ 		;;
++	-sco5v6*)
++		# Don't forget version if it is 3.2v4 or newer.
++		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
++		;;
+ 	-sco*)
+ 		os=3D-sco3.2v2
+ 		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
+@@ -228,39 +240,52 @@
+ 	| a29k \
+ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
+ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[=
67] \
+-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr \
++	| am33_2.0 \
++	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | a=
vr32 \
++	| bfin \
+ 	| c4x | clipper \
+ 	| d10v | d30v | dlx | dsp16xx \
+-	| fr30 | frv \
++	| fido | fr30 | frv \
+ 	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
+ 	| i370 | i860 | i960 | ia64 \
+-	| ip2k \
+-	| m32r | m68000 | m68k | m88k | mcore \
++	| ip2k | iq2000 \
++	| m32c | m32r | m32rle | m68000 | m68k | m88k \
++	| maxq | mb | microblaze | mcore | mep \
+ 	| mips | mipsbe | mipseb | mipsel | mipsle \
+ 	| mips16 \
+ 	| mips64 | mips64el \
++	| mips64vr | mips64vrel \
+ 	| mips64orion | mips64orionel \
+ 	| mips64vr4100 | mips64vr4100el \
+ 	| mips64vr4300 | mips64vr4300el \
+ 	| mips64vr5000 | mips64vr5000el \
++	| mips64vr5900 | mips64vr5900el \
+ 	| mipsisa32 | mipsisa32el \
++	| mipsisa32r2 | mipsisa32r2el \
+ 	| mipsisa64 | mipsisa64el \
++	| mipsisa64r2 | mipsisa64r2el \
+ 	| mipsisa64sb1 | mipsisa64sb1el \
++	| mipsisa64sr71k | mipsisa64sr71kel \
+ 	| mipstx39 | mipstx39el \
+ 	| mn10200 | mn10300 \
++	| mt \
++	| msp430 \
++	| nios | nios2 \
+ 	| ns16k | ns32k \
+-	| openrisc | or32 \
++	| or32 \
+ 	| pdp10 | pdp11 | pj | pjl \
+ 	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
+ 	| pyramid \
+-	| sh | sh[1234] | sh3e | sh[34]eb | shbe | shle | sh[1234]le | sh3ele \
++	| score \
++	| sh | sh[1234] | sh[24]a | sh[23]e | sh[34]eb | sheb | shbe | shle | sh=
[1234]le | sh3ele \
+ 	| sh64 | sh64le \
+-	| sparc | sparc64 | sparc86x | sparclet | sparclite | sparcv9 | sparcv9b=
 \
+-	| strongarm \
+-	| tahoe | thumb | tic80 | tron \
++	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | sparclit=
e \
++	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
++	| spu | strongarm \
++	| tahoe | thumb | tic4x | tic80 | tron \
+ 	| v850 | v850e \
+ 	| we32k \
+-	| x86 | xscale | xstormy16 | xtensa \
++	| x86 | xc16x | xscale | xscalee[bl] | xstormy16 | xtensa \
+ 	| z8k)
+ 		basic_machine=3D$basic_machine-unknown
+ 		;;
+@@ -271,6 +296,9 @@
+ 		;;
+ 	m88110 | m680[12346]0 | m683?2 | m68360 | m5200 | v70 | w65 | z8k)
+ 		;;
++	ms1)
++		basic_machine=3Dmt-unknown
++		;;
+=20
+ 	# We use `pc' rather than `unknown'
+ 	# because (1) that's what they normally are, and
+@@ -290,49 +318,65 @@
+ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
+ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
+ 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
+-	| avr-* \
+-	| bs2000-* \
+-	| c[123]* | c30-* | [cjt]90-* | c54x-* \
+-	| clipper-* | cydra-* \
++	| avr-* | avr32-* \
++	| bfin-* | bs2000-* \
++	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
++	| clipper-* | craynv-* | cydra-* \
+ 	| d10v-* | d30v-* | dlx-* \
+ 	| elxsi-* \
+-	| f30[01]-* | f700-* | fr30-* | frv-* | fx80-* \
++	| f30[01]-* | f700-* | fido-* | fr30-* | frv-* | fx80-* \
+ 	| h8300-* | h8500-* \
+ 	| hppa-* | hppa1.[01]-* | hppa2.0-* | hppa2.0[nw]-* | hppa64-* \
+ 	| i*86-* | i860-* | i960-* | ia64-* \
+-	| ip2k-* \
+-	| m32r-* \
++	| ip2k-* | iq2000-* \
++	| m32c-* | m32r-* | m32rle-* \
+ 	| m68000-* | m680[012346]0-* | m68360-* | m683?2-* | m68k-* \
+-	| m88110-* | m88k-* | mcore-* \
++	| m88110-* | m88k-* | maxq-* | mcore-* \
+ 	| mips-* | mipsbe-* | mipseb-* | mipsel-* | mipsle-* \
+ 	| mips16-* \
+ 	| mips64-* | mips64el-* \
++	| mips64vr-* | mips64vrel-* \
+ 	| mips64orion-* | mips64orionel-* \
+ 	| mips64vr4100-* | mips64vr4100el-* \
+ 	| mips64vr4300-* | mips64vr4300el-* \
+ 	| mips64vr5000-* | mips64vr5000el-* \
++	| mips64vr5900-* | mips64vr5900el-* \
+ 	| mipsisa32-* | mipsisa32el-* \
++	| mipsisa32r2-* | mipsisa32r2el-* \
+ 	| mipsisa64-* | mipsisa64el-* \
++	| mipsisa64r2-* | mipsisa64r2el-* \
+ 	| mipsisa64sb1-* | mipsisa64sb1el-* \
+-	| mipstx39 | mipstx39el \
++	| mipsisa64sr71k-* | mipsisa64sr71kel-* \
++	| mipstx39-* | mipstx39el-* \
++	| mmix-* \
++	| mt-* \
++	| msp430-* \
++	| nios-* | nios2-* \
+ 	| none-* | np1-* | ns16k-* | ns32k-* \
+ 	| orion-* \
+ 	| pdp10-* | pdp11-* | pj-* | pjl-* | pn-* | power-* \
+ 	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
+ 	| pyramid-* \
+ 	| romp-* | rs6000-* \
+-	| sh-* | sh[1234]-* | sh3e-* | sh[34]eb-* | shbe-* \
++	| sh-* | sh[1234]-* | sh[24]a-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe=
-* \
+ 	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
+-	| sparc-* | sparc64-* | sparc86x-* | sparclet-* | sparclite-* \
+-	| sparcv9-* | sparcv9b-* | strongarm-* | sv1-* | sx?-* \
+-	| tahoe-* | thumb-* | tic30-* | tic54x-* | tic80-* | tron-* \
++	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparclet-=
* \
++	| sparclite-* \
++	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | strongarm-* | sv1-* =
| sx?-* \
++	| tahoe-* | thumb-* \
++	| tic30-* | tic4x-* | tic54x-* | tic55x-* | tic6x-* | tic80-* \
++	| tron-* \
+ 	| v850-* | v850e-* | vax-* \
+ 	| we32k-* \
+-	| x86-* | x86_64-* | xps100-* | xscale-* | xstormy16-* \
+-	| xtensa-* \
++	| x86-* | x86_64-* | xc16x-* | xps100-* | xscale-* | xscalee[bl]-* \
++	| xstormy16-* | xtensa*-* \
+ 	| ymp-* \
+ 	| z8k-*)
+ 		;;
++	# Recognize the basic CPU types without company name, with glob match.
++	xtensa*)
++		basic_machine=3D$basic_machine-unknown
++		;;
+ 	# Recognize the various machine names and aliases which stand
+ 	# for a CPU type and a company and sometimes even an OS.
+ 	386bsd)
+@@ -349,6 +393,9 @@
+ 		basic_machine=3Da29k-amd
+ 		os=3D-udi
+ 		;;
++    	abacus)
++		basic_machine=3Dabacus-unknown
++		;;
+ 	adobe68k)
+ 		basic_machine=3Dm68010-adobe
+ 		os=3D-scout
+@@ -363,6 +410,12 @@
+ 		basic_machine=3Da29k-none
+ 		os=3D-bsd
+ 		;;
++	amd64)
++		basic_machine=3Dx86_64-pc
++		;;
++	amd64-*)
++		basic_machine=3Dx86_64-`echo $basic_machine | sed 's/^[^-]*-//'`
++		;;
+ 	amdahl)
+ 		basic_machine=3D580-amdahl
+ 		os=3D-sysv
+@@ -394,6 +447,14 @@
+ 		basic_machine=3Dns32k-sequent
+ 		os=3D-dynix
+ 		;;
++	blackfin)
++		basic_machine=3Dbfin-unknown
++		os=3D-linux
++		;;
++	blackfin-*)
++		basic_machine=3Dbfin-`echo $basic_machine | sed 's/^[^-]*-//'`
++		os=3D-linux
++		;;
+ 	c90)
+ 		basic_machine=3Dc90-cray
+ 		os=3D-unicos
+@@ -422,12 +483,27 @@
+ 		basic_machine=3Dj90-cray
+ 		os=3D-unicos
+ 		;;
++	craynv)
++		basic_machine=3Dcraynv-cray
++		os=3D-unicosmp
++		;;
++	cr16)
++		basic_machine=3Dcr16-unknown
++		os=3D-elf
++		;;
+ 	crds | unos)
+ 		basic_machine=3Dm68k-crds
+ 		;;
++	crisv32 | crisv32-* | etraxfs*)
++		basic_machine=3Dcrisv32-axis
++		;;
+ 	cris | cris-* | etrax*)
+ 		basic_machine=3Dcris-axis
+ 		;;
++	crx)
++		basic_machine=3Dcrx-unknown
++		os=3D-elf
++		;;
+ 	da30 | da30-*)
+ 		basic_machine=3Dm68k-da30
+ 		;;
+@@ -450,6 +526,10 @@
+ 		basic_machine=3Dm88k-motorola
+ 		os=3D-sysv3
+ 		;;
++	djgpp)
++		basic_machine=3Di586-pc
++		os=3D-msdosdjgpp
++		;;
+ 	dpx20 | dpx20-*)
+ 		basic_machine=3Drs6000-bull
+ 		os=3D-bosx
+@@ -600,6 +680,14 @@
+ 		basic_machine=3Dm68k-isi
+ 		os=3D-sysv
+ 		;;
++	m68knommu)
++		basic_machine=3Dm68k-unknown
++		os=3D-linux
++		;;
++	m68knommu-*)
++		basic_machine=3Dm68k-`echo $basic_machine | sed 's/^[^-]*-//'`
++		os=3D-linux
++		;;
+ 	m88k-omron*)
+ 		basic_machine=3Dm88k-omron
+ 		;;
+@@ -615,6 +703,10 @@
+ 		basic_machine=3Di386-pc
+ 		os=3D-mingw32
+ 		;;
++	mingw32ce)
++		basic_machine=3Darm-unknown
++		os=3D-mingw32ce
++		;;
+ 	miniframe)
+ 		basic_machine=3Dm68000-convergent
+ 		;;
+@@ -628,10 +720,6 @@
+ 	mips3*)
+ 		basic_machine=3D`echo $basic_machine | sed -e 's/mips3/mips64/'`-unknow=
n
+ 		;;
+-	mmix*)
+-		basic_machine=3Dmmix-knuth
+-		os=3D-mmixware
+-		;;
+ 	monitor)
+ 		basic_machine=3Dm68k-rom68k
+ 		os=3D-coff
+@@ -644,6 +732,9 @@
+ 		basic_machine=3Di386-pc
+ 		os=3D-msdos
+ 		;;
++	ms1-*)
++		basic_machine=3D`echo $basic_machine | sed -e 's/ms1-/mt-/'`
++		;;
+ 	mvs)
+ 		basic_machine=3Di370-ibm
+ 		os=3D-mvs
+@@ -719,9 +810,12 @@
+ 		basic_machine=3Dhppa1.1-oki
+ 		os=3D-proelf
+ 		;;
+-	or32 | or32-*)
++	openrisc | openrisc-*)
+ 		basic_machine=3Dor32-unknown
+-		os=3D-coff
++		;;
++	os400)
++		basic_machine=3Dpowerpc-ibm
++		os=3D-os400
+ 		;;
+ 	OSE68000 | ose68000)
+ 		basic_machine=3Dm68000-ericsson
+@@ -739,55 +833,75 @@
+ 		basic_machine=3Di860-intel
+ 		os=3D-osf
+ 		;;
++	parisc)
++		basic_machine=3Dhppa-unknown
++		os=3D-linux
++		;;
++	parisc-*)
++		basic_machine=3Dhppa-`echo $basic_machine | sed 's/^[^-]*-//'`
++		os=3D-linux
++		;;
+ 	pbd)
+ 		basic_machine=3Dsparc-tti
+ 		;;
+ 	pbb)
+ 		basic_machine=3Dm68k-tti
+ 		;;
+-        pc532 | pc532-*)
++	pc532 | pc532-*)
+ 		basic_machine=3Dns32k-pc532
+ 		;;
++	pc98)
++		basic_machine=3Di386-pc
++		;;
++	pc98-*)
++		basic_machine=3Di386-`echo $basic_machine | sed 's/^[^-]*-//'`
++		;;
+ 	pentium | p5 | k5 | k6 | nexgen | viac3)
+ 		basic_machine=3Di586-pc
+ 		;;
+-	pentiumpro | p6 | 6x86 | athlon)
++	pentiumpro | p6 | 6x86 | athlon | athlon_*)
+ 		basic_machine=3Di686-pc
+ 		;;
+-	pentiumii | pentium2)
++	pentiumii | pentium2 | pentiumiii | pentium3)
+ 		basic_machine=3Di686-pc
+ 		;;
++	pentium4)
++		basic_machine=3Di786-pc
++		;;
+ 	pentium-* | p5-* | k5-* | k6-* | nexgen-* | viac3-*)
+ 		basic_machine=3Di586-`echo $basic_machine | sed 's/^[^-]*-//'`
+ 		;;
+ 	pentiumpro-* | p6-* | 6x86-* | athlon-*)
+ 		basic_machine=3Di686-`echo $basic_machine | sed 's/^[^-]*-//'`
+ 		;;
+-	pentiumii-* | pentium2-*)
++	pentiumii-* | pentium2-* | pentiumiii-* | pentium3-*)
+ 		basic_machine=3Di686-`echo $basic_machine | sed 's/^[^-]*-//'`
+ 		;;
++	pentium4-*)
++		basic_machine=3Di786-`echo $basic_machine | sed 's/^[^-]*-//'`
++		;;
+ 	pn)
+ 		basic_machine=3Dpn-gould
+ 		;;
+ 	power)	basic_machine=3Dpower-ibm
+ 		;;
+ 	ppc)	basic_machine=3Dpowerpc-unknown
+-	        ;;
++		;;
+ 	ppc-*)	basic_machine=3Dpowerpc-`echo $basic_machine | sed 's/^[^-]*-//'`
+ 		;;
+ 	ppcle | powerpclittle | ppc-le | powerpc-little)
+ 		basic_machine=3Dpowerpcle-unknown
+-	        ;;
++		;;
+ 	ppcle-* | powerpclittle-*)
+ 		basic_machine=3Dpowerpcle-`echo $basic_machine | sed 's/^[^-]*-//'`
+ 		;;
+ 	ppc64)	basic_machine=3Dpowerpc64-unknown
+-	        ;;
++		;;
+ 	ppc64-*) basic_machine=3Dpowerpc64-`echo $basic_machine | sed 's/^[^-]*-=
//'`
+ 		;;
+ 	ppc64le | powerpc64little | ppc64-le | powerpc64-little)
+ 		basic_machine=3Dpowerpc64le-unknown
+-	        ;;
++		;;
+ 	ppc64le-* | powerpc64little-*)
+ 		basic_machine=3Dpowerpc64le-`echo $basic_machine | sed 's/^[^-]*-//'`
+ 		;;
+@@ -798,6 +912,10 @@
+ 		basic_machine=3Di586-unknown
+ 		os=3D-pw32
+ 		;;
++	rdos)
++		basic_machine=3Di386-pc
++		os=3D-rdos
++		;;
+ 	rom68k)
+ 		basic_machine=3Dm68k-rom68k
+ 		os=3D-coff
+@@ -818,6 +936,20 @@
+ 		basic_machine=3Da29k-amd
+ 		os=3D-udi
+ 		;;
++	sb1)
++		basic_machine=3Dmipsisa64sb1-unknown
++		;;
++	sb1el)
++		basic_machine=3Dmipsisa64sb1el-unknown
++		;;
++	sde)
++		basic_machine=3Dmipsisa32-sde
++		os=3D-elf
++		;;
++	sei)
++		basic_machine=3Dmips-sei
++		os=3D-seiux
++		;;
+ 	sequent)
+ 		basic_machine=3Di386-sequent
+ 		;;
+@@ -825,6 +957,12 @@
+ 		basic_machine=3Dsh-hitachi
+ 		os=3D-hms
+ 		;;
++	sh5el)
++		basic_machine=3Dsh5le-unknown
++		;;
++	sh64)
++		basic_machine=3Dsh64-unknown
++		;;
+ 	sparclite-wrs | simso-wrs)
+ 		basic_machine=3Dsparclite-wrs
+ 		os=3D-vxworks
+@@ -883,7 +1021,7 @@
+ 	sun386 | sun386i | roadrunner)
+ 		basic_machine=3Di386-sun
+ 		;;
+-        sv1)
++	sv1)
+ 		basic_machine=3Dsv1-cray
+ 		os=3D-unicos
+ 		;;
+@@ -891,10 +1029,6 @@
+ 		basic_machine=3Di386-sequent
+ 		os=3D-dynix
+ 		;;
+-	t3d)
+-		basic_machine=3Dalpha-cray
+-		os=3D-unicos
+-		;;
+ 	t3e)
+ 		basic_machine=3Dalphaev5-cray
+ 		os=3D-unicos
+@@ -907,6 +1041,18 @@
+ 		basic_machine=3Dtic54x-unknown
+ 		os=3D-coff
+ 		;;
++	tic55x | c55x*)
++		basic_machine=3Dtic55x-unknown
++		os=3D-coff
++		;;
++	tic6x | c6x*)
++		basic_machine=3Dtic6x-unknown
++		os=3D-coff
++		;;
++	tile*)
++		basic_machine=3Dtile-unknown
++		os=3D-linux-gnu
++		;;
+ 	tx39)
+ 		basic_machine=3Dmipstx39-unknown
+ 		;;
+@@ -920,6 +1066,10 @@
+ 	tower | tower-32)
+ 		basic_machine=3Dm68k-ncr
+ 		;;
++	tpf)
++		basic_machine=3Ds390x-ibm
++		os=3D-tpf
++		;;
+ 	udi29k)
+ 		basic_machine=3Da29k-amd
+ 		os=3D-udi
+@@ -928,10 +1078,6 @@
+ 		basic_machine=3Da29k-nyu
+ 		os=3D-sym1
+ 		;;
+-	AS400)
+-		basic_machine=3DAS400-ibm
+-		os=3D-OS400
+-		;;	=09
+ 	v810 | necv810)
+ 		basic_machine=3Dv810-nec
+ 		os=3D-none
+@@ -945,8 +1091,8 @@
+ 		os=3D-vms
+ 		;;
+ 	vpp*|vx|vx-*)
+-               basic_machine=3Df301-fujitsu
+-               ;;
++		basic_machine=3Df301-fujitsu
++		;;
+ 	vxworks960)
+ 		basic_machine=3Di960-wrs
+ 		os=3D-vxworks
+@@ -967,11 +1113,11 @@
+ 		basic_machine=3Dhppa1.1-winbond
+ 		os=3D-proelf
+ 		;;
+-	windows32)
+-		basic_machine=3Di386-pc
+-		os=3D-windows32-msvcrt
++	xbox)
++		basic_machine=3Di686-pc
++		os=3D-mingw32
+ 		;;
+-        xps | xps100)
++	xps | xps100)
+ 		basic_machine=3Dxps100-honeywell
+ 		;;
+ 	ymp)
+@@ -1001,6 +1147,9 @@
+ 	romp)
+ 		basic_machine=3Dromp-ibm
+ 		;;
++	mmix)
++		basic_machine=3Dmmix-knuth
++		;;
+ 	rs6000)
+ 		basic_machine=3Drs6000-ibm
+ 		;;
+@@ -1017,16 +1166,13 @@
+ 	we32k)
+ 		basic_machine=3Dwe32k-att
+ 		;;
+-	sh3 | sh4 | sh3eb | sh4eb | sh[1234]le | sh3ele)
++	sh[1234] | sh[24]a | sh[34]eb | sh[1234]le | sh[23]ele)
+ 		basic_machine=3Dsh-unknown
+ 		;;
+-	sh64)
+-		basic_machine=3Dsh64-unknown
+-		;;
+-	sparc | sparcv9 | sparcv9b)
++	sparc | sparcv8 | sparcv9 | sparcv9b | sparcv9v)
+ 		basic_machine=3Dsparc-sun
+ 		;;
+-        cydra)
++	cydra)
+ 		basic_machine=3Dcydra-cydrome
+ 		;;
+ 	orion)
+@@ -1041,10 +1187,6 @@
+ 	pmac | pmac-mpw)
+ 		basic_machine=3Dpowerpc-apple
+ 		;;
+-	c4x*)
+-		basic_machine=3Dc4x-none
+-		os=3D-coff
+-		;;
+ 	*-unknown)
+ 		# Make sure to match an already-canonicalized machine name.
+ 		;;
+@@ -1100,18 +1242,23 @@
+ 	      | -aos* \
+ 	      | -nindy* | -vxsim* | -vxworks* | -ebmon* | -hms* | -mvs* \
+ 	      | -clix* | -riscos* | -uniplus* | -iris* | -rtu* | -xenix* \
+-	      | -hiux* | -386bsd* | -netbsd* | -openbsd* | -freebsd* | -riscix* =
\
+-	      | -lynxos* | -bosx* | -nextstep* | -cxux* | -aout* | -elf* | -oabi=
* \
++	      | -hiux* | -386bsd* | -knetbsd* | -mirbsd* | -netbsd* \
++	      | -openbsd* | -solidbsd* \
++	      | -ekkobsd* | -kfreebsd* | -freebsd* | -riscix* | -lynxos* \
++	      | -bosx* | -nextstep* | -cxux* | -aout* | -elf* | -oabi* \
+ 	      | -ptx* | -coff* | -ecoff* | -winnt* | -domain* | -vsta* \
+ 	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
+ 	      | -chorusos* | -chorusrdb* \
+ 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+-	      | -mingw32* | -linux-gnu* | -uxpv* | -beos* | -mpeix* | -udk* \
+-	      | -interix* | -uwin* | -rhapsody* | -darwin* | -opened* \
++	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
++	      | -uxpv* | -beos* | -mpeix* | -udk* \
++	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
+ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
+ 	      | -storm-chaos* | -tops10* | -tenex* | -tops20* | -its* \
+ 	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
+-	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* | -powe=
rmax*)
++	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
++	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
++	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops*)
+ 	# Remember, each alternative MUST END IN *, to match a version number.
+ 		;;
+ 	-qnx*)
+@@ -1123,16 +1270,21 @@
+ 			;;
+ 		esac
+ 		;;
++	-nto-qnx*)
++		;;
+ 	-nto*)
+-		os=3D-nto-qnx
++		os=3D`echo $os | sed -e 's|nto|nto-qnx|'`
+ 		;;
+ 	-sim | -es1800* | -hms* | -xray | -os68k* | -none* | -v88r* \
+-	      | -windows* | -osx | -abug | -netware* | -os9* | -beos* \
++	      | -windows* | -osx | -abug | -netware* | -os9* | -beos* | -haiku* =
\
+ 	      | -macos* | -mpw* | -magic* | -mmixware* | -mon960* | -lnews*)
+ 		;;
+ 	-mac*)
+ 		os=3D`echo $os | sed -e 's|mac|macos|'`
+ 		;;
++	-linux-dietlibc)
++		os=3D-linux-dietlibc
++		;;
+ 	-linux*)
+ 		os=3D`echo $os | sed -e 's|linux|linux-gnu|'`
+ 		;;
+@@ -1145,6 +1297,9 @@
+ 	-opened*)
+ 		os=3D-openedition
+ 		;;
++        -os400*)
++		os=3D-os400
++		;;
+ 	-wince*)
+ 		os=3D-wince
+ 		;;
+@@ -1166,6 +1321,9 @@
+ 	-atheos*)
+ 		os=3D-atheos
+ 		;;
++	-syllable*)
++		os=3D-syllable
++		;;
+ 	-386bsd)
+ 		os=3D-bsd
+ 		;;
+@@ -1176,7 +1334,7 @@
+ 		os=3D-rtmk-nova
+ 		;;
+ 	-ns2 )
+-	        os=3D-nextstep2
++		os=3D-nextstep2
+ 		;;
+ 	-nsk*)
+ 		os=3D-nsk
+@@ -1188,6 +1346,9 @@
+ 	-sinix*)
+ 		os=3D-sysv4
+ 		;;
++        -tpf*)
++		os=3D-tpf
++		;;
+ 	-triton*)
+ 		os=3D-sysv3
+ 		;;
+@@ -1209,17 +1370,23 @@
+ 	-ose*)
+ 		os=3D-ose
+ 		;;
+-	-OS400)
+-		os=3D-OS400
+-		;;	=09
+ 	-es1800*)
+ 		os=3D-ose
+ 		;;
+ 	-xenix)
+ 		os=3D-xenix
+ 		;;
+-        -*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
+-	        os=3D-mint
++	-*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
++		os=3D-mint
++		;;
++	-aros*)
++		os=3D-aros
++		;;
++	-kaos*)
++		os=3D-kaos
++		;;
++	-zvmoe)
++		os=3D-zvmoe
+ 		;;
+ 	-none)
+ 		;;
+@@ -1243,6 +1410,12 @@
+ # system, and we'll never get to this point.
+=20
+ case $basic_machine in
++        score-*)
++		os=3D-elf
++		;;
++        spu-*)
++		os=3D-elf
++		;;
+ 	*-acorn)
+ 		os=3D-riscix1.2
+ 		;;
+@@ -1252,11 +1425,14 @@
+ 	arm*-semi)
+ 		os=3D-aout
+ 		;;
++        c4x-* | tic4x-*)
++        	os=3D-coff
++		;;
+ 	# This must come before the *-dec entry.
+ 	pdp10-*)
+ 		os=3D-tops20
+ 		;;
+-        pdp11-*)
++	pdp11-*)
+ 		os=3D-none
+ 		;;
+ 	*-dec | vax-*)
+@@ -1277,6 +1453,9 @@
+ 	m68*-cisco)
+ 		os=3D-aout
+ 		;;
++        mep-*)
++		os=3D-elf
++		;;
+ 	mips*-cisco)
+ 		os=3D-elf
+ 		;;
+@@ -1295,9 +1474,15 @@
+ 	*-be)
+ 		os=3D-beos
+ 		;;
++	*-haiku)
++		os=3D-haiku
++		;;
+ 	*-ibm)
+ 		os=3D-aix
+ 		;;
++    	*-knuth)
++		os=3D-mmixware
++		;;
+ 	*-wec)
+ 		os=3D-proelf
+ 		;;
+@@ -1349,19 +1534,19 @@
+ 	*-next)
+ 		os=3D-nextstep3
+ 		;;
+-        *-gould)
++	*-gould)
+ 		os=3D-sysv
+ 		;;
+-        *-highlevel)
++	*-highlevel)
+ 		os=3D-bsd
+ 		;;
+ 	*-encore)
+ 		os=3D-bsd
+ 		;;
+-        *-sgi)
++	*-sgi)
+ 		os=3D-irix
+ 		;;
+-        *-siemens)
++	*-siemens)
+ 		os=3D-sysv4
+ 		;;
+ 	*-masscomp)
+@@ -1430,9 +1615,15 @@
+ 			-mvs* | -opened*)
+ 				vendor=3Dibm
+ 				;;
++			-os400*)
++				vendor=3Dibm
++				;;
+ 			-ptx*)
+ 				vendor=3Dsequent
+ 				;;
++			-tpf*)
++				vendor=3Dibm
++				;;
+ 			-vxsim* | -vxworks* | -windiss*)
+ 				vendor=3Dwrs
+ 				;;
+@@ -1457,7 +1648,7 @@
+ esac
+=20
+ echo $basic_machine$os
+-exit 0
++exit
+=20
+ # Local variables:
+ # eval: (add-hook 'write-file-hooks 'time-stamp)
+@@ -1465,5 +1656,3 @@
+ # time-stamp-format: "%:y-%02m-%02d"
+ # time-stamp-end: "'"
+ # End:
+-
+-
diff --git a/recipes/xerces-c/xerces-c_2.8.0.bb b/recipes/xerces-c/xerces-c=
_2.8.0.bb
index 28ab130..ce946d3 100644
--- a/recipes/xerces-c/xerces-c_2.8.0.bb
+++ b/recipes/xerces-c/xerces-c_2.8.0.bb
@@ -6,6 +6,7 @@ LICENSE =3D "MIT"
 PR =3D "r1"
=20
 SRC_URI =3D "http://mirror.serversupportforum.de/apache/xerces/c/2/sources=
/xerces-c-src_2_8_0.tar.gz"
+SRC_URI +=3D "file://config.sub.patch"
 S =3D "${WORKDIR}/xerces-c-src_2_8_0/src/xercesc"
=20
 inherit autotools pkgconfig
--=20
1.7.1

--=-8KkX3pt3xd2UA0A/0BMA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkytkq0ACgkQPX1aK2wOHVhPVQCeIuvncL1CqtvherRzUxuqgo4D
LHQAnjCzvyb9V7qf+PcVtd1M1SiPfzt4
=Y8Ge
-----END PGP SIGNATURE-----

--=-8KkX3pt3xd2UA0A/0BMA--
