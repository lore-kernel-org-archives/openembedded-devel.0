Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E77E2776AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:30:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2D3UgcL021081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:30:42 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 20:30:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Mar 2017 11:29:17 +0800
Message-ID: <20170313032921.8669-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170313032921.8669-1-kai.kang@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] fuse: update HOMEPAGE and SRC_URI
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
X-List-Received-Date: Mon, 13 Mar 2017 03:30:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The homepage of fuse is redirected to github. So update HOMEPAGE and
SRC_URI.

Correct license LGPLv2 with LGPLv2.1 at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
index 153fcb4..b34efa1 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
                also aims to provide a secure method for non privileged users to \
                create and mount their own filesystem implementations. \
               "
-HOMEPAGE = "http://fuse.sf.net"
+HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
+SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4/${BP}.tar.gz \
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
-- 
2.10.1


