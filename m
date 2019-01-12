Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7177C138
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:39 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q1so8566097pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0V5+6aiLDlh9FAH3RsBi6uLJogL0FnU0aMs2A2vRBu8=;
	b=eyi6QjMaXQcHAtfAHgr6/aKMpSS0S7qh8Ay/wUAdyVv485E/A+0twgVZ5ub78pqarY
	6MaMR29AmeuGZcYDFreIvhtRn8SXK89qnkZWXJyWzC+5lMlOHzWIUOgDN/hK/syqpIB4
	A/Mf1Qb14f0Zh54kBuogFArDp9PKlLx+I++9g2T0ZmKGCsQCWBVKpjSAyndW8RkCqZGw
	XU+6GkH6I/FIOSS54HKZheWEv05g5GGbQF469X1m5B0kafzSojrkF2fMeZjM3X4Qta+A
	WkK0n+sRlz11olgv2PbLinffH84NfqVbZYKQB6+KmViz8tgZyiliMkZCRetpJ/4XUEca
	0dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0V5+6aiLDlh9FAH3RsBi6uLJogL0FnU0aMs2A2vRBu8=;
	b=aXannvlA72+ukq7Zi3G4W38yfMpeLx/SKRBYXMS88UD2lXSN5E0c7rsTVjrSa253Ne
	yyB11GGcugxlwYEdlmLeynrcAnb3Y5OyzijCsAKqiq5pqvhPdWbW8ZeW6LUCaORgpQiw
	BuZ4hAhCAl4SyMITAmxR9yC/wn3Cve7KmuzRbpjDzZ+oUzESGDETwaUC3ZJ3BJACK8Xg
	SY/Tslj5+85a2b7py0r+D7qefAECgBRS8Z/TzGDFtJ2NcQzLe21oTcHVWjaQkVE+e4Wy
	ayOxmmyaqxcwT3FpFDSIO4Asw87i8/xSRbKJiv9c6gIeoYdQuJMVT7ZJpJQxT+o9jpSR
	yijg==
X-Gm-Message-State: AJcUukcZNk1nUizJ/Zk7CzL5qdu24aDLotnGtAFDvwxGvArft/P9np47
	A+fJPtwuFKxJSb5Fd8JqbVPS7wTg
X-Google-Smtp-Source: ALg8bN5WStNwcCVMMiEjFVn0B/NN+3HMGYk2+819oyZA1IyOGoMuKQh6oqvramnV3p5ytaEuLwhGTg==
X-Received: by 2002:a62:3603:: with SMTP id d3mr20480453pfa.146.1547328700591; 
	Sat, 12 Jan 2019 13:31:40 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:31 -0800
Message-Id: <20190112213132.2501-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 8/9] meta-initramfs: add pkg group and image
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../images/meta-initramfs-image.bb            |  8 +++++
 .../packagegroup-meta-initramfs.bb            | 36 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-initramfs/recipes-core/images/meta-initramfs-image.bb
 create mode 100644 meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb

diff --git a/meta-initramfs/recipes-core/images/meta-initramfs-image.bb b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
new file mode 100644
index 0000000000..9d70d6d02d
--- /dev/null
+++ b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
@@ -0,0 +1,8 @@
+SUMMARY = "meta-initramfs build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot \
+                 packagegroup-meta-initramfs"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
new file mode 100644
index 0000000000..bfede5a749
--- /dev/null
+++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Meta-initramfs packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-initramfs \
+    packagegroup-meta-initramfs-devtools \
+    packagegroup-meta-initramfs-kernel \
+'
+
+RDEPENDS_packagegroup-meta-initramfs = "\
+    packagegroup-meta-initramfs-devtools \
+    packagegroup-meta-initramfs-kernel \
+"
+
+RDEPENDS_packagegroup-meta-initramfs-devtools = "\
+    libklibc  dracut \
+    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
+    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
+    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
+    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
+    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
+    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
+    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
+    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
+    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
+    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
+    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-initramfs-kernel = "\
+    kexec-klibc vmcore-dmesg-klibc \
+    "
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1


