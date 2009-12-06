Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsR-0000aa-TG
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:55 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866281ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=SF/xhsk+MHlANmWOiI265Z7eNLt43ji5KPTP3v0nl6Q=;
	b=E5BgPH2IwasMSWl3+vHnPRoO5JjmD+yvZn/gyCQ6y9CRLdzpv+4TKv1Yvk0BvaVIGd
	M4ixUQeW+4kBVPU4BO/E5VBAbRWV09pKOXDga1C+dV//3zGFFIzdkiD7Ce/Z6ooogHrx
	B/828YWH+2alzSuOEJpHSbubfD2VHjEgZPWsE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=blrwiLrly1LIx7CV2xGQb8186Jg/gPwDiUBxtgKTVMwHqrMl7wPNqjUxqDHsHl3ILW
	tyTEydboRBO03PUVd4tZUWucF2PkslsC+tw0uKK9ZaUe3zdMRIV141x9US+5d6iHk2yf
	9OFNkavvq5zUa3mQu0F45gyWiVwarmWjmMAyA=
Received: by 10.213.2.82 with SMTP id 18mr6213922ebi.58.1260139515199;
	Sun, 06 Dec 2009 14:45:15 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:14 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:52 +0100
Message-Id: <1260139496-21442-17-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-16-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
	<1260139496-21442-14-git-send-email-leon@sidebranch.com>
	<1260139496-21442-15-git-send-email-leon@sidebranch.com>
	<1260139496-21442-16-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] linux-libc-headers_nios2-2.6.28.bb: Missed the .bb file earlier.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:47:01 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 .../linux-libc-headers_nios2-2.6.28.bb             |   83 ++++++++++++++++++++
 1 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux-libc-headers/linux-libc-headers_nios2-2.6.28.bb

diff --git a/recipes/linux-libc-headers/linux-libc-headers_nios2-2.6.28.bb b/recipes/linux-libc-headers/linux-libc-headers_nios2-2.6.28.bb
new file mode 100644
index 0000000..0cefc2c
--- /dev/null
+++ b/recipes/linux-libc-headers/linux-libc-headers_nios2-2.6.28.bb
@@ -0,0 +1,83 @@
+require linux-libc-headers.inc
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "unifdef-native"
+PR = "r3"
+
+#SRCREV = "3146b39c185f8a436d430132457e84fa1d8f8208"
+SRCREV = "d01303a1035a39e445007c7522d89ad985c4153c"
+
+SRC_URI = "git://sopc.et.ntust.edu.tw/git/linux-2.6.git;branch=test-nios2;protocol=http \
+           file://procinfo.h \
+           file://system.ptf \
+           file://headless_hwselect.patch;patch=1;pnum=2 \
+	  "
+
+#           file://hardware.mk \
+#           file://defconfig \
+
+S = "${WORKDIR}/git"
+
+#SRC_URI = "http://127.0.0.1/linux-nios2-2.6.28-git.tbz \
+#           file://procinfo.h \
+#           file://system.ptf"
+#S = "${WORKDIR}/linux-2.6"
+
+set_arch() {
+	case ${TARGET_ARCH} in
+		alpha*)   ARCH=alpha ;;
+		arm*)     ARCH=arm ;;
+		cris*)    ARCH=cris ;;
+		hppa*)    ARCH=parisc ;;
+		i*86*)    ARCH=i386 ;;
+		ia64*)    ARCH=ia64 ;;
+		mips*)    ARCH=mips ;;
+		m68k*)    ARCH=m68k ;;
+		powerpc*) ARCH=powerpc ;;
+		s390*)    ARCH=s390 ;;
+		sh*)      ARCH=sh ;;
+		sparc64*) ARCH=sparc64 ;;
+		sparc*)   ARCH=sparc ;;
+		x86_64*)  ARCH=x86_64 ;;
+	        avr32*)   ARCH=avr32 ;;
+                bfin*)    ARCH=blackfin ;;
+		nios2*)	  ARCH=nios2 ;;
+	esac
+}
+
+do_configure() {
+	set_arch
+#	cp ../hardware.mk arch/nios2
+	oe_runmake hwselect SYSPTF=../system.ptf CPU_SELECTION=1 MEM_SELECTION=2 ARCH=$ARCH
+	oe_runmake allnoconfig ARCH=$ARCH
+}
+
+do_compile () {
+}
+
+do_install() {
+	set_arch
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+}
+
+do_install_append_arm() {
+	cp ${WORKDIR}/procinfo.h ${D}${includedir}/asm/
+}
+
+STAGE_TEMP="${WORKDIR}/temp-staging"
+
+do_stage () {
+	set_arch
+	echo $ARCH
+	rm -rf ${STAGE_TEMP}
+	mkdir -p ${STAGE_TEMP}
+	oe_runmake headers_install INSTALL_HDR_PATH=${STAGE_TEMP}${exec_prefix} ARCH=$ARCH
+	if [ "$ARCH" = "arm" ]; then
+		cp ${WORKDIR}/procinfo.h ${STAGE_TEMP}${includedir}/asm/
+	fi
+	install -d ${STAGING_INCDIR}
+	rm -rf ${STAGING_INCDIR}/linux ${STAGING_INCDIR}/asm ${STAGING_INCDIR}/asm-generic
+	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${STAGING_INCDIR}/
+	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${STAGING_INCDIR}/
+	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${STAGING_INCDIR}/
+}
-- 
1.6.0.4



