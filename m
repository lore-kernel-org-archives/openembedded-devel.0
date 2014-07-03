Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1A56AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 02:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s632Q1ie025645
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 19:26:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 19:26:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:25:53 -0700
Message-ID: <1404354360-978-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
References: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-filesystems] [PATCH 1/8] meta-filesystems: use BPN in SRC_URI
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
X-List-Received-Date: Thu, 03 Jul 2014 02:26:00 -0000
Content-Type: text/plain

Fixed SRC_URI:
* ${PN} -> ${BPN}, use ${BP} if it was ${PN}-${PV}
* ${P} -> ${BP}

Otherwise we would meet do_fetch errors when we do the multilib, native
or nativesdk build.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../sshfs-fuse/sshfs-fuse_2.5.bb                   |    2 +-
 .../unionfs-fuse/unionfs-fuse_0.26.bb              |    2 +-
 .../recipes-support/physfs/physfs_2.0.3.bb         |    2 +-
 .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
index 722d0ed..5daeb40 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 fuse"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/${P}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/${BP}.tar.gz"
 S = "${WORKDIR}/${P}"
 
 inherit autotools
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
index 1d50364..38ded9f 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 DEPENDS = "fuse"
 LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32"
 
-SRC_URI = "http://podgorny.cz/unionfs-fuse/releases/${PN}-${PV}.tar.xz"
+SRC_URI = "http://podgorny.cz/unionfs-fuse/releases/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "689c636484756f6f7a728ef354cbeac2"
 SRC_URI[sha256sum] = "8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662"
diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
index 9ad7fab..5618f28 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
@@ -6,6 +6,6 @@ DEPENDS = "readline zlib"
 
 inherit cmake
 
-SRC_URI = "http://icculus.org/${PN}/downloads/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c2c727a8a8deb623b521b52d0080f613"
 SRC_URI[sha256sum] = "ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69"
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
index 4c3f8fa..fcf8f12 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
@@ -6,7 +6,7 @@ LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
 
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
     file://remove-install-as-user.patch \
     file://drop-configure-check-for-aio.patch \
 "
-- 
1.7.9.5


