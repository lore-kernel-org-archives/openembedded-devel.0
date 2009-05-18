Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1M69jW-0002bm-0U
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 22:46:50 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 18 May 2009 22:39:30 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 18 May 2009 22:39:07 +0200
Received: from [192.168.1.107] ([79.54.10.109]) by FBCMCL01B09.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 18 May 2009 22:34:37 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <39983.AFRVDw5RXnw=.1235775042.squirrel@webmail.no-log.org>
References: <43954.AFRVDw5RXnw=.1235749389.squirrel@webmail.no-log.org>
	<go9m74$k03$1@ger.gmane.org>
	<39983.AFRVDw5RXnw=.1235775042.squirrel@webmail.no-log.org>
Date: Mon, 18 May 2009 22:40:57 +0200
Message-Id: <1242679257.9986.8.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 18 May 2009 20:34:37.0203 (UTC)
	FILETIME=[0FB32630:01C9D7F8]
Subject: Re: [patch](or sort of): emacs didn't compile[second part: qemu recipe]
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
X-List-Received-Date: Mon, 18 May 2009 20:46:50 -0000
X-Groupsio-MsgNum: 10474
Content-Type: multipart/mixed; boundary="=-W41w/Q+4K856x5t8I+HZ"

--=-W41w/Q+4K856x5t8I+HZ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-02-27 at 23:50 +0100, GNUtoo wrote:
> > On 27-02-09 16:43, GNUtoo wrote:
> >
> >> +EXTRA_OECONF += "--target-list=arm-linux-user"
> >
> > NACK, OE handles more than ARM
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> yes I know...the qemu recipe is very problematic...that's why I asked what
> to do
> I'd like to integrate the necessary arm patches that permit the build of
> emacs...but I don't know which ones of the patches I should integrate...
> Denis.
I've news:
I've tried the last qemu: qemu-native-0.10.3
and it worked...
but it need a modified emacs[-x11] recipe that is attached...
Comments are welcome

Denis


--=-W41w/Q+4K856x5t8I+HZ
Content-Disposition: attachment; filename="emacs.diff"
Content-Type: text/x-patch; name="emacs.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs-22.3/use-qemu.patch b/emacs/emacs-22.3/use-qemu.patch
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs-x11_20060801.bb b/emacs/emacs-x11_20060801.bb
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs-x11_22.3.bb b/emacs/emacs-x11_22.3.bb
index 03102bf..4475e08 100644
--- a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs-x11_22.3.bb
+++ b/emacs/emacs-x11_22.3.bb
@@ -1,12 +1,14 @@
 require emacs.inc
 
 # full X (non-diet) is needed for X support
-DEPENDS += "gtk+ libungif"
+DEPENDS += "gtk+ libungif libxpm"
 
-EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk"
+EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk --with-xpm"
 
 RREPLACES = "emacs"
 
+PR="r1"
+
 FILESPATH = "${FILE_DIRNAME}/emacs-${PV}:${FILE_DIRNAME}/files"
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz \
 	   file://use-qemu.patch;patch=1 \
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs-x11_cvs.bb b/emacs/emacs-x11_cvs.bb
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs.inc b/emacs/emacs.inc
index 05acd82..0464a26 100644
--- a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs.inc
+++ b/emacs/emacs.inc
@@ -5,6 +5,8 @@ SECTION = "editor"
 # and it needs to run some generated binaries..
 DEPENDS += "qemu-native"
 
+DEPENDS +=" liblockfile"
+
 inherit autotools
 
 PACKAGES =+ "${PN}-el"
@@ -16,8 +18,12 @@ FILES_${PN} += "${datadir}/emacs"
 
 FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
 
+TREEDIR = "${WORKDIR}/qemu-treedir"
+
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "qemu-${TARGET_ARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET}"
+QEMU = "qemu-${TARGET_ARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR}"
+
+export LOGNAME = "$(whoami)"
 
 do_compile_prepend() {
 	sed -i ':1;s:\(START.* \|LIB_STANDARD.* \|LIBES.* \)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h `find "${S}" -name Makefile`
@@ -26,6 +32,19 @@ do_compile_prepend() {
 	ln -sf ../src/emacs lisp/emacs
 	ln -sf ../src/emacs lib-src/emacs
 	ln -sf ../src/emacs leim/emacs
+#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copied code from glibc-package.bbclass
+	treedir=${TREEDIR}
+	if [ -e $treedir ];then
+		rm -rf $treedir
+	fi
+	mkdir $treedir
+	cp -pPR ${STAGING_DIR_TARGET}/* $treedir
+	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
+                cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
+        fi
+        if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
+                cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
+        fi
 }
 
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs_20060801.bb b/emacs/emacs_20060801.bb
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs_22.3.bb b/emacs/emacs_22.3.bb
index da8de39..4eeff7b 100644
--- a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs_22.3.bb
+++ b/emacs/emacs_22.3.bb
@@ -1,5 +1,7 @@
 require emacs.inc
 
+PR="r1"
+
 EXTRA_OECONF = "--without-sound --without-x"
 
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz \
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs_cvs.bb b/emacs/emacs_cvs.bb
index 4a406d6..dca13b1 100644
--- a/home/embedded/oe/org.openembedded.dev/recipes/emacs/emacs_cvs.bb
+++ b/emacs/emacs_cvs.bb
@@ -6,6 +6,7 @@ SECTION = "editor"
 DEPENDS += "qemu-native"
 #NOTE: I have found that this only works with qemu-0.8.0. If I use 0.8.1 or 0.8.2
 # the build gets hung up on compiling certain .el files
+DEPENDS +="liblockfile"
 
 PV = "22.0.50+cvs${SRCDATE}" 
 PE = "1"
@@ -31,6 +32,8 @@ LDFLAGS += "-L${CROSS_DIR}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = "--without-sound --without-x"
 
+#export LOGNAME:-$USERNAME = "${LOGNAME:-$USERNAME}"
+
 do_bootstrap() {
     cp "${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
     export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
@@ -50,3 +53,7 @@ do_compile_prepend() {
     export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
     export QEMU="${QEMU}"
 }
+
+#do_install_prepend(){
+#    export LOGNAME:-$USERNAME = "${LOGNAME:-$USERNAME}"
+#}
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/files/nostdlib-unwind.patch b/emacs/files/nostdlib-unwind.patch
diff --git a/home/embedded/oe/org.openembedded.dev/recipes/emacs/files/use-qemu.patch b/emacs/files/use-qemu.patch

--=-W41w/Q+4K856x5t8I+HZ--
