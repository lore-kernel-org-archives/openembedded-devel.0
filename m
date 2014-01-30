Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 16ED26E9BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 09:05:56 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id m15so5724517wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 01:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VbWezOiIhYBN0buvH4RnkDUz8Gr5UF1UWf3Ri+MYuZk=;
	b=iyEvuuuTlp5JwhXFxXsDXK7x2YgWY3vVqTdj/SHg70KIiC0DK1ARgekNpecfMolX5O
	ESu35pcq8ZYjkM87iXfaEwMDHCoVxGsGGZTP12t5rinNEDPbLeLpQud3FjJdKmkfmqC3
	4yvKJvTm4Ocw1rvrglnRQ96Pt2+g5fCfHREyt0HWZVVAANnVwluifcU1rzPAvpI8yQJk
	sJON6kPDqe7cVYZR5PxQOH8a4xRS54zeUDjQIOJ2ne0eRkFP+2artmZ9OiAhEMTFV7fH
	yX2mzy98yV2turuCsU/8MmdXhBcdn/UYmQBf1QoHVZOvun21oa60I4EXqYGkrvXdevHg
	O4+w==
X-Gm-Message-State: ALoCoQmasuYCodiTh8XkwDEPHWwe5MY55MX4cS1MRmWEC5dO8Invp7AXGwV0Up/GCPr1B43rkUkt
X-Received: by 10.180.108.130 with SMTP id hk2mr22687056wib.16.1391072757700; 
	Thu, 30 Jan 2014 01:05:57 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id gc5sm11217012wib.0.2014.01.30.01.05.56
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Thu, 30 Jan 2014 01:05:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jan 2014 10:05:50 +0100
Message-Id: <1391072750-8210-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-initramfs][PATCH] dracut: update to 036
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
X-List-Received-Date: Thu, 30 Jan 2014 09:05:57 -0000

* Patch was applied upstream, delete it
* Add coreutils dep to stop scripts from erroring out
* bump PE to since 'git' > '036'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-xz-lzma-option-to-use-all-cores-for-mult.patch | 39 ----------------------
 .../recipes-devtools/dracut/dracut_git.bb          | 13 +++++---
 2 files changed, 8 insertions(+), 44 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch
deleted file mode 100644
index 7dc62de..0000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c92ea797c43aa811e98b6bd8fb4aae921fa08592 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 10 Jan 2014 21:11:40 +0100
-Subject: [PATCH] Use builtin xz/lzma option to use all cores for multihreaded
- compression
-
-This removes the dependency on 'getconf' as well, which is not installed by default on my embedded systems.
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Upstream-status: Submitted
-
----
- dracut.sh | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/dracut.sh b/dracut.sh
-index 11dcd0e..2e6ea67 100755
---- a/dracut.sh
-+++ b/dracut.sh
-@@ -697,14 +697,12 @@ stdloglvl=$((stdloglvl + verbosity_mod_l))
- # eliminate IFS hackery when messing with fw_dir
- fw_dir=${fw_dir//:/ }
- 
--cpu_count=$(getconf _NPROCESSORS_ONLN)
--
- # handle compression options.
- [[ $compress ]] || compress="gzip"
- case $compress in
-     bzip2) compress="bzip2 -9";;
--    lzma)  compress="lzma -9 ${cpu_count:+-T$cpu_count}";;
--    xz)    compress="xz --check=crc32 --lzma2=dict=1MiB ${cpu_count:+-T$cpu_count}";;
-+    lzma)  compress="lzma -9 -T0";;
-+    xz)    compress="xz --check=crc32 --lzma2=dict=1MiB -T0";;
-     gzip)  compress="gzip -9"; command -v pigz > /dev/null 2>&1 && compress="pigz -9";;
-     lzo)   compress="lzop -9";;
-     lz4)   compress="lz4 -9";;
--- 
-1.8.0
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index ccc4e7d..945ba0f 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -4,10 +4,12 @@ DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the t
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "bb1ba3a1ca9dd6284f6319eb197de4a757a7f99d"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git \
-           file://0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patch \
-          "
+PE = "1"
+PV = "036"
+
+# v036 tag
+SRCREV = "d50a99c5ceeb7107f624c5d3238d37509b2217a8"
+SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
 
@@ -34,5 +36,6 @@ FILES_${PN} += "${datadir}/bash-completion \
 RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid bash ldd"
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
-                     kernel-modules \ 
+                     kernel-modules \
+                     coreutils \ 
                     "
-- 
1.8.3.4


