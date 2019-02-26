Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2587CC87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:55:13 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSE-0000U7-ET; Tue, 26 Feb 2019 10:55:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=49ZBjcvoJ29O+SEmuqRCjsx1ry9dAwn6D9luhDiNGtE=;
	b=OpQglKTkzLodMvpot1WCvam3UG
	YvJm4rCR81vpbf8AWmjoX+kRlP6w8GmtTb+Awc7lzuBY/7XdzV79O8dn2fUzQxaoy0xuWZsHqVcxF
	WnAgMZvA/5zBfXqjYQ0eR2oQPrpfzjXp2ZobgHCJBNggzJJEAU7v3LUCKKcVuaK9qtaoOVNKT29oc
	DNZwYaomfqVHAHq9rfM3QPzjm9vxOL9Racbr7TjagJ59KxeVDksZ+Ia2DZBVPNV8WCyP0scwvx62f
	uiGj4aCSsl7f7A9dn8zQhKkKzpPj7idNjoHH6QG5IouyzNeW6FtGI9rtF/ifGq2wb4E/rcWYfOUT4
	tCEpHwZQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZS9-0005Cn-89; Tue, 26 Feb 2019 10:55:12 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:54:56 +0100
Message-Id: <20190226095502.5499-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190226095502.5499-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 58ab21d751055c5f434a9dd5a96062a4
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190226095512Z
Subject: [meta-initramfs][PATCH 1/7] cross-compiler-ldd: add new recipe
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
X-List-Received-Date: Tue, 26 Feb 2019 09:55:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dracut runs ldd internally when discovering library dependencies
for executables. cross-compiler-ldd is needed so dracut may
eventually run while creating the rootfs.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 .../cross-compile-ldd-fix-infinite-loop.patch | 19 +++++++++++
 .../dracut/cross-compiler-ldd_git.bb          | 33 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd/cross-compile-ldd-fix-infinite-loop.patch
 create mode 100644 meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd_git.bb

diff --git a/meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd/cross-compile-ldd-fix-infinite-loop.patch b/meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd/cross-compile-ldd-fix-infinite-loop.patch
new file mode 100644
index 000000000..4aae731d1
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd/cross-compile-ldd-fix-infinite-loop.patch
@@ -0,0 +1,19 @@
+diff --git a/cross-compile-ldd b/cross-compile-ldd
+index ef2ca20..332d57f 100644
+--- a/cross-compile-ldd
++++ b/cross-compile-ldd
+@@ -337,13 +337,13 @@ do_scan_etc_ldsoconf() {
+ # Build up the full list of search directories
+ declare -a needed_search_path
+ do_trace "Adding basic lib dirs\n"
+-ld_library_path="${ld_library_path}:"
+ while [ -n "${ld_library_path}" ]; do
+     d="${ld_library_path%%:*}"
+     if [ -n "${d}" ]; then
+         do_trace "-> adding search dir '%s'\n" "${d}"
+         needed_search_path+=( "${d}" )
+     fi
++    [[ "$ld_library_path" == "${ld_library_path#*:}" ]] && break
+     ld_library_path="${ld_library_path#*:}"
+ done
+ do_trace "Done adding basic lib dirs\n"
diff --git a/meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd_git.bb b/meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd_git.bb
new file mode 100644
index 000000000..f8b7906ea
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/cross-compiler-ldd_git.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Cross-compiler LDD"
+HOMEPAGE = "https://gist.github.com/c403786c1394f53f44a3b61214489e6f"
+BUGTRACKER = ""
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://cross-compile-ldd;beginline=53;endline=57;md5=2b29d19d18a430b931dda3750e865c84"
+
+SRCBRANCH = "master"
+SRCREV = "eb44581caf7dd60b149a6691abef46264c46e866"
+SRC_URI = " \
+			git://gist.github.com/c403786c1394f53f44a3b61214489e6f.git;protocol=https;branch=${SRCBRANCH} \
+			file://cross-compile-ldd-fix-infinite-loop.patch \
+		"
+
+S = "${WORKDIR}/git"
+
+inherit siteinfo
+
+SYSROOT_PREPROCESS_FUNCS += " cross_ldd_populate_sysroot "
+
+cross_ldd_populate_sysroot() {
+	mkdir -p ${SYSROOT_DESTDIR}${bindir_crossscripts}
+	cat ${S}/cross-compile-ldd | \
+		sed \
+			-e "s,^prefix=.*$,prefix=${TARGET_SYS}," \
+			-e "s,^bits=.*$,bits=${SITEINFO_BITS}," \
+			-e "s,^ld_library_path=.*$,ld_library_path=${LD_LIBRARY_PATH:-/lib:/usr/lib}," \
+		>${SYSROOT_DESTDIR}${bindir_crossscripts}/ldd
+	chmod +x ${SYSROOT_DESTDIR}${bindir_crossscripts}/ldd
+}
+
+DEPENDS = "coreutils-native sed-native binutils-cross-${TARGET_ARCH} gcc-cross-${TARGET_ARCH}"
+PACKAGE_WRITE_DEPS = "coreutils-native sed-native binutils-cross-${TARGET_ARCH} gcc-cross-${TARGET_ARCH}"
-- 
2.20.1


