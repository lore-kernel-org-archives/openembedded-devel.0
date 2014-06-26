Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Jun 2014 15:01:34 UTC
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id BC1386028A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 15:01:34 +0000 (UTC)
Received: from hulk.bmw-carit.intra (hulk.bmw-carit.intra [192.168.101.92])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 3A72040037;
	Thu, 26 Jun 2014 15:10:45 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jun 2014 16:56:22 +0200
Message-Id: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] libeigen: remove obsolete setting for default out-of-tree build
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
X-List-Received-Date: Thu, 26 Jun 2014 15:01:41 -0000

Since commit 783fb88f@openembedded-core, out-of-tree builds of
cmake-based recipes are the default, and the variables
OECMAKE_BUILDPATH and OECMAKE_SOURCEPATH were deprecated.

With the commit 2c23d7ab@openembedded-core, the variable
OECMAKE_SOURCEPATH was put back into action, but this causes the
libeigen recipe to fail as OECMAKE_SOURCEPATH is set in the
recipe, but OECMAKE_BUILDPATH is set to the bbclass default.

This commit simply removes both variables from the libeigen recipe
and hence sets the recipe to do a default out-of-tree build.
This resolves the build failure of libeigen with
2c23d7ab@openembedded-core, and furthermore, the adjusted recipe
still works with the cmake.bbclass of 783fb88f@openembedded-core.

The build failure was discovered during the regression testing of
the meta-ros layer. The exact build error message and its
investigation is recorded in issue #276 of the meta-ros issue
tracker at https://github.com/bmwcarit/meta-ros/issues/276.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
index 4183f05..de5186f 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
@@ -13,9 +13,6 @@ S = "${WORKDIR}/eigen-eigen-ffa86ffb5570"
 
 inherit cmake
 
-OECMAKE_SOURCEPATH = ".."
-OECMAKE_BUILDPATH = "build"
-
 EXTRA_OECMAKE += "-Dpkg_config_libdir=${libdir}"
 
 FILES_${PN} = "${includedir} ${libdir}"
-- 
1.9.3


