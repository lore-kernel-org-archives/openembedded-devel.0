Received: from pasmtpa.tele.dk ([80.160.77.114])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NCsP9-0003hO-Pw for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 11:13:55 +0100
Received: from mail.mikrofyn.com (cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk
	[93.167.193.22])
	by pasmtpA.tele.dk (Postfix) with ESMTP id 39E058000A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 10:45:24 +0100 (CET)
Received: from koontz.localnet ([10.0.1.82]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 24 Nov 2009 10:45:36 +0100
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Nov 2009 10:45:20 +0100
User-Agent: KMail/1.12.3 (Linux/2.6.32-020632rc8-generic; KDE/4.3.3; i686; ; )
MIME-Version: 1.0
Message-Id: <200911241045.20901.sgh@sgh.dk>
X-OriginalArrivalTime: 24 Nov 2009 09:45:36.0031 (UTC)
	FILETIME=[DF705AF0:01CA6CEA]
X-SA-Exim-Connect-IP: 80.160.77.114
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gcc-cross build failure
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
X-List-Received-Date: Tue, 24 Nov 2009 10:13:55 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi Apparently gcc-cross fail building without any particullar reason. Does=
=20
anyone have an idea of what is happening.

if (cd ../${dir}/${lib}; make "AR_FLAGS=3Drc" "CC_FOR_BUILD=3Dgcc "=20
"CC_FOR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-
linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
linux/./gcc/xgcc -B/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-
linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
linux/./gcc/ -march=3Dpentiumpro -
isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-
linux/usr/include -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-
angstrom-linux/bin/ -B/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-
angstrom-linux/lib/ -isystem=20
/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-linux/include=
 -
isystem /home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-
linux/sys-include" "CFLAGS=3D-g -Os --
sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux =
"=20
"CXXFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging=
/i686-
angstrom-linux " "CFLAGS_FOR_BUILD=3D-
isystem/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/include =
=2DO2=20
=2Dg" "CFLAGS_FOR_TARGET=3D-g -Os" "INSTALL=3D/usr/bin/install -c"=20
"INSTALL_DATA=3D/usr/bin/install -c -m 644" "INSTALL_PROGRAM=3D/usr/bin/ins=
tall -
c" "INSTALL_SCRIPT=3D/usr/bin/install -c" "LDFLAGS=3D-
L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-
link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-
rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-=
O1"=20
"LIBCFLAGS=3D-g -Os --sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/stagin=
g/i686-
angstrom-linux " "LIBCFLAGS_FOR_TARGET=3D-g -Os" "MAKE=3Dmake" "MAKEINFO=3D=
makeinfo=20
=2D-split-size=3D5000000 --split-size=3D5000000    " "PICFLAG=3D"=20
"PICFLAG_FOR_TARGET=3D" "SHELL=3D/bin/sh" "RUNTESTFLAGS=3D"=20
"exec_prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686"=20
"infodir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/share/info"=20
"libdir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/lib"=20
"includedir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/include"=20
"prefix=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686"=20
"tooldir=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-li=
nux"=20
"gxx_include_dir=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstr=
om-
linux//usr/include/c++"=20
"AR=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-
linux/bin/ar" "AS=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-
linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
linux/./gcc/as" "LD=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstr=
om-
linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
linux/./gcc/collect-ld"=20
"RANLIB=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angstrom-
linux/bin/ranlib" "NM=3D/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angs=
trom-
linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstrom-
linux/./gcc/nm" "NM_FOR_BUILD=3D"=20
"NM_FOR_TARGET=3D/home/sgh/svn/OpenEmbedded/build/tmp/cross/i686/i686-angst=
rom-
linux/bin/nm" "DESTDIR=3D" "WERROR=3D" \
                                CFLAGS=3D"-g -Os --
sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux =
=20
${flags}" \
                                CCASFLAGS=3D" ${flags}" \
                                FCFLAGS=3D" ${flags}" \
                                FFLAGS=3D" ${flags}" \
                                ADAFLAGS=3D" ${flags}" \
                                prefix=3D"/home/sgh/svn/OpenEmbedded/build/=
tmp/cross/i686"=20
\
                                exec_prefix=3D"/home/sgh/svn/OpenEmbedded/b=
uild/tmp/cross/i686"=20
\
                                GCJFLAGS=3D" ${flags}" \
                                CXXFLAGS=3D"-g -Os --
sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux =
=20
${flags}" \
                                LIBCFLAGS=3D"-g -Os --
sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux =
=20
${flags}" \
                                LIBCXXFLAGS=3D"-g -Os -fno-implicit-templat=
es --
sysroot=3D/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-angstrom-linux =
=20
${flags}" \
                                LDFLAGS=3D"-
L/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-
link,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-
rpath,/home/sgh/svn/OpenEmbedded/build/tmp/staging/i686-linux/usr/lib -Wl,-=
O1=20
${flags}" \
                                MULTIFLAGS=3D"${flags}" \
                                DESTDIR=3D"" \
                                INSTALL=3D"/usr/bin/install -c" \
                                INSTALL_DATA=3D"/usr/bin/install -c -m 644"=
 \
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
make[5]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-
angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-
linux/i686-angstrom-linux/libstdc++-v3'
make[4]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-
angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-
linux/i686-angstrom-linux/libstdc++-v3'
make[3]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-
angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-
linux/i686-angstrom-linux/libstdc++-v3'
make[2]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-
angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-
linux/i686-angstrom-linux/libstdc++-v3'
make[1]: Leaving directory `/home/sgh/svn/OpenEmbedded/build/tmp/work/i686-
angstrom-linux/gcc-cross-4.3.3-r8.1/gcc-4.3.3/build.i686-linux.i686-angstro=
m-
linux'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
=46ATAL: oe_runmake failed
+ exit 1
ERROR: function do_compile failed
ERROR: see log in /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-
linux/gcc-cross-4.3.3-r8.1/temp/log.do_compile.21917
NOTE: Task failed: /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-
linux/gcc-cross-4.3.3-r8.1/temp/log.do_compile.21917
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/sgh/svn/OpenEmbedded/openembedded/recipes/gcc/gcc-
cross_4.3.3.bb do_compile failed
ERROR: Task 116 (/home/sgh/svn/OpenEmbedded/openembedded/recipes/gcc/gcc-
cross_4.3.3.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 648 tasks of which 648 didn't need to be rer=
un=20
and 1 failed.
ERROR: '/home/sgh/svn/OpenEmbedded/openembedded/recipes/gcc/gcc-
cross_4.3.3.bb' failed


=2D-=20
Mvh./ Best regards
S=F8ren Holm


