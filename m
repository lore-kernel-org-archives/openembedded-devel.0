Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 379276A463
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 11:08:53 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x12so7761316wgg.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 03:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BL6q0IpyLhS91cZ9wvHXM6Lx3YXvT9wxc58GlzPccaQ=;
	b=IvHcKEvpMiMOTaJR/IWsDWbfsKI2lAJUS+uIe/IhMw7jMDG8npG7VNiynaBq4dukj5
	P3yfwp71T1xQg/N35YvGV4kTCZt1rMP/UPiPucO4muiBm1oYaffkwqWPVckiBTKJx4xV
	37ZFXIz4MDSUkg6ovA28Kcc5fbAZSUd5+PiLOELucSnklxnF83R4bCIcAUnFdlQ+rDm6
	UfawRiH4tUCGEEm1GAdzlRACv2pxG45zL3jMRTf9B0W4MHecmd6GRHghU8FZHHoPOOsa
	EBKgzMvRk5n+2/aD43zOHIMI5g3i8VAQIY8A1PZAfrd47WfSw5qvfXN5mjIHuuVOz8Of
	oo6A==
X-Gm-Message-State: ALoCoQldkVfOj7IWYrP5thr+T7ljKA3a9SIP94XuDIrh983NBtuE73wVTfYAxznofoC368YMWLiR
X-Received: by 10.180.208.73 with SMTP id mc9mr5527175wic.54.1390302533292;
	Tue, 21 Jan 2014 03:08:53 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id uc9sm9684841wib.2.2014.01.21.03.08.52
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 03:08:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2014 12:08:46 +0100
Message-Id: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-initramfs][PATCHv2] dracut: add git version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2014 11:08:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Changes since v1:
	Fix PV

To make it work properly in systemd mode you'll need http://patches.openembedded.org/patch/65317/ as well.

 ...-xz-lzma-option-to-use-all-cores-for-mult.patch |   39 +++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb          |   40 ++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut_git.bb

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch
new file mode 100644
index 0000000..7dc62de
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch
@@ -0,0 +1,39 @@
+From c92ea797c43aa811e98b6bd8fb4aae921fa08592 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 10 Jan 2014 21:11:40 +0100
+Subject: [PATCH] Use builtin xz/lzma option to use all cores for multihreaded
+ compression
+
+This removes the dependency on 'getconf' as well, which is not installed by default on my embedded systems.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Upstream-status: Submitted
+
+---
+ dracut.sh | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/dracut.sh b/dracut.sh
+index 11dcd0e..2e6ea67 100755
+--- a/dracut.sh
++++ b/dracut.sh
+@@ -697,14 +697,12 @@ stdloglvl=$((stdloglvl + verbosity_mod_l))
+ # eliminate IFS hackery when messing with fw_dir
+ fw_dir=${fw_dir//:/ }
+ 
+-cpu_count=$(getconf _NPROCESSORS_ONLN)
+-
+ # handle compression options.
+ [[ $compress ]] || compress="gzip"
+ case $compress in
+     bzip2) compress="bzip2 -9";;
+-    lzma)  compress="lzma -9 ${cpu_count:+-T$cpu_count}";;
+-    xz)    compress="xz --check=crc32 --lzma2=dict=1MiB ${cpu_count:+-T$cpu_count}";;
++    lzma)  compress="lzma -9 -T0";;
++    xz)    compress="xz --check=crc32 --lzma2=dict=1MiB -T0";;
+     gzip)  compress="gzip -9"; command -v pigz > /dev/null 2>&1 && compress="pigz -9";;
+     lzo)   compress="lzop -9";;
+     lz4)   compress="lz4 -9";;
+-- 
+1.8.0
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
new file mode 100644
index 0000000..13181fe
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Initramfs generator using udev"
+DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the tool) is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework, usually found in /usr/lib/dracut/modules.d."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "bb1ba3a1ca9dd6284f6319eb197de4a757a7f99d"
+SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git \
+           file://0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch \
+          "
+
+PV = "0.34+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+    ./configure --prefix=${prefix} \
+                --libdir=${libdir} \
+                --datadir=${datadir} \
+                --sysconfdir=${sysconfdir} \
+                --sbindir=${sbindir} \
+                --disable-documentation \
+                --bindir=${bindir} \
+                --includedir=${includedir} \
+                --localstatedir=${localstatedir} \
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${datadir}/bash-completion \ 
+                ${libdir}/kernel \
+               "
+
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid bash ldd"
+# This could be optimized a bit, but let's avoid non-booting systems :)
+RRECOMMENDS_${PN} = " \
+                     kernel-modules \ 
+                    "
-- 
1.7.10


