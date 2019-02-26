Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D67E57CCA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:55:20 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSL-0000Z2-PI; Tue, 26 Feb 2019 10:55:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kIzBrsiXvSLD1EjXr4LTyiaO3uQM5xZ/aFAhC4WhNh4=;
	b=TzmfW9W7JToQ3tbLqplsK+20C4
	Bl34Bv81Ko9ytoKVtVjEi79pQC4Jxs27rKOLeqX3i4BdLtK121WT5yum+KPrW0NJFl4+UbTb/bcHk
	UUQkX7+FdM4bIFZF4ag6ol/WiwniwO1K5x4xGYEg95LAoEBgkka8ZMOPmh19GtZiQV4fYaQk+jgiR
	sxwZIin/t9k1y3i0t8mC5bNXgvC89WpfbSXQ761kG6XwheYGaBVS2sqTHN55m4t6EIVQ9UazXqBwe
	pdkjZqO3WdYoydt34vWCQcFOB0lSKgMPb1urZa0cRWx7R9Q5BJoSQjGhYhWtb5T8qJBF2+bWS2xKu
	ijGEwE+Q==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSI-0005Cn-0K; Tue, 26 Feb 2019 10:55:19 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:55:00 +0100
Message-Id: <20190226095502.5499-6-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190226095502.5499-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 582fc7b01b362351a1aaa9a443528bc7
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190226095519Z
Subject: [meta-initramfs][PATCH 5/7 v3] classes/dracut.bbclass: add new bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 09:55:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dracut.bbclass can be used from kernel or other recipes, like
custom dracut modules or plymouth boot splash themes.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Use ${TUNE_ARCH} so allarch packages can use this bbclass.

v3: Conditionally depend on systemd based on DISTRO_FEATURES.

 meta-initramfs/classes/dracut.bbclass | 82 +++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 meta-initramfs/classes/dracut.bbclass

diff --git a/meta-initramfs/classes/dracut.bbclass b/meta-initramfs/classes/dracut.bbclass
new file mode 100644
index 000000000..58c4493a3
--- /dev/null
+++ b/meta-initramfs/classes/dracut.bbclass
@@ -0,0 +1,82 @@
+DRACUT_PN ??= "${PN}"
+DRACUT_OPTS ??= "--early-microcode --lzma"
+
+python __anonymous () {
+    pkg = d.getVar("DRACUT_PN", True)
+    if pkg != 'dracut':
+        d.appendVar("RDEPENDS_%s" % pkg, " dracut ")
+    if not pkg.startswith('kernel'):
+        d.appendVarFlag("do_configure", "depends", "virtual/kernel:do_shared_workdir")
+        d.appendVarFlag("do_compile", "depends", "virtual/kernel:do_compile_kernelmodules")
+}
+
+export BUILD_TIME_KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
+
+dracut_postinst () {
+	MY_KERNEL_VERSION=$(readlink $D/boot/bzimage | sed 's,^.*bzImage-,,')
+	if [[ -z "$MY_KERNEL_VERSION" ]]; then
+		MY_KERNEL_VERSION="${KERNEL_VERSION}"
+	fi
+	if [[ -z "$MY_KERNEL_VERSION" ]]; then
+		MY_KERNEL_VERSION="${BUILD_TIME_KERNEL_VERSION}"
+	fi
+	if [[ -z "$MY_KERNEL_VERSION" ]]; then
+		exit 1
+	fi
+
+	if [ -n "$D" ]; then
+		#DEBUGOPTS="--debug --keep"
+		DEBUGOPTS="--keep"
+
+		# We have to unset "prefix" as dracut uses it to move files around.
+		# Yocto has it set as part of the build environment.
+		$INTERCEPT_DIR/postinst_intercept execute_dracut ${PKG} mlprefix=${MLPREFIX} \
+			prefix= \
+			MY_KERNEL_VERSION=$MY_KERNEL_VERSION \
+			DEPMODOPT="\"-b $D\"" \
+			dracutsysrootdir=$D \
+			DEBUGOPTS="\"$DEBUGOPTS\"" \
+			DRACUT_OPTS="\"${DRACUT_OPTS}\"" \
+			EXTRAOPTS="\"-k $D/lib/modules/$MY_KERNEL_VERSION\"" \
+			systemdutildir=${systemd_unitdir} \
+			systemdsystemunitdir=${systemd_system_unitdir} \
+			systemdsystemconfdir=/etc/systemd/system \
+			udevdir=/usr/lib/udev \
+			DRACUT_TMPDIR=${WORKDIR}/dracut-tmpdir \
+			DRACUT_ARCH="${TUNE_ARCH}" \
+			DRACUT_TESTBIN=/bin/bash.bash \
+			DRACUT_COMPRESS_LZMA=$NATIVE_ROOT/usr/bin/lzma \
+			DRACUT_LDD="\"PATH='$PATH' ${STAGING_BINDIR_CROSS}/ldd --root $D\"" \
+			DRACUT_LDCONFIG=$NATIVE_ROOT/usr/bin/ldconfig \
+			DRACUT_INSTALL="\"$NATIVE_ROOT/usr/lib/dracut/dracut-install\"" \
+			DRACUT_INSTALL_PATH="/usr/sbin:/usr/bin:/sbin:/bin"
+	else
+		execute_dracut $MY_KERNEL_VERSION ${DRACUT_OPTS}
+	fi
+}
+
+dracut_populate_packages[vardeps] += "dracut_postinst"
+
+python dracut_populate_packages() {
+    localdata = d.createCopy()
+
+    pkg = d.getVar('DRACUT_PN', True)
+
+    postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+    if not postinst:
+        postinst = '#!/bin/sh\n'
+    postinst += localdata.getVar('dracut_postinst', True)
+    d.setVar('pkg_postinst_%s' % pkg, postinst)
+}
+
+PACKAGESPLITFUNCS_prepend = "dracut_populate_packages "
+
+DRACUT_DEPENDS = " \
+			binutils-cross-${TUNE_ARCH} gcc-cross-${TUNE_ARCH} \
+			ldconfig-native coreutils-native findutils-native \
+			cpio-native util-linux-native kmod-native xz-native \
+			dracut-native pkgconfig-native cross-compiler-ldd \
+			${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+		"
+DEPENDS_append_class-target = " ${DRACUT_DEPENDS}"
+PACKAGE_WRITE_DEPS_append = " ${DRACUT_DEPENDS}"
-- 
2.20.1


