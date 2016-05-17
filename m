Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 959746FF60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 18:27:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4HIRULA020871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 May 2016 11:27:30 -0700 (PDT)
Received: from co-op.corp.ad.wrs.com (128.224.56.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 17 May 2016 11:27:29 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 May 2016 14:27:22 -0400
Message-ID: <1463509642-14983-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netcf: unconditionally remove gnulib dir to support reconfigure
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
X-List-Received-Date: Tue, 17 May 2016 18:27:31 -0000
Content-Type: text/plain

The rmdir in configure prepend seemed like a nice sanity check to
ensure the upstream source didn't change their handling of the
gnulib submodule, but it will be a problem when changed sigs (in
gnulib for example) trigger a reconfigure in an existing build.
In such an instance, the .gnulib dir will have the old copy from
the sysroot, and not be empty and the rmdir will fail.

Given that we don't know what changed in the context of the prepend,
we just assume it could have been the gnulib sysroot content, and
hence blow away the old dir and re-copy in the possibly updated
gnulib sysroot content.

This works for both clean builds, and rebuilds that have triggered
a reconfigure of an existing netcf build.

Fixes: 093942197237 ("netcf: fix mishandling of gnulib submodule
causing build fail")
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

Testing: cleansstate of gnulib-native ; rebuild netcf
         cleansstate of netcf ; build netcf

 meta-networking/recipes-support/netcf/netcf_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 8d6d32a60895..ed713ace2887 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -28,9 +28,10 @@ do_configure_prepend() {
     cd ${S}
 
     # avoid bootstrap cloning gnulib on every configure
-    # the rmdir acts as a sentinel to let us know if the pkg ever changes
-    # the path for GNUlib or populates the dir making it non-empty.
-    rmdir ${S}/.gnulib
+    # the dir starts out empty from the pkg, but unconditionally blow it
+    # away so if we reconfigure due to gnulib sysroot sig changes, we will
+    # get the newer gnulib content into the build here.
+    rm -rf ${S}/.gnulib
     cp -rf ${STAGING_DATADIR}/gnulib ${S}/.gnulib
 
     # --force to avoid errors on reconfigure e.g if recipes changed we depend on
-- 
2.7.4


