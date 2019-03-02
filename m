Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id AA3997C4B5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 09:26:46 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1h00us-0001rM-Sc; Sat, 02 Mar 2019 10:26:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jOzTw2LzQ/SHBdVFska7riLjEOwU7/GdmPtgVrF1U1w=;
	b=URvXhY9PQOyC07Gxk8/eK3wgkq
	6KHxF+ho7Gjy2xlfzbcQ6XSqhAswHBH6+u55zVhkOHkcs0W6wJaoIaXcAprT5AzT1ghhlkkC9pnlA
	+lknXWkzVub8T+zG/MfpKz7K49R0J1913k9MnlU4pSD/aSlC9F0JJLAnR2P6v9sB73kV6tSwJrNr+
	oEW+X4/GUG3p1FpvGpXZwKouNrYAlVsmbOq7JgzMdgwAvOQnolMVK/Q6KdsuOeo/ATJvseuRHmW6G
	2GAeqFeRIuxzUCNuxUukK02Rpns70aZyBmAWGlskaG+09cFYE693ZtAbmjeIujX/BFPDp7iKb3CVQ
	t36Qshzw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1h00up-0000Or-4o; Sat, 02 Mar 2019 10:26:44 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Sat,  2 Mar 2019 10:26:07 +0100
Message-Id: <20190302092607.8847-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: c4123669e8eb144465b44cd511c9649f
X-Spam-Tracer: backend.mail.pr.hu -1.9 20190302092644Z
Subject: [meta-initramfs][PATCH] dracut.bbclass: Autodetect initramfs compression type
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
X-List-Received-Date: Sat, 02 Mar 2019 09:26:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

INITRAMFS_FSTYPES is the official setting for this, use it
by default instead of manually setting it from this class.

Also use the same for depending on the correct compressor.

kmod and kernel configurations should support the compression type
set in INITRAMFS_FSTYPES.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-initramfs/classes/dracut.bbclass | 37 ++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/classes/dracut.bbclass b/meta-initramfs/classes/dracut.bbclass
index 58c4493a3..c70aa6430 100644
--- a/meta-initramfs/classes/dracut.bbclass
+++ b/meta-initramfs/classes/dracut.bbclass
@@ -1,10 +1,41 @@
 DRACUT_PN ??= "${PN}"
-DRACUT_OPTS ??= "--early-microcode --lzma"
+
+def dracut_compression_type(d):
+    rdtype = d.getVar("INITRAMFS_FSTYPES", True).split('.')
+    if len(rdtype) != 2:
+        return ['','','']
+    if rdtype[0] != 'cpio':
+        return ['','','']
+    cmptypes = [['gz','--gzip','gzip'],['bz2', '--bzip2','bzip2'],['lzma','--lzma','xz'],['xz','--xz','xz'],['lzo','--lzo','lzo'],['lz4','--lz4','lz4'],['zstd','--zstd','zstd']]
+    for cmp in cmptypes:
+        if rdtype[1] == cmp[0]:
+            return cmp
+    return ['','','']
+
+def dracut_compression_opt(d):
+    cmp = dracut_compression_type(d)
+    return cmp[1]
+
+def dracut_compression_pkg(d):
+    cmp = dracut_compression_type(d)
+    return cmp[2]
+
+def dracut_compression_pkg_native(d):
+    cmp = dracut_compression_type(d)
+    if cmp[2] == '':
+        return ''
+    return cmp[2] + '-native'
+
+DRACUT_COMPRESS_OPT ??= "${@dracut_compression_opt(d)}"
+DRACUT_COMPRESS_PKG ??= "${@dracut_compression_pkg(d)}"
+DRACUT_COMPRESS_PKG_NATIVE ??= "${@dracut_compression_pkg_native(d)}"
+
+DRACUT_OPTS ??= "--early-microcode ${DRACUT_COMPRESS_OPT}"
 
 python __anonymous () {
     pkg = d.getVar("DRACUT_PN", True)
     if pkg != 'dracut':
-        d.appendVar("RDEPENDS_%s" % pkg, " dracut ")
+        d.appendVar("RDEPENDS_%s" % pkg, " dracut %s " % d.getVar("DRACUT_COMPRESS_PKG", True))
     if not pkg.startswith('kernel'):
         d.appendVarFlag("do_configure", "depends", "virtual/kernel:do_shared_workdir")
         d.appendVarFlag("do_compile", "depends", "virtual/kernel:do_compile_kernelmodules")
@@ -74,7 +105,7 @@ PACKAGESPLITFUNCS_prepend = "dracut_populate_packages "
 DRACUT_DEPENDS = " \
 			binutils-cross-${TUNE_ARCH} gcc-cross-${TUNE_ARCH} \
 			ldconfig-native coreutils-native findutils-native \
-			cpio-native util-linux-native kmod-native xz-native \
+			cpio-native util-linux-native kmod-native ${DRACUT_COMPRESS_PKG_NATIVE} \
 			dracut-native pkgconfig-native cross-compiler-ldd \
 			${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 		"
-- 
2.20.1


