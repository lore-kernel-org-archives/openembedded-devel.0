Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id C2DCA60EB8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2014 16:41:18 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so5074009wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2014 08:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fF+xX9fkTNgSiOVZG8TM+UMJVgTyBW6IClAHGD/2Z5Q=;
	b=H+zHpvUz+yahEMtWnBaGP9+9MPBI01iGgKVpZBQNlyHxr8Z/iI6l3aKT3lCkH9vEAD
	GIQukW2hmu6irxozdO71FzNfawiLeSu3dyaSPG2asYzkENaQsPBlhEW9quEup9tbTLhe
	LfrK2Bk3/pZ9qqJ5xwKt5kJ9l0KHAlt+p4n8mFTmw0C53Qqi8NcbQv/ifQE6gl1cjU4T
	pEKg46vladNpNiwMcFTyLB7Q11yUbANf7OvcMX5qtiQT5aG+dl/ttKs7+k5kZAIs1BV1
	GJZINq9SkSwW6zF0TjgupjcbNUHW3niaZprjzI3tWIXq9yaRZLi/GKUq09DY7UevqJnn
	a5yA==
X-Gm-Message-State: ALoCoQmBbVM3ZR4bQ18OVRVpz16TRPeZQ+Ixr3+6VXRGRSGNFRzxChlRLbc7MXx5ADTTUfxASy+H
X-Received: by 10.194.82.68 with SMTP id g4mr104180wjy.85.1389458479375;
	Sat, 11 Jan 2014 08:41:19 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id ks3sm6958854wjc.10.2014.01.11.08.41.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 08:41:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2014 17:41:17 +0100
Message-Id: <1389458477-14514-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-initramfs][PATCH] dracut: add git version
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
X-List-Received-Date: Sat, 11 Jan 2014 16:41:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-xz-lzma-option-to-use-all-cores-for-mult.patch | 39 ++++++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb          | 38 +++++++++++++++++++++
 2 files changed, 77 insertions(+)
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
index 0000000..ccc4e7d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -0,0 +1,38 @@
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
1.8.4.2


