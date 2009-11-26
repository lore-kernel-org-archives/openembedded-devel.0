Received: from pasmtpa.tele.dk ([80.160.77.114])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NDZkM-0002Qs-12 for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 09:30:41 +0100
Received: from mail.mikrofyn.com (cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk
	[93.167.193.22])
	by pasmtpA.tele.dk (Postfix) with ESMTP id C83648003DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 09:29:09 +0100 (CET)
Received: from koontz.localnet ([10.0.1.82]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 26 Nov 2009 09:29:17 +0100
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Nov 2009 09:29:02 +0100
User-Agent: KMail/1.12.3 (Linux/2.6.32-020632rc8-generic; KDE/4.3.3; i686; ; )
References: <200911241045.20901.sgh@sgh.dk>
	<19c1b8a90911250951v40fd87cas91f027e748a4a8c@mail.gmail.com>
In-Reply-To: <19c1b8a90911250951v40fd87cas91f027e748a4a8c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911260929.02079.sgh@sgh.dk>
X-OriginalArrivalTime: 26 Nov 2009 08:29:17.0343 (UTC)
	FILETIME=[8B2782F0:01CA6E72]
X-SA-Exim-Connect-IP: 80.160.77.114
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gcc-cross build failure
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
X-List-Received-Date: Thu, 26 Nov 2009 08:30:41 -0000
X-Groupsio-MsgNum: 14692
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_OxjDLRg72YQsPl6"

--Boundary-00=_OxjDLRg72YQsPl6
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Onsdag 25 november 2009 18:51:03 skrev Khem Raj:
> you need to post full log.
> -Khem
>=20

Sorry  Here it is.

Apparently this is the error :=20
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before 'G'
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' token
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' token
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' token
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' token
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' token
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' token
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c: In function 'objc_exception_throw':
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
=2E3-
r9.1/gcc-4.3.3/libobjc/exception.c:487: error: lvalue required as unary '&'=
=20
operand


=2D-=20
S=F8ren Holm

--Boundary-00=_OxjDLRg72YQsPl6
Content-Type: text/plain;
  charset="UTF-8";
  name="gcc-cross.fail"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="gcc-cross.fail"

NOTE: make -j 2 ARCH_FLAGS_FOR_TARGET=3D-march=3Dpentiumpro -isystem/home/s=
gh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include
make[1]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/intl'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/libiberty'
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/libiberty/testsuite'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/libiberty'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/build-i686-linux/libiberty'
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/build-i686-linux/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/build-i686-linux/libiberty/testsuite'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/build-i686-linux/libiberty'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/libdecnumber'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/libdecnumber'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/fixincludes'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/libcpp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/libcpp'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/build-i686-linux/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/build-i686-linux/fixincludes'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/gcc'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/gcc'
Checking multilib configuration for libgcc...
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libgcc'
# If this is the top-level multilib, build all the other
# multilibs.
# Early copyback; see "all" above for the rationale.  The
# early copy is necessary so that the gcc -B options find
# the right startup files when linking shared libgcc.
/bin/sh /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/libgcc/../mkinstalldirs ../.././gcc
parts=3D"crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o crtprec32.o =
crtprec64.o crtprec80.o crtfastmath.o";					\
	for file in $parts; do					\
	  rm -f ../.././gcc/$file;		\
	  /usr/bin/install -c -m 644 $file ../.././gcc/;	\
	done
# @multilib_flags@ is still needed because this may use
# /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home=
/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9=
.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpr=
o -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/=
usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-a=
ngstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/sys-include and -O2  -g -Os -DIN_GCC -DCROSS_DIRECT=
ORY_STRUCTURE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prot=
otypes -Wold-style-definition  -isystem ./include  -fPIC -g -DHAVE_GTHR_DEF=
AULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  directly.
# @multilib_dir@ is not really necessary, but sometimes it has
# more uses than just a directory name.
/bin/sh /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/libgcc/../mkinstalldirs .
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/s=
gh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1=
/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro =
-isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/us=
r/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-l=
inux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-l=
inux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-ang=
strom-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i68=
6/i686-angstrom-linux/sys-include -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_ST=
RUCTURE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes=
 -Wold-style-definition  -isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -=
DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -shared -nodefaultlibs -Wl,--soname=
=3Dlibgcc_s.so.1 -Wl,--version-script=3Dlibgcc.map -o ./libgcc_s.so.1.tmp -=
g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstro=
m-linux -B./ _muldi3_s.o _negdi2_s.o _lshrdi3_s.o _ashldi3_s.o _ashrdi3_s.o=
 _cmpdi2_s.o _ucmpdi2_s.o _clear_cache_s.o _enable_execute_stack_s.o _tramp=
oline_s.o __main_s.o _absvsi2_s.o _absvdi2_s.o _addvsi3_s.o _addvdi3_s.o _s=
ubvsi3_s.o _subvdi3_s.o _mulvsi3_s.o _mulvdi3_s.o _negvsi2_s.o _negvdi2_s.o=
 _ctors_s.o _ffssi2_s.o _ffsdi2_s.o _clz_s.o _clzsi2_s.o _clzdi2_s.o _ctzsi=
2_s.o _ctzdi2_s.o _popcount_tab_s.o _popcountsi2_s.o _popcountdi2_s.o _pari=
tysi2_s.o _paritydi2_s.o _powisf2_s.o _powidf2_s.o _powixf2_s.o _powitf2_s.=
o _mulsc3_s.o _muldc3_s.o _mulxc3_s.o _multc3_s.o _divsc3_s.o _divdc3_s.o _=
divxc3_s.o _divtc3_s.o _bswapsi2_s.o _bswapdi2_s.o _fixunssfsi_s.o _fixunsd=
fsi_s.o _fixunsxfsi_s.o _fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixtfdi_s.o=
 _fixunssfdi_s.o _fixunsdfdi_s.o _fixunsxfdi_s.o _fixunstfdi_s.o _floatdisf=
_s.o _floatdidf_s.o _floatdixf_s.o _floatditf_s.o _floatundisf_s.o _floatun=
didf_s.o _floatundixf_s.o _floatunditf_s.o _divdi3_s.o _moddi3_s.o _udivdi3=
_s.o _umoddi3_s.o _udiv_w_sdiv_s.o _udivmoddi4_s.o unwind-dw2_s.o unwind-dw=
2-fde-glibc_s.o unwind-sjlj_s.o gthr-gnat_s.o unwind-c_s.o emutls_s.o -lc &=
& rm -f ./libgcc_s.so && if [ -f ./libgcc_s.so.1 ]; then mv -f ./libgcc_s.s=
o.1 ./libgcc_s.so.1.backup; else true; fi && mv ./libgcc_s.so.1.tmp ./libgc=
c_s.so.1 && ln -s libgcc_s.so.1 ./libgcc_s.so
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libgcc'
if [ -z "" ]; then \
	  true; \
	else \
	  rootpre=3D`${PWDCMD-pwd}`/; export rootpre; \
	  srcrootpre=3D`cd /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libgcc; ${PWDCMD-pwd}`/; export srcro=
otpre; \
	  lib=3D`echo "${rootpre}" | sed -e 's,^.*/\([^/][^/]*\)/$,\1,'`; \
	  compiler=3D"/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linu=
x/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc=
/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -marc=
h=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-an=
gstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/buil=
d/tmp/cross/i686/i686-angstrom-linux/sys-include"; \
	  for i in `${compiler} --print-multi-lib 2>/dev/null`; do \
	    dir=3D`echo $i | sed -e 's/;.*$//'`; \
	    if [ "${dir}" =3D "." ]; then \
	      true; \
	    else \
	      if [ -d ../${dir}/${lib} ]; then \
		flags=3D`echo $i | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if (cd ../${dir}/${lib}; make "AR=3D/home/sgh/svn/OpenEmbedded/build/tmp/=
cross/i686/i686-angstrom-linux/bin/ar" "AR_FLAGS=3Drc" "CC=3D/home/sgh/svn/=
OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.=
3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmb=
edded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/bui=
ld.i686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro -isystem/home/=
sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include -B/h=
ome/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ -B/h=
ome/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/lib/ -isy=
stem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/in=
clude -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstro=
m-linux/sys-include" "CFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedde=
d/build/tmp/staging/i686-angstrom-linux" "DESTDIR=3D" "EXTRA_OFILES=3D" "HD=
EFINES=3D" "INSTALL=3D/usr/bin/install -c" "INSTALL_DATA=3D/usr/bin/install=
 -c -m 644" "INSTALL_PROGRAM=3D/usr/bin/install -c" "LDFLAGS=3D-L/home/sgh/=
svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home=
/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home=
/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-O1" "LOADLI=
BES=3D" "RANLIB=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angs=
trom-linux/bin/ranlib" "SHELL=3D/bin/sh" "prefix=3D/home/sgh/svn/OpenEmbedd=
ed/build/tmp/cross/i686" "exec_prefix=3D/home/sgh/svn/OpenEmbedded/build/tm=
p/cross/i686" "libdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib=
" "libsubdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib/gcc/i686=
-angstrom-linux/4.3.3" "tooldir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686/i686-angstrom-linux" \
				CFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagi=
ng/i686-angstrom-linux ${flags}" \
				CCASFLAGS=3D" ${flags}" \
				FCFLAGS=3D" ${flags}" \
				FFLAGS=3D" ${flags}" \
				ADAFLAGS=3D" ${flags}" \
				prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				exec_prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				GCJFLAGS=3D" ${flags}" \
				CXXFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/sta=
ging/i686-angstrom-linux  ${flags}" \
				LIBCFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/st=
aging/i686-angstrom-linux  ${flags}" \
				LIBCXXFLAGS=3D"-g -Os -fno-implicit-templates --sysroot=3D/home/sgh/svn=
/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  ${flags}" \
				LDFLAGS=3D"-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/us=
r/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-O1 ${flags}" \
				MULTIFLAGS=3D"${flags}" \
				DESTDIR=3D"" \
				INSTALL=3D"/usr/bin/install -c" \
				INSTALL_DATA=3D"/usr/bin/install -c -m 644" \
				INSTALL_PROGRAM=3D"/usr/bin/install -c" \
				INSTALL_SCRIPT=3D"/usr/bin/install -c" \
				all); then \
		  true; \
		else \
		  exit 1; \
		fi; \
	      else true; \
	      fi; \
	    fi; \
	  done; \
	fi
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libgcc'
# Now that we have built all the objects, we need to copy
# them back to the GCC directory.  Too many things (other
# in-tree libraries, and DejaGNU) know about the layout
# of the build tree, for now.
make install-leaf DESTDIR=3D../.././gcc \
	  slibdir=3D libsubdir=3D MULTIOSDIR=3D.
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libgcc'
/bin/sh /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/libgcc/../mkinstalldirs ../.././gcc
/usr/bin/install -c -m 644 libgcc_eh.a ../.././gcc/
chmod 644 ../.././gcc/libgcc_eh.a
/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ran=
lib ../.././gcc/libgcc_eh.a
/bin/sh /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/libgcc/../mkinstalldirs ../.././gcc; /usr/bin/ins=
tall -c -m 644 ./libgcc_s.so.1 ../.././gcc/libgcc_s.so.1; rm -f ../.././gcc=
/libgcc_s.so; ln -s libgcc_s.so.1 ../.././gcc/libgcc_s.so
/bin/sh /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/libgcc/../mkinstalldirs ../.././gcc
/usr/bin/install -c -m 644 libgcc.a ../.././gcc/
chmod 644 ../.././gcc/libgcc.a
/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ran=
lib ../.././gcc/libgcc.a
/usr/bin/install -c -m 644 libgcov.a ../.././gcc/
chmod 644 ../.././gcc/libgcov.a
/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ran=
lib ../.././gcc/libgcov.a
parts=3D"crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o crtprec32.o =
crtprec64.o crtprec80.o crtfastmath.o";				\
	for file in $parts; do					\
	  rm -f ../.././gcc/$file;		\
	  /usr/bin/install -c -m 644 $file ../.././gcc/;	\
	done
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libgcc'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libgcc'
Checking multilib configuration for libstdc++-v3...
Checking multilib configuration for libiberty...
Checking multilib configuration for libobjc...
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libssp'
make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc " "CFLAGS=3D-g -Os --sysroot=3D/ho=
me/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "CXXFLAGS=
=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-ang=
strom-linux " "CFLAGS_FOR_BUILD=3D-isystem/home/sgh/svn/OpenEmbedded/build/=
tmp/staging/i686-linux/usr/include -O2 -g" "CFLAGS_FOR_TARGET=3D-g -Os" "IN=
STALL=3D/usr/bin/install -c" "INSTALL_DATA=3D/usr/bin/install -c -m 644" "I=
NSTALL_PROGRAM=3D/usr/bin/install -c" "INSTALL_SCRIPT=3D/usr/bin/install -c=
" "JC1FLAGS=3D" "LDFLAGS=3D-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i=
686-linux/usr/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/stag=
ing/i686-linux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/stag=
ing/i686-linux/usr/lib -Wl,-O1" "LIBCFLAGS=3D-g -Os --sysroot=3D/home/sgh/s=
vn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "LIBCFLAGS_FOR_TARG=
ET=3D-g -Os" "MAKE=3Dmake" "MAKEINFO=3Dmakeinfo --split-size=3D5000000 --sp=
lit-size=3D5000000 " "PICFLAG=3D" "PICFLAG_FOR_TARGET=3D" "SHELL=3D/bin/sh"=
 "RUNTESTFLAGS=3D" "exec_prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686" "infodir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/share/in=
fo" "libdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib" "prefix=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" "includedir=3D/home/sgh=
/svn/OpenEmbedded/build/tmp/cross/i686/include" "AR=3D/home/sgh/svn/OpenEmb=
edded/build/tmp/cross/i686/i686-angstrom-linux/bin/ar" "AS=3D/home/sgh/svn/=
OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.=
3.3/build.i686-linux.i686-angstrom-linux/./gcc/as" "CC=3D/home/sgh/svn/Open=
Embedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/=
build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbedde=
d/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i=
686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro -isystem/home/sgh/=
svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include -B/home/=
sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ -B/home/=
sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/lib/ -isystem=
 /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/includ=
e -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-li=
nux/sys-include" "CXX=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angs=
trom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-li=
nux/./gcc/g++ -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-lin=
ux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gc=
c/ -nostdinc++ -nostdinc++ -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/include/i686-angstrom-linux -I/ho=
me/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-=
r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-linux/lib=
stdc++-v3/include -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/libsupc++ -I/home/sgh/sv=
n/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-=
4.3.3/libstdc++-v3/include/backward -I/home/sgh/svn/OpenEmbedded/build/tmp/=
work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/testsu=
ite/util -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gc=
c-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angs=
trom-linux/libstdc++-v3/src -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-linux/i686-angstrom-linux/libstdc++-v3/src/.libs -march=3Dpentiumpro -i=
system/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/=
include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-lin=
ux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-lin=
ux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angst=
rom-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/sys-include" "LD=3D/home/sgh/svn/OpenEmbedded/build/tmp=
/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i=
686-angstrom-linux/./gcc/collect-ld" "LIBCFLAGS=3D-g -Os --sysroot=3D/home/=
sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "NM=3D/home/sg=
h/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/=
gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/nm" "PICFLAG=3D" "RANL=
IB=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bi=
n/ranlib" "DESTDIR=3D" all-am
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libiberty'
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libiberty/testsuite'
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libssp'
make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc " "CFLAGS=3D-g -Os --sysroot=3D/ho=
me/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "CXXFLAGS=
=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-ang=
strom-linux " "CFLAGS_FOR_BUILD=3D-isystem/home/sgh/svn/OpenEmbedded/build/=
tmp/staging/i686-linux/usr/include -O2 -g" "CFLAGS_FOR_TARGET=3D-g -Os" "IN=
STALL=3D/usr/bin/install -c" "INSTALL_DATA=3D/usr/bin/install -c -m 644" "I=
NSTALL_PROGRAM=3D/usr/bin/install -c" "INSTALL_SCRIPT=3D/usr/bin/install -c=
" "JC1FLAGS=3D" "LDFLAGS=3D-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i=
686-linux/usr/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/stag=
ing/i686-linux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/stag=
ing/i686-linux/usr/lib -Wl,-O1" "LIBCFLAGS=3D-g -Os --sysroot=3D/home/sgh/s=
vn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "LIBCFLAGS_FOR_TARG=
ET=3D-g -Os" "MAKE=3Dmake" "MAKEINFO=3Dmakeinfo --split-size=3D5000000 --sp=
lit-size=3D5000000  " "PICFLAG=3D" "PICFLAG_FOR_TARGET=3D" "SHELL=3D/bin/sh=
" "RUNTESTFLAGS=3D" "exec_prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cro=
ss/i686" "infodir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/share/i=
nfo" "libdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib" "prefix=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" "includedir=3D/home/sgh=
/svn/OpenEmbedded/build/tmp/cross/i686/include" "AR=3D/home/sgh/svn/OpenEmb=
edded/build/tmp/cross/i686/i686-angstrom-linux/bin/ar" "AS=3D/home/sgh/svn/=
OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.=
3.3/build.i686-linux.i686-angstrom-linux/./gcc/as" "CC=3D/home/sgh/svn/Open=
Embedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/=
build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbedde=
d/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i=
686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro -isystem/home/sgh/=
svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include -B/home/=
sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ -B/home/=
sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/lib/ -isystem=
 /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/includ=
e -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-li=
nux/sys-include" "CXX=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angs=
trom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-li=
nux/./gcc/g++ -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-lin=
ux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gc=
c/ -nostdinc++ -nostdinc++ -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/include/i686-angstrom-linux -I/ho=
me/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-=
r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-linux/lib=
stdc++-v3/include -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/libsupc++ -I/home/sgh/sv=
n/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-=
4.3.3/libstdc++-v3/include/backward -I/home/sgh/svn/OpenEmbedded/build/tmp/=
work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/testsu=
ite/util -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gc=
c-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angs=
trom-linux/libstdc++-v3/src -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angst=
rom-linux/i686-angstrom-linux/libstdc++-v3/src/.libs -march=3Dpentiumpro -i=
system/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/=
include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-lin=
ux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-lin=
ux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angst=
rom-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/sys-include" "LD=3D/home/sgh/svn/OpenEmbedded/build/tmp=
/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i=
686-angstrom-linux/./gcc/collect-ld" "LIBCFLAGS=3D-g -Os --sysroot=3D/home/=
sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "NM=3D/home/sg=
h/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/=
gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/nm" "PICFLAG=3D" "RANL=
IB=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bi=
n/ranlib" "DESTDIR=3D" DO=3Dall multi-do # make
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libiberty'
if [ -z "" ]; then \
	  true; \
	else \
	  rootpre=3D`${PWDCMD-pwd}`/; export rootpre; \
	  srcrootpre=3D`cd /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libiberty; ${PWDCMD-pwd}`/; export sr=
crootpre; \
	  lib=3D`echo "${rootpre}" | sed -e 's,^.*/\([^/][^/]*\)/$,\1,'`; \
	  compiler=3D"/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linu=
x/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc=
/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -marc=
h=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-an=
gstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/buil=
d/tmp/cross/i686/i686-angstrom-linux/sys-include"; \
	  for i in `${compiler} --print-multi-lib 2>/dev/null`; do \
	    dir=3D`echo $i | sed -e 's/;.*$//'`; \
	    if [ "${dir}" =3D "." ]; then \
	      true; \
	    else \
	      if [ -d ../${dir}/${lib} ]; then \
		flags=3D`echo $i | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if (cd ../${dir}/${lib}; make "AR=3D/home/sgh/svn/OpenEmbedded/build/tmp/=
cross/i686/i686-angstrom-linux/bin/ar" "AR_FLAGS=3Drc" "CC=3D/home/sgh/svn/=
OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.=
3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmb=
edded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/bui=
ld.i686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro -isystem/home/=
sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include -B/h=
ome/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ -B/h=
ome/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/lib/ -isy=
stem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/in=
clude -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstro=
m-linux/sys-include" "CFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedde=
d/build/tmp/staging/i686-angstrom-linux " "DESTDIR=3D" "LIBCFLAGS=3D-g -Os =
--sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linu=
x " "EXTRA_OFILES=3D" "HDEFINES=3D" "INSTALL=3D/usr/bin/install -c" "INSTAL=
L_DATA=3D/usr/bin/install -c -m 644" "INSTALL_PROGRAM=3D/usr/bin/install -c=
" "LDFLAGS=3D-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/=
lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux=
/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux=
/usr/lib -Wl,-O1" "LOADLIBES=3D" "RANLIB=3D/home/sgh/svn/OpenEmbedded/build=
/tmp/cross/i686/i686-angstrom-linux/bin/ranlib" "SHELL=3D/bin/sh" "prefix=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" "exec_prefix=3D/home/sg=
h/svn/OpenEmbedded/build/tmp/cross/i686" "libdir=3D/home/sgh/svn/OpenEmbedd=
ed/build/tmp/cross/i686/lib" "libsubdir=3D" "tooldir=3D/home/sgh/svn/OpenEm=
bedded/build/tmp/cross/i686/i686-angstrom-linux" \
				CFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagi=
ng/i686-angstrom-linux  ${flags}" \
				CCASFLAGS=3D" ${flags}" \
				FCFLAGS=3D" ${flags}" \
				FFLAGS=3D" ${flags}" \
				ADAFLAGS=3D" ${flags}" \
				prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				exec_prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				GCJFLAGS=3D" ${flags}" \
				CXXFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/sta=
ging/i686-angstrom-linux  ${flags}" \
				LIBCFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/st=
aging/i686-angstrom-linux  ${flags}" \
				LIBCXXFLAGS=3D"-g -Os -fno-implicit-templates --sysroot=3D/home/sgh/svn=
/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  ${flags}" \
				LDFLAGS=3D"-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/us=
r/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-O1 ${flags}" \
				MULTIFLAGS=3D"${flags}" \
				DESTDIR=3D"" \
				INSTALL=3D"/usr/bin/install -c" \
				INSTALL_DATA=3D"/usr/bin/install -c -m 644" \
				INSTALL_PROGRAM=3D"/usr/bin/install -c" \
				INSTALL_SCRIPT=3D"/usr/bin/install -c" \
				all); then \
		  true; \
		else \
		  exit 1; \
		fi; \
	      else true; \
	      fi; \
	    fi; \
	  done; \
	fi
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libiberty'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libiberty'
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libssp'
if [ -z "" ]; then \
	  true; \
	else \
	  rootpre=3D`${PWDCMD-pwd}`/; export rootpre; \
	  srcrootpre=3D`cd /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libssp; ${PWDCMD-pwd}`/; export srcro=
otpre; \
	  lib=3D`echo "${rootpre}" | sed -e 's,^.*/\([^/][^/]*\)/$,\1,'`; \
	  compiler=3D"/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linu=
x/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc=
/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -marc=
h=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-an=
gstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/buil=
d/tmp/cross/i686/i686-angstrom-linux/sys-include"; \
	  for i in `${compiler} --print-multi-lib 2>/dev/null`; do \
	    dir=3D`echo $i | sed -e 's/;.*$//'`; \
	    if [ "${dir}" =3D "." ]; then \
	      true; \
	    else \
	      if [ -d ../${dir}/${lib} ]; then \
		flags=3D`echo $i | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if (cd ../${dir}/${lib}; make  \
				CFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagi=
ng/i686-angstrom-linux  ${flags}" \
				CCASFLAGS=3D" ${flags}" \
				FCFLAGS=3D" ${flags}" \
				FFLAGS=3D" ${flags}" \
				ADAFLAGS=3D" ${flags}" \
				prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				exec_prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				GCJFLAGS=3D" ${flags}" \
				CXXFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/sta=
ging/i686-angstrom-linux  ${flags}" \
				LIBCFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/st=
aging/i686-angstrom-linux  ${flags}" \
				LIBCXXFLAGS=3D"-g -Os -fno-implicit-templates --sysroot=3D/home/sgh/svn=
/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  ${flags}" \
				LDFLAGS=3D"-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/us=
r/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-O1 ${flags}" \
				MULTIFLAGS=3D"${flags}" \
				DESTDIR=3D"" \
				INSTALL=3D"/usr/bin/install -c" \
				INSTALL_DATA=3D"/usr/bin/install -c -m 644" \
				INSTALL_PROGRAM=3D"/usr/bin/install -c" \
				INSTALL_SCRIPT=3D"/usr/bin/install -c" \
				all); then \
		  true; \
		else \
		  exit 1; \
		fi; \
	      else true; \
	      fi; \
	    fi; \
	  done; \
	fi
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libssp'
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libssp'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libssp'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3'
make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc " "CC_FOR_TARGET=3D/home/sgh/svn/O=
penEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3=
.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbe=
dded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/buil=
d.i686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro -isystem/home/s=
gh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include -B/ho=
me/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ -B/ho=
me/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/lib/ -isys=
tem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/inc=
lude -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/sys-include" "CFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded=
/build/tmp/staging/i686-angstrom-linux " "CXXFLAGS=3D-g -Os --sysroot=3D/ho=
me/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "CFLAGS_FOR=
_BUILD=3D-isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/us=
r/include -O2 -g" "CFLAGS_FOR_TARGET=3D-g -Os" "INSTALL=3D/usr/bin/install =
-c" "INSTALL_DATA=3D/usr/bin/install -c -m 644" "INSTALL_PROGRAM=3D/usr/bin=
/install -c" "INSTALL_SCRIPT=3D/usr/bin/install -c" "LDFLAGS=3D-L/home/sgh/=
svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home=
/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home=
/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-O1" "LIBCFL=
AGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-=
angstrom-linux " "LIBCFLAGS_FOR_TARGET=3D-g -Os" "MAKE=3Dmake" "MAKEINFO=3D=
makeinfo --split-size=3D5000000 --split-size=3D5000000 " "PICFLAG=3D" "PICF=
LAG_FOR_TARGET=3D" "SHELL=3D/bin/sh" "RUNTESTFLAGS=3D" "exec_prefix=3D/home=
/sgh/svn/OpenEmbedded/build/tmp/cross/i686" "infodir=3D/home/sgh/svn/OpenEm=
bedded/build/tmp/cross/i686/share/info" "libdir=3D/home/sgh/svn/OpenEmbedde=
d/build/tmp/cross/i686/lib" "includedir=3D/home/sgh/svn/OpenEmbedded/build/=
tmp/cross/i686/include" "prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686" "tooldir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-ang=
strom-linux" "gxx_include_dir=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagin=
g/i686-angstrom-linux//usr/include/c++" "AR=3D/home/sgh/svn/OpenEmbedded/bu=
ild/tmp/cross/i686/i686-angstrom-linux/bin/ar" "AS=3D/home/sgh/svn/OpenEmbe=
dded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/buil=
d.i686-linux.i686-angstrom-linux/./gcc/as" "LD=3D/home/sgh/svn/OpenEmbedded=
/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i6=
86-linux.i686-angstrom-linux/./gcc/collect-ld" "RANLIB=3D/home/sgh/svn/Open=
Embedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ranlib" "NM=3D/home/s=
gh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1=
/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/nm" "NM_FOR_BUILD=3D"=
 "NM_FOR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angs=
trom-linux/bin/nm" "DESTDIR=3D" "WERROR=3D" all-recursive
make[3]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3'
make[2]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libobjc'
/bin/sh ./libtool --mode=3Dcompile /home/sgh/svn/OpenEmbedded/build/tmp/wor=
k/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-=
angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/./gcc/ -march=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build=
/tmp/staging/i686-angstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/b=
uild/tmp/cross/i686/i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/b=
uild/tmp/cross/i686/i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmb=
edded/build/tmp/cross/i686/i686-angstrom-linux/include -isystem /home/sgh/s=
vn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/sys-include -c -o =
sendmsg.lo -I. -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-li=
nux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc   -g -Os --sysroot=3D/home/sgh/s=
vn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -DIN_GCC -DIN_TARGET_LIBS -fno-strict-aliasing -fe=
xceptions -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/objc  -I/home/sgh/svn/OpenEmbedded/bu=
ild/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../=
gcc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cro=
ss-4.3.3-r9.1/gcc-4.3.3/libobjc/../gcc/config -I../.././gcc -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libobjc/../include  /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-ang=
strom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/sendmsg.c
Making all in include
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/include'
make[4]: [stamp-c_base] Error 1 (ignored)
mkdir -p ./i686-angstrom-linux/bits/stdc++.h.gch
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -shared-l=
ibgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc -nostd=
inc++ -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstro=
m-linux/libstdc++-v3/src -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-a=
ngstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom=
-linux/i686-angstrom-linux/libstdc++-v3/src/.libs -march=3Dpentiumpro -isys=
tem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/inc=
lude -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i68=
6-angstrom-linux/sys-include -Winvalid-pch -x c++-header -g -Os --sysroot=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  -I/hom=
e/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r=
9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-linux/libs=
tdc++-v3/include/i686-angstrom-linux -I/home/sgh/svn/OpenEmbedded/build/tmp=
/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i=
686-angstrom-linux/i686-angstrom-linux/libstdc++-v3/include -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libstdc++-v3/libsupc++ -O0 -g /home/sgh/svn/OpenEmbedded/build/tmp/wor=
k/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/include/p=
recompiled/stdc++.h -o i686-angstrom-linux/bits/stdc++.h.gch/O0g.gch
libtool: compile:  /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-=
linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/.=
/gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -=
march=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i68=
6-angstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/=
cross/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/=
build/tmp/cross/i686/i686-angstrom-linux/sys-include -c -I. -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libobjc -g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagin=
g/i686-angstrom-linux -W -Wall -Wwrite-strings -Wstrict-prototypes -DIN_GCC=
 -DIN_TARGET_LIBS -fno-strict-aliasing -fexceptions -I/home/sgh/svn/OpenEmb=
edded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/lib=
objc/objc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../gcc -I/home/sgh/svn/OpenEmbedded/b=
uild/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/..=
/gcc/config -I../.././gcc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../include /home/sgh/=
svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gc=
c-4.3.3/libobjc/sendmsg.c  -fPIC -DPIC -o .libs/sendmsg.o
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/sendmsg.c:44:1: warning: "rtx" redefined
In file included from /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstr=
om-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/sendmsg.c:33:
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/../gcc/coretypes.h:83:1: warning: this is the loc=
ation of the previous definition
libtool: compile:  /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-=
linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/.=
/gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -=
march=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i68=
6-angstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/=
cross/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/=
build/tmp/cross/i686/i686-angstrom-linux/sys-include -c -I. -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libobjc -g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagin=
g/i686-angstrom-linux -W -Wall -Wwrite-strings -Wstrict-prototypes -DIN_GCC=
 -DIN_TARGET_LIBS -fno-strict-aliasing -fexceptions -I/home/sgh/svn/OpenEmb=
edded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/lib=
objc/objc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../gcc -I/home/sgh/svn/OpenEmbedded/b=
uild/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/..=
/gcc/config -I../.././gcc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../include /home/sgh/=
svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gc=
c-4.3.3/libobjc/sendmsg.c -o sendmsg.o >/dev/null 2>&1
/bin/sh ./libtool --mode=3Dcompile /home/sgh/svn/OpenEmbedded/build/tmp/wor=
k/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-=
angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/./gcc/ -march=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build=
/tmp/staging/i686-angstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/b=
uild/tmp/cross/i686/i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/b=
uild/tmp/cross/i686/i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmb=
edded/build/tmp/cross/i686/i686-angstrom-linux/include -isystem /home/sgh/s=
vn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/sys-include -c -o =
exception.lo -I. -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-=
linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc   -g -Os --sysroot=3D/home/sgh=
/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  -W -Wall -Wwrite-s=
trings -Wstrict-prototypes -DIN_GCC -DIN_TARGET_LIBS -fno-strict-aliasing -=
fexceptions \
		-fexceptions -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-li=
nux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/objc  -I/home/sgh/svn/OpenEmbedd=
ed/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobj=
c/../gcc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gc=
c-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../gcc/config -I../.././gcc -I/home/sg=
h/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/=
gcc-4.3.3/libobjc/../include  /home/sgh/svn/OpenEmbedded/build/tmp/work/i68=
6-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/exception.c
libtool: compile:  /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-=
linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/.=
/gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -=
march=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i68=
6-angstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i=
686/i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/=
cross/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/=
build/tmp/cross/i686/i686-angstrom-linux/sys-include -c -I. -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libobjc -g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagin=
g/i686-angstrom-linux -W -Wall -Wwrite-strings -Wstrict-prototypes -DIN_GCC=
 -DIN_TARGET_LIBS -fno-strict-aliasing -fexceptions -fexceptions -I/home/sg=
h/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/=
gcc-4.3.3/libobjc/objc -I/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-ang=
strom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../gcc -I/home/sgh/svn/O=
penEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3=
.3/libobjc/../gcc/config -I../.././gcc -I/home/sgh/svn/OpenEmbedded/build/t=
mp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libobjc/../inclu=
de /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-=
4.3.3-r9.1/gcc-4.3.3/libobjc/exception.c  -fPIC -DPIC -o .libs/exception.o
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before 'G'
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' t=
oken
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' t=
oken
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' t=
oken
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' t=
oken
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' t=
oken
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' t=
oken
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c: In function 'objc_exception_throw':
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libobjc/exception.c:487: error: lvalue required as unary =
'&' operand
make[2]: *** [exception.lo] Error 1
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libobjc'
make[1]: *** [all-target-libobjc] Error 2
make[1]: *** Waiting for unfinished jobs....
mkdir -p ./i686-angstrom-linux/bits/stdc++.h.gch
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -shared-l=
ibgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc -nostd=
inc++ -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstro=
m-linux/libstdc++-v3/src -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-a=
ngstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom=
-linux/i686-angstrom-linux/libstdc++-v3/src/.libs -march=3Dpentiumpro -isys=
tem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/inc=
lude -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i68=
6-angstrom-linux/sys-include -Winvalid-pch -x c++-header -g -Os --sysroot=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  -I/hom=
e/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r=
9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-linux/libs=
tdc++-v3/include/i686-angstrom-linux -I/home/sgh/svn/OpenEmbedded/build/tmp=
/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i=
686-angstrom-linux/i686-angstrom-linux/libstdc++-v3/include -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libstdc++-v3/libsupc++ -O2 -g /home/sgh/svn/OpenEmbedded/build/tmp/wor=
k/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/include/p=
recompiled/stdc++.h -o i686-angstrom-linux/bits/stdc++.h.gch/O2g.gch
mkdir -p ./i686-angstrom-linux/bits/stdtr1c++.h.gch
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -shared-l=
ibgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc -nostd=
inc++ -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstro=
m-linux/libstdc++-v3/src -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-a=
ngstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom=
-linux/i686-angstrom-linux/libstdc++-v3/src/.libs -march=3Dpentiumpro -isys=
tem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/inc=
lude -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i68=
6-angstrom-linux/sys-include -Winvalid-pch -x c++-header -g -Os --sysroot=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  -I/hom=
e/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r=
9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-linux/libs=
tdc++-v3/include/i686-angstrom-linux -I/home/sgh/svn/OpenEmbedded/build/tmp=
/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i=
686-angstrom-linux/i686-angstrom-linux/libstdc++-v3/include -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libstdc++-v3/libsupc++ -O2 -g /home/sgh/svn/OpenEmbedded/build/tmp/wor=
k/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/include/p=
recompiled/stdtr1c++.h -o i686-angstrom-linux/bits/stdtr1c++.h.gch/O2g.gch
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/libstdc++-v3/include/precompiled/stdtr1c++.h:34:25: warni=
ng: /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross=
-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-li=
nux/libstdc++-v3/include/i686-angstrom-linux/bits/stdc++.h.gch/O0g.gch: not=
 used because `__NO_INLINE__' not defined
mkdir -p ./i686-angstrom-linux/bits/extc++.h.gch
/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3=
.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -shared-l=
ibgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc -nostd=
inc++ -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstro=
m-linux/libstdc++-v3/src -L/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-a=
ngstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom=
-linux/i686-angstrom-linux/libstdc++-v3/src/.libs -march=3Dpentiumpro -isys=
tem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/inc=
lude -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/include -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i68=
6-angstrom-linux/sys-include -Winvalid-pch -x c++-header -g -Os --sysroot=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  -I/hom=
e/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r=
9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/i686-angstrom-linux/libs=
tdc++-v3/include/i686-angstrom-linux -I/home/sgh/svn/OpenEmbedded/build/tmp=
/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i=
686-angstrom-linux/i686-angstrom-linux/libstdc++-v3/include -I/home/sgh/svn=
/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4=
.3.3/libstdc++-v3/libsupc++ -O2 -g /home/sgh/svn/OpenEmbedded/build/tmp/wor=
k/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3/include/p=
recompiled/extc++.h -o i686-angstrom-linux/bits/extc++.h.gch/O2g.gch
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/include'
Making all in libsupc++
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/libsupc++'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/libsupc++'
Making all in libmath
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/libmath'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/libmath'
Making all in doc
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/doc'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/doc'
Making all in src
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/src'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/src'
Making all in po
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/po'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/po'
Making all in testsuite
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3/testsuite'
make[4]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3'
make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc " "CC_FOR_TARGET=3D/home/sgh/svn/O=
penEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3=
.3/build.i686-linux.i686-angstrom-linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbe=
dded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/buil=
d.i686-linux.i686-angstrom-linux/./gcc/ -march=3Dpentiumpro -isystem/home/s=
gh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux/usr/include -B/ho=
me/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ -B/ho=
me/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/lib/ -isys=
tem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/inc=
lude -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom=
-linux/sys-include" "CFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded=
/build/tmp/staging/i686-angstrom-linux " "CXXFLAGS=3D-g -Os --sysroot=3D/ho=
me/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "CFLAGS_FOR=
_BUILD=3D-isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/us=
r/include -O2 -g" "CFLAGS_FOR_TARGET=3D-g -Os" "INSTALL=3D/usr/bin/install =
-c" "INSTALL_DATA=3D/usr/bin/install -c -m 644" "INSTALL_PROGRAM=3D/usr/bin=
/install -c" "INSTALL_SCRIPT=3D/usr/bin/install -c" "LDFLAGS=3D-L/home/sgh/=
svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home=
/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home=
/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-O1" "LIBCFL=
AGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-=
angstrom-linux " "LIBCFLAGS_FOR_TARGET=3D-g -Os" "MAKE=3Dmake" "MAKEINFO=3D=
makeinfo --split-size=3D5000000 --split-size=3D5000000   " "PICFLAG=3D" "PI=
CFLAG_FOR_TARGET=3D" "SHELL=3D/bin/sh" "RUNTESTFLAGS=3D" "exec_prefix=3D/ho=
me/sgh/svn/OpenEmbedded/build/tmp/cross/i686" "infodir=3D/home/sgh/svn/Open=
Embedded/build/tmp/cross/i686/share/info" "libdir=3D/home/sgh/svn/OpenEmbed=
ded/build/tmp/cross/i686/lib" "includedir=3D/home/sgh/svn/OpenEmbedded/buil=
d/tmp/cross/i686/include" "prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cr=
oss/i686" "tooldir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-a=
ngstrom-linux" "gxx_include_dir=3D/home/sgh/svn/OpenEmbedded/build/tmp/stag=
ing/i686-angstrom-linux//usr/include/c++" "AR=3D/home/sgh/svn/OpenEmbedded/=
build/tmp/cross/i686/i686-angstrom-linux/bin/ar" "AS=3D/home/sgh/svn/OpenEm=
bedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/bu=
ild.i686-linux.i686-angstrom-linux/./gcc/as" "LD=3D/home/sgh/svn/OpenEmbedd=
ed/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.=
i686-linux.i686-angstrom-linux/./gcc/collect-ld" "RANLIB=3D/home/sgh/svn/Op=
enEmbedded/build/tmp/cross/i686/i686-angstrom-linux/bin/ranlib" "NM=3D/home=
/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4.3.3-r9=
.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/nm" "NM_FOR_BUILD=
=3D" "NM_FOR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-=
angstrom-linux/bin/nm" "DESTDIR=3D" "WERROR=3D" DO=3Dall multi-do # make
make[5]: Entering directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/i686-angstrom-linux/libstdc++-v3'
if [ -z "" ]; then \
	  true; \
	else \
	  rootpre=3D`${PWDCMD-pwd}`/; export rootpre; \
	  srcrootpre=3D`cd /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom=
-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/libstdc++-v3; ${PWDCMD-pwd}`/; export=
 srcrootpre; \
	  lib=3D`echo "${rootpre}" | sed -e 's,^.*/\([^/][^/]*\)/$,\1,'`; \
	  compiler=3D"/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linu=
x/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc=
/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-c=
ross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -marc=
h=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-an=
gstrom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/=
i686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cros=
s/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/buil=
d/tmp/cross/i686/i686-angstrom-linux/sys-include"; \
	  for i in `${compiler} --print-multi-lib 2>/dev/null`; do \
	    dir=3D`echo $i | sed -e 's/;.*$//'`; \
	    if [ "${dir}" =3D "." ]; then \
	      true; \
	    else \
	      if [ -d ../${dir}/${lib} ]; then \
		flags=3D`echo $i | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if (cd ../${dir}/${lib}; make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc " "CC_F=
OR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/g=
cc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/xg=
cc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cros=
s-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/ -march=
=3Dpentiumpro -isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-ang=
strom-linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i=
686-angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i=
686-angstrom-linux/lib/ -isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross=
/i686/i686-angstrom-linux/include -isystem /home/sgh/svn/OpenEmbedded/build=
/tmp/cross/i686/i686-angstrom-linux/sys-include" "CFLAGS=3D-g -Os --sysroot=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux " "CXXF=
LAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686=
-angstrom-linux " "CFLAGS_FOR_BUILD=3D-isystem/home/sgh/svn/OpenEmbedded/bu=
ild/tmp/staging/i686-linux/usr/include -O2 -g" "CFLAGS_FOR_TARGET=3D-g -Os"=
 "INSTALL=3D/usr/bin/install -c" "INSTALL_DATA=3D/usr/bin/install -c -m 644=
" "INSTALL_PROGRAM=3D/usr/bin/install -c" "INSTALL_SCRIPT=3D/usr/bin/instal=
l -c" "LDFLAGS=3D-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/=
usr/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-l=
inux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-l=
inux/usr/lib -Wl,-O1" "LIBCFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmb=
edded/build/tmp/staging/i686-angstrom-linux " "LIBCFLAGS_FOR_TARGET=3D-g -O=
s" "MAKE=3Dmake" "MAKEINFO=3Dmakeinfo --split-size=3D5000000 --split-size=
=3D5000000    " "PICFLAG=3D" "PICFLAG_FOR_TARGET=3D" "SHELL=3D/bin/sh" "RUN=
TESTFLAGS=3D" "exec_prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i68=
6" "infodir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/share/info" "=
libdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib" "includedir=
=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/include" "prefix=3D/home=
/sgh/svn/OpenEmbedded/build/tmp/cross/i686" "tooldir=3D/home/sgh/svn/OpenEm=
bedded/build/tmp/cross/i686/i686-angstrom-linux" "gxx_include_dir=3D/home/s=
gh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux//usr/include/c++"=
 "AR=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/=
bin/ar" "AS=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux=
/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/=
as" "LD=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc=
-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstrom-linux/./gcc/coll=
ect-ld" "RANLIB=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angs=
trom-linux/bin/ranlib" "NM=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686=
-angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstr=
om-linux/./gcc/nm" "NM_FOR_BUILD=3D" "NM_FOR_TARGET=3D/home/sgh/svn/OpenEmb=
edded/build/tmp/cross/i686/i686-angstrom-linux/bin/nm" "DESTDIR=3D" "WERROR=
=3D" \
				CFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagi=
ng/i686-angstrom-linux  ${flags}" \
				CCASFLAGS=3D" ${flags}" \
				FCFLAGS=3D" ${flags}" \
				FFLAGS=3D" ${flags}" \
				ADAFLAGS=3D" ${flags}" \
				prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				exec_prefix=3D"/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686" \
				GCJFLAGS=3D" ${flags}" \
				CXXFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/sta=
ging/i686-angstrom-linux  ${flags}" \
				LIBCFLAGS=3D"-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/st=
aging/i686-angstrom-linux  ${flags}" \
				LIBCXXFLAGS=3D"-g -Os -fno-implicit-templates --sysroot=3D/home/sgh/svn=
/OpenEmbedded/build/tmp/staging/i686-angstrom-linux  ${flags}" \
				LDFLAGS=3D"-L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/us=
r/lib -Wl,-rpath-link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-lin=
ux/usr/lib -Wl,-O1 ${flags}" \
				MULTIFLAGS=3D"${flags}" \
				DESTDIR=3D"" \
				INSTALL=3D"/usr/bin/install -c" \
				INSTALL_DATA=3D"/usr/bin/install -c -m 644" \
				INSTALL_PROGRAM=3D"/usr/bin/install -c" \
				INSTALL_SCRIPT=3D"/usr/bin/install -c" \
				all); then \
		  true; \
		else \
		  exit 1; \
		fi; \
	      else true; \
	      fi; \
	    fi; \
	  done; \
	fi
make[5]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3'
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3'
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux/i686-angstrom-linux/libstdc++-v3'
make[1]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-=
angstrom-linux/gcc-cross-4.3.3-r9.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-linux'
make: *** [all] Error 2
FATAL: oe_runmake failed

--Boundary-00=_OxjDLRg72YQsPl6--
