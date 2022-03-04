Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B85C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:35 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.5142.1646383834428520198
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W1180DTB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 kx1-20020a17090b228100b001bf2dd26729so345604pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QMxfFrW5Y3cuiBURvb6U5vWOMztCDEjbW6TU/nDOUeg=;
        b=W1180DTBBC49y14je+aFlFyoOsv+P46aq4VfyO08bWjedEZ0sVeknH+axF/CARmcVj
         bhnTpcEeA932+pLKycVB4qA95Z4K/6Bc70eF3K8A1Fw/nvCBh2DDv5jyN5NifD9t+JGE
         rUzOpTnCtNHgtTZzaUcO4h2pZqqcHaOTHjbVv+VVlcgg53cEmOyiizOuQTC1iqM2/tWr
         kzqEKAohyL7ocCUjMXfIUUVwJeuuGsppJgjf7Wj1wKWLOQ4YpRIcptxTTjJNiP7H3wlX
         GHX+dJLYabgc1XXrJn/OB0BqxXCGsDz+r5qqyI0AaXauRoveZOh83eqcbePaxhkgcD5F
         42aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMxfFrW5Y3cuiBURvb6U5vWOMztCDEjbW6TU/nDOUeg=;
        b=sQ9BPbOk+ppSMwohmX5+Te+79kXm7Y9GBEnHPOKTQm8IChZCD7zb9U9sz61X40LAi9
         DeYtzMIDX/3gtJJY0pkg4BMUVdURqMtJSWduyB45/wP9E6rXsVTk+iqxxoefgoaub7bT
         e+oA3i8WtZsVg4DBdKClMTfJ6v58sB+6i0TJ9PVUxixB3jCbZrQvC7gmAqLCxr495gfv
         inJ4/AJOBGM4TV1xZk87NIdWuLa0eVVh8Lyq4vxncrW6jIr/NOt8CVwzF+MMlaTFxmfm
         Tzmxm1wRR4DHK9cmcp9geFW+6Ii+sGpcv3hlZM8HIe4fDKW6FsyW9+QsQ5Ih0s3g+DRX
         RnAQ==
X-Gm-Message-State: AOAM533qbY22s9aErPckNzpzqU6WY3PqxWGxAcaLK9/gzYRhnJDzHTWn
	GLYbuXQrsQSnCd72yIluuZ4SL3hMyms5Xg==
X-Google-Smtp-Source: 
 ABdhPJwLBgaqvehlybP7+ma2I0z806VBHaKKmWb1WLk+YL4OWjDG07Yz791PDkGi1hbtzIiQ7VTaZQ==
X-Received: by 2002:a17:902:8a8a:b0:14d:bd69:e797 with SMTP id
 p10-20020a1709028a8a00b0014dbd69e797mr39719259plo.49.1646383823144;
        Fri, 04 Mar 2022 00:50:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 02/10] recipes: Update LICENSE variable to
 use SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:10 -0800
Message-Id: <20220304085018.1255075-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95778

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb        | 2 +-
 .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb         | 2 +-
 meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb     | 2 +-
 .../recipes-filesystems/logfsprogs/logfsprogs_git.bb          | 2 +-
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb          | 2 +-
 meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb       | 2 +-
 .../recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb    | 2 +-
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 2 +-
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb        | 2 +-
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb            | 2 +-
 meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb         | 2 +-
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb           | 2 +-
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb     | 2 +-
 .../recipes-utils/exfat-utils/exfat-utils_1.3.0.bb            | 2 +-
 .../recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb             | 2 +-
 meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb   | 2 +-
 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb         | 2 +-
 meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb     | 2 +-
 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb      | 2 +-
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb    | 4 ++--
 meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb       | 2 +-
 21 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
index 2586b79470..ac18fe90fe 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
@@ -5,7 +5,7 @@ is provided under the name mount.exfat-fuse. \
 "
 HOMEPAGE = "https://github.com/relan/exfat"
 SECTION = "universe/otherosfs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
 
diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
index 0895ce5b35..0086551f62 100644
--- a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
+++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "This is a filesystem client based on the HTTP using FUSE"
 HOMEPAGE = "http://httpfs.sourceforge.net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=83f224c5182f148ec92e0b9f84b3c6c7"
 
 inherit pkgconfig
diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
index 8a317cddbe..c9702eb93e 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A fuse filesystem to access the contents of an iPhone or iPod Touch"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index e4a0f95692..7d0a83609e 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -7,7 +7,7 @@ LogFS is included in the mainline Linux kernel and was introduced in \
 version 2.6.34, released on May 16, 2010."
 HOMEPAGE = "https://github.com/prasad-joshi/logfsprogs"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://fsck.c;md5=3859dc73da97909ff1d0125e88a27e02"
 DEPENDS = "zlib"
 
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
index 1ebbb410ee..aa1b4c2e95 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS drive
 HOMEPAGE = "http://www.ntfs-3g.org/"
 DEPENDS = "fuse libgcrypt"
 PROVIDES = "ntfsprogs ntfs-3g"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
index c4bb94e5dc..b641e4c24e 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "OWFS is an easy way to use the powerful 1-wire system of Dallas/M
 HOMEPAGE = "http://www.owfs.org/"
 SECTION = "console/network"
 
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628b867016631792781a8735a04760e5 \
                     file://COPYING.LIB;md5=9021b7435efdd9fb22beef8291134099"
 
diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
index 2335771319..b8399265cd 100644
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "SIMPLE-MTPFS is a FUSE based filsystem for MTP devices connected via USB"
 HOMEPAGE = "https://github.com/phatina/simple-mtpfs"
 BUGTRACKER = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 DEPENDS = "fuse libmtp autoconf-archive"
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index e84bdc98e6..ddc4962fb2 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "SMBNetFS is a Linux/FreeBSD filesystem that allow you to use \
                neighborhood in Microsoft Windows. Please donate me to help \
                in SMBNetFS development."
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
 
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
index 8eeca84c43..b839c26e9f 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "This is a filesystem client based on the SSH File Transfer Protocol u
 AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
 HOMEPAGE = "https://github.com/libfuse/sshfs"
 SECTION = "console/network"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 0e61c9c1f3..6bf321e237 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Tools for managing 'yaffs2' file systems."
 SECTION = "base"
 HOMEPAGE = "http://www.yaffs.net"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=11;endline=13;md5=5f5464f9b3e981ca574e65b00e438561 \
                     file://utils/mkyaffsimage.c;beginline=10;endline=12;md5=5f5464f9b3e981ca574e65b00e438561 \
                     "
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
index 6af9fc9c09..e0cf2092a6 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
               "
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE;md5=a55c12a2d7d742ecb41ca9ae0a6ddc66"
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index d7a692352b..cee4879eee 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
               "
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index d06aed75e7..f565be3f7e 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for managing AUFS mounts"
 SECTION = "base"
 HOMEPAGE = "http://aufs.sourceforge.net/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 DEPENDS = "coreutils-native aufs-util-native"
diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
index 7f804a708f..abb8fece3a 100644
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
+++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
@@ -9,7 +9,7 @@ contains \
 "
 HOMEPAGE = "https://github.com/relan/exfat"
 SECTION = "universe/otherosfs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
index 14af721720..fb71b18b60 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for Flash-Friendly File System (F2FS)"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 
 # to provide libuuid
diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 2517e9db8e..1ca8bb3fe9 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Resize FAT partitions using libparted"
 SECTION = "console/tools"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branch=master \
diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
index 3591a4f6d6..20d6036686 100644
--- a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 \
 "
 RDEPENDS:${PN} = "udev bash"
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit autotools pkgconfig systemd
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
index 11cbb2d409..f6aa872fde 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tool to access UFS (Universal Flash Storage) devices"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
index 3b80fb5b0c..fdaebbe02d 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "The xfsdump package contains xfsdump, xfsrestore and a \
                specified disk, tape or other storage medium."
 HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
 DEPENDS = "xfsprogs attr"
 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
index df5f764e16..fae7a93a1f 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "XFS Filesystem Utilities"
 HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
-LICENSE = "GPLv2 & LGPLv2.1"
-LICENSE:libhandle = "LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE:libhandle = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 DEPENDS = "util-linux util-linux-native"
diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
index cf0092291a..a83950db82 100644
--- a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "xorriso copies file objects from POSIX compliant filesystems \
 into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
 manipulation of such filesystems"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
-- 
2.35.1


