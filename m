Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 792497CE4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 01:38:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBQ1c3ir009883
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 17:38:03 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Dec 2019 17:38:01 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Dec 2019 09:37:58 +0800
Message-ID: <20191226013758.20643-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bdwgc: make libatomic-ops as dependency
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
X-List-Received-Date: Thu, 26 Dec 2019 01:38:02 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libatomic_ops is required and can't be optional. Move it from
PACKAGECONFIG to DEPENDS. Adjust the ordering of the recipe as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
index 905f95396..f4ea17378 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
@@ -21,11 +21,10 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=81b447d779e278628c843aef92f088fa"
 
-SRCREV = "d3dede3ce4462cd82a15f161af797ca51654546a"
-SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_0 \
-          "
+DEPENDS = "libatomic-ops"
 
-FILES_${PN}-doc = "${datadir}"
+SRCREV = "d3dede3ce4462cd82a15f161af797ca51654546a"
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_0"
 
 S = "${WORKDIR}/git"
 
@@ -33,12 +32,10 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit autotools pkgconfig
 
-# by default use external libatomic-ops
-PACKAGECONFIG ??= "libatomic-ops"
-PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomic-ops"
-
 EXTRA_OECONF += "--enable-cpluscplus"
 
 CFLAGS_append_libc-musl = " -D_GNU_SOURCE -DNO_GETCONTEXT -DSEARCH_FOR_DATA_START -DUSE_MMAP -DHAVE_DL_ITERATE_PHDR"
 
+FILES_${PN}-doc = "${datadir}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


