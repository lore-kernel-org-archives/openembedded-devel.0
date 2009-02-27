Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Ld4eH-00064S-2f
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 16:29:19 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 05E094C10E; Fri, 27 Feb 2009 16:25:44 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRVDw5RXnw=
Message-ID: <50939.AFRVDw5RXnw=.1235748344.squirrel@webmail.no-log.org>
Date: Fri, 27 Feb 2009 16:25:44 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: [patch](or sort of): emacs didn't compile[first part: emacs recipe]
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
X-List-Received-Date: Fri, 27 Feb 2009 15:29:33 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

hello,
for me emacs didn't compile...I was able to compile it but:
*It needed a special version of qemu
*I made some changes that may need review

here's the diff for emacs:
diff -Nurd org.openembedded.dev/packages/emacs/emacs.inc
local_packages/packages/emacs/emacs.inc
--- org.openembedded.dev/packages/emacs/emacs.inc	2009-02-25
17:32:29.000000000 +0100
+++ local_packages/packages/emacs/emacs.inc	2009-02-25 18:04:56.000000000
+0100
@@ -5,6 +5,8 @@
 # and it needs to run some generated binaries..
 DEPENDS +=3D "qemu-native"

+DEPENDS +=3D" liblockfile"
+
 inherit autotools

 PACKAGES =3D+ "${PN}-el"
@@ -16,8 +18,12 @@

 FILES_${PN}-dbg +=3D "${libexecdir}/emacs/*/*/.debug
${datadir}/emacs/*/*/.debug"

+TREEDIR =3D "${WORKDIR}/qemu-treedir"
+
 # Large stack is required at least on x86_64 host, otherwise random
segfaults appear:
-QEMU =3D "qemu-${TARGET_ARCH} ${QEMU_OPTIONS} -s 1048576 -L
${STAGING_DIR_TARGET}"
+QEMU =3D "qemu-${TARGET_ARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR}"
+
+export LOGNAME =3D "$(whoami)"

 do_compile_prepend() {
 	sed -i ':1;s:\(START.* \|LIB_STANDARD.* \|LIBES.*
\)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h `find "${S}"
-name Makefile`
@@ -26,6 +32,19 @@
 	ln -sf ../src/emacs lisp/emacs
 	ln -sf ../src/emacs lib-src/emacs
 	ln -sf ../src/emacs leim/emacs
+#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copie=
d
code from glibc-package.bbclass
+	treedir=3D${TREEDIR}
+	if [ -e $treedir ];then
+		rm -rf $treedir
+	fi
+	mkdir $treedir
+	cp -pPR ${STAGING_DIR_TARGET}/* $treedir
+	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
+                cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so
$treedir/lib
+        fi
+        if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
+                cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.*
$treedir/lib
+        fi
 }

 EXTRA_OEMAKE +=3D 'QEMU=3D"${QEMU}"'
diff -Nurd org.openembedded.dev/packages/emacs/emacs-x11_22.3.bb
local_packages/packages/emacs/emacs-x11_22.3.bb
--- org.openembedded.dev/packages/emacs/emacs-x11_22.3.bb	2009-02-25
17:32:29.000000000 +0100
+++ local_packages/packages/emacs/emacs-x11_22.3.bb	2009-02-26
19:51:10.000000000 +0100
@@ -1,9 +1,9 @@
 require emacs.inc

 # full X (non-diet) is needed for X support
-DEPENDS +=3D "gtk+ libungif"
+DEPENDS +=3D "gtk+ libungif libxpm"

-EXTRA_OECONF =3D "--without-sound --with-x-toolkit=3Dgtk"
+EXTRA_OECONF =3D "--without-sound --with-x-toolkit=3Dgtk --with-xpm"

 RREPLACES =3D "emacs"

-----------------------------end diff------------------------------------=
-
DEPENDS +=3D"liblockfile" : that is because otherwise it complained about=
 it:
| checking for liblockfile.so... yes
| configure: error: Shared liblockfile found but can't link against it.
| This probably means that movemail could lose mail.
| There may be a `development' package to install containing liblockfile.
| FATAL: oe_runconf failed
NOTE: Task failed:
/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-22=
.3-r0/temp/log.do_configure.9431
NOTE: package emacs-22.3-r0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package emacs-22.3: failed
ERROR: Build of
/home/embedded/oe/org.openembedded.dev/packages/emacs/emacs_22.3.bb
do_configure failed
ERROR: Task 5
(/home/embedded/oe/org.openembedded.dev/packages/emacs/emacs_22.3.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 307 tasks of which 307 didn't need to be
rerun and 1 failed.
ERROR: '/home/embedded/oe/org.openembedded.dev/packages/emacs/

The treedir part is because it didn't find libgcc:

| unset CDPATH; \
| 	if [ -n "/bin/gzip" ]; \
| 	then \
| 	   echo "Compressing *.el ..." ; \
| 	   (cd
/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-22=
.3-r0/image/usr/share/emacs/22.3/leim;
for f in `find . -name "*.elc" -print`; do \
| 		/bin/gzip -9n `echo $f|sed 's/.elc$/.el/'` ; \
| 	    done) \
| 	else true; fi
| Compressing *.el ...
| chmod -R a+r
/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-22=
.3-r0/image/usr/share/emacs/22.3/leim
| find
/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-22=
.3-r0/image/usr/share/emacs/22.3/leim
-exec chown ${LOGNAME:-$USERNAME} '{}' ';'
| make[1]: Leaving directory
`/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-2=
2.3-r0/emacs-22.3/leim'
| cd lib-src; make maybe-blessmail  \
| 	  MAKE=3D'make'
archlibdir=3D'/usr/libexec/emacs/22.3/arm-angstrom-linux-gnueabi'
| make[1]: Entering directory
`/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-2=
2.3-r0/emacs-22.3/lib-src'
| qemu-arm  -s 1048576 -L
/home/embedded/oetmp_openmoko/staging/armv4t-angstrom-linux-gnueabi emacs
-batch --no-site-file --multibyte -l
/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-22=
.3-r0/emacs-22.3/lib-src/../lisp/mail/blessmail.el
| emacs: error while loading shared libraries: libgcc_s.so.1: cannot open
shared object file: No such file or directory
| make[1]: *** [blessmail] Error 127
| make[1]: Leaving directory
`/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-2=
2.3-r0/emacs-22.3/lib-src'
| make: *** [blessmail] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/embedded/oetmp_openmoko/work/armv4t-angstrom-linux-gnueabi/emacs-22=
.3-r0/temp/log.do_install.26296
NOTE: package emacs-22.3-r0: task do_install: failed
ERROR: TaskFailed event exception, aborting
NOTE: package emacs-22.3: failed
ERROR: Build of
/home/embedded/oe/local_packages/packages/emacs/emacs_22.3.bb do_install
failed
ERROR: Task 8
(/home/embedded/oe/local_packages/packages/emacs/emacs_22.3.bb,
do_install) failed
NOTE: Tasks Summary: Attempted 331 tasks of which 324 didn't need to be
rerun and 1 failed.
ERROR: '/home/embedded/oe/local_packages/packages/emacs/emacs_22.3.bb' fa=
iled
NOTE: build 200902251721: completed

--with-xpm is because otherwise the button in GTK are there but have no
icon in them,that is to say there is a x icon on top of each button

Note that I didn't bump the PR yet because it didn't compile...but maybe =
I
should if it compiled for other people(would fix the icon issue in
emacs-x11)

By the way I saw emacs(non x11 version) in freesmarphones.org unstable
repository...I wonder how it has been compiled or why it didn't work for
me.
This is the main reason why I'm asking for review or comments...it may be
my system/build environment,but in another hand another person wasn't abl=
e
to build it neither: there was a thread named:
[oe] Ugly build problem with emacs/qemu
in the devel mailing-list:
http://article.gmane.org/gmane.comp.handhelds.openembedded/21178/match=3D=
emacs


PS:I didn't look deeply into changing emacs-x11 fonts size yet:
It shows a lot of font size but if you don't stick to the default it says
the font is unavailable

Thanks in advance for the review
Denis.


