Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE17B7D274
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 09:38:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x339bIew032142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Apr 2019 02:37:39 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 3 Apr 2019 02:37:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 3 Apr 2019 17:37:24 +0800
Message-ID: <1554284244-29098-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: fix udevdir not found
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
X-List-Received-Date: Wed, 03 Apr 2019 09:38:05 -0000
Content-Type: text/plain

In commit [9d1b81c dracut.sh: improve udevdir and systemdutildir
fallback logic], it checked a common binary `collect' to localte
udevdir.

While upgrading systemd to 241, it dropped binary `collect'.
[https://github.com/systemd/systemd/commit/a168792c2d95695fd30c0371d4b3890a9df1eafb]

So check binary `ata_id' to instead.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dracut/0001-dracut.sh-improve-udevdir.patch    | 39 ++++++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb          |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-dracut.sh-improve-udevdir.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-dracut.sh-improve-udevdir.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-dracut.sh-improve-udevdir.patch
new file mode 100644
index 0000000..06e0a09
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-dracut.sh-improve-udevdir.patch
@@ -0,0 +1,39 @@
+From 974f728410052bc8fa18d93dc0c1a991bcdb96e6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 3 Apr 2019 15:24:47 +0800
+Subject: [PATCH] dracut.sh: improve udevdir
+
+In commit [9d1b81c dracut.sh: improve udevdir and systemdutildir
+fallback logic], it checked a common binary `collect' to localte
+udevdir.
+
+But upstream systemd drop binary `collect'.
+[https://github.com/systemd/systemd/commit/a168792c2d95695fd30c0371d4b3890a9df1eafb]
+
+So check binary `ata_id' to instead.
+
+Upstream-Status: Submitted [https://github.com/dracutdevs/dracut/pull/558]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ dracut.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/dracut.sh b/dracut.sh
+index 3dc2adc..cc8b01a 100755
+--- a/dracut.sh
++++ b/dracut.sh
+@@ -1311,8 +1311,8 @@ done
+ [[ -d $udevdir ]] \
+     || udevdir="$(pkg-config udev --variable=udevdir 2>/dev/null)"
+ if ! [[ -d "$udevdir" ]]; then
+-    [[ -e /lib/udev/collect ]] && udevdir=/lib/udev
+-    [[ -e /usr/lib/udev/collect ]] && udevdir=/usr/lib/udev
++    [[ -e /lib/udev/ata_id ]] && udevdir=/lib/udev
++    [[ -e /usr/lib/udev/ata_id ]] && udevdir=/usr/lib/udev
+ fi
+ 
+ [[ -d $systemdutildir ]] \
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index dd2e8bb..344dfec 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -12,6 +12,7 @@ PV = "049"
 SRCREV = "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
+           file://0001-dracut.sh-improve-udevdir.patch \
            "
 
 DEPENDS += "kmod"
-- 
2.7.4


