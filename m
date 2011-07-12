Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QggU8-0007cO-CP
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 19:11:00 +0200
Received: by iym10 with SMTP id 10so4960195iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2011 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iOMOdVEJsz3rkJoxZ9Gxdg6ITXdm+NE+hj4igmHBQkQ=;
	b=MFbonVJoxjgAD8f4mGBi1vKBBxYj68MxJszcucjDagMOX0mKI1CC6EXcejs5YadFom
	3E44lM6uc2LMYcy4GlrcdH31PO9xaAaMA3X4W0/NDsN3O2sq4j7cX4yzzgale73l46l0
	cbgqIX3xGfLsmOB35pWXILnj9VkpwyIpYGDwE=
Received: by 10.42.7.73 with SMTP id d9mr167604icd.55.1310490422237;
	Tue, 12 Jul 2011 10:07:02 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j7sm858185icq.14.2011.07.12.10.07.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 10:07:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2011 10:07:57 -0700
Message-Id: <1310490477-11752-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] icon-naming-utils-native: Fix long path to perl in icon-name-mapping
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2011 17:11:00 -0000

From: Tom Rini <tom_rini@mentor.com>

This is imported from oe.dev

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index c10b8bf..ddd1e20 100644
--- a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -3,6 +3,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libxml-simple-perl-native"
 
+PR = "r1"
+
 SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
 SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
 SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
@@ -11,6 +13,11 @@ S = "${WORKDIR}/icon-naming-utils-${PV}"
 
 inherit autotools
 
+do_configure_append() {
+        # replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
+        sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/icon-name-mapping.pl.in
+}
+
 FILES_${PN} += "${datadir}/dtds"
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



