Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4BF7D5A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 05:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x385hmlo020350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Apr 2019 22:43:49 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 7 Apr 2019 22:43:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Apr 2019 13:43:46 +0800
Message-ID: <1554702226-93029-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gd: fix compile error caused by -Werror=maybe-uninitialized
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
X-List-Received-Date: Mon, 08 Apr 2019 05:43:48 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

When enable DEBUG_BUILD, gd compile failed with error:

| ../../git/src/gd_tiff.c:961:64: error: 'image_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|           (image_type == GD_PALETTE || image_type == GD_INDEXED || image_type == GD_GRAY)) {
|           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~

actually, this warning is misinformation, we can see the logic from:
https://github.com/libgd/libgd/blob/master/src/gd_tiff.c
image_type will be assigned no matter force_rgba is TRUE/FALSE.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/gd/gd_2.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index 548d2c5..426af25 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -35,6 +35,8 @@ EXTRA_OECONF += " --disable-rpath \
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
 
+DEBUG_OPTIMIZATION_append = " -Wno-error=maybe-uninitialized"
+
 do_install_append() {
     # cleanup buildpaths from gdlib.pc
     sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gdlib.pc
-- 
2.7.4


